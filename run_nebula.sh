#!/bin/bash
# 手动运行 emoNebula（支持 GUI 窗口）
export DISPLAY=:1
export XAUTHORITY=/run/user/1000/gdm/Xauthority
cd "$(dirname "$0")"
echo "🌌 启动 emoNebula..."
echo "💡 将每 5 分钟弹出窗口显示情绪星云图"
echo "🛑 按 Ctrl+C 停止"
echo ""
python3 nebula.py
