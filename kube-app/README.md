

# base-chart

<img src="https://craftech.io/wp-content/uploads/2025/04/craftech.svg" />

![Version: 1.1.0](https://img.shields.io/badge/Version-1.1.0-informational?style=flat-square)

### Kubernetes Application Reduced Chart.

![Version: 1.1.0](https://img.shields.io/badge/Version-1.1.0-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

## Maintainers

| Name | Email | Url. |
| ---- | ------ | --- |
| Craftech |  | <https://craftech.io/> |

## Usage
To install the latest version of this chart, add the `avalojuanma` helm repository and run helm install:
```bash
$ helm repo add avalojuan https://avalojuan.github.io/helm-documenter/
"avalojuan" has been added to your repositories

$ helm install kube-app avalojuan/base-chart
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| deployment.annotations | object | `{}` |  |
| deployment.autoscaling.enabled | bool | `true` |  |
| deployment.autoscaling.maxReplicas | int | `4` |  |
| deployment.autoscaling.minReplicas | int | `2` |  |
| deployment.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| deployment.autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| deployment.command | string | `"[\"/bin/bash\", \"-c\"]"` |  |
| deployment.commandArgs[0] | string | `"example-command"` |  |
| deployment.containerName | string | `"example-name"` |  |
| deployment.enabled | bool | `true` | True if you want to enable api deployment. |
| deployment.env | list | `[]` |  |
| deployment.envFrom | list | `[]` |  |
| deployment.extraEnvironmentVars | object | `{}` |  |
| deployment.labels | object | `{}` |  |
| deployment.lifecycleHook | object | `{}` |  |
| deployment.livenessProbe.enabled | bool | `true` |  |
| deployment.livenessProbe.initialDelaySeconds | int | `15` |  |
| deployment.livenessProbe.path | string | `"/healthz"` |  |
| deployment.livenessProbe.periodSeconds | int | `20` |  |
| deployment.nodeAffinity | object | `{}` |  |
| deployment.nodeSelector | object | `{}` |  |
| deployment.pdb.enabled | bool | `true` |  |
| deployment.pdb.minAvailable | int | `1` |  |
| deployment.podAntiAffinity | object | `{}` |  |
| deployment.readinessProbe.enabled | bool | `true` |  |
| deployment.readinessProbe.initialDelaySeconds | int | `15` |  |
| deployment.readinessProbe.path | string | `"/healthz"` |  |
| deployment.readinessProbe.periodSeconds | int | `20` |  |
| deployment.replicaCount | int | `1` | Number of replicas |
| deployment.resources.limits.cpu | string | `"500m"` |  |
| deployment.resources.limits.memory | string | `"1Gi"` |  |
| deployment.resources.requests.cpu | string | `"300m"` |  |
| deployment.resources.requests.memory | string | `"800Mi"` |  |
| deployment.revisionHistoryLimit | int | `2` |  |
| deployment.securityContext | object | `{}` |  |
| deployment.serviceAccount.annotations | object | `{}` |  |
| deployment.serviceAccount.enabled | bool | `true` |  |
| deployment.serviceAccount.name | string | `""` |  |
| deployment.terminationGracePeriodSeconds | int | `300` |  |
| deployment.tolerations | list | `[]` |  |
| deployment.volumeMounts | list | `[]` |  |
| deployment.volumes | list | `[]` |  |
| global.clusterName | string | `"example-cluster"` |  |
| global.enabled | bool | `true` |  |
| global.image.pullPolicy | string | `"Always"` |  |
| global.image.repository | string | `"example-repo"` |  |
| global.image.tag | string | `"example-tag"` |  |
| global.namespace | string | `"example-namespace"` | Namespace where release will be deployed |
| global.projectName | string | `"example-project"` |  |