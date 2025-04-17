#!/bin/bash

LOGFILE="stress-test.log"
echo "Starting WordPress container stress test..." | tee "$LOGFILE"

# Step 1: Identify WordPress containers
WP_CONTAINERS=$(docker ps --filter "ancestor=wordpress:latest" --format "{{.ID}}")

echo "Found WordPress containers:" | tee -a "$LOGFILE"
echo "$WP_CONTAINERS" | tee -a "$LOGFILE"
echo | tee -a "$LOGFILE"

# Step 2: Loop through containers and apply stress
for cid in $WP_CONTAINERS; do
  echo "Installing 'stress' in container $cid..." | tee -a "$LOGFILE"
  docker exec "$cid" bash -c "apt update && apt install -y stress" >> "$LOGFILE" 2>&1

  echo "Running stress test in container $cid (60s CPU + MEM)..." | tee -a "$LOGFILE"
  
  # Run the stress test and log output
  docker exec "$cid" bash -c "stress --cpu 2 --vm 1 --vm-bytes 128M --timeout 60s" >> "$LOGFILE" 2>&1 &
  
  echo "Started stress in $cid" | tee -a "$LOGFILE"
  echo | tee -a "$LOGFILE"
done

echo "All WordPress containers are being stressed for 60 seconds..." | tee -a "$LOGFILE"
echo "Logs saved to $LOGFILE"
echo

# Step 3: Monitor container stats live
echo "Launching live container stats. Press Ctrl+C to stop." | tee -a "$LOGFILE"
sleep 3
watch -n 2 docker stats $WP_CONTAINERS
