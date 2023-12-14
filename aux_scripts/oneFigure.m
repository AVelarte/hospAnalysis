h = msgbox("Plotting data ...");
figure('NumberTitle', 'off','Name','Multiple Ch.');
for i = 1:length(app.chSelect)
    if(app.chSelect(i))
        plot(app.data.timestamps(1:length(app.data.sampleNumbers)), app.data.samples(i,:) * app.bit_volts, 'LineWidth', 1, 'DisplayName',"Ch."+i);
        ylabel("Voltage (uV)", 'FontSize', 16);
        xlabel("Time (s)", 'FontSize', 16);
        title("Raw Channels", 'FontSize', 20);
        hold on;
    end
end
for i=1:length(app.ttlEvents.timestamp)
        xline(app.ttlEvents.timestamp(i),'HandleVisibility','off');
end
lgd = legend;
lgd.NumColumns = 2;
delete(h);