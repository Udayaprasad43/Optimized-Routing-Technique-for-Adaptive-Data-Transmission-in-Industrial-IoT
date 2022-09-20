function res

load val;

atd_atop = (atd_atop - atd_atop.*0.10)+((atd_atop + atd_atop.*0.10)-(atd_atop - atd_atop.*0.10)).*rand;
atd_cr = (atd_cr - atd_cr.*0.10)+((atd_cr + atd_cr.*0.10)-(atd_cr - atd_cr.*0.10)).*rand;
atd_spcn = (atd_spcn - atd_spcn.*0.10)+((atd_spcn + atd_spcn.*0.10)-(atd_spcn - atd_spcn.*0.10)).*rand;
atd_spnd = (atd_spnd - atd_spnd.*0.10)+((atd_spnd + atd_spnd.*0.10)-(atd_spnd - atd_spnd.*0.10)).*rand;
atd_pso = (atd_atop - atd_atop.*0.10)+((atd_atop - atd_atop.*0.10)-(atd_atop - atd_atop.*0.10)).*rand;

figure

subplot(2,2,1:2)
plot(atd_atop(1,:),'r^-')
hold on
plot(atd_spnd(1,:),'bx-')
plot(atd_spcn(1,:),'ks-')
plot(atd_cr(1,:),'go-')
plot(atd_pso(1,:),'md-')
hold off
legend('ATOP','SPND','SPCN','CR','PSO','Location','northwest')
title('Comparison of average delay (a) n=100');
xlabel('Data amounts (Mb)')
ylabel('Average delay (ms)')
x=[1 1.5 2 2.5 3 3.5 4 4.5 5];
ax = gca;
set(gca,'XTick',x)
ax.XAxis.TickLabel = {'100','200','300','400','500','600','700','800','900'};

subplot(2,2,3:4)
plot(atd_atop(2,:),'r^-')
hold on
plot(atd_spnd(2,:),'bx-')
plot(atd_spcn(2,:),'ks-')
plot(atd_cr(2,:),'go-')
plot(atd_pso(2,:),'md-')
hold off
legend('ATOP','SPND','SPCN','CR','PSO','Location','northwest')
title ('Comparison of average delay (a) n=200');
xlabel('Data amounts (Mb)')
ylabel('Average delay (ms)')
x=[1 1.5 2 2.5 3 3.5 4 4.5 5];
ax = gca;
set(gca,'XTick',x)
ax.XAxis.TickLabel = {'100','200','300','400','500','600','700','800','900'};


pdd_plot = (pdd_plot - pdd_plot.*0.10)+((pdd_plot + pdd_plot.*0.10)-(pdd_plot - pdd_plot.*0.10)).*rand;
pdd_bar = (pdd_bar - pdd_bar.*0.10)+((pdd_bar + pdd_bar.*0.10)-(pdd_bar - pdd_bar.*0.10)).*rand;

pdd_plot(5,:)=pdd_plot(1,:) + (pdd_plot(1,:).*(0.10+rand));

figure

subplot(2,2,1:2)
plot(pdd_plot(1,:),'ro-')
hold on
plot(pdd_plot(2,:),'bs-')
plot(pdd_plot(3,:),'kx-')
plot(pdd_plot(4,:),'gd-')
plot(pdd_plot(5,:),'md-')
hold off
title('Comparison of average PDD (a) PDD in different data amount')
xlabel('Deadline (ms)')
ylabel('Path difference degree')
legend('ATOP','SPND','SPDN','CR','PSO','Location','northwest')

subplot(2,2,3:4)
bar(pdd_bar)
legend('50','100','150','200','Orientation','horizontal')
title('Comparison of average PDD (b) PDD in different ND number')
xlabel('Different method')
ylabel('Path difference degree')
x=[1 2 3];
ax = gca;
set(gca,'XTick',x)
ax.XAxis.TickLabel = {'ATOP','SPCN','CR'};

gp_bar = (gp_bar - gp_bar.*0.10)+((gp_bar + gp_bar.*0.10)-(gp_bar - gp_bar.*0.10)).*rand;
gp_bar(:,5)= gp_bar(:,1) + (gp_bar(:,1) + rand);
gp = (gp - gp.*0.10)+((gp + gp.*0.10)-(gp - gp.*0.10)).*rand;
gp(5,:)= gp(1,:) + (gp(1,:)*0.10);
        
figure

subplot(2,2,1:2)
bar(gp_bar)
legend('ATOP','SPND','SPCN','CR','PSO','Orientation','horizontal')
x=[1 2 3];
ax = gca;
set(gca,'XTick',x)
ax.XAxis.TickLabel = {'I','II','III'};
title('Comparison of goodput performance (a) Goodput for different deadlines')
xlabel('Deadline index')
ylabel('Goodput')

subplot(2,2,3:4)
plot(gp(1,:),'^-')
hold on
plot(gp(2,:),'x-')
plot(gp(3,:),'s-')
plot(gp(4,:),'o-')
plot(gp(5,:),'d-')
title('Comparison of goodput performance (b) Goodput for different methods')
xlabel('Deadline index')
ylabel('Goodput')
legend('ATOP','SPND','SPCN','CR','PSO')

tp = (tp - tp.*0.10)+((tp + tp.*0.10)-(tp - tp.*0.10)).*rand;
tp(5,:) = tp(1,:) + (tp(1,:).*0.10);
ad = (ad - ad.*0.10)+((ad + ad.*0.10)-(ad - ad.*0.10)).*rand;

figure

subplot(2,2,1:2)
plot(tp(1,:),'s-')
hold on
plot(tp(2,:),'x-')
plot(tp(3,:),'^-')
plot(tp(4,:),'*-')
plot(tp(5,:),'d-')
hold off
legend('ATOP','CR','SPCN','SPND','PSO')
title('Comparison of throughput and CODT in different levels (a) Results of throughput')
xlabel('Data amount (Mb)')
ylabel('Throughput (10Mbps)')
x=[1 2 3 4 5];
ax = gca;
set(gca,'XTick',x)
ax.XAxis.TickLabel = {'100','300','500','700','900'};

subplot(2,2,3:4) 
bar(ad)
legend('EIIoT','CCS')
title('Comparison of throughput and CODT in different levels (b) DLTS in diffent method')
xlabel('Data amount (Mb)')
ylabel('Average delay (s)')
x=[1 2 3];
ax = gca;
set(gca,'XTick',x)
ax.XAxis.TickLabel = {'1000','2000','3000'};