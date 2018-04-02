function v = SolveErgodicDTMC(P)
m = length(P);
M = eye(m) - P;
M(:,end)=ones(m,1);
y = zeros(1,m);
y(m)=1;
v = y*inv(M);
end
