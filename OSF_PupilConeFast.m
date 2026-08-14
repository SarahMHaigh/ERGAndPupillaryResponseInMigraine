%% Pupil response from RETeval:
% random sampling rate (can't filter)
% not long in duration

% clear all
% close all

%%%%%%%%%% Cone - Fast Flicker %%%%%%%%%%%

path = pwd;
[~, ~, RAWm] = xlsread([pwd '/OSF_PupilData.xlsx'],'28.3Migraine','A5:DT1149');

dataM = cell2mat(RAWm);

baseline = 100;
dur = 370;
time = -baseline:dur;

for i = 1:size(dataM,2)/2
    
    [dM, ixM] = min(abs(dataM(:,i*2-1)));
    temp = dataM(ixM-baseline:ixM+dur,i*2);
    TConeF_MaxBaseM(i) = nanmean(dataM(1:ixM,i*2));

    base = nanmean(temp(1:baseline));
    for k = 1:length(temp)
        TConeF_M(k,i) = temp(k);%-base;
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
     TConeF_MaxBaseMadj(i) = nanmean(FullTadj(1:ixM));

    baseAdj = nanmean(tempAdj(1:baseline));
    for k = 1:length(tempAdj)
        TConeF_Madj(k,i) = tempAdj(k);
        TConeF_MadjBase(k,i) = tempAdj(k)-base;
    end

    TConeF_WholeM(i) = nanmean(TConeF_M(1:baseline+dur,i));
    TConeF_baseM(i) = nanmean(base);

    TConeF_RawAdjM(i) = nanmean(FullTadj);
    TConeF_WholeMadjBase(i) = nanmean(TConeF_MadjBase(baseline:end,i));
    TConeF_baseMadj(i) = nanmean(baseAdj);
    TConeF_WholeMadj(i) = nanmean(TConeF_Madj(1:baseline+dur,i));
    
    clearvars temp base slide dM ixM maxT minT tempAdj baseAdj FullTadj fullT 
end

for j = 1:i/2

    ConeF_WholeM(j) = nanmean(TConeF_WholeM(j*2-1:j*2));
    ConeF_baseM(j) = nanmean(TConeF_baseM(j*2-1:j*2));

    ConeF_RawAdjM(j) = nanmean(TConeF_RawAdjM(j*2-1:j*2));
    ConeF_WholeMadjBase(j) = nanmean(TConeF_WholeMadjBase(j*2-1:j*2));
    ConeF_baseMadj(j) = nanmean(TConeF_baseMadj(j*2-1:j*2));
    ConeF_WholeMadj(j) = nanmean(TConeF_WholeMadj(j*2-1:j*2));

    ConeF_M(:,j) = nanmean(TConeF_M(:,j*2-1:j*2),2);
    ConeF_MadjBase(:,j) = nanmean(TConeF_MadjBase(:,j*2-1:j*2),2);
    ConeF_Madj(:,j) = nanmean(TConeF_Madj(:,j*2-1:j*2),2);

end

clearvars dataM RAWm TConeF_WholeM TConeF_baseM TConeF_RawAdjM TConeF_WholeMadjBase TConeF_baseMadj...
    TConeF_WholeMadj TConeF_M TConeF_MadjBase TConeF_Madj

%%%

[~, ~, RAWhf] = xlsread([pwd '/OSF_PupilData.xlsx'],'28.3HF','A5:CN1001');

dataHF = cell2mat(RAWhf);

for i = 1:size(dataHF,2)/2
    
    [dHF, ixHF] = min(abs(dataHF(:,i*2-1)));
    temp = dataHF(ixHF-baseline:ixHF+dur,i*2);
    TConeF_MaxBaseHF(i) = nanmean(dataHF(1:ixHF,i*2));

    base = nanmean(temp(1:baseline));    
    for k = 1:length(temp)
        TConeF_HF(k,i) = temp(k);%-base;
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
     TConeF_MaxBaseHFadj(i) = nanmean(FullTadj(1:ixHF));

    baseAdj = nanmean(tempAdj(1:baseline));
    for k = 1:length(tempAdj)
        TConeF_HFadj(k,i) = tempAdj(k);
        TConeF_HFadjBase(k,i) = tempAdj(k)-base;
    end

    TConeF_WholeHF(i) = nanmean(TConeF_HF(1:baseline+dur,i));
    TConeF_baseHF(i) = nanmean(base);

    TConeF_RawAdjHF(i) = nanmean(FullTadj);
    TConeF_WholeHFadjBase(i) = nanmean(TConeF_HFadjBase(baseline:end,i));
    TConeF_WholeHFadj(i) = nanmean(TConeF_HFadj(1:baseline+dur,i));
    TConeF_baseHFadj(i) = nanmean(baseAdj);
    
    clearvars temp base slide dM ixM maxT minT tempAdj baseAdj FullTadj fullT
end

for j = 1:i/2

    ConeF_WholeHF(j) = nanmean(TConeF_WholeHF(j*2-1:j*2));
    ConeF_baseHF(j) = nanmean(TConeF_baseHF(j*2-1:j*2));

    ConeF_RawAdjHF(j) = nanmean(TConeF_RawAdjHF(j*2-1:j*2));
    ConeF_WholeHFadjBase(j) = nanmean(TConeF_WholeHFadjBase(j*2-1:j*2));
    ConeF_baseHFadj(j) = nanmean(TConeF_baseHFadj(j*2-1:j*2));
    ConeF_WholeHFadj(j) = nanmean(TConeF_WholeHFadj(j*2-1:j*2));

    ConeF_HF(:,j) = nanmean(TConeF_HF(:,j*2-1:j*2),2);
    ConeF_HFadjBase(:,j) = nanmean(TConeF_HFadjBase(:,j*2-1:j*2),2);
    ConeF_HFadj(:,j) = nanmean(TConeF_HFadj(:,j*2-1:j*2),2);

end

clearvars dataHF RAWhf TConeF_WholeHF TConeF_baseHF TConeF_RawAdjHF TConeF_WholeHFadjBase...
    TConeF_baseHFadj TConeF_WholeHFadj TConeF_HF TConeF_HFadjBase TConeF_HFadj
clearvars time dur baseline