## 一键安装



<br>

获取私库令牌

```bash
apt-get update
sudo apt install git -y

git clone https://github.com/lisi-123/private.git

```

```bash
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
```

重新拉取库

```bash
rm -rf private
git clone https://$GITHUB_TOKEN@github.com/lisi-123/private.git

```

执行安装脚本：

```bash
sudo chmod +x /root/private/setup.sh && sudo /root/private/setup.sh

```

<br>

## 临时禁用ipv6
当vps同时存在v4和v6,且v6优先时候，可能会导致安装脚本出问题

执行以下脚本可临时禁用ipv6，重启vps即可恢复

```bash
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
```

<br>


xiao佬的v2bx: https://github.com/wyx2685/V2bX


<br>
