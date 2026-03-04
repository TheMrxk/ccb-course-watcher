# 建行学习课程观看工具 (ccb-course-watcher)

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Agent Skills](https://img.shields.io/badge/agent--skills-green.svg)](https://agentskills.io)

建行学习平台课程自动观看工具（2倍速），帮助你批量完成培训课程的学习任务。

## ✨ 特点

- 🚀 **2倍速加速** - 大幅节省学习时间
- 🔒 **账号安全** - 账号密码仅使用环境变量，不保存到文件
- 📦 **自动化** - 自动登录、自动观看、自动切换下一个视频
- 📊 **批量处理** - 支持课程包批量观看
- 🎯 **简单易用** - 一条命令即可使用

## 📦 安装

```bash
npx skills add https://github.com/your-name/ccb-course-watcher --skill ccb-course-watcher
```

## 🔐 配置

### 首次配置

```bash
export CCB_USERNAME="your_username"
export CCB_PASSWORD="your_password"
```

### 更新密码

```bash
export CCB_PASSWORD="NewPassword"
```

**重要**: 账号密码仅使用环境变量，不会保存到任何文件。关闭终端后自动清除。

## 🚀 使用

### 观看课程包（推荐）

```
"帮我看完这个课程包：https://u.ccb.com/workshop/#/myworkshop/detail?id=xxx"
```

### 观看单个视频

```
"帮我看完这个视频：https://u.ccb.com/course/#/play/xxx"
```

### 查看进度

```
"看了几个了？"
```

## 📋 前置要求

- Node.js
- npm

### 安装依赖

```bash
npm install -g agent-browser
agent-browser install
```

或者运行安装脚本：
```bash
npx ccb-course-watcher-install
```

## 📖 详细文档

详细使用说明请查看 skill 内的 `README.md`。

## 🔒 安全说明

| 安全特性 | 状态 |
|---------|------|
| 账号密码不写配置文件 | ✅ |
| 仅使用环境变量 | ✅ |
| 终端关闭后自动清除 | ✅ |
| 不保存到任何文件 | ✅ |
| 仅访问建行学习平台 | ✅ |

## ⚙️ 技术实现

- **浏览器自动化**: agent-browser
- **播放速度**: 2倍速 (video.playbackRate = 2.0)
- **自动化流程**: 两步点击（课程包 → 详情 → 视频）

## 📝 使用示例

### 示例1：批量观看培训课程

```bash
# 1. 配置账号（每次使用前）
export CCB_USERNAME="zhangsan.ln"
export CCB_PASSWORD="Password123"

# 2. 使用 skill
“帮我看完这个课程包：https://u.ccb.com/workshop/#/myworkshop/detail?id=xxx”

# 3. 等待完成（自动2倍速观看所有视频）
# ✅ 任务完成！共观看 11 个视频
```

### 示例2：观看单个视频

```bash
export CCB_USERNAME="zhangsan.ln"
export CCB_PASSWORD="Password123"

“帮我看完这个视频：https://u.ccb.com/course/#/play/xxx”
```

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 License

MIT License - 详见 [LICENSE](LICENSE) 文件

## 🙏 致谢

- Agent Skills 社区
- 建行学习平台

---

**Skill Creator**: 何老师
**关键词**: 建行学习, CCB培训, 课程观看, 2倍速
