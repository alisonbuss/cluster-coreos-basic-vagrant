#!/bin/bash

#-----------------------|DOCUMENTATION|-----------------------#
# @descr:
# @fonts: https://linuxconfig.org/how-to-set-change-a-hostname-on-coreos-linux
#         https://coreos.com/ignition/docs/latest/examples.html#set-the-hostname
#         https://www.vivaolinux.com.br/dica/Alterar-hostname-no-GNULinux-sem-reboot
#-------------------------------------------------------------#

# @descr: Main function of the script, it runs automatically on the script call.
# @param: 
#    $@ | array: (*)
function StartConfiguration {
    local HOSTNAME="${1}";

    printf '%b\n' "Initializing initial system configuration...";

    # Defining the hostname of the machine.
    hostnamectl set-hostname "${HOSTNAME}";
    hostnamectl;

    # + configs.....

    #Generating random number between 1 and 10 in Bash Shell Script
    #shuf -i1-10 -n1
}

# @descr: Call of execution of the script's main function.
StartConfiguration "$@";

# @descr: Finishing the script!!! :P
exit 0;