function hs
    set file (fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")
    if test -n "$file"
        helix $file
    end
end
