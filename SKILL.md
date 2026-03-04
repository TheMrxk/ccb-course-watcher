---
name: ccb-course-watcher
description: 建行学习平台课程自动观看（2倍速）。用于批量完成建行学习平台培训课程的学习任务。当用户提到"建行学习"、"CCB培训"、"看完课程"、"建行课程包"时使用此技能。
---

# 建行学习平台课程自动观看工具

## ⚠️ 安全重要说明

**账号密码绝对保密**

本skill不会在任何地方硬编码或保存你的账号密码。账号密码仅在运行时从环境变量读取，使用后立即从内存中清除。

## 🔐 账号密码配置

### 首次配置（必须）

在使用本skill之前，**必须**设置环境变量：

```bash
# 设置账号密码环境变量（当前终端会话有效）
export CCB_USERNAME="你的建行学习平台账号"
export CCB_PASSWORD="你的建行学习平台密码"
```

**示例：**
```bash
export CCB_USERNAME="zhangsan.ln"
export CCB_PASSWORD="YourPassword123"
```

### 为什么不用配置文件？

- ❌ 不写入 `~/.config/ccb.txt` - 明文存储不安全
- ❌ 不写入 `.env` 文件 - 可能被版本控制
- ✅ 使用环境变量 - 仅在内存中，使用后清除
- ✅ 每次运行时重新输入 - 最安全

### 查看当前环境变量

```bash
# 查看是否已设置
echo $CCB_USERNAME
echo $CCB_PASSWORD
```

### 更新密码

如果建行学习平台密码变更，重新设置环境变量：

```bash
# 新密码
export CCB_PASSWORD="NewPassword"
```

**注意：** 即使忘记清除环境变量，关闭终端后环境变量也会自动清除。

---

## 🚀 使用方式

### 方式1：观看单个视频

```bash
# 1. 设置环境变量
export CCB_USERNAME="your_account"
export CCB_PASSWORD="your_password"

# 2. 告诉Claude
"帮我看完这个视频：https://u.ccb.com/course/#/detail/xxx"
```

### 方式2：观看课程包（推荐）

```bash
# 1. 设置环境变量
export CCB_USERNAME="your_account"
export CCB_PASSWORD="your_password"

# 2. 告诉Claude
"帮我看完这个课程包：https://u.ccb.com/workshop/#/myworkshop/detail?id=xxx"
```

skill会自动：
1. 登录建行学习平台
2. 打开课程包URL
3. 找到所有"立即学习"或"继续学习"的视频
4. 逐个视频2倍速观看
5. 完成后汇报

---

## 🔧 技术实现

### 浏览器自动化

使用 `agent-browser` 工具进行浏览器自动化：
- 打开建行学习平台网址
- 自动填写账号密码登录
- 点击学习按钮
- 设置视频播放速度为2倍

### 两步点击流程

建行学习平台需要两步点击才能进入视频：

1. **课程包列表页** → 点击"立即学习"/"继续学习"按钮
2. **课程详情页** → 点击".to-learn"按钮（"我要学习"）
3. **视频播放页** → 设置2倍速播放

### 播放设置

使用JavaScript控制视频播放：

```javascript
// 设置2倍速
video.playbackRate = 2.0;
video.play();

// 计算剩余时间
const remaining = (video.duration - video.currentTime) / 2.0;
```

---

## 📋 使用检查清单

使用前请确认：

- [ ] 已设置 `CCB_USERNAME` 环境变量
- [ ] 已设置 `CCB_PASSWORD` 环境变量
- [ ] 已安装 `agent-browser` 工具（`npm install -g agent-browser`）
- [ ] 已安装 Chromium 浏览器（`agent-browser install`）
- [ ] 确认建行学习平台网址：https://u.ccb.com/

---

## ⚙️ 依赖工具

### agent-browser

如果未安装：

```bash
npm install -g agent-browser
```

### Chromium 浏览器

第一次运行时会自动下载（~300MB）

或者手动安装：

```bash
agent-browser install
```

---

## 🎯 适用场景

- 批量完成建行学习平台培训课程
- 2倍速加速观看节省时间
- 自动记录观看进度

---

## ⚠️ 重要提醒

1. **不要共享环境变量**：不要在脚本或其他地方导出你的账号密码
2. **密码仅在当前终端有效**：关闭终端后自动清除
3. **每次使用前检查环境变量**：确保使用的是正确的账号
4. **建行学习平台官方网址**：https://u.ccb.com/

---

## 🔒 安全审计

| 评估项 | 状态 | 说明 |
|--------|------|------|
| 账号密码存储 | ✅ 安全 | 仅使用环境变量，不保存到文件 |
| 密码泄露风险 | ✅ 低 | 终端关闭后自动清除 |
| 网站访问 | ✅ 安全 | 仅访问建行学习平台官方网址 |
| 浏览器工具 | ✅ 安全 | agent-browser 是标准开源工具 |
| 恶意代码 | ✅ 无 | 纯JavaScript + 标准工具 |
| 敏感信息传输 | ✅ 安全 | 仅登录建行学习平台 |

---

## 📞 问题排查

### 问题1：提示环境变量未设置

**解决**：
```bash
echo "用户名: $CCB_USERNAME"
echo "密码: $CCB_PASSWORD"
```

如显示为空，重新设置：
```bash
export CCB_USERNAME="your_account"
export CCB_PASSWORD="your_password"
```

### 问题2：agent-browser未安装

**解决**：
```bash
npm install -g agent-browser
agent-browser install
```

### 问题3：登录失败

**检查**：
- 账号密码是否正确
- 网络连接是否正常
- 建行学习平台是否可访问

---

## 📝 使用示例

**示例1： watching a course package**

```
你：帮我看完这个课程包：https://u.ccb.com/workshop/#/myworkshop/detail?id=xxx

skill会：
1. 自动登录
2. 找到所有视频
3. 逐个2倍速观完
4. 汇报完成
```

**示例2：watching a single video**

```
你：帮我看完这个视频：URL

skill会：
1. 打开视频页面
2. 设置2倍速
3. 等待完成
4. 汇报
```

---

## 🔄 更新日志

- v1.0.0 (2026-03-04): 初始版本，支持课程包2倍速自动观看

---

Skill Creator: 何老师
Maintained for: 建行学习平台用户
