function out=ColSol(m,n,M)
tots=n*n;
	% Col check
	for i=1:n:tots
		for j=i:i+n-1 % tots?
			M(j);       %%check
			if M(j)~=0
				for k=i:i+n-1% or tots
					if j~=k;	
						if m(k,n+1)~=1
							for p=1:n
								oh=m(k,p)-m(j,p);
								m(k,p)=(oh<0)*m(k,p)+~(oh<0)*(oh); % oh whaatay thot! :) ternary;
							end
							m=CheckSol(m,n);
							% check(m,n)
						end;	
					end;
				end
			end
		end
	end
	m=CheckSol(m,n);
out=m;