% impact of M, N on the utility

clear all
M1 = 50; R = 5; N1 = 50; 
%M = 10;
N = 4;

ratio = 5; nozero=1; 
rev = ones(1,N1);


%[~,basedemand] = dataok();
[fullcapa,data] = dataTON()

[data5,data6,data7,data8] = generateDataFixedProportion2(M1,R,N1,ratio,M1,N,nozero,fullcapa,rev);
demand = data7;
demand(1:10,1:5,1:4) = data;


%basedemand(1:5,1:5,1:4) =  data(1:5,1:5,1:4);
%cap = 100*ones(1,N);
% uncapped
%cap1 = 30*ones(1,N);
%cap2 = 25*ones(1,N);
%ucap = bigM*ones(1,N);
% budget1 = ones(1,N);
% 
% budget = ones(1,N);
% budget = randi(3,1,N);
%budget = rand(1,N);
budget = ones(1,N);
cap = 30*ones(1,N);
M = 2:2:20;
L = length(M);
u =  zeros(L,N);
for l=1:L
    capa = ones(M(l),R);
    basedemand = demand(1:M(l),1:R,1:N);
    [~,u(l,:),~,~,~] =  capLinearLeontief(budget,basedemand,capa,cap);    
end

%plot(M,u(:,1),M,u(:,2),M,u(:,3),M,u(:,4),'linewidth' == 2.5);
mm = M';
plot(mm,u(:,1),mm,u(:,2),mm,u(:,3),mm,u(:,4));


% [p,u,iu,x,demand] =  uncapLinearLeontief(budget,basedemand,capa,cap);
% uu1 = min(u,cap1');
% uu2 = min(u,cap2');
% 
% [p1,u1,iu1,x1,demand1] =  capLinearLeontief(budget,basedemand,capa,cap1);
% 
% [p2,u2,iu2,x2,demand2] =  capLinearLeontief(budget,basedemand,capa,cap2);
% 
% b=1:M;
% plot(b,p1(:,1),b,p1(:,2),b,p1(:,3),b,p1(:,4),b,p1(:,5))
