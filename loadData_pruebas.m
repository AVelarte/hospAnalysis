clear all; close all;
% "Import" matlab-tools
addpath(genpath("."));
% gilmore girls - thread rody
%DATA_PATH = 'C:\Users\Antonio\Desktop\DataOpenEphys\data\2023-10-18_12-18-56'
%DATA_PATH = 'C:\Users\Antonio\Desktop\DataOpenEphys\data\2023-10-27_13-59-47';
%DATA_PATH = 'C:\Users\Antonio\Desktop\DataOpenEphys\data\2023-11-16_14-11-41';
%DATA_PATH = 'C:\Users\Antonio\Desktop\DataOpenEphys\data\2023-11-22_17-56-40';
DATA_PATH = 'C:\Users\Antonio\Desktop\DataOpenEphys\data\003_2023-11-22_21-02-18';

%ChHELP ->  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16  (if 1, do plot)
chSelect = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
multiplePlot = false;
%%
% Create a session (loads all data from the selected recording)
session = Session(DATA_PATH);
node = session.recordNodes{1};
recordings = [];
names = [];
for k = 1:length(node.recordings)
    recordings = [recordings; node.recordings{1,k}];
    name = strsplit(node.recordings{1,k}.directory,'\');
    %name = strsplit(name,'\');
    %name = name(end-1);
    %name = name{1,1}
    names = [names; name(end-1)];
end
% node.recordings{1, Nº Recording}
recording = node.recordings{1,1};
streamNames = recording.continuous.keys();

for k = 1:length(streamNames)
    if (not(multiplePlot))
            figure;
            title("Raw Channels", 'FontSize', 20); hold on;
    end
    for i=1:1%length(chSelect)
        if(chSelect(i))
            
            if multiplePlot
                figure;
                title("Raw Ch."+i, 'FontSize', 20); hold on;
            end
            streamName = streamNames{k};
            disp(streamName);
            data = recording.continuous(streamName);
            old_dataTimestamp = data.timestamps(1);
            data.timestamps = data.timestamps - data.timestamps(1);
            bit_volts = recording.info.continuous.channels.bit_volts;
            plot(data.timestamps(1:length(data.sampleNumbers)), data.samples(i,:) * bit_volts, 'LineWidth', 1, 'DisplayName',"Ch."+i);
            ylabel("Voltage (uV)", 'FontSize', 16);
            xlabel("Time (s)", 'FontSize', 16);
           % title("Raw", 'FontSize', 20); hold on;
            lgd = legend;
            lgd.NumColumns = 2;
        end
    end
end
ttlEvents = recording.ttlEvents('OE_FPGA_Acquisition_Board-106.Rhythm Data');
ttlEvents.timestamp = ttlEvents.timestamp - old_dataTimestamp;
for i=1:length(ttlEvents.timestamp)
    xline(ttlEvents.timestamp(i));
end