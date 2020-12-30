#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# --------------–-------–--------–--------–-------–--–-----
# System interface and behaviour
# --------------–-------–--------–--------–-------–--–-----

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Disable the “Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Disable .dsStore
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# --------------–-------–--------–--------–-------–--–-----
# SSD-specific tweaks
# --------------–-------–--------–--------–-------–--–-----

# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# Disable the sudden motion sensor as it's not useful for SSDs
sudo pmset -a sms 0

# --------------–-------–--------–--------–-------–--–-----
# Trackpad, mouse and keyboard
# --------------–-------–--------–--------–-------–--–-----

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable smart quotes as they're annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they're annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# --------------–-------–--------–--------–-------–--–-----
# Screen
# --------------–-------–--------–--------–-------–--–-----

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Save screenshots to a folder called Screenshots
mkdir ~/Documents/Screenshots
defaults write com.apple.screencapture location ~/Documents/Screenshots

# Save screenshots in JPG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "jpg"

# --------------–-------–--------–--------–-------–--–-----
# Dock, Dashboard and Menu Bar
# --------------–-------–--------–--------–-------–--–-----

# Minimize windows into their application's icon
defaults write com.apple.dock minimize-to-application -bool true

# Set icon size
defaults write com.apple.dock tilesize -int 36

# Set dock to autohide
defaults write com.apple.dock autohide -bool true



# --------------–-------–--------–--------–-------–--–-----
# Finder
# --------------–-------–--------–--------–-------–--–-----

# Allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Don't show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
