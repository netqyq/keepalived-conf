#!/bin/bash
#

contact='root@localhost'

Usage() {
        echo "Usage: `basename $0` {master|backup|fault} VIP" 
}

Notify() {
    subject="`hostname`'s state changed to $1" 
    mailbody="`date "+%F %T"` `hostname`'s state changed to $1, $VIP floating"
    echo $mailbody | mail -s "$subject" $contact
}

[ $# -lt 2 ] && Usage && exit 1
VIP=$2

case $1 in
master)
    Notify master
;;
backup)
    Notify backup
;;
fault)
    Notify fault
;;
*)
    Usage
    exit 1
;;
esac
