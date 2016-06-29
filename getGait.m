function out = getGait(in,pts)

cnt = 0;

for i=1:2:length(pts)-2
    cnt = cnt + 1;
    out{cnt} = in(pts(i):pts(i+2));
end

end