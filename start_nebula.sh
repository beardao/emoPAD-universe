#!/bin/bash
# emoNebula 启动脚本
# 用法: ./start_nebula.sh
# 说明: 在前台运行 nebula，支持弹出窗口显示情绪星云图

cd "$(dirname "$0")"
echo "🌌 启动 emoNebula..."
echo "💡 将每 5 分钟弹出窗口显示情绪星云图"
echo "🛑 按 Ctrl+C 停止"
echo ""
python3 nebula.py
