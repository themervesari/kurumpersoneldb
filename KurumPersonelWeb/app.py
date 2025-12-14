from flask import Flask, render_template, request, redirect, url_for, flash
import mysql.connector
from datetime import date

app = Flask(__name__)
app.secret_key = 'gizli_anahtar_proje_icin'

# Veritabanı Bağlantı Ayarları
db_config = {
    'user': 'root',
    'password': 'kurumpersonel',
    'host': 'localhost',
    'database': 'kurumpersoneldb',
    'auth_plugin': 'mysql_native_password'
}

def get_db_connection():
    return mysql.connector.connect(**db_config)

# 1. ANASAYFA
@app.route('/')
def index():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT COUNT(*) AS sayi FROM PersonelBilgileri WHERE PersonelDurumu='Aktif'")
    aktif_personel = cursor.fetchone()['sayi']

    cursor.execute("SELECT COUNT(*) AS sayi FROM BirimBilgileri")
    birim_sayisi = cursor.fetchone()['sayi']

    cursor.execute("SELECT * FROM SistemLoglari ORDER BY LogID DESC LIMIT 5")
    son_loglar = cursor.fetchall()

    conn.close()
    return render_template(
        'index.html',
        p_sayi=aktif_personel,
        b_sayi=birim_sayisi,
        loglar=son_loglar
    )

# 2. PERSONEL LİSTELEME
@app.route('/personeller')
def personeller():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    sql = """
        SELECT p.PersonelID, p.TCKimlikNo, p.Ad, p.Soyad, p.Unvan,
               b.BirimAdi, g.GorevAdi
        FROM PersonelBilgileri p
        LEFT JOIN PersonelGorevHareketleri h
            ON p.PersonelID = h.PersonelID AND h.AktifGorevMi = 1
        LEFT JOIN BirimBilgileri b ON h.BirimID = b.BirimID
        LEFT JOIN GorevTanimlari g ON h.GorevTanimID = g.GorevTanimID
        ORDER BY p.PersonelID DESC
    """
    cursor.execute(sql)
    liste = cursor.fetchall()
    conn.close()

    return render_template('personeller.html', personeller=liste)

# 3. PERSONEL EKLEME
@app.route('/ekle', methods=['GET', 'POST'])
def personel_ekle():
    bugun = date.today()

    if request.method == 'POST':
        conn = get_db_connection()
        cursor = conn.cursor()

        def temiz_veri(key):
            val = request.form.get(key)
            return val.strip() if val and val.strip() != '' else None

        try:
            params = [
                temiz_veri('tc'),
                temiz_veri('ad'),
                temiz_veri('soyad'),
                temiz_veri('sicil_no'),
                temiz_veri('dogum_tarihi'),
                temiz_veri('unvan'),
                temiz_veri('brans'),
                temiz_veri('adres'),
                temiz_veri('telefon'),
                temiz_veri('eposta'),
                temiz_veri('istihdam'),
                temiz_veri('birim_id'),
                temiz_veri('gorev_id'),
                temiz_veri('ise_giris_tarihi'),
                None  # OUT PARAMETRE
            ]

            result = cursor.callproc('sp_PersonelIseAlim', params)
            conn.commit()

            db_mesaji = result[14]

            if db_mesaji and db_mesaji.startswith("BAŞARILI"):
                flash(db_mesaji, 'success')
                return redirect(url_for('personeller'))
            else:
                flash(db_mesaji, 'danger')

        except mysql.connector.Error as err:
            # Sadece logla, kullanıcıya teknik hata gösterme
            print("SQL Hatası:", err.errno, err.msg)
            flash("Beklenmeyen bir veritabanı hatası oluştu.", 'danger')

        except Exception as e:
            print("Python Hatası:", e)
            flash("Beklenmeyen bir sistem hatası oluştu.", 'danger')

        finally:
            cursor.close()
            conn.close()

    # GET
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    try:
        cursor.execute("SELECT * FROM BirimBilgileri")
        birimler = cursor.fetchall()

        cursor.execute("SELECT * FROM GorevTanimlari")
        gorevler = cursor.fetchall()
    except:
        birimler = []
        gorevler = []
    finally:
        conn.close()

    return render_template(
        'personel_ekle.html',
        birimler=birimler,
        gorevler=gorevler,
        bugun=bugun
    )

# 4. PERSONEL SİLME
@app.route('/sil/<int:id>')
def personel_sil(id):
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.callproc('sp_PersonelSilGuvenli', [id, None])
        conn.commit()
        flash("Personel ve geçmişi güvenle silindi.", 'warning')
    except Exception as e:
        print("Silme Hatası:", e)
        flash("Silme işlemi sırasında hata oluştu.", 'danger')
    finally:
        conn.close()

    return redirect(url_for('personeller'))

if __name__ == '__main__':
    app.run(debug=True)
