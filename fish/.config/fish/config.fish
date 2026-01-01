if status is-interactive
    # Environment variables
    set --global --export PAGER "less"
    set --global --export LESS "-ieMR"

    if command -q nvim
        set --global --export EDITOR "nvim"
    else
        set --global --export EDITOR "vim"
    end

    # Disable greeting
    set --universal fish_greeting

    # Set command abbreviations
    abbr --add rr rm -rf
    abbr --add j jobs
    abbr --add h history

    # Add anywhere abbreviations
    abbr --add L --position anywhere --set-cursor "% | less"
    abbr --add H --position anywhere --set-cursor "% | head"
    abbr --add T --position anywhere --set-cursor "% | tail"

    if command -q rg
        abbr --add G --position anywhere "| rg"
    else
        abbr --add G --position anywhere "| grep"
    end

    if command -q jq
        abbr --add J --position anywhere --set-cursor "% | jq -M"
    end

    if command -q aichat
        abbr --add aic aichat
    end

    # Function to add all private key identities to the OpenSSH authentication agent
    function ssh-add-all --description "Adds all private key identities to the OpenSSH authentication agent"
        find ~/.ssh -type f \( -name "id_*" ! -name "id_*.pub" \) -exec ssh-add {} +
    end

    # Function to look up IP information using ipinfo.io
    function ipinfo
        if test (count $argv) -ne 1
            echo "Usage: ipinfo <IP address>" >&2
            return 1
        end

        set -l ip $argv[1]

        if not string match -rq '^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$' -- $ip
            echo "Invalid IP: $ip" >&2
            return 1
        end

        curl --fail --show-error --silent "https://ipinfo.io/$ip"
    end
end
