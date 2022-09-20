function flag=check_sender_zone(s,g,nodex,nodey)

sender=[nodex(s) nodey(s)];
flag=0;
for i=1:size(g,1)
    if sender(1)==g(i,1)    &&  sender(2)==g(i,2)
        flag=1;
    end
end

end    