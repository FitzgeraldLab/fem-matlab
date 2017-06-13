frames = [568,600,544,860,1748,5358,1179,405,489];

disp('For video frames')
averageT = mean(frames)
stdevT = std(frames)

disp('For video time in seconds')
times = frames / 10;
averageF = mean(times)
stdevF = std(times)

x = (-5 * averageF:0.01:5 * averageF) + stdevF;  %// Plotting range
y = exp(- 0.5 * ((x - stdevF) / averageF) .^ 2) / (averageF * sqrt(2 * pi));
plot(x, y)