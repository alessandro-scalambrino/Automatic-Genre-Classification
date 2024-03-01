# Genere Musicale Recognition with K-Nearest Neighbors (KNN) Algorithm

## Overview
This project explores an approach based on the use of MATLAB and the K-Nearest Neighbors (KNN) algorithm to classify electronic music genres, specifically ambient minimal house. Spectral and temporal features are extracted from the music audio files for classification.

### Features in Time Domain
- **Energy**: The magnitude of the signal.
- **Zero Crossing Rate**: The frequency at which the signal changes from positive to negative or back.

### Features in Frequency Domain
- **Spectral Centroid**: The main point of the spectrum distribution.
- **Spectral Spread**: The standard deviation of the spectrum distribution.
- **Spectral Rolloff**: The amount of energy accumulated until a certain point in the frequency.
- **Mel-Frequency Cepstral Coefficients (MFCC)**: Represents the spectrum bands according to the mel-scale, an isophonic (mostly subjective) coefficient.

## Usage
1. Ensure you have MATLAB installed on your system.
2. Download the repository.
3. Open and run the MATLAB script `The_main.m` to train the KNN model and classify the music genres.
4. View the results and evaluate the performance of the KNN algorithm.

## Credits
This project was developed by [Alessandro Scalambrino]((https://github.com/alessandro-scalambrino)) 
