#!/bin/sh

for f in /home/gdupont/Documents/data/VTEC/processed/VTEC/*.vtec; do 
mv -- "$f" "${f%.vtec}.csv"
done
