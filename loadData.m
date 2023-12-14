function session = loadData(DATA_PATH)
    %DATA_PATH = app.path_select

    % Flag to plot data after test 
%     show = true;
%     if show
%         % Define visualization figure
%         set(0,'units','pixels'); 
%         s = get(0,'screensize');
%         SCREEN_X = s(3);
%         SCREEN_Y = s(4);
%         FIGURE_X_SIZE = SCREEN_X;
%         FIGURE_Y_SIZE = SCREEN_Y;
%         f = figure();
%         f.set('Position', [0 0 FIGURE_X_SIZE FIGURE_Y_SIZE]);
%         %f.set('Position', [SCREEN_X / 2 0 FIGURE_X_SIZE FIGURE_Y_SIZE]);
%     end

    % Create a session (loads all data from the selected recording)
    session = Session(DATA_PATH);
   
%     node = session.recordNodes{1};
%     recording = node.recordings{1,1};
%     streamNames = recording.continuous.keys();
%     for k = 1:length(streamNames)
%         streamName = streamNames{k};
%         disp(streamName)
%         data = recording.continuous(streamName);
%         bit_volts = recording.info.continuous.channels.bit_volts;
%         plot(data.timestamps(1:length(data.sampleNumbers)), data.samples(1,:) * bit_volts, 'LineWidth', 1);
%         ylabel("Voltage (uV)", 'FontSize', 16);
%         xlabel("Time (s)", 'FontSize', 16);
%         title("Raw", 'FontSize', 20); hold on;
%     end
end
