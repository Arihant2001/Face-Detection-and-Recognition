cam = webcam;
load mytrainingNet.mat;
faceDetector = vision.CascadeObjectDetector;
while true
    snps = cam.snapshot;
    bboxes = step(faceDetector,snps);
    if(sum(sum(bboxes))~=0)                             % if boxes are not empty or there is a face detected
        es = imcrop(snps,bboxes(1,:));                  % cropping the face part
        es = imresize(es,[227 227]);                    % resizing to 227 x 227
        [label,scores] = classify(mytrainingNet,es);    % classifying using mytrainingNet.mat i.e. already trained model
        image(snps);
        if(all(scores > 0.001))
            image(snps);
            title('Not in the database');
            continue;
        end
        title(char(label));                             % to see what the classifier is predicting, to know the accuracy
        drawnow;
    else
        image(snps);
        title('No Face is Detected');
    end
end