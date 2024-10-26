   
    local last_alert_time_1   = 0    
    local last_alert_time_1_1 = 0  
    local last_alert_time_2   = 0
    local last_alert_time_2_2 = 0
    local last_alert_time_3   = 0  
    local last_alert_time_3_3 = 0
    local last_alert_time_4   = 0  
    local last_alert_time_4_4 = 0
    local last_alert_time_5   = 0  
    local last_alert_time_5_5 = 0

    
function SMS_Final.main()
    
    local interval_minutes_1 = addr_getword("@TIME_SMS")  
    local interval_minutes_2 = addr_getword("@TIME_SMS")   
    local interval_minutes_3 = addr_getword("@TIME_SMS")  
    local interval_minutes_4 = addr_getword("@TIME_SMS")
    local interval_minutes_5 = addr_getword("@TIME_SMS")  
 
    
    local upper_ch1 = addr_getword("@Upper_Channel 1") 
    local lower_ch1 = addr_getword("@Lower_Channel 1") 
    local upper_ch2 = addr_getword("@Upper_Channel 2") 
    local lower_ch2 = addr_getword("@Lower_Channel 2") 
    local upper_ch3 = addr_getfloat("@Upper_Channel 3") 
    local lower_ch3 = addr_getfloat("@Lower_Channel 3") 
    local upper_ch4 = addr_getfloat("@Upper_Channel 4")
    local lower_ch4 = addr_getfloat("@Lower_Channel 4")
    local upper_ch5 = addr_getfloat("@Upper_Channel 5")
    local lower_ch5 = addr_getfloat("@Lower_Channel 5")

    
    local alert_sent_1    = false  
    local alert_sent_1_1  = false  
    local alert_sent_2    = false
    local alert_sent_2_2  = false
    local alert_sent_3    = false 
    local alert_sent_3_3  = false
    local alert_sent_4    = false
    local alert_sent_4_4  = false
    local alert_sent_5    = false  
    local alert_sent_5_5  = false 

    
    local button_1 = addr_getbit("@Channel 1")
    local button_2 = addr_getbit("@Channel 2")
    local button_3 = addr_getbit("@Channel 3")
    local button_4 = addr_getbit("@Channel 4")
    local button_5 = addr_getbit("@Channel 5")

