%% loading .mat files
s1=load('cystoids_wout_label.mat');
s2=load('cystoids_with_label.mat');
fields1=fieldnames(s1);
fields2=fieldnames(s2);
cystoid_wout_label=s1.(fields1{1});
cystoid_with_label=s2.(fields2{1});
%% comparison
overlap=uint8(zeros(size(cystoid_wout_label,1),size(cystoid_wout_label,2),3));

for i=1:size(cystoid_wout_label,1)
    for j=1:size(cystoid_wout_label,2)
        if (cystoid_wout_label(i,j)==1 && cystoid_with_label(i,j)==1)
          overlap(i,j,2)=255; %True positive
        else if (cystoid_wout_label(i,j)==0 && cystoid_with_label(i,j)==1)
          overlap(i,j,3)=255; %False negative
        else if (cystoid_wout_label(i,j)==1 && cystoid_with_label(i,j)==0)
          overlap(i,j,1)=255; %False positive 
            end
            end
        end
    end
end
figure,imshow(overlap,[]);

%%
tp_area=sum(sum(overlap(:,:,2)==255)) %area of true positives
fn_area=sum(sum(overlap(:,:,3)==255)) %area of false negatives
fp_area=sum(sum(overlap(:,:,1)==255)) %area of false positives