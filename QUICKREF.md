# 建行学习课程观看工具 - 快速参考

## 🚀 快速开始（首次使用）

### 1. 安装工具
```bash
bash ~/.agents/skills/ccb-course-watcher/install.sh
```

### 2. 设置账号密码
```bash
export CCB_USERNAME="your_username"
export CCB_PASSWORD="your_password"
```

### 3. 开始使用
```
告诉Claude："帮我看完这个课程包：https://u.ccb.com/workshop/#/myworkshop/detail?id=xxx"
```

---

## 🔐 账号密码配置

### 设置
```bash
export CCB_USERNAME="your_username"
export CCB_PASSWORD="your_password"
```

### 查看当前配置
```bash
echo "用户名: $CCB_USERNAME"
echo "密码已设置: $([ -n "$CCB_PASSWORD" ] && echo "是" || echo "否")"
```

### 更新密码
```bash
export CCB_PASSWORD="NewPassword"
```

### 清除配置
```bash
unset CCB_USERNAME
unset CCB_PASSWORD
# 关闭终端后自动清除
```

---

## 📝 使用命令

### 观看课程包
```
“帮我看完这个课程包：[URL]”
```

### 观看单个视频
```
“帮我看完这个视频：[URL]”
```

### 查看进度
```
“看了几个了？”
```

---

## ❓ 常见问题

| 问题 | 解决 |
|------|------|
| 账号密码未设置 | 重新运行 `export CCB_USERNAME="xxx"` |
| agent-browser未安装 | `npm install -g agent-browser` |
| 密码错误 | 重新设置 `export CCB_PASSWORD="新密码"` |
| 关闭终端后忘密码 | 重新设置，不保存到文件 |

---

## 🔒 安全承诺

- ✅ 账号密码不保存到任何文件
- ✅ 终端关闭后自动清除
- ✅ 仅用于建行学习平台
- ✅ 不发送到其他网络

---

## 📂 文件位置

| 文件 | 路径 |
|------|------|
| Skill主文件 | `~/.agents/skills/ccb-course-watcher/SKILL.md` |
| 使用说明 | `~/.agents/skills/ccb-course-watcher/README.md` |
| 安装脚本 | `~/.agents/skills/ccb-course-watcher/install.sh` |
| 快速参考 | `~/.agents/skills/ccb-course-watcher/QUICKREF.md` |

---

## 📞 帮助

详细说明请查看：`README.md`

---

**Skill Creator**: 何老师
