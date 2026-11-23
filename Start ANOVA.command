#!/bin/bash
cd "$(dirname "$0")"
PORT=8770
URL="http://127.0.0.1:${PORT}/stories_and_statistics.html#anova"
if command -v python3 >/dev/null 2>&1; then
  PY=python3
elif command -v python >/dev/null 2>&1; then
  PY=python
else
  open "stories_and_statistics.html#anova"
  exit 0
fi
echo "Opening ${URL}"
echo "Leave this window open. Press Ctrl+C to stop."
"$PY" -m http.server "$PORT" >/tmp/doe-stories-server.log 2>&1 &
PID=$!
sleep 0.6
open "$URL"
trap 'kill "$PID" 2>/dev/null; exit 0' INT TERM
wait "$PID"
