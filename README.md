# kubernetes_runnner_deploy
---
自动化创建Kubernetes Gitlab Runner Pod

# 设计原则
- 使用者修改conf配置文件中的对应配置信息，完成Kubernetes对接Gitlab项目的Pod资源的创建，并实现项目资源的认证授权资源管理
- Kubernetes 版本需要V1.13版本以上

# 使用方法
- 修改`check.conf`配置文件

```
# 根据项目需求进行编辑
# The Project runner namespace
namespace=moreink-frontend

# The Runner name
runner_name=runner-moreink-frontend

# The Project token
token=rEj4f7feAdDvvDNevzWw

# The runner images
image=docker:5000/moreink/centos7
```

- 执行`deploy.sh`
```
sh deploy.sh
```

- 进入对应namespace名称目录，使用kubectl创建Runner Pod

```
kubectl create -f namespace.yaml -f configmap.yaml -f secret.yaml -f statefulset.yaml -f rbac.yaml
```

- 查看对应namespace资源
```
kubectl get pods -n namespace_name -o wide
```

# 其它
- Kubernetes版本升级之后，API接口可能会改变，执行报错之后根据提示修改接口版本即可
