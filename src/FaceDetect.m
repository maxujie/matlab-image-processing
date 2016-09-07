function faces = FaceDetect(img, v, l, pixel_step, radius_step, threshold)
[height, width, ~] = size(img);

faces = zeros(1, 3);
for x = radius_step*2+1:pixel_step:width-radius_step*2
    for y = radius_step*2+1:pixel_step:height-radius_step*2
        disp(['(' num2str(x) ',' num2str(y), ')']);
        edge_dis = [radius_step * 3; x-1; y-1; width-x; height-y; sqrt((faces(:, 1)-x).^2+(faces(:, 2)-y).^2)-faces(:, 3)];
        max_radius = min(edge_dis);
        for radius = radius_step*2:radius_step:max_radius
            img_roi = img(y-radius:y+radius, x-radius:x+radius, :);
            feature_roi = Image2Feature(img_roi, l);

            if Distance(v, feature_roi) < threshold
                n = 5000;
                xt = [x randi([x-radius, x+radius], 1, n)];
                yt = [y randi([y-radius, y+radius], 1, n)];
                rt = [radius randi([round(radius/2), round(radius*1.5)], 1, n)];
                dis = [Distance(v, feature_roi) ones(1, n)];
                for i = 2:n+1
                    if (xt(i)-radius > 0 && xt(i) + radius <= width ...
                            && yt(i) - radius > 0 && yt(i) + radius <= height)
                        img_roi_t = img(yt(i)-radius:yt(i)+radius, ...
                            xt(i)-radius:xt(i)+radius, :);
                        feature_roi_t = Image2Feature(img_roi_t, l);
                        dis(i) = Distance(v, feature_roi_t);
                    end
                end
                [~, min_dis_ind] = min(dis);
                faces(end+1, :) = [xt(min_dis_ind); yt(min_dis_ind); rt(min_dis_ind)];
                % rectangle('Position', [faces(end, 1)-radius, faces(end, 2)-radius, faces(end, 3)*2+1, faces(end, 3)*2+1], 'EdgeColor', 'r', 'LineWidth', 2);
                break;
            end
        end
    end
end

faces(1, :)  = [];
end

function dis = Distance(f1, f2)
dis = 1 - sum(sqrt(f1.*f2));
end