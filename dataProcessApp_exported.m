classdef dataProcessApp_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                   matlab.ui.Figure
        Panel                      matlab.ui.container.Panel
        Channel1CheckBox           matlab.ui.control.CheckBox
        Channel2CheckBox           matlab.ui.control.CheckBox
        Channel3CheckBox           matlab.ui.control.CheckBox
        Channel4CheckBox           matlab.ui.control.CheckBox
        Channel5CheckBox           matlab.ui.control.CheckBox
        Channel6CheckBox           matlab.ui.control.CheckBox
        Channel7CheckBox           matlab.ui.control.CheckBox
        Channel8CheckBox           matlab.ui.control.CheckBox
        Channel9CheckBox           matlab.ui.control.CheckBox
        Channel10CheckBox          matlab.ui.control.CheckBox
        Channel11CheckBox          matlab.ui.control.CheckBox
        Channel12CheckBox          matlab.ui.control.CheckBox
        Channel16CheckBox          matlab.ui.control.CheckBox
        Channel15CheckBox          matlab.ui.control.CheckBox
        Channel14CheckBox          matlab.ui.control.CheckBox
        Channel13CheckBox          matlab.ui.control.CheckBox
        Switch                     matlab.ui.control.Switch
        BrowseButton               matlab.ui.control.Button
        DirectoryLocationLabel     matlab.ui.control.Label
        UITable                    matlab.ui.control.Table
        ImportDataButton           matlab.ui.control.Button
        DataInformationPanel       matlab.ui.container.Panel
        InfoTable                  matlab.ui.control.Table
        SelectChannelstoPlotLabel  matlab.ui.control.Label
        MultipleFiguresButton      matlab.ui.control.Button
        OneFigureButton            matlab.ui.control.Button
        SelectAllButton            matlab.ui.control.Button
        UnselectAllButton          matlab.ui.control.Button
        CloseAllFiguresButton      matlab.ui.control.Button
        UITable_Recordings         matlab.ui.control.Table
        LoadRecordingsButton       matlab.ui.control.Button
        PlotOverlayButton          matlab.ui.control.Button
        ExitAppButton              matlab.ui.control.Button
        LoadActionPotentialButton  matlab.ui.control.Button
        PlotNoplotCheckBox         matlab.ui.control.CheckBox
    end

    
    properties (Access = public)
        path_select
        session
        node
        indiceRecording
        data
        ttlEvents
        bit_volts
        chSelect = ones(1,16)
        AP_Struct
    end
    
    properties (Access = private)
        path
       
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
           % app.UIFigure.WindowState = 'maximized';
            mydir = pwd;
            idcs = strfind(mydir,'\');
            app.path = mydir(1:idcs(end)-1) + "\data";
            app.UIFigure.Visible = 'off';     % Toggles figure visible.  These two lines of code work-around an issue whether the figure is sent to the background.
            app.UIFigure.Visible = 'on';      
            app.DirectoryLocationLabel.Text=app.path;  % Sets the label text to be the selected path

            a=dir(app.path);                         % Obtains the contents of the selected path.
            b={a(:).name}';                      % Gets the name of the files/folders of the contents and stores them appropriately in a cell array
            b(ismember(b,{'.','..'})) = [];      % Removes unnecessary '.' and '..' results from the display.

            
            app.UITable.Data=b;                  % Displays the directory information to the UITable.
            addpath(genpath("."));               % "Import" matlab-tools
            addpath('./aux_scripts');            % Import aux files
            set(0,'DefaultFigureWindowStyle','normal'); % 'Docked' as default mode for the figures
        end

        % Button pushed function: BrowseButton
        function BrowseButtonPushed(app, event)
            app.path=uigetdir;                    % Calls 'uigetdir' to obtain the directory location from the user
       
            app.UIFigure.Visible = 'off';     % Toggles figure visible.  These two lines of code work-around an issue whether the figure is sent to the background.
            app.UIFigure.Visible = 'on';      
            app.DirectoryLocationLabel.Text=app.path;  % Sets the label text to be the selected path
            
            a=dir(app.path);                         % Obtains the contents of the selected path.
            b={a(:).name}';                      % Gets the name of the files/folders of the contents and stores them appropriately in a cell array
            b(ismember(b,{'.','..'})) = [];      % Removes unnecessary '.' and '..' results from the display.

            
            app.UITable.Data=b;                  % Displays the directory information to the UITable.
        end

        % Button pushed function: ImportDataButton
        function ImportDataButtonPushed(app, event)
            importData;
        end

        % Cell selection callback: UITable
        function UITableCellSelection(app, event)
            indices = event.Indices;
            app.path_select = app.path + '\' + app.UITable.Data(indices,1);    
        end

        % Value changed function: Channel1CheckBox
        function Channel1CheckBoxValueChanged(app, event)
            value = app.Channel1CheckBox.Value;
            app.chSelect(1) = value;
        end

        % Value changed function: Channel2CheckBox
        function Channel2CheckBoxValueChanged(app, event)
            value = app.Channel2CheckBox.Value;
            app.chSelect(2) = value;
        end

        % Value changed function: Channel3CheckBox
        function Channel3CheckBoxValueChanged(app, event)
            value = app.Channel3CheckBox.Value;
            app.chSelect(3) = value;
        end

        % Value changed function: Channel4CheckBox
        function Channel4CheckBoxValueChanged(app, event)
            value = app.Channel4CheckBox.Value;
            app.chSelect(4) = value;
        end

        % Value changed function: Channel5CheckBox
        function Channel5CheckBoxValueChanged(app, event)
            value = app.Channel5CheckBox.Value;
            app.chSelect(5) = value;
        end

        % Value changed function: Channel6CheckBox
        function Channel6CheckBoxValueChanged(app, event)
            value = app.Channel6CheckBox.Value;
            app.chSelect(6) = value;
        end

        % Value changed function: Channel7CheckBox
        function Channel7CheckBoxValueChanged(app, event)
            value = app.Channel7CheckBox.Value;
            app.chSelect(7) = value;
        end

        % Value changed function: Channel8CheckBox
        function Channel8CheckBoxValueChanged(app, event)
            value = app.Channel8CheckBox.Value;
            app.chSelect(8) = value;
        end

        % Value changed function: Channel9CheckBox
        function Channel9CheckBoxValueChanged(app, event)
            value = app.Channel9CheckBox.Value;
            app.chSelect(9) = value;
        end

        % Value changed function: Channel10CheckBox
        function Channel10CheckBoxValueChanged(app, event)
            value = app.Channel10CheckBox.Value;
            app.chSelect(10) = value;
        end

        % Value changed function: Channel11CheckBox
        function Channel11CheckBoxValueChanged(app, event)
            value = app.Channel11CheckBox.Value;
            app.chSelect(11) = value;
        end

        % Value changed function: Channel12CheckBox
        function Channel12CheckBoxValueChanged(app, event)
            value = app.Channel12CheckBox.Value;
            app.chSelect(12) = value;
        end

        % Value changed function: Channel13CheckBox
        function Channel13CheckBoxValueChanged(app, event)
            value = app.Channel13CheckBox.Value;
            app.chSelect(13) = value;
        end

        % Value changed function: Channel14CheckBox
        function Channel14CheckBoxValueChanged(app, event)
            value = app.Channel14CheckBox.Value;
            app.chSelect(14) = value;
        end

        % Value changed function: Channel15CheckBox
        function Channel15CheckBoxValueChanged(app, event)
            value = app.Channel15CheckBox.Value;
            app.chSelect(15) = value;
        end

        % Value changed function: Channel16CheckBox
        function Channel16CheckBoxValueChanged(app, event)
            value = app.Channel16CheckBox.Value;
            app.chSelect(16) = value;
        end

        % Button pushed function: SelectAllButton
        function SelectAllButtonPushed(app, event)
            app.Channel1CheckBox.Value = 1; app.Channel2CheckBox.Value = 1; app.Channel3CheckBox.Value = 1; app.Channel4CheckBox.Value = 1; app.Channel5CheckBox.Value = 1;
            app.Channel6CheckBox.Value = 1; app.Channel7CheckBox.Value = 1; app.Channel8CheckBox.Value = 1; app.Channel9CheckBox.Value = 1; app.Channel10CheckBox.Value = 1;
            app.Channel11CheckBox.Value = 1; app.Channel12CheckBox.Value = 1; app.Channel13CheckBox.Value = 1; app.Channel14CheckBox.Value = 1; app.Channel15CheckBox.Value = 1;
            app.Channel16CheckBox.Value = 1;
            app.chSelect = ones(1,16);
        end

        % Button pushed function: UnselectAllButton
        function UnselectAllButtonPushed(app, event)
            app.Channel1CheckBox.Value = 0; app.Channel2CheckBox.Value = 0; app.Channel3CheckBox.Value = 0; app.Channel4CheckBox.Value = 0; app.Channel5CheckBox.Value = 0;
            app.Channel6CheckBox.Value = 0; app.Channel7CheckBox.Value = 0; app.Channel8CheckBox.Value = 0; app.Channel9CheckBox.Value = 0; app.Channel10CheckBox.Value = 0;
            app.Channel11CheckBox.Value = 0; app.Channel12CheckBox.Value = 0; app.Channel13CheckBox.Value = 0; app.Channel14CheckBox.Value = 0; app.Channel15CheckBox.Value = 0;
            app.Channel16CheckBox.Value = 0;
            app.chSelect = ones(0,16);
        end

        % Button pushed function: MultipleFiguresButton
        function MultipleFiguresButtonPushed(app, event)
            multipleFigures;
        end

        % Button pushed function: OneFigureButton
        function OneFigureButtonPushed(app, event)
            oneFigure;
        end

        % Button pushed function: CloseAllFiguresButton
        function CloseAllFiguresButtonPushed(app, event)
            close all;
        end

        % Button pushed function: LoadRecordingsButton
        function LoadRecordingsButtonPushed(app, event)
            loadRecordings;
        end

        % Cell selection callback: UITable_Recordings
        function UITable_RecordingsCellSelection(app, event)
            app.indiceRecording = event.Indices(1);
        end

        % Button pushed function: PlotOverlayButton
        function PlotOverlayButtonPushed(app, event)
            overlay;
        end

        % Button pushed function: ExitAppButton
        function ExitAppButtonPushed(app, event)
            delete(app);
        end

        % Value changed function: Switch
        function SwitchValueChanged(app, event)
            value = app.Switch.Value;
            if (value == 'Docked')
                set(0,'DefaultFigureWindowStyle','docked');
            else
                set(0,'DefaultFigureWindowStyle','normal');
            end
        end

        % Button pushed function: LoadActionPotentialButton
        function LoadActionPotentialButtonPushed(app, event)
            app.AP_Struct = processAP(app.PlotNoplotCheckBox.Value);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.9412 0.9412 0.9412];
            app.UIFigure.Position = [10 50 688 988];
            app.UIFigure.Name = 'UI Figure';
            app.UIFigure.Resize = 'off';

            % Create Panel
            app.Panel = uipanel(app.UIFigure);
            app.Panel.Position = [14 92 492 184];

            % Create Channel1CheckBox
            app.Channel1CheckBox = uicheckbox(app.Panel);
            app.Channel1CheckBox.ValueChangedFcn = createCallbackFcn(app, @Channel1CheckBoxValueChanged, true);
            app.Channel1CheckBox.Text = 'Channel 1';
            app.Channel1CheckBox.Position = [82 144 80 23];
            app.Channel1CheckBox.Value = true;

            % Create Channel2CheckBox
            app.Channel2CheckBox = uicheckbox(app.Panel);
            app.Channel2CheckBox.ValueChangedFcn = createCallbackFcn(app, @Channel2CheckBoxValueChanged, true);
            app.Channel2CheckBox.Text = 'Channel 2';
            app.Channel2CheckBox.Position = [82 111 80 23];
            app.Channel2CheckBox.Value = true;

            % Create Channel3CheckBox
            app.Channel3CheckBox = uicheckbox(app.Panel);
            app.Channel3CheckBox.ValueChangedFcn = createCallbackFcn(app, @Channel3CheckBoxValueChanged, true);
            app.Channel3CheckBox.Text = 'Channel 3';
            app.Channel3CheckBox.Position = [82 78 80 23];
            app.Channel3CheckBox.Value = true;

            % Create Channel4CheckBox
            app.Channel4CheckBox = uicheckbox(app.Panel);
            app.Channel4CheckBox.ValueChangedFcn = createCallbackFcn(app, @Channel4CheckBoxValueChanged, true);
            app.Channel4CheckBox.Text = 'Channel 4';
            app.Channel4CheckBox.Position = [82 43 80 23];
            app.Channel4CheckBox.Value = true;

            % Create Channel5CheckBox
            app.Channel5CheckBox = uicheckbox(app.Panel);
            app.Channel5CheckBox.ValueChangedFcn = createCallbackFcn(app, @Channel5CheckBoxValueChanged, true);
            app.Channel5CheckBox.Text = 'Channel 5';
            app.Channel5CheckBox.Position = [181 143 80 23];
            app.Channel5CheckBox.Value = true;

            % Create Channel6CheckBox
            app.Channel6CheckBox = uicheckbox(app.Panel);
            app.Channel6CheckBox.ValueChangedFcn = createCallbackFcn(app, @Channel6CheckBoxValueChanged, true);
            app.Channel6CheckBox.Text = 'Channel 6';
            app.Channel6CheckBox.Position = [181 110 80 23];
            app.Channel6CheckBox.Value = true;

            % Create Channel7CheckBox
            app.Channel7CheckBox = uicheckbox(app.Panel);
            app.Channel7CheckBox.ValueChangedFcn = createCallbackFcn(app, @Channel7CheckBoxValueChanged, true);
            app.Channel7CheckBox.Text = 'Channel 7';
            app.Channel7CheckBox.Position = [181 77 80 23];
            app.Channel7CheckBox.Value = true;

            % Create Channel8CheckBox
            app.Channel8CheckBox = uicheckbox(app.Panel);
            app.Channel8CheckBox.ValueChangedFcn = createCallbackFcn(app, @Channel8CheckBoxValueChanged, true);
            app.Channel8CheckBox.Text = 'Channel 8';
            app.Channel8CheckBox.Position = [181 43 80 23];
            app.Channel8CheckBox.Value = true;

            % Create Channel9CheckBox
            app.Channel9CheckBox = uicheckbox(app.Panel);
            app.Channel9CheckBox.ValueChangedFcn = createCallbackFcn(app, @Channel9CheckBoxValueChanged, true);
            app.Channel9CheckBox.Text = 'Channel 9';
            app.Channel9CheckBox.Position = [286 142 80 23];
            app.Channel9CheckBox.Value = true;

            % Create Channel10CheckBox
            app.Channel10CheckBox = uicheckbox(app.Panel);
            app.Channel10CheckBox.ValueChangedFcn = createCallbackFcn(app, @Channel10CheckBoxValueChanged, true);
            app.Channel10CheckBox.Text = 'Channel 10';
            app.Channel10CheckBox.Position = [286 109 83 23];
            app.Channel10CheckBox.Value = true;

            % Create Channel11CheckBox
            app.Channel11CheckBox = uicheckbox(app.Panel);
            app.Channel11CheckBox.ValueChangedFcn = createCallbackFcn(app, @Channel11CheckBoxValueChanged, true);
            app.Channel11CheckBox.Text = 'Channel 11';
            app.Channel11CheckBox.Position = [285 76 83 23];
            app.Channel11CheckBox.Value = true;

            % Create Channel12CheckBox
            app.Channel12CheckBox = uicheckbox(app.Panel);
            app.Channel12CheckBox.ValueChangedFcn = createCallbackFcn(app, @Channel12CheckBoxValueChanged, true);
            app.Channel12CheckBox.Text = 'Channel 12';
            app.Channel12CheckBox.Position = [286 43 83 23];
            app.Channel12CheckBox.Value = true;

            % Create Channel16CheckBox
            app.Channel16CheckBox = uicheckbox(app.Panel);
            app.Channel16CheckBox.ValueChangedFcn = createCallbackFcn(app, @Channel16CheckBoxValueChanged, true);
            app.Channel16CheckBox.Text = 'Channel 16';
            app.Channel16CheckBox.Position = [386 42 83 23];

            % Create Channel15CheckBox
            app.Channel15CheckBox = uicheckbox(app.Panel);
            app.Channel15CheckBox.ValueChangedFcn = createCallbackFcn(app, @Channel15CheckBoxValueChanged, true);
            app.Channel15CheckBox.Text = 'Channel 15';
            app.Channel15CheckBox.Position = [387 75 83 23];

            % Create Channel14CheckBox
            app.Channel14CheckBox = uicheckbox(app.Panel);
            app.Channel14CheckBox.ValueChangedFcn = createCallbackFcn(app, @Channel14CheckBoxValueChanged, true);
            app.Channel14CheckBox.Text = 'Channel 14';
            app.Channel14CheckBox.Position = [386 108 83 23];

            % Create Channel13CheckBox
            app.Channel13CheckBox = uicheckbox(app.Panel);
            app.Channel13CheckBox.ValueChangedFcn = createCallbackFcn(app, @Channel13CheckBoxValueChanged, true);
            app.Channel13CheckBox.Text = 'Channel 13';
            app.Channel13CheckBox.Position = [385 141 83 23];

            % Create Switch
            app.Switch = uiswitch(app.Panel, 'slider');
            app.Switch.Items = {'Docked', 'Normal'};
            app.Switch.Orientation = 'vertical';
            app.Switch.ValueChangedFcn = createCallbackFcn(app, @SwitchValueChanged, true);
            app.Switch.Position = [29 83 17 38];
            app.Switch.Value = 'Normal';

            % Create BrowseButton
            app.BrowseButton = uibutton(app.UIFigure, 'push');
            app.BrowseButton.ButtonPushedFcn = createCallbackFcn(app, @BrowseButtonPushed, true);
            app.BrowseButton.Position = [31 902 100 46];
            app.BrowseButton.Text = 'Browse';

            % Create DirectoryLocationLabel
            app.DirectoryLocationLabel = uilabel(app.UIFigure);
            app.DirectoryLocationLabel.BackgroundColor = [1 1 1];
            app.DirectoryLocationLabel.Position = [149 902 357 46];
            app.DirectoryLocationLabel.Text = 'Directory Location';

            % Create UITable
            app.UITable = uitable(app.UIFigure);
            app.UITable.ColumnName = {'Directory Contents'};
            app.UITable.RowName = {};
            app.UITable.CellSelectionCallback = createCallbackFcn(app, @UITableCellSelection, true);
            app.UITable.Position = [14 625 240 249];

            % Create ImportDataButton
            app.ImportDataButton = uibutton(app.UIFigure, 'push');
            app.ImportDataButton.ButtonPushedFcn = createCallbackFcn(app, @ImportDataButtonPushed, true);
            app.ImportDataButton.Position = [320 554 125 57];
            app.ImportDataButton.Text = 'Import Data';

            % Create DataInformationPanel
            app.DataInformationPanel = uipanel(app.UIFigure);
            app.DataInformationPanel.TitlePosition = 'centertop';
            app.DataInformationPanel.Title = 'Data Information';
            app.DataInformationPanel.FontWeight = 'bold';
            app.DataInformationPanel.Position = [14 313 492 222];

            % Create InfoTable
            app.InfoTable = uitable(app.DataInformationPanel);
            app.InfoTable.ColumnName = {'Property'; 'Value'};
            app.InfoTable.RowName = {};
            app.InfoTable.Position = [17 8 455 186];

            % Create SelectChannelstoPlotLabel
            app.SelectChannelstoPlotLabel = uilabel(app.UIFigure);
            app.SelectChannelstoPlotLabel.FontWeight = 'bold';
            app.SelectChannelstoPlotLabel.Position = [192 276 139 23];
            app.SelectChannelstoPlotLabel.Text = 'Select Channels to Plot';

            % Create MultipleFiguresButton
            app.MultipleFiguresButton = uibutton(app.UIFigure, 'push');
            app.MultipleFiguresButton.ButtonPushedFcn = createCallbackFcn(app, @MultipleFiguresButtonPushed, true);
            app.MultipleFiguresButton.Position = [53 20 124 57];
            app.MultipleFiguresButton.Text = 'Multiple Figures';

            % Create OneFigureButton
            app.OneFigureButton = uibutton(app.UIFigure, 'push');
            app.OneFigureButton.ButtonPushedFcn = createCallbackFcn(app, @OneFigureButtonPushed, true);
            app.OneFigureButton.Position = [207 20 124 57];
            app.OneFigureButton.Text = 'One Figure';

            % Create SelectAllButton
            app.SelectAllButton = uibutton(app.UIFigure, 'push');
            app.SelectAllButton.ButtonPushedFcn = createCallbackFcn(app, @SelectAllButtonPushed, true);
            app.SelectAllButton.Position = [164 102 99 23];
            app.SelectAllButton.Text = 'Select All';

            % Create UnselectAllButton
            app.UnselectAllButton = uibutton(app.UIFigure, 'push');
            app.UnselectAllButton.ButtonPushedFcn = createCallbackFcn(app, @UnselectAllButtonPushed, true);
            app.UnselectAllButton.Position = [280 101 99 23];
            app.UnselectAllButton.Text = 'Unselect All';

            % Create CloseAllFiguresButton
            app.CloseAllFiguresButton = uibutton(app.UIFigure, 'push');
            app.CloseAllFiguresButton.ButtonPushedFcn = createCallbackFcn(app, @CloseAllFiguresButtonPushed, true);
            app.CloseAllFiguresButton.Position = [540 102 124 56];
            app.CloseAllFiguresButton.Text = 'Close All Figures';

            % Create UITable_Recordings
            app.UITable_Recordings = uitable(app.UIFigure);
            app.UITable_Recordings.ColumnName = {'Recordings'};
            app.UITable_Recordings.RowName = {};
            app.UITable_Recordings.CellSelectionCallback = createCallbackFcn(app, @UITable_RecordingsCellSelection, true);
            app.UITable_Recordings.Position = [262 625 240 249];

            % Create LoadRecordingsButton
            app.LoadRecordingsButton = uibutton(app.UIFigure, 'push');
            app.LoadRecordingsButton.ButtonPushedFcn = createCallbackFcn(app, @LoadRecordingsButtonPushed, true);
            app.LoadRecordingsButton.Position = [72 554 125 57];
            app.LoadRecordingsButton.Text = 'Load Recordings';

            % Create PlotOverlayButton
            app.PlotOverlayButton = uibutton(app.UIFigure, 'push');
            app.PlotOverlayButton.ButtonPushedFcn = createCallbackFcn(app, @PlotOverlayButtonPushed, true);
            app.PlotOverlayButton.Position = [362 21 124 56];
            app.PlotOverlayButton.Text = 'Plot Overlay';

            % Create ExitAppButton
            app.ExitAppButton = uibutton(app.UIFigure, 'push');
            app.ExitAppButton.ButtonPushedFcn = createCallbackFcn(app, @ExitAppButtonPushed, true);
            app.ExitAppButton.BackgroundColor = [0.8 0.1059 0.1059];
            app.ExitAppButton.FontColor = [1 1 1];
            app.ExitAppButton.Position = [540 21 124 56];
            app.ExitAppButton.Text = 'Exit App';

            % Create LoadActionPotentialButton
            app.LoadActionPotentialButton = uibutton(app.UIFigure, 'push');
            app.LoadActionPotentialButton.ButtonPushedFcn = createCallbackFcn(app, @LoadActionPotentialButtonPushed, true);
            app.LoadActionPotentialButton.Position = [534 817 136 57];
            app.LoadActionPotentialButton.Text = 'Load Action Potential';

            % Create PlotNoplotCheckBox
            app.PlotNoplotCheckBox = uicheckbox(app.UIFigure);
            app.PlotNoplotCheckBox.Text = 'Plot / No plot';
            app.PlotNoplotCheckBox.Position = [560 880 91 23];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = dataProcessApp_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end