# Aplikasi Gores8

Gores8 adalah aplikasi mobile berbasis **Flutter** yang dikembangkan untuk mendukung digitalisasi aktivitas siswa di lingkungan sekolah. Aplikasi ini berfokus pada **unggah karya siswa**, **event sekolah**, **interaksi sosial**, serta **gamifikasi** melalui leaderboard dan lencana.

Aplikasi dirancang menggunakan arsitektur **modular (GetX)** agar kode terstruktur, mudah dipelihara, dan scalable.

## Tujuan Aplikasi

* Menyediakan wadah digital untuk publikasi karya siswa
* Mendukung event dan lomba sekolah secara digital
* Mendorong interaksi positif antar siswa

## Teknologi yang Digunakan

* Flutter
* Dart
* GetX (State Management, Routing, Dependency Injection)

## Fitur Utama Aplikasi

* Autentikasi user (login, register, reset password)
* Upload dan eksplorasi karya (foto & video)
* Kategori karya (lukisan, sains, dll)
* Event sekolah dan leaderboard
* Sistem like, pengikut, dan ulasan
* Pencarian user dan karya
* Notifikasi aktivitas
* Manajemen profil pengguna

## Struktur Folder

```
lib/
│ main.dart
│ splash_screen.dart
│ login_screen.dart
│ register_screen.dart
│ home.dart
│ profile.dart
│ notification.dart
│ search_page.dart
│ leaderboard.dart
│ event.dart
│ ...
│
└── app/
    ├── data/
    ├── modules/
    │   └── home/
    │       ├── bindings/
    │       │   └── home_binding.dart
    │       ├── controllers/
    │       │   └── home_controller.dart
    │       └── views/
    │           └── home_view.dart
    └── routes/
        ├── app_pages.dart
        └── app_routes.dart
```

## Penjelasan Cara Kerja Kode

### 1. Entry Point Aplikasi

* `main.dart` merupakan titik awal aplikasi
* Menginisialisasi GetX dan routing utama
* Menentukan halaman awal (splash screen)

### 2. Routing Aplikasi

* Routing dikelola di folder `app/routes`
* `app_routes.dart` berisi konstanta nama route
* `app_pages.dart` memetakan route ke halaman (page)

Routing menggunakan GetX sehingga navigasi lebih sederhana dan terpusat.

### 3. Arsitektur Modular (GetX)

Setiap fitur utama dipisahkan ke dalam module dengan struktur:

* **Bindings**

  * Menghubungkan controller ke view
  * Mengatur dependency injection

* **Controllers**

  * Menyimpan state aplikasi
  * Mengelola logika bisnis dan data
  * Menangani event seperti fetch data, like, dan update UI

* **Views**

  * Menampilkan UI
  * Bersifat reaktif terhadap perubahan state controller

### 4. State Management

* Menggunakan GetX Controller
* Perubahan data langsung memperbarui UI tanpa setState manual
* Membuat aplikasi lebih efisien dan mudah dikembangkan

### 5. Pengelolaan Data User

* Data user dikelola melalui file seperti `users.dart` dan `anggota_data.dart`
* Digunakan untuk menampilkan profil, daftar anggota, dan interaksi sosial

### 6. Fitur Konten & Karya

* File seperti `duniawi.dart`, `fullscreenvid.dart`, dan `zoomduniawi.dart` menangani tampilan konten
* Kategori karya dipisahkan untuk memudahkan eksplorasi
* Ulasan dan like dikelola melalui widget terpisah

### 7. Event dan Leaderboard

* Event dibuat dan dikelola melalui file `event.dart` dan `buat_event.dart`
* Leaderboard menampilkan peringkat berdasarkan aktivitas dan karya
* Data statistik disajikan untuk meningkatkan motivasi siswa

### 8. Pencarian dan Notifikasi

* `search_page.dart` digunakan untuk mencari user atau karya
* `notification.dart` menampilkan notifikasi interaksi dan event

## Kelebihan Arsitektur

* Mudah dikembangkan dan dipelihara
* Menggunakan state management yang efisien


link splash screen: https://drive.google.com/file/d/1WXbd4W8ZcvbwaNSIKC-cfedqDVqyHXwU/view?usp=sharing
