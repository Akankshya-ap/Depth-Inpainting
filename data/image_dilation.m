img=imread('inpainting\other\pr_inv_mask.png');
se=strel('line',5,40);
im=imdilate(img,se,'same');
savefile='inpainting\other\pr_dil_inv_mask.mat';
save(savefile,'im')
%figure, imshow(img), figure, imshow(img2)

dirpath='C:\Users\CV LAB\Desktop\deep_image\code\deep-image-prior\deep-image-prior-master\data\inpainting\other\';
dirpath1='C:\Users\CV LAB\Desktop\deep_image\code\deep-image-prior\deep-image-prior-master\data\inpainting\other\';
type='mat';
type1='png';
oldvar='';
    infile = fullfile(dirpath, sprintf('pr_dil_inv_mask.mat'));
    outfile = fullfile(dirpath1, sprintf('pr_dil_inv_mask.png'));
    datastruct = load(infile);
    fn = fieldnames(datastruct);
    firstvar = fn{1};
    data = datastruct.(firstvar);
    imwrite( data, outfile );
    if ~strcmp(oldvar, firstvar)
      fprintf('loading from variable %s as of file %d\n', firstvar);
    end
    