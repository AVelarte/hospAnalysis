% function [y_res,x_res] = prueba(y,x)
%    % y = rand(1,100);
%    % x = linspace(1,100);
%     %plot(x,y)
%     y_res = y * 10;
%     x_res = x * 2;
% end

% 
% f = figure(1);
% plot([10 20 30],[0.2 0.4 0.6]);
% f1 = figure;
% plot([1 2 3],[2 4 6]);
% figure(f)
% hold on;
% y = rand(1,100);
% x = linspace(1,100);
% plot(x,y)


%% Recupera los datos de un canal X (X,:) y se grafica con las líneas de trigger
datos = app.data.samples(6,:);
% datos2 = app.data.samples(2,:);
% datosPlot = datos - datos2;
figure;
plot(app.data.timestamps(1:length(app.data.sampleNumbers)), datos * app.bit_volts, 'LineWidth', 1);
% 
 for i=1:length(app.ttlEvents.timestamp)
      xline(app.ttlEvents.timestamp(i));
 end
