-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "gopls", "zls", "rust_analyzer", "fortls", "ts_ls", "jdtls",  "ruby_lsp", "html", "pylsp", "tailwindcss", "clangd",  "ruff",  "jsonls", "yamlls", "pyright", "vimls", "cmake", "dockerls", "eslint", "lua_ls", "sqlls", "taplo", "terraformls", "elixirls", "ocamlls", "phpactor", "sourcery", "solargraph", "svelte", "vuels" , "pyright", "clojure_lsp", "groovyls", "bashls" , "dockerls", "cssls", "gradle_ls", "groovyls", "intelephense", "phpactor", "r_language_server", "solargraph",  "taplo", "tailwindcss", "terraformls", "vimls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.gradle_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = on_init,
  settings = {
    gradle = {
      jvmArguments = {
        "-Xmx1g",
        "-Xms256m",
        "-XX:+UseParallelGC",
        "-XX:GCTimeRatio=4",
        "-XX:AdaptiveSizePolicyWeight=90",
        "-Dsun.zip.disableMemoryMapping=true",
        "-Djava.ext.dirs=workspaceFolder/lib",
        "-Dfile.encoding=UTF-8",
        "-Duser.language=en",
        "-Duser.country=US",
        "-Djava.awt.headless=true",
      },
      arguments = {
        "--no-build-cache",
        "--no-configuration-cache",
        "--no-daemon",
        "--parallel",  -- Mengaktifkan build paralel untuk proyek besar
      },
      isAndroidSupported = true,
      isWorkspaceCacheEnabled = true,
      isBuildCacheEnabled = true,
      isIncrementalAnalysisSupported = true,
      isJavaSupported = true,
      isKotlinSupported = true,
      isGroovySupported = true,
      isScalaSupported = true,
      isGolangSupported = true,
      isNimSupported = true,
      isRubySupported = true,
      isSwiftSupported = true,
      isPhpSupported = true,
      isObjectiveCSupported = true,
      projects = {
        paths = {
          "build.gradle",
          "settings.gradle",
        },
      },
      repositories = {
        mavenCentral = true,
        jcenter = true,
        customRepos = {
          "https://repo.maven.apache.org/maven2",
          "https://jcenter.bintray.com",
          "https://jitpack.io",
          "https://repo1.maven.org/maven2",
          "https://oss.sonatype.org/content/repositories/snapshots",
          "https://oss.sonatype.org/content/repositories/releases",
          "https://maven.pkg.github.com/navikt/fp-felles",
          "https://maven.pkg.github.com/navikt/fp-felles-test",
          "https://maven.pkg.github.com/navikt/fp-felles-schema",
          "https://maven.pkg.github.com/navikt/fp-biblioteker",
          "https://maven.pkg.github.com/navikt/fp-kontrakter",
        },
      },
      dependencies = {
        additionalDependencies = {
          "org.springframework.boot:spring-boot-starter-web:2.4.0",
          "com.fasterxml.jackson.core:jackson-databind:2.12.0",
          "org.apache.commons:commons-lang3:3.12.0",  -- Dependensi tambahan untuk utilitas umum
          "org.junit.jupiter:junit-jupiter-api:5.7.0",  -- Dependensi untuk unit testing (https://junit.org/junit5/)
          "org.mockito:mockito-core:3.7.0",  -- Dependensi untuk unit testing (https://site.mockito.org/)
          "org.mockito:mockito-junit-jupiter:3.7.0",  -- Dependensi untuk unit testing (https://site.mockito.org/)
          "org.junit.jupiter:junit-jupiter-api:5.7.0",  -- Dependensi untuk unit testing
          "org.mockito:mockito-core:3.7.0",  -- Dependensi untuk unit testing
          "org.mockito:mockito-junit-jupiter:3.7.0",  -- Dependensi untuk unit testing
          "org.mockito:mockito-inline:3.7.0",  -- Dependensi untuk unit testing
          "org.assertj:assertj-core:3.19.0",  -- Dependensi untuk unit testing
          "org.hamcrest:hamcrest:2.2",  -- Dependensi untuk unit testing
          "org.junit.jupiter:junit-jupiter-engine:5.7.0",  -- Dependensi untuk unit testing
          "org.junit.platform:junit-platform-launcher:1.7.0",  -- Dependensi untuk unit testing
          "org.junit.platform:junit-platform-commons:1.7.0",  -- Dependensi untuk unit testing
        },
      },
      gradleWrapper = {
        path = "./gradlew",  -- Menentukan path ke gradle wrapper
      },
      multiModule = {
        enabled = true,
        rootProjectName = "emelyn",  -- Nama proyek root
        moduleDirectories = {
          "modules",  -- Menentukan direktori modul untuk proyek multi-modul

        },
      },
      buildTasks = {
        compileJava = "build/classes",  -- Output dari kompilasi Java
        runTests = "test",  -- Task untuk menjalankan unit test
      },
      taskConfiguration = {
        customTask = {
          name = "deploy",
          arguments = {"--deployTo=prod", "--no-cache"},  -- Menentukan argument untuk task kustom
        },
      },
      logging = {
        level = "info",  -- Pilihan: "debug", "info", "warn", "error"
        file = "./build/logs/gradle.log",  -- Lokasi file log untuk debugging build
      },
      output = {
        redirectToFile = true,  -- Redirect output build ke file log
        outputPath = "./build/output",  -- Menentukan path untuk output build
      },
      advancedSettings = {
        gradleDaemon = true,  -- Mengaktifkan daemon untuk meningkatkan performa
        parallelExecution = true,  -- Menjalankan eksekusi build secara paralel
        continueOnFailure = false,  -- Menentukan apakah build harus dilanjutkan meskipun ada kegagalan
        showStacktraces = true,  -- Menampilkan stacktraces ketika ada kegagalan
        showFailedTasks = true,  -- Menampilkan task yang gagal
        showStandardStreams = true,  -- Menampilkan output standar
        showPassed = true,  -- Menampilkan output build yang berhasil
      },
    },
  },
})


lspconfig.dockerls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = on_init,
  settings = {
    docker = {
      diagnostics = {
        -- Menampilkan peringatan, error, dan petunjuk untuk file Docker
        showWarnings = true,
        showError = true,
        showHints = true,
        showErrorCodes = true,
        -- Mengabaikan file-file tertentu saat memeriksa Dockerfile
        ignoreFiles = {
          "Dockerfile",
          "docker-compose.yml",
          "docker-compose.yaml",
          "Dockerfile.dev",
        },
      },
      -- Menambahkan pengaturan format otomatis
      formatting = {
        enable = true,  -- Mengaktifkan auto-formatting
        -- Menentukan default formatter untuk Dockerfile
        defaultFormatter = "dockerfile-language-server",
        -- Menambahkan aturan format khusus
        formatOnSave = true, -- Mengaktifkan format otomatis saat file disimpan
        trimTrailingWhitespace = true, -- Menghapus spasi kosong di akhir baris
      },
      -- Menambahkan linting untuk Dockerfile
      linting = {
        enable = true,  -- Mengaktifkan linting
        rules = {
          deprecated = true,  -- Peringatan jika menggunakan fitur deprecated
          unoptimized = true, -- Peringatan jika Dockerfile tidak dioptimalkan
          missingArgs = true, -- Peringatan jika ada argumen yang hilang
          unnecessarySteps = true, -- Menunjukkan langkah yang tidak diperlukan dalam Dockerfile
        },
      },
      -- Menambahkan pengaturan untuk Docker Compose
      compose = {
        enable = true, -- Mengaktifkan pengenalan file docker-compose
        validation = {
          enable = true, -- Mengaktifkan validasi sintaks docker-compose.yml
          showWarnings = true, -- Menampilkan peringatan saat validasi
        },
        linting = {
          enable = true, -- Mengaktifkan linting untuk file docker-compose
          rules = {
            unusedServices = true, -- Peringatan jika ada layanan yang tidak digunakan
            versionMismatch = true, -- Peringatan jika versi docker-compose tidak cocok
          },
        },
      },
      -- Menambahkan pengaturan untuk mempermudah navigasi Dockerfile
      navigation = {
        enable = true,  -- Mengaktifkan navigasi antar bagian Dockerfile
        goToDefinition = true,  -- Navigasi ke definisi instruksi
        showParameterHints = true, -- Menampilkan petunjuk parameter untuk instruksi Dockerfile
      },
      -- Pengaturan untuk penanganan image dan container
      containerManagement = {
        enable = true, -- Mengaktifkan pengelolaan container
        autoStart = true, -- Mengaktifkan pemulihan dan start otomatis container saat dibutuhkan
        autoStop = true,  -- Menghentikan container secara otomatis saat tidak digunakan
      },
    },
  },
}



