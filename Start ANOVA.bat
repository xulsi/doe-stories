@echo off
cd /d "%~dp0"
set PORT=8770
set URL=http://127.0.0.1:%PORT%/stories_and_statistics.html#anova
where python >nul 2>&1 && (
  echo Opening %URL%
  echo Leave this window open. Press Ctrl+C to stop.
  start "" "%URL%"
  python -m http.server %PORT%
  goto :eof
)
where py >nul 2>&1 && (
  echo Opening %URL%
  echo Leave this window open. Press Ctrl+C to stop.
  start "" "%URL%"
  py -m http.server %PORT%
  goto :eof
)
start "" "%~dp0stories_and_statistics.html#anova"
