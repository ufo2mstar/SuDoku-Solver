function out=ExistSol(m,n,M)
%% existance check
for i=1:n*n
	for j=1:n
		if M(i)~=0
			%             m(i,n+1)=1;
			if M(i)~=m(i,j)
				m(i,j)=0;
			end
		end
	end
end
out=m;