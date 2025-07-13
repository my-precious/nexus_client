#!/bin/bash


# 客户端数量
NUM_CLIENTS=10
CLIENT_PATH="/Users/imac/code/nexus_server/nexus_client"
# SERVER_PATH="/Users/imac/code/nexus_server"
# 检查服务端进程是否已存在，如果不存在则启动
# if pgrep -f "nexus_server_88.yaml" > /dev/null; then
#   echo "服务端已在运行，跳过启动。"
# else
#   echo "启动服务端"
#   rm -rf ~/.nexus/server88.log
#   $SERVER_PATH/nexus_server --file $SERVER_PATH/nexus_server_88.yaml > ~/.nexus/server88.log 2>&1 &
# fi


# 客户端配置文件名
CONFIG_FILE="$CLIENT_PATH/nexus_clientqq.txt"

pkill -f nexus_clientqq

for ((i=1; i<=NUM_CLIENTS; i++))
do
  if [ -f "$CONFIG_FILE" ]; then
    echo "启动第 $i 个客户端，配置文件: $CONFIG_FILE"
    rm -rf ~/.nexus/clientqq_${i}.log
    $CLIENT_PATH/target/release/nexus_client --file "$CONFIG_FILE" > ~/.nexus/clientqq_${i}.log 2>&1 &
  else
    echo "配置文件 $CONFIG_FILE 不存在，跳过第 $i 个客户端"
  fi
done

echo "所有客户端已启动，日志分别写入 ~/.nexus/client_*.log" 