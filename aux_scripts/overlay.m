%function [sampleX, sampleY] =  overlay()
    h = msgbox("Plotting data ...");
    for i = 1:length(app.chSelect)
        if(app.chSelect(i))
            datos = app.data.samples(i,:) * app.bit_volts;
            tiempos = app.data.timestamps;
            timeStamp = app.ttlEvents.timestamp;
            sampleX = [];
            sampleY = [];
            idMax = 0;

            for j=1:2:length(timeStamp)-2
             id = tiempos >= timeStamp(j) & tiempos < timeStamp(j+2);
             if(nnz(id) < idMax | j==1)
                 idMax = nnz(id);
             end
             X{j-fix(j/2)} = tiempos(id);
             Y{j-fix(j/2)} = datos(id);
            end

            figure('NumberTitle', 'off','Name','ROI Ch. '+string(i));
            ylabel("Voltage (uV)", 'FontSize', 16);
            xlabel("Time (s)", 'FontSize', 16);
            for j=1:length(X)
                sampleX = [sampleX, X{j}(1:idMax,:)];
                sampleX2(:,j) = sampleX(:,j) - sampleX(1,1);
                
                sampleY = [sampleY; Y{j}(:,1:idMax)];

                plot(sampleX2(:,j), sampleY(j,:));
                title("Raw Channel "+i, 'FontSize', 20);
                hold on;
            end
            
            sampleX = sampleX2;
            figure('NumberTitle', 'off','Name','Overlay Ch. '+string(i));

            for j=1:length(X)
                plot(sampleX(:,1), sampleY(j,:))
                hold on;
            end
            ylabel("Voltage (uV)", 'FontSize', 16);
            xlabel("Time (s)", 'FontSize', 16);
            title("Overlay Channel "+i, 'FontSize', 20);
%             xline(app.ttlEvents.timestamp(1),'HandleVisibility','off');
            xline(app.ttlEvents.timestamp(2)-app.ttlEvents.timestamp(1),'HandleVisibility','off');
            xlim([0 sampleX(end,1)]);
            lgd = legend;
            lgd.NumColumns = 2;
        end
    end

    delete(h);
%end