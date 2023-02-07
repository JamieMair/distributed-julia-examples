#!/bin/bash
echo "Running GPU interactive session for 8 hours"
echo "Use Ctrl+a d to detach from screen and screen -r cpuinter to reconnect"
screen -S cpuinter srun --nodes=1 --nodelist=orpheus --ntasks-per-node=1 --cpus-per-task=8 --mem-per-cpu=3850 --partition=compute --time=08:00:00 --pty bash


srun --nodes=2 --ntasks-per-node=4 --cpus-per-task=2 --mem-per-cpu=3850 --partition=compute --time=08:00:00 --pty bash
