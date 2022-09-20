

% function pso(handles)

clc
clear
close all

PL=2000;
stopsim = 0;
N=10;
p=0.05;
Eo=0.5;
BSx=5;
BSy=5;

high=10; % higher bound for a coordinate value
low=0; % lower bound for a coordinate value
nodex=low+((high-low).*rand(1,N)); % generate a random x coordinate
nodey=low+((high-low).*rand(1,N)); % generate a random y coordinate
x=nodex;
y=nodey;

legtemp = 'PSO';
    % Problem Definition
% No of clusters

Nch = round(N*p);

nVar=Nch*2;            % Number of Decision Variables

VarSize=[1 nVar];   % Size of Decision Variables Matrix

VarMin=0;         % Lower Bound of Variables
VarMax= 100;         % Upper Bound of Variables


    


xy = [x(:) y(:)];

x = xy(:,1);
y = xy(:,2);



E = Eo*ones(1,N);



% PSO Parameters

MaxIt=1000;      % Maximum Number of Iterations

nPop=100;        % Population Size (Swarm Size)

% PSO Parameters
w=1;            % Inertia Weight
wdamp=0.99;     % Inertia Weight Damping Ratio
c1=1.5;         % Personal Learning Coefficient
c2=2.0;         % Global Learning Coefficient


% Velocity Limits
VelMax=0.1*(VarMax-VarMin);
VelMin=-VelMax;

% Initialization

empty_particle.Position=[];
empty_particle.Cost=[];
empty_particle.Velocity=[];
empty_particle.Best.Position=[];
empty_particle.Best.Cost=[];

particle=repmat(empty_particle,nPop,1);

GlobalBest.Cost=inf;

for i=1:nPop
    
    
    
    % Initialize Position
%     particle(i).Position=unifrnd(VarMin,VarMax,VarSize);
    particle(i).Position=unifrnd(VarMin,10,VarSize);
    % Initialize Velocity
    particle(i).Velocity=zeros(VarSize);
    
    % Evaluation
%     particle(i).Cost=CostFunction(particle(i).Position);
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

% set(handles.text24,'String','Clustering using PSO.')
% axes(handles.axes1)
figure(3)
% PSO Main Loop
tt = 1:N;
for it=1:MaxIt
    
    for i=1:nPop
        
        % Update Velocity
        particle(i).Velocity = w*particle(i).Velocity ...
            +c1*rand(VarSize).*(particle(i).Best.Position-particle(i).Position) ...
            +c2*rand(VarSize).*(GlobalBest.Position-particle(i).Position);
        
        % Apply Velocity Limits
        particle(i).Velocity = max(particle(i).Velocity,VelMin);
        particle(i).Velocity = min(particle(i).Velocity,VelMax);
        
        % Update Position
        particle(i).Position = particle(i).Position + particle(i).Velocity;
        
        % Velocity Mirror Effect
        IsOutside=(particle(i).Position<VarMin | particle(i).Position>VarMax);
        particle(i).Velocity(IsOutside)=-particle(i).Velocity(IsOutside);
        
        % Apply Position Limits
        particle(i).Position = max(particle(i).Position,VarMin);
        particle(i).Position = min(particle(i).Position,VarMax);
        
        % Evaluation
