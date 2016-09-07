function v = TrainFaceDetector(images, l)
v_sum = zeros(2^(3*l), 1);
for i = 1:length(images)
    v_sum = v_sum + Image2Feature(images{i}, l);
end 
v = v_sum / length(images);
end

