%% Doku Solve
% Kyu
% 18/6/2013
% Koduma Saravananay Potri !

%% start/ init
clear all;clc
n=9; % n x n Doku matrix

%% Cases
% M=[1,0,0,0;0,2,1,0;0,0,3,0;0,0,0,4]; %yup
% M=[0,0,4,0;1,0,0,0;0,0,0,3;0,1,0,0]; %yup
% M=[0,0,0,0;0,0,1,3;0,0,0,0;0,0,0,4]; % busss
% M=[5,3,0,0,7,0,0,0,0;6,0,0,1,9,5,0,0,0;0,9,8,0,0,0,0,6,0;
% 	8,0,0,0,6,0,0,0,3;4,0,0,8,0,3,0,0,1;7,0,0,0,2,0,0,0,6;
% 	0,6,0,0,0,0,2,8,0;0,0,0,4,1,9,0,0,5;0,0,0,0,8,0,0,7,9]

M=[5,3,0,0,7,0,0,0,0;6,0,0,1,9,5,0,0,0;0,9,8,0,0,0,0,6,0;
	8,0,0,0,6,0,0,0,3;4,0,0,8,0,3,0,0,1;7,0,0,0,2,0,0,0,6;
	0,6,0,0,0,0,2,8,0;0,0,0,4,1,9,0,0,5;0,0,0,0,8,0,0,7,0]

% M=[]
m=[];
tots=numel(M);

% defining Mcase
for i=1:tots
	m(i,:)=[1:n,0,i,0]; % 1:n
end

% defining McountTrack
C=reshape(1:tots,9,9); %Nice
% C=reshape(1:tots,n,n);
%% existance check
m=ExistSol(m,n,M);
m=CheckSol(m,n);

%% Main Loop
m_old=zeros(size(m));
% m_old=m
ch=0;itr=0;

while (ch==0 && itr<2*n)
		m_cur=m;
%% box check
	n2=sqrt(n);
% 	pr=[1,2,5,6;3,4,7,8;9,10,13,14;11,15,12,16]; %% generate ser fr all
% 	for i=1:n2:tots
m=BoxSol(m,n,M);
	m=CheckSol(m,n);
	
	%% First round elimin

	% Row check
m=RowSol(m,n,M);
	m=CheckSol(m,n);

	%% repetu
	% Col check
m=ColSol(m,n,M);
	m=CheckSol(m,n);
	
	%% main M
	for i=1:tots
		if m(i,n+1)==1
			M(m(i,n+2))=m(i,n+3);
		end
	end
% 	M
% 	Mprint(M)
sm=zeros(size(M));
for i=1:tots
	if i==1;	%sm=M;
		k=0;end
	if	M(i)==0; sm(i)='-';k=k+1;
	else sm(i)=int2str(M(i));
	end;
end
% sm
fprintf('%g to go : itr=%d\n',k,itr+1);
	%% End Exit
		if m(:,n+1)==ones(tots,1)
			disp('converged');
			M
			break;
		end
%% Final tally
	m_old=m_cur;
	if (m_cur==m)
		ch=1
		disp('bussssssssss !');
		disp('Check input Matrix !');
	else
		ch=0;
	end
	itr=itr+1;
end
