#!/bin/bash

# 先下载并执行 menu.sh 脚本
wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh <<< $'2\n13\n40000\n1\n'

# 替换配置文件 sing_origin.json
sudo cp -f /root/private/config.json /etc/V2bX/
sudo cp -f /root/private/custom_outbound.json /etc/V2bX/
sudo cp -f /root/private/route.json /etc/V2bX/
sudo cp -f /root/private/sing_origin.json /etc/V2bX/


# 配置文件路径
CONFIG_FILE="/etc/V2bX/config.json"

sudo apt-get install jq -y

# 提示用户输入 vmess 节点的 NodeID
echo "请输入 vmess 节点的 NodeID (NodeID 1):"
read NODE_ID_1

# 提示用户输入 hysteria2 节点的 NodeID
echo "请输入 hysteria2 节点的 NodeID (NodeID 2):"
read NODE_ID_2

# 使用 jq 修改 JSON 文件中的 NodeID
# 1. 修改 "NodeID" 为 1 的节点
jq --arg node_id "$NODE_ID_1" '(.Nodes[] | select(.NodeID == 1)) .NodeID = $node_id' $CONFIG_FILE > temp_config.json && mv temp_config.json $CONFIG_FILE

# 2. 修改 "NodeID" 为 2 的节点
jq --arg node_id "$NODE_ID_2" '(.Nodes[] | select(.NodeID == 2)) .NodeID = $node_id' $CONFIG_FILE > temp_config.json && mv temp_config.json $CONFIG_FILE

echo "NodeID 已更新成功！"


echo "已自动配置warp解锁，重启v2bx生效"
