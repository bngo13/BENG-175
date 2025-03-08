function [] = HW2()
    % Read Data
    load ECG_1.mat ECG Fs;

    prominance_vals = [1, 0.5, 0.9, 0.8, 0.7, 0.9, 0.5, 0.3, 0.8, 0.6, 0.5, 0.6];

    for i = 1:12
        %% Init data for current sample %%
        fprintf("Sample %d\n", i);
        patient_ECG = ECG(i, :);
        data_len = size(patient_ECG, 2);

        %% Sample the data in seconds %%
        fprintf("Displaying data in seconds...\n")
        patient_ECG_y_sec = 0 : (1/Fs) : fix(data_len/Fs);
        plot(patient_ECG_y_sec, patient_ECG);
        fprintf("Press any key to continue...\n")
        pause

        %% Get and sample data in minutes
        samples_per_min = Fs * 60;
        current_sample = 1;
        patient_ECG_min = [];
        
        j = 1;
        % Calculate the HR of a patient every minute
        while current_sample < data_len 
            patient_hr_minute = patient_ECG(current_sample : (current_sample + samples_per_min));
            hr = getheartbeat(patient_hr_minute, prominance_vals(i));
            patient_ECG_min(j) = hr;
            fprintf("Patient heartrate at %d minute(s): %d\n", fix(current_sample / samples_per_min) + 1, hr);
            current_sample = current_sample + samples_per_min;
            j = j + 1;
        end

        % Display the data
        patient_ECG_y_min = 1 : fix(data_len/samples_per_min);
        disp(mean(patient_ECG_min));
        plot(patient_ECG_y_min, patient_ECG_min);
        fprintf("Displaying patient heart rate in minutes...\n")
        fprintf("Press any key to continue...\n")
        pause

        %% Calculate hr variability per min

        patient_ECG_min_variability = [];
        f = abs(diff(patient_ECG_min));
        disp(f)
        for j = 2:size(patient_ECG_min, 2)
            patient_ECG_min_variability(j - 1) = abs(patient_ECG_min(j - 1) - patient_ECG_min(j));
        end
        disp(mean(patient_ECG_min_variability));
        plot(patient_ECG_min_variability);
        fprintf("Displaying heart rate variability in minutes...\n")
        fprintf("Press any key to continue...\n")
        pause
    end
end
