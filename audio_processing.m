% Function to record audio and return the audio data
function [y, Fs] = recordAudio(duration, samplingfrequency, samplingbits)
    micrecorder = audiorecorder(samplingfrequency, samplingbits, 1);
    disp('Now, speak into the microphone...');
    recordblocking(micrecorder, duration);
    y = getaudiodata(micrecorder);
    Fs = samplingfrequency;
    if size(y, 2) == 2
        y = y(:, 1);  % Use only the first channel if stereo
    end
end

% Function to compute MFCC features
function r = mfcc(s, fs)
    m = 100;
    n = 256;
    frame = blockFrames(s, fs, m, n);
    m = melfb(20, n, fs);
    n2 = 1 + floor(n / 2);
    z = m * abs(frame(1:n2, :)).^2;
    r = dct(log(z));
end

% Function to block audio into frames
function M3 = blockFrames(s, fs, m, n)
    l = length(s);
    nbFrame = floor((l - n) / m) + 1;
    for i = 1:n
        for j = 1:nbFrame
            M(i, j) = s(((j - 1) * m) + i);
        end
    end
    % Apply Hamming window
    h = hamming(n);
    M2 = diag(h) * M;
    % Apply FFT to each frame
    for i = 1:nbFrame
        M3(:, i) = fft(M2(:, i)); 
    end
end

% Mel Filterbank
function m = melfb(p, n, fs)
    % MELFB Determine matrix for a mel-spaced filterbank
    f0 = 700 / fs;
    fn2 = floor(n / 2);
    lr = log(1 + 0.5 / f0) / (p + 1);
    bl = n * (f0 * (exp([0 1 p p + 1] * lr) - 1));
    b1 = floor(bl(1)) + 1;
    b2 = ceil(bl(2));
    b3 = floor(bl(3));
    b4 = min(fn2, ceil(bl(4))) - 1;
    pf = log(1 + (b1:b4) / n / f0) / lr;
    fp = floor(pf);
    pm = pf - fp;
    r = [fp(b2:b4) 1 + fp(1:b3)];
    c = [b2:b4 1:b3] + 1;
    v = 2 * [1 - pm(b2:b4) pm(1:b3)];
    m = sparse(r, c, v, p, 1 + fn2);
end
