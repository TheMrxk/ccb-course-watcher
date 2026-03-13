---
name: ccb-course-watcher
description: 建行学习平台课程自动观看（2 倍速）。用于批量完成建行学习平台培训课程的学习任务。当用户提到"建行学习"、"CCB 培训"、"看完课程"、"建行课程包"时使用此技能。
---

# 建行学习平台课程自动观看工具

## ⚠️ 安全重要说明

**账号密码绝对保密**

本 skill 不会在任何地方硬编码或保存你的账号密码。账号密码仅在运行时从环境变量读取，使用后立即从内存中清除。

---

## 🔐 账号密码配置

### 使用前必须设置环境变量

```bash
export CCB_USERNAME="你的建行学习平台账号"
export CCB_PASSWORD="你的建行学习平台密码"
```

**示例：**
```bash
export CCB_USERNAME="zhangsan.ln"
export CCB_PASSWORD="YourPassword123"
```

### 查看是否已设置

```bash
echo $CCB_USERNAME
echo $CCB_PASSWORD
```

---

## 🚀 使用方式

### 方式 1：观看单个视频（短任务）

```bash
# 1. 设置环境变量
export CCB_USERNAME="your_account"
export CCB_PASSWORD="your_password"

# 2. 告诉 AI
"帮我看完这个视频：https://u.ccb.com/course/#/detail/xxx"
```

**特点：** 同步执行，适合单个视频（<5 分钟）

---

### 方式 2：观看课程包（长任务，异步模式✨推荐）

```bash
# 1. 设置环境变量
export CCB_USERNAME="your_account"
export CCB_PASSWORD="your_password"

# 2. 告诉 AI
"帮我看完这个课程包：https://u.ccb.com/workshop/#/myworkshop/detail?id=xxx"
```

**AI 会自动：**
1. ✅ 识别这是长任务（>5 分钟）
2. ✅ 创建独立会话（sessions_spawn）
3. ✅ 立即回复"课程已开始观看"
4. ✅ 主会话继续响应
5. ✅ 完成后推送结果

**优势：**
- 主会话不阻塞
- 可以同时做其他事
- 多个课程包并行观看

---

### 方式 3：使用调度器脚本（高级）

```bash
# 1. 设置环境变量
export CCB_USERNAME="your_account"
export CCB_PASSWORD="your_password"

# 2. 运行调度器
bash dispatcher.sh "https://u.ccb.com/workshop/#/myworkshop/detail?id=xxx"
```

---

## 🔧 技术实现

### 浏览器自动化

使用 `agent-browser` 工具：
- 登录建行学习平台
- 打开课程包
- 2 倍速播放视频

### 异步调度

使用 `sessions_spawn` 创建独立会话：
```python
sessions_spawn(
    task="刷建行网课：{COURSE_URL}",
    runtime="subagent",
    mode="session",
    thread=False,
    streamTo="parent"
)
```

---

## ⚠️ 重要提醒

1. **不要共享环境变量**
2. **密码仅在当前终端有效**
3. **每次使用前检查环境变量**
4. **建行学习平台官方网址**：https://u.ccb.com/

---

## 📞 问题排查

### 环境变量未设置
```bash
export CCB_USERNAME="your_account"
export CCB_PASSWORD="your_password"
```

### agent-browser 未安装
```bash
npm install -g agent-browser
agent-browser install
```

---

Skill Creator: 何老师
Maintained for: 建行学习平台用户
