error () {
    _msg "${FUNCNAME}\t${1}"
}

debug () {
    _msg "${FUNCNAME}\t${1}"
}

_msg () {
    echo -e "$(date "${_LOG_TIMESTAMP_FORMAT}")\t${1}"
}
