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

    if command -q git
        abbr --add gb git branch
        abbr --add gc git commit
        abbr --add gd git diff
        abbr --add gs git stash
    end

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
end