lspconfig.sqls.setup({
  cmd = { "sqls" },
  filetypes = { "sql" },
  root_dir = lspconfig.util.root_pattern(".git", "*.sql"),
  settings = {
    sqls = {
      connections = {}, -- conection yout databse

      -- Pengaturan tambahan untuk sqls
      max_line_length = 120,        -- Menentukan panjang maksimal baris SQL
      use_single_quote = true,      -- Menggunakan tanda kutip tunggal (') untuk string SQL
      enable_diagnostics = true,    -- Mengaktifkan diagnostik dan linting
      enable_formatting = true,     -- Mengaktifkan formatting
      show_table_info = true,       -- Menampilkan informasi tentang tabel saat mengetik query
      -- Pengaturan linting dan diagnostik yang lebih lanjut
      linting = {
        enable = true,              -- Mengaktifkan linting
        rules = {
          syntax_error = true,      -- Menampilkan kesalahan sintaksis
          unused_column = true,     -- Peringatan untuk kolom yang tidak digunakan
          unquoted_identifier = true,   -- Peringatan untuk identifier yang tidak diberi kutip
          column_length = 100,           -- Batas panjang kolom
          table_case = "upper",          -- Menggunakan huruf kapital untuk nama tabel
        },
      },
      -- Pengaturan format query
      formatting = {
        align_keywords = true,      -- Menyelaraskan kata kunci SQL seperti SELECT, WHERE, JOIN
        indent_keywords = true,     -- Mengindentasikan kata kunci SQL
        keyword_case = "upper",     -- Menggunakan huruf kapital untuk kata kunci SQL
        max_column_width = 120,     -- Lebar maksimal kolom saat format
      },
      -- Fitur canggih lainnya
      enable_advanced_sql_features = true,  -- Mengaktifkan fitur-fitur canggih seperti CTE dan Window Functions
      auto_correction = true,             -- Mengaktifkan koreksi otomatis untuk kesalahan umum
      schema_introspection = {
        enable = true,                    -- Mengaktifkan eksplorasi skema untuk menampilkan tabel/kolom
        show_table_info = true,           -- Menampilkan informasi tabel saat mengetik query
        -- Penanganan tipe data dan indeks
        show_column_info = true,          -- Menampilkan informasi kolom saat mengetik query
        show_index_info = true,           -- Menampilkan informasi indeks saat mengetik query
      },
      -- Snippet untuk query SQL umum
      snippets = {
        enable = true,
        snippets = {
          create_database = "CREATE DATABASE ${1:database_name};",  -- Snippet untuk CREATE DATABASE
          create_table = "CREATE TABLE ${1:table_name} (\n  ${2:column_name} ${3:data_type},\n  PRIMARY KEY (${4:primary_key})\n);",  -- Snippet untuk CREATE TABLE
          insert_into = "INSERT INTO ${1:table_name} (${2:column_names}) VALUES (${3:values});",  -- Snippet untuk INSERT INTO
          alter_table = "ALTER TABLE ${1:table_name} ADD COLUMN ${2:column_name} ${3:data_type};",  -- Snippet untuk ALTER TABLE
          drop_database = "DROP DATABASE ${1:database_name};",  -- Snippet untuk DROP DATABASE
        },
      },
      -- Pengaturan koneksi untuk multiple databases

    }
  }
})







lspconfig.texlab.setup {
  on_attach = on_attach,  -- Fungsi on_attach Anda
  capabilities = capabilities,  -- Kemampuan LSP Anda
  on_init = on_init,  -- Fungsi on_init Anda
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = { "-pdf", "-interaction=nonstopmode", "%f" },
      },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
      lint = {
        onSave = true,  -- Lakukan lint saat menyimpan
      },
      bibtex = {
        executable = "bibtex",  -- Tentukan executable untuk BibTeX jika digunakan
        args = { "%f" },
      },
      viewer = {
        executable = "zathura",  -- Tentukan viewer PDF default
        args = { "--synctex-forward", "%l:1:%f", "%p" },
      },
    },
  },
  -- Tentukan konfigurasi tambahan seperti format on save, atau deteksi file
  flags = {
    debounce_text_changes = 150,  -- Percepat perubahan teks
    -- Format on save
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main#format_on_save
    format_on_save = {
      enabled = true,
      filter = function(client)
        -- Untuk menggunakan format pada LSP yang tidak didukung oleh null-ls
        return client.name == "sumneko_lua"
      end,
    },
  },
}




lspconfig.sourcery.setup {
  on_attach = function(client, bufnr)
    -- Keymaps ketika LSP terhubung
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    -- Menambahkan keymap untuk go-to-definition
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- Menambahkan keymap untuk hover
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- Menambahkan keymap untuk diagnostic
    buf_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

    -- Auto-format on save jika LSP mendukung document formatting
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
    end
  end,

  on_init = function(client)
    print("Sourcery LSP initialized!")
  end,

  capabilities = vim.lsp.protocol.make_client_capabilities(),

  settings = {
    sourcery = {
      lsp = {
        -- Enable the LSP server
        enabled = true,

        -- Enable the builtin LSP client
        builtin = true,
        telemetry = {
          enabled = true,
        },
      },
      maven = {
        autoSync = true, -- Menyinkronkan proyek Maven secara otomatis
        goals = {"clean", "install", "test"}, -- Tujuan Maven default
        dependencyManagement = {
          autoResolve = true, -- Resolusi dependensi otomatis
          scopes = {"compile", "runtime"}, -- Jalankan resolusi dependensi untuk scope compile dan runtime
          importSources = true, -- Impor sumber kode dari dependensi
          downloadSources = true, -- Unduh sumber kode dari dependensi
          updateSnapshots = true, -- Perbarui dependensi dengan versi snapshot
        },
      },
    },
  },

  hooks = {
    before_command = function(command)
      print("Executing Maven command:", command)
    end,
    after_command = function(command, result)
      print("Maven command completed:", command, "Result:", result)
    end,
  },

  init_options = {
    token = "",
      },
}


lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = on_init,
  settings = {
    html = {
      validate = {
        enable = true,
        scripts = true,
        styles = true,
        autoFix = true,
        validateElementClose = true,
        validateElementName = true,
        validateIndentation = true,
        validateSelfClosing = true,
        validateTagName = true,
        warnAboutInvalidHTML = true,
      },
      format = {
        enable = true,
        wrapLineLength = 120,
        unformatted = { "pre", "code" },
        defaultFormatter = "markuplint", -- Diganti ke Markuplint
        style = { ["markuplint/markuplint"] = true },
        script = { ["markuplint/markuplint"] = true },
        css = { ["markuplint/markuplint"] = true },
        inlineStyle = { ["markuplint/markuplint"] = true },
        inlineScript = { ["markuplint/markuplint"] = true },
      },
      suggest = {
        html5 = true,
        style = true,
        tag = true,
        css = true,
        script = true,
        json = true,
        yaml = true,
        markdown = true,
        sql = true,
        typescript = true,
        vue = true,
        attribute = true,
        event = true,
        semantic = true,
        jsonSchema = true,
        xml = true,
      },
      lint = {
        validate = true,
        maxLineLength = 80,
        htmlhint = { -- Integrasi HTMLHint untuk linting
          enable = true,
          config = {
            ["attr-value-double-quotes"] = true,
            ["tag-pair"] = true,
            ["id-unique"] = true,
            ["attr-lowercase"] = true,
            ["doctype-first"] = true,
          },
        },
      },
      completion = {
        enable = true,
        autoInsert = true,
        suggest = true,
        snippetSupport = true,
        matchOnInsert = true,
        autoTrigger = true,
        detailed = true,
        triggerCharacters = { "<", "/", ":", "." },
        autoCloseTags = { -- Fitur Auto-close Tags
          enable = true,
        },
      },
      css = {
        validate = true,
        lint = true,
        format = {
          enable = true,
          defaultFormatter = "prettier",
        },
      },
      javascript = {
        validate = true,
        format = {
          enable = true,
          defaultFormatter = "prettier",
        },
      },
      vue = {
        validate = true,
        format = {
          enable = true,
          defaultFormatter = "prettier",
        },
      },
      snippets = { -- Menambahkan Snippets HTML Bawaan
        enable = true,
        builtInSnippets = true,
        customSnippets = {
          ["html5-template"] = "<!DOCTYPE html>\n<html>\n<head>\n<title>${1:Document}</title>\n</head>\n<body>\n${2}\n</body>\n</html>",
        },
      },
      tailwindCSS = { -- Integrasi TailwindCSS IntelliSense
        validate = true,
        format = true,
        completion = true,
        lint = true,
      },
      semanticHighlighting = { -- Semantic Highlighting
        enable = true,
      },
      debug = {
        enable = true,
        logLevel = "debug",
        traceResponse = true,
        runInFile = true,
        runInTerminal = true,
        console = "integratedTerminal",
        source = "always",
        adapter = "test-adapter",
        internalConsoleOptions = "neverOpen",
        debuggerType = "integrated",
        traceServer = "verbose",
        workspaceFolder = true,
        traceFiles = {
          enable = true,
          level = "verbose",
        },
        integratedTerminal = {
          enable = true,
          startInBackground = true,
        },
      },
      api = {
        documentation = {
          enable = true,
          triggerOnHover = true,
        },
        mapping = {
          enable = true,
          trigger = "ctrl-space",
        },
      },
    },
  },
}



lspconfig.ruff.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = on_init,
  settings = {
    python = {
      analysis = {
        diagnosticMode = "workspace", -- Menentukan mode diagnostik
        autoSearchPaths = true, -- Mencari path otomatis untuk dependensi
        useLibraryCodeForTypes = true, -- Gunakan kode pustaka untuk tipe analisis
        typeCheckingMode = "strict", -- Pengujian tipe yang lebih ketat untuk mendeteksi kesalahan lebih awal
        importStrategy = "fromEnvironment", -- Menggunakan strategi impor dari environment
        importFormat = "relative", -- Menggunakan format impor relatif
        reportMissingImports = true, -- Laporkan impor yang hilang
        reportUnusedImport = true, -- Laporkan impor yang tidak digunakan
        reportUnusedClass = true, -- Laporkan kelas yang tidak digunakan
        reportUnusedFunction = true, -- Laporkan fungsi yang tidak digunakan
        reportUnusedVariable = true, -- Laporkan variabel yang tidak digunakan
        runtimeTypeChecking = true, -- Menguji tipe runtime
        stubPath = "./stubs", -- Path untuk file stub khusus (jika diperlukan)
        reportGeneralTypeIssues = true, -- Laporkan masalah tipe umum
        reportUnusedSelf = true, -- Laporkan self yang tidak digunakan
        reportUnusedFunctionArgs = true, -- Laporkan argumen fungsi yang tidak digunakan
        reportUnusedLoopVars = true, -- Laporkan variabel loop yang tidak digunakan
        reportUnusedLocals = true, -- Laporkan lokal yang tidak digunakan
        reportUnusedImports = true, -- Laporkan impor yang tidak digunakan
        reportUnusedAssignments = true, -- Laporkan penetapan yang tidak digunakan
        reportUnusedFunctionResults = true, -- Laporkan hasil fungsi yang tidak digunakan
      },
      linting = {
        enabled = true, -- Mengaktifkan linting
        rules = {
          ["no-assert"] = "off", -- Matikan aturan "no assert", sering digunakan dalam pengujian dan AI
          ["unused-imports"] = "off", -- Banyak digunakan di notebook Jupyter, kadang impor tidak digunakan
          ["too-many-locals"] = "off", -- Nonaktifkan untuk fungsi dengan banyak variabel sementara (misalnya pelatihan model)
          ["max-line-length"] = 120, -- Menetapkan panjang baris maksimum agar lebih nyaman di AI/ML
          ["complexity"] = "off", -- Matikan aturan kompleksitas untuk mendukung skrip AI yang rumit
          ["inconsistent-return-statements"] = "on", -- Aktifkan untuk memastikan konsistensi return
          ["no-self-argument"] = "on", -- Mendeteksi kesalahan pada penggunaan `self` di metode kelas
          ["no-dupe-args"] = "on", -- Hindari argumen duplikat dalam fungsi
        },
      },
      formatting = {
        enabled = true, -- Mengaktifkan pemformatan otomatis
        provider = "black", -- Gunakan Black sebagai formatter default
        lineLength = 120, -- Panjang baris maksimum untuk pemformatan
        allowMultipleLines = true, -- Hindari argumen dalam banyak baris
        singleQuote = true --nakan tanda kutip tunggal

      },
      workspace = {
        maxPreload = 2000, -- Maksimum jumlah file yang dapat dimuat sebelumnya
        preloadModules = true, -- Preload modul Python umum
        extraPaths = { -- Tambahkan jalur ekstra untuk modul kustom
          "./src",
          "./lib",
          "./tests",
        },
      },
    },
    lua = {
      runtime = {
        version = "LuaJIT", -- Pastikan menggunakan LuaJIT untuk performa lebih baik
        path = vim.split(package.path, ";"), -- Menyesuaikan path runtime
      },
      diagnostics = {
        globals = { "vim" }, -- Menambahkan "vim" sebagai global variable
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- Menambahkan semua library Neovim
      },
    },
  },
  flags = {
    debounce_text_changes = 150, -- Mengatur debouncing agar lebih responsif saat pengetikan
  },
  filetypes = { "python", "jupyter", "ipynb" }, -- Menambahkan dukungan untuk Jupyter Notebook dan Python
}





