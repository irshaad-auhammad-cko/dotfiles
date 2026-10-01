# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/irshaad.auhammad/.docker/bin"
# End of Docker Desktop section.

#!/usr/bin/env bash

# Load .bashrc, which loads: ~/.{aliases,dockerfuncs,exports,extra,functions,paths}
if [[ -r "${HOME}/.bashrc" ]]; then
	# shellcheck source=/dev/null
	source "${HOME}/.bashrc"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/irshaad.auhammad/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/irshaad.auhammad/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/irshaad.auhammad/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/irshaad.auhammad/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# Setting PATH for Python 3.12
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
export PATH
