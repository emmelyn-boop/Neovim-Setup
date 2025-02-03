# 🚀 **Welcome to My Neovim Configuration!**

Are you a beginner just starting to learn to code, or a college student looking to improve your development workflow? **Neovim** is specifically designed to maximize your efficiency in a fast, intuitive, and customizable way.

With this configuration, Neovim acts like a very lightweight, yet very powerful **IDE**! This setup allows you to code like a pro, without the need for heavy equipment or complicated settings. Ideal for **AI model** development, **web development**, or even **a big project** that you are working on.

With this configuration, you not only get an IDE-like experience, but also full control over Neovim's settings that can be customized to your needs, making Neovim an excellent choice for both beginners and those looking to improve their coding productivity.

---

### 🔧 **What's Included?**

This configuration is perfect for developers who want a no-nonsense editor with powerful features. Here’s a quick overview of the features:

---

### 🎨 **Enhancements for Tailwind CSS & Sass**

- **Auto-completion** for utility classes in Tailwind CSS.
- **Linting** and validation for Sass/SCSS.
- Tailwind-specific regex patterns in HTML and backticks.

With Tailwind CSS, building modern web UIs is incredibly fast, and Neovim makes sure you always use the right utility classes.

---

### ⚡ **Auto-formatting & Linting**

- Auto-formatting when saving files using LSP’s **formatting** feature.
- **Linting** is active for **CSS, SCSS, SASS, HTML, JavaScript**, and **TypeScript**.
- Custom linting settings to warn or ignore specific errors.

This ensures your code is always clean and compliant with best practices.

---

### 🛠️ **Advanced Web Development Features**

- Supports **CSS Grid, Flexbox**, and **Custom Properties**.
- **Linting** and **formatting** **JavaScript/TypeScript** using **ESLint** integration.
- **Auto-suggestion** for **Tailwind CSS** utility classes directly in **HTML** and **JSX**.
- **Vue.js, React.js**, and **Next.js** support for modern web application development.

With these features, you will create dynamic, high-performance, and easy-to-maintain web applications.

---

### 🧳 **SuperMaven: AI Copilot** -> [SuperMaven](https://supermaven.com/)

SuperMaven is an **AI assistant** designed to help developers increase productivity with **automation of development tasks** and **intelligent suggestions**.

SuperMaven's main features include:
- **Development Task Automation**: Code improvement, refactoring, and optimization suggestions.
- **Smart Code Assist**: Contextual suggestions based on the code being written.
- **Automatic Bug and Error Detection**: Reduce errors and bugs in your code.

---

### 🧠 **Sourcery** -> [Sourcery](https://sourcery.ai/)

Sourcery is an automated refactoring tool that improves the quality of your code with **AI**-based suggestions and optimizations.

Sourcery's main features:
- **Automatic Refactoring**: Become more efficient, clean, and readable.
- **AI-Powered Code Optimization**: Help your code be more optimized and bug-free.

---

### ⚡ **Quick Tips**

- Hover over a function, method, or variable by pressing `K` to see inline documentation.
- Press `<leader>f` (usually \f) to **auto-format** your file.

- Navigate errors with `]d` / `[d` or jump to function definition with `gd`.
- Press `<leader>ca` for code actions like **refactor** or **fix**.

---

### 🧳 **Other Feature Integrations**

- **Wakatime**: Monitor your productivity.
- **Discord Presence**: Show status in Discord.
- **Minty**: More consistent themes and colors.
- **Neogit**: Manage **Git** directly in Neovim.
- **Neotest**: Test code directly from Neovim.

---

### 🧳 **MySQL & Database Support**

- **Autocompletion** and **linting** for **SQL** scripts.
- Setup connections for **MySQL, PostgreSQL**, and **SQLite** directly in Neovim.

  ### 💡 **Database Configuration**

To configure a database connection in Neovim:

```lua
connections = {
{
driver = "mysql", -- Replace with "postgresql" or "sqlite" if using another database type
name = "MySQL-Connection",
user = "", -- Username to login to the database
password = "", -- Password for the connection
host = "localhost", -- Database host, usually "localhost"
port = 3306, -- Port used by MySQL (default: 3306)
charset = "utf8mb4", -- Charset for MySQL (utf8mb4 supports more international characters)
timeout = 30, -- Timeout time for the connection (in seconds)
},
{
driver = "postgresql", -- For PostgreSQL, change the driver to "postgresql"
name = "PostgreSQL-Connection",
user = "", -- Username to login to PostgreSQL
password = "", -- Password for PostgreSQL connection
host = "localhost",
port = 5432,
sslmode = "require", -- If PostgreSQL requires SSL, set sslmode to "require"
timezone = "Asia/Jakarta", -- Set timezone if needed
},
{
driver = "sqlite", -- For SQLite, change driver to "sqlite"
name = "SQLite-Connection",
file = "/path/to/database.db", -- SQLite file location
timeout = 10, -- Timeout for SQLite
}
},
```

---

### 🎯 **JDTLS Specific Features**

- **Automatic Build Configuration** for Java, Python, Ruby, TypeScript, etc.
- **Multiple JDK Version Support**: Adapts to the project (Java 17, 21, 23, etc.).
- **Real-time Function Signature Assistance**.
- **Automatic Code Format** with format profiles like Eclipse or Sun.
- **Maven and Gradle Management** for Java source and documentation downloads.
- **Code Diagnostics and Enhancement**: Error warnings and fix recommendations.
- **Debugging Integration**: Debugging support in Neovim.
- **AI and Machine Learning Development** with **DeepLearning4J**, **TensorFlow**, and **H2O.ai** libraries.
- **Web Development Integration** with SpringBoot, Quarkus, HTML, CSS, JavaScript, and TypeScript.

---

### 🚧 **AI DeepSeek** - Coming Soon! 🍻

**AI DeepSeek** integration for smart suggestions and


code optimization in Neovim.

---

### 🧑‍💻 **Neovim Settings**

1. **Clone Repo**.
2. Run **MasonInstallAll** in Neovim.
3. Start **coding**!

---

### 🧳 **Additional Extensions and Plugins**

- **Neogit**: Git directly in Neovim.
- **Tree-sitter**: Advanced syntax highlighting.
- **Telescope**: Search for files, buffers, etc.
- **Diagnostic Inlines**

---
