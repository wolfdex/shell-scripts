#!/bin/bash
mkdir -p /tmp/ucache/$(whoami)/.cache
# mount --bind /tmp/ucache/$(whoami)/.cache ~/.cache ## nur root
ln -sf "/tmp/ucache/$(whoami)/.cache"  ~/.cache
ln -sf /tmp/ucache/$(whoami)/  ~/ramdisk