lspconfig.jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = on_init,
  settings = {
    java = {
      configuration = {
        updateBuildConfiguration = "interactive",
        updateBuildConfiguration_ruby = "interactive",
        updateBuildConfiguration_python = "interactive",
        updateBuildConfiguration_java = "interactive",
        updateBuildConfiguration_typescript = "interactive",
        updateBuildConfiguration_html = "interactive",
        updateBuildConfiguration_css = "interactive",
        updateBuildConfiguration_javascript = "interactive",
        runtimes = {
          { name = "JavaSE-23", path = "/usr/lib/jvm/java-23-openjdk" },
          { name = "JavaSE-21", path = "/usr/lib/jvm/java-21-openjdk" },
          { name = "JavaSE-17", path = "/usr/lib/jvm/java-17-openjdk" },
      },
      signatureHelp = {
        enabled = true,
        showSignatures = true,  -- Tampilkan tanda tangan
        showSignatures_ruby = true,  -- Tampilkan tanda tangan
        showSignatures_python = true,  -- Tampilkan tanda tangan
        showSignatures_java = true,  -- Tampilkan tanda tangan
        showSignatures_typescript = true,  -- Tampilkan tanda tangan
        showSignatures_html = true,  -- Tampilkan tanda tangan
        showSignatures_css = true,  -- Tampilkan tanda tangan
        showSignatures_javascript = true,  -- Tampilkan tanda tangan
        showSignatures_javascriptreact = true,  -- Tampilkan tanda tangan
        showSignatures_typescriptreact = true,  -- Tampilkan tanda tangan
        showSignatures_vue = true,  -- Tampilkan tanda tangan
      },
      format = {
        settings = {
          profile = "Sun",  -- Atau "Eclipse" atau "Sun"
          additionalProfiles = {"Eclipse", "Sun"},
          additionalProfiles_ruby = {"Eclipse", "Sun"},  -- Tambahkan profil tambahan untuk format
          additionalProfiles_python = {"Eclipse", "Sun"},  -- Tambahkan profil tambahan untuk format
          additionalProfiles_java = {"Eclipse", "Sun"},  -- Tambahkan profil tambahan untuk format
          additionalProfiles_typescript = {"Eclipse", "Sun"},  -- Tambahkan profil tambahan untuk format
          additionalProfiles_html = {"Eclipse", "Sun"},  -- Tambahkan profil tambahan untuk format
          additionalProfiles_css = {"Eclipse", "Sun"},  -- Tambahkan profil tambahan untuk format
          additionalProfiles_javascript = {"Eclipse", "Sun"},  -- Tambahkan profil tambahan untuk format
          options = {
            tabSize = 2,
            insertSpaces = true,
            endOfLine = "lf",
            insertFinalNewline = true,
            trimTrailingWhitespace = true,
            trimFinalNewlines = true,
            },
        },
      },
      maven = {
        downloadSources = true,
        downloadJavadoc = true,
        downloadSourcesAndJavadoc = true,
        offline = true,
        offline_ruby = true,  -- Mengunduh file sumber dan dokumentasi secara offline
        offline_python = true,  -- Mengunduh file sumber dan dokumentasi secara offline
        offline_java = true,  -- Mengunduh file sumber dan dokumentasi secara offline
        offline_typescript = true,  -- Mengunduh file sumber dan dokumentasi secara offline
        offline_html = true,  -- Mengunduh file sumber dan dokumentasi secara offline
        offline_css = true,  -- Mengunduh file sumber dan dokumentasi secara offline
        offline_javascript = true,  -- Mengunduh file sumber dan dokumentasi secara offline
      },
      build = {
        autoBuild = true,
        buildOnSave = true,      
      },
      codeAction = {
        organizeImports = true,
        enable = true,
        showImplicit = true,
        showUnused = true,
        showUnusedCode = true,
      
      },
      diagnostics = {
        enable = true,
        runOnSave = true,
        showCodeActions = true,
        showUnused = true,
        showUnusedCode = true,
        showUnusedCode_ruby = true,  -- Tampilkan kode yang tidak digunakan
        showUnusedCode_python = true,  -- Tampilkan kode yang tidak digunakan
        showUnusedCode_java = true,  -- Tampilkan kode yang tidak digunakan
        showUnusedCode_typescript = true,  -- Tampilkan kode yang tidak digunakan
        showUnusedCode_html = true,  -- Tampilkan kode yang tidak digunakan
        showUnusedCode_css = true,  -- Tampilkan kode yang tidak digunakan
        showUnusedCode_javascript = true,  -- Tampilkan kode yang tidak digunakan
      },
      jdk = {
        home = "/usr/lib/jvm/java-23-openjdk/",
              },
      buildTools = {
        gradle = {
          autoSync = true,
        },
        maven = {
          downloadSources = true,
          superMaven = true,  -- Mengaktifkan fitur SuperMaven
        },
      },
      debug = {
        enable = true,
        port = 1998,
      },
      aiDevelopment = {
        enabled = true,
        libraries = {
          deeplearning4j = {
            version = "1.0.0-M1.1",
          },
          stanfordnlp = {
            version = "4.5.2",
          },
          tensorflow = {
            version = "2.11.0",
          },
          opennlp = {
            version = "1.9.4",  -- Apache OpenNLP untuk pemrosesan bahasa alami
          },
          h2oai = {
            version = "3.38.0.1",  -- Library H2O.ai untuk pembelajaran mesin
          },
        },
      },
      completion = {
        enabled = true,
        suggestions = {
          enabled = true,
          showDetailed = true,
          includeVariables = true,
          includeMethods = true,
        },
      },
      hover = {
        enabled = true,
      },
      interactiveCodeAssist = {
        enabled = true,
        showInlineHints = true,
      },
      javaTest = {
        enabled = true,
      },
      javaDebugAdapter = {
        enabled = true,
        port = 1998,
      },
      googleJavaFormat = {
        enabled = true,
      },
      javaLanguageServer = {
        enabled = true,
        command = {"java-language-server"},
        settings = {
          java = {
            home = "/usr/lib/jvm/java-23-openjdk/",
            runtime = {
              path = "/usr/lib/jvm/java-23-openjdk/",
            },
          },
        },
      },
      webDevelopment = {
        enabled = true,
        frameworks = {
          springBoot = true,
          quarkus = true,
        },
        frontEnd = {
          html = {
            enabled = true,
          },
          css = {
            enabled = true,
            supportSCSS = true,
          },
          javascript = {
            enabled = true,
          },
          typescript = {
            enabled = true,
          },
        },
      },
      pythonIntegration = {
        enabled = true,
        tools = {
          py4j = {
            version = "0.10.9.5",
          },
          jython = {
            version = "2.7.3",
          },
        },
        features = {
          bidirectionalCall = true,
          dataExchange_ruby = true,  -- Menambahkan fitur data exchange
          dataExchange_python = true,  -- Menambahkan fitur data exchange
          dataExchange_java = true,  -- Menambahkan fitur data exchange
          dataExchange_typescript = true,  -- Menambahkan fitur data exchange
          dataExchange_html = true,  -- Menambahkan fitur data exchange
          dataExchange_css = true,  -- Menambahkan fitur data exchange
          dataExchange_javascript = true,  -- Menambahkan fitur data exchange
          
          dataExchange = true,
        },
      },
      pmd = {
  enabled = true,
  rulesets = {
    "java-basic",
    "java-braces",
    "java-clone",
    "java-codesize",
    "java-comments",
    "java-controversial",
    "java-coupling",
    "java-design",
    "java-empty",
    "java-finalizers",
    "java-imports",
    "java-j2ee",
    "java-javabeans",
    "java-junit",
    "java-logging-jakarta-commons",
    "java-logging-java",
    "java-migrating",
    "java-naming",
    "java-optimizations",
    "java-strictexception",
    "java-strings",
    "java-sunsecure",
    "java-typeresolution",
    "java-unnecessary",
    "java-unusedcode",
  },
  options = {
    -- Path ke custom ruleset
    -- rulesetPath = "/home/emelynmorrgan/GITHUB/SOURCE/pmd/pmd-java/custom-ruleset.xml",
    -- Path ke binary PMD (pastikan PMD CLI sudah diinstal)
    pmdBinary = "/usr/bin/pmd",
    -- Direktori analisis (opsional, jika Anda ingin menetapkan scope khusus)
    analysisDir = "./src",
    -- Format laporan hasil analisis
    reportFormat = "text", -- Pilihan lain: "xml", "html"
    failOnViolation = true, -- Hentikan build jika ada pelanggaran
  },
},

neovimSupport = {
  enabled = true,  -- Dukungan untuk Neovim
  features = {
    snippets = true,  -- Aktifkan dukungan snippet otomatis untuk mempercepat pengkodean
    sorceryAI = true,  -- Integrasi AI seperti Sorcery atau GPT untuk kode otomatis
            sorceryAI_ruby = true,  -- Integrasi AI seperti Sorcery atau GPT untuk kode otomatis
            sorceryAI_python = true,  -- Integrasi AI seperti Sorcery atau GPT untuk kode otomatis
            sorceryAI_java = true,  -- Integrasi AI seperti Sorcery atau GPT untuk kode otomatis  
    lspEnhancements = true,  -- Peningkatan pada LSP untuk Neovim
    autoFormatting = true,  -- Format otomatis dengan Prettier, Black, atau alat lain
    codeActions = true,  -- Mendukung tindakan kode langsung (e.g., refactor otomatis)
    diagnosticsOnFly = true,  -- Diagnostik waktu nyata saat mengetik
    autoCompletion = true,  -- Peningkatan autocomplete dengan luas
    semanticTokens = true,  -- Dukungan token semantik untuk warna sintaksis yang lebih cerdas
    debugging = true,  -- Tambahkan dukungan debugger seperti DAP (Debug Adapter Protocol)
    testingIntegration = true,  -- Integrasi alat pengujian seperti Jest, Mocha, atau JUnit
    projectManagement = true,  -- Integrasi manajemen proyek (e.g., Telescope, LSP Workspace)
    gitIntegration = {
      enabled = true,  -- Tambahkan fitur Git di Neovim
      signs = true,  -- Tampilkan perubahan Git (e.g., hunk signs di baris)
      diffView = true,  -- Mendukung tampilan diff langsung
    },
    fileTree = {
      enabled = true,  -- Integrasi file tree seperti `nvim-tree` atau `neo-tree`
      autoSync = true,  -- Sinkronisasi otomatis dengan file saat ini
    },
    terminalIntegration = {
      enabled = true,  -- Tambahkan terminal bawaan ke Neovim
      splitMode = "horizontal",  -- Mode default terminal terbuka (bisa `horizontal`, `vertical`, atau `float`)
    },
    productivityTools = {
      bookmarks = true,  -- Dukungan bookmark dalam kode
      todos = true,  -- Highlight dan manajemen TODO/FIXME
            todo_comments = true,  -- Tambahkan komentar TODO/FIXME
            todo_comments_ruby = true,  -- Tambahkan komentar TODO/FIXME
            todo_comments_python = true,  -- Tambahkan komentar TODO/FIXME
            todo_comments_java = true,  -- Tambahkan komentar TODO/FIXME
            todo_comments_typescript = true,  -- Tambahkan komentar TODO/FIXME
            todo_comments_html = true,  -- Tambahkan komentar TODO/FIXME
            todo_comments_css = true,  -- Tambahkan komentar TODO/FIXME
            todo_comments_javascript = true,  -- Tambahkan komentar TODO/FIXME
    },
  },
  integrations = {
    linting = {
      eslint = true,  -- Aktifkan linting otomatis dengan ESLint
            eslint_ruby = true,  -- Aktifkan linting otomatis dengan ESLint
            eslint_python = true,  -- Aktifkan linting otomatis dengan ESLint
            eslint_java = true,  -- Aktifkan linting otomatis dengan ESLint
            eslint_typescript = true,  -- Aktifkan linting otomatis dengan ESLint
            eslint_html = true,  -- Aktifkan linting otomatis dengan ESLint
            eslint_css = true,  -- Aktifkan linting otomatis dengan ESLint
            eslint_javascript = true,  -- Aktifkan linting otomatis dengan ESLint
      stylelint = true,  -- Dukungan linting untuk CSS/SASS
      pmd = true,  -- Tambahkan PMD untuk Java linting
    },
    formatters = {
      prettier = true,  -- Dukungan untuk Prettier (JavaScript, HTML, CSS)
            prettier_eslint = true,  -- Dukungan untuk Prettier (JavaScript, HTML, CSS)
            prettier_json = true,  -- Dukungan untuk Prettier (JavaScript, HTML, CSS)
            prettier_markdown = true,  -- Dukungan untuk Prettier (JavaScript, HTML, CSS)
            prettier_yaml = true,  -- Dukungan untuk Prettier (JavaScript, HTML, CSS)
            prettier_ruby = true,  -- Dukungan untuk Prettier (JavaScript, HTML, CSS)
            prettier_typescript = true,  -- Dukungan untuk Prettier (JavaScript, HTML, CSS)
            prettier_python = true,  -- Dukungan untuk Prettier (JavaScript, HTML, CSS)
      black = true,  -- Dukungan untuk Black (Python)
      clangFormat = true,  -- Dukungan untuk Clang Format (C/C++)
    },
    aiTools = {
      -- copilot = true,  -- Aktifkan GitHub Copilot (bisa diganti AI lain)
      -- codeium = true,  -- Opsi alternatif jika menggunakan Codeium
      --       codeium_ruby = true,  -- Opsi alternatif jika menggunakan Codeium
      --       codeium_python = true,  -- Opsi alternatif jika menggunakan Codeium
      --       codeium_java = true,  -- Opsi alternatif jika menggunakan Codeium
      --       codeium_typescript = true,  -- Opsi alternatif jika menggunakan Codeium
      --       codeium_html = true,  -- Opsi alternatif jika menggunakan Codeium
      --       codeium_css = true,  -- Opsi alternatif jika menggunakan Codeium
      --       codeium_javascript = true,  -- Opsi alternatif jika menggunakan Codeium
      chatGPT = true,  -- Integrasi model GPT langsung di editor
            chatGPT_ruby = true,  -- Integrasi model GPT langsung di editor
            chatGPT_python = true,  -- Integrasi model GPT langsung di editor
            chatGPT_java = true,  -- Integrasi model GPT langsung di editor
            chatGPT_typescript = true,  -- Integrasi model GPT langsung di editor
            chatGPT_html = true,  -- Integrasi model GPT langsung di editor
            chatGPT_css = true,  -- Integrasi model GPT langsung di editor
            chatGPT_javascript = true,  -- Integrasi model GPT langsung di editor
            chatGPT_markdown = true,  -- Integrasi model GPT langsung di editor
            chatGPT_json = true,  -- Integrasi model GPT langsung di editor
            chatGPT_yaml = true,  -- Integrasi model GPT langsung di editor
            chatGPT_sql = true,  -- Integrasi model GPT langsung di editor
    },
  },
}

      },
    },
  },
}


