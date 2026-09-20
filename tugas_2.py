import numpy as np
import matplotlib.pyplot as plt

def trapmf(x, params):
    a, b, c, d = params
    x = np.asarray(x)
    y = np.zeros_like(x, dtype=float)
    
    # Sisi Naik
    if a != b:
        idx1 = (x >= a) & (x <= b)
        y[idx1] = (x[idx1] - a) / (b - a)
    else:
        idx1 = (x <= b)
        y[idx1] = 1.0
        
    # Puncak Trapesium
    idx2 = (x > b) & (x <= c)
    y[idx2] = 1.0
    
    # Sisi Turun
    if c != d:
        idx3 = (x > c) & (x <= d)
        y[idx3] = (d - x[idx3]) / (d - c)
    else:
        idx3 = (x >= c)
        y[idx3] = 1.0
        
    return y

x = np.linspace(0, 85, 1000)

kategori_trapesium = {
    'Bayi / Balita (0-5 thn)': [0, 0, 2, 5],
    'Anak-anak (6-11 thn)': [5, 7, 10, 12],
    'Remaja (10-19 thn)': [10, 13, 16, 19],
    'Pemuda (15-24 thn)': [15, 18, 21, 24],
    'Dewasa (20-65 thn)': [20, 30, 55, 65],
    'Lansia (>=65 thn)': [65, 80, 80, 80]
}

plt.figure(figsize=(12, 5))
for nama, params in kategori_trapesium.items():
    plt.plot(x, trapmf(x, params), label=nama, linewidth=2)

plt.title('Fungsi Keanggotaan Trapesium (Trapezoidal MF) - Variabel Usia')
plt.xlabel('Usia (Tahun)')
plt.ylabel('Derajat Keanggotaan mu(x)')
plt.xlim(0, 85)
plt.ylim(-0.05, 1.1)
plt.grid(True, linestyle='--', alpha=0.6)
plt.legend()
plt.tight_layout()
plt.show()