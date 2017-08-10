#
# Sets general shell options and defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Smart URLs
#

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
zstyle -e :urlglobber url-other-schema \
'[[ $words[1] == scp ]] && reply=("*") || reply=(http https ftp)'

#
# General
#

setopt BRACE_CCL          # Allow brace character class list expansion.
setopt COMBINING_CHARS    # Combine zero-length punctuation characters (accents)
                          # with the base character.
setopt RC_QUOTES          # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'.
unsetopt MAIL_WARNING     # Don't print a warning message if a mail file has been accessed.

#
# Jobs
#

setopt LONG_LIST_JOBS     # List jobs in the long format by default.
setopt AUTO_RESUME        # Attempt to resume existing job before creating a new process.
setopt NOTIFY             # Report status of background jobs immediately.
unsetopt BG_NICE          # Don't run all background jobs at a lower priority.
unsetopt HUP              # Don't kill jobs on shell exit.
unsetopt CHECK_JOBS       # Don't report on jobs when shell exit.

#
# Termcap
#

if zstyle -t ':prezto:environment:termcap' color; then
  export LESS_TERMCAP_mb=$'\E[01;31m'       # Enter blinking mode
  export LESS_TERMCAP_md=$'\E[01;34m'       # Enter double-bright mode
  export LESS_TERMCAP_me=$'\E[0m'           # Turn off all appearance modes (mb, md, so, us)
  export LESS_TERMCAP_se=$'\E[0m'           # Leave standout mode
  export LESS_TERMCAP_so=$'\E[01;33m'       # Enter standout mode
  export LESS_TERMCAP_ue=$'\E[0m'           # Leave underline mode
  export LESS_TERMCAP_us=$'\E[01;32m'       # Enter underline mode
fi
