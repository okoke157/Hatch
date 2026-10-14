-- CẤU HÌNH SCRIPT
local EggName = "Common Egg" -- Thay tên quả trứng bạn muốn mở vào đây (Ví dụ: "Spotted Egg", "Magma Egg"...)
local AutoHatch = true       -- Đổi thành false nếu bạn muốn dừng script

-- KHỞI TẠO TIẾN TRÌNH
local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- Tìm Remote Event xử lý việc mở trứng trong game Clicker Simulator
local HatchRemote = ReplicatedStorage:WaitForChild("EggRemotes"):WaitForChild("HatchEgg") 

print("Đang kích hoạt Auto Hatch cho: " .. EggName)

-- VÒNG LẶP TỰ ĐỘNG MỞ TRỨNG
task.spawn(function()
    while AutoHatch do
        -- Gọi Remote của Server để mở trứng (Clicker Simulator thường yêu cầu Tên Trứng và Số Lượng mở, ví dụ là 1)
        local success, err = pcall(function()
            HatchRemote:InvokeServer(EggName, 1)
        end)
        
        -- Nếu có lỗi xảy ra (hết tiền, sai tên trứng...) hệ thống sẽ báo lên bảng Console (F9)
        if not success then
            warn("Lỗi mở trứng: ", err)
        end
        
        -- Thời gian chờ giữa các lần mở (Tránh bị kích văng khỏi game do spam quá nhanh)
        task.wait(0.1) 
    end
    print("Đã dừng Auto Hatch.")
end)
