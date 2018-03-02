function poly = linearRegression( x, y, xstart, xend)

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
    poly = polyfit(x(startVal:endVal),y(startVal:endVal),1);
end