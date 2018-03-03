function [poly, mse] = linearRegression( x, y, xstart, xend)

    found = 0;
    for i = 1:length(x)
        if (xstart <= x(i)) && ~found
           startVal = i;
           found = 1;
        elseif found && (xend <= x(i))
           endVal = i;
           found = 2;
           break;
        end
    end
    if found == 1
        endVal = i;
    end
    
    range = startVal:endVal;
    poly = polyfit(x(range),y(range),1);
    ret = polyval(poly,x(range));
    
    sum = 0;
    for i = 1:length(ret)
        sum = sum + (y(startVal-1+i)-ret(i))^2;
    end
    mse = sum / (i - 2);
end