#!/bin/bash

echo "*** Get Termninal Nerd fonts ***"
echo "#######################"

# Only include the fonts that are popular for terminals
fonts_list=("JetBrainsMono" "FiraCode" "Hack" "SourceCodePro" "UbuntuMono" "DejaVuSansMono" "Meslo" "CascadiaCode")

echo "Installing all selected Nerd Fonts..."

for font_name in "${fonts_list[@]}"; do
    echo "Starting download $font_name nerd font"

    if [ "$(command -v curl)" ]; then
        echo "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip"
        curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip"
        echo "creating fonts folder: ${HOME}/.fonts"
        mkdir -p  "$HOME/.fonts"
        echo "unzip the $font_name.zip"
        unzip "$font_name.zip" -d "$HOME/.fonts/$font_name/"
        rm "$font_name.zip"  # Clean up zip file after extraction
        echo "Installed $font_name"

    elif [ "$(command -v wget)" ]; then
        echo "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip"
        wget "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name.zip"
        echo "creating fonts folder: ${HOME}/.fonts"
        mkdir -p  "$HOME/.fonts"
        echo "unzip the $font_name.zip"
        unzip "$font_name.zip" -d "$HOME/.fonts/$font_name/"
        rm "$font_name.zip"  # Clean up zip file after extraction
        echo "Installed $font_name"

    else
        echo "We cannot find the curl and wget command. First, install the curl and wget command, one of them."
        exit 1
    fi
done

# Update font cache once after all fonts are installed
fc-cache -fv
echo "All fonts have been installed!"
