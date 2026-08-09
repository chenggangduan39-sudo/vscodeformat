# VS Code 跨平台编码环境

这是 2026-08-09 从当前 Linux VS Code 提取的可公开配置快照，目标是在 Windows、Linux 和 macOS 上尽量还原一致的编辑、C/C++ 高亮和格式化体验。仓库不包含账号、Token、工作区历史、缓存或机器标识。

## 快照内容

- `settings.json`：完整的用户级编辑与格式化偏好，并显式固定了原先由系统默认值决定的主题、图标、字体、行高、编码和换行符。
- `.clang-format`：当前内联 C/C++ 规则的标准 clang-format 版本。
- `extensions.txt`：当前已安装扩展及其版本，包括 C/C++ 扩展和简体中文语言包。
- `install-extensions.ps1`：Windows PowerShell 扩展安装脚本。
- `install-extensions.sh`：Linux/macOS 扩展安装脚本。
- `keybindings.json`：当前没有自定义快捷键，因此内容为空数组。
- `environment.json`：生成快照时的 VS Code、平台和外观信息。
- `argv.json`：脱敏后的简体中文界面语言设置。

当前没有用户代码片段和用户任务，因此仓库里没有 `snippets` 或 `tasks.json`。

## Windows 恢复

为获得最接近的字体效果，请先安装 `DejaVu Sans Mono`。同一种字体在 Windows ClearType 和 Linux FreeType 下仍可能有轻微的抗锯齿差异。

在 PowerShell 中进入本仓库后安装相同版本的扩展：

```powershell
.\install-extensions.ps1
```

在命令面板运行 `Configure Display Language` 并选择 `zh-cn`，即可还原当前简体中文界面。仓库的 `argv.json` 仅保留了这一项，没有上传本机的崩溃报告标识。

按 `Ctrl+Shift+P`，运行 `Preferences: Open User Settings (JSON)`，然后将本仓库 `settings.json` 的内容合并进去。若这是一台全新的 VS Code，也可以先备份再将文件复制到：

```text
%APPDATA%\Code\User\settings.json
```

快捷键文件的位置是：

```text
%APPDATA%\Code\User\keybindings.json
```

## Linux 恢复

安装扩展：

```bash
./install-extensions.sh
```

用户设置和快捷键通常位于：

```text
~/.config/Code/User/settings.json
~/.config/Code/User/keybindings.json
```

## 项目级格式统一

`settings.json` 内保留了当前 VS Code 使用的内联 clang-format 规则，直接复制用户设置即可生效。若希望 VS Code、命令行工具和团队成员都从项目读取同一份规则，可把 `.clang-format` 复制到项目根目录，并将设置改为：

```json
"C_Cpp.clang_format_style": "file"
```

## “完全一致”的边界

- 最严格还原应使用 `environment.json` 记录的相同 VS Code 版本，并由 `extensions.txt` 安装相同扩展版本；不同版本可能调整内置主题或语法规则。
- 项目内 `.vscode/settings.json`、多根工作区设置、`.clang-format`、远程 SSH/容器设置都可能覆盖用户设置。
- C/C++ 语义高亮还依赖编译器、头文件路径、宏和 `compile_commands.json`；这些属于具体项目，不能由一份全局配置安全地跨系统固定。
- 即使字体文件和字号相同，不同操作系统的字体渲染也可能存在少量像素差异。