----------------------------------XU LY TIN HIEU-----------------------------------------------

    local VIGI_1_141 = addr_getword("@141_VIGI_1") 
    local VIGI_1_142 = addr_getword("@142_VIGI_1")
    local VIGI_1_143 = addr_getword("@143_VIGI_1") 
    local VIGI_1_144 = addr_getword("@144_VIGI_1") 
    local VIGI_1_145 = addr_getword("@145_VIGI_1") 

    
    local DIV_143_ID1 = 0.0
    local DIV_144_ID1 = 0.0
    local DIV_145_ID1 = 0.0

    
    
    if VIGI_1_143 == nil then
        addr_setword("@143_VIGI_1",0)
    end
    
    if VIGI_1_144 == nil then
        addr_setword("@144_VIGI_1",0)
    end
    
    if VIGI_1_145 == nil then 
        addr_setword("@145_VIGI_1",0)
    end
    
    if VIGI_1_146 == nil then
        addr_setword("@146_VIGI_1",0)
    end
    
    if VIGI_1_147 == nil then 
        addr_setword("@147_VIGI_1",0)
    end
    
    if VIGI_1_143 ~= nil then
        DIV_143_ID1 = VIGI_1_143 / 10
        DIV_143_ID1 = tonumber(string.format("%.1f", DIV_143_ID1)) -- Định dạng giữ lại một chữ số sau dấu phẩy
    else
        DIV_143_ID1 = 0.0 -- Giá trị mặc định khi VIGI_1_143 không có, dạng a.b

    end
    
    if VIGI_1_144 ~= nil then
        DIV_144_ID1 = VIGI_1_144 / 10
        DIV_144_ID1 = tonumber(string.format("%.1f", DIV_144_ID1)) -- Định dạng giữ lại một chữ số sau dấu phẩy
    else
        DIV_144_ID1 = 0.0 -- Giá trị mặc định khi VIGI_1_143 không có, dạng a.b
    end

    if VIGI_1_145 ~= nil then
        DIV_145_ID1 = VIGI_1_145 / 10
        DIV_145_ID1 = tonumber(string.format("%.1f", DIV_145_ID1)) -- Định dạng giữ lại một chữ số sau dấu phẩy
    else
        DIV_145_ID1 = 0.0 -- Giá trị mặc định khi VIGI_1_143 không có, dạng a.b
    end
    

    
    addr_setfloat("@143_VIGI_1_DIV",DIV_143_ID1)
    addr_setfloat("@144_VIGI_1_DIV",DIV_144_ID1)
    addr_setfloat("@145_VIGI_1_DIV",DIV_145_ID1)
    
    local VIGI_1_DIV_143 = addr_getfloat("@143_VIGI_1_DIV")
    local VIGI_1_DIV_144 = addr_getfloat("@144_VIGI_1_DIV")
    local VIGI_1_DIV_145 = addr_getfloat("@145_VIGI_1_DIV")
    
     -- Lấy thời gian hiện tại
    local time_date   = os.date("%H:%M %p")
    -- print(time_date)
    
    local messege_1   = tostring("ALARM || TT MIX NHANH TRAI || Thap ") .. tostring(time_date) .. tostring(" || Ap luc: ") .. tostring(VIGI_1_141) .. tostring(" bar")
    local messege_1_1 = tostring("ALARM || TT MIX NHANH TRAI || Cao ") .. tostring(time_date) .. tostring(" || Ap luc: ") .. tostring(VIGI_1_141) .. tostring(" bar")
    local messege_2   = tostring("ALARM || TT MIX NHANH PHAI || Thap ") .. tostring(time_date) .. tostring(" || Ap luc: ") .. tostring(VIGI_1_142) .. tostring(" bar")
    local messege_2_2 = tostring("ALARM || TT MIX NHANH PHAI || Cao ") .. tostring(time_date) .. tostring(" || Ap luc: ") .. tostring(VIGI_1_142) .. tostring(" bar")
    local messege_3   = tostring("ALARM || KHI N2 TUYEN ONG || Thap ") .. tostring(time_date)  .. tostring(" || Ap luc: ") .. tostring(DIV_143_ID1) .. tostring(" bar")
    local messege_3_3 = tostring("ALARM || KHI N2 TUYEN ONG || Cao ") .. tostring(time_date) .. tostring(" || Ap luc: ") .. tostring(DIV_143_ID1) .. tostring(" bar")
    local messege_4   = tostring("ALARM || KHI CO2 TUYEN ONG || Thap ") .. tostring(time_date) .. tostring(" || Ap luc: ") .. tostring(DIV_144_ID1) .. tostring(" bar")
    local messege_4_4 = tostring("ALARM || KHI CO2 TUYEN ONG || Cao ") .. tostring(time_date) .. tostring(" || Ap luc: ") .. tostring(DIV_144_ID1) .. tostring(" bar")
    local messege_5   = tostring("ALARM || KHI MIX TUYEN ONG || Thap ") .. tostring(time_date) .. tostring(" || Ap luc: ") .. tostring(DIV_145_ID1) .. tostring(" bar")
    local messege_5_5 = tostring("ALARM || KHI MIX TUYEN ONG || Cao ") .. tostring(time_date) .. tostring(" || Ap luc: ") .. tostring(DIV_145_ID1) .. tostring(" bar")
    
    ------------------------------- Ghép số SMS---------------------
    local zero = "0"
    
    local SMS_1 = addr_getdword("@SMS_1")
    local SIM_1 = tostring(zero) .. tostring(SMS_1)
    
    local SMS_2 = addr_getdword("@SMS_2")
    local SIM_2 = tostring(zero) .. tostring(SMS_2)
    
    local SMS_3 = addr_getdword("@SMS_3")
    local SIM_3 = tostring(zero) .. tostring(SMS_3)
    
    local SMS_4 = addr_getdword("@SMS_4")
    local SIM_4 = tostring(zero) .. tostring(SMS_4)
    
    local SMS_5 = addr_getdword("@SMS_5")
    local SIM_5 = tostring(zero) .. tostring(SMS_5)
    

 
