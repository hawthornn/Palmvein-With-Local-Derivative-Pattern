function [result] = Histogram_Intersection3(train,test)
    k = 0;
    for i=1:size(train,1)
        k = k + min(train(i),test(i)); 
    end
    result = k/sum(test(2:end,:));
end