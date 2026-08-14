%%% Carson's ERG data %%%
% Detrending and baseline correction %
% To check detrending, uncomment figures in cone slow response and reduce
% number of participants to avoid crashing %

close all
clear all
clc


Fs = 2048;            % Sampling frequency                    
T = 1/Fs;             % Sampling period     

%%%% Rod - low luminance %%%%

rodL = xlsread('OSF_MigraineERG_DataRaw.xlsx', 'Rod 0.28Td Graph');

time = rodL(:,1);

migraine = 34;
hf = 24;

for i = 2:(migraine+hf+1)
    data = rodL(:,i);
    data = detrend(data,1,[1 length(data)]);
    base = mean(data(1:40));
    for k = 1:length(data)
        respRl(k,i-1) = data(k)-base;
    end
    [awaveRl(i-1), I] = min(respRl(41:138,i-1)); % baseline to +50ms
    [bwaveRl(i-1), I] = max(respRl(139:236,i-1)); % +50-100ms
    TbwaveRl(i-1) = time(I+138);
    bwaveDiffRl(i-1) = bwaveRl(i-1)-awaveRl(i-1);
%     figure;plot(time,respRl(:,i-1));
    
    % FFT
    L = length(respRl(:,i-1));     % Length of signal
    Y = fft(respRl(:,i-1));
    freq = Fs/L*(0:L-1);
%     figure; plot(freq(1:30),abs(Y(1:30)),"LineWidth",3)
%     title("Complex Magnitude of fft Spectrum")
%     xlabel("f (Hz)")
%     ylabel("Power")
%     ylim([0 2500]);
    Rl_line(i-1) = abs(Y(16));
    Rl_tot(i-1) = mean(abs(Y(1:floor(L/2))));
    Rl_rel(i-1) = Rl_line(i-1)/Rl_tot(i-1);

    clearvars data base L Y freq
end

AvgRodLmigraine = mean(respRl(:,1:migraine),2);
SdRodLmigraine = std(respRl(:,1:migraine),1,2);
SeRodLmigraine = SdRodLmigraine/sqrt(migraine);

AvgRodLhf = mean(respRl(:,migraine+1:end),2);
SdRodLhf = std(respRl(:,migraine+1:end),1,2);
SeRodLhf = SdRodLhf/sqrt(hf);

figure; errorbar(time,AvgRodLmigraine, SeRodLmigraine, 'k', "LineWidth", 1);
hold on; errorbar(time,AvgRodLhf, SeRodLhf, "Color",[.6 .6 .6], "LineWidth", 0.9);

% [TbwaveRl_H,P,CI,STATS] = ttest2(TbwaveRl(1:migraine),TbwaveRl(migraine+1:end))
% mean(TbwaveRl(1:migraine))
% std(TbwaveRl(1:migraine))
% mean(TbwaveRl(migraine+1:end))
% std(TbwaveRl(migraine+1:end))
% [bwaveDiffRl_H,P,CI,STATS] = ttest2(bwaveDiffRl(1:migraine),bwaveDiffRl(migraine+1:end))
% mean(bwaveDiffRl(1:migraine))
% std(bwaveDiffRl(1:migraine))
% mean(bwaveDiffRl(migraine+1:end))
% std(bwaveDiffRl(migraine+1:end))

clearvars migraine hf


%%%% Rod - high luminance %%%%

rodH = xlsread('OSF_MigraineERG_DataRaw.xlsx', 'Rod 85Td Graph');

time = rodH(:,1);

migraine = 28;
hf = 22;

for i = 2:(migraine+hf+1)
    data = rodH(:,i);
    data = detrend(data,1,[1 length(data)]);
    base = mean(data(1:40));
    for k = 1:length(data)
        respRh(k,i-1) = data(k)-base;
    end
    [awaveRh(i-1), I] = min(respRh(41:89,i-1)); % baseline to +25ms
    TawaveRh(i-1) = time(I+40);
    awaveMaxMinRh(i-1) = min(respRh(41:89,i-1))-respRh(41,i-1); % baseline to +25ms
    [bwaveRh(i-1), I] = max(respRh(90:325,i-1)); % +25-100ms
    TbwaveRh(i-1) = time(I+89);
    bwaveDiffRh(i-1) = bwaveRh(i-1)-awaveRh(i-1);
%     figure;plot(time,respRh(:,i-1));

    % FFT
    L = length(respRh(:,i-1));     % Length of signal
    Y = fft(respRh(:,i-1));
    freq = Fs/L*(0:L-1);
