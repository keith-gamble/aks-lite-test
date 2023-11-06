#!/bin/bash

find . -name overlays -type d | while read overlay_dir; do
  ls -1 "$overlay_dir" | while read overlay; do
    if ! kustomize build "$overlay_dir/$overlay" > /dev/null; then
      echo "Kustomize build failed for $overlay_dir/$overlay"
      exit 1
    fi
  done
done
