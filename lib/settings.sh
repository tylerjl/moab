# Internal variables and other configs
# ====================================

# Passed to `date +$...` in log messages
: ${_LOG_TIMESTAMP_FORMAT:="+%Y-%m-%dT%H:%M:%S"}

# Where to watch for new packages to track
: ${_MOAB_QUEUE_DIR:=/var/lib/moab/queue}

# Where to watch for new packages to track
: ${_MOAB_PKGBUILD_DIR:=/var/lib/moab/pkgbuilds}
