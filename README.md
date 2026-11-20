# Menyelamatkan Putri Bulan

## Setup dan instalasi

Panduan ini ditujukan untuk developer yang ingin menyiapkan dan menjalankan proyek secara lokal.

### Prasyarat

- **Godot Engine 4.7** atau versi Godot 4 yang kompatibel.
- **Git** untuk meng-clone dan mengelola repository.
- Sistem operasi Windows, Linux, atau macOS yang mendukung Godot dan Jolt Physics.

Proyek menggunakan **GDScript**, **Jolt Physics**, renderer **Mobile**, dan Direct3D 12 sebagai driver Windows yang dikonfigurasi pada `project.godot`.

### Clone repository

```bash
git clone https://github.com/Deikazen/menyelamatkan-putri-bulan.git
cd menyelamatkan-putri-bulan
```

Jika repository sudah tersedia secara lokal, cukup buka folder `menyelamatkan-putri-bulan` sebagai project root.

### Buka proyek di Godot

1. Jalankan Godot Engine.
2. Pilih **Import** atau **Add** pada Project Manager.
3. Cari dan pilih file `project.godot` di root repository.
4. Pilih **Import & Edit**.
5. Godot akan membuat folder cache lokal `.godot/`. Folder ini sudah diabaikan Git dan tidak perlu dikomit.

### Jalankan proyek

Tekan `F6` untuk menjalankan scene aktif, atau `F5` untuk menjalankan proyek utama. Proyek dikonfigurasi agar membuka scene berikut ini:

```text
res://scenes/TestLevel.tscn
```

Jika Godot menampilkan pesan perubahan versi Engine saat pertama dibuka, gunakan versi Godot 4.7 atau import kembali dengan versi Godot 4 yang kompatibel.

Prototipe game 2D berbasis Godot dengan misi menyelamatkan Putri Bulan. Pemain mengendalikan Ali, menghindari serangan yang bergerak dari kanan ke kiri, menggunakan tameng, lalu menyentuh Putri Bulan untuk menyelesaikan level.

## Status proyek

**Tahap saat ini: prototipe mekanik / test level.**

Fitur yang sudah tersedia:

- Level utama `TestLevel`.
- Pergerakan Ali ke kiri dan kanan.
- Lompatan.
- Tameng dengan daya tahan yang berkurang saat digunakan dan pulih saat dilepas.
- HP Ali sebanyak 3.
- Serangan yang bergerak dari kanan ke kiri.
- Serangan dapat dihancurkan oleh tameng atau mengurangi HP Ali.
- Kondisi menang saat Ali menyentuh Putri Bulan.
- Kondisi kalah saat HP Ali habis.
- Panel hasil dan tombol **Main Lagi** untuk memuat ulang level.

Bagian yang masih berupa placeholder atau belum selesai:

- Visual karakter, Putri Bulan, serangan, dan lingkungan masih menggunakan `ColorRect` serta ikon bawaan.
- Belum ada sprite, animasi, audio, musik, efek partikel, menu utama, atau sistem level lanjutan.
- Input `skill_1` sampai `skill_5` sudah didefinisikan di konfigurasi, tetapi belum memiliki tombol dan belum digunakan oleh gameplay.
- Belum ada sistem skor, progres, penyimpanan, atau konfigurasi tingkat kesulitan.

## Kontrol

| Aksi | Tombol |
|---|---|
| Bergerak kiri | `A` atau Panah Kiri |
| Bergerak kanan | `D` atau Panah Kanan |
| Lompat | `W`, Spasi, atau Panah Atas |
| Mengaktifkan tameng | Tahan `S`, Panah Bawah, atau `Shift` |

Tameng menghalangi serangan selama daya tahannya masih tersedia. Saat tidak digunakan, daya tahan tameng akan pulih secara bertahap.

## Struktur proyek

```text
.
├── project.godot
├── icon.svg
├── scenes/
│   ├── TestLevel.tscn          # Level utama dan HUD
│   ├── Serangan.tscn           # Scene serangan
│   ├── test_level.gd           # Alur menang, kalah, dan restart
│   └── entities/
│       ├── PlayerAli.tscn      # Scene karakter pemain
│       └── PutriBulan.tscn     # Scene target penyelamatan
└── scripts/
    ├── PlayerAli.gd            # Gerak, lompatan, tameng, dan HP
    ├── serangan.gd             # Gerak dan deteksi tabrakan serangan
    └── putri_bulan.gd          # Deteksi pemain yang mencapai Putri Bulan
```

Folder `.godot/` adalah data cache/editor lokal dan tidak menjadi bagian dari source utama proyek.

## Alur gameplay saat ini

1. Ali dimulai di sisi kiri level.
2. Serangan muncul di sisi kanan dan bergerak ke kiri.
3. Pemain bergerak dan melompat untuk menghindari serangan.
4. Pemain dapat menahan tombol tameng untuk memblokir serangan, dengan konsekuensi daya tameng berkurang.
5. Jika Ali terkena serangan sebanyak tiga kali, permainan menampilkan kondisi kalah.
6. Jika Ali mencapai Putri Bulan, permainan menampilkan kondisi menang.
7. Tombol **Main Lagi** memuat ulang scene saat ini.

## Catatan pengembangan

Kode gameplay utama berada di folder `scripts/`, sedangkan komposisi level dan node berada di folder `scenes/`. Sinyal Godot digunakan untuk menghubungkan perubahan HP, kondisi kalah, dan kondisi berhasil diselamatkan ke HUD pada level.

Prioritas pengembangan berikutnya yang paling sesuai dengan kondisi proyek:

1. Mengganti placeholder dengan aset visual dan animasi.
2. Menambahkan input serta implementasi skill.
3. Menata ulang layout level dan menambahkan variasi serangan.
4. Menambahkan audio, efek visual, menu, dan level lanjutan.
5. Menambahkan pengujian untuk alur menang, kalah, tameng, dan restart.

## Lisensi dan aset

Belum ada informasi lisensi khusus atau katalog aset eksternal di dalam repository ini. Tambahkan informasi lisensi dan atribusi apabila aset pihak ketiga mulai digunakan.
