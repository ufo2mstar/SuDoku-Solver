function out=BoxSol(m,n,M)
n2=sqrt(n);
% pr=[1,2,5,6;3,4,7,8;9,10,13,14;11,15,12,16]; %% generate ser fr all
pr=[1	28	55	4	31	58	7	34	61
2	29	56	5	32	59	8	35	62
3	30	57	6	33	60	9	36	63
10	37	64	13	40	67	16	43	70
11	38	65	14	41	68	17	44	71
12	39	66	15	42	69	18	45	72
19	46	73	22	49	76	25	52	79
20	47	74	23	50	77	26	53	80
21	48	75	24	51	78	27	54	81
]';
% 	for i=1:n2:tots
for i=1:n
	for j=1:n
		if m(pr(i,j),n+1)==1
			for k=1:n
				if k~=j;
					if m(pr(i,k),n+1)==0;
						for p=1:n
						oh=m(pr(i,k),p)-m(pr(i,j),p);
						m(pr(i,k),p)=(oh<0)*m(pr(i,k),p)+~(oh<0)*(oh);
						end
					end;
				end;
			end
		end
	end
end
m=CheckSol(m,n);
out=m;