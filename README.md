# 建行学习平台课程自动观看工具 (ccb-course-watcher)

一个用于批量完成建行学习平台培训课程学习的自动化工具。

**特点**：
- 🚀 2倍速加速观看，节省时间
- 🔒 账号密码绝对保密，使用环境变量
- 📦 自动处理课程包中所有视频
- ✨ 无需手动操作

---

## 📋 目录

- [安装说明](#安装说明)
- [账号密码配置](#账号密码配置)
- [使用方法](#使用方法)
- [更新密码](#更新密码)
- [常见问题](#常见问题)
- [安全说明](#安全说明)

---

## 📦 安装说明

### 前置要求

- Node.js (已安装)
- npm (已安装)
- 建行学习平台账号

### 安装步骤

**第一步：安装 agent-browser**

```bash
npm install -g agent-browser
```

**第二步：安装 Chromium 浏览器**

```bash
agent-browser install
```

这会下载 Chromium 浏览器（约300MB），仅第一次需要。

**第三步：复制 skill 到系统**

skill文件已安装在：
```
~/.agents/skills/ccb-course-watcher/
```

对于 OpenClaw / Claude 用户，此skill已自动关联，无需额外配置。

---

## 🔐 账号密码配置

### 首次配置（必须）

在使用本工具前，**必须**设置环境变量：

```bash
export CCB_USERNAME="your_username"
export CCB_PASSWORD="your_password"
```

**示例：**
```bash
export CCB_USERNAME="zhangsan.ln"
export CCB_PASSWORD="Password123"
```

### 验证配置

```bash
# 检查环境变量是否设置成功
echo "用户名: $CCB_USERNAME"
echo "密码: $CCB_PASSWORD"
```

应该显示你设置的账号和密码。

### 重置配置

如果设置错误或想重新配置，只需重新运行：

```bash
export CCB_USERNAME="new_username"
export CCB_PASSWORD="new_password"
```

---

## 🔄 更新密码

### 建行平台密码变更后

如果建行学习平台的密码变更，按以下步骤更新：

```bash
# 更新密码环境变量
export CCB_PASSWORD="NewPassword123"

# 验证
echo $CCB_PASSWORD

# 确认无误后即可使用
```

### 终端关闭后清除环境变量

关闭终端后，环境变量会自动清除。下次使用时需要重新设置：

```bash
# 每次打开新终端后，重新设置
export CCB_USERNAME="your_username"
export CCB_PASSWORD="your_password"
```

---

## 🚀 使用方法

### 场景1：观看课程包（推荐）

**步骤1：配置账号密码**
```bash
export CCB_USERNAME="your_username"
export CCB_PASSWORD="your_password"
```

**步骤2：告诉Claude**
```
“帮我看完这个课程包：https://u.ccb.com/workshop/#/myworkshop/detail?id=xxx”
```

工具会自动：
1. 登录建行学习平台
2. 打开课程包
3. 找到所有未完成的视频
4. 逐个2倍速观看
5. 完成后汇报

---

### 场景2：观看单个视频

**步骤1：配置账号密码**
```bash
export CCB_USERNAME="your_username"
export CCB_PASSWORD="your_password"
```

**步骤2：告诉Claude**
```
“帮我看完这个视频：https://u.ccb.com/course/#/play/xxx”
```

---

## 📝 完整示例

### 示例：批量观看培训课程

```bash
# 1. 打开终端
# 2. 设置环境变量
export CCB_USERNAME="zhangsan.ln"
export CCB_PASSWORD="Password123"

# 3. 验证配置
echo $CCB_USERNAME
echo $CCB_PASSWORD

# 4. 告诉Claude
“帮我看完这个课程包：https://u.ccb.com/workshop/#/myworkshop/detail?id=5ad2de09-232d-4793-b632-ebd72f4b264f”

# 5. Claude会自动执行，完成后汇报
# ✅ 任务完成！共观看 11 个视频
```

---

## ❓ 常见问题

### Q1: 提示环境变量未设置怎么办？

**A:** 重新设置环境变量：
```bash
export CCB_USERNAME="your_username"
export CCB_PASSWORD="your_password"
```

### Q2: 忘记设置环境变量会怎样？

**A:** 始终不会保存你的密码到任何文件，只会提示你设置环境变量。

### Q3: 密码会不会被记录？

**A:** 不会。账号密码仅从环境变量读取，使用后立刻从内存清除。不会保存到任何文件。

### Q4: 关闭终端后还需要重新设置吗？

**A:** 是的。关闭终端后，环境变量会自动清除。每次打开新终端都需要重新设置。

### Q5: agent-browser 未安装怎么办？

**A:** 运行以下命令安装：
```bash
npm install -g agent-browser
agent-browser install
```

---

## 🔒 安全说明

### 账号密码保护

- ✅ **不保存到文件**：账号密码仅使用环境变量
- ✅ **终端关闭后清除**：关闭终端自动清除内存
- ✅ **仅用于建行学习平台**：不会用于其他任何网站
- ✅ **不发送到网络**：仅本地使用

### 环境变量 vs 配置文件

**为什么不用配置文件？**

| 方式 | 安全性 | 说明 |
|------|--------|------|
| 环境变量 | ✅ 高 | 关闭终端后自动清除 |
| .env文件 | ❌ 低 | 可能被版本控制 |
| ~/.config/** ❌ 低 | 明文存储不安全 |
| 硬编码在skill ❌ 极低 | 代码泄露 |

### 密码泄露风险评估

- ✅ **内存中使用**：仅在使用期间
- ✅ **进程终止清除**：进程结束自动释放
- ✅ **终端关闭清除**：关闭终端自动清除
- ✅ **不写入磁盘**：没有文件操作

---

## 📂 文件结构

```
ccb-course-watcher/
├── SKILL.md      # skill主文件
└── README.md     # 这个说明文档
```

---

## 🎯 技术细节

### 浏览器自动化

使用 `agent-browser` 工具：
- 版本：v0.16.1 或更高
- 浏览器：Chromium（开源）
- 功能：点击、填写表单、设置播放速度

### 两步点击流程

建行学习平台视频需要两步点击：

1. **课程包列表**
   - 找到"立即学习"/"继续学习"按钮
   - 点击进入课程详情页

2. **课程详情**
   - 找到".to-learn"按钮
   - 点击进入视频播放页

3. **视频播放**
   - 设置2倍速：`video.playbackRate = 2.0`
   - 开始播放：`video.play()`
   - 等待完成

---

## 📞 支持

遇到问题？

1. 检查环境变量：`echo $CCB_USERNAME`
2. 检查 agent-browser：`agent-browser --version`
3. 查看日志：如果工具输出错误信息

---

## 📋 更新日志

- **v1.0.0** (2026-03-04): 初始版本，支持建行学习平台课程包2倍速自动观看

---

**Skill Creator**: 何老师
**License**: 自用
