#!/bin/sh

# This meta hook is used for restart detection
meta_restart_hook="{{pkg.svc_config_path}}/unicast_hosts.txt"

elasticsearch_pid() {
    cat "{{pkg.svc_pid_file}}"
}

# If something in restart-hook.txt will change then restart hook will restart service
checksum_restart_hook() {
    sha256sum $meta_restart_hook > $meta_restart_hook.sha256
}

check_restart_hook() {
    sha256sum -c $meta_restart_hook.sha256 --status 2> /dev/null
}
