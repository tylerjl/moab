_confirm_dir () {
    if ! [ -d "${1}" ] ; then
        err "${1} does not exist"
    fi
}
