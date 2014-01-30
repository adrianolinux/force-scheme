clear all;
x = load('mammals.data');
t = x(:,end);
x = x(:,1:end-1);

tic
options.data_type = 'data';
y = force(x,options);
toc

% plot results
figure(1);
clf;
hold on;
color = [0,0,0; 1,0,0; 0,1,0; 0,0,1];
h = scatter(y(:,1), y(:,2), 25, color(t,:), 'filled');
set(h,'markeredgecolor','k');
hold off;

%saveas(gcf,'figura.png');

