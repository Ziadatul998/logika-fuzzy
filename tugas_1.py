import numpy as np
import matplotlib.pyplot as plt

def mu_bayi(x):
    if x < 0 or x > 5: return 0.0
    elif 0 <= x <= 2.5: return x / 2.5
    else: return (5 - x) / 2.5

def mu_anak(x):
    if x < 6 or x > 11: return 0.0
    elif 6 <= x <= 8.5: return (x - 6) / 2.5
    else: return (11 - x) / 2.5

def mu_remaja(x):
    if x < 10 or x > 19: return 0.0
    elif 10 <= x <= 14.5: return (x - 10) / 4.5
    else: return (19 - x) / 4.5

def mu_pemuda(x):
    if x < 15 or x > 24: return 0.0
    elif 15 <= x <= 19.5: return (x - 15) / 4.5
    else: return (24 - x) / 4.5

def mu_dewasa(x):
    if x < 20 or x > 65: return 0.0
    elif 20 <= x <= 42.5: return (x - 20) / 22.5
    else: return (65 - x) / 22.5

def mu_lansia(x):
    if x < 60 or x > 80: return 0.0
    elif 60 <= x <= 70: return (x - 60) / 10.0
    else: return (80 - x) / 10.0


domain_x = np.linspace(0, 80, 1000)

plt.figure(figsize=(12, 5))
plt.plot(domain_x, [mu_bayi(x) for x in domain_x], label='Bayi (0-5 thn)')
plt.plot(domain_x, [mu_anak(x) for x in domain_x], label='Anak-anak (6-11 thn)')
plt.plot(domain_x, [mu_remaja(x) for x in domain_x], label='Remaja (10-19 thn)')
plt.plot(domain_x, [mu_pemuda(x) for x in domain_x], label='Pemuda (15-24 thn)')
plt.plot(domain_x, [mu_dewasa(x) for x in domain_x], label='Dewasa (20-65 thn)')
plt.plot(domain_x, [mu_lansia(x) for x in domain_x], label='Lansia (60-80 thn)')

plt.title('Grafik Fungsi Keanggotaan Segitiga - Variabel Usia', fontsize=12, fontweight='bold')
plt.xlabel('Usia (Tahun)')
plt.ylabel('Derajat Keanggotaan μ(x)')
plt.xlim(0, 80)
plt.ylim(-0.05, 1.1)
plt.grid(True, linestyle='--', alpha=0.6)
plt.legend()
plt.tight_layout()

plt.show()