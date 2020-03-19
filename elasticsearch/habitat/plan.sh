# shellcheck shell=bash

pkg_origin=gedimin
pkg_maintainer="Gedimin <alexei.anik@gmail.com>"
pkg_license=('Revised BSD')
pkg_name="elasticsearch"
pkg_description="Open Source, Distributed, RESTful Search Engine"
pkg_upstream_url="https://elastic.co"
pkg_deps=(
    core/elasticsearch
    core/bash
)

pkg_build_deps=(
    core/git
)

pkg_bin_dirs=(es/bin)
pkg_exports=(
    [port]=network.port
    [transport-port]=transport.port
    [cluster-name]=cluster.name
)

pkg_git_version() {
    echo "$(($(git rev-list origin/master --count)))"
}

pkg_version() {
    pkg_git_version
}

do_before() {
    do_default_before
    update_pkg_version
}

do_download() {
    return 0
}

do_build() {
    return 0
}

do_install() {
    mkdir -p "${pkg_prefix}/es"
    export ES_TMPDIR="${pkg_prefix}/es"
    cp -r "$(pkg_path_for elasticsearch)/es/." "${pkg_prefix}/es"
    rm -rf "${pkg_prefix}"/es/modules/x-pack*
}
