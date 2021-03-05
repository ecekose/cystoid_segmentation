# Cystoid Segmentation
![image](https://user-images.githubusercontent.com/57571696/110129188-b7809f80-7dd8-11eb-9b44-64c331b343ab.png)
*Cystoid Macula Edema (CME) [1]* 
![image](https://user-images.githubusercontent.com/57571696/110132020-ca48a380-7ddb-11eb-90b2-7b18a6bbd934.png)
*Cystoid segmentation with labelled image* 
![image](https://user-images.githubusercontent.com/57571696/110132141-e9473580-7ddb-11eb-90de-dfaa70234f1d.png)
*Cystoid segmentation with unlabelled image* 

 Comparing segmentation results between labelled and unlabelled image data which are taken from OCT. 

# Motivation

Looking at Optical Coherence Tomography (OCT) images with bare eyes might not be sufficient always to diagnose diseases for doctors and radiologists. However, observing the variations of Cystoid Macular Edema (CME) before and after surgery plays a critical role in Ophthalmology. Finding labelled data may not be possible usually, that's why I've been trying to develop an algorithm without labelled data in this repository. This kind of software allows the clinical workers to treat optical disorders, save time and track changes accurately. 

# Ultimate Goal

In this repo, I used basic preprocessing techniques such as K-means clustering, morphological operations, thresholding etc. Of course, these are essential for image processing and computer vision studies. My ultimate goal is increasing accuracy, making this algorithm automatic and efficient application for the health industry.

# Resource

[1] https://www.eyelifevision.com/portfolio/macular-edema/

