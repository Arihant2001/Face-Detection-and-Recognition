%to create dataset(for image capturing)
warning off;
cam = webcam;                                   % to turn on the web cam
faceDetector = vision.CascadeObjectDetector;    % Detecting the face Based on Viola Johns algorithm
sample_images = 350;
temp = 200;
while temp < sample_images
    snaps = cam.snapshot;
    imageFacePart = step(faceDetector,snaps);   % for detecting the face
    if(sum(sum(imageFacePart))~=0)
        if(temp>=sample_images)
            break;
        else
            face = imcrop(snaps,imageFacePart(1,:));
            face = imresize(face,[227 227]);
            filename = strcat(num2str(temp),'.bmp');
            imwrite(face,filename);
            temp = temp + 1;
            imshow(face);
            drawnow;
        end
    else
        imshow(snaps);
        drawnow;
    end
end