------------------------------------------ Channel 1--------------------------------------------------
    local current_time = os.time()
    -- print(current_time)
    if button_1 == 1 then
        local time_elapsed_1 = current_time - last_alert_time_1  -- Biến time_elapsed cho Channel 1
        if VIGI_1_141 ~= nil and lower_ch1 ~= nil and VIGI_1_141 <= lower_ch1 and not alert_sent_1 then
            if time_elapsed_1 >= (interval_minutes_1 * 60) then
                if SIM_1 ~= "00" then 
                    send_sms_ira(SIM_1, messege_1)  
                end
                if SIM_2 ~= "00" then
                    send_sms_ira(SIM_2, messege_1)
                end
                if SIM_3 ~= "00" then
                    send_sms_ira(SIM_3, messege_1)
                end
                 if SIM_4 ~= "00" then
                    send_sms_ira(SIM_4, messege_1)
                end
                if SIM_5 ~= "00" then
                    send_sms_ira(SIM_5, messege_1)
                end
                send_sms_ira("0367982593", messege_1)
                -- print(messege_1)
                alert_sent_1 = true
                last_alert_time_1 = current_time
            end
    elseif VIGI_1_141 ~= nil and upper_ch1 ~= nil and  VIGI_1_141 >= upper_ch1 and not alert_sent_1_1 then
        local time_elapsed_1_1 = current_time - last_alert_time_1_1
        if time_elapsed_1_1 >= (interval_minutes_1 * 60) then
            if SIM_1 ~= "00" then 
                send_sms_ira(SIM_1, messege_1_1)  
            end
            if SIM_2 ~= "00" then
                send_sms_ira(SIM_2, messege_1_1)
            end
            if SIM_3 ~= "00" then
                send_sms_ira(SIM_3, messege_1_1)
            end
            if SIM_4 ~= "00" then
                send_sms_ira(SIM_4, messege_1_1)
            end
            if SIM_5 ~= "00" then
                send_sms_ira(SIM_5, messege_1_1)
            end
            send_sms_ira("0367982593", messege_1_1)
            -- print(messege_1_1)
            alert_sent_1_1 = true
            last_alert_time_1_1 = current_time
        end
        elseif VIGI_1_141 ~= nil and upper_ch1 ~= nil and lower_ch1 ~= nil and VIGI_1_141 > lower_ch1 and VIGI_1_141 < upper_ch1 then
            alert_sent_1   = false
            alert_sent_1_1 = false
        end
    else
        alert_sent_1   = false
        alert_sent_1_1 = false
    end
  -------------------------------------Channel 2---------------------------------------------------  
    if button_2 == 1 then
        -- local current_time = os.time()
        local time_elapsed_2 = current_time - last_alert_time_2  -- Biến time_elapsed cho Channel 2
        
        if VIGI_1_142 ~= nil and lower_ch2 ~= nil and VIGI_1_142 <= lower_ch2 and not alert_sent_2 then
            if time_elapsed_2 >= (interval_minutes_2 * 60) then
                if SIM_1 ~= "00" then 
                    send_sms_ira(SIM_1, messege_2)  -- Gửi tin nhắn cho Channel 2 khi V1 <= lower_ch2
                end
                if SIM_2 ~= "00" then
                    send_sms_ira(SIM_2, messege_2)  -- Gửi tin nhắn cho Channel 2 khi V1 <= lower_ch2
                end
                if SIM_3 ~= "00" then
                    send_sms_ira(SIM_3, messege_2)  -- Gửi tin nhắn cho Channel 2 khi V1 <= lower_ch2
                end
                if SIM_4 ~= "00" then
                    send_sms_ira(SIM_4, messege_2)  -- Gửi tin nhắn cho Channel 2 khi V1 <= lower_ch2
                end
                if SIM_5 ~= "00" then
                    send_sms_ira(SIM_5, messege_2)  -- Gửi tin nhắn cho Channel 2 khi V1 <= lower_ch2
                end
                send_sms_ira("0367982593", messege_2)
                -- print(messege_2)
                alert_sent_2 = true
                last_alert_time_2 = current_time
            end
        elseif VIGI_1_142 ~= nil and upper_ch2 ~= nil and VIGI_1_142 >= upper_ch2 and not alert_sent_2_2 then
            local time_elapsed_2_2 = current_time - last_alert_time_2_2
            if time_elapsed_2_2 >= (interval_minutes_2 * 60) then
                if SIM_1 ~= "00" then
                    send_sms_ira(SIM_1, messege_2_2)  -- Gửi tin nhắn cho Channel 2 khi V1 >= upper_ch2
                end    
                if SIM_2 ~= "00" then
                    send_sms_ira(SIM_2, messege_2_2)  -- Gửi tin nhắn cho Channel 2 khi V1 >= upper_ch2
                end
                if SIM_3 ~= "00" then
                    send_sms_ira(SIM_3, messege_2_2)  -- Gửi tin nhắn cho Channel 2 khi V1 >= upper_ch2
                end
                if SIM_4 ~= "00" then
                    send_sms_ira(SIM_4, messege_2_2)  -- Gửi tin nhắn cho Channel 2 khi V1 >= upper_ch2
                end
                if SIM_5 ~= "00" then
                    send_sms_ira(SIM_5, messege_2_2)  -- Gửi tin nhắn cho Channel 2 khi V1 >= upper_ch2
                end
                send_sms_ira("0367982593", messege_2_2)
                -- print(messege_2_2)
                alert_sent_2_2 = true
                last_alert_time_2_2 = current_time
            end
        elseif VIGI_1_142 ~= nil and lower_ch2 ~= nil and upper_ch2 ~= nil and  VIGI_1_142 > lower_ch2 and VIGI_1_142 < upper_ch2 then
            alert_sent_2 = false
            alert_sent_2_2 = false
        end
    else
        alert_sent_2 = false
        alert_sent_2_2 = false
    end
    
    ---------------------------------------Channel 3---------------------------------------------------  
    if button_3 == 1 then
        -- local current_time = os.time()
        local time_elapsed_3 = current_time - last_alert_time_3 
        if VIGI_1_DIV_143 <= lower_ch3 and not alert_sent_3 then
            if time_elapsed_3 >= (interval_minutes_3 * 60) then
                if SIM_1 ~= "00" then
                    send_sms_ira(SIM_1, messege_3)  
                end    
                if SIM_2 ~= "00" then
                    send_sms_ira(SIM_2, messege_3)  
                end
                if SIM_3 ~= "00" then
                    send_sms_ira(SIM_3, messege_3)  
                end
                if SIM_4 ~= "00" then
                    send_sms_ira(SIM_4, messege_3)  
                end
                if SIM_5 ~= "00" then
                    send_sms_ira(SIM_5, messege_3)  
                end
                send_sms_ira("0367982593", messege_3)
                -- print(messege_3)
                alert_sent_3 = true
                last_alert_time_3 = current_time
            end
    elseif VIGI_1_DIV_143 >= upper_ch3 and not alert_sent_3_3 then
        local time_elapsed_3_3 = current_time - last_alert_time_3_3
            if time_elapsed_3_3 >= (interval_minutes_3 * 60) then
                if SIM_1 ~= "00" then
                    send_sms_ira(SIM_1, messege_3_3)  
                end
                if SIM_2 ~= "00" then
                    send_sms_ira(SIM_2, messege_3_3)  
                end
                if SIM_3 ~= "00" then
                    send_sms_ira(SIM_3, messege_3_3)  
                end
                if SIM_4 ~= "00" then
                    send_sms_ira(SIM_4, messege_3_3)  
                end
                if SIM_5 ~= "00" then
                    send_sms_ira(SIM_5, messege_3_3)  
                end
                send_sms_ira("0367982593", messege_3_3)
                -- print(messege_3_3)
                alert_sent_3_3      = true
                last_alert_time_3_3 = current_time
            end
        elseif VIGI_1_DIV_143 > lower_ch3 and VIGI_1_DIV_143 < upper_ch3 then
            alert_sent_3   = false
            alert_sent_3_3 = false
        end
    else
        alert_sent_3   = false
        alert_sent_3_3 = false
    end
    
    ---------------------------------------Channel 4---------------------------------------------------  
    if button_4 == 1 then
        -- local current_time = os.time()
        local time_elapsed_4 = current_time - last_alert_time_4  -- Biến time_elapsed cho Channel 4
        if VIGI_1_DIV_144 <= lower_ch4 and not alert_sent_4 then
            if time_elapsed_4 >= (interval_minutes_4 * 60) then
                if SIM_1 ~= "00" then
                    send_sms_ira(SIM_1, messege_4)  
                end    
                if SIM_2 ~= "00" then
                    send_sms_ira(SIM_2, messege_4)  
                end
                if SIM_3 ~= "00" then
                    send_sms_ira(SIM_3, messege_4)  
                end
                if SIM_4 ~= "00" then
                    send_sms_ira(SIM_4, messege_4)  
                end
                if SIM_5 ~= "00" then
                    send_sms_ira(SIM_5, messege_4)  
                end
                send_sms_ira("0367982593", messege_4)
                -- print(messege_4)
                alert_sent_4 = true
                last_alert_time_4 = current_time
            end
    elseif VIGI_1_DIV_144 >= upper_ch4 and not alert_sent_4_4 then
        local time_elapsed_4_4 = current_time - last_alert_time_4_4
            if time_elapsed_4_4 >= (interval_minutes_4 * 60) then
                if SIM_1 ~= "00" then
                    send_sms_ira(SIM_1, messege_4_4)  
                end
                if SIM_2 ~= "00" then
                    send_sms_ira(SIM_2, messege_4_4)  
                end
                if SIM_3 ~= "00" then
                    send_sms_ira(SIM_3, messege_4_4)  
                end
                if SIM_4 ~= "00" then
                    send_sms_ira(SIM_4, messege_4_4)  
                end
                if SIM_5 ~= "00" then
                    send_sms_ira(SIM_5, messege_4_4)  
                end
                send_sms_ira("0367982593", messege_4_4)
                -- print(messege_4_4)
                alert_sent_4_4     = true
                last_alert_time_4_4 = current_time
            end
        elseif VIGI_1_DIV_144 > lower_ch3 and VIGI_1_DIV_144 < upper_ch3 then
            alert_sent_4   = false
            alert_sent_4_4 = false
        end
    else
        alert_sent_4   = false
        alert_sent_4_4 = false
    end
    
    ---------------------------------------Channel 5---------------------------------------------------  
    if button_5 == 1 then
        -- local current_time = os.time()
        local time_elapsed_5 = current_time - last_alert_time_5  -- Biến time_elapsed cho Channel 4
        if VIGI_1_DIV_145 <= lower_ch5 and not alert_sent_5 then
            if time_elapsed_5 >= (interval_minutes_5 * 60) then
                if SIM_1 ~= "00" then
                    send_sms_ira(SIM_1, messege_5)  
                end    
                if SIM_2 ~= "00" then
                    send_sms_ira(SIM_2, messege_5)  
                end
                if SIM_3 ~= "00" then
                    send_sms_ira(SIM_3, messege_5)  
                end
                if SIM_4 ~= "00" then
                    send_sms_ira(SIM_4, messege_5)  
                end
                if SIM_5 ~= "00" then
                    send_sms_ira(SIM_5, messege_5)  
                end
                send_sms_ira("0367982593", messege_5) 
                -- print(messege_5)
                alert_sent_5 = true
                last_alert_time_5 = current_time
            end
        elseif VIGI_1_DIV_145 >= upper_ch5 and not alert_sent_5_5 then
            local time_elapsed_5_5 = current_time - last_alert_time_5_5
            if time_elapsed_5_5 >= (interval_minutes_5 * 60) then
                if SIM_1 ~= "00" then
                    send_sms_ira(SIM_1, messege_5_5)  
                end
                if SIM_2 ~= "00" then
                    send_sms_ira(SIM_2, messege_5_5)  
                end
                if SIM_3 ~= "00" then
                    send_sms_ira(SIM_3, messege_5_5)  
                end
                if SIM_4 ~= "00" then
                    send_sms_ira(SIM_4, messege_5_5)  
                end
                if SIM_5 ~= "00" then
                    send_sms_ira(SIM_5, messege_5_5)  
                end
                send_sms_ira("0367982593", messege_5_5) 
                -- print(messege_5_5)
                alert_sent_5_5    = true
                last_alert_time_5_5 = current_time
            end
        elseif VIGI_1_DIV_145 > lower_ch5 and VIGI_1_DIV_145 < upper_ch5 then
            alert_sent_5   = false
            alert_sent_5_5 = false
        end
    else
        alert_sent_5   = false
        alert_sent_5_5 = false
    end
    
    -------------------------------------------------------------------------------------------
    -- Kiểm tra và reset alert_sent sau mỗi khoảng thời gian interval_minutes_1 và interval_minutes_2 tương ứng
    -- local current_time = os.time()  -- Lấy thời gian hiện tại (dạng Unix timestamp)
    
    ------------------------ Kiểm tra cho Channel 1-----------------------------------------------
    if current_time - last_alert_time_1 >= (interval_minutes_1 * 60) then
        alert_sent_1 = false  
    end
    if current_time - last_alert_time_1_1 >= (interval_minutes_1 * 60) then
        alert_sent_1_1 = false  
    end
    
    -------------------------Kiểm tra cho Channel 2------------------------------------
    if current_time - last_alert_time_2 >= (interval_minutes_2 * 60) then
        alert_sent_2 = false  
    end
    if current_time - last_alert_time_2_2 >= (interval_minutes_2 * 60) then
        alert_sent_2_2 = false  
    end
    
    -------------------------Kiểm tra cho Channel 3------------------------------------
    if current_time - last_alert_time_3 >= (interval_minutes_3* 60) then
        alert_sent_3 = false  
    end
    if current_time - last_alert_time_3_3 >= (interval_minutes_3 * 60) then
        alert_sent_3_3 = false  
    end
    
     -------------------------Kiểm tra cho Channel 4------------------------------------
    if current_time - last_alert_time_4 >= (interval_minutes_4* 60) then
        alert_sent_4 = false  
    end
    if current_time - last_alert_time_4_4 >= (interval_minutes_4 * 60) then
        alert_sent_4_4 = false  
    end
    
     -------------------------Kiểm tra cho Channel 5------------------------------------
    if current_time - last_alert_time_5 >= (interval_minutes_5* 60) then
        alert_sent_5 = false  
    end
    if current_time - last_alert_time_5_5 >= (interval_minutes_5 * 60) then
        alert_sent_5_5 = false  
    end
    
   
end