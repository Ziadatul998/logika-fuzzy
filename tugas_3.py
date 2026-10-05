# ==========================================================
# 2. FUNGSI KEANGGOTAAN
# ==========================================================
def fungsi_remaja_naik(x):
    """
    Fungsi keanggotaan remaja bagian naik.
    Domain: 10 <= x <= 15
    Persamaan: μ(x) = (x - 10) / 5
    """
    return (x - 10) / 5

def fungsi_remaja_turun(x):
    """
    Fungsi keanggotaan remaja bagian turun.
    Domain: 15 <= x <= 20
    Persamaan: μ(x) = (20 - x) / 5
    """
    return (20 - x) / 5

# ==========================================================
# 3. DAFTAR FUNGSI (DICTIONARY)
# ==========================================================
fungsi = {
    "fungsi_remaja_naik": fungsi_remaja_naik,
    "fungsi_remaja_turun": fungsi_remaja_turun
}

# ==========================================================
# 4. FUNGSI FUZZIFIKASI
# ==========================================================
def fuzzifikasi_usia(x):
    cursor = db.cursor()

    query = """
        SELECT usia_min, usia_max, nilai_fuzzy 
        FROM usia_remaja 
        WHERE %s >= usia_min 
        AND %s <= usia_max
    """

    cursor.execute(query, (x, x))
    data = cursor.fetchone()
    cursor.close()

    if data is None:
        return None

    usia_min, usia_max, nama_fungsi = data

    # Jika database memberikan nilai 0
    if nama_fungsi == "0":
        return 0

    # Jika database memberikan nama fungsi yang valid
    if nama_fungsi in fungsi:
        fungsi_y = fungsi[nama_fungsi]
        nilai = fungsi_y(x)
        return nilai

    raise ValueError(f"Fungsi '{nama_fungsi}' belum dibuat di Python.")

# ==========================================================
# 5. EXECUTION MAIN PROGRAM
# ==========================================================
try:
    # Input Usia
    usia = float(input("Masukkan usia: "))

    # Proses Fuzzifikasi
    nilai_keanggotaan = fuzzifikasi_usia(usia)

    # Menampilkan Hasil
    print()
    print("================================")
    print("HASIL FUZZIFIKASI")
    print("================================")
    print(f"Usia               : {usia}")
    print(f"Keanggotaan remaja : {nilai_keanggotaan}")
    print("================================")

finally:
    # Menutup Koneksi Database
    db.close()
    print("Koneksi database ditutup.")