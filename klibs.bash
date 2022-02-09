#!/usr/bin/env bash

check_dependencies(){
    R=$1 && REQUIRED_DEPENDENCIES=${R[@]}
    MISSING_DEPENDENCIES=()                                                                                                    
                                                                                                                               
    for DEPENDENCY in ${REQUIRED_DEPENDENCIES[@]}; do                                                                          
        command -v $DEPENDENCY >/dev/null 2>&1 || { MISSING_DEPENDENCIES+=($DEPENDENCY); }                                       
    done                                                                                                                       
                                     
    # Instead of exiting when we see a missing command, let's be nice and give the user a list.                                
    if [ ${#MISSING_DEPENDENCIES[@]} -ne 0 ]; then                                                                             
        printf 'Oops. Missing some dependencies:\n'
        printf '> Missing %s, please install it!\n' "${MISSING_DEPENDENCIES[@]}"                                                   
        printf 'Exiting.\n'                                                                                                      
        exit 1;                                                                                                                  
    fi  
}

