#!/bin/bash

wal -R
pkill waybar
waybar &
