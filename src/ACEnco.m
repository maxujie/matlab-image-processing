function ac = ACEnco(c_ac, ACTAB)
ac = [];
zrl = [1 1 1 1 1 1 1 1 0 0 1];
eob = [1 0 1 0];
ac_dict = CreateACDict(ACTAB, 'encode');
for i = 1:size(c_ac, 2)
    cur_c = c_ac(:, i)';
    run_cnt = 0;
    for val = cur_c
        if val == 0
            run_cnt = run_cnt + 1;
        else
            while run_cnt >= 16
                ac = [ac zrl];
                run_cnt = run_cnt - 16;
            end
            ac = [ac ac_dict(num2str([run_cnt Category(val)])) Dec2Bin(val)];
            run_cnt = 0;
        end
    end
    ac = [ac eob];
end

end

