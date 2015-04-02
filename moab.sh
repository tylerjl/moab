#!/usr/bin/env bash
shopt -s nullglob # Empty wildcards create empty arrays

# moab: a package environment for your arches
# ===========================================

main () {

    # Load libraries
    for library in "$(dirname ${0})"/lib/*.sh ; do
        source "${library}"
    done
    debug "Libraries loaded"

    debug "Action: ${1}"
    case "${1}" in
        add)
            shift
            debug "Adding ${1} to package queue"
            touch "${MOAB_QUEUE_DIR}/${1}" ;;
        *)
            warn "Action '${1}' is undefined"
    esac

    # List of packages to work on building
    # declare -a pkg_queue
    # debug "Adding all files in ${_MOAB_QUEUE_DIR} to pkg_queue"
    # pkg_queue=(${_MOAB_QUEUE_DIR}/*)
    #
    # for pkg_path in "${pkg_queue[@]}" ; do
    #     pkg=$(basename $pkg_path)
    #     if pkg_info=$(cower --info --format="%c/%n-%v" $pkg 2>&1) ; then
    #         debug "Package '${pkg}' found: ${pkg_info}"
    #         mkdir -p ${_MOAB_PKGBUILD_DIR}/${pkg}
    #         cower --download --target ${_MOAB_PKGBUILD_DIR}/${pkg} ${pkg}
    #     else
    #         error "Package '${pkg}' not found in the AUR"
    #     fi
    # done

    # inotifywait --monitor --quiet --event create "${_MOAB_TRACK_DIR}"
}

main $@
