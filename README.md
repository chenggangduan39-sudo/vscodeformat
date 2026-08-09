# VS Code C/C++ 格式化配置

这里保存的是当前 Linux VS Code 使用的 C/C++ 格式化风格，可用于 Windows、Linux 和 macOS。

## 文件说明

- `settings.json`：可合并到 VS Code 用户配置中，完整保留当前的 C/C++ 格式化设置。
- `.clang-format`：同一套规则的标准 clang-format 配置，适合复制到具体项目并提交到 Git。

## 在 Windows VS Code 中使用

1. 安装 Microsoft C/C++ 扩展 `ms-vscode.cpptools`。
2. 在 VS Code 中按 `Ctrl+Shift+P`，运行 `Preferences: Open User Settings (JSON)`。
3. 将本仓库 `settings.json` 中的配置项合并到打开的用户配置，不要直接覆盖其中已有且仍需保留的配置。

Windows 用户配置通常位于：

```text
%APPDATA%\Code\User\settings.json
```

## 在项目中统一格式

将 `.clang-format` 复制到 C/C++ 项目的根目录。若希望 VS Code 明确读取该文件，把用户或项目设置中的：

```json
"C_Cpp.clang_format_style": "file"
```

项目内的 `.vscode/settings.json`、工作区设置或语言专用设置可能覆盖用户设置，应同时检查这些位置。

若需要不同操作系统保存出相同的换行符，还可在 VS Code 设置中加入：

```json
"files.eol": "\n"
```

这一项不在原始配置中，因此没有放入 `settings.json`。
