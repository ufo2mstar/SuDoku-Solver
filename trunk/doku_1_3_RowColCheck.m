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
    m(i,:)=[1:4,0,i]; % 1:n
end

% defining McountTrack
C=M;
for i=1:tots
    C(i)=i;
end
C
%% existance check
for i=1:tots
    for j=1:n
        if M(i)~=0
            m(i,n+1)=1;
            if M(i)~=m(i,j)
                m(i,j)=0;
            end
        end
    end
end

%% First round elimin
% Row check
for i=1:n
    for j=i:n:(n-1)*n % tots?
        M(j)
        if M(j)~=0
            for k=i:n:(n)*n% or tots
                if j~=k
                    if m(k,n+1)~=1
                m(k,1:n)=m(k,1:n)-m(j,1:n)
                    end
                end
            end
        end
    end
end
m

%% assign done to m
for i=1:tots
    k=0;
    for j=1:n
        if m(i,j)==0;k=k+1;        end
        if k==n-1;m(i,n+1)=1;        end
    end
end

%% repetu    
% Col check
for i=1:n:(n-1)*n 
    for j=i:i+n-1 % tots?
        M(j);       %%check
        if M(j)~=0
            for k=i:tots% or tots
                if j~=k
                    if m(k,n+1)~=1
                        for p=1:n
                oh=m(k,p)-m(j,p);
                m(k,p)=~(oh<0)*(oh)+(oh<0)*m(k,p); % whaatay thot! :) ternary
                        end
%                         check(m,n)
                    end
                end
            end
        end
    end
end

%% assign done to m
for i=1:tots
    k=0;
    for j=1:n
        if m(i,j)==0;k=k+1;        end
        if k==n-1;m(i,n+1)=1;        end
    end
end

    m