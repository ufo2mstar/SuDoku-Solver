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
% % D=reshape(1:81,9,9) %Nice
C=reshape(1:tots,n,n);
%% existance check
m=ExistSol(m,n,M);
m=CheckSol(m,n);

%% Main Loop
m_old=zeros(size(m));
% m_old=m
ch=0;itr=0;

while (ch==0 && itr<5)
		m_cur=m;
%% box check
	n2=sqrt(n);
	pr=[1,2,5,6;3,4,7,8;9,10,13,14;11,15,12,16]; %% generate ser fr all
% 	for i=1:n2:tots
m=BoxSol(m,n,M)
	m=CheckSol(m,n)
	
	%% First round elimin

	% Row check
m=RowSol(m,n,M)
	m=CheckSol(m,n)

	%% repetu
	% Col check
m=ColSol(m,n,M)
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
			disp('converged');
	end
end