--phpactor

lspconfig.phpactor.setup {
  on_attach = function(client, bufnr)
    -- Fungsi untuk mengatur keymap untuk buffer
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    -- Keymaps dasar untuk navigasi dan aksi umum
    buf_set_keymap('n', '<leader>rn', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

    -- Keymaps untuk database
    buf_set_keymap('n', '<leader>db', '<cmd>lua require("phpactor").query_database()<CR>', opts) -- Query database langsung
    buf_set_keymap('n', '<leader>ds', '<cmd>lua require("phpactor").show_schema()<CR>', opts) -- Tampilkan skema DB
    buf_set_keymap('n', '<leader>di', '<cmd>lua require("phpactor").inspect_schema()<CR>', opts) -- Inspeksi skema DB

    -- Keymaps untuk pengujian (Testing Framework)
    buf_set_keymap('n', '<leader>tt', '<cmd>lua require("phpactor").run_tests()<CR>', opts)  -- Jalankan unit test
    buf_set_keymap('n', '<leader>tf', '<cmd>lua require("phpactor").run_feature_tests()<CR>', opts) -- Jalankan feature test

    -- Keymaps untuk refactoring lanjutan
    buf_set_keymap('n', '<leader>refactor', '<cmd>lua require("phpactor").refactor()<CR>', opts)  -- Refactor kode PHP
    buf_set_keymap('n', '<leader>ext', '<cmd>lua require("phpactor").extract_method()<CR>', opts)  -- Ekstrak metode dari fungsi
    
    -- Keymaps untuk navigasi kode
    buf_set_keymap('n', '<leader>go', '<cmd>lua vim.lsp.buf.references()<CR>', opts)  -- Go to references
    buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)  -- List Document Symbols
    buf_set_keymap('n', '<leader>ws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)  -- List Workspace Symbols

    -- Keymaps untuk aksi umum
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)  -- Format file
    buf_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)  -- Deklarasi
    buf_set_keymap('n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)  -- Code Action
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)  -- Buka diagnosa
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)  -- Pindah ke diagnosa sebelumnya
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)  -- Pindah ke diagnosa berikutnya
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)  -- Lihat diagnosa dalam list

    -- Keymaps untuk workspace
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)  -- Tambah folder workspace
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)  -- Hapus folder workspace
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)  -- List folder workspace
  end,

  -- Pengaturan khusus untuk phpactor
  settings = {
    phpactor = {
      -- Aktifkan fitur completions
      completion = {
        enable = true,
        triggerCharacters = { '->', '::' },

        
      },
      -- Aktifkan diagnosa
      diagnostics = {
        enable = true,
        
      },
      -- Aktifkan refactoring
      refactor = {
        enable = true,
      },
      -- Aktifkan auto-formatting
      format = {
        enable = true,
        
      },
      -- Database integrasi
      database = {
        enable = true, -- Aktifkan query database
        connection = "mysql", -- Tentukan jenis database
      },
      -- Testing framework
      testing = {
        enable = true,
        frameworks = {"PHPUnit", "Behat", "Codeception"},  -- Framework pengujian yang didukung
      },
    },
  },

  -- Tentukan root proyek PHP berdasarkan folder atau file
  root_dir = require('lspconfig.util').root_pattern(
    'composer.json', -- Phpactor mendeteksi root proyek dengan adanya composer.json
    '.git'
  ),
  
  -- Tentukan kemampuan untuk meningkatkan pengalaman auto-completion
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}


