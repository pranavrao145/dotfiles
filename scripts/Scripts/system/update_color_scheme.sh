#!/usr/bin/env bash

echo "Updating system colour scheme..."

echo "Updating Xresources..."
# update Xresources
xrdb -query -all > ~/.Xresources

echo "Updating Discord colour scheme..."
# update discord colour scheme
pywal-discord

# echo "Updating Firefox colour scheme..."
# update firefox colour scheme
# pywalfox update

echo "System colour scheme updated successfully."
