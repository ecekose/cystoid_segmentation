%% reading image and converting rgb to grayscale
a=imread('macular-edema-oct-dr-rvo-1.jpg');
figure,imshow(a);
a_gray=rgb2gray((a));
figure,imshow(a_gray);
%% k-means
nrows1 = size(a_gray,1);
ncols1 = size(a_gray,2);
ab1 = double(a_gray(:));
k1 = 2;
f1=rng(1);
idx1= kmeans(ab1,k1,'start','uniform');
clustered_img = reshape(idx1,nrows1,ncols1);
clustered_img(clustered_img==1)=0;
clustered_img(clustered_img==2)=1;
figure,imshow(clustered_img,[]);
%% morphological operations
se=strel('disk',1);
closed_img=imclose(clustered_img,se);
figure,imshow(closed_img);
%% finding biggest component
cc=bwconncomp(closed_img);
numPixels=cellfun(@numel,cc.PixelIdxList);
arrayin=sort(numPixels,'descend');
[v1,idx1]=find(numPixels==arrayin(1,1));
cnew1=closed_img;
cnew1(cc.PixelIdxList{idx1})=1;
cnew1(~cc.PixelIdxList{idx1})=0;
cluster1=zeros(size(closed_img,1),size(closed_img,2));
cluster1(cc.PixelIdxList{idx1})=1;
figure,imshow(cluster1,[]);
%% morphological operations #2
se2=strel('disk',2);
opened_img=imopen(cluster1,se2);
figure,imshow(opened_img);
%% finding biggest component #2
cc2=bwconncomp(opened_img);
numPixels=cellfun(@numel,cc2.PixelIdxList);
arrayin=sort(numPixels,'descend');
[v2,idx2]=find(numPixels==arrayin(1,1));
cnew2=opened_img;
cnew2(cc2.PixelIdxList{idx1})=1;
cnew2(~cc2.PixelIdxList{idx1})=0;
cluster2=zeros(size(opened_img,1),size(opened_img,2));
cluster2(cc2.PixelIdxList{idx1})=1;
figure,imshow(cluster2,[]);
%% morphological operations #3 and creating a mask
se3=strel('disk',9);
closed_img2=imclose(cluster2,se3);
figure,imshow(closed_img2);
mask=imfill(closed_img2,'holes');
figure,imshow(mask,[]);
%% multiplying the mask with the original image to obtain cystoid region
masked_img=double(a_gray).*mask;
figure,imshow(masked_img,[]);
%% k-means #2
nrows2 = size(masked_img,1);
ncols2 = size(masked_img,2);
ab2 = double(masked_img(:));
k2 = 2;
f2=rng(1);
idx2= kmeans(ab2,k2,'start','uniform');
clustered_img2 = reshape(idx2,nrows2,ncols2);
clustered_img2(clustered_img2==1)=0;
clustered_img2(clustered_img2==2)=1;
figure,imshow(clustered_img2,[]);
%% morphological operations #3 and creating a mask #2
se3=strel('disk',3);
closed_img3=imclose(clustered_img2,se3);
mask2=imfill(closed_img3,'holes');
figure,imshow(mask2,[]);

%inverting the matrix and extracting target regions(cystoids)
closed_img3=~closed_img3;
figure,imshow(closed_img3);
masked_img2=mask2.*closed_img3;
figure,imshow(masked_img2);
save('cystoids_wout_label.mat','masked_img2');
%% bringing some color to cystoids to make them happy
cc3=bwconncomp(masked_img2);
labeled=labelmatrix(cc3);
RGB_labeled= label2rgb(labeled, 'spring', 'k', 'shuffle'); 
figure,imshow(RGB_labeled,'InitialMagnification','fit');





