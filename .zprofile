#
# ~/.zprofile
#

if uwsm check may-start && uwsm select; then
	exec uwsm start default
fi

# Created by `pipx` on 2026-10-22 14:28:24
export PATH="$PATH:/home/daky/.local/bin"
