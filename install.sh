#!/bin/bash

# 建行学习课程观看工具 - 安装脚本

echo "========== 建行学习课程观看工具安装 =========="
echo ""

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 1. 检查 Node.js
echo "[1/5] 检查 Node.js..."
if command -v node &> /dev/null; then
    NODE_VERSION=$(node -v)
    echo -e "${GREEN}✓${NC} Node.js 已安装: $NODE_VERSION"
else
    echo -e "${RED}✗${NC} Node.js 未安装"
    echo "请先安装 Node.js: https://nodejs.org/"
    exit 1
fi

# 2. 检查 npm
echo "[2/5] 检查 npm..."
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm -v)
    echo -e "${GREEN}✓${NC} npm 已安装: $NPM_VERSION"
else
    echo -e "${RED}✗${NC} npm 未安装"
    exit 1
fi

# 3. 检查 agent-browser
echo "[3/5] 检查 agent-browser..."
if command -v agent-browser &> /dev/null; then
    AGENT_VERSION=$(agent-browser --version)
    echo -e "${GREEN}✓${NC} agent-browser 已安装: $AGENT_VERSION"
else
    echo -e "${YELLOW}○${NC} agent-browser 未安装"
    echo "正在安装 agent-browser..."
    npm install -g agent-browser

    if command -v agent-browser &> /dev/null; then
        echo -e "${GREEN}✓${NC} agent-browser 安装成功"
    else
        echo -e "${RED}✗${NC} agent-browser 安装失败"
        exit 1
    fi
fi

# 4. 检查 Chromium
echo "[4/5] 检查 Chromium 浏览器..."
BROWSER_PATH="$HOME/.cache/ms-playwright"
if [ -d "$BROWSER_PATH" ]; then
    echo -e "${GREEN}✓${NC} Chromium 已安装"
else
    echo -e "${YELLOW}○${NC} Chromium 未安装"
    echo "提示：第一次使用时会自动下载 Chromium（约300MB）"
    echo "或者手动运行: agent-browser install"
fi

# 5. 检查环境变量
echo "[5/5] 检查账号密码..."
if [ -z "$CCB_USERNAME" ]; then
    echo -e "${YELLOW}○${NC} 环境变量 CCB_USERNAME 未设置"
    echo ""
    echo "${YELLOW}======== 设置账号密码 ==========${NC}"
    echo ""
    echo "请在当前终端中运行以下命令设置账号密码："
    echo ""
    echo -e "${GREEN}export CCB_USERNAME=\"your_username\"${NC}"
    echo -e "${GREEN}export CCB_PASSWORD=\"your_password\"${NC}"
    echo ""
    echo "示例："
    echo "export CCB_USERNAME=\"zhangsan.ln\""
    echo "export CCB_PASSWORD=\"Password123\""
    echo ""
    echo "${YELLOW}=====================================${NC}"
    echo ""
    echo "设置好后，就可以使用本skill了："
    echo ""
    echo "告诉Claude："
    echo "  \"帮我看完这个课程包：https://u.ccb.com/workshop/#/myworkshop/detail?id=xxx\""
    echo ""
else
    echo -e "${GREEN}✓${NC} 环境变量已设置"
    echo "  CCB_USERNAME: $CCB_USERNAME"
    echo "  CCB_PASSWORD: *** (已设置)"
    echo ""
    echo "可以开始使用了！"
    echo ""
    echo "告诉Claude："
    echo "  \"帮我看完这个课程包：https://u.ccb.com/workshop/#/myworkshop/detail?id=xxx\""
    echo ""
fi

echo "========================================="
echo ""
echo -e "${GREEN}✓ 安装检查完成！${NC}"
echo ""
echo "更多说明请查看："
echo "  ~/.agents/skills/ccb-course-watcher/README.md"
echo ""
