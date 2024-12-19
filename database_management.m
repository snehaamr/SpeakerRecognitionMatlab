% Function to add a voice to the database
function addVoiceToDatabase()
    if exist('name_database.dat', 'file')
        load('name_database.dat', '-mat');
    end
    
    % Get speaker ID and voice data
    classe = input('Insert your name id: ', 's');
    if isempty(classe)
        classe = ['user', num2str(user_id)];
        user_id = user_id + 1;
    end
    duration = input('Insert the duration of the recording (in seconds):');
    if isempty(duration)
        duration = 3;
    end
    
    % Record the voice
    [y, Fs] = recordAudio(duration, 22050, 8);
    
    % Store the data in the database
    sound_number = sound_number + 1;
    speaker_num = speaker_num + 1;
    data{sound_number, 1} = y;
    data{sound_number, 2} = classe;
    data{sound_number, 3} = 'Microphone';
    data{sound_number, 4} = num2str(speaker_num);
    
    % Save the data
    audiowrite([num2str(speaker_num), '.wav'], y, Fs);
    save('name_database.dat', 'data', 'sound_number', 'speaker_num', '-append');
    msgbox('Sound added to database', 'Database result', 'help');
end

% Function to display database information
function showDatabaseInfo()
    if exist('name_database.dat', 'file')
        load('name_database.dat', '-mat');
        for ii = 1:sound_number
            disp(['Speaker ID: ', data{ii, 2}]);
            disp(['File Location: ', data{ii, 3}]);
        end
    else
        warndlg('Database is empty.', 'Warning');
    end
end
