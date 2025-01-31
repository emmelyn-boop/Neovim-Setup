# 🚀 Neovim Configuration: The Ultimate Developer Setup

Selamat datang di konfigurasi Neovim saya. Neovim ini dirancang untuk memaksimalkan efisiensi, menawarkan lingkungan pengembangan yang cepat, intuitif, dan sepenuhnya dapat disesuaikan. Setup ini disesuaikan dengan sempurna untuk membantu Anda menulis kode seperti profesional, apakah Anda bekerja pada model AI, pengembangan web, atau proyek berskala besar.

---

### 🔧 Apa yang Termasuk?

Konfigurasi ini sangat cocok untuk para pengembang yang menginginkan editor tanpa basa-basi dengan fitur-fitur unggulan. Berikut adalah gambaran singkat mengenai fitur yang ada:

---

### 🎨 Enhancements untuk Tailwind CSS & Sass

- **Auto-completion** untuk utility classes di Tailwind CSS
- **Linting** dan validasi untuk Sass/SCSS
- Pola regex khusus untuk Tailwind dalam HTML dan backticks

Dengan Tailwind CSS, membangun UI web modern menjadi sangat cepat, dan Neovim memastikan Anda selalu menggunakan utility class yang tepat.

---

### ⚡ Auto-formatting & Linting

- Auto-formatting saat menyimpan file menggunakan fitur **formatting** dari LSP
- Linting aktif untuk **CSS, SCSS, SASS, HTML, JavaScript, dan TypeScript**
- Pengaturan linting kustom untuk memperingatkan atau mengabaikan kesalahan tertentu

Ini memastikan kode Anda selalu bersih dan sesuai dengan praktik terbaik.

---

### 🛠️ Fitur Pengembangan Web Canggih

- Mendukung **CSS Grid, Flexbox**, dan **Custom Properties**
- Linting dan formatting **JavaScript/TypeScript** menggunakan integrasi **ESLint**
- Auto-suggestion untuk kelas utility **Tailwind CSS** langsung di **HTML** dan **JSX**
- Mendukung **Vue.js, React.js**, dan **Next.js** untuk pengembangan aplikasi web modern

Dengan fitur-fitur ini, Anda akan membuat aplikasi web yang dinamis, performa tinggi, dan mudah dipelihara.

---

### 🧳 SuperMaven: AI Copilot -> [SuperMaven](https://supermaven.com/)

SuperMaven adalah **asisten AI** yang dirancang untuk membantu pengembang meningkatkan produktivitas dengan **otomatisasi tugas pengembangan** dan **saran cerdas**.

Fitur utama SuperMaven meliputi:
- **Otomatisasi Tugas Pengembangan**: Saran perbaikan kode, refactoring, dan optimasi
- **Bantuan Kode Pintar**: Saran konteks berdasarkan kode yang sedang ditulis
- **Deteksi Bug dan Error Otomatis**: Mengurangi kesalahan dan bug dalam kode

---

### 🧠 Sourcery -> [Sourcery](https://sourcery.ai/)

Sourcery adalah alat **refactoring otomatis** yang meningkatkan kualitas kode Anda dengan saran dan optimasi berbasis **AI**.

Fitur utama Sourcery:
- **Refactoring Otomatis**: Menjadi lebih efisien, bersih, dan mudah dibaca
- **Optimasi Kode yang Didukung AI**: Membantu kode Anda lebih optimal dan bebas bug

---

### ⚡ Tips Cepat

- Hover di atas fungsi, metode, atau variabel dengan menekan `K` untuk melihat dokumentasi inline.
- Tekan `<leader>f` (biasanya \f) untuk **auto-format** file Anda.
- Navigasi error dengan `]d` / `[d` atau lompat ke definisi fungsi dengan `gd`.
- Tekan `<leader>ca` untuk tindakan kode seperti **refactor** atau **perbaikan**.

---

### 🧳 Integrasi Fitur Lain

- **Wakatime**: Memantau produktivitas Anda.
- **Discord Presence**: Menampilkan status di Discord.
- **Minty**: Tema dan warna yang lebih konsisten.
- **Neogit**: Manajemen **Git** langsung di Neovim.
- **Neotest**: Uji kode langsung dari Neovim.

---

### 🧳 Dukungan untuk MySQL & Database

- **Autocompletion** dan **linting** untuk skrip **SQL**.
- Pengaturan koneksi untuk **MySQL, PostgreSQL**, dan **SQLite** langsung di Neovim.

---

### 🎯 Fitur Khusus **JDTLS**

- **Konfigurasi Build Otomatis** untuk Java, Python, Ruby, TypeScript, dll.
- **Dukungan untuk Berbagai Versi JDK**: Menyesuaikan dengan proyek (Java 17, 21, 23, dll.).
- **Bantuan Tanda Tangan Fungsi** secara real-time.
- **Format Kode Otomatis** dengan profil format seperti Eclipse atau Sun.
- **Pengelolaan Maven dan Gradle** untuk download sumber dan dokumentasi Java.
- **Diagnostik dan Penyempurnaan Kode**: Peringatan kesalahan dan rekomendasi perbaikan.
- **Integrasi Debugging**: Dukungan debugging di Neovim.
- **Pengembangan AI dan Machine Learning** dengan pustaka **DeepLearning4J**, **TensorFlow**, dan **H2O.ai**.
- **Integrasi Pengembangan Web** dengan SpringBoot, Quarkus, HTML, CSS, JavaScript, dan TypeScript.

---

### 🚧 **AI DeepSeek** - Coming Soon! 🍻

Integrasi **AI DeepSeek** untuk saran cerdas dan optimasi kode di Neovim.

---

### 🧑‍💻 Pengaturan Neovim

1. **Clone Repo**.
2. Jalankan **MassonInstallAll** di Neovim.
3. Mulai **koding**!

---

### 🧳 Ekstensi dan Plugin Tambahan

- **Neogit**: Git langsung di Neovim.
- **Tree-sitter**: Highlight sintaksis lebih canggih.
- **Telescope**: Pencarian file, buffer, dll.

---

### 💡 Konfigurasi Database

Untuk mengonfigurasi koneksi database di Neovim:

```lua
connections = {
  {
    -- Driver untuk koneksi database
    driver = "mysql",  -- Ganti dengan "postgresql" atau "sqlite" jika menggunakan jenis database lain
    name = "MySQL-Connection",  -- Nama koneksi yang dapat Anda sesuaikan
    user = "",  -- Username untuk login ke database
    password = "",  -- Password untuk koneksi
    host = "localhost",  -- Host database, biasanya "localhost"
    port = 3306,  -- Port yang digunakan oleh MySQL (default: 3306)
    charset = "utf8mb4",  -- Charset untuk MySQL (utf8mb4 lebih mendukung karakter internasional)
    timeout = 30,  -- Waktu timeout untuk koneksi (dalam detik)
  },
  -- {
   driver = "postgresql",  -- Untuk PostgreSQL, ubah driver ke "postgresql"
   name = "PostgreSQL-Connection",
   user = "",  -- Username untuk login ke PostgreSQL
   password = "",  -- Password untuk koneksi PostgreSQL
   host = "localhost",
   port = 5432,
   sslmode = "require",  -- Jika PostgreSQL memerlukan SSL, atur sslmode ke "require"
   timezone = "Asia/Jakarta",  -- Set timezone jika diperlukan
  },
   {
   driver = "sqlite",  -- Untuk SQLite, ubah driver ke "sqlite"
   name = "SQLite-Connection",
   file = "/path/to/database.db",  -- Lokasi file SQLite
   timeout = 10,  -- Timeout untuk SQLite
  }
},

