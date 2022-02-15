set fish_greeting
set -gx PATH /home/vlade/.usr/bin $PATH

function fish_user_key_bindings
  # ctrl-]
  bind \cH backward-kill-path-component
  bind \e\[3\;5~ kill-word
end

function subl
    set my_args
    for i in $argv
        if test (string sub -l 10 $i) = "/home/vlad"
            set my_args $my_args //wsl\$/Ubuntu$i
        else if test (string sub -l 5 $i) = "/mnt/"
            set my_disk (string upper (string sub -s 6 -l 1 $i))
            set my_file (string sub -s 8 $i)
            set my_args $my_disk:/$my_file
        else
            set my_args $my_args $i
        end
    end
    /./mnt/c/Program\ Files/Sublime\ Text/subl.exe $my_args > /dev/null 2>&1
end
function temp
    set my_args
end

function mkc
	mkdir -p "$argv[1..-1]"
	cd "$argv[1..-1]"
end

alias uni='cd /mnt/c/vladimir/Documents/University/Spring\ 2022'
alias note='cd /mnt/c/vladimir/Notes'
alias rm='echo Use 'trash', or the full path '/bin/rm''
alias n='/./mnt/c/Windows/explorer.exe .'
alias fd='fdfind'
alias texclean='trash *.aux *.fdb_latexmk *.fls *.out *.synctex.gz *.log'