-- LSP for PHP, Web, and MySQL
lspconfig.intelephense.setup {
  on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    -- Keymaps dasar
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>f', '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)

    -- Auto-format on save
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false })]]
    end

    -- Tampilkan diagnostics di hover
    vim.cmd [[
      autocmd CursorHold <buffer> lua vim.diagnostic.open_float(nil, { focusable = false })
    ]]

    -- Aktifkan perbaikan otomatis setelah save jika ESLint mendukungnya
    if client.server_capabilities.codeActionProvider then
      vim.cmd [[autocmd BufWritePre <buffer> EslintFixAll]]
    end
  end,

  on_init = function(client)
    print("Intelephense LSP initialized!")
  end,

  capabilities = require('cmp_nvim_lsp').default_capabilities(), -- Kompatibilitas dengan nvim-cmp

  settings = {
    intelephense = {
      filetypes = { "php", "html", "css", "javascript", "typescript", "json" },
      php = {
        validate = true,
        suggest = {
          basic = true,
          experimental = true,
          classes = true,
          functions = true,
          interfaces = true,
          traits = true,
          types = true,
        },
      },
      diagnostics = {
        enable = true,
        pecl = true,
        phpVersion = "8.3.15", -- Atur ke versi PHP yang sesuai
        globals = { 'all' },
        run = 'onType',
        diagnosticTypes = {
          Enable = {
            "Undefined variable",
            "Undefined index",
            "Undefined offset",
            "Undefined property",
            "Undefined class constant",
            "Undefined function",
            "Missing argument",
            "Missing property",
            "Missing class",
            "Missing file",
            "Invalid argument supplied",
            "Invalid array key",
            "Invalid character",
            "Invalid default argument",
            "Invalid function",
            "Invalid number format",
            "Invalid property assignment",
            "Invalid return type",
            "Invalid static method",
            "Invalid string offset",
            "Invalid type",
            "Is deprecated",
            "Method may expect argument",
            "No value",
            "Recursion",
            "Too few arguments",
            "Too many arguments",
            "Type error",
          },
      },
      completion = {
        enable = true,
        triggerCharacters = { "->", "::" },
      },
      format = {
        enable = true, -- Aktifkan auto-format untuk PHP
      },
      refactor = {
        enable = true, -- Aktifkan fitur refactoring
      },
      phpdoc = {
        enable = true, -- Aktifkan dokumentasi otomatis PHPDoc
      },
    },

    -- Pengaturan untuk Web Development
    html = {
      format = {
        enable = true,
        end_with_newline = true,
        indent_inner_html = true,
        indent_size = 2,
        indent_width = 2,
        preserve_newlines = true,
        wrap_attributes = "auto",
        wrap_attributes_indent_size = 2,
        wrap_attributes_indent_with_tabs = false,
      },
      suggestions = {
        enable = true,
        attribute_default = true,
        attribute_indent = true,
        attribute_quotes = true,
        case_sensitive = true,
        class_value = true,
        color_value = true,
        comment = true,
      },
    },
    css = {
      validate = true,
      lint = {
        "box-model",
        "color-hex-case",
        "indentation",
      },
    },

    javascript = {
      format = {
        enable = true,
      },
      lint = {
        "no-unused-vars",
        "eqeqeq",
        "semi",
      },
    },

    -- Webpack & Browser Debugging Integration
    webpack = {
      enable = true,  -- Aktifkan integrasi webpack
      webpackConfig = "./webpack.config.js",  -- Lokasi file konfigurasi webpack
    },
  },

  root_dir = require('lspconfig.util').root_pattern(
    '.eslintrc',
    '.eslintrc.json',
    '.eslintrc.js',
    '.eslintrc.yaml',
    '.eslintrc.yml',
    'package.json',
    'tsconfig.json',
    'jsconfig.json',
    'babel.config.js',
    '.babelrc',
    '.babelrc.json',
    '.babelrc.js',
    'composer.json', -- Tambahkan file konfigurasi PHP seperti composer.json
    '.git' -- Tentukan root direktori berbasis Git
  ),
}
}




lspconfig.cssls.setup {
  on_attach = function(client, bufnr)
    -- Fungsi untuk mengatur keymap untuk buffer
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    -- Keymaps dasar untuk navigasi dan aksi umum
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>f', '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)

    -- Auto-format on save jika server mendukung document formatting
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false })]]
    end

    -- Menampilkan diagnostics di hover
    vim.cmd [[
      autocmd CursorHold <buffer> lua vim.diagnostic.open_float(nil, { focusable = false })
    ]]

    -- Tailwind CSS Autocompletion
    vim.cmd [[
      autocmd BufRead,BufNewFile *.html,*.css,*.scss,*.js lua require('cmp').setup.buffer { sources = { { name = 'nvim_lsp' }, { name = 'path' }, { name = 'buffer' }, { name = 'emoji' } } }
    ]]
  end,

  on_init = function(client)
    print("CSS LSP with Tailwind CSS and Sass initialized!")
  end,

  capabilities = require('cmp_nvim_lsp').default_capabilities(),  -- Integrasi dengan nvim-cmp untuk auto-completion

  settings = {
    css = {
      validate = true,  -- Aktifkan validasi untuk CSS
      lint = { 
        'css', 'scss', 'less', 'sass'  -- Mendukung linting untuk berbagai format CSS
      },
      properties = true,  -- Dukungan untuk CSS Custom Properties
      color = true,  -- Untuk mendukung rekomendasi warna
      -- Menambahkan dukungan untuk CSS Grid, Flexbox dan lainnya
      grid = true,  -- Validasi dan saran terkait Grid CSS
      flexbox = true,  -- Validasi dan saran terkait Flexbox
    },

    scss = {
      validate = true,
      lint = true,
      -- Pengaturan tambahan untuk SCSS linting dan fungsionalitas
      includeLanguages = {
        scss = "scss",
        sass = "sass",
        less = "less",
        stylus = "stylus",
        postcss = "postcss",
        css = "css",
        html = "html",
        vue = "vue",
        javascript = "javascript",
        typescript = "typescript",
        svelte = "svelte",
        json = "json",
      },
      linting = {
        unknownAtRules = "ignore",  -- Mengabaikan aturan yang tidak dikenali
        unknownProperties = "ignore",  -- Mengabaikan properti yang tidak dikenali
        unknownMixins = "warning",  -- Memberikan peringatan jika mixin tidak dikenal
        unknownVariables = "warning",  -- Memberikan peringatan jika variabel tidak dikenal
      },
      -- Pengaturan untuk memeriksa kesalahan dalam deklarasi SCSS
      syntaxValidation = {
        invalidVariables = "error",  -- Menampilkan kesalahan untuk variabel yang tidak valid
        invalidMixins = "error",     -- Menampilkan kesalahan untuk mixins yang tidak valid
      },
    },  -- Validasi untuk SCSS
    sass = {
      validate = true,
      lint = true,
      linting = {
        unknownAtRules = "ignore",  -- Mengabaikan aturan yang tidak dikenali
        unknownProperties = "ignore",  -- Mengabaikan properti yang tidak dikenali
        unknownMixins = "warning",  -- Peringatan jika mixin tidak dikenal
        unknownVariables = "warning",  -- Peringatan jika variabel tidak dikenal
      },
      syntaxValidation = {
        invalidVariables = "error",  -- Menampilkan kesalahan untuk variabel yang tidak valid
        invalidMixins = "error",     -- Menampilkan kesalahan untuk mixins yang tidak valid
        invalidProperties = "error",  -- Menampilkan kesalahan untuk properti yang tidak valid  
        invalidAtRules = "error",  -- Menampilkan kesalahan untuk at-rule yang tidak valid
        invalidValues = "error",  -- Menampilkan kesalahan untuk nilai yang tidak valid       
        invalidImportStatement = "error",  -- Menampilkan kesalahan untuk statement import yang tidak valid

      },
    },  -- Validasi untuk SASS
    html = { 
      validate = true,  -- Validasi untuk HTML yang menggunakan CSS
      tagCompletion = true,  -- Menambahkan saran tag otomatis di HTML
      lint = {
        unknownTags = "warning",  -- Memberikan peringatan jika ada tag yang tidak dikenal
        unknownAttributes = "warning",  -- Memberikan peringatan jika ada atribut yang tidak dikenal
        invalidAttributes = "warning",  -- Memberikan peringatan jika ada atribut yang tidak valid
      },
    },

    tailwindCSS = {
      validate = true,
      experimental = {
        classRegex = {
          'tw`([^`]*)`',      -- Menangani tailwind yang ditulis dalam backticks
          'tw="([^"]*)"',     -- Menangani tailwind yang ditulis dalam atribut
          'tw=([a-zA-Z0-9-]*)', -- Mendeteksi Tailwind class dalam atribut HTML
        },
      },
      linting = {
        unknownClasses = "warning",  -- Memberikan peringatan jika ada class Tailwind yang tidak dikenal
        unknownProperties = "warning",  -- Memberikan peringatan jika ada property CSS yang tidak dikenal
        invalidProperties = "warning",  -- Memberikan peringatan jika ada property CSS yang tidak valid
        unknownAtRules = "warning",  -- Memberikan peringatan jika ada at-rule yang tidak dikenal
        invalidAtRules = "warning",  -- Memberikan peringatan jika ada at-rule yang tidak valid
        unknownFontFamilies = "warning",  -- Memberikan peringatan jika ada font-family yang tidak dikenal
        duplicateFontFamilies = "warning",  -- Memberikan peringatan jika ada duplikat font-family
        duplicateProperties = "warning",  -- Memberikan peringatan jika ada duplikat property CSS
        emptyRules = "warning",  -- Memberikan peringatan jika ada rule kosong
        emptyAtRules = "warning",  -- Memberikan peringatan jika ada at-rule kosong
        importStatement = "warning",  -- Memberikan peringatan jika ada statement import yang tidak valid
        boxModel = "warning",  -- Memberikan peringatan jika ada box-model yang tidak valid
        universalSelector = "warning",  -- Memberikan peringatan jika ada selector universal yang tidak valid
      },
    },

    -- Mengaktifkan dukungan untuk CSS yang lebih modern
    modernCssFeatures = {
      grid = true,  -- Mendukung fitur grid CSS
      flexbox = true,  -- Mendukung fitur flexbox CSS
      customProperties = true,  -- Mendukung CSS custom properties (variabel)
      animations = true,  -- Menambahkan dukungan animasi CSS
      variables = true,  -- Mendukung CSS variables
      calc = true,  -- Mendukung CSS calc
      units = true,  -- Mendukung CSS units
      mediaQueries = true,  -- Mendukung CSS media queries
      colorFunctions = true,  -- Mendukung CSS color functions
      nesting = true,  -- Mendukung CSS nesting
      pseudoElements = true,  -- Mendukung CSS pseudo elements
      combinators = true,  -- Mendukung CSS combinators
      atRules = true,  -- Mendukung CSS at rules
      atDirectives = true,  -- Mendukung CSS at directives
      selectors = true,  -- Mendukung CSS selectors
      properties = true,  -- Mendukung CSS properties
      values = true,  -- Mendukung CSS values
      syntax = true,  -- Mendukung CSS syntax
      vendorPrefixes = true,  -- Mendukung CSS vendor prefixes
    },

    -- Optimasi untuk mendeteksi dan memperbaiki masalah umum CSS
    linting = {
      unknownAtRules = "ignore",  -- Mengabaikan aturan yang tidak dikenal
      unknownProperties = "ignore",  -- Mengabaikan properti yang tidak dikenali
      unknownFontFamilies = "ignore",  -- Mengabaikan font-family yang tidak dikenali
      duplicateFontFamilies = "ignore",  -- Mengabaikan duplikat font-family
      duplicateProperties = "ignore",  -- Mengabaikan duplikat properti CSS
      emptyRules = "ignore",  -- Mengabaikan rule kosong
      emptyAtRules = "ignore",  -- Mengabaikan at-rule kosong
      importStatement = "ignore",  -- Mengabaikan statement import yang tidak valid
      boxModel = "ignore",  -- Mengabaikan box-model yang tidak valid
      universalSelector = "ignore",  -- Mengabaikan selector universal yang tidak valid
    },
  },
}



