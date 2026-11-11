-- Deobfuscated by: MinhHaDev
-- Obfuscator: LuaObfuscator.com (Alpha 0.10.9)

local LICENSE_KEY = "AuraVn"
local EXPIRY_DATE = "2038-12-30"
local bypassActivated = false

-- [Proto 1]
local function getCurrentDateNum()
    local year = os.date("*t").year
    local month = os.date("*t").month
    local day = os.date("*t").day
    return (year * 10000) + (month * 100) + day
end

-- [Proto 2]
local function parseDateString(dateStr)
    local y, m, d = dateStr:match("^(%d%d%d%d)%-(%d%d)%-(%d%d)$")
    if not y then
        return nil
    end
    return (tonumber(y) * 10000) + (tonumber(m) * 100) + tonumber(d)
end

-- [Proto 3]
local function checkLicense()
    local expiryNum = parseDateString(EXPIRY_DATE)
    if not expiryNum then
        gg.alert("❌ License configuration error")
        os.exit()
    end

    if expiryNum < getCurrentDateNum() then
        gg.alert("⏳ Key Expired!\nExpiry: " .. EXPIRY_DATE)
        os.exit()
    end

    local input = gg.prompt(
        {"🔑 Enter License Key"},
        {""},
        {"text"}
    )

    if not input or input[1] ~= LICENSE_KEY then
        gg.alert("❌ Invalid Key")
        os.exit()
    end

    gg.toast("✅ Key Valid | Expiry: " .. EXPIRY_DATE)
end

-- [Proto 5]
local function activateBypass()
    gg.setVisible(false)
    gg.sleep(1000)
    gg.toast("⚡ Activating...")
    gg.sleep(200)

    local targetLib = "/data/app/~~S4GfLVgoqgVqYlsM-1CuDg==/com.waxmoon.ma.gp-9KDSfIUzw8toQqE9t4Km5A==/lib/arm64/libil2cpp.so"

    for i = 1, 44 do
        gg.getTargetInfo()
        gg.getRangesList(targetLib)
    end

    bypassActivated = true
    gg.toast("😈💀BYPASS ACTIVATED😈💀")
end

-- [Proto 6]
local function showScriptInfo()
    gg.alert(
        "╔═══ ⚔️😈𝗗𝗘𝗩𝗜𝗟 𝗕𝗬𝗣𝗔𝗦𝗦😈⚔️═══╗\n\n" ..
        "👑⚡ 𝗦𝗖𝗥𝗜𝗣𝗧 𝗜𝗡𝗙𝗢 ⚡👑\n" ..
        "🚀🔥 𝗩𝗘𝗥𝗦𝗜𝗢𝗡 : 𝗩𝟮.𝟬\n" ..
        "📱⚙️ 𝗕𝗜𝗧 : 𝗔𝗥𝗠𝟯𝟮\n" ..
        "💎👨‍💻 𝗗𝗘𝗩𝗘𝗟𝗢𝗣𝗘𝗥 : 𝗗𝗘𝗩𝗜𝗟 𝗧𝗘𝗔𝗠\n\n" ..
        "😈👹💀 𝗣𝗢𝗪𝗘𝗥𝗘𝗗 𝗕𝗬 𝗗𝗘𝗩𝗜𝗟 😈👹💀\n\n" ..
        "╚══════   ⚔️⚔️⚔️⚔️⚔️.  ══════╝\n"
    )
end

-- [Proto 7]
local function exitScript()
    gg.toast("👋 Exit Done")
    os.exit()
end

-- [Proto 4] Menu chính của Script
local function mainMenu()
    local bypassLabel
    if bypassActivated then
        bypassLabel = "✅ BYPASS ACTIVATED 💚"
    else
        bypassLabel = "1️⃣ 🔐 PAID BYPASS 🔒"
    end

    _G.A = gg.choice({
        "💀⚔️ 𝗦𝗔𝗡𝗝𝗘𝗘𝗧 𝗫 𝗕𝗬𝗣𝗔𝗦𝗦 ⚔️💀",
        "━━━━━━━━━━━━━━━━━━",
        bypassLabel,
        "2️⃣ 💀 𝗦𝗖𝗥𝗜𝗣𝗧 🔱",
        "3️⃣ 🚪 𝗘𝗫𝗜𝗧 𝗕𝗬𝗣𝗔𝗦𝗦 ⚔️",
        "━━━━━━━━━━━━━━━━━━"
    }, nil, nil)

    if _G.A == 3 then
        activateBypass()
    elseif _G.A == 4 then
        showScriptInfo()
    elseif _G.A == 5 then
        exitScript()
    end

    _G.PANDA = -1
end

checkLicense()

while true do
    if gg.isVisible(true) then
        _G.PANDA = 1
        gg.setVisible(false)
    end
    gg.clearResults()
    if _G.PANDA == 1 then
        mainMenu()
    end
end