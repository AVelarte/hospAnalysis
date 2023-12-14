app.path_select = app.path_select(1);
if(length(strfind(app.path_select,'-')) > 0) 
    app.session = Session(convertStringsToChars(strtrim(app.path_select)));
    app.node = app.session.recordNodes{1};
    recordings = [];
    names = [];
    for k = 1:length(app.node.recordings)
        recordings = [recordings; app.node.recordings{1,k}];
        name = strsplit(app.node.recordings{1,k}.directory,'\');
        names = [names; name(end-1)];
    end

    app.UITable_Recordings.Data=names;

else
    app.DirectoryLocationLabel.Text = app.path_select;
    a=dir(app.path_select);                         % Obtains the contents of the selected path.
    b={a(:).name}';                      % Gets the name of the files/folders of the contents and stores them appropriately in a cell array
    b(ismember(b,{'.','..'})) = [];      % Removes unnecessary '.' and '..' results from the display.

    app.UITable.Data=b;                  % Displays the directory information to the UITable.
end