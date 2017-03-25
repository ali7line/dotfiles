#!/bin/bash

function _color_compare() {
    # comparizon epsilon
    eps=30
    neps=-30
    diff=$(( $1 - $2 ))
    # echo $diff
    if [ "$diff" -ge "$eps" ]  ; then
        # ping is going down 
        flag="d"
        color_flag="green"
    elif [ "$diff" -le "$neps" ] ; then
        # ping is going up
        flag="u"
        color_flag="red"
    else
        # ping is not changing
        flag="-"
        color_flag="cyan"
    fi

}

function _get_ping() {
    recent_ping=$(grep $1 /home/$USER/log/ping_host.log| tail -1 | awk -F'[ =]' '{print $11}')
    previous_ping=$(grep $1 /home/$USER/log/ping_host.log| tail -2 | head -1  | awk -F'[ =]' '{print $11}')

    printf -v recent_ping '%d\n' $recent_ping 2>/dev/null
    printf -v previous_ping '%d\n' $previous_ping 2>/dev/null
    # echo gg:$value
    # echo "$recent_ping" "$previous_ping"
    _color_compare "$previous_ping" "$recent_ping" 
    printf " #[bg=colour238]#[fg=%s]%s:%.0f%s " ${color_flag} ${2} ${recent_ping} ${flag}
}

num1=$(_get_ping 192 l)
num2=$(_get_ping petiak p)
num3=$(_get_ping asriran a)
num4=$(_get_ping google g)
printf "%s %s %s %s #[bg=colour236]\n" $num1 $num2 $num3 $num4
