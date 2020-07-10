function ocs=directionfeature_diff(oc,os)
[m,n]=size(oc);
os=imresize(os,[m,n],'nearest');
ocs=abs(oc-os);

%ocs=uint8(ocs);