%     figure; plot(freq(1:30),abs(Y(1:30)),"LineWidth",3)
%     title("Complex Magnitude of fft Spectrum")
%     xlabel("f (Hz)")
%     ylabel("Power")
%     ylim([0 2500]);
    Rh_line(i-1) = abs(Y(16));
    Rh_tot(i-1) = mean(abs(Y(1:floor(L/2))));
    Rh_rel(i-1) = Rh_line(i-1)/Rh_tot(i-1);

    clearvars data base L Y freq
end

AvgRodHmigraine = mean(respRh(:,1:migraine),2);
SdRodHmigraine = std(respRh(:,1:migraine),1,2);
SeRodHmigraine = SdRodHmigraine/sqrt(migraine);

AvgRodHhf = mean(respRh(:,migraine+1:end),2);
SdRodHhf = std(respRh(:,migraine+1:end),1,2);
SeRodHhf = SdRodHhf/sqrt(hf);

figure; errorbar(time,AvgRodHmigraine, SeRodHmigraine, 'k', "LineWidth", 1);
hold on; errorbar(time,AvgRodHhf, SeRodHhf, "Color",[.6 .6 .6], "LineWidth", 0.9);

% [TawaveRh_H,P,CI,STATS] = ttest2(TawaveRh(1:migraine),TawaveRh(migraine+1:end))
% mean(TawaveRh(1:migraine))
% std(TawaveRh(1:migraine))
% mean(TawaveRh(migraine+1:end))
% std(TawaveRh(migraine+1:end))
% [awaveMaxMinRh_H,P,CI,STATS] = ttest2(awaveMaxMinRh(1:migraine),awaveMaxMinRh(migraine+1:end))
% mean(awaveMaxMinRh(1:migraine))
% std(awaveMaxMinRh(1:migraine))
% mean(awaveMaxMinRh(migraine+1:end))
% std(awaveMaxMinRh(migraine+1:end))
% [TbwaveRh_H,P,CI,STATS] = ttest2(TbwaveRh(1:migraine),TbwaveRh(migraine+1:end))
% mean(TbwaveRh(1:migraine))
% std(TbwaveRh(1:migraine))
% mean(TbwaveRh(migraine+1:end))
% std(TbwaveRh(migraine+1:end))
% [bwaveDiffRh_H,P,CI,STATS] = ttest2(bwaveDiffRh(1:migraine),bwaveDiffRh(migraine+1:end))
% mean(bwaveDiffRh(1:migraine))
% std(bwaveDiffRh(1:migraine))
% mean(bwaveDiffRh(migraine+1:end))
% std(bwaveDiffRh(migraine+1:end))

clearvars migraine hf


%%%% Cone - slow flash %%%%

coneS = xlsread('OSF_MigraineERG_DataRaw.xlsx', 'Cone 1.96Hz');

time = coneS(:,1);

migraine = 35;
hf = 25;

for i = 2:(migraine+hf+1)
    data = coneS(:,i);
%     figure;plot(time,data);
    data = detrend(data,1,[1 length(data)]);
%     figure;plot(time,data);
    base = mean(data(1:40));
    for k = 1:length(data)
        respCs(k,i-1) = data(k)-base;
    end   
    [awaveCs(i-1), I] = min(respCs(41:80,i-1)); % baseline +20ms
    TawaveCs(i-1) = time(I+40);
    awaveMaxMinCs(i-1) = min(respCs(41:80,i-1))-respCs(41,i-1);
    [bwaveCs(i-1), I] = max(respCs(81:119,i-1)); % +20-40ms
    TbwaveCs(i-1) = time(I+80);
    bwaveDiffCs(i-1) = bwaveCs(i-1)-awaveCs(i-1);
    [PhNRcs(i-1), I] = min(respCs(158:197,i-1)); % +60-80ms
    TPhNRcs(i-1) = time(I+158);
%     figure;plot(time,respCs(:,i-1));

        % FFT
    L = length(respCs(:,i-1));     % Length of signal
    Y = fft(respCs(:,i-1));
    freq = Fs/L*(0:L-1);
%     figure; plot(freq(1:15),abs(Y(1:15)),"LineWidth",3)
%     title("Complex Magnitude of fft Spectrum")
%     xlabel("f (Hz)")
%     ylabel("Power")
%     ylim([0 2500]);
    Cs_line(i-1) = abs(Y(8));
    Cs_tot(i-1) = mean(abs(Y(1:floor(L/2))));
    Cs_rel(i-1) = Cs_line(i-1)/Cs_tot(i-1);

    clearvars data base L Y freq
end

AvgConeSmigraine = mean(respCs(:,1:migraine),2);
SdConeSmigraine = std(respCs(:,1:migraine),1,2);
SeConeSmigraine = SdConeSmigraine/sqrt(migraine);

AvgConeShf = mean(respCs(:,migraine+1:end),2);
SdConeShf = std(respCs(:,migraine+1:end),1,2);
SeConeShf = SdConeShf/sqrt(hf);

