#!/bin/sh
LOG=/tmp/postroot.log
{
echo "== post-root payload 1: $(date)"
id
touch /var/luna/preferences/webosbrew_sshd_enabled && echo "sshd flag set"
touch /var/luna/preferences/webosbrew_block_updates && echo "block-updates flag set"
ls -la /var/luna/preferences/ | grep webosbrew
echo "== done"
} > $LOG 2>&1
chmod 644 $LOG
