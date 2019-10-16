## 一键部署 Gost(ss+mws) 到 heroku  [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

> 服务端部署后，应`open app` ，显示`404 page not found`，表示部署成功。

> 客户端本地代理，编辑`client.vbs`，后双击执行，或者直接运行命令。
> ```
> Const CommandLine = "gost.exe -L=:1080 -F=ss+mwss://chacha20:ss123456@appname.herokuapp.com:443"
> ```

> Chrome安装[SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega/releases)插件，配置[GFWList](https://github.com/gfwlist/gfwlist)。

[下载](https://github.com/xiaokaixuan/gost-heroku/releases/tag/v2.8.1)

### 参考 
https://github.com/ginuerzh/gost

https://github.com/gfwlist/gfwlist

