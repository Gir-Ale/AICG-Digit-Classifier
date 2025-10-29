cd /d "%~dp0"

start "" chrome --incognito "http://localhost:8000/Digit Classifier.html"

python -m http.server