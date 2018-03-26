function [poly, minse] = linearRegression( x, y, xstart, xend)

    for i = length(xstart):-1:1
        found = 0;
        for j = 1:length(x)
            if (xstart(i) <= x(j)) && ~found
                startVal = j;
                found = 1;
            elseif found && (xend(i) <= x(j))
                break;
            end
        end
        endVal = j;

        range = startVal:endVal;
        poly(i,:) = polyfit(x(range),y(range),1);
        ret = polyval(poly(i,:),x(range));

        sum = 0;
        for j = 1:length(ret)
            sum = sum + (y(startVal-1+j)-ret(j))^2;
        end
        minse(i) = sum / (j - 2);
    end
end