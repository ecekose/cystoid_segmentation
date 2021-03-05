%% reading image and converting rgb to grayscale
a=imread('labeled_macular-edema-oct-dr-rvo-1.jpg');
figure,imshow(a);
a_gray=rgb2gray((a));
figure,imshow(a_gray);
%% thresholding
t_a_gray=a_gray;
t_a_gray(t_a_gray>=100)=0;
t_a_gray(t_a_gray<=90)=0;
figure,imshow(t_a_gray,[]);
t_a_gray(t_a_gray~=0)=1;
figure,imshow(t_a_gray,[]);
%% morphological operations
se=strel('disk',1);
a2=t_a_gray;
opened_img=imopen(a2,se);
figure,imshow(opened_img,[]);
closed_img=imclose(opened_img,se);
figure,imshow(closed_img,[]);
%% creating a mask and removing boundries of cystoids
mask=imfill(closed_img,'holes');
figure,imshow(mask,[]);
r_boundries=mask-closed_img;
figure,imshow(r_boundries,[]);
