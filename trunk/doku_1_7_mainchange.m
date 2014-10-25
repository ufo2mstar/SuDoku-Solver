%% Doku Solve
% Kyu
% 18/6/2013
% Koduma Saravananay Potri !

%% start/ init
clear all;clc
n=4; % n x n Doku matrix
M=[1,0,0,0;0,2,1,0;0,0,3,0;0,0,0,4];
m=[];
tots=numel(M);

% defining Mcase
for i=1:tots
	m(i,:)=[1:4,0,i,0]; % 1:n
end

% defining McountTrack
% C=M;
% for i=1:tots
%     C(i)=i;
% end
% C
% % D=reshape(1:81,9,9) %Nice
C=reshape(1:tots,n,n);
%% existance check
for i=1:tots
	for j=1:n
		if M(i)~=0
			%             m(i,n+1)=1;
			if M(i)~=m(i,j)
				m(i,j)=0;
			end
		end
	end
end
m=CheckSol(m,n);

%% Main Loop
m_old=zeros(size(m));
% m_old=m
ch=0;itr=1;
while (ch==0)
	%% First round elimin
	m_cur=m;
	% Row check
	for i=1:n
		for j=i:n:(n-1)*n % tots?
			M(j);
			if M(j)~=0
				for k=i:n:(n)*n% or tots
					if j~=k
						if m(k,n+1)~=1
							m(k,1:n)=m(k,1:n)-m(j,1:n);
						end
						m=CheckSol(m,n);
					end
				end
			end
		end
	end
	m=CheckSol(m,n)
	% %% assign done to m
	% for i=1:tots
	%     k=0;
	%     for j=1:n
	%         if m(i,j)==0;k=k+1;        end
	%         if k==n-1;m(i,n+1)=1;        end
	%     end
	% end
	
	%% repetu
	% Col check
	for i=1:n:(n-1)*n
		for j=i:i+n-1 % tots?
			M(j);       %%check
			if M(j)~=0
				for k=i:n:tots% or tots
					if j~=k;	if m(k,n+1)~=1
							for p=1:n
								oh=m(k,p)-m(j,p);
								m(k,p)=(oh<0)*m(k,p)+~(oh<0)*(oh); % whaatay thot! :) ternary
							end
							m=CheckSol(m,n);
							% check(m,n)
						end;	end;
				end
			end
		end
	end
	m=CheckSol(m,n)
	
	%% box check
	n2=sqrt(n);
	pr=[1,2,5,6;3,4,7,8;9,10,13,14;11,15,12,16]; %% generate ser fr all
% 	for i=1:n2:tots
for i=1:n
	for j=1:n
		if m(pr(i,j),n+1)==1
			for k=1:n
				if k~=j; if m(pr(i,j),n+1)==0; 
						oh=m(pr(i,k))-m(pr(i,j));
						m(pr(i,k))=(oh<=0)*m(pr(i,k))+~(oh<=0)*(oh);
				end;	end;
			end
		end
	end
end
	m=CheckSol(m,n)
	
	%% Final tally
	m_old=m_cur;
	if (m_cur==m)
		ch=1
	else
		ch=0;
	end
	itr=itr+1
	
	%% main M
	for i=1:tots
		if m(i,n+1)==1
			M(m(i,n+2))=m(i,n+3);
		end
	end
	M
	%% End Exit
		if m(:,n+1)==ones(tots,1)
		break;
	end
end