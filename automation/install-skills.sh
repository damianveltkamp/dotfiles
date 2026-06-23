#!/bin/sh

npx skills add git@github.com:damianveltkamp/dotfiles --global --yes \
  --skill post-merge \
  --skill promote

echo ""
echo "✓ Skills installed. Any 'PromptScript' errors above can be ignored — Claude Code installation succeeded."