-- lspconfig.ltex.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   on_init = on_init,
--   settings = {
--     ltex = {
--       language = "en",  -- Bahasa yang digunakan untuk pemeriksaan tata bahasa, bisa diganti dengan bahasa lain (misalnya: "de" untuk Jerman, "fr" untuk Perancis)
--       diagnosticSeverity = {
--         -- Menentukan tingkat keparahan diagnostic error
--         ["grammar"] = "warning",  -- "error", "warning", atau "information"
--         ["spelling"] = "warning",
--         ["punctuation"] = "warning",
--       },
--       dictionary = {
--         -- Kata-kata khusus yang Anda ingin ltex mengenali
--         ["en"] = { "companyName", "specificTerm" }, -- Menambahkan kata atau frasa tertentu ke dalam kamus
--       },
--       userDefinedRules = {
--         -- Menentukan aturan tata bahasa kustom
--         {
--           pattern = "eg.",  -- Pattern atau kata yang diinginkan untuk aturan kustom
--           message = "Consider replacing 'eg.' with 'for example'.",  -- Pesan jika ditemukan
--           action = "replace",  -- Tindakan: "replace", "suggest", atau "ignore"
--         }
--       },
--       completion = {
--         enabled = true,  -- Mengaktifkan fitur saran kata
--         timeout = 300,   -- Waktu tunggu dalam milidetik untuk saran
--       },
--       ltex_lsp = {
--         enableAutoSave = true,   -- Mengaktifkan penyimpanan otomatis
--         enableLinting = true,    -- Menyalakan pemeriksaan tata bahasa
--       }
--     },
--   },
-- }
--

lspconfig.fortls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = on_init,
  settings = {
    fortls = {
      -- https://github.com/hansec/fortran-language-server/blob/master/docs/settings.md
      runtime = {
        -- The path to the fortls executable
        path = "fortls",
        -- The command line arguments passed to the fortls executable
        args = {},
        -- The environment variables passed to the fortls executable
        env = {},
      },
    },
  }
}


-- pyright
lspconfig.pylsp.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict", -- Mode pengecekan tipe yang ketat
        autoSearchPaths = true, -- Mendeteksi otomatis jalur file proyek
        diagnosticMode = "workspace", -- Analisis seluruh workspace untuk linting
        useLibraryCodeForTypes = true, -- Dukungan tipe untuk pustaka pihak ketiga
        logLevel = "Information", -- Level logging untuk debug
        autoImportCompletions = true, -- Saran impor otomatis
        stubPath = "typings", -- Folder untuk stub file .pyi
        reportMissingImports = true, -- Laporkan impor yang hilang
        reportUnusedImport = true, -- Laporkan impor yang tidak digunakan
        reportUnusedClass = true, -- Laporkan kelas yang tidak digunakan
        reportUnusedFunction = true, -- Laporkan fungsi yang tidak digunakan
        reportUnusedVariable = true, -- Laporkan variabel yang tidak digunakan
        runtimeTypeChecking = true, -- Menguji tipe runtime
        reportGeneralTypeIssues = true, -- Laporkan masalah tipe umum
        reportUnusedSelf = true, -- Laporkan self yang tidak digunakan
        reportUnusedFunctionArgs = true, -- Laporkan argumen fungsi yang tidak digunakan
        reportUnusedLoopVars = true, -- Laporkan variabel loop yang tidak digunakan
        reportUnusedLocals = true, -- Laporkan lokal yang tidak digunakan
        reportUnusedImports = true, -- Laporkan impor yan
      },
      venvPath = "~/.virtualenvs", -- Virtual environment path
      pythonPath = "/usr/bin/python3", -- Path interpreter Python utama
    },
    plugins = {
      -- Pyright untuk analisis tipe statis dan linting dasar
      pyright = {
        enable = true, -- Mengaktifkan plugin Pyright
      },
      -- Pylint untuk linting kode secara detail
      pylint = {
        enabled = true,
        args = { "--max-line-length=180", "--disable=C0111", "--enable=W,E" },
      },
      -- MyPy untuk tipe statis yang lebih kuat
      mypy = {
        enabled = true,
        live_mode = true,
        strict = true, -- Mode pemeriksaan tipe ketat
        additional_args = { "--ignore-missing-imports" },
      },
      -- Black untuk format otomatis
      black = {
        enabled = true,
        line_length = 88,
      },
      -- isort untuk pengurutan impor
      isort = {
        enabled = true,
        profile = "black",
        multi_line_output = 3, -- Multi-line output yang disesuaikan
        force_sort_within_sections = true,
      },
      -- Jedi untuk fitur lanjutan
      jedi = {
        enabled = true,
        completion = true, -- Penyelesaian otomatis
        hover = true, -- Informasi tooltip
        goto_definitions = true, -- "Go to definition"
        signatures = true, -- Penandatangan fungsi
        find_references = true, -- Temukan referensi
        rename = true, -- Fitur rename simbol
      },
      -- Flake8 untuk linting tambahan
      flake8 = {
        enabled = true,
        max_line_length = 88,
        ignore = { "E203", "W503" },
      },
      -- Integrasi Debugging
      debugpy = {
        enabled = true,
        host = "localhost",
        port = 5678, -- Port debugger
      },
      -- AI Model Integration (Custom Plugin)
      ai_assist = {
        enabled = true,
        model = "openai-chatgpt", -- Gunakan API OpenAI (jika tersedia)
        prompt_length = 4096,
        max_tokens = 1024,
        temperature = 0.8,
      },
    },
  },
  commands = {
    PyrightOrganizeImports = {
      function()
        vim.lsp.buf.execute_command({
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
        })
      end,
      description = "Organize Imports with Pyright",
    },
    PyrightRenameSymbol = {
      function()
        vim.lsp.buf.rename()
      end,
      description = "Rename symbol with Pyright",
    },
  },
})


--





lspconfig.tailwindcss.setup({
  -- Menambahkan filetypes yang digunakan oleh Tailwind CSS
  filetypes = {
    "css", "scss", "sass", "html", "javascript", "typescript", 
    "javascriptreact", "typescriptreact", "vue", "react", "blade", "php"
  },

  on_attach = function(client, bufnr)
    -- Keymaps untuk LSP
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    -- Menambahkan keymap untuk go-to-definition
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- Menambahkan keymap untuk hover
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- Menambahkan keymap untuk diagnostic
    buf_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

    -- Auto-format on save jika LSP mendukung document formatting
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
    end

    -- Enable hover for Tailwind CSS classes
    if client.server_capabilities.hoverProvider then
      buf_set_keymap('n', 'gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    end
  end,

  on_init = function(client)
    print("TailwindCSS LSP initialized!")
  end,

  capabilities = vim.lsp.protocol.make_client_capabilities(),

  flags = {
    debounce_text_changes = 150,  -- Mengatur waktu tunggu untuk perubahan teks
  },

  settings = {
    tailwindcss = {
      -- Mengaktifkan validasi untuk Tailwind CSS
      validate = true,
      lint = {
        -- Menambahkan pengaturan linting dengan tingkat kesalahan
        cssConflict = "warning",  -- Peringatan untuk konflik CSS
        invalidApply = "error",   -- Kesalahan jika ada 'apply' yang tidak valid
        invalidScreen = "error",  -- Kesalahan untuk layar yang tidak valid
        invalidVariant = "error", -- Kesalahan untuk varian yang tidak valid
        recommendedVariantOrder = true,  -- Mengurutkan varian sesuai dengan rekomendasi
      },
      completion = {
        -- Menambahkan penyelesaian otomatis untuk kelas Tailwind
        enable = true,
        suggestClassKey = "class",  -- Menyelesaikan berdasarkan kelas CSS
      },
      autofix = true,  -- Mengaktifkan autofix untuk kesalahan yang dapat diperbaiki
      -- Menambahkan pengaturan untuk snippet dan dokumentasi
      snippet = {
        enable = true,
        typescript = {
          enable = true
        },
        javascript = {
          enable = true
        },
      },
      hover = {
        enable = true,  -- Mengaktifkan hover untuk penjelasan kelas
      },
    },
  },

  -- Menambahkan fitur diagnostics tambahan
  diagnostics = {
    enable = true,
    virtual_text = true,  -- Menampilkan teks virtual untuk error/diagnostic
    signs = true,  -- Menampilkan tanda untuk error
    underline = true,  -- Menyediakan underline untuk error
    update_in_insert = true,  -- Update diagnostics saat mode insert
  },
})




lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      inlayHints = {
        bindingModeHints = {
          enable = false,
        },
        chainingHints = {
          enable = true,
        },
        closingBraceHints = {
          enable = true,
          minLines = 25,
        },
        closureReturnTypeHints = {
          enable = "never",
        },
        lifetimeElisionHints = {
          enable = "never",
          useParameterNames = false,
        },
        maxLength = 25,
        parameterHints = {
          enable = true,
        },
        reborrowHints = {
          enable = "never",
        },
        renderColons = true,
        typeHints = {
          enable = true,
          hideClosureInitialization = false,
          hideNamedConstructor = false,
        },
      },
    }
  }
})

