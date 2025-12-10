#!/bin/bash


#notify-send "Locking the computer..."

# Take a screenshot
#scrot /tmp/screenshot.png

# Blur the screenshot
#convert /tmp/screenshot.png -blur 0x5 /tmp/screenshot_blur.png

# Lock the screen with the blurred screenshot
#i3lock -i /tmp/screenshot_blur.png

# Clean up temporary files
#rm /tmp/screenshot.png /tmp/screenshot_blur.png

# Function to display a notification
show_notification() {
  # Define notification text
  notification_text="$1"

  # Display a notification using `notify-send`
  notify-send -t 1000 -u normal -a "i3lock" "i3lock" "$notification_text"
}

# Display a notification before locking
show_notification "Locking the computer..."

# Delay for a moment to allow the user to see the notification
sleep 1.5

# Take a screenshot
scrot /tmp/screenshot.png

# Blur the screenshot
convert /tmp/screenshot.png -blur 0x3 /tmp/screenshot_blur.png

# Lock the screen with the blurred screenshot
i3lock -i /tmp/screenshot_blur.png -n

# Clean up temporary files
rm /tmp/screenshot.png /tmp/screenshot_blur.png

# Display a notification after unlocking
show_notification "Computer unlocked."
