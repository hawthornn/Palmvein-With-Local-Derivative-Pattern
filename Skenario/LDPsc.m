function [result] = LDPsc(img2,angle,scale)
img = padarray(img2, [scale*2+1 scale*2+1]);
[row, col] = size(img);
for i = 2*scale+1 : row-(scale*2+1)
    for j = 2*scale+1 : col-(scale*2+1)
        p = 0;
        val = 0;
        if((directionsc(img,i,j,angle,scale) * directionsc(img,i-scale,j-scale,angle,scale)) > 0)
            b = 1;
        else
            b = 0;
        end
        val = val + b*(2^p);
        if((directionsc(img,i,j,angle,scale) * directionsc(img,i-scale,j,angle,scale)) > 0)
            b = 1;
        else
            b = 0;
        end
        p = p + 1;
        val = val + b*(2^p);
        if((directionsc(img,i,j,angle,scale) * directionsc(img,i-scale,j+scale,angle,scale)) > 0)
            b = 1;
        else
            b = 0;
        end
        p = p + 1;
        val = val + b*(2^p);
        if((directionsc(img,i,j,angle,scale) * directionsc(img,i,j+scale,angle,scale)) > 0)
            b = 1;
        else
            b = 0;
        end
        p = p + 1;
        val = val + b*(2^p);
        if((directionsc(img,i,j,angle,scale) * directionsc(img,i+scale,j+scale,angle,scale)) > 0)
            b = 1;
        else
            b = 0;
        end
        p = p + 1;
        val = val + b*(2^p);
        if((directionsc(img,i,j,angle,scale) * directionsc(img,i+scale,j,angle,scale)) > 0)
            b = 1;
        else
            b = 0;
        end
        p = p + 1;
        val = val + b*(2^p);
        if((directionsc(img,i,j,angle,scale) * directionsc(img,i+scale,j-scale,angle,scale)) > 0)
            b = 1;
        else
            b = 0;
        end
        p = p + 1;
        val = val + b*(2^p);
        if((directionsc(img,i,j,angle,scale) * directionsc(img,i,j-1,angle,scale)) > 0)
            b = 1;
        else
            b = 0;
        end
        p = p + 1;
        val = val + b*(2^p);
        img2(i,j) = val;
    end
end
result = img2;