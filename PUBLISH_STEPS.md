# GitHub 发布步骤指导

## 第1步：创建 GitHub 仓库

### 通过网页创建（推荐）

1. 访问：https://github.com/new
2. 填写信息：
   - **Repository name**: `ccb-course-watcher`
   - **Description**: 建行学习平台课程自动观看工具（2倍速）
   - **Public**: ✅ 打勾（公开仓库）
   - **License**: 选择 **MIT License**
3. 点击 **Create repository**

### 创建成功后，你会得到仓库地址：

```
https://github.com/yourusername/ccb-course-watcher
```

或者：
```
git@github.com:yourusername/ccb-course-watcher.git
```

---

## 第2步：推送代码到 GitHub

**创建仓库后，回到终端，运行以下命令：**

```bash
cd ~/.agents/skills/ccb-course-watcher

# 添加远程仓库（替换 yourusername 为你的 GitHub 用户名）
git remote add origin https://github.com/yourusername/ccb-course-watcher.git

# 推送到 GitHub
git push -u origin master
```

如果让你输入 GitHub 账号密码：
- Username: 你的 GitHub 用户名
- Password: 你的 GitHub 密码（不是建行的！）

---

## 第3步：验证

推送成功后，访问你的仓库：

```
https://github.com/yourusername/ccb-course-watcher
```

确认文件都在：
- ✅ LICENSE
- ✅ README.md
- ✅ SKILL.md
- ✅ QUICKREF.md
- ✅ install.sh

---

## 第4步：测试安装（给别人测）

别人可以这样安装你的 skill：

```bash
npx skills add https://github.com/yourusername/ccb-course-watcher --skill ccb-course-watcher
```

## 📝 注意事项

1. **仓库必须公开**：Private 仓库别人无法用 `npx skills add` 安装
2. **必须有 LICENSE**：已添加 MIT License
3. **SKILL.md 必须有**：已创建

## 🎉 完成！

现在你的 skill 已经发布到 GitHub，其他人可以像安装其他 skill 一样简单安装了！

---

**Skill Creator**: 何老师
