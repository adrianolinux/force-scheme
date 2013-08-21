%{
x = load('data/wine.data');
t = x(:,1);
n = size(x,1);
%}
%{
data_set = 'c';
x = load('data/cancer.data',',');
x = x(:,2:size(x,2));
t = x(:,10);
n = size(x,1);
%}
data_set = 'm';
x = load('../data/mammals.data');
t = x(:,size(x,2));
x = x(:,1:size(x,2)-1);
n = size(x,1);
%{
data_set = 'd';
  x = unique(load('data/diabetes-normcols.data'),'rows');
  t = x(:,size(x,2));
  x = x(:,2:size(x,2)-1);
  n = size(x,1);
%}
%{
data_set = 'W';
  % usar sigma = 100
  x = unique(load('data/wdbc-std.data'),'rows');
  t = x(:,size(x,2));
  x = x(:,2:size(x,2)-1);
  n = size(x,1);
%}

iter = 20;

tic
[y,z] = force(x,iter);
toc

% plot results

if (data_set == 'W')

  clf;
  hold on;
  plot(y(t == 1,1), y(t == 1,2), 'r+', ...
       y(t == 0,1), y(t == 0,2), 'b+');
  hold off;

elseif (data_set == 'd')

  clf;
  hold on;
  plot(y(t == 1,1), y(t == 1,2), 'r+', ...
       y(t == 2,1), y(t == 2,2), 'b+');
  hold off;

elseif (data_set == 'c')
figure(1);
clf;
hold on;
plot(y(t == 4,1), y(t == 4,2), 'r.', ...
     y(t == 2,1), y(t == 2,2), 'b.');
hold off;

elseif (data_set == 'm')

figure(1);
clf;
hold on;
plot(y(t == 1,1), y(t == 1,2), 'r+', ...
     y(t == 2,1), y(t == 2,2), 'g+', ...
     y(t == 3,1), y(t == 3,2), 'b+', ...
     y(t == 4,1), y(t == 4,2), 'k+');
hold off;

else

figure(1);
clf;
set(axes, 'FontSize', 16);
subplot(1,2,1);
plot(z(t == 1,1), z(t == 1,2), 'r.', ...
     z(t == 2,1), z(t == 2,2), 'b+', ...
     z(t == 3,1), z(t == 3,2), 'go');
title(['NNP']);
subplot(1,2,2);
plot(y(t == 1,1), y(t == 1,2), 'r.', ...
     y(t == 2,1), y(t == 2,2), 'b+', ...
     y(t == 3,1), y(t == 3,2), 'go');
title(['Force iter = ' num2str(iter)]);
%{
title(['Sammon Mapping of the Iris Dataset (stress = ' num2str(E) ')']);
legend('Setosa', 'Versicolour', 'Virginica');
%}

end % if

%saveas(gcf,'figura_ce.png');
%exit;

