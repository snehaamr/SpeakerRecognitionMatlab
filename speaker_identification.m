% Function to perform speaker recognition by MFCC and VQ
function identifySpeaker()
    if exist('name_database.dat', 'file')
        load('name_database.dat', '-mat');
        duration = input('Insert the duration of the recording (in seconds):');
        if isempty(duration)
            duration = 3; 
        end
        [y, Fs] = recordAudio(duration, samplingfrequency, samplingbits);
        st = 'test.wav';
        audiowrite(st, y, Fs);
        
        % Compute MFCC features for the input sound
        v = mfcc(y, Fs);
        
        % Train VQ codebook for all registered voices
        for ii = 1:sound_number
            speaker_code{ii} = vqlbg(mfcc(data{ii, 1}, Fs), 16);
        end
        
        % Compute the Euclidean distance for feature matching
        distmin = Inf;
        k1 = 0;
        for ii = 1:sound_number
            dist = disteu(v, speaker_code{ii});
            dist_score = sum(min(dist, [], 2)) / size(dist, 1);
            disp(['User #', num2str(ii), ' Dist: ', num2str(dist_score)]);
            if dist_score < distmin
                distmin = dist_score;
                k1 = ii;
            end
        end
        
        % Compare distances and match speaker
        if distmin < jabba
            min_index = k1;
            speech_id = data{min_index, 2};
            msgbox(['Recognized speaker ID: ', speech_id], 'Matching result', 'help');
        else
            warndlg('No matching result found.','Warning');
        end
    else
        warndlg('Database is empty. No matching is possible.','Warning');
    end
end
