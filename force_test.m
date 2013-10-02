x = load('mammals.data');
t = x(:,size(x,2));
x = x(:,1:size(x,2)-1);
n = size(x,1);

iter = 20;

tic
[y,z] = force(x,iter);
toc

% plot results
figure(1);
clf;
hold on;
plot(y(t == 1,1), y(t == 1,2), 'r+', ...
     y(t == 2,1), y(t == 2,2), 'g+', ...
     y(t == 3,1), y(t == 3,2), 'b+', ...
     y(t == 4,1), y(t == 4,2), 'k+');
hold off;

%saveas(gcf,'figura.png');

