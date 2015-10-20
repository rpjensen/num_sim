function [ TZoom, YZoom ] = partIIIZoom( T, Y )
% Find the intersection point of the substrate and product then return the
% T,Y values within +- spread of the intersection point
spread = 1.5;

time = 0;
tIndex = 1;
for i = 1:(length(T)-1)
    % If the previous substrate was greater than product and now it isn't
    if Y(i,1) >= Y(i,4) && Y(i+1,1) < Y(i+1,4)
        time = T(i);
        tIndex = i;
        break;
    end
end

index = 1;
times = T(tIndex);
vals = Y(tIndex, :);
for i = 1:length(T)
   if T(i) > time - spread && T(i) < time + spread
       times(index) = T(i);
       vals(index, :) = Y(i, :);
       index = index + 1;
   end
end

TZoom = times;
YZoom = vals;

end