require('lspconfig').clangd.setup({
    on_attach = function(client, bufnr)
        -- Fungsi untuk mengatur keymaps atau pengaturan lain
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap = true, silent = true }

        -- Auto-format saat menyimpan jika didukung oleh LSP
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
        end
    end,

    on_init = function(client)
        print("Clangd LSP initialized!")
    end,

    capabilities = vim.lsp.protocol.make_client_capabilities(),

    flags = {
        debounce_text_changes = 150, -- Mengatur waktu tunggu untuk perubahan teks
    },

    settings = {
        ["clangd"] = {
            arguments = {
                "--clang-tidy",                -- Mengaktifkan clang-tidy untuk analisis statis
                "--enable-config",            -- Mendukung file konfigurasi .clangd
                "--completion-style=detailed", -- Menampilkan detail yang lebih lengkap saat auto-complete
                "--background-index",          -- Mengindeks file di latar belakang
                "--fallback-style=llvm",       -- Gaya fallback untuk format kode
            },
            fallbackFlags = { 
                "-std=c++20", "-Wall", "-Wextra", "-Wpedantic", "-DDEBUG" 
            }, -- Tambahan flag untuk proyek default
        },
    },
})






-- Menggunakan on_attach dalam konfigurasi LSP
lspconfig.lua_ls.setup {
  on_attach = on_attach, -- Memastikan hanya 2 parameter yang diteruskan ke on_attach
  capabilities = capabilities,
  settings = {
    Lua = {
      hint = {
        enable = true,
        arrayIndex = "Disable",
        setType = true,
        paramType = true,
      },
      diagnostics = {
        enable = true,
        globals = { "vim", "use" },
        severity = {
          unusedLocal = "warn",
          undefinedGlobal = "error",
          undefinedMethod = "info",
          undefinedField = "info",
        },
      },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
        },
      },
      completion = {
        enable = true,
        keywordSnippet = "Both",
        preselect = "Item",
        callSnippet = "Both",
      },
      formatting = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = 2,
          tab_size = 2,
        },
        formatOnSave = true,
      },
      telemetry = {
        enable = true,
        enableTelemetry = true,
        enablePrompt = true,
              },
      debug = {
        enable = true,
        showLogs = true,
        loggingLevel = "trace",
      },
      cache = {
        enable = true,
        directory = vim.fn.stdpath("cache") .. "/lua_ls_cache",
        maxFileSize = 10 * 1024 * 1024,
      },
      commands = {
        CleanCache = {
          description = "Clean Lua LS cache",
          command = "lua require('lspconfig').lua_ls.clean_cache()",
        },
        RefreshSymbols = {
          description = "Refresh Lua LS symbols",
          command = "lua vim.lsp.buf.request(0, 'workspace/executeCommand', { command = 'workspace/symbol', arguments = {} })",
        },
      },
    },
  },

  on_init = function(client)
    print("Lua LS Initialized!")
  end,
}





lspconfig.ts_ls.setup {
  on_attach = on_attach,  -- Fungsi yang mengonfigurasi keybindings dan pengaturan lainnya
  capabilities = capabilities,  -- Kemampuan untuk mendukung autocompletion, dll.
  on_init = on_init,  -- Fungsi untuk menginisialisasi server
  settings = {
    javascript = {
      validate = true,
      format = {
        enable = true,
        defaultFormatter = "prettier",  -- Gunakan Prettier untuk format kode
        wrapLineLength = 120,  -- Panjang garis maksimal
      },
      suggest = {
        enable = true,
        autoImports = true,  -- Aktifkan auto-import
        includeCompletionsForModuleExports = true,  -- Saran untuk ekspor modul
        showDocumentation = true,  -- Tampilkan dokumentasi saat hover
        completeFunctionCalls = true,  -- Lengkapi panggilan fungsi secara otomatis
        includeCompletionsWithSnippetText = true,  -- Gunakan snippet saat memberikan saran
      },
      diagnostics = {
        enable = true,
        lint = {
          enable = true,  -- Aktifkan linting untuk JavaScript
          rule = "all",  -- Terapkan semua aturan linting
        },
      },
    },
    typescript = {
      validate = true,
      format = {
        enable = true,
        defaultFormatter = "prettier",  -- Gunakan Prettier untuk format kode
        wrapLineLength = 120,  -- Panjang garis maksimal
      },
      suggest = {
        enable = true,
        autoImports = true,  -- Aktifkan auto-import untuk TypeScript
        includeCompletionsForModuleExports = true,  -- Saran ekspor modul TypeScript
        completeFunctionCalls = true,  -- Lengkapi panggilan fungsi secara otomatis
        includeCompletionsWithSnippetText = true,  -- Gunakan snippet saat memberikan saran
      },
      diagnostics = {
        enable = true,
        lint = {
          enable = true,
          rule = "all",  -- Terapkan semua aturan linting di TypeScript
        },
      },
    },
    python = {
      enable = true,
      linting = {
        enable = true,
        pyflakes = true,  -- Gunakan Pyflakes untuk linting
        pylint = true,  -- Gunakan Pylint untuk linting
        flake8 = true,  -- Gunakan Flake8 untuk linting
      },
      formatting = {
        provider = "black",  -- Gunakan Black untuk format otomatis
      },
      diagnostics = {
        enable = true,
        lint = {
          enable = true,  -- Aktifkan linting di Python
        },
      },
      suggest = {
        enable = true,
        autoImports = true,  -- Aktifkan auto-import untuk Python
        completeFunctionCalls = true,  -- Lengkapi panggilan fungsi secara otomatis
      },
    },
    java = {
      enable = true,
      format = {
        enable = true,
        defaultFormatter = "google-java-format",  -- Gunakan Google Java Format untuk format otomatis
      },
      diagnostics = {
        enable = true,  -- Aktifkan diagnostik di Java
      },
      completion = {
        enable = true,
        autoInsert = true,  -- Auto-insert completions
        completeFunctionCalls = true,  -- Lengkapi panggilan fungsi secara otomatis
      },
      suggest = {
        enable = true,
        autoImports = true,  -- Aktifkan auto-import untuk Java
        includeCompletionsForModuleExports = true,  -- Saran ekspor modul Java
        completeFunctionCalls = true,  -- Lengkapi panggilan fungsi Java secara otomatis
      },
    },
  },

  -- Pengaturan untuk debugging di Neovim
  debug = {
    enable = true,
    logLevel = "debug",  -- Tingkat log debugging
    runInTerminal = true,  -- Jalankan debug di terminal
    console = "integratedTerminal",  -- Gunakan terminal terintegrasi
  },

  -- Penambahan fungsionalitas canggih seperti navigasi kode
  keymaps = {
    ["gd"] = vim.lsp.buf.definition,  -- Navigasi ke definisi
    ["gr"] = vim.lsp.buf.references,  -- Temukan referensi
    ["K"] = vim.lsp.buf.hover,  -- Tampilkan dokumentasi saat hover
    ["gi"] = vim.lsp.buf.implementation,  -- Navigasi ke implementasi
    ["<C-k>"] = vim.lsp.buf.signature_help,  -- Tampilkan bantuan tanda tangan
    ["<C-space>"] = vim.lsp.buf.completion,  -- Trigger completion secara manual
  },

  -- Pengaturan untuk auto-completion dan snippet
  completion = {
    enable = true,
    autocomplete = true,  -- Aktifkan autocomplete saat mengetik
    keyword_length = 1,  -- Saran muncul setelah 1 karakter
    snippetSupport = true,  -- Mendukung snippet
    triggerCharacters = { ".", ":", "(", "[" },  -- Karakter trigger untuk saran otomatis
    preselect = true,  -- Pilih item pertama dalam daftar saran secara otomatis
    maxItems = 20,  -- Batasi jumlah saran yang ditampilkan
    completeFunctionCalls = true,  -- Lengkapi panggilan fungsi secara otomatis
    showSignature = true,  -- Tampilkan signature fungsi saat menyelesaikan panggilan fungsi
    showDocumentation = true,  -- Tampilkan dokumentasi saat hover
  },

  -- Menambahkan integrasi dengan AI (misalnya menggunakan model AI untuk kode)
  ai_integration = {
    enable = true,
    python_ai = true,  -- Integrasi dengan AI menggunakan Python (misalnya untuk analisis kode)
    java_ai = true,  -- Integrasi dengan AI menggunakan Java (misalnya untuk optimasi atau prediksi kode)
    model = "gpt-3.5-turbo",  -- Pilih model AI yang digunakan
    endpoint = "http://localhost:5000",  -- URL endpoint untuk server AI (misalnya server lokal yang menjalankan model)
    code_suggestions = true,  -- Aktifkan saran kode berbasis AI
    code_refactoring = true,  -- Aktifkan refactoring kode berbasis AI
  },

  -- Pengaturan tambahan untuk meningkatkan produktivitas pengkodean
  linting = {
    enable = true,
    lint_on_save = true,  -- Lakukan linting otomatis saat file disimpan
    lint_on_type = true,  -- Lakukan linting otomatis saat mengetik
  },

  -- Refactoring otomatis dan fitur lainnya
  refactor = {
    enable = true,
    rename = true,  -- Aktifkan refactoring untuk merename variabel dan fungsi
    extract_method = true,  -- Aktifkan ekstraksi metode untuk refactoring
    extract_variable = true,  -- Aktifkan ekstraksi variabel untuk refactoring
  },
}


