#!/bin/bash
# 检查下载进度

echo "=== Download Progress ==="
echo ""

# 显示最后20行日志
echo "Latest logs:"
tail -20 download.log 2>/dev/null || echo "No log file yet"

echo ""
echo "=== File Statistics ==="

# 统计各类别的文件数
for dir in tushare_data/*/; do
    if [ -d "$dir" ]; then
        count=$(find "$dir" -name "*.parquet" 2>/dev/null | wc -l)
        if [ $count -gt 0 ]; then
            dirname=$(basename "$dir")
            size=$(du -sh "$dir" 2>/dev/null | cut -f1)
            echo "  $dirname: $count files ($size)"
        fi
    fi
done

echo ""
echo "=== Download Reports ==="
if [ -d "download_reports" ]; then
    ls -lht download_reports/ | head -5
fi
