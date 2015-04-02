# Internal variables and other configs
# ====================================

# Passed to `date +$...` in log messages
: ${MOAB_LOG_TIMESTAMP_FORMAT:="+%Y-%m-%dT%H:%M:%S"}

# Moab's working directory
: ${MOAB_DIR:=/var/lib/moab}

# Where to watch for new packages to track
: ${MOAB_QUEUE_DIR:=${MOAB_DIR}/queue}

# Where to watch for new packages to track
: ${MOAB_PKGBUILD_DIR:=${MOAB_DIR}/pkgbuilds}
