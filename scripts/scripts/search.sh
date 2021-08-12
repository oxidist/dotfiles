#!/bin/bash
xdg-open "$(rg --no-messages --files ~/math ~/books ~/physics ~/cam-notes \
    -g "{*.pdf,*.djvu,*.epub}" | rofi -threads 0 \
    -theme-str "#window { width: 600;}" \
    -dmenu -sort -sorting-method fzf -i -p "Documents")"

