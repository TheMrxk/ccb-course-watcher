#!/bin/bash

# =============================================================================
# 建行网课调度器
# =============================================================================
# 用途：将建行网课任务路由到独立会话，避免阻塞主会话
# 用法：bash ccb-course-dispatcher.sh "<课程包 URL>"
# =============================================================================

set -e

COURSE_URL="$1"
CCB_USERNAME="${CCB_USERNAME:-}"
CCB_PASSWORD="${CCB_PASSWORD:-}"

if [ -z "$COURSE_URL" ]; then
    echo "用法：bash $0 \"<课程包 URL>\""
    echo ""
    echo "例子："
    echo "  bash ccb-course-dispatcher.sh \"https://u.ccb.com/workshop/#/myworkshop/detail?id=xxx\""
    echo ""
    echo "注意：需要先设置环境变量"
    echo "  export CCB_USERNAME=\"你的账号\""
    echo "  export CCB_PASSWORD=\"你的密码\""
    exit 1
fi

if [ -z "$CCB_USERNAME" ] || [ -z "$CCB_PASSWORD" ]; then
    echo "⚠️  错误：未设置 CCB_USERNAME 或 CCB_PASSWORD 环境变量"
    echo ""
    echo "请先设置："
    echo "  export CCB_USERNAME=\"你的建行学习平台账号\""
    echo "  export CCB_PASSWORD=\"你的建行学习平台密码\""
    exit 1
fi

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║          建行网课 - 独立会话模式                               ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "📚 课程 URL: $COURSE_URL"
echo "👤 账号：$CCB_USERNAME"
echo ""
echo "🚀 启动独立会话..."
echo ""
echo "✅ 主会话已释放，你可以继续聊天"
echo "⏱️  预计时间：根据课程数量，约 10-30 分钟"
echo "📬 完成后会推送结果给你"
echo ""
echo "═══════════════════════════════════════════════════════════════"
echo ""

# 实际调用（需要 OpenClaw 环境）
# sessions_spawn(
#     task="刷建行网课：$COURSE_URL",
#     runtime="subagent",
#     mode="session",
#     thread=False,
#     streamTo="parent",
#     env={
#         "CCB_USERNAME": CCB_USERNAME,
#         "CCB_PASSWORD": CCB_PASSWORD
#     }
# )

echo "💡 提示：这是演示脚本，实际调用需要在代码中实现 sessions_spawn"
echo ""
