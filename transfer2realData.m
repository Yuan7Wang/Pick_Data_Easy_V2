function Nodes = transfer2realData(Nodes, axis)
% ������   ��Դ
% Email��  1220510620@qq.com
% TEL��    15202807597
% Date��   2015/12/16 12:26
% ��Ȩ���У�����Bug�������û���������ϵ��лл

%% the input parameter: axis = [x_ x+, y_ y+];
%%

x(1) = Nodes(1,1);
x(2) = Nodes(2,1);
y(1) = Nodes(3,2);
y(2) = Nodes(4,2); 

Nodes(5:end,1) = (Nodes(5:end,1)-x(1))/(x(2)-x(1))*(axis(2)-axis(1))+axis(1);
Nodes(5:end,2) = (Nodes(5:end,2)-y(1))/(y(2)-y(1))*(axis(4)-axis(3))+axis(3);
Nodes(1:4,:) = [];