figure; errorbar(time,AvgConeSmigraine, SeConeSmigraine, 'k', "LineWidth", 1);
hold on; errorbar(time,AvgConeShf, SeConeShf, "Color",[.6 .6 .6], "LineWidth", 0.9);

% [TawaveC_H,P,CI,STATS] = ttest2(TawaveCs(1:migraine),TawaveCs(migraine+1:end))
% mean(TawaveCs(1:migraine))
% std(TawaveCs(1:migraine))
% mean(TawaveCs(migraine+1:end))
% std(TawaveCs(migraine+1:end))
% [awaveMaxMinCs_H,P,CI,STATS] = ttest2(awaveMaxMinCs(1:migraine),awaveMaxMinCs(migraine+1:end)) % sig
% mean(awaveMaxMinCs(1:migraine))
% std(awaveMaxMinCs(1:migraine))
% mean(awaveMaxMinCs(migraine+1:end))
% std(awaveMaxMinCs(migraine+1:end))
% [TbwaveCs_H,P,CI,STATS] = ttest2(TbwaveCs(1:migraine),TbwaveCs(migraine+1:end))
% mean(TbwaveCs(1:migraine))
% std(TbwaveCs(1:migraine))
% mean(TbwaveCs(migraine+1:end))
% std(TbwaveCs(migraine+1:end))
% [bwaveDiffCs_H,P,CI,STATS] = ttest2(bwaveDiffCs(1:migraine),bwaveDiffCs(migraine+1:end))
% mean(bwaveDiffCs(1:migraine))
% std(bwaveDiffCs(1:migraine))
% mean(bwaveDiffCs(migraine+1:end))
% std(bwaveDiffCs(migraine+1:end))
% [PhNRcs_H,P,CI,STATS] = ttest2(PhNRcs(1:migraine),PhNRcs(migraine+1:end))
% mean(PhNRcs(1:migraine))
% std(PhNRcs(1:migraine))
% mean(PhNRcs(migraine+1:end))
% std(PhNRcs(migraine+1:end))
% [TPhNRcs_H,P,CI,STATS] = ttest2(TPhNRcs(1:migraine),TPhNRcs(migraine+1:end))
% mean(TPhNRcs(1:migraine))
% std(TPhNRcs(1:migraine))
% mean(TPhNRcs(migraine+1:end))
% std(TPhNRcs(migraine+1:end))


%%%% Cone - fast flicker %%%%

coneF = xlsread('OSF_MigraineERG_DataRaw.xlsx', 'Cone 28.3Hz');

time = coneF(:,1);

for i = 2:(migraine+hf+1)
    data = coneF(:,i);
%     figure;plot(time,data);
    respCf(:,i-1) = detrend(data,1,[1 length(data)]);
%     figure;plot(time,respCf(:,i-1));
    ConeFast(i-1) = mean([max(respCf(40:60,i-1)) max(respCf(109:128,i-1)) max(respCf(177:196,i-1))]);
    [C, I] = max(respCf(40:60,i-1));
    TConeFast(i-1) = time(I);
    
    % FFT
    L = length(respCf(:,i-1));     % Length of signal
    Y = fft(respCf(:,i-1));
    freq = Fs/L*(0:L-1);
%     figure; plot(freq(1:15),abs(Y(1:15)),"LineWidth",3)
%     title("Complex Magnitude of fft Spectrum")
%     xlabel("f (Hz)")
%     ylabel("Power")
%     ylim([0 2500]);
    Cf_line(i-1) = abs(Y(7));
    Cf_tot(i-1) = mean(abs(Y(1:floor(L/2))));
    Cf_rel(i-1) = Cf_line(i-1)/Cf_tot(i-1);

    clearvars data base L Y freq
end

AvgConeFmigraine = mean(respCf(:,1:migraine),2);
SdConeFmigraine = std(respCf(:,1:migraine),1,2);
SeConeFmigraine = SdConeFmigraine/sqrt(migraine);

AvgConeFhf = mean(respCf(:,migraine+1:end),2);
SdConeFhf = std(respCf(:,migraine+1:end),1,2);
SeConeFhf = SdConeFhf/sqrt(hf);

figure; errorbar(time,AvgConeFmigraine, SeConeFmigraine, 'k', "LineWidth", 1);
hold on; errorbar(time,AvgConeFhf, SeConeFhf, "Color",[.6 .6 .6], "LineWidth", 0.9);

% [ConeFast_H,P,CI,STATS] = ttest2(ConeFast(1:migraine),ConeFast(migraine+1:end))
% mean(ConeFast(1:migraine))
% std(ConeFast(1:migraine))
% mean(ConeFast(migraine+1:end))
% std(ConeFast(migraine+1:end))
% [TConeFast_H,P,CI,STATS] = ttest2(TConeFast(1:migraine),TConeFast(migraine+1:end))
% mean(TConeFast(1:migraine))
% std(TConeFast(1:migraine))
% mean(TConeFast(migraine+1:end))
% std(TConeFast(migraine+1:end))



