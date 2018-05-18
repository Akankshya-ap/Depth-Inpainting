dirpath='C:\Users\CV LAB\Desktop\deep_image\code\deep-image-prior\deep-image-prior-master\data\inpainting\other\';
dirpath1='C:\Users\CV LAB\Desktop\deep_image\code\deep-image-prior\deep-image-prior-master\data\inpainting\';
type='mat';
type1='png';
oldvar='';
    infile = fullfile(dirpath, sprintf('pr_dil_mask.mat'));
    outfile = fullfile(dirpath1, sprintf('pr_dil_mask.png'));
    datastruct = load(infile);
    fn = fieldnames(datastruct);
    firstvar = fn{1};
    data = datastruct.(firstvar);
    imwrite( data, outfile );
    if ~strcmp(oldvar, firstvar)
      fprintf('loading from variable %s as of file %d\n', firstvar);
    end
    
%im = imread('6_mask.png');
%save('6_mask_1.mat', 'im');
%p=load('6_mask_dil.mat');
%size(p.im)
