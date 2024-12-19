# SpeakerRecognitionMatlab
Speaker Recognition using Audio Processing by Matlab

# Speaker Recognition System

This is a MATLAB-based speaker recognition system designed to identify individuals by the sound of their voice. The system uses **Mel-frequency cepstral coefficients (MFCC)** to extract features from recorded speech and compares these features to those stored in a speaker database.

## Features

- **Speaker Enrollment**: Add a new speaker to the database by recording their voice.
- **Speaker Identification**: Recognize a speaker by comparing an input recording to the existing speaker database.
- **Database Management**: View the list of enrolled speakers and their corresponding audio recordings.

## Requirements

- MATLAB (R2019b or later)
- Signal Processing Toolbox
- Audio Toolbox (for audio recording)

## Files Overview

1. **main.m**: The entry point for the application. It handles the main user interface and directs the flow of the program based on the user's menu selection.
2. **audio_processing.m**: Contains functions to record audio, extract MFCC features, and handle windowing for the audio signal.
3. **speaker_identification.m**: Functions related to speaker recognition, including feature comparison using Vector Quantization (VQ) and Euclidean distance.
4. **database_management.m**: Functions to add new voice recordings to the database and display the current database.
5. **utilities.m**: Helper functions, such as distance calculations and codebook generation for the recognition system.

## Installation

### Prerequisites

Ensure that you have the following prerequisites installed:
- MATLAB (R2019b or later)
- Signal Processing Toolbox
- Audio Toolbox

You can check if you have the required toolboxes by running the following command in MATLAB:

```matlab
ver

Setup

Clone or download this repository to your local machine.
Open the main.m file in MATLAB.
Run the program by typing main in the MATLAB command window.
Follow the on-screen instructions to either add a new voice to the database, identify a speaker, or manage the database.

Adding a New Voice to the Database
Select "Add your voice to database" from the menu.
Enter a unique ID for the speaker (e.g., your name or a user number).
Record your voice (by default, it will record for 3 seconds).
The system will save your audio to the database.
Identifying a Speaker
Select "Speaker Identification" from the menu.
Record a new voice sample (e.g., say something).
The system will compare the new recording to the voices in the database and display the closest match.
Viewing Database Information
Select "Database Info" from the menu.
The system will display a list of enrolled speakers and the corresponding audio files.
Exiting the System
Select "Exit" from the menu to close the program.
Audio Input
1. Recording Audio
To test the system, you can record audio directly from your microphone. The system will prompt you to speak, and it will record the audio for a specified duration.

2. Using Pre-recorded Audio Files
If you already have voice recordings (e.g., .wav files), you can load them directly into the system for testing. Place your audio files in the data/ directory and use the following command to load an audio file:

[y, Fs] = audioread('data/speaker1.wav');
Pass y (audio signal) and Fs (sampling rate) into the feature extraction and recognition functions.

3. Generating Synthetic Audio (Optional)
You can also generate synthetic test audio using MATLAB’s built-in functions or external libraries for speech synthesis.

Example Workflow
Enroll a New Speaker:

Run the system and choose "Add your voice to database".
Record your voice and provide an ID.
Identify a Speaker:

Run the system and choose "Speaker Identification".
Record a voice sample and let the system identify the speaker.
View Database Information:

Run the system and choose "Database Info" to see the list of enrolled speakers.
Troubleshooting
Error with Audio Input: Ensure that your microphone is properly connected and configured in MATLAB.
No Matching Result: If the system doesn’t match any voice recordings, try increasing the training data or adjust the distance threshold in the code.

