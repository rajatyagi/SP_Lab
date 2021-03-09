
%Original audio Bits/sample = 16 and Fs = 16 kHz
[y,Fs] = audioread('Lab5A.wav');

Lab5A(y,Fs,"full sound");

function [] = Lab5A(y,Fs,text)
    
    %time duration of the given audio file 
    time_duration = length(y)/Fs;
    
    %generating the time axis
    t = 0 : 1/Fs : time_duration - 1/Fs;
    
    %plotting audio in time domain and spectrogram
    figure(1);
    plot(t,y);
    title(text + " Time domain plot");
    
    figure(2);
    spectrogram(y,hamming(500),490,[],Fs,'yaxis')
    title(text + " Spectrogram");

    fftFull = fft(x);
    
    %length of the FFT of non stationary signal in frequency domain
    Len_f = length(fftFull);  
    
    %Taking only +ve frequencies
    fftHalf = fftFull(1:round(Len_f/2));
    
    %converting in DB scale
    fftDB = 20*log(abs(fftHalf));
    
    %iterating freq from 0 to +len/2
    freq = 0 : 1 : round(Len_f/2) - 1; 
    
    %converting each term of freq into frequency as for the 'k'th term f = Fs.k/N 
    freq = Fs*freq/Len_f; 
    
    %Plotting
    figure(3);
    plot(freq,fftDB);
    title("Magnitude Spectrum of " + text + " in DB");
    xlabel("freq (in Hz)");
    ylabel("V(f)");
    
end

