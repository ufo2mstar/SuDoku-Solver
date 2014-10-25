function out=CheckSol(m,n)
for i=1:n*n
    k=0;
    for j=1:n
        if m(i,j)==0;
            k=k+1;
        end
    end
        if k==n-1;
            m(i,n+1)=1;
			for p=1:n;if m(i,p)~=0;m(i,n+3)=m(i,p);end;end
        end
end
out=m;