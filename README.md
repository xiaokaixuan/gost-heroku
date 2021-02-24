## 一键部署 Gost(ss+mws) 到 heroku  [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

> 1. 服务端部署后，应`open app` ，显示`404 page not found`，表示部署成功。

> 2. 客户端本地代理，编辑`client.vbs`，后双击执行，或者直接运行命令。
> ```
> Const CommandLine = "gost.exe -L=:1080 -F=ss+mwss://chacha20:ss123456@appname.herokuapp.com:443"
> ```

> 3. Chrome安装[SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega/releases)插件，配置[GFWList](https://github.com/gfwlist/gfwlist)。

> 4. Android安装[Shadowsocks](https://github.com/shadowsocks/shadowsocks-android)和[ShadowsocksGostPlugin](https://github.com/xausky/ShadowsocksGostPlugin)。

[下载](https://github.com/xiaokaixuan/gost-heroku/releases/tag/v2.11.1)

### 附加

> 1. 一键部署 Gost(ss+mws) 到 [KubeSail](https://kubesail.com/template/kaixuan1115/gost-heroku/)。

### 参考 
*https://github.com/ginuerzh/gost*

*https://github.com/gfwlist/gfwlist*

*https://github.com/xausky/ShadowsocksGostPlugin*
