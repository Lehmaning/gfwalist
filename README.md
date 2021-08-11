# gfwalist
代理 Greatfire Analyzer 所监测域名的 Auto Proxy 规则。
所有域名来自 [cn-blocked-domain](https://github.com/Loyalsoldier/cn-blocked-domain/releases/tag/202107222004) 以及 [gfwlist](https://github.com/gfwlist/gfwlist) ，
并且移除了跟踪性的域名。

## 使用
### 通过 SwitchyOmega
在 auto switch 配置中加入该规则列表：https://raw.githubusercontent.com/Lehmaning/gfwalist/main/gfwalist.txt

### 本地生成
```shell
bash <(curl -s https://raw.githubusercontent.com/Lehmaning/gfwalist/main/build.sh)
```
