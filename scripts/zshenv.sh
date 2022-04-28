#!/bin/bash

export BW_SESSION=$(bw login --raw)
bw get item zshenv | jq -r '.notes' > $HOME/.zshenv

