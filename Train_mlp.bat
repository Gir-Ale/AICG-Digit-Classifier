cd /d "%~dp0"

set BATCH=2048 && set LR=0.02 && set LR_DECAY=0.9 && set PATIENCE=50 && set ANGLE=5 && set SCALE=0.1 && set SHIFT=0.1 && set SAMPLING=1 && set STEPS=700 && python mnist_mlp.py