%         particle(i).Cost = CostFunction(particle(i).Position);
        particle(i).Cost = cost_function(particle(i).Position,xy);
        
        
        % Update Personal Best
        if particle(i).Cost<particle(i).Best.Cost
            
            particle(i).Best.Position=particle(i).Position;
            particle(i).Best.Cost=particle(i).Cost;
            
            % Update Global Best
            if particle(i).Best.Cost<GlobalBest.Cost
                
                GlobalBest=particle(i).Best;
                
                % ----------- Visualise ------------------------------
                plot(xy(:,1),xy(:,2),'.');
                hold on
                for ii=1:length(x)
                text(x(ii)+1,y(ii),num2str(tt(ii)'))
                end
                CC = GlobalBest.Position;
                plot(CC(1:2:end),CC(2:2:end),'rs','markerfacecolor','g','markersize',8);
                
                voronoi(CC(1:2:end),CC(2:2:end))
                pause(0.001)
                hold off
                % ---------------------------------------------------------
                
            end
            
        end
        
    end
    
    BestCost(it)=GlobalBest.Cost;
    
    txt = sprintf('Iteration= %d: Best Cost = %f\n',it,BestCost(it));
%     set(handles.text25,'String',txt)
    
    w=w*wdamp;
    
    if it>20
        if BestCost(it) == BestCost(it-5);
            break;
        end
    end
    
end

BestSol = GlobalBest;
% Results
figure;
% axes(handles.axes4)
%plot(BestCost,'LineWidth',2);
semilogy(BestCost,'LineWidth',2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;

% axes(handles.axes1)
figure(3)
tt = 1:N;
plot(xy(:,1),xy(:,2),'o');
hold on
text(xy(:,1)+1,xy(:,2),num2str(tt'))
CC = BestSol.Position;
plot(CC(1:2:end),CC(2:2:end),'rs','markerfacecolor','g','markersize',8);


% No of rounds starts here
% Plot

% For each cluster center find nearest node.
CCx = CC(1:2:end);
CCy = CC(2:2:end);

% Intialise empty CH
CH = [];
for ii = 1:Nch

    % Calculate distance of iith cluster center to all nodes
    dist = sqrt((CCx(ii)-xy(:,1)).^2 + (CCy(ii)-xy(:,2)).^2);

    % Remove previously selected CHs
    dist(CH) = Inf;

    % find nearest node to iith cluster center
    [v, ix] = min(dist);

    % Store nearest neighbour as cluster head
    CH = [CH ix];


end

plot(x(CH),y(CH),'ro','markerfacecolor','r','markersize',8)
voronoi(x(CH),y(CH))
legend('Nodes','PSO cluster center','CH')

%
Avec = zeros(1,10000);
Evec = zeros(1,10000);
Dvec = zeros(1,10000);
Vvec = zeros(1,10000);
Pvec = zeros(1,10000);
  
tt = 1:N;

colors = {'r','g','b','m','c','k','y','r','g','b','m','c','k','y','r','g','b','m','c','k','y','r','g','b','m','c','k','y','r','g','b','m','c','k','y'...
    ,'r','g','b','m','c','k','y','r','g','b','m','c','k','y','r','g','b','m','c','k','y','r','g','b','m','c','k','y','r','g','b','m','c','k','y'...
    ,'r','g','b','m','c','k','y','r','g','b','m','c','k','y','r','g','b','m','c','k','y','r','g','b','m','c','k','y','r','g','b','m','c','k','y'};

showround = 50;

% set(handles.text24,'String','')
% set(handles.text25,'String','')
for r11 = 1:10000


        % Variable for speed
%     if get(handles.checkbox1,'Value')==1 % Make it 1 for high speed or 0 for low speed
%         speed1 = 0;
speed1=round(rand);
        pause(0.001)
%     else
%         speed1 = 1;
%     end
    % Perform communication
    % Cluster nodes as per current cluster head
    Cid = cluster_node(CH,xy);

    % Dead node id
    Did = find(E<=0);
    
    if  speed1 ==0
%         axes(handles.axes5)
figure(1)
         hold off
    % ---------------- Plotting --------------- 
    plot(xy(:,1),xy(:,2),'o');
    hold on
    text(xy(:,1)+1,xy(:,2),num2str(tt'))

    plot(CC(1:2:end),CC(2:2:end),'rs','markersize',12);

    plot(x(CH),y(CH),'ro','markerfacecolor','r','markersize',8)

    % Plot dead nodes
    plot(x(Did),y(Did),'ks','markerfacecolor','k','markersize',8)
    voronoi(x(CH),y(CH))
    

    
    % Plot basestation
    plot(BSx,BSy,'rs','markerfacecolor','c','markersize',10)
    text(BSx+2,BSy,'BS','fontsize',10,'fontweight','bold','color','b')

    for ii = 1:Nch

        % Get all index of iith cluster
        idx= find(Cid==ii);
% ii
% idx
% x(idx)
% y(idx)
% colors{ii}

        % highlight with respective color
        plot(x(idx),y(idx),'o','color',colors{ii})
    end
   
    title(['Round = ' num2str(r11)])
    axis([-5 BSx+5 -5 BSy+5])
    end
    % ----------------------------------------

    % Perform communcation

    % Packate count for cluster heads
    Pcount = zeros(1,length(CH));
    % From nodes to CH
    for ii = 1:N

        
        % Get cluster ID
        idc = Cid(ii);

        % Get x and y cordinate of respective CH
        chx = x(CH(idc));
        chy = y(CH(idc));

        
        Pcount(idc) = Pcount(idc)+1;
        % if node is dead then dont perform any communication
        if ismember(ii,Did)
            continue;
        end
        if  speed1 ==0
            % Perform communication
            plot([x(ii) chx],[y(ii) chy],'g-')
        end

        % Calculate travelling distance
        dist = sqrt((x(ii)-chx)^2+(y(ii)-chy)^2);

        % Calculate transmission energy
        Etx = calc_tx_energy(dist,PL);

        % Reduce it from transmitter node
        E(ii) = E(ii)- Etx;

        % Calcualte receiving energy
        Erx = calc_rx_energy(PL);

        % Reduce it from received cluster head
        E(CH(idc)) = E(CH(idc))-Erx;

        
    end


    % From CH to BS
    for ii = 1:length(CH)

        % Get cordinates of CH
        chx = x(CH(ii));
        chy = y(CH(ii));

        if  speed1 ==0
            % Show communication Line
            plot([BSx chx],[BSy chy],'m--','linewidth',2)
        end

        % Calculate transmission energy
        Etx = calc_tx_energy(dist,PL + PL*Pcount(ii));

        % Reduce it from transmitter node
        E(CH(ii)) = E(CH(ii))- Etx;
    end

    % If any cluster head dies then run PSO to find new CH
    if sum(E(CH)<=0)>=1
        
        disp('========= PSO clustering ==================')
        
%         set(handles.text24,'String','Clustering using PSO.')
        % Remove died ID and create new cluster
        Did = find(E<=0);
        
        xtemp = x;
        ytemp = y;
        
        xtemp(Did) = [];
        ytemp(Did) = [];
        
        xytemp = [xtemp(:) ytemp(:)];
        
        BestSol = PSO_clustering(particle,xytemp,VarMax,VarMin,VarSize,GlobalBest,speed1,handles);

        GlobalBest = BestSol;
        
        % Get new cluster center
        CC = BestSol.Position;
        
        CH = determine_new_CH(CC,Nch,xy,Did);
        
    end
    
% set(handles.text24,'String','')
% set(handles.text25,'String','')
    % make negative values to zero
    E(E<0) = 0;
    
    % Calculate number of alive nodes
    Nalive = sum(E>0);
    
    % Calculate number of dead nodes
    Ndead = sum(E<=0);
   
    % Calcualte residual energy
    Renergy = sum(E);
    
    % Calculate variance
    var1 = var(E);
    
    % Throughput
    TP = sum(Pcount)*PL;
    
    if speed1==0
      
%        axes(handles.axes2)
figure(2)
       bar(1:N,E)
       xlabel('Node number');
       ylabel('Remaining Energy')
    end

    Avec(r11) = Nalive;
    Evec(r11) = Renergy;
    Dvec(r11) = Ndead;
    Vvec(r11) = var1;
    Pvec(r11) = Avec(r11)*PL;

    fprintf('Round = %d, Alive node = %d, Residual Energy = %f\n',r11,Nalive,Renergy)
    if Nalive<Nch+2
        break;
    end
%       set(handles.text16,'String',num2str(r11))
%         set(handles.text18,'String',num2str(Avec(r11)))
%         set(handles.text20,'String',num2str(Evec(r11)))
%         set(handles.text22,'String',num2str(Vvec(r11)))
        if stopsim == 1
            break;
        end
        pause(0.00000000000000000000000000000000001)
end
% Get the values
Evec1op = Evec(1:r11);
Avec1op = Avec(1:r11);
Dvec1op = Dvec(1:r11);
Vvec1op = Vvec(1:r11);
Pvec1op = Pvec(1:r11-1);
Pvec1op = cumsum(Pvec1op);


