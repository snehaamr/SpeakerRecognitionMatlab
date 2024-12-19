% Main program for Speaker Identification by Voice Recognition

% Define constants and initializations
jabba = 10;
user_id = 1;
ch = 0;
poss = 4;

% Main loop to display menu and handle user input
while ch ~= poss
    ch = menu('Speaker recognition System', 'Add your voice to database', ...
              'Speaker Identification', 'Database Info', 'Exit');
    
    switch ch
        case 1
            addVoiceToDatabase();
        case 2
            identifySpeaker();
        case 3
            showDatabaseInfo();
        case 4
            close all;
            msgbox('Thank You');
    end
end
