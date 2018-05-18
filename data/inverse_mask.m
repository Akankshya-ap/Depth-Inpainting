%im = imread('inpainting\6_crop_mask.png');
%save('inpainting\other\6_crop_mask.mat', 'im');
s=load('inpainting\other\pr_dil_inv_mask.mat');
im=s.im;

mask_inverse=zeros(size(im));
mask_inverse(im~=0)=0;
mask_inverse(im==0)=255;
savefile='inpainting\other\pr_dil_mask.mat';
save(savefile,'mask_inverse')
%p=load('inpainting\8_mask_inverse.mat');
%size(p.mask)

    