%%%% Photopic Negative Response (PhNR) %%%%

PhNR = xlsread('OSF_MigraineERG_DataRaw.xlsx', 'PhNR');

time = PhNR(:,1);

baseline = 196;

for i = 2:(migraine+hf+1)
    data = PhNR(:,i);
%     figure;plot(time,data);
    data = detrend(data,1,[1 length(data)]);
%     figure;plot(time,data);
    base = mean(data(1:baseline));
    for k = 1:length(data)
        respP(k,i-1) = data(k)-base;
    end
   
    [awaveP(i-1), I] = min(respP(baseline:236,i-1)); % baseline +20ms
    TawaveP(i-1) = time(I+baseline);
    awaveMaxMinP(i-1) = min(respP(baseline:235,i-1))-respP(baseline,i-1);
    [bwaveP(i-1), I] = max(respP(236:275,i-1)); % +20-40ms
    TbwaveP(i-1) = time(I+236);
    bwaveDiffP(i-1) = bwaveP(i-1)-awaveP(i-1);
    [PhNRp(i-1), I] = min(respP(316:353,i-1)); % +60-80ms
    TPhNRp(i-1) = time(I+316);
%     figure;plot(time,respP(:,i-1));

    % FFT
    L = length(respP(:,i-1));     % Length of signal
    Y = fft(respP(:,i-1));
    freq = Fs/L*(0:L-1);
%     figure; plot(freq(1:30),abs(Y(1:30)),"LineWidth",3)
%     title("Complex Magnitude of fft Spectrum")
%     xlabel("f (Hz)")
%     ylabel("Power")
%     ylim([0 2500]);
    P_line(i-1) = abs(Y(16));
    P_tot(i-1) = mean(abs(Y(1:floor(L/2))));
    P_rel(i-1) = P_line(i-1)/P_tot(i-1);

    clearvars data base L Y freq
end

AvgPmigraine = mean(respP(:,1:migraine),2);
SdPmigraine = std(respP(:,1:migraine),1,2);
SePmigraine = SdPmigraine/sqrt(migraine);

AvgPhf = mean(respP(:,migraine+1:end),2);
SdPhf = std(respP(:,migraine+1:end),1,2);
SePhf = SdPhf/sqrt(hf);

figure; errorbar(time,AvgPmigraine, SePmigraine, 'k', "LineWidth", 1);
hold on; errorbar(time,AvgPhf, SePhf, "Color",[.6 .6 .6], "LineWidth", 0.9);

% [TawaveP_H,P,CI,STATS] = ttest2(TawaveP(1:migraine),TawaveP(migraine+1:end))
% mean(TawaveP(1:migraine))
% std(TawaveP(1:migraine))
% mean(TawaveP(migraine+1:end))
% std(TawaveP(migraine+1:end))
% [awaveMaxMinP_H,P,CI,STATS] = ttest2(awaveMaxMinP(1:migraine),awaveMaxMinP(migraine+1:end))
% mean(awaveMaxMinP(1:migraine))
% std(awaveMaxMinP(1:migraine))
% mean(awaveMaxMinP(migraine+1:end))
% std(awaveMaxMinP(migraine+1:end))
% [TbwaveP_H,P,CI,STATS] = ttest2(TbwaveP(1:migraine),TbwaveP(migraine+1:end))
% mean(TbwaveP(1:migraine))
% std(TbwaveP(1:migraine))
% mean(TbwaveP(migraine+1:end))
% std(TbwaveP(migraine+1:end))
% [bwaveDiffP_H,P,CI,STATS] = ttest2(bwaveDiffP(1:migraine),bwaveDiffP(migraine+1:end))
% mean(bwaveDiffP(1:migraine))
% std(bwaveDiffP(1:migraine))
% mean(bwaveDiffP(migraine+1:end))
% std(bwaveDiffP(migraine+1:end))
% [PhNRp_H,P,CI,STATS] = ttest2(PhNRp(1:migraine),PhNRp(migraine+1:end))
% mean(PhNRp(1:migraine))
% std(PhNRp(1:migraine))
% mean(PhNRp(migraine+1:end))
% std(PhNRp(migraine+1:end))
% [TPhNRp_H,P,CI,STATS] = ttest2(TPhNRp(1:migraine),TPhNRp(migraine+1:end))
% mean(TPhNRp(1:migraine))
% std(TPhNRp(1:migraine))
% mean(TPhNRp(migraine+1:end))
% std(TPhNRp(migraine+1:end))