lspconfig.bashls.setup {
  -- Menentukan perintah untuk memulai bash-language-server
  cmd = { "bash-language-server", "start" },

  -- Menentukan tipe file yang akan dilayani oleh bashls
  filetypes = { "bash", "sh", "zsh", "env" },

  -- Menentukan root directory dari proyek berdasarkan file konfigurasi yang ada
  root_dir = lspconfig.util.root_pattern('.git', '.bashrc', '.bash_profile', '.profile', '.zshrc', '.env'),

  settings = {
    bash = {
      -- Mengaktifkan penggunaan globbing dalam skrip
      glob = true,

      -- Memeriksa kode keluar untuk memastikan tidak ada kesalahan pada skrip
      checkExitCode = true,

      -- Mengizinkan tambahan teks edit dalam file yang terbuka
      additionalTextEdits = true,

      -- Aktifkan highlight semantik pada kode
      semanticHighlighting = true,

      -- Urutkan hasil autocompletion secara default
      sortCompletion = true,

      -- Selesaikan panggilan fungsi dengan menambahkan tanda kurung
      completeFunctionCalls = true,

      -- Menampilkan informasi kesalahan atau peringatan pada setiap perubahan dalam kode
      diagnostics = {
        enable = true,  -- Mengaktifkan pemeriksaan kesalahan
        severity = "warning",  -- Menampilkan peringatan sebagai diagnosa
      },

      -- Menambahkan fitur autocomplete yang lebih canggih untuk variabel dan fungsi
      completion = {
        enable = true,  -- Mengaktifkan autocompletion
        showFunctionParameters = true,  -- Menampilkan parameter fungsi saat autocomplete
      },

      -- Mengaktifkan highlight pada bagian-bagian kode (misalnya variabel, fungsi, dll.)
      highlight = {
        enable = true,  -- Mengaktifkan syntax highlighting untuk Bash
        -- Periksa kembali apakah 'additionalLanguages' didukung oleh bashls atau tidak
        additionalLanguages = {"sh", "zsh", "bash"},  -- Mengizinkan highlight untuk shell lainnya
      },

      -- Fitur hover yang memberikan penjelasan mengenai variabel atau fungsi saat kursor diarahkan
      hover = {
        enable = true,  -- Mengaktifkan hover
        showDocumentation = true,  -- Menampilkan dokumentasi pada hover
      },

      -- Menyediakan saran perbaikan kode dan tindakan lainnya seperti reformatting
      codeActions = {
        enable = true,  -- Mengaktifkan aksi kode seperti refaktorasi dan perbaikan otomatis
        source = true,  -- Menampilkan aksi kode dari sumber eksternal jika ada
      },
    }
  }  -- Perbaiki penutupan di sini
}


-- LSP configuration for Groovy in Neovim with Gradle integration for the "Emelyn" project

require('lspconfig').groovyls.setup({
  on_attach = on_attach,  -- Attach the LSP client to the buffer
  capabilities = capabilities,  -- Specify the capabilities for the LSP client
  on_init = on_init,  -- Run any initialization logic when the LSP is initialized
  settings = {
    groovy = {
      -- Code formatting settings
      format = {
        enabled = true,  -- Enable automatic formatting when saving or triggering
        autoCorrect = true,  -- Enable automatic corrections to improve formatting
        style = "google",  -- Use Google's code style for formatting (could be "eclipse", "intellij", etc.)
        indentation = 2,  -- Set indentation to 2 spaces for consistency
      },
      
      -- Code completion settings (auto-imports and import order)
      completion = {
        autoImports = true,  -- Enable automatic imports (Groovy-specific)
        importOrder = {  -- Define the order of imports (e.g., Java imports first, then Groovy)
          "java",
          "javax",
          "scala",
          "groovy",
          "org",
          "com",
          "",
        },
      },
      
      -- Linting configuration (catching errors and warnings)
      linting = {
        enabled = true,  -- Enable linting to detect syntax and logical errors
        lintOnSave = true,  -- Perform linting when saving the file
        lintLevel = "error",  -- Set the lint level to 'error' for serious issues (can also use "warning" or "info")
        rules = {
          groovy = "warning",  -- Show warnings for Groovy-specific issues
          java = "error",  -- Show errors for Java-related issues
          unused = "error",  -- Flag unused variables or imports as errors
        },
      },
      
      -- Profiling configuration (helpful for performance analysis)
      profiling = {
        enabled = true,  -- Enable profiling for performance insights
        jvmArguments = {  -- JVM arguments to control profiling output
          "-Xprof",  -- Enable basic profiling to analyze method calls and performance
          "-XX:+PrintGCDetails",  -- Print detailed garbage collection logs
          "-XX:+PrintGCDateStamps",  -- Include timestamps in garbage collection logs
        },
      },
      
      -- Gradle configuration for building and managing dependencies in the "Emelyn" project
      gradle = {
        enabled = true,  -- Enable Gradle integration
        gradleWrapperPath = "./gradlew",  -- Path to the Gradle wrapper script (ensures consistency across environments)
        gradleVersion = "8.12",  -- Specify the version of Gradle to use (this helps with compatibility)
        jvmArguments = {  -- JVM arguments specific to Gradle
          "-Xmx2g",  -- Set the maximum heap size to 2 GB for Gradle
          "-Xms512m",  -- Set the initial heap size to 512 MB for Gradle
          "-XX:+UseParallelGC",  -- Enable parallel garbage collection for better performance
          "-Dsun.zip.disableMemoryMapping=true",  -- Disable memory-mapped IO for ZIP files (can speed up builds)
        },
        arguments = {  -- Additional Gradle arguments for controlling build behavior
          "--no-build-cache",  -- Disable Gradle's build cache (helps ensure clean builds)
          "--no-configuration-cache",  -- Disable Gradle's configuration cache (helps in debugging issues)
          "--no-daemon",  -- Run Gradle without the background daemon to ensure a fresh process each time
          "--parallel",  -- Enable parallel task execution for faster builds
        },
        dependencies = {  -- List of project dependencies needed for the build
          additionalDependencies = {
            "org.codehaus.groovy:groovy-all:3.0.9",  -- Groovy core dependency
            "org.springframework.boot:spring-boot-starter-web:2.4.0",  -- Spring Boot starter for web applications
            "com.fasterxml.jackson.core:jackson-databind:2.12.0",  -- Jackson library for JSON processing
            "org.apache.commons:commons-lang3:3.12.0",  -- Common utility functions
            "org.spockframework:spock-core:2.0-groovy-3.0",  -- Spock for unit testing (Groovy-specific testing framework)
            "org.junit.jupiter:junit-jupiter-api:5.7.0",  -- JUnit for unit testing (Java testing framework)
          },
        },
        repositories = {  -- Repositories from which to fetch dependencies
          mavenCentral = true,  -- Use Maven Central for public dependencies
          jcenter = true,  -- Include JCenter for additional dependencies
          customRepos = {
            "https://repo.maven.apache.org/maven2",  -- Custom Maven repository for additional dependencies
            "https://jcenter.bintray.com",  -- Another custom repository
          },
        },
        buildTasks = {  -- Tasks for Gradle to handle specific actions
          compileGroovy = "compileGroovy",  -- Gradle task for compiling Groovy code
          compileJava = "compileJava",  -- Gradle task for compiling Java code (if you have mixed projects)
          runTests = "test",  -- Task to run unit tests
          buildJar = "jar",  -- Task to build the final JAR file for your project
        },
        taskConfiguration = {  -- Configure custom Gradle tasks and publishing steps
          customTask = {
            name = "deploy",  -- Name of your custom task (e.g., for deployment)
            arguments = {"--deployTo=prod", "--no-cache"},  -- Arguments for deployment task
          },
          publishToMaven = {
            name = "publishToMavenLocal",  -- Publish the project to the local Maven repository
            arguments = {"--skipTests"},  -- Skip running tests during publishing (can speed up the process)
          },
        },
      },
      
      -- Multi-module project support configuration
      multiModule = {
        enabled = true,  -- Enable multi-module support in Gradle (for larger projects)
        rootProjectName = "emelyn",  -- Set the name of your root project
        moduleDirectories = {  -- Define directories for different project modules
          "modules",  -- Specify where the modules are located (relative to the root project)
        },
      },
      
      -- Logging configuration for better build insights
      logging = {
        level = "info",  -- Set logging level to 'info' (can be 'debug', 'warn', or 'error')
        file = "./build/logs/gradle.log",  -- Define log file path for easier debugging
      },
      
      -- Output redirection settings (to manage where output gets saved)
      output = {
        redirectToFile = true,  -- Redirect Gradle build output to a file
        outputPath = "./build/output",  -- Path for the output build artifacts
      },
      
      -- Advanced settings for performance and build optimizations
      advancedSettings = {
        gradleDaemon = true,  -- Enable Gradle daemon for faster builds (runs in the background)
        parallelExecution = true,  -- Run tasks in parallel to speed up the build process
        continueOnFailure = false,  -- Stop the build if a task fails (set to true to continue after failures)
        profileTaskExecution = true,  -- Enable task profiling to measure execution times of each task
      },
    },
  },
})

-- Add features for better Groovy development:
lspconfig.groovyls.setup({
  on_attach = function(client, bufnr)
    -- Example action on LSP attach: Show documentation on hover
    vim.cmd('au CursorHold <buffer> lua vim.lsp.buf.hover()')  -- Show hover information (e.g., function docs)
  end,
  capabilities = capabilities,
  on_init = function(client)
    -- Initialization logic when the LSP is started
    print("Groovy LSP initialized for Emelyn project")
  end,
  settings = {
    groovy = {
      -- Additional Groovy-specific features for better coding experience
      format = {
        enabled = true,
        autoCorrect = true,
        style = "google",
        indentation = 2,
        endOfLine = "lf",
        insertFinalNewline = true,
        trimTrailingWhitespace = true,
        trimFinalNewlines = true,
      },
      completion = {
        autoImports = true,
        importOrder = { "java", "javax", "scala", "groovy", "org", "com", "" },
        classRegex = "^([A-Z][a-zA-Z0-9]*)$",
        enumRegex = "^([A-Z][a-zA-Z0-9]*)$",
        fieldRegex = "^([a-z][a-zA-Z0-9]*)$",
        methodRegex = "^([a-z][a-zA-Z0-9]*)$",
        interfaceRegex = "^([A-Z][a-zA-Z0-9]*)$",
      },
      linting = {
        enabled = true,
        autoFix = true,
        autoFixOnSave = true,
        autoFixSeverity = "error",
        lintOnSave = true,
        lintLevel = "error",
        rules = {
          groovy = "warning",
          java = "error",
          unused = "error",
        },
      },
      profiling = {
        enabled = true,
        jvmArguments = {
          "-Xprof",
          "-XX:+PrintGCDetails",
          "-XX:+PrintGCDateStamps",
          "-XX:+UseParallelGC",
          "-Dsun.zip.disableMemoryMapping=true",
          "-Djava.ext.dirs=workspaceFolder/lib",
          "-Dfile.encoding=UTF-8",
          "-Duser.language=en",
          "-Duser.country=US",
          "-Djava.awt.headless=true",
        },
      },
    },
  },
})


