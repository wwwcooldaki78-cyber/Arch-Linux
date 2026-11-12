#!/bin/bash

# Set the path to the wallpapers directory
wallpapersDir="$HOME/Pictures/Wallpaper"

# Get a list of all image files in the wallpapers directory
wallpapers=("$wallpapersDir"/*)

# Start an infinite loop
while true; do
    # Check if the wallpapers array is empty
    if [ ${#wallpapers[@]} -eq 0 ]; then
        # If the array is empty, refill it with the image files
        wallpapers=("$wallpapersDir"/*)
    fi

    # Select a random wallpaper from the array
    wallpaperIndex=$(( RANDOM % ${#wallpapers[@]} ))
    selectedWallpaper="${wallpapers[$wallpaperIndex]}"

    # Update the wallpaper using the swww img command
    awww img --resize="fit" "$selectedWallpaper" --transition-type="random" --transition-step="2" --transition-fps="60"
    #matugen image /home/daky/Pictures/Wallpaper/79044784_p0.png -m smart -t scheme-fidelity --prefer=darkness &
    matugen image "$selectedWallpaper" -m dark -t scheme-fidelity --prefer=darkness &
    # Remove the selected wallpaper from the array
    #unset "wallpapers[$wallpaperIndex]"
    wallpapers=("${wallpapers[@]}")

    # Delay for 2 hours before selecting the next wallpaper
    sleep 5m
done
