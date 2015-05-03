function result = directionsc(image,i,j,angle,scale)
if(angle==0)
   result = image(i,j) - image(i,j+scale);
end
if(angle==45)
   result = image(i,j) - image(i-scale,j+scale);
end
if(angle==90)
   result = image(i,j) - image(i-scale,j);
end
if(angle==135)
   result = image(i,j) - image(i-scale,j-scale);
end