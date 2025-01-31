local options = {
formatters_by_ft = {
    lua = { "stylua", "luarocks" }, -- Added luarocks for Lua formatting with additional checks
    python = { "ruff", "black" }, -- Adding black for Python automatic formatting
    go = { "gofumpt", "goimports" }, -- Added goimports to automatically organize imports
    golang = { "gofumpt", "goimports" }, -- Same for Golang
    css = { "prettier", "stylelint" }, -- Added stylelint for CSS linting
    html = { "prettier", "htmlhint" }, -- HTML hinting for better structure enforcement
    javascript = { "prettier", "eslint" }, -- Eslint for JavaScript linting and formatting
    typescript = { "prettier", "eslint" }, -- Same for TypeScript with eslint
    vue = { "prettier", "vetur" }, -- Vetur for Vue.js additional tooling
    svelte = { "prettier", "svelte-check" }, -- svelte-check for additional Svelte validation
    json = { "prettier", "jsonlint" }, -- jsonlint for JSON schema validation
    yaml = { "prettier", "yaml-lint" }, -- yaml-lint for better YAML file structure validation
    toml = { "prettier", "toml-linter" }, -- Added toml-linter for TOML validation
    markdown = { "prettier", "markdownlint" }, -- markdownlint for markdown file consistency
    rust = { "rustfmt", "clippy" }, -- clippy for Rust for more comprehensive linting
    javascriptreact = { "prettier", "eslint" }, -- Eslint for JSX
    typescriptreact = { "prettier", "eslint" }, -- Eslint for TypeScript React
    jdtls = { "google-java-format", "checkstyle" }, -- Added checkstyle for Java formatting and style enforcement


  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
