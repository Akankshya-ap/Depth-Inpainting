% Demo for Structured Edge Detector (please see readme.txt first).

%% set opts for training (see edgesTrain.m)
opts=edgesTrain();                % default options (good settings)
opts.modelDir='models/';          % model will be in models/forest
opts.modelFnm='modelBsds';        % model name
opts.nPos=5e5; opts.nNeg=5e5;     % decrease to speedup training
opts.useParfor=0;                 % parallelize if sufficient memory

%% train edge detector (~20m/8Gb per tree, proportional to nPos/nNeg)
tic, model=edgesTrain(opts); toc; % will load model if already trained

%% set detection parameters (can set after training)
model.opts.multiscale=0;          % for top accuracy set multiscale=1
model.opts.sharpen=2;             % for top speed set sharpen=0
model.opts.nTreesEval=4;          % for top speed set nTreesEval=1
model.opts.nThreads=4;            % max number threads for evaluation
model.opts.nms=0;                 % set to true to enable nms

%% evaluate edge detector on BSDS500 (see edgesEval.m)
if(0), edgesEval( model, 'show',1, 'name','' ); end

%% detect edge and visualize results
I = imread('C:\Users\CV LAB\Desktop\deep_image\code\deep-image-prior\deep-image-prior-master\data\sr\depth.png');
tic, E=edgesDetect(I,model); %toc
%im(tic)
figure(1); im(I);  figure(2); im(1-E);
%imwrite(im(1-E),'9_edge.png')
P=E;

%saveas(P,'9_edge.png')

cdata = im(1-E); % get image data (if you don't have variable 'im')
whos P

rgbImage=cat(3, P,P,P);
figure(3);
im(rgbImage);
imwrite(rgbImage,'C:\Users\CV LAB\Desktop\deep_image\code\deep-image-prior\deep-image-prior-master\data\sr\depth_edge.png')
%saveas(rgbImage,'9_edge.png')
%cmap = jet(10); 
%figure(3);
%result = ind2rgb(P,cmap);
%im(result)

