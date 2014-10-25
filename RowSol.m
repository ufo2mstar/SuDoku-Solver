function out=RowSol(m,n,M)
tots=n*n;
	% Row check
	for i=1:n
		for j=i:n:(n)*n % tots?
			M(j);
			if M(j)~=0
				for k=i:n:(n)*n% or tots
					if j~=k
						if m(k,n+1)~=1
							for p=1:n
								oh=m(k,p)-m(j,p);
								m(k,p)=(oh<0)*m(k,p)+~(oh<0)*(oh); % whaatay thot! :) ternary
							end
						m=CheckSol(m,n);
						end
					end
				end
			end
		end
	end
	m=CheckSol(m,n);
out=m;