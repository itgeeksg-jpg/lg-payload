#!/bin/sh
LOG=/tmp/postroot2.log
{
echo "== payload 2: $(date)"
id
echo "-- re-running elevate-service to confirm:"
/media/developer/apps/usr/palm/services/org.webosbrew.hbchannel.service/elevate-service && echo "elevate OK" || echo "elevate rc=$?"
ls -la /var/lib/webosbrew 2>/dev/null || echo "(no /var/lib/webosbrew yet)"
echo "-- removing LG devmode app:"
luna-send -n 1 -w 3000 'luna://com.webos.applicationManager/removeApp' '{"id":"com.palmdts.devmode"}'
sleep 2
echo "-- done, rebooting"
sync
} > $LOG 2>&1
chmod 644 $LOG
reboot
