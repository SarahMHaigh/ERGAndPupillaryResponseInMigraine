%% Pupil response from RETeval:
% random sampling rate (can't filter)
% not long in duration

% clear all
% close all

%%%%%%%%%% Cone - Slow Flash %%%%%%%%%%%

path = pwd;
[~, ~, RAWm] = xlsread([pwd '/OSF_PupilData.xlsx'],'1.96Migraine','A5:DX1315');

dataM = cell2mat(RAWm);

baseline = 100;
dur = 450;
time = -baseline:dur;

for i = 1:size(dataM,2)/2
    
    [dM, ixM] = min(abs(dataM(:,i*2-1)));
    temp = dataM(ixM-baseline:ixM+dur,i*2);
    TConeS_MaxBaseM(i) = nanmean(dataM(1:ixM,i*2));

        base = nanmean(temp(1:baseline));
    for k = 1:length(temp)
        TConeS_M(k,i) = temp(k);%-base;
    end
%     figure; plot(time,respM(:,i));

    fullT = dataM(:,i*2);
    maxT = nanmean(fullT)+(nanstd(fullT)*2);
    minT = nanmean(fullT)-(nanstd(fullT)*2);
     for j = 1:length(fullT)
        if fullT(j)>maxT || fullT(j)<minT
            FullTadj(j) = nanmean(fullT);
        else FullTadj(j) = fullT(j);
        end
     end
     tempAdj = FullTadj(ixM-baseline:ixM+dur);
     MaxBaseMadj(i) = nanmean(FullTadj(1:ixM));

    baseAdj = nanmean(tempAdj(1:baseline));
    for k = 1:length(tempAdj)
        TConeS_Madj(k,i) = tempAdj(k);
        TConeS_MadjBase(k,i) = tempAdj(k)-base;
    end

    TConeS_WholeM(i) = nanmean(TConeS_M(1:baseline+dur,i));
    TConeS_baseM(i) = nanmean(base);

    TConeS_RawAdjM(i) = nanmean(FullTadj);
    TConeS_WholeMadjBase(i) = nanmean(TConeS_MadjBase(baseline:end,i));
    TConeS_baseMadj(i) = nanmean(baseAdj);
    TConeS_WholeMadj(i) = nanmean(TConeS_Madj(1:baseline+dur,i));
    
    clearvars temp base slide dM ixM maxT minT tempAdj baseAdj FullTadj fullT 
end

for j = 1:i/2

    ConeS_WholeM(j) = nanmean(TConeS_WholeM(j*2-1:j*2));
    ConeS_baseM(j) = nanmean(TConeS_baseM(j*2-1:j*2));

    ConeS_RawAdjM(j) = nanmean(TConeS_RawAdjM(j*2-1:j*2));
    ConeS_WholeMadjBase(j) = nanmean(TConeS_WholeMadjBase(j*2-1:j*2));
    ConeS_baseMadj(j) = nanmean(TConeS_baseMadj(j*2-1:j*2));
    ConeS_WholeMadj(j) = nanmean(TConeS_WholeMadj(j*2-1:j*2));

    ConeS_M(:,j) = nanmean(TConeS_M(:,j*2-1:j*2),2);
    ConeS_MadjBase(:,j) = nanmean(TConeS_MadjBase(:,j*2-1:j*2),2);
    ConeS_Madj(:,j) = nanmean(TConeS_Madj(:,j*2-1:j*2),2);

end

clearvars dataM RAWm TConeS_WholeM TConeS_baseM TConeS_RawAdjM TConeS_WholeMadjBase...
    TConeS_baseMadj TConeS_WholeMadj TConeS_M TConeS_MadjBase TConeS_Madj

%%%

[~, ~, RAWhf] = xlsread([pwd '/OSF_PupilData.xlsx'],'1.96HF','A5:CN985');

dataHF = cell2mat(RAWhf);

for i = 1:size(dataHF,2)/2
    
    [dHF, ixHF] = min(abs(dataHF(:,i*2-1)));
    temp = dataHF(ixHF-baseline:ixHF+dur,i*2);
    TConeS_MaxBaseHF(i) = nanmean(dataHF(1:ixHF,i*2));

    base = nanmean(temp(1:baseline));    
    for k = 1:length(temp)
        TConeS_HF(k,i) = temp(k);%-base;
    end
   
%     figure; plot(time,respHF(:,i));
    fullT = dataHF(:,i*2);
    maxT = nanmean(fullT)+(nanstd(fullT)*2);
    minT = nanmean(fullT)-(nanstd(fullT)*2);
     for j = 1:length(fullT)
        if fullT(j)>maxT || fullT(j)<minT
            FullTadj(j) = nanmean(fullT);
        else FullTadj(j) = fullT(j);
        end
     end
     tempAdj = FullTadj(ixHF-baseline:ixHF+dur);
     TConeS_MaxBaseHFadj(i) = nanmean(FullTadj(1:ixHF));

    baseAdj = nanmean(tempAdj(1:baseline));
    for k = 1:length(tempAdj)
        TConeS_HFadj(k,i) = tempAdj(k);
        TConeS_HFadjBase(k,i) = tempAdj(k)-base;
    end

    TConeS_WholeHF(i) = nanmean(TConeS_HF(1:baseline+dur,i));
    TConeS_baseHF(i) = nanmean(base);

    TConeS_RawAdjHF(i) = nanmean(FullTadj);
    TConeS_WholeHFadjBase(i) = nanmean(TConeS_HFadjBase(baseline:end,i));
    TConeS_WholeHFadj(i) = nanmean(TConeS_HFadj(1:baseline+dur,i));
    TConeS_baseHFadj(i) = nanmean(baseAdj);
    
    clearvars temp base slide dM ixM maxT minT tempAdj baseAdj FullTadj fullT
end

for j = 1:i/2

    ConeS_WholeHF(j) = nanmean(TConeS_WholeHF(j*2-1:j*2));
    ConeS_baseHF(j) = nanmean(TConeS_baseHF(j*2-1:j*2));

    ConeS_RawAdjHF(j) = nanmean(TConeS_RawAdjHF(j*2-1:j*2));
    ConeS_WholeHFadjBase(j) = nanmean(TConeS_WholeHFadjBase(j*2-1:j*2));
    ConeS_baseHFadj(j) = nanmean(TConeS_baseHFadj(j*2-1:j*2));
    ConeS_WholeHFadj(j) = nanmean(TConeS_WholeHFadj(j*2-1:j*2));

    ConeS_HF(:,j) = nanmean(TConeS_HF(:,j*2-1:j*2),2);
    ConeS_HFadjBase(:,j) = nanmean(TConeS_HFadjBase(:,j*2-1:j*2),2);
    ConeS_HFadj(:,j) = nanmean(TConeS_HFadj(:,j*2-1:j*2),2);

end

clearvars dataHF RAWhf TConeS_WholeHF TConeS_baseHF TConeS_RawAdjHF TConeS_WholeHFadjBase...
    TConeS_baseHFadj TConeS_WholeHFadj TConeS_HF TConeS_HFadjBase TConeS_HFadj
clearvars time dur baseline