recording = app.node.recordings{1,app.indiceRecording};
streamNames = recording.continuous.keys();
for k = 1:length(streamNames)
    streamName = streamNames{k};
    disp(streamName);
    app.data = recording.continuous(streamName);
    old_dataTimestamp = app.data.timestamps(1);
    folderName = strsplit(recording.info.continuous.folder_name,'/');
    app.ttlEvents = recording.ttlEvents(char(folderName(1)));
    app.ttlEvents.timestamp = app.ttlEvents.timestamp - old_dataTimestamp;
    app.data.timestamps = app.data.timestamps - app.data.timestamps(1);
    app.bit_volts = recording.info.continuous.channels.bit_volts;
end
name = strsplit(recording.directory,'\');
name = name(end-1);
dir = strsplit(app.path_select,'\');
app.InfoTable.Data = {'Directory', char(dir(end));'Recording', char(name);'Stream Name', streamName ;'Nº channels',recording.info.continuous.num_channels; 'f Sampling (Hz)',recording.info.continuous.sample_rate; 
                        'bit_volts',app.bit_volts;'Total time acquired (s)', app.data.timestamps(length(app.data.sampleNumbers))};
