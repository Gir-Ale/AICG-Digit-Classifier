# MLP/CNN 10 DIGIT CLASSIFIER
<img width="260" height="365" alt="Capture d'écran 2025-10-30 123954" src="https://github.com/user-attachments/assets/a83c68ae-c457-4cc4-bb25-ec2f02dd8521" />
<img width="260" height="365" alt="Capture d'écran 2025-10-30 124029" src="https://github.com/user-attachments/assets/a0f9f480-65a3-4a41-8cb1-6e86e5e7aa47" />

## Demo:

https://gir-ale.github.io/AICG-Digit-Classifier/

## Overview:
This project shows the training and evaluation of a basic neural network-based digit classifier. It uses tinygrad, a lightweight deep learning framework, to train a Multilayer Perceptron (MLP) and a Convolutional Neural Network (CNN) to do image classification on the MNIST dataset. 
The models were deployed directly in the browser using WebGPU, making it more accessible than an app and proving the capabilities of modern browsers.


## Features:

 - The website contains two digit recognition algorithms, the Multilayer
   Perceptron (MLP)  model and Convolutional Neural Network (CNN). The user can
   choose one of these two.
   
 - After a model is selected, the user can draw any digit from 0 to 9   
   inside the blank canvas. He can erase any mistake with the eraser, or
   reset the canvas with the clear button.

   

 - The algorithm will answer to the user which digit he believes he   
   sees. It will also show a bar plot that describes how similar he   
   think the written digit is to any number.

   

 - The algorithm will also display its inference in real time.

## Model Summary:
| Model | Architecture |Accuracy|
|--|--|--|
|MLP|Input(784) → 512 → 256 → 128 → Output(10)|99.%|
|CNN|Conv(1→32,5) → SiLU → Conv(32→32,5) → SiLU → BN → MaxPool → Conv(32→64,3) → SiLU → Conv(64→64,3) → SiLU → BN → MaxPool → Flatten → Linear(576→10)|99.64%|


## Local Setup:

After downloading the project, you can test different parameters by modifying them inside the "Train_cnn.bat" or "Train_mlp.bat" files. Then, run them to build the model.

If you are using Chrome, you can run the "test.bat" file to quickly load the model inside your browser.

If you are not using Chrome, use the "testB.bat" file, but be aware that the model will be saved in your browser cache and that any modification you apply might not be loaded. To counter this, you can open the page inside the incognito mode of your desired browser.

You can also access "mnist_convnet.py" or "mnist_mlp.py" to modify the model, or "index.html" to modify the website structure.




## Hyperparameters:


https://github.com/Gir-Ale/AICG-Digit-Classifier/blob/main/HYPERPARAMETERS.md
