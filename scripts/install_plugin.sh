#!/bin/sh

set -e

plugin_version=$(sed -n -e 's/version:[ "]*\([^"]*\).*/\1/p' ${HELM_PLUGIN_DIR}/plugin.yaml)
SET_STATUS_VERSION=${SET_STATUS_VERSION:-${HELM_PLUGIN_VERSION:-$plugin_version}}

os=$(uname -s | tr '[:upper:]' '[:lower:]')
arch=$(uname -m | tr '[:upper:]' '[:lower:]')

case "$arch" in
  x86_64)
    arch="amd64"
    ;;
  aarch64|arm64)
    arch="arm64"
    ;;
esac

os_arch="${os}-${arch}"
release_file="helm-set-status-${os_arch}.tgz"
repo="wiremind/helm-set-status"
url="https://github.com/${repo}/releases/download/v${SET_STATUS_VERSION}/${release_file}"

mkdir -p "${HELM_PLUGIN_DIR}"

if command -v wget; then
  wget -qO - ${url} | tar -zxvC ${HELM_PLUGIN_DIR}
elif command -v curl; then
  curl -sL ${url} | tar -zxvC ${HELM_PLUGIN_DIR}
else
  echo "Error: could not find wget or curl binary"
  exit 1
fi
