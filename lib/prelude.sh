
# Basic functions for core functionality
# ======================================

moab_init_db () {
    if [ -e "${MOAB_DB}" ] ; then
        debug "database exists, nothing to do"
    else
        if tar czfT "${MOAB_DB}" /dev/null ; then
            debug "${MOAB_DB} created"
        else
            debug "could not create ${MOAB_DB}"
        fi
    fi
}

moab_new_pkg () {
    if ! [ -r "${MOAB_DB}" ] ; then
        error "could not read repo db"
        return 2
    else
        tar --list --exclude="*/*" --wildcards -zf "${MOAB_DB}" "${1}-[^A-Za-z]*/"
        if [ $? -eq 2 ] ; then
            debug "package ${1} not in moab db"
            return 0
        else
            debug "package ${1} exists in moab db"
            return 1
        fi
    fi
}

moab_add_pkg () {
    if [ -w "${MOAB_PKGBUILD_DIR}" ] ; then
        cower -dd -t "${MOAB_PKGBUILD_DIR}" "${1}"
        if [ $? -eq 0 ] ; then
            debug "${1} and dependencies downloaded"
        else
            error "problem fetching ${1} and dependencies"
        fi
    else
        error "could not write to ${MOAB_PKGBUILD_DIR}"
    fi
}
