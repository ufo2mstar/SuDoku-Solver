%% Doku Solve
% Kyu
% 18/6/2013
% Koduma Saravananay Potri !

%% start/ init
clear all;clc
n=4; % n x n Doku matrix
M=[1,0,0,0;0,2,1,0;0,0,3,0;0,0,0,4]
m=[]
tots=numel(M)

% defining Mcase
for i=1:tots
    m(i,:)=[1:4,i]; % 1:n
end

% defining McountTrack
C=M;
for i=1:tots
    C(i)=i;
end
%% existance check
for i=1:tots
    for j=1:n
        if M(i)~=0
    if M(i)~=m(i,j)
        m(i,j)=0
    end
        end
    end
end
        
%% First round elimin
% Row check
for i=1:n
    for j=1:n
        if M(i,j)~=0
        end
    end
end

% Col check
for i=1:n
    for j=1:n
        
    end
end