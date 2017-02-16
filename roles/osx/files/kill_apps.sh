#!/bin/sh
# Kill apps affected by defaults.yml

for app in Finder Dock Mail Safari iTunes iCal Address\ Book SystemUIServer; do
  killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."