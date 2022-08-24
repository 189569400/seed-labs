#!/bin/bash

# if ASLR is disabled on host, then it will be disabled in containers
sudo sysctl -w kernel.randomize_va_space=0

ASLR=$(cat /proc/sys/kernel/randomize_va_space)

if [ $ASLR -eq 0 ]
then
   echo "  █████   ███   █████   █████████   ███████████   ██████   █████ █████ ██████   █████   █████████  ███"
   echo " ░░███   ░███  ░░███   ███░░░░░███ ░░███░░░░░███ ░░██████ ░░███ ░░███ ░░██████ ░░███   ███░░░░░███░███"
   echo "  ░███   ░███   ░███  ░███    ░███  ░███    ░███  ░███░███ ░███  ░███  ░███░███ ░███  ███     ░░░ ░███"
   echo "  ░███   ░███   ░███  ░███████████  ░██████████   ░███░░███░███  ░███  ░███░░███░███ ░███         ░███"
   echo "  ░░███  █████  ███   ░███░░░░░███  ░███░░░░░███  ░███ ░░██████  ░███  ░███ ░░██████ ░███    █████░███"
   echo "   ░░░█████░█████░    ░███    ░███  ░███    ░███  ░███  ░░█████  ░███  ░███  ░░█████ ░░███  ░░███ ░░░ "
   echo "     ░░███ ░░███      █████   █████ █████   █████ █████  ░░█████ █████ █████  ░░█████ ░░█████████  ███"
   echo "      ░░░   ░░░      ░░░░░   ░░░░░ ░░░░░   ░░░░░ ░░░░░    ░░░░░ ░░░░░ ░░░░░    ░░░░░   ░░░░░░░░░  ░░░ "
   echo ""
   echo "ADDRESS SPACE LAYOUT RANDOMIZATION (ASLR) HAS BEEN DISABLED ON THE HOST SO THAT IT'LL BE DISABLED IN THE CONTAINER."
   echo "THIS IS A SERIOUS SECURITY VULNERABILITY THAT WILL PERSIST BEYOND RUNNING THIS CHALLENGE!"
   echo ""
   echo "DO YOU UNDERSTAND THAT YOUR HOST SYSTEM HAS BEEN MADE VULNERABLE IN ORDER TO RUN THIS CHALLENGE,"
   while true; do
      read -p "AND DO YOU AGREE TO ENABLE ASLR ON YOUR HOST WHEN THIS CHALLENGE IS COMPLETED? [Y|N] " yn
      case $yn in
         [Yy]* )
            echo "Starting up containers..."
            sudo docker-compose up -d
            sudo docker ps -f name=return_to_libc_
            break
            ;;
         [Nn]* )
            echo "ASLR MUST BE DISABLED ON THE HOST SO THAT IT WILL BE DISABLED IN THE CONTAINERS..."
            exit
            ;;
         * )
            echo "Please answer yes or no!"
            ;;
      esac
   done
else
   echo "ASLR was NOT disabled! Manually disable it before running this script again: 'sudo sysctl -w kernel.randomize_va_space=0'"
fi
