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

M=[5,3,0,0,7,0,0,0,0;6,0,0,1,9,5,0,0,0;0,9,8,0,0,0,0,6,0;
	8,0,0,0,6,0,0,0,3;4,0,0,8,0,3,0,0,1;7,0,0,0,2,0,0,0,6;
	0,6,0,0,0,0,2,8,0;0,0,0,4,1,9,0,0,5;0,0,0,0,8,0,0,7,9]

% M=[5,3,0,0,7,0,0,0,0;6,0,0,1,9,5,0,0,0;0,9,8,0,0,0,0,6,0;
% 	8,0,0,0,6,0,0,0,3;4,0,0,8,0,3,0,0,1;7,0,0,0,2,0,0,0,6;
% 	0,6,0,0,0,0,2,8,0;0,0,0,4,1,9,0,0,5;0,0,0,0,8,0,0,7,0]
% 
% M=[0,0,9,3,0,0,0,5,4;0,4,0,0,8,0,0,0,1;0,0,0,6,5,0,0,0,0;3,2,0,7,0,0,0,0,0;0,0,0,4,3,2,7,0,0;0,5,7,0,9,0,0,3,0;0,3,0,0,0,0,0,1,9;0,9,0,0,0,0,8,0,0;0,6,8,0,0,9,0,0,0]
% a=['000010200010058040403007000000000000051009008009420000000000060704003050508000009']
% for i=1:81
% 	M(i)=str2double(a(i));
% end
% M
% M=[
%     2,0,0,7,1,0,0,6,0
%     0,0,5,0,8,2,0,0,3
%     0,7,0,0,9,0,0,0,0
%     0,8,0,3,0,0,0,0,0
%     0,6,0,0,7,0,0,5,0
%     0,0,0,0,0,5,0,2,0
%     0,0,0,0,5,0,0,3,0
%     4,0,0,1,3,0,7,0,0
%     0,3,0,0,6,4,0,0,1]


tic
% M=[]
m=[];
tots=numel(M);
% defining Mcase 'm'
for i=1:tots
	m(i,:)=[1:n,0,i,0]; % 1:n
end
% defining McountTrack
C=reshape(1:tots,n,n); %Nice
%% existance check
m=ExistSol(m,n,M);
m=CheckSol(m,n);

%% Main Loop
m_old=zeros(size(m));
% m_old=m
ch=0;itr=0;

while (itr<2*n)
		m_cur=m;
%% box check
m=BoxSol(m,n,M);
	m=CheckSol(m,n);
	% Row check
m=RowSol(m,n,M);
	m=CheckSol(m,n);
	% Col check
m=ColSol(m,n,M);
	m=CheckSol(m,n);
	
	%% main M
	for i=1:tots
		if m(i,n+1)==1
			M(m(i,n+2))=m(i,n+3);
		end
	end
	%% End Exit
		if m(:,n+1)==ones(tots,1)
			disp('converged to');
			M
			toc
			break;
		end
%% Final tally
	m_old=m_cur;
	if (m_cur==m)
		ch=ch+1
		if ch==3
		itr
		M
		disp('bussssssssss !');
		disp('Hmmm.. Somethins missin.. Check input doku !');
		break;
		end
	else
		ch=0;
	end
	itr=itr+1;
end
