function [I,J,R,x_heads,y_heads,beta,gamma,TR_CN,TR_CC,alpha,d,l,TR,P,H,E,W,f_t,T_p,Pr,R_max]=eqs(nodex,nodey,H1,H2,H3,H4,H5,H6,H7,H8,H9)

I=length(nodex); % total number of x coordinates 
J=length(nodey); % total number of y coordinates 
R=2; % radius
x_heads=[H1(1) H2(1) H3(1) H4(1) H5(1) H6(1) H7(1) H8(1) H9(1)];
y_heads=[H1(2) H2(2) H3(2) H4(2) H5(2) H6(2) H7(2) H8(2) H9(2)];
beta=rand;
gamma=rand;
TR_CN= rand ; % data transmission rate between node and cluster head
TR_CC= TR_CN.*5 ; % data transmission rate between cluster head and cluster head
alpha=rand;
d=rand(100,100);



% Eq-1
% The link value
for i=1:I
    for j=1:J
        ci=[nodex(i) nodex(i)];
        cj=[nodey(i) nodey(i)];
        dist=distanceformula(ci,cj);
        if dist<=R
            l(i,j)=1;
        else
            l(i,j)=0;
        end
    end
end

% Eq-2
% Data rate between the pair of nodes

for i=1:I
    for j=1:J
        ci=[nodex(i) nodex(i)];
        cj=[nodey(i) nodey(i)];
        x_flag=0;
        y_flag=0;
        
        for k=length(x_heads)     
            if ci(1)==x_heads(k)    &&      ci(2)==y_heads(k) % x coordinate is a cluster head
                x_flag=1;
            end
            
            if cj(1)==x_heads(k)    &&      cj(2)==y_heads(k) % y coordinate is a cluster head
                y_flag=1;
            end
        end
        
        if  x_flag==1 && y_flag==1 % transmission is between cluster heads
            TR(i,j)=rand.*5;
        else  % transmission is between any 2 nodes
            TR(i,j)=rand;
        end
    end
end

% Eq-4
% Number of paths and hops
for i=1:I
    for j=1:J
        if l(i,j)==0
            P(i,j)=0;
            H(i,j)=rand;
        else
            P(i,j)=1;
            H(i,j)=1;
        end
    end
end

% Eq-3
% Weight of transmission between cluster heads
% low=0;
% high=100;
% P=round(low+(high-low).*rand(size(TR,1),size(TR,2)));
% H=round(low+(high-low).*rand(size(TR,1),size(TR,2)));
for i=1:I
    for j=1:J
        if i==j
            E(i,j)=0;
        else
            E(i,j) = l(i,j).*(P(i,j).*H(i,j)).*(TR_CC.*TR(i,j));
        end            
    end
end

% Eq-5
% Transmission weight matrix of cluster heads
for i=1:I
    for j=1:J
        W(i,j)=E(i,j);
    end
end

% Eq-6
% Transmission weight matrix of cluster heads
theta=rand;
for i=1:I
    for j=1:J
        ci=[nodex(i) nodex(i)];
        cj=[nodey(i) nodey(i)];
        x_flag=0;
        y_flag=0;
        
        for k=length(x_heads)     
            if ci(1)==x_heads(k)    &&      ci(2)==y_heads(k) % x coordinate is a cluster head
                x_flag=1;
            end
            
            if cj(1)==x_heads(k)    &&      cj(2)==y_heads(k) % y coordinate is a cluster head
                y_flag=1;
            end
        end

        if x_flag==1    &&  y_flag==1
            f_t(i,j)=theta/TR_CC;
        else
            f_t(i,j)=sum(sum(theta./(TR_CN.*H)));
        end
        
    end
end

    
% Eq-7
% Forwarding time
T_p=sum(sum(f_t));


% Eq-11,12
% Received power
d0=1;
for i=1:I
    for j=1:J
        Pr(i,j)=P(i,j)-alpha-10*log(d(i,j));
    end
end
    
    
% Eq-13
% Communication link


for i=1:I
    for j=1:J
        R_max(i,j)=gamma.*10.^(P(i,j)./(10*beta));
    end
end

end