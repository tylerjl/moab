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

    case "${1}" in
        init)
            debug "Initializing empty db if non-existent"
            moab_init_db
            ;;
        add)
            shift
            debug "Checking if ${1} is in the moab database"
            if moab_new_pkg ${1} ; then
                debug "Adding ${1} to package queue..."
                moab_add_pkg ${1}
            else
                debug "Nothing to do"
            fi
            ;;
        '')
            error "No action defined"
            ;;
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
