img=imread('inpainting/6.png');
[l,n]=superpixels(img,1500);
%fprintf(l)
BW=boundarymask(l);
x=l(223,877)
a=zeros(size(l));
a(l==x)=1;

%fprintf(BW)
m=imoverlay(img,BW,'blue');
figure, imshow(m,'InitialMagnification',67)
save('other\6_sup_d.mat','m')
%load('inpainting\6_sup.mat')

segmented_images = cell(1,max(max(l)));

rgb_label = repmat(l,[1 1 3]);

