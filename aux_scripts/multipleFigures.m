h = msgbox("Plotting data ...");
for i = 1:length(app.chSelect)
    if(app.chSelect(i))
        figure('NumberTitle', 'off','Name','Ch. '+string(i));
        plot(app.data.timestamps(1:length(app.data.sampleNumbers)), app.data.samples(i,:) * app.bit_volts, 'LineWidth', 1);
        ylabel("Voltage (uV)", 'FontSize', 16);
        xlabel("Time (s)", 'FontSize', 16);
        title("Raw Ch." + i, 'FontSize', 20);
       legend("Ch." + i);   
    end
    
    try
        for i=1:length(app.ttlEvents.timestamp)
            xline(app.ttlEvents.timestamp(i),'HandleVisibility','off');
        end
    catch
    msgbox("ESTE REGISTRO NO CONTIENE TIMESTAMPS DEL GENERADOR");    
    end
    
end
delete(h);