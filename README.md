# Helm set-status plugin

Manually set the status of a helm release

Useful when helm or your cluster ran into problems mid-update and things are stuck `pending-upgrade`, but you don't want to uninstall the release and possibly suffer additional downtime.


| :warning: WARNING :warning: |
| - |
| This plugin alters the internal state of helm releases. Use with care! |

## Install

```console
helm plugin install https://github.com/wiremind/helm-set-status
```

## Usage

```console
helm set-status RELEASE STATUS [flags]
```

### Flags

- `-n, --namespace`: namespace scope for this request (defaults to `$HELM_NAMESPACE`).
- `--kube-context`: name of the kubeconfig context (defaults to `$HELM_KUBECONTEXT`).
- `--kubeconfig`: path to the kubeconfig file (defaults to `$KUBECONFIG`).
