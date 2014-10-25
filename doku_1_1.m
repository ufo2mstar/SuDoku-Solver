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
    m(i,:)=1:4; % 1:n
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
        
% %% failed naming
% for i=1:numel(M)
%     a=int2str(i)
%     'M'+a=[1,2,3]
% end
