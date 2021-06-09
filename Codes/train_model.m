% using alexnet network
warning off
g = alexnet;
layers = g.Layers;
layers(23) = fullyConnectedLayer(4);
layers(25) = classificationLayer;
allImages = imageDatastore('dataset','IncludeSubfolders',true,'LabelSource','foldernames');
options = trainingOptions('sgdm','InitialLearnRate',0.001,'MaxEpochs',25,'MiniBatchSize',64);
mytrainingNet = trainNetwork(allImages,layers,options);
save mytrainingNet;