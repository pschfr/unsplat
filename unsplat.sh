#!/bin/bash

# Get screen resolution, storing in $X and $Y
X=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
Y=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
# echo "$X x $Y"

# Set API stuff
APP_ID="7b998a3373ba81277a2015b567194f2560ac21b14cd3d317adc3018829c46655"
API_URL="https://api.unsplash.com/photos/random?w=$X&h=$Y&client_id=$APP_ID"
# echo $API_URL

# Make curl request, storing in $RESPONSE
RESPONSE=$(curl -sSH  "Accept-Version: v1" "$API_URL")
# echo "$RESPONSE"

# Search through $RESPONSE, returning full image
grep -Po '"custom":.*?[^\\]",' <<< $RESPONSE
