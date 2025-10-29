MLP EXPLORATION: 
target 95 % accuracy

initial parameters:
set BATCH=512 && set LR=0.02 && set LR_DECAY=0.9 && set PATIENCE=50 && set ANGLE=15 && set SCALE=0.1 && set SHIFT=0.1 && set SAMPLING=1 && set STEPS=70 && python mnist_mlp.py
result: 86-89%

test with greatly increased batch size:
set BATCH=2048 && set LR=0.02 && set LR_DECAY=0.9 && set PATIENCE=50 && set ANGLE=15 && set SCALE=0.1 && set SHIFT=0.1 && set SAMPLING=1 && set STEPS=70 && python mnist_mlp.py
result: 88-90% 

test with tighter transformation thresholds:
set BATCH=512 && set LR=0.02 && set LR_DECAY=0.9 && set PATIENCE=50 && set ANGLE=7 && set SCALE=0.05 && set SHIFT=0.05 && set SAMPLING=1 && set STEPS=70 && python mnist_mlp.py
result: 91-92%

shift and scale are already close to the sweet spot in the default parameters, but we can improve the model accuracy a couple of percent if we reduce the angle with a sweet spot around 5°:
set BATCH=512 && set LR=0.02 && set LR_DECAY=0.9 && set PATIENCE=50 && set ANGLE=5 && set SCALE=0.1 && set SHIFT=0.1 && set SAMPLING=1 && set STEPS=70 && python mnist_mlp.py
result: stable 92%

changing sampling to bilinear:
set BATCH=512 && set LR=0.02 && set LR_DECAY=0.9 && set PATIENCE=50 && set ANGLE=15 && set SCALE=0.1 && set SHIFT=0.1 && set SAMPLING=0 && set STEPS=70 && python mnist_mlp.py
result:86%

test with various LR, LR-DECAY, PATIENCE only small impacts on the accuracy mainly negative:
best result: 86%


I then went back to the default configuration and added more layers 
      nn.Linear(784, 512), Tensor.silu,
      nn.Linear(512, 256), Tensor.silu,
      nn.Linear(256, 128), Tensor.silu,
      nn.Linear(128, 10),
result: 88-89%
Adding even more did not improve the result:
      nn.Linear(784, 512), Tensor.silu,
      nn.Linear(512, 256), Tensor.silu,
      nn.Linear(256, 128), Tensor.silu,
      nn.Linear(128, 64), Tensor.silu,
      nn.Linear(64, 10),

I combined every parameter that had seemingly improved the accuracy and run another bunch of testes to fine tune the parameters:  
set BATCH=2048 && set LR=0.02 && set LR_DECAY=0.9 && set PATIENCE=50 && set ANGLE=5 && set SCALE=0.1 && set SHIFT=0.1 && set SAMPLING=1 && set STEPS=70 && python mnist_mlp.py
result: 93%

I increased the STEPS to improve the model: 
The accuracy quickly increased under 150 steps then progress became slower but continued going up
set BATCH=2048 && set LR=0.02 && set LR_DECAY=0.9 && set PATIENCE=50 && set ANGLE=5 && set SCALE=0.1 && set SHIFT=0.1 && set SAMPLING=1 && set STEPS=700 && python mnist_mlp.py
result: 99%



CNN EXPLORATION: 
target 98 % accuracy

initial parameters:
set BATCH=512 && set LR=0.02 && set LR_DECAY=0.9 && set PATIENCE=50 && set ANGLE=15 && set SCALE=0.1 && set SHIFT=0.1 && set SAMPLING=1 && set STEPS=70 && python mnist_convnet.py
result: 97%

test with greatly increased batch size:
set BATCH=2048 && set LR=0.02 && set LR_DECAY=0.9 && set PATIENCE=50 && set ANGLE=15 && set SCALE=0.1 && set SHIFT=0.1 && set SAMPLING=1 && set STEPS=70 && python mnist_convnet.py
result: 97-98%

test with tighter transformation thresholds:
set BATCH=512 && set LR=0.02 && set LR_DECAY=0.9 && set PATIENCE=50 && set ANGLE=7 && set SCALE=0.05 && set SHIFT=0.05 && set SAMPLING=1 && set STEPS=70 && python mnist_convnet.Py
result: 97-98%

tighter angles looser scale and shift:
set BATCH=512 && set LR=0.02 && set LR_DECAY=0.9 && set PATIENCE=50 && set ANGLE=5 && set SCALE=0.08 && set SHIFT=0.08 && set SAMPLING=1 && set STEPS=70 && python mnist_convnet.py
result: 98%

change to bilinear:
set BATCH=512 && set LR=0.02 && set LR_DECAY=0.9 && set PATIENCE=50 && set ANGLE=15 && set SCALE=0.1 && set SHIFT=0.1 && set SAMPLING=0 && set STEPS=70 && python mnist_convnet.py
result:96% 

almost no change when modifying the learning rate, learning decay and patience
best results:96% 

tested with more layers:
          nn.Conv2d(1, 64, 3, padding=1), Tensor.silu,
          nn.Conv2d(64, 64, 3, padding=1), Tensor.silu,
          nn.BatchNorm(64), Tensor.max_pool2d,
          nn.Conv2d(64, 128, 3, padding=1), Tensor.silu,
          nn.Conv2d(128, 128, 3, padding=1), Tensor.silu,
          nn.BatchNorm(128), Tensor.max_pool2d,
          lambda x: x.flatten(1),
          nn.Linear(128 * 7 * 7, 256), Tensor.silu,
          nn.Linear(256, 10),
result: 97% but a way longer training time.
So I switched back to the default layers.

Once again, I combine every efficient modification:
set BATCH=2048 && set LR=0.02 && set LR_DECAY=0.9 && set PATIENCE=50 && set ANGLE=5 && set SCALE=0.08 && set SHIFT=0.08 && set SAMPLING=1 && set STEPS=70 && python mnist_convnet.py
result: 98-99%

I Finally increased the STEPS to improve the model: 
set BATCH=2048 && set LR=0.02 && set LR_DECAY=0.9 && set PATIENCE=50 && set ANGLE=5 && set SCALE=0.08 && set SHIFT=0.08 && set SAMPLING=1 && set STEPS=700 && python mnist_convnet.py
result: 99.64%

