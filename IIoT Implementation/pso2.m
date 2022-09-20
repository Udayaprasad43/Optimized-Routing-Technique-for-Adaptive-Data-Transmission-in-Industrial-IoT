function pso2(handles)

% mark the base station
BSx=11.5;
BSy=11.5;
plot(BSx,BSy,'mo','LineWidth',5)
text(BSx-3,BSy-5,'BS')

% connect zone headers with the base station
plot([handles.H1(1) BSx],[handles.H1(2) BSy],'m-','LineWidth',2)
plot([handles.H2(1) BSx],[handles.H2(2) BSy],'m-','LineWidth',2)
plot([handles.H3(1) BSx],[handles.H3(2) BSy],'m-','LineWidth',2)
plot([handles.H4(1) BSx],[handles.H4(2) BSy],'m-','LineWidth',2)
plot([handles.H5(1) BSx],[handles.H5(2) BSy],'m-','LineWidth',2)
plot([handles.H6(1) BSx],[handles.H6(2) BSy],'m-','LineWidth',2)
plot([handles.H7(1) BSx],[handles.H7(2) BSy],'m-','LineWidth',2)
plot([handles.H8(1) BSx],[handles.H8(2) BSy],'m-','LineWidth',2)
plot([handles.H9(1) BSx],[handles.H9(2) BSy],'m-','LineWidth',2)

nodex=handles.nodex;
nodey=handles.nodey;

% PSO Parameters
MaxIt=1000;      % Maximum Number of Iterations
nPop=100;        % Population Size (Swarm Size)
w=1;            % Inertia Weight
wdamp=0.99;     % Inertia Weight Damping Ratio
c1=1.5;         % Personal Learning Coefficient
c2=2.0;         % Global Learning Coefficient
% Initialization
empty_particle.Position=[];
empty_particle.Cost=[];
empty_particle.Velocity=[];
empty_particle.Best.Position=[];
empty_particle.Best.Cost=[];
particle=repmat(empty_particle,nPop,1);
GlobalBest.Cost=inf;
PL=2000;
stopsim = 0;
N=length(handles.nodex);
p=0.05;
Eo=0.5;
E_dec=3;

% No of clusters
Nch = round(N*p);
% Number of Decision Variables
nVar=Nch*2;            
% Size of Decision Variables Matrix
VarSize=[1 nVar];   
% Lower Bound of Variables
VarMin=0;         
% Upper Bound of Variables
VarMax= 100;         

% Velocity Limits
VelMax=0.1*(VarMax-VarMin);
VelMin=-VelMax;

x=handles.nodex;
y=handles.nodey;
xy = [x(:) y(:)];
x = xy(:,1);
y = xy(:,2);
E = Eo*ones(1,N);

for i=1:nPop    
    % Initialize Position
    particle(i).Position=unifrnd(VarMin,10,VarSize);
    % Initialize Velocity
    particle(i).Velocity=zeros(VarSize);    
    % Evaluation
    particle(i).Cost = cost_function(particle(i).Position,xy);    
    % Update Personal Best
    particle(i).Best.Position = particle(i).Position;
    particle(i).Best.Cost = particle(i).Cost;    
    % Update Global Best
    if particle(i).Best.Cost < GlobalBest.Cost        
        GlobalBest=particle(i).Best;        
    end    
end
BestCost=zeros(MaxIt,1);

% Total energy of the system
TotalE=100*ones(1,N);
Zero_E=[];
i=0;
while(1)
    i=i+1;
    % Select a sender at random
    s=round(N*rand);    
    while(~isempty(Zero_E==s)) || s==0
        s=round(N*rand);    
    end        
    
    sx=nodex(s);
    sy=nodey(s);
    
    % Find the closest zone header
    dist_S_H1=distanceformula(handles.H1,[sx sy]);
    dist_S_H2=distanceformula(handles.H2,[sx sy]);
    dist_S_H3=distanceformula(handles.H3,[sx sy]);
    dist_S_H4=distanceformula(handles.H4,[sx sy]);
    dist_S_H5=distanceformula(handles.H5,[sx sy]);
    dist_S_H6=distanceformula(handles.H6,[sx sy]);
    dist_S_H7=distanceformula(handles.H7,[sx sy]);
    dist_S_H8=distanceformula(handles.H8,[sx sy]);
    dist_S_H9=distanceformula(handles.H9,[sx sy]);
    
    [min_S,IS]=min([dist_S_H1 dist_S_H2 dist_S_H3 dist_S_H4 dist_S_H5 dist_S_H6 dist_S_H7 dist_S_H8 dist_S_H9]);
    
    if IS==1
        sender=handles.H1;
        dist=dist_S_H1;
    elseif  IS==2
        sender=handles.H2;
        dist=dist_S_H2;
    elseif  IS==3
        sender=handles.H3;
        dist=dist_S_H3;
    elseif  IS==4
        sender=handles.H4;
        dist=dist_S_H4;
    elseif  IS==5
        sender=handles.H5;
        dist=dist_S_H5;
    elseif  IS==6
        sender=handles.H6;
        dist=dist_S_H6;
    elseif  IS==7
        sender=handles.H7;
        dist=dist_S_H7;
    elseif  IS==8
        sender=handles.H8;
        dist=dist_S_H8;
    elseif  IS==9
        sender=handles.H9;
        dist=dist_S_H9;
    end
    
    % Energy update
%     Etx = calc_tx_energy(dist,PL)
    Etx = E_dec*rand;
    TotalE(s)=TotalE(s)-Etx;
    Rem_E = (sum(TotalE) / sum(100*ones(1,N))) * 100;
    
    figure(1)
    bar(1:N,TotalE)
    title(['Sender = ' num2str(s) ', Residual energy = ' num2str(Rem_E) '%' ', Round = ' num2str(i)])
    xlabel('Node number');
    ylabel('Remaining Energy')
    axis([0 100 0 100])
    
    % Update if node energy = 0
    if TotalE(s)<=0        
        Zero_E=[Zero_E s];        
        axes(handles.axes5)
        plot(nodex(s),nodey(s),'r*','LineWidth',3)         
        nodex(s)=[];
        nodey(s)=[];
    end
    pause(0.1)
    
    if Rem_E<=98
        f = msgbox('System energy low, simulation will stop');
        break
    end
end



