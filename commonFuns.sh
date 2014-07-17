#!/bin/bash

HINT(){
    read -p "Press Enter to continue:" UFO
}

CPU_INFO(){
    echo
    echo -e "\033[4;31mPrint the CPU INFO:\033[0m"
    cat /proc/cpuinfo|awk 'BEGIN{FS=":"} /model name/{print "CPU Model:" $2}'
    cat /proc/cpuinfo|awk 'BEGIN{FS=":"} /CPU MHZ/{print "CPU Speed:" $2 "MHz"}'
    grep -Eq 'svm|vmx' /proc/cpuinfo && echo "Virtualization: Support" || echo "Virtualization: No Support"
    echo
}

LOAD_INFO(){
    echo
    echo -e "\033[4;31mPrint the Sytem INFO:\033[0m"
    uptime|awk 'BEGIN{FS=":"} {print $5}'|awk 'BEGIN{FS=","} {print "Last 1 minutes system load:"$1"\n""Last 5 minutes system load:"$2"\n""last 15 minutes sytem load:"$3}'
    echo
}



while true; do
    clear
    echo "-------------------------------------"
    echo "1: Display CPU info:"
    echo "2: Display System load:"
    echo "3: Display Mem and swap info:"
    echo "4: Display filesystem mount info:"
    echo "5: Exit"
    echo "-------------------------------------"

    read -p "Please select an iterm(1-4):" U_SELECT

    case $U_SELECT in
        1 )
            CPU_INFO
            HINT
            ;;
        2 )
            LOAD_INFO
            HINT
            ;;
        3)
            echo "3"
            ;;
        4)
            echo "4"
            ;;
        5)
            echo "5"
            exit 0
            ;;

        * )
            read -p "Please select 1-4, press enter to continue"
    esac
done
# while read REST; do
#     echo "good.$REST"
#     exit 0
# done