#!/bin/bash
# 后台运行下载脚本

# 激活虚拟环境
source /root/miniconda3/bin/activate ohmyquant

# 运行下载（跳过测试，加速）
nohup python download_all.py --quick --no-test > download.log 2>&1 <<< "Y" &

# 获取进程ID
PID=$!
echo "Download started with PID: $PID"
echo "Monitor progress: tail -f download.log"
echo "Check process: ps aux | grep $PID"
echo ""
echo "To stop: kill $PID"
