function final
    fileList = ["Brian.wav" "Nikki.wav" "Pravishti.wav"];
    peakVals = [0.0010 0.0009 0.0013];
    split_locations = [
        15  % 15 second intermission
        60  % 1 minute base hr
        15  % 15 second intermission
        300 % 5 minute jumpscare video
        30  % second intermission
        180 % 3 minute calm music
    ];

    for fileId = 1:length(fileList)
        [ECG, Fs] = audioread(fileList(fileId));
        ECG_data = ECG(:, 1);
        peakVal = peakVals(fileId);
        
        %% Filter Data %%
        ECG_filtered = filterdata(ECG_data, Fs);

        %% Split Data based on Time Stamps %%
        ECG_split = cell(1, 6);
    
        current_split = 1;
        for i = 1:6
            Fs_split = Fs * split_locations(i);
            ECG_split{i} = ECG_filtered(current_split:current_split + Fs_split, 1);
            current_split = current_split + Fs_split;
        end

        %% Analyze useful data sections %%
        ECG_base = ECG_split{2};
        ECG_scared = ECG_split{4};
        ECG_calm = ECG_split{6};

        base_hr = size(findpeaks(ECG_base, "MinPeakProminence", peakVal), 1) / 1;
        scared_hr = size(findpeaks(ECG_scared, "MinPeakProminence", peakVal), 1) / 5;
        calm_hr = size(findpeaks(ECG_calm, "MinPeakProminence", peakVal), 1) / 3;
        
        fprintf("-- %s --\n", fileList(fileId));
        fprintf("\t Base   HR: %.2f\n", base_hr);
        fprintf("\t Scared HR: %.2f\n", scared_hr);
        fprintf("\t Calm   HR: %.2f\n", calm_hr);
        
        subplot(length(fileList), 1, fileId);
        plot([base_hr scared_hr calm_hr]);
        title("Subject " + fileId)
    end
end