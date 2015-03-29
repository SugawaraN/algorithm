clear all;
 
p = 0.5;
ganma = 0.9;
r = [1 4; 2 -1; 3 1];
 
V = [50; 50; 50];
vbuf = zeros(3,2);
v = zeros(3,100);

for i=1:100
    vbuf(:,1) = r(:,1) + ganma*V;
    vbuf(:,2) = r(:,2) + ganma*circshift(V,-1);
    V = p*vbuf(:,2) + (1-p)*vbuf(:,1);
    v(:,i) = V;
end
 
plot(v.');



















