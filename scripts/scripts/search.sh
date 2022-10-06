#!/bin/bash
xdg-open "$(rg --no-messages --files ~/math ~/books ~/prog ~/physics ~/cam-notes \
    -g "{*.pdf,*.djvu,*.epub}" | rofi -threads 0 \
    -theme-str "#window { width: 800;}" \
    -dmenu -sort -sorting-method fzf -i -p "Documents")"

