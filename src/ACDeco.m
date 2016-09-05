function c_ac = ACDeco(ac, ACTAB)
c_ac = [];
ac_dict = CreateACDict(ACTAB, 'decode');

zrl = num2str([1 1 1 1 1 1 1 1 0 0 1]);
eob = num2str([1 0 1 0]);

st = 1;
ed = 1;

ac_cnt = 0;
while st <= length(ac)
    cur_token = num2str(ac(st:ed));
    if ac_dict.isKey(cur_token)
        run_size = ac_dict(cur_token);
        if run_size(2) == 0
            run_size(2) = 1;
        end
        cur_val = Bin2Dec(ac(ed+1:ed+run_size(2)));
        c_ac = [c_ac zeros(1, run_size(1)) cur_val];
        ac_cnt = ac_cnt + run_size(1) + 1;
        st = ed + run_size(2) + 1;
        ed = ed + run_size(2) + 1;
    elseif strcmp(cur_token, zrl)
        c_ac = [c_ac zeros(1, 16)];
        ac_cnt = ac_cnt + 16;
        st = ed + 1;
        ed = ed + 1;
    elseif strcmp(cur_token, eob)
        c_ac = [c_ac zeros(1, 63 - ac_cnt)];
        ac_cnt = 0;
        st = ed + 1;
        ed = ed + 1;
    else
        ed = ed + 1;
    end
end

c_ac = reshape(c_ac, 63, length(c_ac) / 63);
end

