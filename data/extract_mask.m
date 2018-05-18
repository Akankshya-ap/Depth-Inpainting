img = imread('inpainting\pr_edit.png');
save('inpainting\other\pr.mat', 'img');

s=load('inpainting\other\pr.mat');
img=s.img;
[a b c]=size(img)
im=zeros(size(img));
im(img~=0)=255;
savefile='inpainting\other\pr_mask.mat';
save(savefile,'im')
%p=load('inpainting\8_mask.mat');
%size(p.mask)

dirpath='C:\Users\CV LAB\Desktop\deep_image\code\deep-image-prior\deep-image-prior-master\data\inpainting\other\';
dirpath1='C:\Users\CV LAB\Desktop\deep_image\code\deep-image-prior\deep-image-prior-master\data\inpainting\';
type='mat';
type1='png';
oldvar='';
    infile = fullfile(dirpath, sprintf('pr_mask.mat'));
    outfile = fullfile(dirpath1, sprintf('pr_mask.png'));
    datastruct = load(infile);
    fn = fieldnames(datastruct);
    firstvar = fn{1};
    data = datastruct.(firstvar);
    imwrite( data, outfile );
    if ~strcmp(oldvar, firstvar)
      fprintf('loading from variable %s as of file %d\n', firstvar);
    end
    