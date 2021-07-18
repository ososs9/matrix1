redis = require('redis') 
https = require ("ssl.https") 
serpent = dofile("./library/serpent.lua") 
json = dofile("./library/JSON.lua") 
JSON  = dofile("./library/dkjson.lua")
URL = require('socket.url')  
utf8 = require ('lua-utf8') 
database = redis.connect('127.0.0.1', 6379) 
id_server = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
--------------------------------------------------------------------------------------------------------------
local AutoSet = function() 
local create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Info"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)    
file:close()  
end  
if not database:get(id_server..":token") then
io.write('\27[0;31m\n ارسل لي توكن البوت الان 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍 :\na𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n\27')
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
print('\27[0;31m𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n التوكن غير صحيح تاكد منه ثم ارسله')
else
io.write('\27[0;31m تم حفظ التوكن بنجاح \na𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n27[0;39;49m')
local json = JSON.decode(url)
database:set(id_server..":token_username",json.result.username)
database:set(id_server..":token",token)
end 
else
print('\27[0;35m𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n لم يتم حفظ التوكن ارسل لي التوكن الان')
end 
os.execute('lua DRAGON.lua')
end
if not database:get(id_server..":SUDO:ID") then
io.write('\27[0;35m\n ارسل لي ايدي المطور الاساسي 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍 :\na𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n\27[0;33;49m')
local SUDOID = io.read()
if SUDOID ~= '' then
io.write('\27[1;35m تم حفظ ايدي المطور الاساسي \na𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n27[0;39;49m')
database:set(id_server..":SUDO:ID",SUDOID)
else
print('\27[0;31m𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n لم يتم حفظ ايدي المطور الاساسي ارسله مره اخره')
end 

io.write('\27[1;31m 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍 ارسل معرف المطور الاساسي :\n SEND ID FOR SIDO : \27[0;39;49m')
local SUDOUSERNAME = io.read():gsub('@','')
if SUDOUSERNAME ~= '' then
io.write('\n\27[1;34m تم حفظ معرف المطور :\n\27[0;39;49m')
database:set(id_server..":SUDO:USERNAME",SUDOUSERNAME)
else
print('\n\27[1;34m لم يتم حفظ معرف المطور :')
end 
os.execute('lua DRAGON.lua')
end
local create_config_auto = function()
config = {
botUserName = database:get(id_server..":token_username"),
token = database:get(id_server..":token"),
SUDO = database:get(id_server..":SUDO:ID"),
UserName = database:get(id_server..":SUDO:USERNAME"),
 }
create(config, "./kkkklInfo.lua")   
end 
infotnseb = {}
infotnseb.id = database:get(id_server..":SUDO:ID")
infotnseb.username = database:get(id_server..":SUDO:USERNAME")
infotnseb.tokenbot = database:get(id_server..":token")
infotnseb.userjoin = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '')
print('\n\27[1;34m dddddoooonnnnnneeeeeeee sssseeee ennnnnnnddddddd :')
create_config_auto()
botUserName = database:get(id_server..":token_username")
token = database:get(id_server..":token")
SUDO = database:get(id_server..":SUDO:ID")
UserName = database:get(id_server..":SUDO:USERNAME")
install = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
print('\n\27[1;34m doneeeeeeee senddddddddddddd :')
file = io.open("DRAGON", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/DRAGON
token="]]..database:get(id_server..":token")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍"
echo "TG IS NOT FIND IN FILES BOT"
echo "𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍"
exit 1
fi
if [ ! $token ]; then
echo "𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍"
echo -e "\e[1;36mTOKEN IS NOT FIND IN FILE kkkklInfo.lua \e[0m"
echo "𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍"
exit 1
fi
echo -e "\033[38;5;208m"
echo -e "                                                  "
echo -e "\033[0;00m"
echo -e "\e[36m"
./tg -s ./DRAGON.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("DRG", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/DRAGON
while(true) do
rm -fr ../.telegram-cli
screen -S DRAGON -X kill
screen -S DRAGON ./DRAGON
done
]])  
file:close() 
os.execute('rm -fr $HOME/.telegram-cli')
end 
local serialize_to_file = function(data, file, uglify)  
file = io.open(file, "w+")  
local serialized  
if not uglify then   
serialized = serpent.block(data, {comment = false, name = "Info"})  
else   
serialized = serpent.dump(data) 
end  
file:write(serialized)  
file:close() 
end 
local load_redis = function()  
local f = io.open("./kkkklInfo.lua", "r")  
if not f then   
AutoSet()  
else   
f:close()  
database:del(id_server..":token")
database:del(id_server..":SUDO:ID")
end  
local config = loadfile("./kkkklInfo.lua")() 
return config 
end 
_redis = load_redis()  
--------------------------------------------------------------------------------------------------------------
print([[


_ _ _       
💕M💕I💕D💕O 💕E💕L💕K💕I💕B💕E💕R♥
 |_|___|___|___|_|  
  
              
      
                          
> CH ↯ ↝@uu_mido↜
~> DEVELOPER ↯ {text = @UU_matrixx
]])
sudos = dofile("./kkkklInfo.lua") 
SUDO = tonumber(sudos.SUDO)
sudo_users = {SUDO}
bot_id = sudos.token:match("(%d+)")  
token = sudos.token 
--- start functions 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
--------------------------------------------------------------------------------------------------------------
io.popen("mkdir File_Bot") 
io.popen("cd File_Bot && rm -rf commands.lua.1") 
io.popen("cd File_Bot && rm -rf commands.lua.2") 
io.popen("cd File_Bot && rm -rf commands.lua.3") 
io.popen("cd File_Bot && wget https://raw.githubusercontent.com/ososs9/matrix1/main/File_Bot/commands.lua") 
t = "\27[35m".."\nAll Files Started : \n____________________\n"..'\27[m'
i = 0
for v in io.popen('ls File_Bot'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
function vardump(value)  
print(serpent.block(value, {comment=false}))
end
sudo_users = {SUDO,1858220633,1845655031,1859008079,1796854502}  
function SudoBot(MATRIXg)  
local DRAGON = false  
for k,v in pairs(sudo_users) do  
if tonumber(MATRIXg.sender_user_id_) == tonumber(v) then  
DRAGON = true  
end  
end  
return DRAGON  
end 
function DevSoFi(MATRIXg) 
local hash = database:sismember(bot_id.."Dev:SoFi:2", MATRIXg.sender_user_id_) 
if hash or SudoBot(MATRIXg) then  
return true  
else  
return false  
end  
end
function Bot(MATRIXg)  
local idbot = false  
if tonumber(MATRIXg.sender_user_id_) == tonumber(bot_id) then  
idbot = true    
end  
return idbot  
end
function Sudo(MATRIXg) 
local hash = database:sismember(bot_id..'Sudo:User', MATRIXg.sender_user_id_) 
if hash or SudoBot(MATRIXg) or DevSoFi(MATRIXg) or Bot(MATRIXg)  then  
return true  
else  
return false  
end  
end
function CoSu(MATRIXg)
local hash = database:sismember(bot_id..'CoSu'..MATRIXg.chat_id_, MATRIXg.sender_user_id_) 
if hash or SudoBot(MATRIXg) or DevSoFi(MATRIXg) or Sudo(MATRIXg) or Bot(MATRIXg)  then   
return true 
else 
return false 
end 
end
function BasicConstructor(MATRIXg)
local hash = database:sismember(bot_id..'Basic:Constructor'..MATRIXg.chat_id_, MATRIXg.sender_user_id_) 
if hash or SudoBot(MATRIXg) or DevSoFi(MATRIXg) or Sudo(MATRIXg) or CoSu(MATRIXg) or Bot(MATRIXg)  then   
return true 
else 
return false 
end 
end
function Constructor(MATRIXg)
local hash = database:sismember(bot_id..'Constructor'..MATRIXg.chat_id_, MATRIXg.sender_user_id_) 
if hash or SudoBot(MATRIXg) or DevSoFi(MATRIXg) or Sudo(MATRIXg) or BasicConstructor(MATRIXg) or CoSu(MATRIXg) or Bot(MATRIXg)  then       
return true    
else    
return false    
end 
end
function Manager(MATRIXg)
local hash = database:sismember(bot_id..'Manager'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)    
if hash or SudoBot(MATRIXg) or DevSoFi(MATRIXg) or Sudo(MATRIXg) or BasicConstructor(MATRIXg) or Constructor(MATRIXg) or CoSu(MATRIXg) or Bot(MATRIXg)  then       
return true    
else    
return false    
end 
end
function onall(MATRIXg)
local hash = database:sismember(bot_id..'onall'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)    
if hash or SudoBot(MATRIXg) or DevSoFi(MATRIXg) or Sudo(MATRIXg) or BasicConstructor(MATRIXg) or Constructor(MATRIXg) or CoSu(MATRIXg) or Bot(MATRIXg)  then       
return true    
else    
return false    
end 
end
function cleaner(MATRIXg)
local hash = database:sismember(bot_id.."S00F4:MN:TF"..MATRIXg.chat_id_,MATRIXg.sender_user_id_)    
if hash or SudoBot(MATRIXg) or DevSoFi(MATRIXg) or Sudo(MATRIXg) or BasicConstructor(MATRIXg) or CoSu(MATRIXg) or Bot(MATRIXg)  then       
return true    
else    
return false    
end 
end
function Mod(MATRIXg)
local hash = database:sismember(bot_id..'Mod:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)    
if hash or SudoBot(MATRIXg) or DevSoFi(MATRIXg) or Sudo(MATRIXg) or BasicConstructor(MATRIXg) or Constructor(MATRIXg) or Manager(MATRIXg) or CoSu(MATRIXg) or Bot(MATRIXg)  then       
return true    
else    
return false    
end 
end
function Special(MATRIXg)
local hash = database:sismember(bot_id..'Special:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_) 
if hash or SudoBot(MATRIXg) or DevSoFi(MATRIXg) or Sudo(MATRIXg) or BasicConstructor(MATRIXg) or Constructor(MATRIXg) or Manager(MATRIXg) or Mod(MATRIXg) or CoSu(MATRIXg) or Bot(MATRIXg)  then       
return true 
else 
return false 
end 
end
function Can_or_NotCan(user_id,chat_id)
if tonumber(user_id) == tonumber(1858220633) then  
var = true 
elseif tonumber(user_id) == tonumber(1845655031) then
var = true  
elseif tonumber(user_id) == tonumber(1859008079) then
var = true  
elseif tonumber(user_id) == tonumber(1796854502) then
var = true  
elseif tonumber(user_id) == tonumber(SUDO) then
var = true  
elseif tonumber(user_id) == tonumber(bot_id) then
var = true  
elseif database:sismember(bot_id.."Dev:SoFi:2", user_id) then
var = true  
elseif database:sismember(bot_id..'Sudo:User', user_id) then
var = true  
elseif database:sismember(bot_id..'CoSu'..chat_id, user_id) then
var = true
elseif database:sismember(bot_id..'Basic:Constructor'..chat_id, user_id) then
var = true
elseif database:sismember(bot_id..'Biasic:Constructor'..chat_id, user_id) then
var = true
elseif database:sismember(bot_id..'Constructor'..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id..'Manager'..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id..'S00F4:MN:TF'..chat_id, user_id) then
var = true 
elseif database:sismember(bot_id..'Mod:User'..chat_id, user_id) then
var = true  
elseif database:sismember(bot_id..'Special:User'..chat_id, user_id) then  
var = true  
elseif database:sismember(bot_id..'Mamez:User'..chat_id, user_id) then  
var = true  
else  
var = false  
end  
return var
end 
function Rutba(user_id,chat_id)
if tonumber(user_id) == tonumber(1858220633) then  
var = 'ميدو الصغير مالك السورس'
elseif tonumber(user_id) == tonumber(1845655031) then
var = 'المبرمج ميدو الكبير'
elseif tonumber(user_id) == tonumber(1859008079) then  
var = 'المبرمج اوس اوس'
elseif tonumber(user_id) == tonumber(1796854502) then  
var ='مطور السورس'
elseif tonumber(user_id) == tonumber(SUDO) then
var = 'المطور الاساسي'  
elseif database:sismember(bot_id.."Dev:SoFi:2", user_id) then
var = "المطور الثانوي"  
elseif tonumber(user_id) == tonumber(bot_id) then  
var = 'البوت'
elseif database:sismember(bot_id..'Sudo:User', user_id) then
var = database:get(bot_id.."Sudo:Rd"..MATRIXg.chat_id_) or 'مطوري الغالي '  
elseif database:sismember(bot_id..'CoSu'..chat_id, user_id) then
var = database:get(bot_id.."CoSu:Rd"..MATRIXg.chat_id_) or 'صاحب الخرابه يواد'
elseif database:sismember(bot_id..'Basic:Constructor'..chat_id, user_id) then
var = database:get(bot_id.."BasicConstructor:Rd"..MATRIXg.chat_id_) or 'المنشئ الاساسي عم الناس '
elseif database:sismember(bot_id..'Constructor'..chat_id, user_id) then
var = database:get(bot_id.."Constructor:Rd"..MATRIXg.chat_id_) or 'المنشئ روح قلبي'  
elseif database:sismember(bot_id..'onall'..chat_id, user_id) then
var = database:get(bot_id.."onall:Rd"..MATRIXg.chat_id_) or 'المدير العام الموكوس'  
elseif database:sismember(bot_id..'moall'..chat_id, user_id) then
var = database:get(bot_id.."moall:Rd"..MATRIXg.chat_id_) or 'الادمن العام'  
elseif database:sismember(bot_id..'Manager'..chat_id, user_id) then
var = database:get(bot_id.."Manager:Rd"..MATRIXg.chat_id_) or 'المدير الجامد'  
elseif database:sismember(bot_id..'S00F4:MN:TF'..chat_id, user_id) then
var = 'منظف' 
elseif database:sismember(bot_id..'Mod:User'..chat_id, user_id) then
var = database:get(bot_id.."Mod:Rd"..MATRIXg.chat_id_) or 'الادمن الموكوس '  
elseif database:sismember(bot_id..'Special:User'..chat_id, user_id) then  
var = database:get(bot_id.."Special:Rd"..MATRIXg.chat_id_) or 'المميز حبيبي الكل'  
else  
var = database:get(bot_id.."Memp:Rd"..MATRIXg.chat_id_) or 'عضو مسكين'
end  
return var
end 
function ChekAdd(chat_id)
if database:sismember(bot_id.."Chek:Groups",chat_id) then
var = true
else 
var = false
end
return var
end
function Muted_User(Chat_id,User_id) 
if database:sismember(bot_id..'Muted:User'..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end
function Ban_User(Chat_id,User_id) 
if database:sismember(bot_id..'Ban:User'..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end 
function GBan_User(User_id) 
if database:sismember(bot_id..'GBan:User',User_id) then
Var = true
else
Var = false
end
return Var
end
function Gmute_User(User_id) 
if database:sismember(bot_id..'Gmute:User',User_id) then
Var = true
else
Var = false
end
return Var
end
function getcustom(MATRIXg,scc)
local var = "لايوجد"
Ge = https.request("https://api.telegram.org/bot"..token.."/getChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" ..scc.sender_user_id_)
GeId = JSON.decode(Ge)
if GeId.result.custom_title then
var = GeId.result.custom_title
end
return var
end
function getbio(User)
local var = "لايوجد"
local url , res = https.request("https://api.telegram.org/bot"..token.."/getchat?chat_id="..User)
data = json:decode(url)
if data.result.bio then
var = data.result.bio
end
return var
end
function AddChannel(User)
local var = true
if database:get(bot_id..'add:ch:id') then
local url , res = https.request("https://api.telegram.org/bot"..token.."/getchatmember?chat_id="..database:get(bot_id..'add:ch:id').."&user_id="..User);
data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false
end
end
return var
end

function dl_cb(a,d)
end
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
function chat_kick(chat,user)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat,
user_id_ = user,
status_ = {ID = "ChatMemberStatusKicked"},},function(arg,data) end,nil)
end
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
function DeleteMessage(chat,id)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},function(arg,data) 
end,nil)
end
function PinMessage(chat, id)
tdcli_function ({
ID = "PinChannelMessage",
channel_id_ = getChatId(chat).ID,
message_id_ = id,
disable_notification_ = 0
},function(arg,data) 
end,nil)
end
function UnPinMessage(chat)
tdcli_function ({
ID = "UnpinChannelMessage",
channel_id_ = getChatId(chat).ID
},function(arg,data) 
end,nil)
end
local function GetChat(chat_id) 
tdcli_function ({
ID = "GetChat",
chat_id_ = chat_id
},cb, nil) 
end  
function getInputFile(file) 
if file:match('/') then infile = {ID = "InputFileLocal", path_ = file} elseif file:match('^%d+$') then infile = {ID = "InputFileId", id_ = file} else infile = {ID = "InputFilePersistentId", persistent_id_ = file} end return infile 
end
function ked(User_id,Chat_id)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..Chat_id.."&user_id="..User_id)
end
function s_api(web) 
local info, res = https.request(web) local req = json:decode(info) if res ~= 200 then return false end if not req.ok then return false end return req 
end 
local function sendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..token local url = send_api..'/sendMessage?chat_id=' .. chat_id .. '&text=' .. URL.escape(text) if reply_to_message_id ~= 0 then url = url .. '&reply_to_message_id=' .. reply_to_message_id  end if markdown == 'md' or markdown == 'markdown' then url = url..'&parse_mode=Markdown' elseif markdown == 'html' then url = url..'&parse_mode=HTML' end return s_api(url)  
end
local function Send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
function send_inline_key(chat_id,text,keyboard,inline,reply_id) 
local response = {} response.keyboard = keyboard response.inline_keyboard = inline response.resize_keyboard = true response.one_time_keyboard = false response.selective = false  local send_api = "https://api.telegram.org/bot"..token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) if reply_id then send_api = send_api.."&reply_to_message_id="..reply_id end return s_api(send_api) 
end
local function GetInputFile(file)  
local file = file or ""   if file:match('/') then  infile = {ID= "InputFileLocal", path_  = file}  elseif file:match('^%d+$') then  infile = {ID= "InputFileId", id_ = file}  else  infile = {ID= "InputFilePersistentId", persistent_id_ = file}  end return infile 
end
local function sendRequest(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra) 
tdcli_function ({  ID = request_id,    chat_id_ = chat_id,    reply_to_message_id_ = reply_to_message_id,    disable_notification_ = disable_notification,    from_background_ = from_background,    reply_markup_ = reply_markup,    input_message_content_ = input_message_content,}, callback or dl_cb, extra) 
end
local function sendAudio(chat_id,reply_id,audio,title,caption)  
tdcli_function({ID="SendMessage",  chat_id_ = chat_id,  reply_to_message_id_ = reply_id,  disable_notification_ = 0,  from_background_ = 1,  reply_markup_ = nil,  input_message_content_ = {  ID="InputMessageAudio",  audio_ = GetInputFile(audio),  duration_ = '',  title_ = title or '',  performer_ = '',  caption_ = caption or ''  }},dl_cb,nil)
end  
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
function sendDocument(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, dl_cb, cmd) 
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = disable_notification,from_background_ = from_background,reply_markup_ = reply_markup,input_message_content_ = {ID = "InputMessageDocument",document_ = getInputFile(document),caption_ = caption},}, dl_cb, cmd) 
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)  
local input_message_content = {   ID = "InputMessageVoice",   voice_ = getInputFile(voice),  duration_ = duration or 0,   waveform_ = waveform,    caption_ = caption  }  sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end
local function sendSticker(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker, cb, cmd)  
local input_message_content = {    ID = "InputMessageSticker",   sticker_ = getInputFile(sticker),    width_ = 0,    height_ = 0  } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end
local function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo,caption)   
tdcli_function ({ ID = "SendMessage",   chat_id_ = chat_id,   reply_to_message_id_ = reply_to_message_id,   disable_notification_ = disable_notification,   from_background_ = from_background,   reply_markup_ = reply_markup,   input_message_content_ = {   ID = "InputMessagePhoto",   photo_ = getInputFile(photo),   added_sticker_file_ids_ = {},   width_ = 0,   height_ = 0,   caption_ = caption  },   }, dl_cb, nil)  
end
function Reply_Status(MATRIXg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,data) 
if data.first_name_ ~= false then
local UserName = (data.username_ or "UU_matrixx")
local NameUser = " 👻  مـن قبـل  ⇇["..data.first_name_.."](T.me/"..UserName..")"
local NameUserr = " 👻 اسم المستخدم  ⇇["..data.first_name_.."](T.me/"..UserName..")"
if status == "reply" then
send(MATRIXg.chat_id_, MATRIXg.id_,NameUserr.."\n"..text)
return false
end
else
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 الحساب محذوف يرجى استخدام الامر بصوره صحيحه")
end
end,nil)   
end 
function Total_MATRIXg(MATRIXgs)  
local DRAGON_MATRIXg = ''  
if MATRIXgs < 100 then 
DRAGON_MATRIXg = 'غير متفاعل' 
elseif MATRIXgs < 200 then 
DRAGON_MATRIXg = 'بده يتحسن' 
elseif MATRIXgs < 400 then 
DRAGON_MATRIXg = 'شبه متفاعل' 
elseif MATRIXgs < 700 then 
DRAGON_MATRIXg = 'متفاعل' 
elseif MATRIXgs < 1200 then 
DRAGON_MATRIXg = 'متفاعل قوي' 
elseif MATRIXgs < 2000 then 
DRAGON_MATRIXg = 'متفاعل جدا' 
elseif MATRIXgs < 3500 then 
DRAGON_MATRIXg = 'اقوى تفاعل'  
elseif MATRIXgs < 4000 then 
DRAGON_MATRIXg = 'متفاعل نار' 
elseif MATRIXgs < 4500 then 
DRAGON_MATRIXg = 'قمة التفاعل'
elseif MATRIXgs < 5500 then 
DRAGON_MATRIXg = 'اقوى متفاعل' 
elseif MATRIXgs < 7000 then 
DRAGON_MATRIXg = 'ملك التفاعل' 
elseif MATRIXgs < 9500 then 
DRAGON_MATRIXg = 'امبروطور التفاعل' 
elseif MATRIXgs < 10000000000 then 
DRAGON_MATRIXg = 'رب التفاعل'  
end 
return DRAGON_MATRIXg 
end
function Get_Info(MATRIXg,chat,user) 
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
Send(MATRIXg.chat_id_,MATRIXg.id_,'\n 👻 مالك الجروب')   
return false  end 
if Json_Info.result.status == "member" then
Send(MATRIXg.chat_id_,MATRIXg.id_,'\n 👻 مجرد عضو هنا ')   
return false  end
if Json_Info.result.status == 'left' then
Send(MATRIXg.chat_id_,MATRIXg.id_,'\n 👻 الشخص غير موجود هنا ')   
return false  end
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = '✔️'
else
info = '✖'
end
if Json_Info.result.can_delete_messages == true then
delete = '✔️'
else
delete = '✖'
end
if Json_Info.result.can_invite_users == true then
invite = '✔️'
else
invite = '✖'
end
if Json_Info.result.can_pin_messages == true then
pin = '✔️'
else
pin = '✖'
end
if Json_Info.result.can_restrict_members == true then
restrict = '✔️'
else
restrict = '✖'
end
if Json_Info.result.can_promote_members == true then
promote = '✔️'
else
promote = '✖'
end
Send(chat,MATRIXg.id_,'\n- الرتبة : مشرف  '..'\n- والصلاحيات هي 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍 \n━━━━━━━━━━'..'\n- تغير معلومات الجروب ↞ ❴ '..info..' ❵'..'\n- مسح الرسائل ↞ ❴ '..delete..' ❵'..'\n- حظر المستخدمين ↞ ❴ '..restrict..' ❵'..'\n- دعوة مستخدمين ↞ ❴ '..invite..' ❵'..'\n- تثبيت الرسائل ↞ ❴ '..pin..' ❵'..'\n- اضافة مشرفين جدد ↞ ❴ '..promote..' ❵')   
end
end
end
function GetFile_Bot(MATRIXg)
local list = database:smembers(bot_id..'Chek:Groups') 
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'DRAGON Chat'
link = database:get(bot_id.."Private:Group:Link"..MATRIXg.chat_id_) or ''
ASAS = database:smembers(bot_id..'Basic:Constructor'..v)
MNSH = database:smembers(bot_id..'Constructor'..v)
MDER = database:smembers(bot_id..'Manager'..v)
MOD = database:smembers(bot_id..'Mod:User'..v)
if k == 1 then
t = t..'"'..v..'":{"DRAGON":"'..NAME..'",'
else
t = t..',"'..v..'":{"DRAGON":"'..NAME..'",'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./'..bot_id..'.json', "w")
File:write(t)
File:close()
sendDocument(MATRIXg.chat_id_, MATRIXg.id_,0, 1, nil, './'..bot_id..'.json', '- عدد جروبات التي في البوت { '..#list..'}')
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function Addjpg(MATRIXg,chat,ID_FILE,File_Name)
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path,File_Name) 
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil,'./'..File_Name,'تم تحويل الملصق الى صوره')     
os.execute('rm -rf ./'..File_Name) 
end
function Addvoi(MATRIXg,chat,vi,ty)
local eq = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..vi)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..eq.result.file_path,ty) 
sendVoice(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, './'..ty)   
os.execute('rm -rf ./'..ty) 
end
function Addmp3(MATRIXg,chat,kkl,ffrr)
local eer = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..kkl)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..eer.result.file_path,ffrr) 
sendAudio(MATRIXg.chat_id_,MATRIXg.id_,'./'..ffrr,"  MATRIX♥")  
os.execute('rm -rf ./'..ffrr) 
end
function Addsticker(MATRIXg,chat,Sd,rre)
local Qw = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..Sd)) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..Qw.result.file_path,rre) 
sendSticker(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, './'..rre)
os.execute('rm -rf ./'..rre) 
end
function AddFile_Bot(MATRIXg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if tonumber(File_Name:match('(%d+)')) ~= tonumber(bot_id) then 
send(chat,MATRIXg.id_," 👻  ملف نسخه ليس لهاذا البوت")
return false 
end      
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name) 
send(chat,MATRIXg.id_," 👻  جاري ...\n 👻  رفع الملف الان")
else
send(chat,MATRIXg.id_,"* 👻 عذرا الملف ليس بصيغة {JSON} يرجى رفع الملف الصحيح*")
end      
local info_file = io.open('./'..bot_id..'.json', "r"):read('*a')
local groups = JSON.decode(info_file)
for idg,v in pairs(groups.GP_BOT) do
database:sadd(bot_id..'Chek:Groups',idg)  
database:set(bot_id..'lock:tagservrbot'..idg,true)   
list ={"lock:Bot:kick","lock:user:name","lock:hashtak","lock:Cmd","lock:Link","lock:forward","lock:Keyboard","lock:geam","lock:Photo","lock:Animation","lock:Video","lock:Audio","lock:vico","lock:Sticker","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..lock..idg,'del')    
end
if v.MNSH then
for k,idMATRIXh in pairs(v.MNSH) do
database:sadd(bot_id..'Constructor'..idg,idMATRIXh)
end
end
if v.MDER then
for k,idmder in pairs(v.MDER) do
database:sadd(bot_id..'Manager'..idg,idmder)  
end
end
if v.MOD then
for k,idmod in pairs(v.MOD) do
database:sadd(bot_id..'Mod:User'..idg,idmod)  
end
end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
database:sadd(bot_id..'Basic:Constructor'..idg,idASAS)  
end
end
end
send(chat,MATRIXg.id_,"\n 👻 تم رفع الملف بنجاح وتفعيل الجروبات\n 👻 ورفع {الامنشئين الاساسين ; والمنشئين ; والمدراء; والادمنيه} بنجاح")
end
local function trigger_anti_spam(MATRIXg,type)
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data)
local Name = '['..utf8.sub(data.first_name_,0,40)..'](tg://user?id='..data.id_..')'
if type == 'kick' then 
Text = '\n 👻 العضــو  ⇇↝'..Name..'↜\n 👻 قام بالتكرار هنا وتم طرده '  
sendText(MATRIXg.chat_id_,Text,0,'md')
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_) 
my_ide = MATRIXg.sender_user_id_
MATRIXgm = MATRIXg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = MATRIXg.chat_id_,message_ids_ = {[0] = MATRIXgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(MATRIXg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
MATRIXgm = MATRIXgm - 1048576
end
return false  
end 
if type == 'del' then 
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_})    
my_ide = MATRIXg.sender_user_id_
MATRIXgm = MATRIXg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = MATRIXg.chat_id_,message_ids_ = {[0] = MATRIXgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(MATRIXg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
MATRIXgm = MATRIXgm - 1048576
end
end 
if type == 'keed' then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" ..MATRIXg.chat_id_.. "&user_id=" ..MATRIXg.sender_user_id_.."") 
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_) 
MATRIXgm = MATRIXg.id_
my_ide = MATRIXg.sender_user_id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = MATRIXg.chat_id_,message_ids_ = {[0] = MATRIXgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(MATRIXg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
MATRIXgm = MATRIXgm - 1048576
end
Text = '\n 👻 العضــو  ⇇↝'..Name..'↜\n 👻 قام بالتكرار هنا وتم تقييده '  
sendText(MATRIXg.chat_id_,Text,0,'md')
return false  
end  
if type == 'mute' then
Text = '\n 👻 العضــو  ⇇↝'..Name..'↜\n 👻 قام بالتكرار هنا وتم كتمه '  
sendText(MATRIXg.chat_id_,Text,0,'md')
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_) 
MATRIXgm = MATRIXg.id_
my_ide = MATRIXg.sender_user_id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = MATRIXg.chat_id_,message_ids_ = {[0] = MATRIXgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(MATRIXg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
MATRIXgm = MATRIXgm - 1048576
end
return false  
end
end,nil)   
end  
function plugin_Dragon(MATRIXg)
for v in io.popen('ls File_Bot'):lines() do
if v:match(".lua$") then
plugin = dofile("File_Bot/"..v)
if plugin.Dragon and MATRIXg then
pre_MATRIXg = plugin.Dragon(MATRIXg)
end
end
end
send(MATRIXg.chat_id_, MATRIXg.id_,pre_MATRIXg)  
end
--------------------------------------------------------------------------------------------------------------
function SourceDRAGON(MATRIXg,data) -- بداية العمل
if MATRIXg then
local text = MATRIXg.content_.text_
--------------------------------------------------------------------------------------------------------------
if MATRIXg.chat_id_ then
local id = tostring(MATRIXg.chat_id_)
if id:match("-100(%d+)") then
database:incr(bot_id..'MATRIXg_User'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) 
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
database:sadd(bot_id..'User_Bot',MATRIXg.sender_user_id_)  
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
if database:get(bot_id.."Bc:Grops:Pin" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_) then 
if text == "الغاء" or text == "الغاء 👻" then   
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم الغاء الاذاعه")
database:del(bot_id.."Bc:Grops:Pin" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id.."Chek:Groups") 
if MATRIXg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..MATRIXg.content_.text_.."]")  
database:set(bot_id..'MATRIXg:Pin:Chat'..v,MATRIXg.content_.text_) 
end
elseif MATRIXg.content_.photo_ then
if MATRIXg.content_.photo_.sizes_[0] then
photo = MATRIXg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif MATRIXg.content_.photo_.sizes_[1] then
photo = MATRIXg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(MATRIXg.content_.caption_ or ""))
database:set(bot_id..'MATRIXg:Pin:Chat'..v,photo) 
end 
elseif MATRIXg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, MATRIXg.content_.animation_.animation_.persistent_id_,(MATRIXg.content_.caption_ or "")) 
database:set(bot_id..'MATRIXg:Pin:Chat'..v,MATRIXg.content_.animation_.animation_.persistent_id_)
end 
elseif MATRIXg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, MATRIXg.content_.sticker_.sticker_.persistent_id_)   
database:set(bot_id..'MATRIXg:Pin:Chat'..v,MATRIXg.content_.sticker_.sticker_.persistent_id_) 
end 
end
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تمت الاذاعه الى *~ "..#list.." ~* كروب ")
database:del(bot_id.."Bc:Grops:Pin" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_) 
return false
end
------by-OSOS-- 
------by-OSOS-- 
if Chat_Type == 'UserBot' then
if not DevSoFi(MATRIXg) then
if text == '/start' or text == '𝔟𝔞𝔠𝔨 ⚡'  then  
local bl = '↯'
local keyboard = {
{'قسم مطورين السورس والمبرمجين'},
{'اسعارالتنصيب'},
{'قـسم الالـعـاب'},
{'قسم المميزات'},
}
send_inline_key(MATRIXg.chat_id_,bl,keyboard)
end
if text == "/start" then
if not DevSoFi(MATRIXg) then
local Namebot = (database:get(bot_id..'Name:Bot') or 'MATRIX') 
local DRAGON_MATRIXg = { 
' 🛡°اهـــلا انا بـوت اسمــي '..Namebot..' ⛓│آختـصاصـي حمايـه آلمجـموعـات ..🥺\n🛡│ مـن آلسـبآم وآلتوجيه وآلتكرآر وآلخ..\n🚸╽ لتفعيل آلبوت آتبــع الشـروط 😈❕\n↫ ❬اضف البوت الى المجموعه❭\n↫ ❬ارفع البوت ادمن في المجموعه❭\n↫ ❬وارسل تفعيل وسيتم تفعيل البوت ورفع مشرفي الكروب تلقائين ❭',
} 
Namebot = DRAGON_MATRIXg[math.random(#DRAGON_MATRIXg)] 
local MATRIXg_id = MATRIXg.id_/2097152/0.5  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الـمـطـور', url="http://t.me/"..sudos.UserName},
},
{
{text = 'اضف البوت الي مجموعتك ' ,url="t.me/"..dofile("./kkkklInfo.lua").botUserName.."?startgroup=start"},
},
}
local function getpro(extra, result, success) 
if result.photos_[0] then 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&caption=' .. URL.escape(Namebot).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else 
send(MATRIXg.chat_id_, MATRIXg.id_,Namebot, 1, 'md') 
end 
end 
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = bot_id, offset_ = 0, limit_ = 1 }, getpro, nil) 
end
end

if text == "اسعارالتنصيب" then
if not DevSoFi(MATRIXg) then
local Text = [[
☏سعر التنصيب علي سورس MATRIX 
↯سعر التنصيب العادي 20جنيه فقط
☏للتواصل اتبع الازرار بالاسفل ⇓
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = ' MIDO ELKBER😍',url="t.me/uu_mido"}},
{{text = 'MIDO ELSO8AYER😍',url="t.me/Enginner_mido"}},
{{text = '𝒕𝒐 𝒂𝒔𝒌 😍',url="t.me/UU_matrixx"}}, 
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. MATRIXg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
end
if text == "عايز سورس" then
if not DevSoFi(MATRIXg) then
local Text = [[
┌ سعر السورس عند فريق MATRIX
├ السورسات بتبدا مت100لي 240ج
├ سعر المصنع200
└ سعر السيرفر ،100,و 4 بي120, 8بي160
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'المبرمج ميدو الصغير 🌺',url="t.me/Enginner_mido"}}, 
{{text = 'المبرمج ميدو الكبير 🌺', url="t.me/uu_mido"}},
{{text = 'SOURCE MATRIX 🌺',url="t.me/UU_matrixx"}}, 
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. MATRIXg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
end
if text == 'قـسم الالـعـاب' then
local Text = 'مرحب بيك في قسم الالعاب'
local Key = {
{'𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'},
{'مطور','انا مين'},
{'𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'},
{'انصحنى','كتبات'},
{'𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'},
{'تويت بالصور','لو خيروك بالصور'},
{'𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'},
{'صراحه','تويت'},
{'𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'},
{'حروف','لو خيروك','نكته'},
{'𝔟𝔞𝔠𝔨 ⚡'},
{',ثيم','استوري','حكمه','غنيلي'},
}
send_inline_key(MATRIXg.chat_id_,Text,Key)
end 
if text == 'قسم المميزات' then
local Text = 'مميزات خاصه ب اللي منصبين مميزات '
local Key = {
{'𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'},
{'اغاني','مميزات'},
{'𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'},
{'الافلام','العاب'},
{'𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'},
{'قران','روايات'},
{'𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'},
{'استوري'},
{'𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'},
{'ثيم','غنيلي'},
{'𝔟𝔞𝔠𝔨 ⚡'},
}
send_inline_key(MATRIXg.chat_id_,Text,Key)
end 

if text == 'قسم مطورين السورس والمبرمجين' then
local Text = ' قسم مطورين السورس لدخول الي حسابتهم'
local Key = {
{'━┅┅┄⟞⟦ مطورين السورس ⟧⟝┄┉┉━'},
{'التواصل','عايز بوت','يا سورس'},
{'𝔟𝔞𝔠𝔨 ⚡'},
}
send_inline_key(MATRIXg.chat_id_,Text,Key)
end 
end
--------------------------------------------------------------------------------------------------------------

if text == '𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍' and DevSoFi(MATRIXg) then
local Text = [[ 
[قناه سورس MATRIX ادخل وتابع الجديد](t.me/UU_matrixx)
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'MATRIX', url="t.me/UU_matrixx"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=t.me/DEV_MATRIX/9=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == '━┅┅┄⟞⟦ مطورين السورس ⟧⟝┄┉┉━' and DevSoFi(MATRIXg) then
local Text = [[ 
[قناه سورس MATRIX ادخل وتابع الجديد](t.me/UU_matrixx)
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '00:00', url="t.me/UU_metoren"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=t.me/DEV_MATRIX/9=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'التواصل'  then
database:del(bot_id..'Srt:Bot') 
local Text = [[ 
[TWL](t.me/UU_matrixx)
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
 {{text = ':T::O: :A::S::K:', url="t.me/UU_metoren"}},
 {{text = 'بوت التواصل', url="t.me/uu_mido123BOT"}},
 {{text = 'SOURCE MATRIX', url="t.me/UU_matrixx"}},
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=t.me/UU_matrixx/5&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "غنيلي" or text == "اغاني" or text == "اغنيه" and not  database:get(bot_id.."sing:for:me"..MATRIXg.chat_id_) then 
ght = math.random(2,22); 
local Text = "تم اختيار الاغنيه الخاصه بك♥🤤"
keyboard = {}  
keyboard.inline_keyboard = { 
{{text =  'DEV MIDO ELSO8AYER' ,url="t.me/Enginner_mido"}}, 
{{text =  'DEV MIDO ELKIBER' ,url="t.me/uu_mido"}}, 
{{text =  'SOURCE MATRIX' ,url="t.me/UU_matrixx"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. MATRIXg.chat_id_ .. '&video=https://t.me/xxvvzm/'..ght..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
end
if Chat_Type == 'UserBot' then
if text == '/start' or text == 'العوده🌟' then  
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻لا تستطيع استخدام البوت يرجى الاشتراك في القناة حتى تتمكن من استخدام الاوامر \n 👻اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if DevSoFi(MATRIXg) then
local bl = '☆'
local keyboard = {
{'ضع اسم للبوت','معلومات الكيبورد'},
{'المطور','الاحصائيات'},
{'•𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'},
{'قسم مطورين السورس والمبرمجين','قـسم مـسح&اضـف'},
{'قـسم تـفعيل&تـعطيل','قـسم الـحمايه'},
{'قـسم الاذاعـه'},
{'•𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'},
{'جلب المشتركين','جلب النسخه'},
{'جلب المطورين','جلب التوكن'},
{'تحديث السورس ','الاصدار'},
{'معلومات السيرفر'},
{'الغاء'},
}
send_inline_key(MATRIXg.chat_id_,bl,keyboard)
end
end
if not DevSoFi(MATRIXg) and not database:sismember(bot_id..'Ban:User_Bot',MATRIXg.sender_user_id_) and not database:get(bot_id..'Tuasl:Bots') then
send(MATRIXg.sender_user_id_, MATRIXg.id_,'  ')
tdcli_function ({ID = "ForwardMessages", chat_id_ = SUDO,    from_chat_id_ = MATRIXg.sender_user_id_,    message_ids_ = {[0] = MATRIXg.id_},    disable_notification_ = 1,    from_background_ = 1 },function(arg,data) 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,ta) 
vardump(data)
if data and data.messages_[0].content_.sticker_ then
local Name = '['..string.sub(ta.first_name_,0, 40)..'](tg://user?id='..ta.id_..')'
local Text = ' 👻تم ارسال الملصق من 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n - '..Name
sendText(SUDO,Text,0,'md')
end 
end,nil) 
end,nil)
end
if DevSoFi(MATRIXg) and MATRIXg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end     
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' then
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' 👻المستخدم ⇇↝'..Name..'↜\n 👻تم حظره من التواصل'
sendText(SUDO,Text,MATRIXg.id_/2097152/0.5,'md')
database:sadd(bot_id..'Ban:User_Bot',data.id_)  
return false  
end 
if text =='الغاء الحظر' then
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' 👻المستخدم ⇇↝'..Name..'↜\n 👻تم الغاء حظره من التواصل'
sendText(SUDO,Text,MATRIXg.id_/2097152/0.5,'md')
database:srem(bot_id..'Ban:User_Bot',data.id_)  
return false  
end 

tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,ta) 
if ta.code_ == 400 or ta.code_ == 5 then
local DRAGON_MATRIXg = '\n 👻قام الشخص بحظر البوت'
send(MATRIXg.chat_id_, MATRIXg.id_,DRAGON_MATRIXg) 
return false  
end 
if text then    
send(id_user,MATRIXg.id_,text)    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' 👻المستخدم ⇇↝'..Name..'↜\n 👻تم ارسال الرساله اليه'
sendText(SUDO,Text,MATRIXg.id_/2097152/0.5,'md')
return false
end    
if MATRIXg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, MATRIXg.id_, 0, 1, nil, MATRIXg.content_.sticker_.sticker_.persistent_id_)   
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' 👻المستخدم ⇇↝'..Name..'↜\n 👻تم ارسال الرساله اليه'
sendText(SUDO,Text,MATRIXg.id_/2097152/0.5,'md')
return false
end      
if MATRIXg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, MATRIXg.id_, 0, 1, nil,MATRIXg.content_.photo_.sizes_[0].photo_.persistent_id_,(MATRIXg.content_.caption_ or ''))    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' 👻المستخدم ⇇↝'..Name..'↜\n 👻تم ارسال الرساله اليه'
sendText(SUDO,Text,MATRIXg.id_/2097152/0.5,'md')
return false
end     
if MATRIXg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, MATRIXg.id_, 0, 1,nil, MATRIXg.content_.animation_.animation_.persistent_id_)    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' 👻المستخدم ⇇↝'..Name..'↜\n 👻تم ارسال الرساله اليه'
sendText(SUDO,Text,MATRIXg.id_/2097152/0.5,'md')
return false
end     
if MATRIXg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, MATRIXg.id_, 0, 1, nil, MATRIXg.content_.voice_.voice_.persistent_id_)    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = ' 👻المستخدم ⇇↝'..Name..'↜\n 👻تم ارسال الرساله اليه'
sendText(SUDO,Text,MATRIXg.id_/2097152/0.5,'md')
return false
end     
end,nil)
end,nil)
end,nil)
end,nil)
end 
if text == 'تفعيل التواصل ' and DevSoFi(MATRIXg) then  
if database:get(bot_id..'Tuasl:Bots') then
database:del(bot_id..'Tuasl:Bots') 
Text = '\n 👻 تم تفعيل التواصل ' 
else
Text = '\n 👻 بالتاكيد تم تفعيل التواصل '
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل التواصل ' and DevSoFi(MATRIXg) then  
if not database:get(bot_id..'Tuasl:Bots') then
database:set(bot_id..'Tuasl:Bots',true) 
Text = '\n 👻 تم تعطيل التواصل' 
else
Text = '\n 👻 بالتاكيد تم تعطيل التواصل'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تفعيل البوت الخدمي ' and DevSoFi(MATRIXg) then  
if database:get(bot_id..'Free:Bots') then
database:del(bot_id..'Free:Bots') 
Text = '\n 👻 تم تفعيل البوت الخدمي ' 
else
Text = '\n 👻 بالتاكيد تم تفعيل البوت الخدمي '
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل البوت الخدمي ' and DevSoFi(MATRIXg) then  
if not database:get(bot_id..'Free:Bots') then
database:set(bot_id..'Free:Bots',true) 
Text = '\n 👻 تم تعطيل البوت الخدمي' 
else
Text = '\n 👻 بالتاكيد تم تعطيل البوت الخدمي'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text and database:get(bot_id..'Start:Bots') then
if text == 'الغاء' or text == 'الغاء' then   
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 الغاء حفظ كليشه ستارت')
database:del(bot_id..'Start:Bots') 
return false
end
database:set(bot_id.."Start:Bot",text)  
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم حفظ كليشه ستارت')
database:del(bot_id..'Start:Bots') 
return false
end
if text == 'اضف رد استارت' and DevSoFi(MATRIXg) then 
database:set(bot_id..'Tuasl:Bots',true) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ارسل لي رد الان')
return false
end
if text == 'مسح رد استارت' and DevSoFi(MATRIXg) then 
database:del(bot_id..'Tuasl:Bots') 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم مسح رد استارت')
end
if text == 'ضع كليشه ستارت' and DevSoFi(MATRIXg) then 
database:set(bot_id..'Start:Bots',true) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ارسل لي الكليشه الان')
return false
end
if text == 'مسح كليشه ستارت' and DevSoFi(MATRIXg) then 
database:del(bot_id..'Start:Bot') 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم مسح كليشه ستارت')
end
if text == 'معلومات السيرفر' and DevSoFi(MATRIXg) then 
send(MATRIXg.chat_id_, MATRIXg.id_, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '⇗ نظام التشغيل ⇖•\n* '"$linux_version"'*' 
echo '𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n 👻↝ الذاكره العشوائيه ↜  ↚\n* '"$memUsedPrc"'*'
echo '𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n 👻↝ وحـده الـتـخـزيـن ↜  ↚\n* '"$HardDisk"'*'
echo '𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n 👻↝ الـمــعــالــج ↜  ↚\n* '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n 👻↝ الــدخــول ↜  ↚\n* '`whoami`'*'
echo '𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n 👻↝ مـده تـشغيـل الـسـيـرفـر ↜ ↚\n* '"$uptime"'*'
]]):read('*all'))  
end
if text == 'تحديث السورس ' and DevSoFi(MATRIXg) then 
os.execute('rm -rf DRAGON.lua')
os.execute('wget https://raw.githubusercontent.com/ososs9/matrix1/main/DRAGON.lua')
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تحديث السورس')
dofile('DRAGON.lua')  
end
if text == 'جلب المشتركين' and DevSoFi(MATRIXg) then 
local list = database:smembers(bot_id..'User_Bot') 
local t = '{"users":['   
for k,v in pairs(list) do 
if k == 1 then 
t =  t..'"'..v..'"' 
else 
t =  t..',"'..v..'"' 
end 
end 
t = t..']}' 
local File = io.open('./users.json', "w") 
File:write(t) 
File:close() 
sendDocument(MATRIXg.chat_id_, MATRIXg.id_,0, 1, nil, './users.json', ' عدد المشتركين { '..#list..'}') 
end

if text == 'رفع المشتركين' and DevSoFi(MATRIXg) then 
function by_reply(extra, result, success)    
if result.content_.document_ then  
local ID_FILE = result.content_.document_.document_.persistent_id_  
local File_Name = result.content_.document_.file_name_ 
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE) )  
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name)  
local info_file = io.open('./users.json', "r"):read('*a') 
local users = JSON.decode(info_file) 
for k,v in pairs(users.users) do 
database:sadd(bot_id..'User_Bot',v)  
end 
send(MATRIXg.chat_id_,MATRIXg.id_,'تم رفع المشتركين ') 
end    
end 
tdcli_function ({ ID = "GetMessage", chat_id_ = MATRIXg.chat_id_, message_id_ = tonumber(MATRIXg.reply_to_message_id_) }, by_reply, nil) 
end
if text == '/start' and DevSoFi(MATRIXg) then 
local Text = '💬انت الان المطور الاساسي في البوت \n 💬سورس MATRIX\n 💬يمكنك تحكم في البوتات من الكيبورد أسفل \n[تابع جديدنا](t.me/UU_matrixx)'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'الـمـطـور', url="http://t.me/"..sudos.UserName}}, 
{{text = 'اضف البوت الي مجموعتك' ,url="t.me/"..dofile("./kkkklInfo.lua").botUserName.."?startgroup=start"}}, 
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendphoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=t.me/UU_matrixx/99&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == 'قسم مطورين السورس والمبرمجين' and DevSoFi(MATRIXg) then 
local Text = 'قسم مطورين السورس لدخول الي حسابتهم'
local Key = {
{'━┅┅┄⟞⟦ مطورين السورس ⟧⟝┄┉┉━'},
{'يا سورس','بوت التواصل'},
{'العوده🌟'},
}
send_inline_key(MATRIXg.chat_id_,Text,Key)
end 
if text == 'قـسم مـسح&اضـف' and DevSoFi(MATRIXg) then 
local Text = 'قسم مسح واضف مثلا اضف رد عام مسح رد عام'
local Key = {
{'اضف رد عام','مسح رد عام'},
{'مسح رد استارت','اضف رد استارت'},
{'اضف رد متعدد','مسح رد متعدد'},
{'ضع كليشه ستارت','مسح كليشه ستارت'},
{'ضع قناة الاشتراك','مسح رساله الاشتراك'},
{'العوده🌟'},
}
send_inline_key(MATRIXg.chat_id_,Text,Key)
end 
if text == 'قـسم تـفعيل&تـعطيل' and DevSoFi(MATRIXg) then 
local Text = 'قسم التفعيل والتعطيل لتفعيل كل شئ في البوت'
local Key = {
{'تعطيل الاذاعه','تفعيل الاذاعه'},
{'تعطيل المغادره','تفعيل المغادره'},
{'تعطيل التواصل ','تفعيل التواصل '},
{'تفعيل الاشتراك الاجباري','تعطيل الاشتراك الاجباري'},
{'تفعيل البوت الخدمي ','تعطيل البوت الخدمي '},
{'العوده🌟'},
}
send_inline_key(MATRIXg.chat_id_,Text,Key)
end 
if text == 'قـسم الـحمايه' and DevSoFi(MATRIXg) then 
local Text = 'قسم الحمايه يوجد في المطورين والثانوين والخ...'
local Key = {
{'قائمه الكتم العام','المطورين','قائمه العام'},
{'المشتركين','الجروبات ','الردود العامه'},
{'الثانوين'},
{'تنظيف الجروبات ','تنظيف المشتركين'},
{'تغير رساله الاشتراك ','الاشتراك الاجباري','تغير الاشتراك'},
{'العوده🌟'},
}
send_inline_key(MATRIXg.chat_id_,Text,Key)
end 
if text == 'قـسم الاذاعـه' and DevSoFi(MATRIXg) then 
local Text = 'قسم الاذاعات لعمل اذاعه في البوت'
local Key = {
{'اذاعه ','اذاعه خاص '},
{'اذاعه بالتثبيت '},
{'اذاعه بالتوجيه ','اذاعه بالتوجيه خاص '},
{'العوده🌟'},
}
send_inline_key(MATRIXg.chat_id_,Text,Key)
end 
if text == '•𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍' and DevSoFi(MATRIXg) then
local Text = [[ 
[قناه سورس MATRIX ادخل وتابع الجديد](t.me/UU_matrixx)
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'MATRIX', url="t.me/UU_matrixx"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=t.me/UU_matrixx/99=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == '━┅┅┄⟞⟦ مطورين السورس ⟧⟝┄┉┉━' and DevSoFi(MATRIXg) then
local Text = [[ 
[قناه سورس MATRIX ادخل وتابع الجديد](t.me/UU_matrixx)
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '00:00', url="t.me/UU_metoren"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=https://t.me/UU_matrixx/99=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'بوت التواصل' and DevSoFi(MATRIXg) then
database:del(bot_id..'Srt:Bot') 
local Text = [[ 
[TWL](t.me/Enginnermido_bot)
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'بًـوٌتٌ آلَتٌـوٌاصّـلَ  ☑ ➘', url="t.me/uu_mido123BOT"}}, 
{{text = 'تواصل MATRIX  ☑ ➘', url="t.me/UU_matrixx"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=t.me/UU_matrixx/99&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "المطور" or text == "مطور" then
local TEXT_SUD = database:get(bot_id..'Tshake:TEXT_SUDO')
if TEXT_SUDO then 
send(MATRIXg.chat_id_, MATRIXg.id_,TEXT_SUDO)
else
tdcli_function ({ID = "GetUser",user_id_ = SUDO,},function(arg,result) 
local function taha(extra, taha, success)
if taha.photos_[0] then
local Name = 'المطـــــــــــــــور°\n['..result.first_name_..'](tg://user?id='..result.id_..')\n'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ''..result.first_name_..'', url = "https://t.me/"..result.username_..""},
},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id='..MATRIXg.chat_id_..'&caption='..URL.escape(Name)..'&photo='..taha.photos_[0].sizes_[1].photo_.persistent_id_..'&reply_to_message_id='..MATRIXg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else
sendText(MATRIXg.chat_id_,Name,MATRIXg.id_/2097152/0.5,'md')
end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = SUDO, offset_ = 0, limit_ = 1 }, taha, nil)
end,nil)
end
end

if text == 'جلب المطورين' and DevSoFi(MATRIXg) then  
local list = database:smembers(bot_id..'Sudo:User') 
local t = '{"users":['   
for k,v in pairs(list) do 
if k == 1 then 
t =  t..'"'..v..'"' 
else 
t =  t..',"'..v..'"' 
end 
end 
t = t..']}' 
local File = io.open('./sudos3.json', "w") 
File:write(t) 
File:close() 
sendDocument(MATRIXg.chat_id_, MATRIXg.id_,0, 1, nil, './sudos3.json', ' عدد المطورين { '..#list..'}') 
end 
if text == 'رفع المطورين' and DevSoFi(MATRIXg) then 
function by_reply(extra, result, success)    
if result.content_.document_ then  
local ID_FILE = result.content_.document_.document_.persistent_id_  
local File_Name = result.content_.document_.file_name_ 
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE) )  
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name)  
local info_file = io.open('./sudos3.json', "r"):read('*a') 
local users = JSON.decode(info_file) 
for k,v in pairs(users.users) do 
database:sadd(bot_id..'Sudo:User',v)  
end 
send(MATRIXg.chat_id_,MATRIXg.id_,'تم رفع المطورين ') 
end    
end 
tdcli_function ({ ID = "GetMessage", chat_id_ = MATRIXg.chat_id_, message_id_ = tonumber(MATRIXg.reply_to_message_id_) }, by_reply, nil) 
end
if text == 'الاصدار' and DevSoFi(MATRIXg) then 
database:del(bot_id..'Srt:Bot') 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 اصدار سورس MATRIX{ 3x☆}')
end
if text == '━┅┅┄⟞⟦ مطورين السورس ⟧⟝┄┉┉━' then
local Text = [[ 
قناه يوزرات مطورين ومبرمجين السورس 💕👻.
محتاج تنصب بوت ببلاش تواصل معان 🏴‍☠️👇.
]]
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'مطورين السورس👻', url="t.me/UU_metoren"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. MATRIXg.chat_id_ .. '&video=https://t.me/UU_matrixx/3&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == '𖤍━┅┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉┉━𖤍' and DevSoFi(MATRIXg) then
local Text = [[ 
[قناه سورس MATRIX ادخل وتابع الجديد](t.me/UU_matrixx)
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=t.me/UU_matrixx/99&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == '━┅┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉┉━' and DevSoFi(MATRIXg) then
local Text = [[ 
[قناه سورس MATRIX ادخل وتابع الجديد](t.me/UU_matrixx)
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=https://t.me/UU_matrixx/3&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'معلومات الكيبورد' and DevSoFi(MATRIXg) then
database:del(bot_id..'Srt:Bot') 
local Text = [[ 
[CH](t.me/UU_matrixx)مرحبا بك مطوري سأشرح لك كل شئ في لوحه الاوامر بالتفصيل
1• الاحصائيات { لعرض عدد المجموعات، والمشتركين في البوت
 2• تفعيل التواصل{ لتفعيل التواصل عبر البوت خاص بك} 
 3• تعطيل التواصل{ لتعطيل التواصل عبر البوت خاص بك } 
 4• قائمه العام { لعرض المحظورين عام في البوت }
 5• المطورين { لعرض المطورين في بوتك }
8• اذاعه { ارسال رساله لجميع الجروبات في بوتك }
9• اذاعه خاص { ارسال رساله لجميع مشتركين بوتك!} 
10• تعطيل الاشتراك الاجباري { لتعطيل الاشتراك جباري خاص بوتك}
11• تفعيل الاشتراك الاجباري { لتفعيل الاشتراك الاجباري بوتك }
12•اذاعه بالتوجيه { ارسال رساله بالتوجيه الي جميع المجموعات }
13• اذاعه بالتوجيه خاص { ارسال رساله بالتوجيه الي جميع المشتركين }
14• تفعيل البوت الخدمي { يمكن هاذا امر ان منشئ الكروب يفعل البوت م̷ـــِْن دون حتياجه لمطور البوت
15• تعطيل البوت الخدمي { يمك هل خاصيه ان تفعيل البوت اله مطورين البوت فقط }
16• تنظيف المشتركين { يمكنك ازاله المشتركين الوهمين عبر هل امر }
17• تنظيف الجروبات { يمكن ازاله المجموعات الوهميه عبر عل امر }
18• جلب نسخه احتياطيه { لعرض ملف المجموعات بوتك }
19• •𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍 {تعني قناه السورس https://t.me/UU_matrixx}
20• تحديث السورس { لتحديث السورس خاص بوتك 
21• الغاء { للغاء الامر الذي طلبته }
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'قناه السورس', url="t.me/UU_matrixx"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. MATRIXg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "توكن البوت" and SudoBot(MATRIXg) or text == 'جلب التوكن' and SudoBot(MATRIXg) then 
if not DevSoFi(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,'هذا الامر خاص بمطور البوت')
return false
end
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendmessage?chat_id=' .. MATRIXg.sender_user_id_ .. '&text=' ..token) 
send(MATRIXg.chat_id_, MATRIXg.id_,' ') 
end
if text == 'مبرمج السورس' and DevSoFi(MATRIXg) then
database:del(bot_id..'Srt:Bot') 
local Text = [[ 
↝المبرمج اوس اوس لو حابب تتواصل معاه
اتبع الزر إلى تحت 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍↜
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'OSOS', url="t.me/OSDDR "}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. MATRIXg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'قناه السورس' and DevSoFi(MATRIXg) then
database:del(bot_id..'Srt:Bot') 
local Text = [[ 
 👻 من أحسن السورسات على التليجرام سورس MATRIX 👻
بجد سورس أمان جدا وفي مميزات جامده
تع نصب بوتك عندنا لو محظور
خش علي تواصل هيدخلك قناه اليوزرات 
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. MATRIXg.chat_id_ .. '&video=t.me/UU_matrixx/99&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "ضع اسم للبوت" and DevSoFi(MATRIXg) then  
database:setex(bot_id..'Set:Name:Bot'..MATRIXg.sender_user_id_,300,true) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 ارسل اليه الاسم الان ")
return false
end
if text == ("الثانوين") and SudoBot(MATRIXg) then
local list = database:smembers(bot_id.."Dev:SoFi:2")
t = "\n 👻 قائمة مطورين الثانويين للبوت \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد مطورين ثانويين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end


if text == 'الاحصائيات' and SudoBot(MATRIXg) then 
local Groups = database:scard(bot_id..'Chek:Groups')  
local Users = database:scard(bot_id..'User_Bot')  
Text = ' 👻 الاحصائيات  \n'..' 👻 عدد الجروبات  ⇇{'..Groups..'}'..'\n 👻  عدد المشتركين  ⇇{'..Users..'}'
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
return false
end
if text == 'المشتركين' and SudoBot(MATRIXg) then 
local Groups = database:scard(bot_id..'Chek:Groups')  
local Users = database:scard(bot_id..'User_Bot')  
Text = '\n 👻 المشتركين ↚{`'..Users..'`}'
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
return false
end
if text == 'الجروبات ' and SudoBot(MATRIXg) then 
local Groups = database:scard(bot_id..'Chek:Groups')  
local Users = database:scard(bot_id..'User_Bot')  
Text = '\n 👻 الجروبات ↚{`'..Groups..'`}'
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
return false
end
if text == ("المطورين") and SudoBot(MATRIXg) then
local list = database:smembers(bot_id..'Sudo:User')
t = "\n 👻 قائمة المطورين \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- ↝ '..v..' ↜\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد مطورين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
if text == ("قائمه العام") and SudoBot(MATRIXg) then
local list = database:smembers(bot_id..'GBan:User')
t = "\n 👻 قائمه المحظورين عام \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- ↝ '..v..' ↜\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد محظورين عام"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
return false
end
if text == ("قائمه الكتم العام") and SudoBot(MATRIXg) then
local list = database:smembers(bot_id..'Gmute:User')
t = "\n 👻 قائمة المكتومين عام \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- ↝ '..v..' ↜\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد مكتومين عام"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
return false
end
if text=="اذاعه خاص " and MATRIXg.reply_to_message_id_ == 0 and SudoBot(MATRIXg) then 
database:setex(bot_id.."Send:Bc:Pv" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_, 600, true) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 ارسل الان اذاعتك؟ \n 👻 للخروج ارسل الغاء ")
return false
end 
if text=="اذاعه " and MATRIXg.reply_to_message_id_ == 0 and SudoBot(MATRIXg) then 
database:setex(bot_id.."Send:Bc:Grops" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_, 600, true) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 ارسل الان اذاعتك؟ \n 👻 للخروج ارسل الغاء ")
return false
end  
if text=="اذاعه بالتوجيه " and MATRIXg.reply_to_message_id_ == 0  and SudoBot(MATRIXg) then 
database:setex(bot_id.."Send:Fwd:Grops" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_, 600, true) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 ارسل لي التوجيه الان")
return false
end 
if text=="اذاعه بالتوجيه خاص " and MATRIXg.reply_to_message_id_ == 0  and SudoBot(MATRIXg) then 
database:setex(bot_id.."Send:Fwd:Pv" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_, 600, true) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 ارسل لي التوجيه الان")
return false
end 
if text == 'جلب النسخه' and DevSoFi(MATRIXg) then 
GetFile_Bot(MATRIXg)
end
if text == "تنظيف المشتركين " and SudoBot(MATRIXg) then 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,'• اهلا بك عزيزي 👻 •\n• لايمكنك استخدام البوت 👻 •\n• عليك الاشتراك في القناة 👻 •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local pv = database:smembers(bot_id.."User_Bot")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
else
database:srem(bot_id.."User_Bot",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا يوجد مشتركين وهميين في البوت \n')   
else
local ok = #pv - sendok
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 عدد المشتركين الان  ⇇( '..#pv..' )\n 👻 تم ازالة  ⇇( '..sendok..' ) من المشتركين\n 👻  الان عدد المشتركين الحقيقي  ⇇( '..ok..' ) مشترك \n')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "تنظيف الجروبات " and SudoBot(MATRIXg) then 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,'• اهلا بك عزيزي 👻 •\n• لايمكنك استخدام البوت 👻 •\n• عليك الاشتراك في القناة 👻 •\n• اشترك اولا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local group = database:smembers(bot_id..'Chek:Groups') 
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
database:srem(bot_id..'Chek:Groups',group[i])  
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=group[i],user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا يوجد جروبات وهميه في البوت\n')   
else
local DRAGON = (w + q)
local sendok = #group - DRAGON
if q == 0 then
DRAGON = ''
else
DRAGON = '\n 👻 تم ازالة  ⇇↝ '..q..' ↜ جروبات من البوت'
end
if w == 0 then
DRAGONk = ''
else
DRAGONk = '\n 👻 تم ازالة  ⇇↝ '..w..' ↜ كروب لان البوت عضو'
end
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  عدد الجروبات الان  ⇇↝ '..#group..' ↜'..DRAGONk..''..DRAGON..'\n 👻  الان عدد الجروبات الحقيقي  ⇇↝ '..sendok..' ↜ جروبات\n')   
end
end
end,nil)
end
return false
end


if text and text:match("^رفع مطور @(.*)$") and DevSoFi(MATRIXg) then
local username = text:match("^رفع مطور @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," ?? عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")
return false 
end      
database:sadd(bot_id..'Sudo:User', result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم ترقيته مطور'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false 
end
if text and text:match("^رفع مطور (%d+)$") and DevSoFi(MATRIXg) then
local userid = text:match("^رفع مطور (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته مطور'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم ترقيته مطور'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false 
end
if text and text:match("^تنزيل مطور @(.*)$") and DevSoFi(MATRIXg) then
local username = text:match("^تنزيل مطور @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Sudo:User', result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المطورين'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مطور (%d+)$") and DevSoFi(MATRIXg) then
local userid = text:match("^تنزيل مطور (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المطورين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم تنزيله من المطورين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false 
end

end
--------------------------------------------------------------------------------------------------------------
if text and not Special(MATRIXg) then  
local DRAGON1_MATRIXg = database:get(bot_id.."DRAGON1:Add:Filter:Rp2"..text..MATRIXg.chat_id_)   
if DRAGON1_MATRIXg then 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 الـعـضو   ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 '..DRAGON1_MATRIXg)
DeleteMessage(MATRIXg.chat_id_, {[0] = MATRIXg.id_})     
return false
end,nil)
end
end
if database:get(bot_id..'Set:Name:Bot'..MATRIXg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء ' then   
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم الغاء حفظ اسم البوت")
database:del(bot_id..'Set:Name:Bot'..MATRIXg.sender_user_id_) 
return false  
end 
database:del(bot_id..'Set:Name:Bot'..MATRIXg.sender_user_id_) 
database:set(bot_id..'Name:Bot',text) 
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 تم حفظ الاسم")
return false
end 
if database:get(bot_id.."Send:Bc:Pv" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء 👻' then   
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم الغاء الاذاعه للخاص")
database:del(bot_id.."Send:Bc:Pv" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id..'User_Bot') 
if MATRIXg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,'['..MATRIXg.content_.text_..']')  
end
elseif MATRIXg.content_.photo_ then
if MATRIXg.content_.photo_.sizes_[0] then
photo = MATRIXg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif MATRIXg.content_.photo_.sizes_[1] then
photo = MATRIXg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(MATRIXg.content_.caption_ or ''))
end 
elseif MATRIXg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, MATRIXg.content_.animation_.animation_.persistent_id_,(MATRIXg.content_.caption_ or ''))    
end 
elseif MATRIXg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, MATRIXg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تمت الاذاعه الى >>{"..#list.."} مشترك في البوت ")
database:del(bot_id.."Send:Bc:Pv" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_) 
end

if database:get(bot_id.."Send:Bc:Grops" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء 👻' then   
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم الغاء الاذاعه")
database:del(bot_id.."Send:Bc:Grops" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_) 
return false
end 
local list = database:smembers(bot_id..'Chek:Groups') 
if MATRIXg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,'['..MATRIXg.content_.text_..']')  
end
elseif MATRIXg.content_.photo_ then
if MATRIXg.content_.photo_.sizes_[0] then
photo = MATRIXg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif MATRIXg.content_.photo_.sizes_[1] then
photo = MATRIXg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(MATRIXg.content_.caption_ or ''))
end 
elseif MATRIXg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, MATRIXg.content_.animation_.animation_.persistent_id_,(MATRIXg.content_.caption_ or ''))    
end 
elseif MATRIXg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, MATRIXg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تمت الاذاعه الى >>{"..#list.."} كروب في البوت ")
database:del(bot_id.."Send:Bc:Grops" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_) 
end

if database:get(bot_id.."Send:Fwd:Grops" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء 👻' then   
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم الغاء الاذاعه")
database:del(bot_id.."Send:Fwd:Grops" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_) 
return false  
end 
if MATRIXg.forward_info_ then 
local list = database:smembers(bot_id..'Chek:Groups')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = MATRIXg.chat_id_,
message_ids_ = {[0] = MATRIXg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تمت الاذاعه الى >>{"..#list.."} جروبات في البوت ")
database:del(bot_id.."Send:Fwd:Grops" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_) 
end 
end
if database:get(bot_id.."Send:Fwd:Pv" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_) then 
if text == 'الغاء' or text == 'الغاء 👻' then   
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم الغاء الاذاعه")
database:del(bot_id.."Send:Fwd:Pv" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_) 
return false  
end 
if MATRIXg.forward_info_ then 
local list = database:smembers(bot_id..'User_Bot')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = MATRIXg.chat_id_,
message_ids_ = {[0] = MATRIXg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تمت الاذاعه الى >>{"..#list.."} مشترك في البوت ")
database:del(bot_id.."Send:Fwd:Pv" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_) 
end 
end
if database:get(bot_id.."add:ch:jm" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 تم الغاء الامر ")
database:del(bot_id.."add:ch:jm" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_)  
return false  end 
database:del(bot_id.."add:ch:jm" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_)  
local username = string.match(text, "@[%a%d_]+") 
tdcli_function ({    
ID = "SearchPublicChat",    
username_ = username  
},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 المعرف لا يوجد فيه قناة')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 عذا لا يمكنك وضع معرف حسابات في الاشتراك ')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 عذا لا يمكنك وضع معرف كروب بالاشتراك ')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ادمن في القناة \n 👻 تم تفعيل الاشتراك الاجباري في \n 👻 ايدي القناة ('..data.id_..')\n 👻 معرف القناة ([@'..data.type_.channel_.username_..'])')
database:set(bot_id..'add:ch:id',data.id_)
database:set(bot_id..'add:ch:username','@'..data.type_.channel_.username_)
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 عذرآ البوت ليس ادمن بالقناه ')
end
return false  
end
end,nil)
end
if database:get(bot_id.."textch:user" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 تم الغاء الامر ")
database:del(bot_id.."textch:user" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_)  
return false  end 
database:del(bot_id.."textch:user" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
database:set(bot_id..'text:ch:user',texxt)
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تغيير رسالة الاشتراك ')
end

local status_welcome = database:get(bot_id..'Chek:Welcome'..MATRIXg.chat_id_)
if status_welcome and not database:get(bot_id..'lock:tagservr'..MATRIXg.chat_id_) then
if MATRIXg.content_.ID == "MessageChatJoinByLink" then
tdcli_function({ID = "GetUser",user_id_=MATRIXg.sender_user_id_},function(extra,result) 
local GetWelcomeGroup = database:get(bot_id..'Get:Welcome:Group'..MATRIXg.chat_id_)  
if GetWelcomeGroup then 
t = GetWelcomeGroup
else  
t = '\n• نورت حبي \n•  name \n• user' 
end 
t = t:gsub('name',result.first_name_) 
t = t:gsub('user',('@'..result.username_ or 'لا يوجد')) 
send(MATRIXg.chat_id_, MATRIXg.id_,'['..t..']')
end,nil) 
end 
end 

if MATRIXg.content_.ID == "MessageChatAddMembers" then 
if MATRIXg.content_.members_[0].id_ == tonumber(bot_id) then 
print("it is Bot")
N = (database:get(bot_id.."Name:Bot") or "MATRIX")
tdcli_function ({ID = "GetUser",user_id_ = bot_id,},function(arg,data) 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = bot_id,offset_ = 0,limit_ = 1},function(extra,result,success) 
if result.photos_[0] then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الـمـطـور', url="http://t.me/"..sudos.UserName},
},
{
{text = 'اضف البوت الي مجموعتك ↯', url = "https://t.me/"..data.username_.."?startgroup=new"},
},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
local Texti = "٭ مرحبا انا بوت "..N.." \n↞ اختصاصي ادارة المجموعات من السبام والخ..\n↞ للتفعيل ارفعني مشرف وارسل تفعيل في المجموعه ."
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id='..MATRIXg.chat_id_..'&caption='..URL.escape(Texti)..'&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&reply_to_message_id='..MATRIXg_id..'&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end,nil)
end,nil)
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.photo_ then  
if database:get(bot_id..'Change:Chat:Photo'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) then 
if MATRIXg.content_.photo_.sizes_[3] then  
photo_id = MATRIXg.content_.photo_.sizes_[3].photo_.persistent_id_ 
else 
photo_id = MATRIXg.content_.photo_.sizes_[0].photo_.persistent_id_ 
end 
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = MATRIXg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 عذرآ البوت ليس ادمن بالقناه ')
database:del(bot_id..'Change:Chat:Photo'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) 
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 … عذرآ البوت لايملك صلاحيات')
database:del(bot_id..'Change:Chat:Photo'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) 
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تغيير صورة الجروب')
end
end, nil) 
database:del(bot_id..'Change:Chat:Photo'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) 
end   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Set:Description" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_) then  
if text == 'الغاء' then 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم الغاء وضع الوصف")
database:del(bot_id.."Set:Description" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_)
return false  
end 
database:del(bot_id.."Set:Description" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_)   
https.request('https://api.telegram.org/bot'..token..'/setChatDescription?chat_id='..MATRIXg.chat_id_..'&description='..text) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تغيير وصف الجروب')
return false  
end 
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Welcome:Group" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_) then 
if text == 'الغاء' then 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم الغاء حفظ الترحيب")
database:del(bot_id.."Welcome:Group" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_)  
return false  
end 
database:del(bot_id.."Welcome:Group" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_)  
database:set(bot_id..'Get:Welcome:Group'..MATRIXg.chat_id_,text) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم حفظ ترحيب الجروب')
return false   
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id.."Set:Priovate:Group:Link"..MATRIXg.chat_id_..""..MATRIXg.sender_user_id_) then
if text == 'الغاء' then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 تم الغاء حفظ الرابط")
database:del(bot_id.."Set:Priovate:Group:Link"..MATRIXg.chat_id_..""..MATRIXg.sender_user_id_) 
return false
end
if text and text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)") then     
local Link = text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)")   
database:set(bot_id.."Private:Group:Link"..MATRIXg.chat_id_,Link)
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 تم حفظ الرابط بنجاح")
database:del(bot_id.."Set:Priovate:Group:Link"..MATRIXg.chat_id_..""..MATRIXg.sender_user_id_) 
return false 
end
end 
--------------------------------------------------------------------------------------------------------------
if DRAGON_MATRIXg and not Special(MATRIXg) then  
local DRAGON_MATRIXg = database:get(bot_id.."Add:Filter:Rp2"..text..MATRIXg.chat_id_)   
if DRAGON_MATRIXg then    
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(MATRIXg.chat_id_,0," 👻 الـعـضو  : {["..data.first_name_.."](T.ME/"..data.username_..")}\n 👻 ["..DRAGON_MATRIXg.."] \n")
else
send(MATRIXg.chat_id_,0," 👻 الـعـضو  : {["..data.first_name_.."](T.ME/UU_matrixx)}\n 👻 ["..DRAGON_MATRIXg.."] \n")
end
end,nil)   
DeleteMessage(MATRIXg.chat_id_, {[0] = MATRIXg.id_})     
return false
end
end
--------------------------------------------------------------------------------------------------------------
if not Special(MATRIXg) and MATRIXg.content_.ID ~= "MessageChatAddMembers" and database:hget(bot_id.."flooding:settings:"..MATRIXg.chat_id_,"flood") then 
floods = database:hget(bot_id.."flooding:settings:"..MATRIXg.chat_id_,"flood") or 'nil'
NUM_MATRIXG_MAX = database:hget(bot_id.."flooding:settings:"..MATRIXg.chat_id_,"floodmax") or 5
TIME_CHECK = database:hget(bot_id.."flooding:settings:"..MATRIXg.chat_id_,"floodtime") or 5
local post_count = tonumber(database:get(bot_id..'floodc:↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_) or 0)
if post_count > tonumber(database:hget(bot_id.."flooding:settings:"..MATRIXg.chat_id_,"floodmax") or 5) then 
local ch = MATRIXg.chat_id_
local type = database:hget(bot_id.."flooding:settings:"..MATRIXg.chat_id_,"flood") 
trigger_anti_spam(MATRIXg,type)  
end
database:setex(bot_id..'floodc:↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_, tonumber(database:hget(bot_id.."flooding:settings:"..MATRIXg.chat_id_,"floodtime") or 3), post_count+1) 
local edit_id = data.text_ or 'nil'  
NUM_MATRIXG_MAX = 5
if database:hget(bot_id.."flooding:settings:"..MATRIXg.chat_id_,"floodmax") then
NUM_MATRIXG_MAX = database:hget(bot_id.."flooding:settings:"..MATRIXg.chat_id_,"floodmax") 
end
if database:hget(bot_id.."flooding:settings:"..MATRIXg.chat_id_,"floodtime") then
TIME_CHECK = database:hget(bot_id.."flooding:settings:"..MATRIXg.chat_id_,"floodtime") 
end 
end 
--------------------------------------------------------------------------------------------------------------
if text and database:get(bot_id..'lock:Fshar'..MATRIXg.chat_id_) and not Special(MATRIXg) then 
list = {"كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Fars'..MATRIXg.chat_id_) and not Special(MATRIXg) then 
list = {"ڄ","گ","که","پی","خسته","برم","راحتی","بیام","بپوشم","گرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن", "خالی بند","عزیزم خوبی","سلامت باشی","میخوام","سلام","خوببی","ميدم","کی اومدی","خوابیدین"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Engilsh'..MATRIXg.chat_id_) and not Special(MATRIXg) then 
list = {'a','u','y','l','t','b','A','Q','U','J','K','L','B','D','L','V','Z','k','n','c','r','q','o','z','I','j','m','M','w','d','h','e'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Fshar'..MATRIXg.chat_id_) and not Special(MATRIXg) then 
list = {"كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك","كسمك","يا ابن الخول","المتناك","شرموط","شرموطه","ابن الشرموطه","ابن الخول","ابن العرص","منايك","متناك","احا","ابن المتناكه","زبك","عرص","زبي","خول","لبوه","لباوي","ابن اللبوه","منيوك","كسمكك","متناكه","احو","احي","يا عرص","يا خول","قحبه","القحبه","شراميط","العلق","العلوق","العلقه","كسمك","يا ابن الخول","المتناك","شرموط","شرموطه","ابن الشرموطه","ابن الخول","االمنيوك","كسمككك","الشرموطه","ابن العرث","ابن الحيضانه","زبك","خول","زبي","قاحب"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Fars'..MATRIXg.chat_id_) and not Special(MATRIXg) then 
list = {"ڄ","گ","که","پی","خسته","برم","راحتی","بیام","بپوشم","گرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..MATRIXg.chat_id_) and not Special(MATRIXg) then 
list = {"كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك","كسمك","يا ابن الخول","المتناك","شرموط","شرموطه","ابن الشرموطه","ابن الخول","ابن العرص","منايك","متناك","احا","ابن المتناكه","زبك","عرص","زبي","خول","لبوه","لباوي","ابن اللبوه","منيوك","كسمكك","متناكه","احو","احي","يا عرص","يا خول","قحبه","القحبه","شراميط","العلق","العلوق","العلقه","كسمك","يا ابن الخول","المتناك","شرموط","شرموطه","ابن الشرموطه","ابن الخول","االمنيوك","كسمككك","الشرموطه","ابن العرث","ابن الحيضانه","زبك","خول","زبي","قاحب"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..MATRIXg.chat_id_) and not Special(MATRIXg) then 
list = {"ڄ","گ","که","پی","خسته","برم","راحتی","بیام","بپوشم","گرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..MATRIXg.chat_id_) and not Special(MATRIXg) then 
list = {"ڄ","گ","که","پی","خسته","برم","راحتی","بیام","بپوشم","گرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن","اصل","پ","پی","لطفا","سکوت","نیومدم","گم","كس","كحبه","تبادل","جهات","سني","شيعي","ياسعودي","ياعراكي","كسمك"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..MATRIXg.chat_id_) and not Special(MATRIXg) then 
list = {"ربج","خرب دينك","خرب دينج","عير بربك","جهات","كس ربك","رب الكواد","كسم ربك","خرب دينك","خرب دينج","عير بربك","سكسي","كس ربك","خرب الله","صوج الله","خرب محمد","الله الكواد","صوج الله","كسخت الله","ربك"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..MATRIXg.chat_id_) and not Special(MATRIXg) then 
list = {"زيج","عفطه","نيجه","مصه","لحسه","العبي","ابن التنيج","ارد اتنايج","خره بالعراق","انعل رب العراق","كسربك","كسج","كسي","تنيج","69","عير","كيري","مبعوص","كسختك","بعبصتكم","موشريفه","ابن","صرم","اختك","خالتك","امك","رب الكواد","xnxx","كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
return false
end
end
end
if text and database:get(bot_id..'lock:Azag'..MATRIXg.chat_id_) and not Special(MATRIXg) then 
list = {"يا عبد","يا سعودي","يا عراقي","يا عراكي","يا سوري","يا فلسطيني","يا اردني","يا مصري","يا خليجي","يا محتل","يا مشرد","يا فقير","يبن فقيره","يا مهان","يا ابيض","يا نظيف","يعبد","يسعودي","يعراقي","يعاركي","يمصري","يردني","يمشرد","يفقير","يفلسطيني","يابيض","يا هطف","يبن هبله","يحمار","ياهبل","يخليجي"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
return false
end
end
end
--------------------------------------------------------------------------------------------------------------
if database:get(bot_id..'lock:text'..MATRIXg.chat_id_) and not Special(MATRIXg) then       
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_})   
return false     
end     
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.ID == "MessageChatAddMembers" then 
database:incr(bot_id..'Add:Contact'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) 
end
if MATRIXg.content_.ID == "MessageChatAddMembers" and not Special(MATRIXg) then   
if database:get(bot_id.."lock:AddMempar"..MATRIXg.chat_id_) == 'kick' then
local mem_id = MATRIXg.content_.members_  
for i=0,#mem_id do  
chat_kick(MATRIXg.chat_id_,mem_id[i].id_)
end
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.ID == "MessageChatJoinByLink" and not Special(MATRIXg) then 
if database:get(bot_id.."lock:Join"..MATRIXg.chat_id_) == 'kick' then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
return false  
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.caption_ then 
if MATRIXg.content_.caption_:match("@[%a%d_]+") or MATRIXg.content_.caption_:match("@(.+)") then  
if database:get(bot_id.."lock:user:name"..MATRIXg.chat_id_) == "del" and not Special(MATRIXg) then    
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:user:name"..MATRIXg.chat_id_) == "ked" and not Special(MATRIXg) then    
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:user:name"..MATRIXg.chat_id_) == "kick" and not Special(MATRIXg) then    
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:user:name"..MATRIXg.chat_id_) == "ktm" and not Special(MATRIXg) then    
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("@[%a%d_]+") or text and text:match("@(.+)") then    
if database:get(bot_id.."lock:user:name"..MATRIXg.chat_id_) == "del" and not Special(MATRIXg) then    
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:user:name"..MATRIXg.chat_id_) == "ked" and not Special(MATRIXg) then    
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:user:name"..MATRIXg.chat_id_) == "kick" and not Special(MATRIXg) then    
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:user:name"..MATRIXg.chat_id_) == "ktm" and not Special(MATRIXg) then    
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.caption_ then 
if MATRIXg.content_.caption_:match("#[%a%d_]+") or MATRIXg.content_.caption_:match("#(.+)") then 
if database:get(bot_id.."lock:hashtak"..MATRIXg.chat_id_) == "del" and not Special(MATRIXg) then    
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..MATRIXg.chat_id_) == "ked" and not Special(MATRIXg) then    
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..MATRIXg.chat_id_) == "kick" and not Special(MATRIXg) then    
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..MATRIXg.chat_id_) == "ktm" and not Special(MATRIXg) then    
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("#[%a%d_]+") or text and text:match("#(.+)") then
if database:get(bot_id.."lock:hashtak"..MATRIXg.chat_id_) == "del" and not Special(MATRIXg) then    
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..MATRIXg.chat_id_) == "ked" and not Special(MATRIXg) then    
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..MATRIXg.chat_id_) == "kick" and not Special(MATRIXg) then    
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:hashtak"..MATRIXg.chat_id_) == "ktm" and not Special(MATRIXg) then    
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.caption_ then 
if MATRIXg.content_.caption_:match("/[%a%d_]+") or MATRIXg.content_.caption_:match("/(.+)") then  
if database:get(bot_id.."lock:Cmd"..MATRIXg.chat_id_) == "del" and not Special(MATRIXg) then    
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..MATRIXg.chat_id_) == "ked" and not Special(MATRIXg) then    
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..MATRIXg.chat_id_) == "kick" and not Special(MATRIXg) then    
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..MATRIXg.chat_id_) == "ktm" and not Special(MATRIXg) then    
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("/[%a%d_]+") or text and text:match("/(.+)") then
if database:get(bot_id.."lock:Cmd"..MATRIXg.chat_id_) == "del" and not Special(MATRIXg) then    
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..MATRIXg.chat_id_) == "ked" and not Special(MATRIXg) then    
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..MATRIXg.chat_id_) == "kick" and not Special(MATRIXg) then    
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Cmd"..MATRIXg.chat_id_) == "ktm" and not Special(MATRIXg) then    
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.caption_ then 
if not Special(MATRIXg) then 
if MATRIXg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or MATRIXg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or MATRIXg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or MATRIXg.content_.caption_:match("[Ww][Ww][Ww].") or MATRIXg.content_.caption_:match(".[Cc][Oo][Mm]") or MATRIXg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or MATRIXg.content_.caption_:match(".[Pp][Ee]") or MATRIXg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or MATRIXg.content_.caption_:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or MATRIXg.content_.caption_:match("[Tt].[Mm][Ee]/") then 
if database:get(bot_id.."lock:Link"..MATRIXg.chat_id_) == "del" and not Special(MATRIXg) then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Link"..MATRIXg.chat_id_) == "ked" and not Special(MATRIXg) then
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Link"..MATRIXg.chat_id_) == "kick" and not Special(MATRIXg) then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Link"..MATRIXg.chat_id_) == "ktm" and not Special(MATRIXg) then
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or text and text:match(".[Pp][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") or text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]/") or text and text:match("[Tt].[Mm][Ee]/") and not Special(MATRIXg) then
if database:get(bot_id.."lock:Link"..MATRIXg.chat_id_) == "del" and not Special(MATRIXg) then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Link"..MATRIXg.chat_id_) == "ked" and not Special(MATRIXg) then 
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Link"..MATRIXg.chat_id_) == "kick" and not Special(MATRIXg) then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Link"..MATRIXg.chat_id_) == "ktm" and not Special(MATRIXg) then
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.ID == 'MessagePhoto' and not Special(MATRIXg) then     
if database:get(bot_id.."lock:Photo"..MATRIXg.chat_id_) == "del" then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Photo"..MATRIXg.chat_id_) == "ked" then
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Photo"..MATRIXg.chat_id_) == "kick" then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Photo"..MATRIXg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.ID == 'MessageVideo' and not Special(MATRIXg) then     
if database:get(bot_id.."lock:Video"..MATRIXg.chat_id_) == "del" then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Video"..MATRIXg.chat_id_) == "ked" then
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Video"..MATRIXg.chat_id_) == "kick" then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Video"..MATRIXg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.ID == 'MessageAnimation' and not Special(MATRIXg) then     
if database:get(bot_id.."lock:Animation"..MATRIXg.chat_id_) == "del" then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Animation"..MATRIXg.chat_id_) == "ked" then
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Animation"..MATRIXg.chat_id_) == "kick" then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Animation"..MATRIXg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.game_ and not Special(MATRIXg) then     
if database:get(bot_id.."lock:geam"..MATRIXg.chat_id_) == "del" then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:geam"..MATRIXg.chat_id_) == "ked" then
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:geam"..MATRIXg.chat_id_) == "kick" then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:geam"..MATRIXg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.ID == 'MessageAudio' and not Special(MATRIXg) then     
if database:get(bot_id.."lock:Audio"..MATRIXg.chat_id_) == "del" then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Audio"..MATRIXg.chat_id_) == "ked" then
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Audio"..MATRIXg.chat_id_) == "kick" then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Audio"..MATRIXg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.ID == 'MessageVoice' and not Special(MATRIXg) then     
if database:get(bot_id.."lock:vico"..MATRIXg.chat_id_) == "del" then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:vico"..MATRIXg.chat_id_) == "ked" then
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:vico"..MATRIXg.chat_id_) == "kick" then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:vico"..MATRIXg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.reply_markup_ and MATRIXg.reply_markup_.ID == 'ReplyMarkupInlineKeyboard' and not Special(MATRIXg) then     
if database:get(bot_id.."lock:Keyboard"..MATRIXg.chat_id_) == "del" then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Keyboard"..MATRIXg.chat_id_) == "ked" then
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Keyboard"..MATRIXg.chat_id_) == "kick" then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Keyboard"..MATRIXg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.ID == 'MessageSticker' and not Special(MATRIXg) then     
if database:get(bot_id.."lock:Sticker"..MATRIXg.chat_id_) == "del" then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Sticker"..MATRIXg.chat_id_) == "ked" then
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Sticker"..MATRIXg.chat_id_) == "kick" then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Sticker"..MATRIXg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
if tonumber(MATRIXg.via_bot_user_id_) ~= 0 and not Special(MATRIXg) then
if database:get(bot_id.."lock:inline"..MATRIXg.chat_id_) == "del" then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:inline"..MATRIXg.chat_id_) == "ked" then
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:inline"..MATRIXg.chat_id_) == "kick" then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:inline"..MATRIXg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.forward_info_ and not Special(MATRIXg) then     
if database:get(bot_id.."lock:forward"..MATRIXg.chat_id_) == "del" then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
return false
elseif database:get(bot_id.."lock:forward"..MATRIXg.chat_id_) == "ked" then
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
return false
elseif database:get(bot_id.."lock:forward"..MATRIXg.chat_id_) == "kick" then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
return false
elseif database:get(bot_id.."lock:forward"..MATRIXg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
return false
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.ID == 'MessageDocument' and not Special(MATRIXg) then     
if database:get(bot_id.."lock:Document"..MATRIXg.chat_id_) == "del" then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Document"..MATRIXg.chat_id_) == "ked" then
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Document"..MATRIXg.chat_id_) == "kick" then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Document"..MATRIXg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.ID == "MessageUnsupported" and not Special(MATRIXg) then      
if database:get(bot_id.."lock:Unsupported"..MATRIXg.chat_id_) == "del" then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Unsupported"..MATRIXg.chat_id_) == "ked" then
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Unsupported"..MATRIXg.chat_id_) == "kick" then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Unsupported"..MATRIXg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.entities_ then 
if MATRIXg.content_.entities_[0] then 
if MATRIXg.content_.entities_[0] and MATRIXg.content_.entities_[0].ID == "MessageEntityUrl" or MATRIXg.content_.entities_[0].ID == "MessageEntityTextUrl" then      
if not Special(MATRIXg) then
if database:get(bot_id.."lock:Markdaun"..MATRIXg.chat_id_) == "del" then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Markdaun"..MATRIXg.chat_id_) == "ked" then
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Markdaun"..MATRIXg.chat_id_) == "kick" then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Markdaun"..MATRIXg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end  
end 
end
end 
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.ID == 'MessageContact' and not Special(MATRIXg) then      
if database:get(bot_id.."lock:Contact"..MATRIXg.chat_id_) == "del" then
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Contact"..MATRIXg.chat_id_) == "ked" then
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Contact"..MATRIXg.chat_id_) == "kick" then
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Contact"..MATRIXg.chat_id_) == "ktm" then
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.text_ and not Special(MATRIXg) then  
local _nl, ctrl_ = string.gsub(text, '%c', '')  
local _nl, real_ = string.gsub(text, '%d', '')   
sens = 400  
if database:get(bot_id.."lock:Spam"..MATRIXg.chat_id_) == "del" and string.len(MATRIXg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Spam"..MATRIXg.chat_id_) == "ked" and string.len(MATRIXg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
ked(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Spam"..MATRIXg.chat_id_) == "kick" and string.len(MATRIXg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
elseif database:get(bot_id.."lock:Spam"..MATRIXg.chat_id_) == "ktm" and string.len(MATRIXg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
if MATRIXg.content_.ID == 'MessageSticker' and not Manager(MATRIXg) then 
local filter = database:smembers(bot_id.."filtersteckr"..MATRIXg.chat_id_)
for k,v in pairs(filter) do
if v == MATRIXg.content_.sticker_.set_id_ then
tdcli_function({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(MATRIXg.chat_id_,0, " 👻 عذرا  ⇇{[@"..data.username_.."]}\n 👻 عذرا تم منع الملصق \n" ) 
else
send(MATRIXg.chat_id_,0, " 👻 عذرا  ⇇{["..data.first_name_.."](T.ME/UU_matrixx)}\n 👻 عذرا تم منع الملصق \n" ) 
end
end,nil)   
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_})       
return false   
end
end
end

------------------------------------------------------------------------

------------------------------------------------------------------------
if MATRIXg.content_.ID == 'MessagePhoto' and not Manager(MATRIXg) then 
local filter = database:smembers(bot_id.."filterphoto"..MATRIXg.chat_id_)
for k,v in pairs(filter) do
if v == MATRIXg.content_.photo_.id_ then
tdcli_function({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(MATRIXg.chat_id_,0," 👻 عذرا  ⇇{[@"..data.username_.."]}\n 👻 عذرا تم منع الصوره \n" ) 
else
send(MATRIXg.chat_id_,0," 👻 عذرا  ⇇{["..data.first_name_.."](T.ME/UU_matrixx)}\n 👻 عذرا تم منع الصوره \n") 
end
end,nil)   
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_})       
return false   
end
end
end
------------------------------------------------------------------------
if MATRIXg.content_.ID == 'MessageAnimation' and not Manager(MATRIXg) then 
local filter = database:smembers(bot_id.."filteranimation"..MATRIXg.chat_id_)
for k,v in pairs(filter) do
if v == MATRIXg.content_.animation_.animation_.persistent_id_ then
tdcli_function({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(MATRIXg.chat_id_,0," 👻 عذرا  ⇇{[@"..data.username_.."]}\n 👻 عذرا تم منع المتحركه \n") 
else
send(MATRIXg.chat_id_,0," 👻 عذرا  ⇇{["..data.first_name_.."](T.ME/UU_matrixx)}\n 👻 عذرا تم منع المتحركه \n" ) 
end
end,nil)   
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_})       
return false   
end
end
end
-------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------
if text == 'تفعيل' and Sudo(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻لا تستطيع استخدام البوت \n 👻 يرجى الاشتراك بالقناه اولا \n 👻 اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻عذرا يرجى ترقيه البوت مشرف !')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(MATRIXg.chat_id_).ID }, function(arg,data)  
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'Num:Add:Bot') or 0) and not DevSoFi(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻عدد اعضاء الجروب قليله يرجى جمع >> {'..(database:get(bot_id..'Num:Add:Bot') or 0)..'} عضو')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=MATRIXg.chat_id_},function(arg,chat)  
if database:sismember(bot_id..'Chek:Groups',MATRIXg.chat_id_) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 الـجـروب مـفعـل مـن قبـل')
else
sendText(MATRIXg.chat_id_,'\n 👻 مـن قبـل ↭ ['..string.sub(result.first_name_,0, 70)..'](tg://user?id='..result.id_..')\n 👻تـم تـشغـيل الـبوت فـي الـجـروب  {'..chat.title_..'}\n  وتم تــرقــيه جــمــيع الـادمــنــيه',MATRIXg.id_/2097152/0.5,'md')
database:sadd(bot_id..'Chek:Groups',MATRIXg.chat_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
local IdChat = MATRIXg.chat_id_
local NumMember = data.member_count_
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..MATRIXg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = ' 👻 تـم تـشغـيل الـبوت فـي الـجـروب جـديد\n'..
'\n 👻بواسطة {↝'..Name..'↜}'..
'\n 👻ايدي الجروب {'..IdChat..'}'..
'\n 👻اسم الجروب {['..NameChat..']}'..
'\n 👻عدد اعضاء الجروب *{'..NumMember..'}*'..
'\n 👻الرابط {['..LinkGp..']}'
if not DevSoFi(MATRIXg) then
sendText(SUDO,Text,0,'md')
end
end
end,nil) 
end,nil) 
end,nil)
end
if text == 'تعطيل' and Sudo(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻لا تستطيع استخدام البوت \n 👻 يرجى الاشتراك بالقناه اولا \n 👻 اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=MATRIXg.chat_id_},function(arg,chat)  
if not database:sismember(bot_id..'Chek:Groups',MATRIXg.chat_id_) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 الـبوت مـعطـل مـن قبـل')
else
sendText(MATRIXg.chat_id_,'\n 👻 مـن قبـل ↭ ['..string.sub(result.first_name_,0, 70)..'](tg://user?id='..result.id_..')\n 👻 تـم تـعـطيل الـبوت   {'..chat.title_..'}',MATRIXg.id_/2097152/0.5,'md')
database:srem(bot_id..'Chek:Groups',MATRIXg.chat_id_)  
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
local IdChat = MATRIXg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..MATRIXg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '\n تـم تـعـطيل الـبوت مـن الـجـروب 👻'..
'\n 👻بواسطة {↝'..Name..'↜}'..
'\n 👻ايدي الجروب {'..IdChat..'}'..
'\n 👻اسم الجروب {['..NameChat..']}'..
'\n 👻الرابط {['..LinkGp..']}'
if not DevSoFi(MATRIXg) then
sendText(SUDO,Text,0,'md')
end
end
end,nil) 
end,nil) 
end
if text == 'تفعيل' and not Sudo(MATRIXg) and not database:get(bot_id..'Free:Bots') then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻لا تستطيع استخدام البوت \n 👻 يرجى الاشتراك بالقناه اولا \n 👻 اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻عذرا يرجى ترقيه البوت مشرف !')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(MATRIXg.chat_id_).ID }, function(arg,data)  
if tonumber(data.member_count_) < tonumber(database:get(bot_id..'Num:Add:Bot') or 0) and not DevSoFi(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻عدد اعضاء الجروب قليله يرجى جمع >> {'..(database:get(bot_id..'Num:Add:Bot') or 0)..'} عضو')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=MATRIXg.chat_id_},function(arg,chat)  
tdcli_function ({ID = "GetChatMember",chat_id_ = MATRIXg.chat_id_,user_id_ = MATRIXg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusEditor" or da and da.status_.ID == "ChatMemberStatusCreator" then
if da and da.user_id_ == MATRIXg.sender_user_id_ then
if da.status_.ID == "ChatMemberStatusCreator" then
var = 'المالك'
elseif da.status_.ID == "ChatMemberStatusEditor" then
var = 'مشرف'
end
if database:sismember(bot_id..'Chek:Groups',MATRIXg.chat_id_) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻تـم تـشغـيل الـبوت فـي الـجـروب ')
else
sendText(MATRIXg.chat_id_,'\n 👻 مـن قبـل ↭ ['..string.sub(result.first_name_,0, 70)..'](tg://user?id='..result.id_..')\n 👻تـم تـشغـيل الـبوت فـي الـجـروب  {'..chat.title_..'}\n  وتم تــرقــيه جــمــيع الـادمــنــيه',MATRIXg.id_/2097152/0.5,'md')
database:sadd(bot_id..'Chek:Groups',MATRIXg.chat_id_)  
database:sadd(bot_id..'CoSu'..MATRIXg.chat_id_, MATRIXg.sender_user_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NumMember = data.member_count_
local NameChat = chat.title_
local IdChat = MATRIXg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..MATRIXg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = ' 👻 تـم تـشغـيل الـبوت فـي الـجـروب جـديد\n'..
'\n 👻بواسطة {↝'..Name..'↜}'..
'\n 👻موقعه في الجروب {'..AddPy..'}' ..
'\n 👻ايدي الجروب {'..IdChat..'}'..
'\n 👻عدد اعضاء الجروب *{'..NumMember..'}*'..
'\n 👻اسم الجروب {['..NameChat..']}'..
'\n 👻الرابط {['..LinkGp..']}'
if not DevSoFi(MATRIXg) then
sendText(SUDO,Text,0,'md')
end
end
end
end
end,nil)   
end,nil) 
end,nil) 
end,nil)
end
if text ==("تفعيل") and Sudo(MATRIXg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = MATRIXg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local num2 = 0
local admins = data.members_
for i=0 , #admins do
if data.members_[i].bot_info_ == false and data.members_[i].status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id.."Mod:User"..MATRIXg.chat_id_, admins[i].user_id_)
num2 = num2 + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,b) 
if b.username_ == true then
end
if b.first_name_ == false then
database:srem(bot_id.."Mod:User"..MATRIXg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
database:srem(bot_id.."Mod:User"..MATRIXg.chat_id_, admins[i].user_id_)
end
end
if num2 == 0 then
send(MATRIXg.chat_id_, MATRIXg.id_," ") 
else
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
end
end,nil)   
end
if text and text:match("^ضع عدد الاعضاء (%d+)$") and DevSoFi(MATRIXg) then
local Num = text:match("ضع عدد الاعضاء (%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id..'Num:Add:Bot',Num) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعيين عدد الاعضاء سيتم تفعيل الجروبات التي اعضائها اكثر من  >> {'..Num..'} عضو')
end

if text == 'تحديث السورس' and DevSoFi(MATRIXg) then 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
os.execute('rm -rf DRAGON.lua')
os.execute('wget https://raw.githubusercontent.com/ososs9/matrix1/main/DRAGON.lua')
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تحديث السورس')
dofile('DRAGON.lua')  
end

if text and text:match("^تغير الاشتراك$") and DevSoFi(MATRIXg) then  
database:setex(bot_id.."add:ch:jm" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_, 360, true)  
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 حسنآ ارسل لي معرف القناة')
return false  
end
if text and text:match("^تغير رساله الاشتراك$") and DevSoFi(MATRIXg) then  
database:setex(bot_id.."textch:user" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_, 360, true)  
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 حسنآ ارسل لي النص الذي تريده')
return false  
end
if text == "مسح رساله الاشتراك " and DevSoFi(MATRIXg) then  
database:del(bot_id..'text:ch:user')
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 تم مسح رساله الاشتراك ")
return false  
end
if text and text:match("^وضع قناة الاشتراك 👻$") and DevSoFi(MATRIXg) then  
database:setex(bot_id.."add:ch:jm" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_, 360, true)  
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 حسنآ ارسل لي معرف القناة')
return false  
end
if text == "تفعيل الاشتراك الاجباري" and DevSoFi(MATRIXg) then  
if database:get(bot_id..'add:ch:id') then
local addchusername = database:get(bot_id..'add:ch:username')
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 الاشتراك الاجباري مفعل \n 👻 على القناة  ⇇["..addchusername.."]")
else
database:setex(bot_id.."add:ch:jm" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_, 360, true)  
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 اهلا عزيزي المطور \n 👻 ارسل الان معرف قناتك")
end
return false  
end
if text == "تعطيل الاشتراك الاجباري" and DevSoFi(MATRIXg) then  
database:del(bot_id..'add:ch:id')
database:del(bot_id..'add:ch:username')
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 تم تعطيل الاشتراك الاجباري ")
return false  
end
if text == "الاشتراك الاجباري " and DevSoFi(MATRIXg) then  
if database:get(bot_id..'add:ch:username') then
local addchusername = database:get(bot_id..'add:ch:username')
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 تم تفعيل الاشتراك الاجباري \n 👻 على القناة  ⇇["..addchusername.."]")
else
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا يوجد قناة في الاشتراك الاجباري ")
end
return false  
end
if text == "++-+++" and SudoBot(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تفعيل الالعاب')
database:set(bot_id.."AL:AddS0FI:stats","✔")
end
if text == "+-+-+-+-+&--" and SudoBot(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تعطيل الالعاب')
database:set(bot_id.."AL:AddS0FI:stats","✖")
end
if text == "حاله الالعاب" and Constructor(MATRIXg) then
local MRSoOoFi = database:get(bot_id.."AL:AddS0FI:stats") or "لم يتم التحديد"
send(MATRIXg.chat_id_, MATRIXg.id_,"حاله الالعاب هي : {"..MRSoOoFi.."}\nاذا كانت {✔} الالعاب مفعله\nاذا كانت {✖} الالعاب معطله")
end
function bnnaGet(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end

if database:get(bot_id.."block:name:stats"..MATRIXg.chat_id_) == "open" then
if text and text:match("^كتم اسم (.*)$") and Manager(MATRIXg) and database:get(bot_id.."block:name:stats"..MATRIXg.chat_id_) == "open" then
local BlNe = text:match("^كتم اسم (.*)$")
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم كتم الاسم '..BlNe)
database:sadd(bot_id.."DRAGON:blocname"..MATRIXg.chat_id_, BlNe)
end

if text and text:match("^الغاء كتم اسم (.*)$") and Manager(MATRIXg) and database:get(bot_id.."block:name:stats"..MATRIXg.chat_id_) == "open" then
local delBn = text:match("^الغاء كتم اسم (.*)$")
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم الغاء كتم الاسم '..delBn)
database:srem(bot_id.."DRAGON:blocname"..MATRIXg.chat_id_, delBn)
end

if text == "مسح الاسماء المكتومه" and Constructor(MATRIXg) and database:get(bot_id.."block:name:stats"..MATRIXg.chat_id_) == "open" then
database:del(bot_id.."DRAGON:blocname"..MATRIXg.chat_id_)
texts = " 👻 تم مسح الاسماء المكتومه "
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
if text == "الاسماء المكتومه" and Constructor(MATRIXg) and database:get(bot_id.."block:name:stats"..MATRIXg.chat_id_) == "open" then
local All_name = database:smembers(bot_id.."DRAGON:blocname"..MATRIXg.chat_id_)
t = "\n 👻 قائمة الاسماء المكتومه \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍 \n"
for k,v in pairs(All_name) do
t = t..""..k.."- (["..v.."])\n"
end
if #All_name == 0 then
t = " 👻 لا يوجد اسماء مكتومه"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
end
if text == "تفعيل كتم الاسم" and Constructor(MATRIXg) and database:get(bot_id.."AL:AddS0FI:stats") == "✔" then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم التفعيل الاسماء المكتومه')
database:set(bot_id.."block:name:stats"..MATRIXg.chat_id_,"open")
end
if text == "تعطيل كتم الاسم" and Constructor(MATRIXg) and database:get(bot_id.."AL:AddS0FI:stats") == "✔" then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تعطيل الاسماء المكتومه')
database:set(bot_id.."block:name:stats"..MATRIXg.chat_id_,"close")
end
if not Manager(MATRIXg) and database:get(bot_id.."block:name:stats"..MATRIXg.chat_id_) == "open" then
function S00F4_name(t1,t2)
if t2.id_ then 
name_MRSOFI = ((t2.first_name_ or "") .. (t2.last_name_ or ""))
if name_MRSOFI then 
names_MRSOFI = database:smembers(bot_id.."DRAGON:blocname"..MATRIXg.chat_id_) or ""
if names_MRSOFI and names_MRSOFI[1] then 
for i=1,#names_MRSOFI do 
if name_MRSOFI:match("(.*)("..names_MRSOFI[i]..")(.*)") then 
DeleteMessage_(MATRIXg.chat_id_,{[0] = MATRIXg.id_}) 
end
end
end
end
end
end
bnnaGet(MATRIXg.sender_user_id_, S00F4_name)
end
if database:get(bot_id.."kt:twh:stats"..MATRIXg.chat_id_) == "open" then
if text and text:match("^وضع توحيد (.*)$") and Manager(MATRIXg) and database:get(bot_id.."kt:twh:stats"..MATRIXg.chat_id_) == "open" then
local teh = text:match("^وضع توحيد (.*)$")
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعيين '..teh..' كتوحيد للمجموعه')
database:set(bot_id.."DRAGON:teh"..MATRIXg.chat_id_,teh)
end
if text and text:match("^تعين عدد الكتم (.*)$") and Manager(MATRIXg) and database:get(bot_id.."kt:twh:stats"..MATRIXg.chat_id_) == "open" then
local nump = text:match("^تعين عدد الكتم (.*)$")
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعين  '..nump..' عدد الكتم')
database:set(bot_id.."DRAGON:nump"..MATRIXg.chat_id_,nump)
end
if text == "التوحيد" then
local s1 = database:get(bot_id.."DRAGON:teh"..MATRIXg.chat_id_) or "لا يوجد توحيد"
local s2 = database:get(bot_id.."DRAGON:nump"..MATRIXg.chat_id_) or 5
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 التوحيد '..s1..'\n 👻 عدد الكتم  : '..s2)
end
end
if text == "تفعيل التوحيد" and Constructor(MATRIXg) and database:get(bot_id.."AL:AddS0FI:stats") == "✔" then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تفعيل التوحيد')
database:set(bot_id.."kt:twh:stats"..MATRIXg.chat_id_,"open")
end
if text == "تعطيل التوحيد" and Constructor(MATRIXg) and database:get(bot_id.."AL:AddS0FI:stats") == "✔" then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تعطيل التوحيد')
database:set(bot_id.."kt:twh:stats"..MATRIXg.chat_id_,"close")
end
if not Constructor(MATRIXg) then
if database:get(bot_id.."kt:twh:stats"..MATRIXg.chat_id_) == "open"  and database:get(bot_id.."DRAGON:teh"..MATRIXg.chat_id_) then 
id = MATRIXg.sender_user_id_
function sofi_mrsofi_new(mrsofi1,mrsofi2)
if mrsofi2 and mrsofi2.first_name_ then 
if mrsofi2.first_name_:match("(.*)"..database:get(bot_id.."DRAGON:teh"..MATRIXg.chat_id_).."(.*)") then 
database:srem(bot_id.."DRAGON:Muted:User"..MATRIXg.chat_id_, MATRIXg.sender_user_id_)
else
local mrsofi_nnn = database:get(bot_id.."DRAGON:nump"..MATRIXg.chat_id_) or 5
local mrsofi_nnn2 = database:get(bot_id.."DRAGON:nump22"..MATRIXg.chat_id_..MATRIXg.sender_user_id_) or 0
if (tonumber(mrsofi_nnn2) == tonumber(mrsofi_nnn) or tonumber(mrsofi_nnn2) > tonumber(mrsofi_nnn)) then 
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_, MATRIXg.sender_user_id_)
else 
database:incrby(bot_id.."DRAGON:nump22"..MATRIXg.chat_id_..MATRIXg.sender_user_id_,1)
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 عزيزي >>["..mrsofi2.username_.."](https://t.me/"..(mrsofi2.username_ or "UU_matrixx")..")\n 👻 عليك وضع التوحيد ⪼ {"..database:get(bot_id.."DRAGON:teh"..MATRIXg.chat_id_).."} بجانب اسمك\n 👻 عدد المحاولات المتبقيه {"..(tonumber(mrsofi_nnn) - tonumber(mrsofi_nnn2)).."}")
end
end
end
end
bnnaGet(id, sofi_mrsofi_new)
end
end
if text == "تفعيل تنبيه الاسماء" and Manager(MATRIXg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(MATRIXg.chat_id_, MATRIXg.id_, '•تم تفعيل تنبيه الاسماء')
database:set(bot_id.."Ttn:BBE:stats"..MATRIXg.chat_id_,"open")
end
if text == "تعطيل تنبيه الاسماء" and Manager(MATRIXg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(MATRIXg.chat_id_, MATRIXg.id_, '•تم تعطيل تنبيه الاسماء')
database:set(bot_id.."Ttn:BBE:stats"..MATRIXg.chat_id_,"close")
end
if text and database:get(bot_id.."Ttn:BBE:stats"..MATRIXg.chat_id_) == "open" then 
tdcli_function({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data)
if data.id_ then 
if data.id_ ~= bot_id then
local DRAGONChengName = database:get(bot_id.."DRAGON:Cheng:Name"..data.id_)
if not data.first_name_ then 
if DRAGONChengName then 
send(MATRIXg.chat_id_, MATRIXg.id_, " خوش معرف جان ["..DRAGONChengName..']')
database:del(bot_id.."DRAGON:Cheng:Name"..data.id_) 
end
end
if data.first_name_ then 
if DRAGONChengName ~= data.first_name_ then 
local Text = {
  "جان اسمك خوش اسم ",
"ليش غيرت اسمك يحلو ",
"هذا لحلو غير اسمه ",
}
send(MATRIXg.chat_id_, MATRIXg.id_,Text[math.random(#Text)])
end  
database:set(bot_id.."DRAGON:Cheng:Name"..data.id_, data.first_name_) 
end
end
end
end,nil)   
end
if text == "تفعيل تنبيه المعرف" and Constructor(MATRIXg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(MATRIXg.chat_id_, MATRIXg.id_, '•تم تفعيل تنبيه المعرف')
database:set(bot_id.."Ttn:Userr:stats"..MATRIXg.chat_id_,"open")
end
if text == "تعطيل تنبيه المعرف" and Constructor(MATRIXg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(MATRIXg.chat_id_, MATRIXg.id_, '•تم تعطيل تنبيه المعرف')
database:set(bot_id.."Ttn:Userr:stats"..MATRIXg.chat_id_,"close")
end
if text and database:get(bot_id.."Ttn:Userr:stats"..MATRIXg.chat_id_) == "open" then  
tdcli_function({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data)
if data.id_ then 
if data.id_ ~= bot_id then
local DRAGONChengUserName = database:get(bot_id.."DRAGON:Cheng:UserName"..data.id_)
if not data.username_ then 
if DRAGONChengUserName then 
send(MATRIXg.chat_id_, MATRIXg.id_, 1, "مسح معرفه خمطو بساع بساع  \n هاذه معرفه  : [@"..DRAGONChengUserName..']')
database:del(bot_id.."DRAGON:Cheng:UserName"..data.id_) 
end
end
if data.username_ then 
if DRAGONChengUserName ~= data.username_ then 
local Text = {
'شكو غيرت معرفك شنو نشروك بقنوات نحراف 🌞😹😹😹',
"هاها شو غيرت معرفك بس لا هددوك 🤞😂😂",
"شسالفه شو غيرت معرفك 😐🌝",
"غير معرفه خمطو بساع بساع \n هاذه معرفه : @"..data.username_.."",
'ها عار مو جان معرفك \n شكو غيرته ل @'..data.username_..' ',
'ها يول شو مغير معرفك', 
"منور معرف جديد : "..data.username_.."",
}
send(MATRIXg.chat_id_, MATRIXg.id_,Text[math.random(#Text)])
end  
database:set(bot_id.."DRAGON:Cheng:UserName"..data.id_, data.username_) 
end
end
end
end,nil)   
end
if text == "تفعيل تنبيه الصور" and Manager(MATRIXg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(MATRIXg.chat_id_, MATRIXg.id_, '•تم تفعيل تنبيه الصور')
database:set(bot_id.."Ttn:Ph:stats"..MATRIXg.chat_id_,"open")
end
if text == "تعطيل تنبيه الصور" and Manager(MATRIXg) and database:get(bot_id.."AL:Sre:stats") == "✔" then
send(MATRIXg.chat_id_, MATRIXg.id_, '•تم تعطيل تنبيه الصور')
database:set(bot_id.."Ttn:Ph:stats"..MATRIXg.chat_id_,"close")
end
if text and database:get(bot_id.."Ttn:Ph:stats"..MATRIXg.chat_id_) == "open" then  
tdcli_function({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data)
if data.id_ then 
if data.id_ ~= bot_id then 
local DRAGONChengPhoto = database:get(bot_id.."DRAGON:Cheng:Photo"..data.id_)
if not data.profile_photo_ then 
if DRAGONChengPhoto then 
send(MATRIXg.chat_id_, MATRIXg.id_, "مسح كل صوره الحلو 😂👌🏻")
database:del(bot_id.."DRAGON:Cheng:Photo"..data.id_) 
end
end
if data.profile_photo_.big_.persistent_id_ then 
if DRAGONChengPhoto ~= data.profile_photo_.big_.persistent_id_ then 
local Text = {
  "شكو غيرت صورتك  يا حلو ",
  "منور طالع حلو عل صوره جديده",
  "ها شو غيرت صورتك 🤔😹",
  "شكو غيرت صورتك شنو قطيت وحده جديده 😹😹👻",
  "شو غيرت صورتك شنو تعاركت ويه الحب ؟😹🌞",
  "شكو غيرت الصوره شسالفه ؟؟ 🤔🌞",
}
send(MATRIXg.chat_id_, MATRIXg.id_,Text[math.random(#Text)])
end  
database:set(bot_id.."DRAGON:Cheng:Photo"..data.id_, data.profile_photo_.big_.persistent_id_) 
end
end
end
end,nil)   
end
if text == 'السورس' or text == 'سورس' or text == 'يا سورس' or text == 'source' then
local Text = [[

[[♢ | 𝐖𝐞𝐥𝐜𝐨𝐦𝐞 𝐓𝐨 𝐒𝐨𝐮𝐫𝐜𝐞 MATRIX](t.me/UU_matrixx)]

[[♢ | MATRIX 𝐓𝐡𝐞 𝐁𝐞𝐬𝐭 𝐒𝐨𝐮𝐫𝐜𝐞 𝐎𝐧 𝐓𝐞𝐥𝐞](t.me/UU_matrixx)]

[[♢ | 𝐅𝐨𝐥𝐥𝐨𝐰 𝐓𝐡𝐞 𝐁𝐮𝐭𝐭𝐨𝐧𝐬 𝐁𝐞𝐥𝐨𝐰](t.me/UU_matrixx)]
]]

keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'DEV MEDO ELKBEER🌺',url="t.me/uu_mido"}},
{{text = ' MIDO elso8ayer🌺', url="t.me/Enginner_mido"}},
{{text = 'MRAT MEDO ELKBEER🌺',url="t.me/Rohmidoelkbeer"}},
{{text = ' SOURCE MATRIX🌺 ', url="t.me/UU_matrixx"}},
{{text = 'اضف البوت الي مجموعتك' ,url="t.me/"..dofile("./kkkklInfo.lua").botUserName.."?startgroup=start"}}, 
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendphoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=t.me/UU_matrixx/99&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
 
if text == 'مين نصبلك' or text == 'عايزه بوت' or text == 'عايز بوت' then
local Text = [[
 𖠪 اهلا بك في سورس MATRIX الجمدان لو عايز بوت بأسعار منسبه وبوت مميز كلمني  𖠪 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'DEV MEDO ELKBEER🌺',url="t.me/uu_mido"}},
{{text = ' MIDO elso8ayer🌺', url="t.me/Enginner_mido"}},
{{text = 'MRAT MEDO ELKBEER🌺',url="t.me/Rohmidoelkbeer"}},
{{text = ' SOURCE MATRIX🌺 ', url="t.me/UU_matrixx"}},
{{text = 'اضف البوت الي مجموعتك' ,url="t.me/"..dofile("./kkkklInfo.lua").botUserName.."?startgroup=start"}}, 
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendphoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=t.me/UU_matrixx/99&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == 'اوس اوس'  then
local Text = [[
اوس اوس مبرمج سورس MATRIX للتواصل معه اتبع الزر الاسفل 👇💕.
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝙾𝚂𝙾𝚂🌺',url="t.me/OSDDR"}},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=https://t.me/OSDDR&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'ميدو الصغير'  then
local Text = [[
ميدو الصغير  مالك سورس MATRIX للتواصل معه اتبع الزر الاسفل👇💕.
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'ميدو الصغير🌺',url="t.me/Enginner_mido"}},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=https://t.me/Enginner_mido&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'ميدو الكبير'  then
local Text = [[
ميدو الكبير  مبرمج سورس MATRIX للتواصل معه اتبع الزر الاسفل👇💕.
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'dev mido elkbeer🌺',url="t.me/uu_mido"}},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=https://t.me/uu_mido&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'مرات ميدو الكبير' then
local Text = [[

]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'Mrat mido elkbeer🌺',url="t.me/Rohmidoelkbeer"}},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=https://t.me/Rohmidoelkbeer&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'يوتيوب' or text == 'بحث' or text == 'اليوتيوب' then
local Text = [[
اليك بوتات تحميل 🌺
من جميع المواقع 🌺

]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'بوت اليوتيوب ♥️',url="t.me/Enginner_mido3bot"}},
{{text = 'بوت تيك توك 🌺',url="t.me/K0XBOT"}},
{{text = 'بوت انستقرام 🎌',url="t.me/J33Bot"}},
{{text = 'بوت قران 🕌',url="t.me/quran_lbot"}},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=https://t.me/Qtdao/8&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text=="اذاعه بالتثبيت" and MATRIXg.reply_to_message_id_ == 0 and SudoBot(MATRIXg) then 
database:setex(bot_id.."Bc:Grops:Pin" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_, 600, true) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 ارسل الان اذاعتك؟ \n 👻 للخروج ارسل الغاء ")
return false
end
if text == "£¢€$$__€€¢¥^^¥€" and DevSoFi(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then

return false
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = MATRIXg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 1000
},function(ta,DRAGON)
local t = "\nツ قائمة الاعضاء \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍 \n"
x = 0
local list = DRAGON.members_
for k, v in pairs(list) do
 if tonumber(v.user_id_) ~= tonumber(bot_id) then
chat_kick(MATRIXg.chat_id_,v.user_id_)
end
end
 
end,nil)
end
if text == "استوري" and not  database:get(bot_id.."sing:for:me"..MATRIXg.chat_id_) then 
ght = math.random(1,62); 
local Text ='اكتب استوري وسيتم البوت باختيار استورس عشوائي' 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'MIDO ELSO8AYER🌺',url="t.me/Enginner_mido"}},
{{text = ' MIDO ELKIBER🌺',url="t.me/uu_mido"}},
{{text =  'SOURCE MATRIX' ,url="t.me/UU_matrixx"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. MATRIXg.chat_id_ .. '&video=https://t.me/xxvvzm/'..ght..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'التواصل'  then
database:del(bot_id..'Srt:Bot') 
local Text = [[ 
[TWL](t.me/UU_matrixx)
]] 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = ':T::O: :A::S::K:', url="t.me/UU_metoren"}},
 {{text = 'بوت التواصل', url="t.me/uu_mido123BOT"}},
 {{text = 'SOURCE MATRIX', url="t.me/UU_matrixx"}},
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=t.me/UU_matrixx/99&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "نسبه جمالي" or text == "جمالي" then
if Sudo(MATRIXg) then
local function getpro(extra, result, success)
if result.photos_[0] then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_," نسبه جمالك هي 500% \nعشان مطور وكدا لازم اطبله 😹♥\n" )
else
send(MATRIXg.chat_id_, MATRIXg.id_,'لا تمتلك صوره في حسابك', 1, 'md')
  end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = MATRIXg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
else
local function getpro(extra, result, success)
local nspp = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",}
local rdbhoto = nspp[math.random(#nspp)]
if result.photos_[0] then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_," نسبه جمالك هي "..rdbhoto.."🙄♥" )
else
send(MATRIXg.chat_id_, MATRIXg.id_,'لا تمتلك صوره في حسابك', 1, 'md')
  end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = MATRIXg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
end
if text == 'تفعيل نسبه جمالي' and Manager(MATRIXg) then   
if database:get(bot_id..'Cick:lov'..MATRIXg.chat_id_) then
Text = ' ❃∫ تم تفعيل نسبه جمالي'
database:del(bot_id..'Cick:lov'..MATRIXg.chat_id_)  
else
Text = ' ❃∫ بالتاكيد تم تفعيل نسبه جمالي'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل نسبه جمالي' and Manager(MATRIXg) then  
if not database:get(bot_id..'Cick:lov'..MATRIXg.chat_id_) then
database:set(bot_id..'Cick:lov'..MATRIXg.chat_id_,true)  
Text = '\n ❃∫ تم تعطيل نسبه جمالي'
else
Text = '\n ❃∫ بالتاكيد تم تعطيل نسبه جمالي'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == "تويت" or text == "كت تويت" then 
local TWEET_MATRIXg = { 
"مرتبط؟ ", 
" هل بتكراش ع حد في حياتك؟", 
" ينفع نرتبط؟", 
" ممكن توريني صوره بتحبها؟", 
" ممكن نبقي صحااب ع الفيس؟", 
" هل لسه بتحب الاكس؟", 
"عندك كام اكس في حياتك؟ ", 
"ينفع تبعتلي رقمك؟ ", 
" ما تيجي اعزمني ع حاجه بحبها؟", 
"ينفع احضنك؟ ", 
"قولي ع اكبر غلطه ندمان عليهاا؟ ", 
"عندك كام سنه؟ ", 
" عامل بلوك لكام واحد عندك؟", 
" قولي سر محدش يعرفه؟", 
" عندك كام اكس في حياتك؟", 
"بتعرف تقلش وتهزر؟ ", 
" لونك المفضل هو؟", 
" مين أقرب حد ليك الفتره دي ؟", 
" قولي ع اكبر غلطه ندمان عليهاا؟", 
" مين مغنيك المفضل؟", 
" حابب تبقي اي في المستقبل؟", 
"راضي عن حياتك بنسبه كام؟ ", 
"اكتر حاجه بتلفت انتباهك في البنت او الولد؟ ", 
"اي رأيك في صوره البروفايل بتاعتي؟ ", 
" هل باين عليا اني شخص لطيف؟", 
" توافق ترجع للاكس؟", 
"ممكن تضحي بحياتك لمين؟ ", 
"سافرت بلاد برا مصر واي هي؟ ", 
" اي رأيك في صوره البروفايل بتاعتي؟", 
" هل بتعتبر نفسك حلو وبتحب شكلك؟", 
" نفسك تزور انهي بلد في العالم؟", 
" شخصيه ع السوشيال شايف انها مميزه؟", 
"عندك فوبيا من اي؟ ", 
" ممكن تورينا لينك الصراحه؟", 
"عمرك عيطت ع حاجه؟ ", 
" شايف اي أسوأ صفه فيك؟", 
"هل شلت مواد قبل كد وعدت السنه؟ ", 
"بتغير ع الل بتحبهم وبيبان عليك لو غيرت؟ ", 
"معاك كام فلوس دلوقتي؟ ", 
" بتفضل صحابك البنات ولا الولاد؟", 
" مسامح الل ظلمك؟", 
" ممثلك الافضل؟", 
" ممكن تقول رساله لحد مش هيشوفها؟", 
"انت اهلاوي ولا زملكاوي؟ ", 
" اي حيوانك المفضل؟", 
"اخر افلام شاهدتها", 
"بتعرف تكلم لغه تانيه واي هي؟ ", 
"ما هي وظفتك الحياه", 
"اعز اصدقائك ?", 
"اخر اغنية سمعتها ?", 
"تكلم عن نفسك", 
"ليه انت مش سالك", 
"ما هيا عيوب سورس MATRIX؟ ", 
"اخر كتاب قرآته", 
"روايتك المفضله ?", 
"اخر اكله اكلتها", 
"اخر كتاب قرآته", 
"ليه بيبو جدع؟ ", 
"افضل يوم ف حياتك", 
"ليه مضيفتش كل جهاتك", 
"حكمتك ف الحياه", 
"لون عيونك", 
"كتابك المفضل", 
"هوايتك المفضله", 
"علاقتك مع اهلك", 
" ما السيء في هذه الحياة ؟ ", 
"أجمل شيء حصل معك خلال هذا الاسبوع ؟ ", 
"سؤال ينرفزك ؟ ", 
" هل يعجبك سورس MATRIX؟؟ ", 
" اكثر ممثل تحبه ؟ ", 
"قد تخيلت شي في بالك وصار ؟ ", 
"شيء عندك اهم من الناس ؟ ", 
"تفضّل النقاش الطويل او تحب الاختصار ؟ ", 
"وش أخر شي ضيعته؟ ", 
"اي رايك في سورس MATRIX؟ ", 
"كم مره حبيت؟ ", 
" اكثر المتابعين عندك باي برنامج؟", 
" آخر مره ضربت عشره كانت متى ؟", 
" نسبه الندم عندك للي وثقت فيهم ؟", 
"تحب ترتبط بكيرفي ولا فلات؟", 
" جربت شعور احد يحبك بس انت مو قادر تحبه؟", 
" تجامل الناس ولا اللي بقلبك على لسانك؟", 
" عمرك ضحيت باشياء لاجل شخص م يسوى ؟", 
"مغني تلاحظ أن صوته يعجب الجميع إلا أنت؟ ", 
" آخر غلطات عمرك؟ ", 
" مسلسل كرتوني له ذكريات جميلة عندك؟ ", 
" ما أكثر تطبيق تقضي وقتك عليه؟ ", 
" أول شيء يخطر في بالك إذا سمعت كلمة نجوم ؟ ", 
" قدوتك من الأجيال السابقة؟ ", 
" أكثر طبع تهتم بأن يتواجد في شريك/ة حياتك؟ ", 
"أكثر حيوان تخاف منه؟ ", 
" ما هي طريقتك في الحصول على الراحة النفسية؟ ", 
" إيموجي يعبّر عن مزاجك الحالي؟ ", 
" أكثر تغيير ترغب أن تغيّره في نفسك؟ ", 
"أكثر شيء أسعدك اليوم؟ ", 
"اي رايك في الدنيا دي ؟ ", 
"ما هو أفضل حافز للشخص؟ ", 
"ما الذي يشغل بالك في الفترة الحالية؟", 
"آخر شيء ندمت عليه؟ ", 
"شاركنا صورة احترافية من تصويرك؟ ", 
"تتابع انمي؟ إذا نعم ما أفضل انمي شاهدته ", 
"يرد عليك متأخر على رسالة مهمة وبكل برود، موقفك؟ ", 
"نصيحه تبدا ب -لا- ؟ ", 
"كتاب أو رواية تقرأها هذه الأيام؟ ", 
"فيلم عالق في ذهنك لا تنساه مِن روعته؟ ", 
"يوم لا يمكنك نسيانه؟ ", 
"شعورك الحالي في جملة؟ ", 
"كلمة لشخص بعيد؟ ", 
"صفة يطلقها عليك الشخص المفضّل؟ ", 
"أغنية عالقة في ذهنك هاليومين؟ ", 
"أكلة مستحيل أن تأكلها؟ ", 
"كيف قضيت نهارك؟ ", 
"تصرُّف ماتتحمله؟ ", 
"موقف غير حياتك؟ ", 
"اكثر مشروب تحبه؟ ", 
"القصيدة اللي تأثر فيك؟ ", 
"متى يصبح الصديق غريب ", 
"وين نلقى السعاده برايك؟ ", 
"تاريخ ميلادك؟ ", 
"قهوه و لا شاي؟ ", 
"من محبّين الليل أو الصبح؟ ", 
"حيوانك المفضل؟ ", 
"كلمة غريبة ومعناها؟ ", 
"كم تحتاج من وقت لتثق بشخص؟ ", 
"اشياء نفسك تجربها؟ ", 
"يومك ضاع على؟ ", 
"كل شيء يهون الا ؟ ", 
"اسم ماتحبه ؟ ", 
"وقفة إحترام للي إخترع ؟ ", 
"أقدم شيء محتفظ فيه من صغرك؟ ", 
"كلمات ماتستغني عنها بسوالفك؟ ", 
"وش الحب بنظرك؟ ", 
"حب التملك في شخصِيـتك ولا ؟ ", 
"تخطط للمستقبل ولا ؟ ", 
"موقف محرج ماتنساه ؟ ", 
"من طلاسم لهجتكم ؟ ", 
"اعترف باي حاجه ؟ ", 
"عبّر عن مودك بصوره ؟ ",
"آخر مره ضربت عشره كانت متى ؟", 
"اسم دايم ع بالك ؟ ", 
"اشياء تفتخر انك م سويتها ؟ ", 
" لو بكيفي كان ؟ ", 
  "أكثر جملة أثرت بك في حياتك؟ ",
  "إيموجي يوصف مزاجك حاليًا؟ ",
  "أجمل اسم بنت بحرف الباء؟ ",
  "كيف هي أحوال قلبك؟ ",
  "أجمل مدينة؟ ",
  "كيف كان أسبوعك؟ ",
  "شيء تشوفه اكثر من اهلك ؟ ",
  "اخر مره فضفضت؟ ",
  "قد كرهت احد بسبب اسلوبه؟ ",
  "قد حبيت شخص وخذلك؟ ",
  "كم مره حبيت؟ ",
  "اكبر غلطة بعمرك؟ ",
  "نسبة النعاس عندك حاليًا؟ ",
  "شرايكم بمشاهير التيك توك؟ ",
  "ما الحاسة التي تريد إضافتها للحواس الخمسة؟ ",
  "اسم قريب لقلبك؟ ",
  "مشتاق لمطعم كنت تزوره قبل الحظر؟ ",
  "أول شيء يخطر في بالك إذا سمعت كلمة (ابوي يبيك)؟ ",
  "ما أول مشروع تتوقع أن تقوم بإنشائه إذا أصبحت مليونير؟ ",
  "أغنية عالقة في ذهنك هاليومين؟ ",
  "متى اخر مره قريت قرآن؟ ",
  "كم صلاة فاتتك اليوم؟ ",
  "تفضل التيكن او السنقل؟ ",
  "وش أفضل بوت برأيك؟ ",
"كم لك بالتلي؟ ",
"وش الي تفكر فيه الحين؟ ",
"كيف تشوف الجيل ذا؟ ",
"منشن شخص وقوله، تحبني؟ ",
"لو جاء شخص وعترف لك كيف ترده؟ ",
"مر عليك موقف محرج؟ ",
"وين تشوف نفسك بعد سنتين؟ ",
"لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟ ",
"وش اجمل لهجة تشوفها؟ ",
"قد سافرت؟ ",
"افضل مسلسل عندك؟ ",
"افضل فلم عندك؟ ",
"مين اكثر يخون البنات/العيال؟ ",
"متى حبيت؟ ",
  "بالعادة متى تنام؟ ",
  "شيء من صغرك ماتغير فيك؟ ",
  "شيء بسيط قادر يعدل مزاجك بشكل سريع؟ ",
  "تشوف الغيره انانيه او حب؟ ",
"حاجة تشوف نفسك مبدع فيها؟ ",
  "مع او ضد : يسقط جمال المراة بسبب قبح لسانها؟ ",
  "عمرك بكيت على شخص مات في مسلسل ؟ ",
  "‏- هل تعتقد أن هنالك من يراقبك بشغف؟ ",
  "تدوس على قلبك او كرامتك؟ ",
  "اكثر لونين تحبهم مع بعض؟ ",
  "مع او ضد : النوم افضل حل لـ مشاكل الحياة؟ ",
  "سؤال دايم تتهرب من الاجابة عليه؟ ",
  "تحبني ولاتحب الفلوس؟ ",
  "العلاقه السريه دايماً تكون حلوه؟ ",
  "لو أغمضت عينيك الآن فما هو أول شيء ستفكر به؟ ",
"كيف ينطق الطفل اسمك؟ ",
  "ما هي نقاط الضعف في شخصيتك؟ ",
  "اكثر كذبة تقولها؟ ",
  "تيكن ولا اضبطك؟ ",
  "اطول علاقة كنت فيها مع شخص؟ ",
  "قد ندمت على شخص؟ ",
  "وقت فراغك وش تسوي؟ ",
  "عندك أصحاب كثير؟ ولا ينعد بالأصابع؟ ",
  "حاط نغمة خاصة لأي شخص؟ ",
  "وش اسم شهرتك؟ ",
  "أفضل أكلة تحبه لك؟ ",
"عندك شخص تسميه ثالث والدينك؟ ",
  "عندك شخص تسميه ثالث والدينك؟ ",
  "اذا قالو لك تسافر أي مكان تبيه وتاخذ معك شخص واحد وين بتروح ومين تختار؟ ",
  "أطول مكالمة كم ساعة؟ ",
  "تحب الحياة الإلكترونية ولا الواقعية؟ ",
  "كيف حال قلبك ؟ بخير ولا مكسور؟ ",
  "أطول مدة نمت فيها كم ساعة؟ ",
  "تقدر تسيطر على ضحكتك؟ ",
  "أول حرف من اسم الحب؟ ",
  "تحب تحافظ على الذكريات ولا تمسحه؟ ",
  "اسم اخر شخص زعلك؟ ",
"وش نوع الأفلام اللي تحب تتابعه؟ ",
  "أنت انسان غامض ولا الكل يعرف عنك؟ ",
  "لو الجنسية حسب ملامحك وش بتكون جنسيتك؟ ",
  "عندك أخوان او خوات من الرضاعة؟ ",
  "إختصار تحبه؟ ",
  "إسم شخص وتحس أنه كيف؟ ",
  "وش الإسم اللي دايم تحطه بالبرامج؟ ",
  "وش برجك؟ ",
  "لو يجي عيد ميلادك تتوقع يجيك هدية؟ ",
  "اجمل هدية جاتك وش هو؟ ",
  "الصداقة ولا الحب؟ ",
"الصداقة ولا الحب؟ ",
  "الغيرة الزائدة شك؟ ولا فرط الحب؟ ",
  "قد حبيت شخصين مع بعض؟ وانقفطت؟ ",
  "وش أخر شي ضيعته؟ ",
  "قد ضيعت شي ودورته ولقيته بيدك؟ ",
  "تؤمن بمقولة اللي يبيك مايحتار فيك؟ ",
  "سبب وجوك بالتليجرام؟ ",
  "تراقب شخص حاليا؟ ",
  "عندك معجبين ولا محد درا عنك؟ ",
  "لو نسبة جمالك بتكون بعدد شحن جوالك كم بتكون؟ ",
  "أنت محبوب بين الناس؟ ولاكريه؟ ",
"كم عمرك؟ ",
  "لو يسألونك وش اسم امك تجاوبهم ولا تسفل فيهم؟ ",
  "تؤمن بمقولة الصحبة تغنيك الحب؟ ",
  "وش مشروبك المفضل؟ ",
  "قد جربت الدخان بحياتك؟ وانقفطت ولا؟ ",
  "أفضل وقت للسفر؟ الليل ولا النهار؟ ",
  "انت من النوع اللي تنام بخط السفر؟ ",
  "عندك حس فكاهي ولا نفسية؟ ",
  "تبادل الكراهية بالكراهية؟ ولا تحرجه بالطيب؟ ",
  "أفضل ممارسة بالنسبة لك؟ ",
  "لو قالو لك تتخلى عن شي واحد تحبه بحياتك وش يكون؟ ",
"لو احد تركك وبعد فتره يحاول يرجعك بترجع له ولا خلاص؟ ",
  "برأيك كم العمر المناسب للزواج؟ ",
  "اذا تزوجت بعد كم بتخلف عيال؟ ",
  "فكرت وش تسمي أول اطفالك؟ ",
  "من الناس اللي تحب الهدوء ولا الإزعاج؟ ",
  "الشيلات ولا الأغاني؟ ",
  "عندكم شخص مطوع بالعايلة؟ ",
  "تتقبل النصيحة من اي شخص؟ ",
  "اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟ ",
  "جربت شعور احد يحبك بس انت مو قادر تحبه؟ ",
  "دايم قوة الصداقة تكون بإيش؟ ",
"أفضل البدايات بالعلاقة بـ وش؟ ",
  "وش مشروبك المفضل؟ او قهوتك المفضلة؟ ",
  "تحب تتسوق عبر الانترنت ولا الواقع؟ ",
  "انت من الناس اللي بعد ماتشتري شي وتروح ترجعه؟ ",
  "أخر مرة بكيت متى؟ وليش؟ ",
  "عندك الشخص اللي يقلب الدنيا عشان زعلك؟ ",
  "أفضل صفة تحبه بنفسك؟ ",
  "كلمة تقولها للوالدين؟ ",
  "أنت من الناس اللي تنتقم وترد الاذى ولا تحتسب الأجر وتسامح؟ ",
  "كم عدد سنينك بالتليجرام؟ ",
  "تحب تعترف ولا تخبي؟ ",
"انت من الناس الكتومة ولا تفضفض؟ ",
  "أنت بعلاقة حب الحين؟ ",
  "عندك اصدقاء غير جنسك؟ ",
  "أغلب وقتك تكون وين؟ ",
  "لو المقصود يقرأ وش بتكتب له؟ ",
  "تحب تعبر بالكتابة ولا بالصوت؟ ",
  "عمرك كلمت فويس احد غير جنسك؟ ",
  "لو خيروك تصير مليونير ولا تتزوج الشخص اللي تحبه؟ ",
  "لو عندك فلوس وش السيارة اللي بتشتريها؟ ",
  "كم أعلى مبلغ جمعته؟ ",
  "اذا شفت احد على غلط تعلمه الصح ولا تخليه بكيفه؟ ",
"قد جربت تبكي فرح؟ وليش؟ ",
  "تتوقع إنك بتتزوج اللي تحبه؟ ",
  "ما هو أمنيتك؟ ",
  "وين تشوف نفسك بعد خمس سنوات؟ ",
  "هل انت حرامي تويت بتعت بيبو؟ ",
  "لو خيروك تقدم الزمن ولا ترجعه ورا؟ ",
  "لعبة قضيت وقتك فيه بالحجر المنزلي؟ ",
  "تحب تطق الميانة ولا ثقيل؟ ",
  "باقي معاك للي وعدك ما بيتركك؟ ",
  "اول ماتصحى من النوم مين تكلمه؟ ",
  "عندك الشخص اللي يكتب لك كلام كثير وانت نايم؟ ",
  "قد قابلت شخص تحبه؟ وولد ولا بنت؟ ",
   "هل انت تحب بيبو؟ ",
"اذا قفطت احد تحب تفضحه ولا تستره؟ ",
  "كلمة للشخص اللي يسب ويسطر؟ ",
  "آية من القران تؤمن فيه؟ ",
  "تحب تعامل الناس بنفس المعاملة؟ ولا تكون أطيب منهم؟ ",
"حاجة ودك تغيرها هالفترة؟ ",
  "كم فلوسك حاليا وهل يكفيك ام لا؟ ",
  "وش لون عيونك الجميلة؟ ",
  "من الناس اللي تتغزل بالكل ولا بالشخص اللي تحبه بس؟ ",
  "اذكر موقف ماتنساه بعمرك؟ ",
  "وش حاب تقول للاشخاص اللي بيدخل حياتك؟ ",
  "ألطف شخص مر عليك بحياتك؟ ",
   "هل بيبو لطيف؟ ",
"انت من الناس المؤدبة ولا نص نص؟ ",
  "كيف الصيد معاك هالأيام ؟ وسنارة ولاشبك؟ ",
  "لو الشخص اللي تحبه قال بدخل حساباتك بتعطيه ولا تكرشه؟ ",
  "أكثر شي تخاف منه بالحياه وش؟ ",
  "اكثر المتابعين عندك باي برنامج؟ ",
  "متى يوم ميلادك؟ ووش الهدية اللي نفسك فيه؟ ",
  "قد تمنيت شي وتحقق؟ ",
  "قلبي على قلبك مهما صار لمين تقولها؟ ",
  "وش نوع جوالك؟ واذا بتغيره وش بتأخذ؟ ",
  "كم حساب عندك بالتليجرام؟ ",
  "متى اخر مرة كذبت؟ ",
"كذبت في الاسئلة اللي مرت عليك قبل شوي؟ ",
  "تجامل الناس ولا اللي بقلبك على لسانك؟ ",
  "قد تمصلحت مع أحد وليش؟ ",
  "وين تعرفت على الشخص اللي حبيته؟ ",
  "قد رقمت او احد رقمك؟ ",
  "وش أفضل لعبته بحياتك؟ ",
  "أخر شي اكلته وش هو؟ ",
  "حزنك يبان بملامحك ولا صوتك؟ ",
  "لقيت الشخص اللي يفهمك واللي يقرا افكارك؟ ",
  "فيه شيء م تقدر تسيطر عليه ؟ ",
  "منشن شخص متحلطم م يعجبه شيء؟ ",
"اكتب تاريخ مستحيل تنساه ",
  "شيء مستحيل انك تاكله ؟ ",
  "تحب تتعرف على ناس جدد ولا مكتفي باللي عندك ؟ ",
  "انسان م تحب تتعامل معاه ابداً ؟ ",
  "شيء بسيط تحتفظ فيه؟ ",
  "فُرصه تتمنى لو أُتيحت لك ؟ ",
   "لي بيبو ناك اليكس؟ ",
  "شيء مستحيل ترفضه ؟. ",
  "لو زعلت بقوة وش بيرضيك ؟ ",
  "تنام بـ اي مكان ، ولا بس غرفتك ؟ ",
  "ردك المعتاد اذا أحد ناداك ؟ ",
  "مين الي تحب يكون مبتسم دائما ؟ ",
" إحساسك في هاللحظة؟ ",
  "وش اسم اول شخص تعرفت عليه فالتلقرام ؟ ",
  "اشياء صعب تتقبلها بسرعه ؟ ",
  "شيء جميل صار لك اليوم ؟ ",
  "اذا شفت شخص يتنمر على شخص قدامك شتسوي؟ ",
  "يهمك ملابسك تكون ماركة ؟ ",
  "ردّك على شخص قال (أنا بطلع من حياتك)؟. ",
  "مين اول شخص تكلمه اذا طحت بـ مصيبة ؟ ",
  "تشارك كل شي لاهلك ولا فيه أشياء ما تتشارك؟ ",
  "كيف علاقتك مع اهلك؟ رسميات ولا ميانة؟ ",
  "عمرك ضحيت باشياء لاجل شخص م يسوى ؟ ",
"اكتب سطر من اغنية او قصيدة جا فـ بالك ؟ ",
  "شيء مهما حطيت فيه فلوس بتكون مبسوط ؟ ",
  "مشاكلك بسبب ؟ ",
  "نسبه الندم عندك للي وثقت فيهم ؟ ",
  "اول حرف من اسم شخص تقوله? بطل تفكر فيني ابي انام؟ ",
  "اكثر شيء تحس انه مات ف مجتمعنا؟ ",
  "لو صار سوء فهم بينك وبين شخص هل تحب توضحه ولا تخليه كذا  لان مالك خلق توضح ؟ ",
  "كم عددكم بالبيت؟ ",
  "عادي تتزوج من برا القبيلة؟ ",
  "أجمل شي بحياتك وش هو؟ ",
} 
send(MATRIXg.chat_id_, MATRIXg.id_,'['..TWEET_MATRIXg[math.random(#TWEET_MATRIXg)]..']')  
return false 
end
if text == "كتبات" or text == "حكمه" or text == "قصيده" then 
local TWEET_MATRIXg = { 
"‏من ترك أمرهُ لله، أعطاه الله فوق ما يتمنَّاه💙 ", 
"‏من علامات جمال المرأة .. بختها المايل ! ",
"‏ انك الجميع و كل من احتل قلبي🫀🤍",
"‏ ‏ لقد تْعَمقتُ بكَ كَثيراً والمِيمُ لام .♥️",
"‏ ‏ممكن اكون اختارت غلط بس والله حبيت بجد🖇️",
"‏ علينا إحياء زَمن الرّسائل الورقيّة وسط هذه الفوضى الالكترونية العَارمة. 👻💜",
"‏ يجي اي الصاروخ الصيني ده جمب الصاروخ المصري لما بيلبس العبايه السوده.🤩♥️",
"‏ كُنت أرقّ من أن أتحمّل كُل تلك القَسوة من عَينيك .🍍",
"‏أَكَان عَلَيَّ أَنْ أغْرَس انيابي فِي قَلْبِك لتشعر بِي ؟.",
"‏ : كُلما أتبع قلبي يدلني إليك .",
"‏ : أيا ليت من تَهواه العينُ تلقاهُ .",
"‏ ‏: رغبتي في مُعانقتك عميقة جداً .??",
"ويُرهقني أنّي مليء بما لا أستطيع قوله.✨",
"‏ من مراتب التعاسه إطالة الندم ع شيء إنتهى. 👻 ",
"‏ ‏كل العالم يهون بس الدنيا بينا تصفي 💙",
"‏ بعض الاِعتذارات يجب أن تُرفَضّ.",
"‏ ‏تبدأ حياتك محاولاً فهم كل شيء، وتنهيها محاولاً النجاة من كل ما فهمت.",
"‏ إن الأمر ينتهي بِنا إلى أعتياد أي شيء.",
"‏ هل كانت كل الطرق تؤدي إليكِ، أم أنني كنتُ أجعلها كذلك.",
"‏ ‏هَتفضل توآسيهُم وآحد ورآ التآني لكن أنتَ هتتنسي ومحدِش هَيوآسيك.",
"‏ جَبَرَ الله قلوبِكُم ، وقَلبِي .🍫",
"‏ بس لما أنا ببقى فايق، ببقى أبكم له ودان.💖",
"‏ ‏مقدرش عالنسيان ولو طال الزمن 🖤",
"‏ أنا لستُ لأحد ولا احد لي ، أنا إنسان غريب أساعد من يحتاجني واختفي.",
"‏ ‏أحببتك وأنا منطفئ، فما بالك وأنا في كامل توهجي ؟",
"‏ لا تعودني على دفء شمسك، إذا كان في نيتك الغروب .َ",
"‏ وانتهت صداقة الخمس سنوات بموقف.",
"‏ ‏لا تحب أحداً لِدرجة أن تتقبّل أذاه.",
"‏ إنعدام الرّغبة أمام الشّيء الّذي أدمنته ، انتصار.",
"‏مش جايز , ده اكيد التأخير وارهاق القلب ده وراه عوضاً عظيماً !💙 ",
" مش جايز , ده اكيد التأخير وارهاق القلب ده وراه عوضاً عظيماً !💙",
"فـ بالله صبر  وبالله يسر وبالله عون وبالله كل شيئ ♥️. ",
"أنا بعتز بنفسي جداً كصاحب وشايف اللي بيخسرني ، بيخسر أنضف وأجدع شخص ممكن يشوفه . ",
"فجأه جاتلى قافله ‏خلتنى مستعد أخسر أي حد من غير ما أندم عليه . ",
"‏اللهُم قوني بك حين يقِل صبري... ",
"‏يارب سهِل لنا كُل حاجة شايلين هَمها 💙‏ ",
"انا محتاج ايام حلوه بقي عشان مش نافع كدا ! ",
"المشكله مش اني باخد قررات غلط المشكله اني بفكر كويس فيها قبل ما اخدها .. ",
"تخيل وانت قاعد مخنوق كدا بتفكر فالمزاكره اللي مزكرتهاش تلاقي قرار الغاء الدراسه .. ",
" مكانوش يستحقوا المعافرة بأمانه.",
"‏جمل فترة في حياتي، كانت مع اكثر الناس الذين أذتني نفسيًا. ",
" ‏إحنا ليه مبنتحبش يعني فينا اي وحش!",
"أيام مُمله ومستقبل مجهول ونومٌ غير منتظموالأيامُ تمرُ ولا شيَ يتغير ", 
"عندما تهب ريح المصلحه سوف ياتي الجميع رتكدون تحت قدمك ❤️. ",
"عادي مهما تعادي اختك قد الدنيا ف عادي ❤. ",
"بقيت لوحدي بمعنا اي انا اصلا من زمان لوحدي.❤️ ",
"- ‏تجري حياتنا بما لاتشتهي أحلامنا ! ",
"تحملين كل هذا الجمال، ‏ألا تتعبين؟",
"البدايات للكل ، والثبات للصادقين ",
"مُؤخرًا اقتنعت بالجملة دي جدا : Private life always wins. ",
" الافراط في التسامح بيخللي الناس تستهين بيك🍍",
"مهما كنت كويس فـَ إنت معرض لـِ الاستبدال.. ",
"فخوره بنفسي جدًا رغم اني معملتش حاجه فـ حياتي تستحق الذكر والله . ",
"‏إسمها ليلة القدر لأنها تُغير الأقدار ,اللهُمَّ غير قدري لحالٍ تُحبه وعوضني خير .. ",
"فى احتمال كبير انها ليلة القدر ادعوا لنفسكم كتير وأدعو ربنا يشفى كل مريض. 💙 ",
"أنِر ظُلمتي، وامحُ خطيئتي، واقبل توبتي وأعتِق رقبتي يا اللّٰه. إنكَ عفوٌّ تُحِبُّ العفوَ؛ فاعفُ عني 💛 ", 
} 
send(MATRIXg.chat_id_, MATRIXg.id_,'['..TWEET_MATRIXg[math.random(#TWEET_MATRIXg)]..']')  
return false 
end
if text == "انصحني" or text == "انصحنى" or text == "انصح" then 
local TWEET_MATRIXg = { 
"عامل الناس بأخلاقك ولا بأخلاقهم", 
"الجمال يلفت الأنظار لكن الطيبه تلفت القلوب ", 
"الاعتذار عن الأخطاء لا يجرح كرامتك بل يجعلك كبير في نظر الناس ",
"لا ترجي السماحه من بخيل.. فما في البار لظمان ماء",
"لا تحقرون صغيره إن الجبال من الحصي",
"لا تستحي من إعطاء فإن الحرمان أقل منه ", 
"لا تظلم حتى لا تتظلم ",
"لا تقف قصاد الريح ولا تمشي معها ",
"لا تكسب موده التحكم الا بالتعقل",
"لا تمد عينك في يد غيرك ",
"لا تملح الا لمن يستحقاها ويحافظ عليها",
"لا حياه للإنسان بلا نبات",
"لا حياه في الرزق.. ولا شفاعه في الموت",
"كما تدين تدان",
"لا دين لمن لا عهد له ",
"لا سلطان على الدوق فيما يحب أو بكره",
"لا مروه لمن لادين له ",
"لا يدخل الجنه من لايأمن من جازه بوائقه",
"يسروا ولا تعسروا... ويشورا ولا تنفروا",
"يدهم الصدر ما يبني العقل الواسع ",
"أثقل ما يوضع في الميزان يوم القيامة حسن الخلق ",
"أجهل الناس من ترك يقين ما عنده لظن ما عند الناس ",
"أحياناً.. ويصبح الوهم حقيقه ",
"مينفعش تعاتب حد مبيعملش حساب لزعلك عشان متزعلش مرتين . ",
"السفر ومشاهده اماكن مختلفه وجديده ",
"عدم تضيع الفرص واسثمارها لحظه مجبئها ",
" اعطاء الاخرين اكثر من ما يتوقعون",
"معامله الناس بلطف ولكن عدم السماح لاحد بستغالال ذالك ",
"تكوين صدقات جديده مع الحفظ بلاصدقاء القودامي ",
"تعلم اصول المهنه بدلا من تضيع الوقت ف تعلم حيل المهنه ",
"مدح ع الاقل ثلاث اشخاص يوميا ",
"النظر ف عيون الشخاص عند مخاطبتهم ",
"التحلي بلسماح مع الاخرين او النفس ",
"الاكثار من قول كلمه شكرا ",
" مصافحه الاخرين بثبات وقوة ",
"الابتعاد عن المناطق السيئه السمعه لتجنب الاحداث السئه ",
" ادخار 10٪ع الاقل من الدخل",
" تجنب المخاوف من خلال التعلم من تجارب مختلفه",
" الحفاظ ع السمعه لانها اغلي ما يملك الانسان",
" تحويل الاعداء الي اصدقاء من خلال القيام بعمل جيد",
"لا تصدق كل ما تسمعع. ولا تنفق كل ما تمتلك . ولا تنم قدر ما ترغب ",
" اعتني بسمعتك جيدا فستثبت للك الايام انها اغلي ما تملك",
"حين تقول والدتك ستندم ع فعل ذالك ستندم عليه غالبا.. ",
" لا تخش العقبات الكبيره فخلفها تقع الفرص العظيمه",
"قد لا يتطلب الامر اكثر من شخص واحد لقلب حياتك رأس ع عقب ",
"اختر رفيقه حياتك بحرص فهو قرار سيشكل 90٪من سعادتك او بؤسك ",
" اقلب اداءك الاصدقاء بفعل شي جميل ومفجائ لهم",
"حين تدق الفرصه ع باباك ادعوها للبيت ",
"تعلم القواعد جيدا ثن اكسر بعدها ",
"احكم ع نجاحك من خلال قدرتك ع العطاء وليس الاخذ ",
" لا تتجاهل الشيطان مهما بدل ثيابه",
"ركز ع جعل الاشياء افضل وليس اكبر او اعظم ",
"كن سعيد  بما تمتلك واعمل لامتلاك ما تريد ",
"اعط الناس اكثر من ما يتوقعون ",
" لا تكن منشغل لدرجه عدم التعرف ع اصدقاء جدد",
"استحمه يوم العيد يمعفن🤓",
"مش تحب اي حد يقرب منك ",
" خليك مع البت راجل خليك تقيل🥥",
" انصح نفسك بنفسك بمت😆",
" كنت نصحت نفسي ياخويا😹", 
} 
send(MATRIXg.chat_id_, MATRIXg.id_,'['..TWEET_MATRIXg[math.random(#TWEET_MATRIXg)]..']')  
return false 
end
if text == "نكته" or text == "قولي نكته" or text == "عايز اضحك" then 
local TWEET_MATRIXg = { 
" مرة واحد مصري دخل سوبر ماركت في الكويت عشان يشتري ولاعة..    راح عشان يحاسب بيقوله الولاعة ديه بكام؟   قاله دينار..  قاله منا عارف ان هي نار بس بكام 🤓😂", 
"بنت حبت تشتغل مع رئيس عصابة..   شغلها في غسيل الأموال 🤓😂 ", 
"واحد بيشتكي لصاحبه بيقوله أنا مافيش حد بيحبني ولا يفتكرني أبدًا، ومش عارف أعمل إيه.. قاله سهلة.. استلف من الناس فلوس هيسألوا عليك كل يوم! 🤓😂",
"ﻣﺮه واﺣﺪ ﻣﺴﻄﻮل ﻣﺎﺷﻰ ﻓﻰ اﻟﺸﺎرع ﻟﻘﻰ مذﻳﻌﻪ ﺑﺘﻘﻮﻟﻪ ﻟﻮ ﺳﻤﺤﺖ ﻓﻴﻦ اﻟﻘﻤﺮ؟    ﻗﺎﻟﻬﺎ اﻫﻮه..   ﻗﺎﻟﺘﻠﻮ ﻣﺒﺮوك ﻛﺴﺒﺖ ﻋﺸﺮﻳﻦ ﺟﻨﻴﻪ..   ﻗﺎﻟﻬﺎ ﻓﻰ واﺣﺪ ﺗﺎﻧﻰ ﻫﻨﺎك اﻫﻮه. 🤓😂",
"واحده ست سايقه على الجي بي اس..  قالها انحرفي قليلًا..   قلعت الطرحة. 🤓😂 ",
"مرة واحد غبي معاه عربية قديمة جدًا وبيحاول يبيعها وماحدش راضي يشتريها.. راح لصاحبه حكاله المشكلة.. صاحبه قاله عندي لك فكرة جهنمية هاتخليها تتباع الصبح.. أنت تجيب علامة مرسيدس وتحطها عليها. بعد أسبوعين صاحبه شافه صدفة قاله بعت العربية ولا لاء؟ قاله انت  مجنون؟ حد يبيع مرسيدس؟ 🤓😂",
"مره واحد بلديتنا كان بيدق مسمار فى الحائط فالمسمار وقع منه فقال له :تعالى ف مجاش, فقال له: تعالي ف مجاش. فراح بلديتنا رامي على المسمار شوية مسمامير وقال: هاتوه. 🤓😂",
"واحدة عملت حساب وهمي ودخلت تكلم جوزها منه.. ومبسوطة أوي وبتضحك.. سألوها بتضحكي على إيه؟ قالت لهم أول مرة يقول لي كلام حلو من ساعة ما اتجوزنا. 🤓??",
"بنت حبت تشتغل مع رئيس عصابة..   شغلها في غسيل الأموال 🤓😂",
"مره واحد اشترى فراخ..   علشان يربيها فى قفص صدره.🤓😂",
"مرة واحد من الفيوم مات..   أهله صوصوا عليه.🤓😂",
"ﻣﺮه واﺣﺪ ﻣﺴﻄﻮل ﻣﺎﺷﻰ ﻓﻰ اﻟﺸﺎرع ﻟﻘﻰ مذﻳﻌﻪ ﺑﺘﻘﻮﻟﻪ ﻟﻮ ﺳﻤﺤﺖ ﻓﻴﻦ اﻟﻘﻤﺮ؟    ﻗﺎﻟﻬﺎ اﻫﻮه..   ﻗﺎﻟﺘﻠﻮ ﻣﺒﺮوك ﻛﺴﺒﺖ ﻋﺸﺮﻳﻦ ﺟﻨﻴﻪ..   ﻗﺎﻟﻬﺎ ﻓﻰ واﺣﺪ ﺗﺎﻧﻰ ﻫﻨﺎك اﻫﻮه.🤓😂",
"مره واحد شاط كرة فى المقص..   اتخرمت. 🤓😂",
"مرة واحد رايح لواحد صاحبه.. فا البواب وقفه بيقول له انت طالع لمين.. قاله طالع أسمر شوية لبابايا.. قاله يا أستاذ طالع لمين في العماره 🤓😂",
} 
send(MATRIXg.chat_id_, MATRIXg.id_,'['..TWEET_MATRIXg[math.random(#TWEET_MATRIXg)]..']')  
return false 
end
if text == "خيرني" or text == "لو خيروك" or text == "خيروك" then 
local TWEET_MATRIXg = { 
"لو خيروك |  بين الإبحار لمدة أسبوع كامل أو السفر على متن طائرة لـ 3 أيام متواصلة؟ ",
"لو خيروك |  بين شراء منزل صغير أو استئجار فيلا كبيرة بمبلغ معقول؟ ",
"لو خيروك |  أن تعيش قصة فيلم هل تختار الأكشن أو الكوميديا؟ ",
"لو خيروك |  بين تناول البيتزا وبين الآيس كريم وذلك بشكل دائم؟ ",
"لو خيروك |  بين إمكانية تواجدك في الفضاء وبين إمكانية تواجدك في البحر؟ ",
"لو خيروك |  بين تغيير وظيفتك كل سنة أو البقاء بوظيفة واحدة طوال حياتك؟ ",
"لو خيروك |  أسئلة محرجة أسئلة صراحة ماذا ستختار؟ ",
"لو خيروك |  بين الذهاب إلى الماضي والعيش مع جدك أو بين الذهاب إلى المستقبل والعيش مع أحفادك؟ ",
"لو كنت شخص آخر هل تفضل البقاء معك أم أنك ستبتعد عن نفسك؟ ",
"لو خيروك |  بين الحصول على الأموال في عيد ميلادك أو على الهدايا؟ ",
"لو خيروك |  بين القفز بمظلة من طائرة أو الغوص في أعماق البحر؟ ",
"لو خيروك |  بين الاستماع إلى الأخبار الجيدة أولًا أو الاستماع إلى الأخبار السيئة أولًا؟ ",
"لو خيروك |  بين أن تكون رئيس لشركة فاشلة أو أن تكون موظف في شركة ناجحة؟ ",
"لو خيروك |  بين أن يكون لديك جيران صاخبون أو أن يكون لديك جيران فضوليون؟ ",
"لو خيروك |  بين أن تكون شخص مشغول دائمًا أو أن تكون شخص يشعر بالملل دائمًا؟ ",
"لو خيروك |  بين قضاء يوم كامل مع الرياضي الذي تشجعه أو نجم السينما الذي تحبه؟ ",
"لو خيروك |  بين استمرار فصل الشتاء دائمًا أو بقاء فصل الصيف؟ ",
"لو خيروك |  بين العيش في القارة القطبية أو العيش في الصحراء؟ ",
"لو خيروك |  بين أن تكون لديك القدرة على حفظ كل ما تسمع أو تقوله وبين القدرة على حفظ كل ما تراه أمامك؟ ",
"لو خيروك |  بين أن يكون طولك 150 سنتي متر أو أن يكون 190 سنتي متر؟ ",
"لو خيروك |  بين إلغاء رحلتك تمامًا أو بقائها ولكن فقدان الأمتعة والأشياء الخاص بك خلالها؟ ",
"لو خيروك |  بين أن تكون اللاعب الأفضل في فريق كرة فاشل أو أن تكون لاعب عادي في فريق كرة ناجح؟ ",
"لو خيروك |  بين ارتداء ملابس البيت لمدة أسبوع كامل أو ارتداء البدلة الرسمية لنفس المدة؟ ",
"لو خيروك |  بين امتلاك أفضل وأجمل منزل ولكن في حي سيء أو امتلاك أسوأ منزل ولكن في حي جيد وجميل؟ ",
"لو خيروك |  بين أن تكون غني وتعيش قبل 500 سنة، أو أن تكون فقير وتعيش في عصرنا الحالي؟ ",
"لو خيروك |  بين ارتداء ملابس الغوص ليوم كامل والذهاب إلى العمل أو ارتداء ملابس جدك/جدتك؟ ",
"لو خيروك |  بين قص شعرك بشكل قصير جدًا أو صبغه باللون الوردي؟ ",
"لو خيروك |  بين أن تضع الكثير من الملح على كل الطعام بدون علم أحد، أو أن تقوم بتناول شطيرة معجون أسنان؟ ",
"لو خيروك |  بين قول الحقيقة والصراحة الكاملة مدة 24 ساعة أو الكذب بشكل كامل مدة 3 أيام؟ ",
"لو خيروك |  بين تناول الشوكولا التي تفضلها لكن مع إضافة رشة من الملح والقليل من عصير الليمون إليها أو تناول ليمونة كاملة كبيرة الحجم؟ ",
"لو خيروك |  بين وضع أحمر الشفاه على وجهك ما عدا شفتين أو وضع ماسكارا على شفتين فقط؟ ",
"لو خيروك |  بين الرقص على سطح منزلك أو الغناء على نافذتك؟ ",
"لو خيروك |  بين تلوين شعرك كل خصلة بلون وبين ارتداء ملابس غير متناسقة لمدة أسبوع؟ ",
"لو خيروك |  بين تناول مياه غازية مجمدة وبين تناولها ساخنة؟ ",
"لو خيروك |  بين تنظيف شعرك بسائل غسيل الأطباق وبين استخدام كريم الأساس لغسيل الأطباق؟ ",
"لو خيروك |  بين تزيين طبق السلطة بالبرتقال وبين إضافة البطاطا لطبق الفاكهة؟ ",
"لو خيروك |  بين اللعب مع الأطفال لمدة 7 ساعات أو الجلوس دون فعل أي شيء لمدة 24 ساعة؟ ",
"لو خيروك |  بين شرب كوب من الحليب أو شرب كوب من شراب عرق السوس؟ ",
"لو خيروك |  بين الشخص الذي تحبه وصديق الطفولة؟ ",
"لو خيروك |  بين أمك وأبيك؟ ",
"لو خيروك |  بين أختك وأخيك؟ ",
"لو خيروك |  بين نفسك وأمك؟ ",
"لو خيروك |  بين صديق قام بغدرك وعدوك؟ ",
"لو خيروك |  بين خسارة حبيبك/حبيبتك أو خسارة أخيك/أختك؟ ",
"لو خيروك |  بإنقاذ شخص واحد مع نفسك بين أمك أو ابنك؟ ",
"لو خيروك |  بين ابنك وابنتك؟ ",
"لو خيروك |  بين زوجتك وابنك/ابنتك؟ ",
"لو خيروك |  بين جدك أو جدتك؟ ",
"لو خيروك |  بين زميل ناجح وحده أو زميل يعمل كفريق؟ ",
"لو خيروك |  بين لاعب كرة قدم مشهور أو موسيقي مفضل بالنسبة لك؟ ",
"لو خيروك |  بين مصور فوتوغرافي جيد وبين مصور سيء ولكنه عبقري فوتوشوب؟ ",
"لو خيروك |  بين سائق سيارة يقودها ببطء وبين سائق يقودها بسرعة كبيرة؟ ",
"لو خيروك |  بين أستاذ اللغة العربية أو أستاذ الرياضيات؟ ",
"لو خيروك |  بين أخيك البعيد أو جارك القريب؟ ",
"لو خيروك |  يبن صديقك البعيد وبين زميلك القريب؟ ",
"لو خيروك |  بين رجل أعمال أو أمير؟ ",
"لو خيروك |  بين نجار أو حداد؟ ",
"لو خيروك |  بين طباخ أو خياط؟ ",
"لو خيروك |  بين أن تكون كل ملابس بمقاس واحد كبير الحجم أو أن تكون جميعها باللون الأصفر؟ ",
"لو خيروك |  بين أن تتكلم بالهمس فقط طوال الوقت أو أن تصرخ فقط طوال الوقت؟ ",
"لو خيروك |  بين أن تمتلك زر إيقاف موقت للوقت أو أن تمتلك أزرار للعودة والذهاب عبر الوقت؟ ",
"لو خيروك |  بين أن تعيش بدون موسيقى أبدًا أو أن تعيش بدون تلفاز أبدًا؟ ",
"لو خيروك |  بين أن تعرف متى سوف تموت أو أن تعرف كيف سوف تموت؟ ",
"لو خيروك |  بين العمل الذي تحلم به أو بين إيجاد شريك حياتك وحبك الحقيقي؟ ",
"لو خيروك |  بين معاركة دب أو بين مصارعة تمساح؟ ",
"لو خيروك |  بين إما الحصول على المال أو على المزيد من الوقت؟ ",
"لو خيروك |  بين امتلاك قدرة التحدث بكل لغات العالم أو التحدث إلى الحيوانات؟ ",
"لو خيروك |  بين أن تفوز في اليانصيب وبين أن تعيش مرة ثانية؟ ",
"لو خيروك |  بأن لا يحضر أحد إما لحفل زفافك أو إلى جنازتك؟ ",
"لو خيروك |  بين البقاء بدون هاتف لمدة شهر أو بدون إنترنت لمدة أسبوع؟ ",
"لو خيروك |  بين العمل لأيام أقل في الأسبوع مع زيادة ساعات العمل أو العمل لساعات أقل في اليوم مع أيام أكثر؟ ",
"لو خيروك |  بين مشاهدة الدراما في أيام السبعينيات أو مشاهدة الأعمال الدرامية للوقت الحالي؟ ",
"لو خيروك |  بين التحدث عن كل شيء يدور في عقلك وبين عدم التحدث إطلاقًا؟ ",
"لو خيروك |  بين مشاهدة فيلم بمفردك أو الذهاب إلى مطعم وتناول العشاء بمفردك؟ ",
"لو خيروك |  بين قراءة رواية مميزة فقط أو مشاهدتها بشكل فيلم بدون القدرة على قراءتها؟ ",
"لو خيروك |  بين أن تكون الشخص الأكثر شعبية في العمل أو المدرسة وبين أن تكون الشخص الأكثر ذكاءً؟ ",
"لو خيروك |  بين إجراء المكالمات الهاتفية فقط أو إرسال الرسائل النصية فقط؟ ",
"لو خيروك |  بين إنهاء الحروب في العالم أو إنهاء الجوع في العالم؟ ",
"لو خيروك |  بين تغيير لون عينيك أو لون شعرك؟ ",
"لو خيروك |  بين امتلاك كل عين لون وبين امتلاك نمش على خديك؟ ",
"لو خيروك |  بين الخروج بالمكياج بشكل مستمر وبين الحصول على بشرة صحية ولكن لا يمكن لك تطبيق أي نوع من المكياج؟ ",
"لو خيروك |  بين أن تصبحي عارضة أزياء وبين ميك آب أرتيست؟ ",
"لو خيروك |  بين مشاهدة كرة القدم أو متابعة الأخبار؟ ",
"لو خيروك |  بين موت شخصية بطل الدراما التي تتابعينها أو أن يبقى ولكن يكون العمل الدرامي سيء جدًا؟ ",
"لو خيروك |  بين العيش في دراما قد سبق وشاهدتها ماذا تختارين بين الكوميديا والتاريخي؟ ",
"لو خيروك |  بين امتلاك القدرة على تغيير لون شعرك متى تريدين وبين الحصول على مكياج من قبل خبير تجميل وذلك بشكل يومي؟ ",
"لو خيروك |  بين نشر تفاصيل حياتك المالية وبين نشر تفاصيل حياتك العاطفية؟ ",
"لو خيروك |  بين البكاء والحزن وبين اكتساب الوزن؟ ",
"لو خيروك |  بين تنظيف الأطباق كل يوم وبين تحضير الطعام؟ ",
"لو خيروك |  بين أن تتعطل سيارتك في نصف الطريق أو ألا تتمكنين من ركنها بطريقة صحيحة؟ ",
"لو خيروك |  بين إعادة كل الحقائب التي تملكينها أو إعادة الأحذية الجميلة الخاصة بك؟ ",
"لو خيروك |  بين قتل حشرة أو متابعة فيلم رعب؟ ",
"لو خيروك |  بين امتلاك قطة أو كلب؟ ",
"لو خيروك |  بين الصداقة والحب ",
"لو خيروك |  بين تناول الشوكولا التي تحبين طوال حياتك ولكن لا يمكنك الاستماع إلى الموسيقى وبين الاستماع إلى الموسيقى ولكن لا يمكن لك تناول الشوكولا أبدًا؟ ",
"لو خيروك |  بين مشاركة المنزل مع عائلة من الفئران أو عائلة من الأشخاص المزعجين الفضوليين الذين يتدخلون في كل كبيرة وصغيرة؟ ",
} 
send(MATRIXg.chat_id_, MATRIXg.id_,'['..TWEET_MATRIXg[math.random(#TWEET_MATRIXg)]..']')  
return false 
end
if text == "حروف" or text == "حرف" or text == "الحروف" then 
local TWEET_MATRIXg = { 
" جماد بحرف ⇇ر  ", 
" مدينة بحرف ⇇ع  ",
" حيوان ونبات بحرف ⇇خ  ", 
" اسم بحرف ⇇ح  ", 
" اسم ونبات بحرف ⇇م  ", 
" دولة عربية بحرف ⇇ق  ", 
" جماد بحرف ⇇ي  ", 
" نبات بحرف ⇇ج  ", 
" اسم بنت بحرف ⇇ع  ", 
" اسم ولد بحرف ⇇ع  ", 
" اسم بنت وولد بحرف ⇇ث  ", 
" جماد بحرف ⇇ج  ",
" حيوان بحرف ⇇ص  ",
" دولة بحرف ⇇س  ",
" نبات بحرف ⇇ج  ",
" مدينة بحرف ⇇ب  ",
" نبات بحرف ⇇ر  ",
" اسم بحرف ⇇ك  ",
" حيوان بحرف ⇇ظ  ",
" جماد بحرف ⇇ذ  ",
" مدينة بحرف ⇇و  ",
" اسم بحرف ⇇م  ",
" اسم بنت بحرف ⇇خ  ",
" اسم و نبات بحرف ⇇ر  ",
" نبات بحرف ⇇و  ",
" حيوان بحرف ⇇س  ",
" مدينة بحرف ⇇ك  ",
" اسم بنت بحرف ⇇ص  ",
" اسم ولد بحرف ⇇ق  ",
" نبات بحرف ⇇ز  ",
"  جماد بحرف ⇇ز  ",
"  مدينة بحرف ⇇ط  ",
"  جماد بحرف ⇇ن  ",
"  مدينة بحرف ⇇ف  ",
"  حيوان بحرف ⇇ض  ",
"  اسم بحرف ⇇ك  ",
"  نبات و حيوان و مدينة بحرف ⇇س  ", 
"  اسم بنت بحرف ⇇ج  ", 
"  مدينة بحرف ⇇ت  ", 
"  جماد بحرف ⇇ه  ", 
"  اسم بنت بحرف ⇇ر  ", 
" اسم ولد بحرف ⇇خ  ", 
" جماد بحرف ⇇ع  ",
" حيوان بحرف ⇇ح  ",
" نبات بحرف ⇇ف  ",
" اسم بنت بحرف ⇇غ  ",
" اسم ولد بحرف ⇇و  ",
" نبات بحرف ⇇ل  ",
"مدينة بحرف ⇇ع  ",
"دولة واسم بحرف ⇇ب  ",
} 
send(MATRIXg.chat_id_, MATRIXg.id_,'['..TWEET_MATRIXg[math.random(#TWEET_MATRIXg)]..']')  
return false 
end

if text and text:match('^الحساب (%d+)$') then
local id = text:match('^الحساب (%d+)$')
local text = 'اضغط لمشاهده الحساب'
tdcli_function ({ID="SendMessage", chat_id_=MATRIXg.chat_id_, reply_to_message_id_=MATRIXg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
end
local function oChat(chat_id,cb)
tdcli_function ({
ID = "OpenChat",
chat_id_ = chat_id
}, cb, nil)
end
if text and text:match("^كشف (.*)$") then 
local userid = text:match("^كشف (.*)$") 
function start_function(extra, result, success) 
if userid then 
tdcli_function ({ID = "GetUser",user_id_ = userid},function(extra,data)  
local rtp = Rutba(userid,MATRIXg.chat_id_) 
local username = ('[@'..data.username_..']' or 'لا يوجد') 
local iduser = userid 
send(MATRIXg.chat_id_, MATRIXg.id_,'  👻الايدي ⇇↝'..iduser..'↜\n 👻المعرف ⇇↝'..username..'↜\n 👻الرتبه ⇇↝'..rtp..'↜\n 👻نوع الكشف ⇇بالمعرف') 
end,nil) 
else 
send(MATRIXg.chat_id_, MATRIXg.id_,'  👻المعرف غير صحيح') 
end 
end 
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil) 
end
if text == 'سورس MATRIX' then
local Text = [[ 
 👻من أحسن السورسات على التليجرام سورس MATRIX 👻
حمايه.سرعه.دقه وامان
 قناه السورس 👇
  [◐W𝙴𝙻𝙲𝙾𝙼𝙴 𝚃𝙾 𝚂𝙾𝚄𝚁𝙲𝙴 MATRIX☏](http://t.me/UU_matrixx)
]]
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '⁽♔₎𝚂𝙾𝚄𝚁𝙲𝙴 MATRIX|🌺 ', url="t.me/UU_matrixx"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. MATRIXg.chat_id_ .. '&video=t.me/UU_matrixx/99&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'MATRIX' then
local Text = [[ 
 👻من أحسن السورسات على التليجرام سورس MATRIX 👻
بجد سورس أمان جدا وفي مميزات جامده
تع نصب بوتك عندنا لو محظور
خش علي تواصل هيدخلك قناه اليوزرات تواصل معنا 💛. 
]]
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. MATRIXg.chat_id_ .. '&video=t.me/UU_matrixx/99&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'العاب MATRIX' or text == 'العاب مطوره' or text == 'العاب متطوره' then  
local Text = [[  
 👻 اهلا في قائمه الالعاب المتطوره سورس MATRIX 👻 
تفضل اختر لعبه من القائمه 
]]  
keyboard = {}   
keyboard.inline_keyboard = {  
{{text = 'فلابي بيرد', url="https://t.me/awesomebot?game=FlappyBird"},{text = 'تحداني فالرياضيات',url="https://t.me/gamebot?game=MathBattle"}},   
{{text = 'لعبه دراجات', url="https://t.me/gamee?game=MotoFX"},{text = 'سباق سيارات', url="https://t.me/gamee?game=F1Racer"}}, 
{{text = 'تشابه', url="https://t.me/gamee?game=DiamondRows"},{text = 'كره القدم', url="https://t.me/gamee?game=FootballStar"}}, 
{{text = 'ورق', url="https://t.me/gamee?game=Hexonix"},{text = 'لعبه 2048', url="https://t.me/awesomebot?game=g2048"}}, 
{{text = 'SQUARES', url="https://t.me/gamee?game=Squares"},{text = 'ATOMIC', url="https://t.me/gamee?game=AtomicDrop1"}}, 
{{text = 'CORSAIRS', url="https://t.me/gamebot?game=Corsairs"},{text = 'LumberJack', url="https://t.me/gamebot?game=LumberJack"}}, 
{{text = 'LittlePlane', url="https://t.me/gamee?game=LittlePlane"},{text = 'RollerDisco', url="https://t.me/gamee?game=RollerDisco"}},  
{{text = 'كره القدم 2', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'جمع المياه', url="https://t.me/gamee?game=BlockBuster"}},  
{{text = 'لا تجعلها تسقط', url="https://t.me/gamee?game=Touchdown"},{text = 'GravityNinja', url="https://t.me/gamee?game=GravityNinjaEmeraldCity"}},  
{{text = 'Astrocat', url="https://t.me/gamee?game=Astrocat"},{text = 'Skipper', url="https://t.me/gamee?game=Skipper"}},  
{{text = 'WorldCup', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'GeometryRun', url="https://t.me/gamee?game=GeometryRun"}},  
{{text = 'Ten2One', url="https://t.me/gamee?game=Ten2One"},{text = 'NeonBlast2', url="https://t.me/gamee?game=NeonBlast2"}},  
{{text = 'Paintio', url="https://t.me/gamee?game=Paintio"},{text = 'onetwothree', url="https://t.me/gamee?game=onetwothree"}},  
{{text = 'BrickStacker', url="https://t.me/gamee?game=BrickStacker"},{text = 'StairMaster3D', url="https://t.me/gamee?game=StairMaster3D"}},  
{{text = 'LoadTheVan', url="https://t.me/gamee?game=LoadTheVan"},{text = 'BasketBoyRush', url="https://t.me/gamee?game=BasketBoyRush"}},  
{{text = 'GravityNinja21', url="https://t.me/gamee?game=GravityNinja21"},{text = 'MarsRover', url="https://t.me/gamee?game=MarsRover"}},  
{{text = 'LoadTheVan', url="https://t.me/gamee?game=LoadTheVan"},{text = 'GroovySki', url="https://t.me/gamee?game=GroovySki"}},  
{{text = 'PaintioTeaMATRIX', url="https://t.me/gamee?game=PaintioTeaMATRIX"},{text = 'KeepItUp', url="https://t.me/gamee?game=KeepItUp"}},  
{{text = 'SunshineSolitaire', url="https://t.me/gamee?game=SunshineSolitaire"},{text = 'Qubo', url="https://t.me/gamee?game=Qubo"}},  
{{text = 'PenaltyShooter2', url="https://t.me/gamee?game=PenaltyShooter2"},{text = 'Getaway', url="https://t.me/gamee?game=Getaway"}},  
{{text = 'PaintioTeaMATRIX', url="https://t.me/gamee?game=PaintioTeaMATRIX"},{text = 'SpikyFish2', url="https://t.me/gamee?game=SpikyFish2"}},  
{{text = 'GroovySki', url="https://t.me/gamee?game=GroovySki"},{text = 'KungFuInc', url="https://t.me/gamee?game=KungFuInc"}},  
{{text = 'SpaceTraveler', url="https://t.me/gamee?game=SpaceTraveler"},{text = 'RedAndBlue', url="https://t.me/gamee?game=RedAndBlue"}},  
{{text = 'SkodaHockey1 ', url="https://t.me/gamee?game=SkodaHockey1"},{text = 'SummerLove', url="https://t.me/gamee?game=SummerLove"}},  
{{text = 'SmartUpShark', url="https://t.me/gamee?game=SmartUpShark"},{text = 'SpikyFish3', url="https://t.me/gamee?game=SpikyFish3"}},  
{{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"}},
}  
local MATRIXg_id = MATRIXg.id_/2097152/0.5  
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=https://t.me/vagwg/6&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--------------------------------------------------------------------------------------------------------------
if text == ("انذار") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) and not database:get(bot_id..'NightRang:inthar:group'..MATRIXg.chat_id_) then
function FunctionStatus(arg, result)
if Can_or_NotCan(result.sender_user_id_, MATRIXg.chat_id_) == true then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 عذرا لا تستطيع حظر ( '..Rutba(result.sender_user_id_,MATRIXg.chat_id_)..' )')
end
local numinthar = tonumber(database:get(bot_id.."NightRang:inthar"..MATRIXg.chat_id_..result.sender_user_id_) or 0)
if numinthar == 0 then
database:set(bot_id.."NightRang:inthar"..MATRIXg.chat_id_..result.sender_user_id_,'1')
send(MATRIXg,result.id_,"reply","تم اعطائه انذار \n تبقى له انذارين ويتم كتمه")  
elseif numinthar == 1 then
send(MATRIXg,result.id_,"reply","تم اعطائه انذار \n تبقى له انذار و يتم كتمه")  
database:set(bot_id.."NightRang:inthar"..MATRIXg.chat_id_..result.sender_user_id_,'2')
elseif numinthar == 2 then
send(MATRIXg,result.id_,"reply","تم كتمه \n لانه تجاوز حد 3 انذارات")  
database:del(bot_id.."NightRang:inthar"..MATRIXg.chat_id_..result.sender_user_id_)
database:sadd(bot_id.."Muted:User"..MATRIXg.chat_id_, result.sender_user_id_)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, FunctionStatus, nil)
end
if text and text:match("^انذار @(.*)$") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) and not database:get(bot_id..'NightRang:inthar:group'..MATRIXg.chat_id_) then
local username = text:match("^انذار @(.*)$")
function FunctionStatus(arg, result)
if Can_or_NotCan(result.sender_user_id_, MATRIXg.chat_id_) == true then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 عذرا لا تستطيع حظر ( '..Rutba(result.sender_user_id_,MATRIXg.chat_id_)..' )')
end
local numinthar = tonumber(database:get(bot_id.."NightRang:inthar"..MATRIXg.chat_id_..result.sender_user_id_) or 0)
if numinthar == 0 then
database:set(bot_id.."NightRang:inthar"..MATRIXg.chat_id_..result.sender_user_id_,'1')
send(MATRIXg,result.id_,"reply","تم اعطائه انذار \n تبقى له انذارين ويتم كتمه")  
elseif numinthar == 1 then
send(MATRIXg,result.id_,"reply","تم اعطائه انذار \n تبقى له انذار و يتم كتمه")  
database:set(bot_id.."NightRang:inthar"..MATRIXg.chat_id_..result.sender_user_id_,'2')
elseif numinthar == 2 then
send(MATRIXg,result.id_,"reply","تم كتمه \n لانه تجاوز حد 3 انذارات")  
database:del(bot_id.."NightRang:inthar"..MATRIXg.chat_id_..result.sender_user_id_)
database:sadd(bot_id.."Muted:User"..MATRIXg.chat_id_, result.sender_user_id_)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, FunctionStatus, nil)
end
if text and text:match("^انذار (%d+)$") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) and not database:get(bot_id..'NightRang:inthar:group'..MATRIXg.chat_id_) then
local userid = text:match("^انذار (%d+)$")
function FunctionStatus(arg, result)
if Can_or_NotCan(result.sender_user_id_, MATRIXg.chat_id_) == true then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 عذرا لا تستطيع حظر ( '..Rutba(result.sender_user_id_,MATRIXg.chat_id_)..' )')
end
local numinthar = tonumber(database:get(bot_id.."NightRang:inthar"..MATRIXg.chat_id_..result.sender_user_id_) or 0)
if numinthar == 0 then
database:set(bot_id.."NightRang:inthar"..MATRIXg.chat_id_..result.sender_user_id_,'1')
send(MATRIXg,result.id_,"reply","تم اعطائه انذار \n تبقى له انذارين ويتم كتمه")  
elseif numinthar == 1 then
send(MATRIXg,result.id_,"reply","تم اعطائه انذار \n تبقى له انذار و يتم كتمه")  
database:set(bot_id.."NightRang:inthar"..MATRIXg.chat_id_..result.sender_user_id_,'2')
elseif numinthar == 2 then
send(MATRIXg,result.id_,"reply","تم كتمه \n لانه تجاوز حد 3 انذارات")  
database:del(bot_id.."NightRang:inthar"..MATRIXg.chat_id_..result.sender_user_id_)
database:sadd(bot_id.."Muted:User"..MATRIXg.chat_id_, result.sender_user_id_)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, FunctionStatus, nil)
end
if Chat_Type == 'GroupBot' and ChekAdd(MATRIXg.chat_id_) == true then
if text == 'رفع النسخه' and DevSoFi(MATRIXg) then   
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if tonumber(MATRIXg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile_Bot(MATRIXg,MATRIXg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = MATRIXg.chat_id_, message_id_ = tonumber(MATRIXg.reply_to_message_id_) }, by_reply, nil)
end
end

if text == 'جلب النسخه' and DevSoFi(MATRIXg) then 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
GetFile_Bot(MATRIXg)
end
if text == 'الاوامر المضافه' and Constructor(MATRIXg) then
local list = database:smembers(bot_id..'List:Cmd:Group:New'..MATRIXg.chat_id_..'')
t = " 👻 قائمه الاوامر المضافه  \n??━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
Cmds = database:get(bot_id.."Set:Cmd:Group:New1"..MATRIXg.chat_id_..':'..v)
print(Cmds)
if Cmds then 
t = t..""..k..">> ↝ '..v..' ↜  ⇇{"..Cmds.."}\n"
else
t = t..""..k..">> ↝ '..v..' ↜ \n"
end
end
if #list == 0 then
t = " 👻 لا يوجد اوامر مضافه"
end
send(MATRIXg.chat_id_, MATRIXg.id_,'['..t..']')
end
if text == 'مسح الاوامر المضافه' or text == 'مسح الاوامر المضافه' then
if Constructor(MATRIXg) then 
local list = database:smembers(bot_id..'List:Cmd:Group:New'..MATRIXg.chat_id_)
for k,v in pairs(list) do
database:del(bot_id.."Set:Cmd:Group:New1"..MATRIXg.chat_id_..':'..v)
database:del(bot_id..'List:Cmd:Group:New'..MATRIXg.chat_id_)
end
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم ازالة جميع الاوامر المضافه')  
end
end
if text == 'اضف امر' and Constructor(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت يرجى الاشتراك في القناة حتى تتمكن من استخدام الاوامر \n ??| اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Set:Cmd:Group"..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_,'true') 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ارسل الامر القديم')  
return false
end
if text == 'مسح امر' or text == 'مسح امر' then 
if Constructor(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Del:Cmd:Group"..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_,'true') 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ارسل الامر الذي قمت بوضعه بدلا عن القديم')  
return false
end
end
if text and database:get(bot_id.."Set:Cmd:Group"..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) == 'true' then
database:set(bot_id.."Set:Cmd:Group:New"..MATRIXg.chat_id_,text)
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ارسل الامر الجديد')  
database:del(bot_id.."Set:Cmd:Group"..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_)
database:set(bot_id.."Set:Cmd:Group1"..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_,'true1') 
return false
end
if text and database:get(bot_id.."Set:Cmd:Group1"..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) == 'true1' then
local NewCmd = database:get(bot_id.."Set:Cmd:Group:New"..MATRIXg.chat_id_)
database:set(bot_id.."Set:Cmd:Group:New1"..MATRIXg.chat_id_..':'..text,NewCmd)
database:sadd(bot_id.."List:Cmd:Group:New"..MATRIXg.chat_id_,text)
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم حفظ الامر')  
database:del(bot_id.."Set:Cmd:Group1"..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_)
return false
end
--------------------------------------------------------------------------------------------------------------
if text == "المطور" or text == "مطور" then
local TEXT_SUD = database:get(bot_id..'Tshake:TEXT_SUDO')
if TEXT_SUDO then 
send(MATRIXg.chat_id_, MATRIXg.id_,TEXT_SUDO)
else
tdcli_function ({ID = "GetUser",user_id_ = SUDO,},function(arg,result) 
local function taha(extra, taha, success)
if taha.photos_[0] then
local Name = '[《⬇️اتبع الازرار للتواصل مع》](t.me/UU_matrixx)\n['..result.first_name_..'](tg://user?id='..result.id_..')\n'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ''..result.first_name_..'', url = "https://t.me/"..result.username_..""},
},
{
{text = 'اضف البوت الي مجموعتك ↯' ,url="t.me/"..dofile("./kkkklInfo.lua").botUserName.."?startgroup=start"},
},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id='..MATRIXg.chat_id_..'&caption='..URL.escape(Name)..'&photo='..taha.photos_[0].sizes_[1].photo_.persistent_id_..'&reply_to_message_id='..MATRIXg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else
sendText(MATRIXg.chat_id_,Name,MATRIXg.id_/2097152/0.5,'md')
 end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = SUDO, offset_ = 0, limit_ = 1 }, taha, nil)
end,nil)
end
end
if text == "غنيلي" and not  database:get(bot_id.."sing:for:me"..MATRIXg.chat_id_) then 
ght = math.random(3,200); 
local Text ='تم اختيار المقطع الصوتي لك' 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"}}, 
{{text = 'اضف البوت الي مجموعتك' ,url="t.me/"..dofile("./kkkklInfo.lua").botUserName.."?startgroup=start"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendVoice?chat_id=' .. MATRIXg.chat_id_ .. '&voice=https://t.me/Ccckkc/'..ght..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
end
if text == "ثيم" then  
ght = math.random(1,33);  
local Text ='الستخدم ثيم اخر اكتب ثيم'  
keyboard = {}   
keyboard.inline_keyboard = {  
 {{text = '《𝚂𝙾𝚄𝚁𝙲𝙴 MATRIX》', url="t.me/UU_matrixx"}},
}  
local MATRIXg_id = MATRIXg.id_/2097152/0.5  
https.request("https://api.telegram.org/bot"..token..'/sendDocument?chat_id=' .. MATRIXg.chat_id_ .. '&document=https://t.me/ahmedthem1/'..ght..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "تويت بالصور" and not  database:get(bot_id.."sing:for:me"..MATRIXg.chat_id_) then 
ght = math.random(1,28); 
local Text ='مرحبا إليك تويت بالصوره🌺' 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'MATRIX🌺 ', url="t.me/UU_matrixx"}}, 
{{text = 'اضف البوت الي مجموعتك' ,url="t.me/"..dofile("./kkkklInfo.lua").botUserName.."?startgroup=start"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=https://t.me/wffhvv/'..ght..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "لو خيروك بالصور" and not  database:get(bot_id.."sing:for:me"..MATRIXg.chat_id_) then 
ght = math.random(1,15); 
local Text ='تم اختيار الصوره لو خيروك لك' 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'mido elso8ayer.',url="t.me/Enginner_mido"}}, 
{{text = 'mido elkebir.',url="t.me/uu_mido"}}, 
{{text = 'source MATRIX.',url="t.me/UU_matrixx"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendphoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=https://t.me/mnmnmnmn09/'..ght..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
 
if text == 'تفعيل الحمايه'and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Contact"..MATRIXg.chat_id_,'del')  
database:set(bot_id.."lock:Spam"..MATRIXg.chat_id_,'del')  
database:set(bot_id.."lock:Photo"..MATRIXg.chat_id_,'del')  
database:set(bot_id.."lock:forward"..MATRIXg.chat_id_,'del')  
database:set(bot_id.."lock:Link"..MATRIXg.chat_id_,'del')
database:set(bot_id.."lock:Lock:Sexy"..MATRIXg.chat_id_,'del')  
database:set(bot_id..'lock:Fshar'..MATRIXg.chat_id_,true) 
database:set(bot_id..'lock:Fars'..MATRIXg.chat_id_,true) 
database:set(bot_id..'Bot:Id:Photo'..MATRIXg.chat_id_,true) 
database:set(bot_id.."lock:Bot:kick"..MATRIXg.chat_id_,'kick')  
database:set(bot_id..'lock_edit_med'..MATRIXg.chat_id_,true) 
database:set(bot_id.."lock:inline"..MATRIXg.chat_id_,'del')  
database:set(bot_id.."lock:Video"..MATRIXg.chat_id_,'del')  
database:set(bot_id.."lock:Animation"..MATRIXg.chat_id_,'del')  
database:set(bot_id.."lock:Sticker"..MATRIXg.chat_id_,'del')  
database:set(bot_id..'Bot:Id:Photo'..MATRIXg.chat_id_,true) 
database:set(bot_id.."lock:Video"..MATRIXg.chat_id_,'ked')  
database:hset(bot_id.."flooding:settings:"..MATRIXg.chat_id_ ,"flood",'mute')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل جلب الصوره ،\n 👻 تم قفل البوتات  ،\n 👻 تم قفل التكرار ،\n 👻 تم قفل الروابط ،\n 👻 تم قفل التوجيه ،\n 👻 تم قفل الملصقات ،\n 👻 تم قفل المتحركه ،\n 👻 تم قفل الفيديو ،\n 👻 تم قفل الفشار ،\n 👻 تم قفل الانلاين ،\n 👻 تم قفل تعديل المديا ،\n 👻 تم وضع التكرار  ،\n 👻 تم قفل الفارسيه  ،\n 👻 تم وضع الايدي بدون صوره ،n  \n 👻 تم تفعيل الحمايه  بواسطه ، [↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..')  ')
end,nil)   
end
if text == 'تعطيل الحمايه'and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:inline"..MATRIXg.chat_id_)  
database:del(bot_id.."lock:Lock:Sexy"..MATRIXg.chat_id_)  
database:hdel(bot_id.."flooding:settings:"..MATRIXg.chat_id_ ,"flood")  
database:set(bot_id..'lock_edit_med'..MATRIXg.chat_id_,true) 
database:del(bot_id..'lock:Fshar'..MATRIXg.chat_id_) 
database:del(bot_id.."lock:Bot:kick"..MATRIXg.chat_id_)  
database:del(bot_id.."lock:Photo"..MATRIXg.chat_id_)  
database:del(bot_id.."lock:Video"..MATRIXg.chat_id_)  
database:del(bot_id.."lock:Link"..MATRIXg.chat_id_)  
database:del(bot_id.."lock:Sticker"..MATRIXg.chat_id_)  
database:del(bot_id.."lock:Animation"..MATRIXg.chat_id_)  
database:del(bot_id.."lock:forward"..MATRIXg.chat_id_)  
database:del(bot_id..'Bot:Id'..MATRIXg.chat_id_) 
database:del(bot_id..'Bot:Id:Photo'..MATRIXg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تفعيل جلب الصوره ،\n 👻 تم  فتح البوتات  ،\n 👻 تم  فتح التكرار ،\n 👻 تم  فتح الروابط ،\n 👻 تم  فتح التوجيه ،\n 👻 تم  فتح الملصقات ،\n 👻 تم  فتح المتحركه ،\n 👻 تم  فتح الفيديو ،\n 👻 تم  فتح الفشار ،\n 👻 تم  فتح الانلاين ،\n 👻 تم  فتح تعديل المديا ،\n 👻 تم وضع التكرار  ،\n 👻 تم  فتح الفارسيه  ،\n 👻 تم وضع الايدي بصوره،n \n 👻 تم تفعيل الحمايه  بواسطه ، [↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..')  ')
end,nil)   
end
if text == 'تفعيل الحمايه القصوه'and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:text"..MATRIXg.chat_id_,true) 
database:set(bot_id.."lock:AddMempar"..MATRIXg.chat_id_,'kick')
database:set(bot_id.."lock:Join"..MATRIXg.chat_id_,'kick')
database:set(bot_id.."lock:Bot:kick"..MATRIXg.chat_id_,'kick')
database:set(bot_id.."lockpin"..MATRIXg.chat_id_, true) 
database:sadd(bot_id..'lock:pin',MATRIXg.chat_id_) 
database:set(bot_id..'lock:tagservr'..MATRIXg.chat_id_,true)  
database:set(bot_id..'lock:Fars'..MATRIXg.chat_id_,true) 
database:set(bot_id..'lock:Fshar'..MATRIXg.chat_id_,true)
database:set(bot_id..'lock:edit'..MATRIXg.chat_id_,true) 
database:set(bot_id.."lock:inline"..MATRIXg.chat_id_,'del')
database:set(bot_id.."lock:Lock:Sexy"..MATRIXg.chat_id_,'del')
database:del(bot_id.."pp_photo:status"..MATRIXg.chat_id_) 
database:del(bot_id.."my_photo:status"..MATRIXg.chat_id_) 
database:hset(bot_id.."flooding:settings:"..MATRIXg.chat_id_ ,"flood",'keed')  
database:set(bot_id.."lock:Contact"..MATRIXg.chat_id_,'ked')  
database:set(bot_id.."lock:Spam"..MATRIXg.chat_id_,'ked')  
database:set(bot_id.."lock:forward"..MATRIXg.chat_id_,'ked')  
database:set(bot_id.."lock:Keyboard"..MATRIXg.chat_id_,'ked')  
database:set(bot_id..'Bot:Id:Photo'..MATRIXg.chat_id_,true) 
database:set(bot_id..'Bot:Id:Photo'..MATRIXg.chat_id_,true) 
database:set(bot_id.."lock:Photo"..MATRIXg.chat_id_,'ked')  
database:set(bot_id.."lock:geam"..MATRIXg.chat_id_,'ked')  
database:set(bot_id.."lock:Sticker"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,'تم قفل الحمايه كامله\nتحظير هذا الحمايه تقفل كل حاجه بلتقييد\nتفعيل الحمايه دي بس عند التفليش او التحفيل\nلتعطيل الحمايه القصوه\nاكتب تعطيل الحمايه القوصه\n تم تفعيل الحمايه القصوه من قبل [↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..')  ')
end,nil)   
end
if text == 'تعطيل الحمايه القصوه'and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Spam"..MATRIXg.chat_id_)  
database:del(bot_id.."lock:Join"..MATRIXg.chat_id_)  
database:del(bot_id.."lock:text"..MATRIXg.chat_id_)  
database:del(bot_id.."lock:AddMempar"..MATRIXg.chat_id_)  
database:del(bot_id.."lock:Bot:kick"..MATRIXg.chat_id_)  
database:del(bot_id..'lock:edit'..MATRIXg.chat_id_)
database:del(bot_id.."lockpin"..MATRIXg.chat_id_)  
database:del(bot_id..'lock:Fshar'..MATRIXg.chat_id_) 
database:del(bot_id..'lock:Fars'..MATRIXg.chat_id_) 
database:del(bot_id.."lock:Link"..MATRIXg.chat_id_)  
database:del(bot_id..'sing:for:me'..MATRIXg.chat_id_)  
database:del(bot_id.."lock:Photo"..MATRIXg.chat_id_)  
database:del(bot_id.."lock:Video"..MATRIXg.chat_id_)  
database:del(bot_id.."lock:Sticker"..MATRIXg.chat_id_)  
database:del(bot_id.."lock:forward"..MATRIXg.chat_id_)  
database:del(bot_id.."lock:geam"..MATRIXg.chat_id_)  
database:del(bot_id..'Bot:Id:Photo'..MATRIXg.chat_id_) 
database:set(bot_id.."pp_photo:status"..MATRIXg.chat_id_,true) 
database:set(bot_id.."my_photo:status"..MATRIXg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,'  تم تعطيل الحمايه القصوه من قبل    [↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..')  ')
end,nil)   
end
if text == 'قفل الدردشه' and MATRIXg.reply_to_message_id_ == 0 and Manager(MATRIXg) then 
database:set(bot_id.."lock:text"..MATRIXg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data)  
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الدردشه ')
end,nil)   
elseif text == 'قفل الاضافه' and MATRIXg.reply_to_message_id_ == 0 and Mod(MATRIXg) then 
database:set(bot_id.."lock:AddMempar"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻| تـم قفـل اضافة ')
end,nil)   
elseif text == 'قفل الدخول' and MATRIXg.reply_to_message_id_ == 0 and Mod(MATRIXg) then 
database:set(bot_id.."lock:Join"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل دخول ')
end,nil)   
elseif text == 'قفل البوتات' and MATRIXg.reply_to_message_id_ == 0 and Mod(MATRIXg) then 
database:set(bot_id.."lock:Bot:kick"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل البوتات ')
end,nil)   
elseif text == 'قفل البوتات بالطرد' and MATRIXg.reply_to_message_id_ == 0 and Mod(MATRIXg) then 
database:set(bot_id.."lock:Bot:kick"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل البوتات بالطرد ')
end,nil)   
elseif text == 'قفل الاشعارات' and MATRIXg.reply_to_message_id_ == 0 and Mod(MATRIXg) then  
database:set(bot_id..'lock:tagservr'..MATRIXg.chat_id_,true)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الاشعارات ')
end,nil)   
elseif text == 'قفل التثبيت' and MATRIXg.reply_to_message_id_ == 0 and Constructor(MATRIXg) then 
database:set(bot_id.."lockpin"..MATRIXg.chat_id_, true) 
database:sadd(bot_id..'lock:pin',MATRIXg.chat_id_) 
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = getChatId(MATRIXg.chat_id_).ID }, function(arg,data)  database:set(bot_id..'Pin:Id:MATRIXg'..MATRIXg.chat_id_,data.pinned_message_id_)  end,nil)
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل التثبيت ')
end,nil)   
elseif text == 'قفل التعديل' and MATRIXg.reply_to_message_id_ == 0 and Constructor(MATRIXg) then 
database:set(bot_id..'lock:edit'..MATRIXg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل تعديل ')
end,nil)   
elseif text == 'قفل السب' and MATRIXg.reply_to_message_id_ == 0 and Manager(MATRIXg) then 
database:set(bot_id..'lock:Fshar'..MATRIXg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل السب ')
end,nil)  
elseif text == 'قفل الازعاج' and MATRIXg.reply_to_message_id_ == 0 and Manager(MATRIXg) then 
database:set(bot_id..'lock:Azag'..MATRIXg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل السب ')
end,nil)  
elseif text == 'قفل الفارسيه' and MATRIXg.reply_to_message_id_ == 0 and Manager(MATRIXg) then 
database:set(bot_id..'lock:Fars'..MATRIXg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الفارسيه ')
end,nil)   
elseif text == 'قفل الانكليزيه' and MATRIXg.reply_to_message_id_ == 0 and Manager(MATRIXg) then 
database:set(bot_id..'lock:Engilsh'..MATRIXg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الانكليزيه ')
end,nil)
elseif text == 'قفل الانلاين' and MATRIXg.reply_to_message_id_ == 0 and Manager(MATRIXg) then 
database:set(bot_id.."lock:inline"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الانلاين ')
end,nil)
elseif text == 'قفل تعديل الميديا' and MATRIXg.reply_to_message_id_ == 0 and Constructor(MATRIXg) then 
database:set(bot_id..'lock_edit_med'..MATRIXg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل تعديل ')
end,nil)    
elseif text == 'قفل الكل' and MATRIXg.reply_to_message_id_ == 0 and Mod(MATRIXg) then 
database:set(bot_id..'lock:tagservrbot'..MATRIXg.chat_id_,true)   
list ={"lock:Bot:kick","lock:user:name","lock:hashtak","lsock:Cmd","lock:Link","lock:forward","lock:Keyboard","lock:geam","lock:Photo","lock:Animation","lock:Video","lock:Audio","lock:vico","lock:Sticker","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..lock..MATRIXg.chat_id_,'del')    
end
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل جميع الاوامر ')
end,nil)   
end
if text == 'قفل الاباحي' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Lock:Sexy"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الاباحي ')
end,nil)   
elseif text == 'فتح الاباحي' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Lock:Sexy"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح الاباحي ')
end,nil)   
end
if text == 'فتح الانلاين' and MATRIXg.reply_to_message_id_ == 0 and Mod(MATRIXg) then 
database:del(bot_id.."lock:inline"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح الانلاين ')
end,nil)
elseif text == 'فتح الاضافه' and MATRIXg.reply_to_message_id_ == 0 and Mod(MATRIXg) then 
database:del(bot_id.."lock:AddMempar"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح اضافة ')
end,nil)   
elseif text == 'فتح الدردشه' and MATRIXg.reply_to_message_id_ == 0 and Manager(MATRIXg) then 
database:del(bot_id.."lock:text"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح الدردشه ')
end,nil)   
elseif text == 'فتح الدخول' and MATRIXg.reply_to_message_id_ == 0 and Mod(MATRIXg) then 
database:del(bot_id.."lock:Join"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح دخول ')
end,nil)   
elseif text == 'فتح البوتات' and MATRIXg.reply_to_message_id_ == 0 and Mod(MATRIXg) then 
database:del(bot_id.."lock:Bot:kick"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فـتح البوتات ')
end,nil)   
elseif text == 'فتح البوتات بالطرد' and MATRIXg.reply_to_message_id_ == 0 and Mod(MATRIXg) then 
database:del(bot_id.."lock:Bot:kick"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فـتح البوتات بالطرد ')
end,nil)   
elseif text == 'فتح الاشعارات' and MATRIXg.reply_to_message_id_ == 0 and Mod(MATRIXg) then  
database:del(bot_id..'lock:tagservr'..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فـتح الاشعارات ')
end,nil)   
elseif text == 'فتح التثبيت' and MATRIXg.reply_to_message_id_ == 0 and Constructor(MATRIXg) then 
database:del(bot_id.."lockpin"..MATRIXg.chat_id_)  
database:srem(bot_id..'lock:pin',MATRIXg.chat_id_)
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فـتح التثبيت ')
end,nil)   
elseif text == 'فتح التعديل' and MATRIXg.reply_to_message_id_ == 0 and Constructor(MATRIXg) then 
database:del(bot_id..'lock:edit'..MATRIXg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فـتح تعديل ')
end,nil)   
elseif text == 'فتح السب' and MATRIXg.reply_to_message_id_ == 0 and Manager(MATRIXg) then 
database:del(bot_id..'lock:Fshar'..MATRIXg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فـتح السب ')
end,nil)   
elseif text == 'فتح الازعاج' and MATRIXg.reply_to_message_id_ == 0 and Manager(MATRIXg) then 
database:del(bot_id..'lock:Azag'..MATRIXg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فـتح السب ')
end,nil)   
elseif text == 'فتح الفارسيه' and MATRIXg.reply_to_message_id_ == 0 and Manager(MATRIXg) then 
database:del(bot_id..'lock:Fars'..MATRIXg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فـتح الفارسيه ')
end,nil)   
elseif text == 'فتح الانكليزيه' and MATRIXg.reply_to_message_id_ == 0 and Manager(MATRIXg) then 
database:del(bot_id..'lock:Engilsh'..MATRIXg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فـتح الانكليزيه ')
end,nil)
elseif text == 'فتح تعديل الميديا' and MATRIXg.reply_to_message_id_ == 0 and Constructor(MATRIXg) then 
database:del(bot_id..'lock_edit_med'..MATRIXg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فـتح تعديل ')
end,nil)    
elseif text == 'فتح الكل' and MATRIXg.reply_to_message_id_ == 0 and Mod(MATRIXg) then 
database:del(bot_id..'lock:tagservrbot'..MATRIXg.chat_id_)   
list ={"lock:Bot:kick","lock:user:name","lock:hashtak","lock:Cmd","lock:Link","lock:forward","lock:Keyboard","lock:geam","lock:Photo","lock:Animation","lock:Video","lock:Audio","lock:vico","lock:Sticker","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
database:del(bot_id..lock..MATRIXg.chat_id_)    
end
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فـتح جميع الاوامر ')
end,nil)   
end
if text == 'قفل الروابط' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Link"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الروابط ')
end,nil)   
elseif text == 'قفل الروابط بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Link"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الروابط بالتقييد ')
end,nil)   
elseif text == 'قفل الروابط بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Link"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الروابط بالكتم ')
end,nil)   
elseif text == 'قفل الروابط بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Link"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الروابط بالطرد ')
end,nil)   
elseif text == 'فتح الروابط' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Link"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح الروابط ')
end,nil)   
end
if text == 'قفل المعرفات' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:user:name"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل المعرفات ')
end,nil)   
elseif text == 'قفل المعرفات بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:user:name"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل المعرفات بالتقييد ')
end,nil)   
elseif text == 'قفل المعرفات بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:user:name"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل المعرفات بالكتم ')
end,nil)   
elseif text == 'قفل المعرفات بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:user:name"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل المعرفات بالطرد ')
end,nil)   
elseif text == 'فتح المعرفات' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:user:name"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح المعرفات ')
end,nil)   
end
if text == 'تفعيل غنيلي' and CoSu(MATRIXg) then   
if database:get(bot_id..'sing:for:me'..MATRIXg.chat_id_) then
Text = ' 👻 تم تفعيل امر غنيلي الان ارسل غنيلي'
database:del(bot_id..'sing:for:me'..MATRIXg.chat_id_)  
else
Text = ' 👻 بالتاكيد تم تفعيل امر غنيلي تستطيع ارسال غنيلي'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل غنيلي' and CoSu(MATRIXg) then  
if not database:get(bot_id..'sing:for:me'..MATRIXg.chat_id_) then
database:set(bot_id..'sing:for:me'..MATRIXg.chat_id_,true)  
Text = '\n 👻 تم تعطيل امر غنيلي'
else
Text = '\n 👻 بالتاكيد تم تعطيل امر غنيلي'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تفعيل نسبه الحب' and Manager(MATRIXg) then   
if database:get(bot_id..'Cick:lov'..MATRIXg.chat_id_) then
Text = ' 👻 تم تفعيل نسبه الحب'
database:del(bot_id..'Cick:lov'..MATRIXg.chat_id_)  
else
Text = ' 👻 بالتاكيد تم تفعيل نسبه الحب'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل نسبه الحب' and Manager(MATRIXg) then  
if not database:get(bot_id..'Cick:lov'..MATRIXg.chat_id_) then
database:set(bot_id..'Cick:lov'..MATRIXg.chat_id_,true)  
Text = '\n 👻 تم تعطيل نسبه الحب'
else
Text = '\n 👻 بالتاكيد تم تعطيل نسبه الحب'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تفعيل نسبه الرجوله' and Manager(MATRIXg) then   
if database:get(bot_id..'Cick:rjo'..MATRIXg.chat_id_) then
Text = ' 👻 تم تفعيل نسبه الرجوله'
database:del(bot_id..'Cick:rjo'..MATRIXg.chat_id_)  
else
Text = ' 👻 بالتاكيد تم تفعيل الرجوله'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل نسبه الرجوله' and Manager(MATRIXg) then  
if not database:get(bot_id..'Cick:rjo'..MATRIXg.chat_id_) then
database:set(bot_id..'Cick:rjo'..MATRIXg.chat_id_,true)  
Text = '\n 👻 تم تعطيل نسبه الرجوله'
else
Text = '\n 👻 بالتاكيد تم تعطيل نسبه الرجوله'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تفعيل نسبه الكره' and Manager(MATRIXg) then   
if database:get(bot_id..'Cick:krh'..MATRIXg.chat_id_) then
Text = ' 👻 تم تفعيل نسبه الكره'
database:del(bot_id..'Cick:krh'..MATRIXg.chat_id_)  
else
Text = ' 👻 بالتاكيد تم تفعيل نسبه الكره'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل نسبه الكره' and Manager(MATRIXg) then  
if not database:get(bot_id..'Cick:krh'..MATRIXg.chat_id_) then
database:set(bot_id..'Cick:krh'..MATRIXg.chat_id_,true)  
Text = '\n 👻 تم تعطيل نسبه الكره'
else
Text = '\n 👻 بالتاكيد تم تعطيل نسبه الكره'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تفعيل نسبه الانوثه' and Manager(MATRIXg) then   
if database:get(bot_id..'Cick:ano'..MATRIXg.chat_id_) then
Text = ' 👻 تم تفعيل نسبه الانوثه'
database:del(bot_id..'Cick:ano'..MATRIXg.chat_id_)  
else
Text = ' 👻 بالتاكيد تم تفعيل الانوثه'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل نسبه الانوثه' and Manager(MATRIXg) then  
if not database:get(bot_id..'Cick:ano'..MATRIXg.chat_id_) then
database:set(bot_id..'Cick:ano'..MATRIXg.chat_id_,true)  
Text = '\n 👻 تم تعطيل نسبه الانوثه'
else
Text = '\n 👻 بالتاكيد تم تعطيل نسبه الانوثه'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تفعيل all' and CoSu(MATRIXg) then   
if database:get(bot_id..'Cick:all'..MATRIXg.chat_id_) then
Text = ' 👻 تم تفعيل امر @all'
database:del(bot_id..'Cick:all'..MATRIXg.chat_id_)  
else
Text = ' 👻 بالتاكيد تم تفعيل امر @all'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل all' and CoSu(MATRIXg) then  
if not database:get(bot_id..'Cick:all'..MATRIXg.chat_id_) then
database:set(bot_id..'Cick:all'..MATRIXg.chat_id_,true)  
Text = '\n 👻 تم تعطيل امر @all'
else
Text = '\n 👻 بالتاكيد تم تعطيل امر @all'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end

if text == 'قفل التاك' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:hashtak"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل التاك ')
end,nil)   
elseif text == 'قفل التاك بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:hashtak"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل التاك بالتقييد ')
end,nil)   
elseif text == 'قفل التاك بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:hashtak"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇['..string.sub(data.first_name_,0,60)..'](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل التاك بالكتم ')
end,nil)   
elseif text == 'قفل التاك بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:hashtak"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل التاك بالطرد ')
end,nil)   
elseif text == 'فتح التاك' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:hashtak"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n ?? تـم فتح التاك ')
end,nil)   
end
if text == 'قفل الشارحه' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Cmd"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الشارحه ')
end,nil)   
elseif text == 'قفل الشارحه بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Cmd"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الشارحه بالتقييد ')
end,nil)   
elseif text == 'قفل الشارحه بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Cmd"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الشارحه بالكتم ')
end,nil)   
elseif text == 'قفل الشارحه بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Cmd"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الشارحه بالطرد ')
end,nil)   
elseif text == 'فتح الشارحه' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Cmd"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح الشارحه ')
end,nil)   
end
if text == 'قفل الصور'and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Photo"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الصور ')
end,nil)   
elseif text == 'قفل الصور بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Photo"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الصور بالتقييد ')
end,nil)   
elseif text == 'قفل الصور بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Photo"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الصور بالكتم ')
end,nil)   
elseif text == 'قفل الصور بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Photo"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الصور بالطرد ')
end,nil)   
elseif text == 'فتح الصور' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Photo"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح الصور ')
end,nil)   
end
if text == 'قفل الفيديو' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Video"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الفيديو ')
end,nil)   
elseif text == 'قفل الفيديو بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Video"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الفيديو بالتقييد ')
end,nil)   
elseif text == 'قفل الفيديو بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Video"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' ??  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الفيديو بالكتم ')
end,nil)   
elseif text == 'قفل الفيديو بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Video"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الفيديو بالطرد ')
end,nil)   
elseif text == 'فتح الفيديو' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Video"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح الفيديو ')
end,nil)   
end
if text == 'قفل المتحركه' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Animation"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل المتحركه ')
end,nil)   
elseif text == 'قفل المتحركه بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Animation"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل المتحركه بالتقييد ')
end,nil)   
elseif text == 'قفل المتحركه بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Animation"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل المتحركه بالكتم ')
end,nil)   
elseif text == 'قفل المتحركه بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Animation"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل المتحركه بالطرد ')
end,nil)   
elseif text == 'فتح المتحركه' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Animation"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n ?? تـم فتح المتحركه ')
end,nil)   
end
if text == 'قفل الالعاب' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:geam"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الالعاب ')
end,nil)   
elseif text == 'قفل الالعاب بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:geam"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الالعاب بالتقييد ')
end,nil)   
elseif text == 'قفل الالعاب بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:geam"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الالعاب بالكتم ')
end,nil)   
elseif text == 'قفل الالعاب بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:geam"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الالعاب بالطرد ')
end,nil)   
elseif text == 'فتح الالعاب' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:geam"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح الالعاب ')
end,nil)   
end
if text == 'قفل الاغاني' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Audio"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الاغاني ')
end,nil)   
elseif text == 'قفل الاغاني بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Audio"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الاغاني بالتقييد ')
end,nil)   
elseif text == 'قفل الاغاني بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Audio"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الاغاني بالكتم ')
end,nil)   
elseif text == 'قفل الاغاني بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Audio"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الاغاني بالطرد ')
end,nil)   
elseif text == 'فتح الاغاني' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Audio"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح الاغاني ')
end,nil)   
end
if text == 'قفل الصوت' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:vico"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الصوت ')
end,nil)   
elseif text == 'قفل الصوت بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:vico"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الصوت بالتقييد ')
end,nil)   
elseif text == 'قفل الصوت بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:vico"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الصوت بالكتم ')
end,nil)   
elseif text == 'قفل الصوت بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:vico"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الصوت بالطرد ')
end,nil)   
elseif text == 'فتح الصوت' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:vico"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح الصوت ')
end,nil)   
end
if text == 'قفل الكيبورد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Keyboard"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الكيبورد ')
end,nil)   
elseif text == 'قفل الكيبورد بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Keyboard"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الكيبورد بالتقييد ')
end,nil)   
elseif text == 'قفل الكيبورد بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Keyboard"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الكيبورد بالكتم ')  
end,nil)   
elseif text == 'قفل الكيبورد بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Keyboard"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الكيبورد بالطرد ')  
end,nil)   
elseif text == 'فتح الكيبورد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Keyboard"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح الكيبورد ')  
end,nil)   
end
if text == 'قفل الملصقات' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Sticker"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الملصقات ')  
end,nil)   
elseif text == 'قفل الملصقات بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Sticker"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الملصقات بالتقييد ')  
end,nil)
elseif text == 'قفل الملصقات بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Sticker"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الملصقات بالكتم ')  
end,nil)   
elseif text == 'قفل الملصقات بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Sticker"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الملصقات بالطرد ')  
end,nil)   
elseif text == 'فتح الملصقات' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Sticker"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح الملصقات ')  
end,nil)   
end
if text == 'قفل التوجيه' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:forward"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل التوجيه ')  
end,nil)   
elseif text == 'قفل التوجيه بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:forward"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل التوجيه بالتقييد ')  
end,nil)
elseif text == 'قفل التوجيه بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:forward"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل التوجيه بالكتم ')  
end,nil)   
elseif text == 'قفل التوجيه بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:forward"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل التوجيه بالطرد ')  
end,nil)   
elseif text == 'فتح التوجيه' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:forward"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح التوجيه ')  
end,nil)   
end
if text == 'قفل الملفات' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Document"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n ?? تـم قفـل الملفات ')  
end,nil)   
elseif text == 'قفل الملفات بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Document"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الملفات بالتقييد ')  
end,nil)
elseif text == 'قفل الملفات بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Document"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الملفات بالكتم ')  
end,nil)   
elseif text == 'قفل الملفات بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Document"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الملفات بالطرد ')  
end,nil)   
elseif text == 'فتح الملفات' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Document"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح الملفات ')  
end,nil)   
end
if text == 'قفل السيلفي' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Unsupported"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل السيلفي ')  
end,nil)   
elseif text == 'قفل السيلفي بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Unsupported"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل السيلفي بالتقييد ')  
end,nil)
elseif text == 'قفل السيلفي بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Unsupported"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل السيلفي بالكتم ')  
end,nil)   
elseif text == 'قفل السيلفي بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Unsupported"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل السيلفي بالطرد ')  
end,nil)   
elseif text == 'فتح السيلفي' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Unsupported"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح السيلفي ')  
end,nil)   
end
if text == 'قفل الماركداون' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Markdaun"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n ?? تـم قفـل الماركداون ')  
end,nil)   
elseif text == 'قفل الماركداون بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Markdaun"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الماركداون بالتقييد ')  
end,nil)
elseif text == 'قفل الماركداون بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Markdaun"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الماركداون بالكتم ')  
end,nil)   
elseif text == 'قفل الماركداون بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Markdaun"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الماركداون بالطرد ')  
end,nil)   
elseif text == 'فتح الماركداون' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Markdaun"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح الماركداون ')  
end,nil)   
end
if text == 'قفل الجهات' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Contact"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الجهات ')  
end,nil)   
elseif text == 'قفل الجهات بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Contact"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الجهات بالتقييد ')  
end,nil)
elseif text == 'قفل الجهات بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Contact"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الجهات بالكتم ')  
end,nil)   
elseif text == 'قفل الجهات بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Contact"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الجهات بالطرد ')  
end,nil)   
elseif text == 'فتح الجهات' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Contact"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح الجهات ')  
end,nil)   
end
if text == 'قفل الكلايش' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Spam"..MATRIXg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الكلايش ')  
end,nil)   
elseif text == 'قفل الكلايش بالتقييد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Spam"..MATRIXg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الكلايش بالتقييد ')  
end,nil)
elseif text == 'قفل الكلايش بالكتم' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Spam"..MATRIXg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الكلايش بالكتم ')  
end,nil)   
elseif text == 'قفل الكلايش بالطرد' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:set(bot_id.."lock:Spam"..MATRIXg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل الكلايش بالطرد ')  
end,nil)   
elseif text == 'فتح الكلايش' and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then 
database:del(bot_id.."lock:Spam"..MATRIXg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم فتح الكلايش ')  
end,nil)   
end
if text == 'قفل التكرار بالطرد' and Mod(MATRIXg) then 
database:hset(bot_id.."flooding:settings:"..MATRIXg.chat_id_ ,"flood",'kick')  
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم قفل التكرار بالطرد')
elseif text == 'قفل التكرار' and Mod(MATRIXg) then 
database:hset(bot_id.."flooding:settings:"..MATRIXg.chat_id_ ,"flood",'del')  
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم قفل التكرار')
elseif text == 'قفل التكرار بالتقييد' and Mod(MATRIXg) then 
database:hset(bot_id.."flooding:settings:"..MATRIXg.chat_id_ ,"flood",'keed')  
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم قفل التكرار بالتقييد')
elseif text == 'قفل التكرار بالكتم' and Mod(MATRIXg) then 
database:hset(bot_id.."flooding:settings:"..MATRIXg.chat_id_ ,"flood",'mute')  
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم قفل التكرار بالكتم')
elseif text == 'فتح التكرار' and Mod(MATRIXg) then 
database:hdel(bot_id.."flooding:settings:"..MATRIXg.chat_id_ ,"flood")  
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم فتح التكرار')
end
--------------------------------------------------------------------------------------------------------------
if text == 'تحديث' and DevSoFi(MATRIXg) then    
dofile('DRAGON.lua')  
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تحديث جميع الملفات') 
end 
if text == ("مسح قائمه العام") and DevSoFi(MATRIXg) then
database:del(bot_id..'GBan:User')
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 تم مسح قائمه العام')
return false
end
if text == ("مسح الحظر العام") and DevSoFi(MATRIXg) then
database:del(bot_id..'GBan:User')
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 تم مسح الحظر العام')
return false
end
if text == ("مسح الكتم العام") and DevSoFi(MATRIXg) then
database:del(bot_id..'GBan:User')
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 تم مسح الكتم العام')
return false
end
if text == ("قائمه العام") and DevSoFi(MATRIXg) then
local list = database:smembers(bot_id..'GBan:User')
t = "\n 👻 قائمة المحظورين عام \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد محظورين عام"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
return false
end
if text == ("حظر عام") and MATRIXg.reply_to_message_id_ and SudoBot(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.sender_user_id_ == tonumber(SUDO) then
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا يمكنك حظر المطور الاساسي \n")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع حظر البوت عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1845655031) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع حظر مالك السورس عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1859008079) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع حظر المبرمج اوس اوس عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1858220633) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع حظر مبرمج السورس عام")
return false 
end
database:sadd(bot_id..'GBan:User', result.sender_user_id_)
chat_kick(result.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},
function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'UU_matrixx')..')'
status  = '\n 👻 تم حظرو عام من الجروبات '
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^حظر عام @(.*)$")  and SudoBot(MATRIXg) then
local username = text:match("^حظر عام @(.*)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local Groups = database:scard(bot_id..'Chek:Groups')  
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع حظر البوت عام")
return false 
end
if result.id_ == tonumber(SUDO) then
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا يمكنك حظر المطور الاساسي \n")
return false 
end
if result.id_ == tonumber(1858220633) then
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا يمكنك حظر مبرمج السورس \n")
return false 
end
if result.id_ == tonumber(1859008079) then
send(MATRIXg.chat_id_, MATRIXg.id_, "  لا يمكنك حظر المبرمج اوس اوس \n")
return false 
end
if result.id_ == tonumber(1845655031) then
send(MATRIXg.chat_id_, MATRIXg.id_, " ?? لا يمكنك حظر مبرمج السورس \n")
return false 
end
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'UU_matrixx')..')'
status  = '\n 👻 تم حظرو عام من الجروبات '
texts = usertext..status
database:sadd(bot_id..'GBan:User', result.id_)
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^حظر عام (%d+)$") and SudoBot(MATRIXg) then
local userid = text:match("^حظر عام (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local Groups = database:scard(bot_id..'Chek:Groups')  
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if userid == tonumber(SUDO) then
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا يمكنك حظر المطور الاساسي \n")
return false 
end
if tonumber(userid) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع حظر البوت عام")
return false 
end
if tonumber(userid) == tonumber(1858220633) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع حظر مالك السورس عام")
return false 
end
if tonumber(userid) == tonumber(1859008079) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع حظر المبرمج اوس اوس عام")
return false 
end
if tonumber(userid) == tonumber(1845655031) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع حظر مبرمج السورس عام")
return false 
end
database:sadd(bot_id..'GBan:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'UU_matrixx')..')'
status  = '\n 👻 تم حظرو عام من الجروبات '
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم حظرو عام من الجروبات '
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("كتم عام") and MATRIXg.reply_to_message_id_ and SudoBot(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local Groups = database:scard(bot_id..'Chek:Groups')  
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.sender_user_id_ == tonumber(SUDO) then
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا يمكنك كتم المطور الاساسي \n")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع كتم البوت عام")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1845655031) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع كتم مبرمج السورس")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1859008079) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع كتم المبرمج اوس اوس")
return false 
end
if tonumber(result.sender_user_id_) == tonumber(1858220633) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع كتم مالك السورس")
return false 
end
database:sadd(bot_id..'Gmute:User', result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},
function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'UU_matrixx')..')'
status  = '\n 👻 تم كتمه عام من الجروبات'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^كتم عام @(.*)$")  and SudoBot(MATRIXg) then
local username = text:match("^كتم عام @(.*)$") 
local Groups = database:scard(bot_id..'Chek:Groups')  
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n ??  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if tonumber(result.id_) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع كتم البوت عام")
return false 
end
if result.id_ == tonumber(SUDO) then
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا يمكنك كتم المطور الاساسي \n")
return false 
end
if result.id_ == tonumber(1858220633) then
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا يمكنك كتم مالك السورس \n")
return false 
end
if result.id_ == tonumber(1859008079) then
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا يمكنك كتم المبرمج اوس اوس \n")
return false 
end
if result.id_ == tonumber(1845655031) then
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا يمكنك كتم مبرمج السورس \n")
return false 
end
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'UU_matrixx')..')'
status  = '\n 👻 تم كتمه عام من الجروبات'
texts = usertext..status
database:sadd(bot_id..'Gmute:User', result.id_)
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^كتم عام (%d+)$") and SudoBot(MATRIXg) then
local userid = text:match("^كتم عام (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local Groups = database:scard(bot_id..'Chek:Groups')  
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if userid == tonumber(SUDO) then
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا يمكنك كتم المطور الاساسي \n")
return false 
end
if tonumber(userid) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع كتم البوت عام")
return false 
end
if tonumber(userid) == tonumber(1845655031) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع كتم مبرمج السورس عام")
return false
end
if tonumber(userid) == tonumber(1859008079) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع كتم المبرمج اوس اوس عام")
return false 
end
if tonumber(userid) == tonumber(1858220633) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع كتم مالك السورس")
return false 
end
database:sadd(bot_id..'Gmute:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'UU_matrixx')..')'
status  = '\n 👻 تم كتمه عام من الجروبات'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم كتمه عام من الجروبات'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("الغاء العام") and MATRIXg.reply_to_message_id_ and SudoBot(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'UU_matrixx')..')'
status  = '\n 👻 تم الغاء (الحظر-الكتم) عام من الجروبات'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
database:srem(bot_id..'GBan:User', result.sender_user_id_)
database:srem(bot_id..'Gmute:User', result.sender_user_id_)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^الغاء العام @(.*)$") and SudoBot(MATRIXg) then
local username = text:match("^الغاء العام @(.*)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'UU_matrixx')..')'
status  = '\n 👻 تم الغاء (الحظر-الكتم) عام من الجروبات'
texts = usertext..status
database:srem(bot_id..'GBan:User', result.id_)
database:srem(bot_id..'Gmute:User', result.id_)
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^الغاء العام (%d+)$") and SudoBot(MATRIXg) then
local userid = text:match("^الغاء العام (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'GBan:User', userid)
database:srem(bot_id..'Gmute:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'UU_matrixx')..')'
status  = '\n 👻 تم الغاء (الحظر-الكتم) عام من الجروبات'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم الغاء (الحظر-الكتم) عام من الجروبات '
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == ("مسح المطورين") and DevSoFi(MATRIXg) then
database:del(bot_id..'Sudo:User')
send(MATRIXg.chat_id_, MATRIXg.id_, "\n 👻 تم مسح قائمة المطورين  ")
end
if text == ("المطورين") and DevSoFi(MATRIXg) then
local list = database:smembers(bot_id..'Sudo:User')
t = "\n 👻  قائمة مطورين البوت \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " 👻  لا يوجد مطورين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end


if text and text:match("^all (.*)$") or text:match("^@all (.*)$") and CoSu(MATRIXg) then 
local ttag = text:match("^all (.*)$") or text:match("^@all (.*)$") 
if not database:get(bot_id..'Cick:all'..MATRIXg.chat_id_) then 
if database:get(bot_id.."S00F4:all:Time"..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) then   
return  
send(MATRIXg.chat_id_, MATRIXg.id_,"انتظر دقيقه من فضلك") 
end 
database:setex(bot_id..'S00F4:all:Time'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_,300,true) 
tdcli_function({ID="GetChannelFull",channel_id_ = MATRIXg.chat_id_:gsub('-100','')},function(argg,dataa)  
tdcli_function({ID = "GetChannelMembers",channel_id_ = MATRIXg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = dataa.member_count_},function(ta,sofi) 
x = 0 
tags = 0 
local list = sofi.members_ 
for k, v in pairs(list) do 
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data) 
if x == 5 or x == tags or k == 0 then 
tags = x + 5 
t = "#all "..ttag.."" 
end 
x = x + 1 
tagname = data.first_name_ 
tagname = tagname:gsub("]","") 
tagname = tagname:gsub("[[]","") 
t = t..", ["..tagname.."](tg://user?id="..v.user_id_..")" 
if x == 5 or x == tags or k == 0 then 
local Text = t:gsub('#all '..ttag..',','#all '..ttag..'\n') 
sendText(MATRIXg.chat_id_,Text,0,'md') 
end 
end,nil) 
end 
end,nil) 
end,nil) 
end 
end

if text == "تاك للكل"  and CoSu(MATRIXg) then
if not database:get(bot_id..'Cick:all'..MATRIXg.chat_id_) then
if database:get(bot_id.."S00F4:all:Time"..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) then  
return 
send(MATRIXg.chat_id_, MATRIXg.id_,"انتظر دقيقه من فضلك")
end
database:setex(bot_id..'S00F4:all:Time'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_,300,true)
tdcli_function({ID="GetChannelFull",channel_id_ = MATRIXg.chat_id_:gsub('-100','')},function(argg,dataa) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = MATRIXg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = dataa.member_count_},function(ta,sofi)
x = 0
tags = 0
local list = sofi.members_
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data)
if x == 5 or x == tags or k == 0 then
tags = x + 5
t = "#all"
end
x = x + 1
tagname = data.first_name_
tagname = tagname:gsub("]","")
tagname = tagname:gsub("[[]","")
t = t..", ["..tagname.."](tg://user?id="..v.user_id_..")"
if x == 5 or x == tags or k == 0 then
local Text = t:gsub('#all,','#all\n')
sendText(MATRIXg.chat_id_,Text,0,'md')
end
end,nil)
end
end,nil)
end,nil)
end
end


if text == 'الملفات' and DevSoFi(MATRIXg) then
t = ' 👻 ملفات السورس MATRIX𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍 \n'
i = 0
for v in io.popen('ls File_Bot'):lines() do
if v:match(".lua$") then
i = i + 1
t = t..i..'- الملف  ⇇{'..v..'}\n'
end
end
send(MATRIXg.chat_id_, MATRIXg.id_,t)
end
if text == "متجر الملفات" or text == 'المتجر' then
if DevSoFi(MATRIXg) then
local Get_Files, res = https.request("https://raw.githubusercontent.com/ososs9/matrix1/main/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n 👻 اهلا بك في متجر ملفات MATRIX\n 👻 ملفات السورس 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n◤━───━MATRIX━───━◥\n\n"
local TextE = "\n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n 👻 علامة تعني { ✔️ } ملف مفعل\n 👻 علامة تعني { ✖ } ملف معطل\n 👻 قناة سورس MATRIX𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n".." 👻 [اضغط هنا لدخول](t.me/UU_matrixx) \n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local Check_File_is_Found = io.open("File_Bot/"..name,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
CeckFile = "(✔️)"
else
CeckFile = "(✖)"
end
NumFile = NumFile + 1
TextS = TextS..'*'..NumFile.."→* {`"..name..'`}  ⇇'..CeckFile..'\n[-Information]('..Info..')\n'
end
send(MATRIXg.chat_id_, MATRIXg.id_,TextS..TextE) 
end
else
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 لا يوجد اتصال من ال api \n") 
end
return false
end
end

if text and text:match("^(تعطيل) (.*)(.lua)$") and DevSoFi(MATRIXg) then
local name_t = {string.match(text, "^(تعطيل) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("File_Bot/"..file,"r")
if file_bot then
io.close(file_bot)
t = " 👻 الملف  ⇇"..file.."\n 👻 تم تعطيل ملف \n"
else
t = " 👻 بالتاكيد تم تعطيل ملف → "..file.."\n"
end
local json_file, res = https.request("https://raw.githubusercontent.com/ososs9/matrix1/main/File_Bot/"..file)
if res == 200 then
os.execute("rm -fr File_Bot/"..file)
send(MATRIXg.chat_id_, MATRIXg.id_,t) 
dofile('DRAGON.lua')  
else
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 عذرا الملف لايدعم سورس MATRIX\n") 
end
return false
end
if text and text:match("^(تفعيل) (.*)(.lua)$") and DevSoFi(MATRIXg) then
local name_t = {string.match(text, "^(تفعيل) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("File_Bot/"..file,"r")
if file_bot then
io.close(file_bot)
t = " 👻 بالتاكيد تم تفعيل ملف → "..file.." \n"
else
t = " 👻 الملف  ⇇"..file.."\n 👻 تم تفعيل ملف \n"
end
local json_file, res = https.request("https://raw.githubusercontent.com/ososs9/matrix1/main/File_Bot/"..file)
if res == 200 then
local chek = io.open("File_Bot/"..file,'w+')
chek:write(json_file)
chek:close()
send(MATRIXg.chat_id_, MATRIXg.id_,t) 
dofile('DRAGON.lua')  
else
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 عذرا الملف لايدعم سورس MATRIX\n") 
end
return false
end
if text == "مسح الملفات" and DevSoFi(MATRIXg) then
os.execute("rm -fr File_Bot/*")
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 تم مسح الملفات")
return false
end

if text == ("رفع مطور") and MATRIXg.reply_to_message_id_ and DevSoFi(MATRIXg) then
function start_function(extra, result, success)
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'Sudo:User', result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته مطور'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false 
end
if text and text:match("^رفع مطور @(.*)$") and DevSoFi(MATRIXg) then
local username = text:match("^رفع مطور @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_,"⚠| عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Sudo:User', result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم ترقيته مطور'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false 
end
if text and text:match("^رفع مطور (%d+)$") and DevSoFi(MATRIXg) then
local userid = text:match("^رفع مطور (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته مطور'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم ترقيته مطور'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false 
end
if text == ("تنزيل مطور") and MATRIXg.reply_to_message_id_ and DevSoFi(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Sudo:User', result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المطورين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false 
end
if text and text:match("^تنزيل مطور @(.*)$") and DevSoFi(MATRIXg) then
local username = text:match("^تنزيل مطور @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا ����ستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Sudo:User', result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المطورين'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مطور (%d+)$") and DevSoFi(MATRIXg) then
local userid = text:match("^تنزيل مطور (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المطورين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم تنزيله من المطورين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false 
end
if text == ("مسح قائمه MATRIX") and Sudo(MATRIXg) then
database:del(bot_id..'CoSu'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 تم مسح قائمه MATRIX')
return false
end

if text == 'قائمه MATRIX' and Sudo(MATRIXg) then
local list = database:smembers(bot_id..'CoSu'..MATRIXg.chat_id_)
t = "\n 👻 قائمه MATRIX\n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد احد في قائمه MATRIX"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
return false
end
if text == ("صيح للمالك") or text == ("تاك للمالك") then
local list = database:smembers(bot_id..'CoSu'..MATRIXg.chat_id_)
t = "\n 👻 وينكم تعالو يريدوكم بالجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- ↝ '..v..' ↜\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد احد في قائمه المالك"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end

if text == ("رفع MATRIX") and MATRIXg.reply_to_message_id_ and Sudo(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'CoSu'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته MATRIX'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع MATRIX@(.*)$") and Sudo(MATRIXg) then
local username = text:match("^رفع MATRIX@(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'CoSu'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم ترقيته MATRIX'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^رفع MATRIX(%d+)$") and Sudo(MATRIXg) then
local userid = text:match("^رفع MATRIX(%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'CoSu'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته MATRIX'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم ترقيته MATRIX'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("تنزيل MATRIX") and MATRIXg.reply_to_message_id_ and Sudo(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'CoSu'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من MATRIX'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل MATRIX@(.*)$") and Sudo(MATRIXg) then
local username = text:match("^تنزيل MATRIX@(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'CoSu'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من MATRIX'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل MATRIX(%d+)$") and Sudo(MATRIXg) then
local userid = text:match("^تنزيل MATRIX(%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'CoSu'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من MATRIX'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم تنزيله من MATRIX'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------

if (MATRIXg.content_.sticker_)  and MATRIXg.reply_to_message_id_ == 0 and database:get(bot_id.."lock:Lock:Sexy"..MATRIXg.chat_id_)=="del" then      
sticker_id = MATRIXg.content_.sticker_.sticker_.persistent_id_
st = https.request('https://black-source.tk/BlackTeAM/ImageInfo.php?token='..token..'&url='..sticker_id.."&type=sticker")
eker = JSON.decode(st)
if eker.ok.Info == "Indecent" then
local list = database:smembers(bot_id.."Basic:Constructor"..MATRIXg.chat_id_)
t = " 👻 المنشئين الاساسين تعالو مخرب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " 👻 ماكو منششئين يشوفولك جاره"
end
Reply_Status(MATRIXg,MATRIXg.sender_user_id_,"reply"," 👻 قام بنشر ملصق اباحيه\n"..t)  
DeleteMessage(MATRIXg.chat_id_,{[0] = tonumber(MATRIXg.id_),MATRIXg.id_})   
end   
end
if (MATRIXg.content_.photo_) and MATRIXg.reply_to_message_id_ == 0 and database:get(bot_id.."lock:Lock:Sexy"..MATRIXg.chat_id_)=="del" then
photo_id = MATRIXg.content_.photo_.sizes_[1].photo_.persistent_id_  
Srrt = https.request('https://black-source.tk/BlackTeAM/ImageInfo.php?token='..token..'&url='..photo_id.."&type=photo")
Sto = JSON.decode(Srrt)
if Sto.ok.Info == "Indecent" then
local list = database:smembers(bot_id.."Basic:Constructor"..MATRIXg.chat_id_)
t = " 👻 المنشئين الاساسين تعالو مخرب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " 👻 ماكو منششئين يشوفولك جاره"
end
Reply_Status(MATRIXg,MATRIXg.sender_user_id_,"reply"," 👻 قام بنشر صوره اباحيه\n"..t)  
DeleteMessage(MATRIXg.chat_id_,{[0] = tonumber(MATRIXg.id_),MATRIXg.id_})   
end   
end

if text == 'تفعيل التحويل' and CoSu(MATRIXg) then   
if database:get(bot_id..'DRAGOON:change:sofi'..MATRIXg.chat_id_) then
Text = 'تم تفعيل تحويل الصيغ'
database:del(bot_id..'DRAGOON:change:sofi'..MATRIXg.chat_id_)  
else
Text = ' 👻 بالتاكيد تم تفعيل امر تحويل'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل التحويل' and CoSu(MATRIXg) then  
if not database:get(bot_id..'DRAGOON:change:sofi'..MATRIXg.chat_id_) then
database:set(bot_id..'DRAGOON:change:sofi'..MATRIXg.chat_id_,true)  
Text = '\n 👻 تم تعطيل امر تحويل'
else
Text = '\n 👻 بالتاكيد تم تعطيل امر تحويل'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تحويل' and not database:get(bot_id..'DRAGOON:change:sofi'..MATRIXg.chat_id_) then  
if tonumber(MATRIXg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.photo_ then 
local pn = result.content_.photo_.sizes_[1].photo_.persistent_id_
Addsticker(MATRIXg,MATRIXg.chat_id_,pn,MATRIXg.sender_user_id_..'.png')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = MATRIXg.chat_id_, message_id_ = tonumber(MATRIXg.reply_to_message_id_) }, by_reply, nil)
end
end

if text == 'تحويل' and not database:get(bot_id..'DRAGOON:change:sofi'..MATRIXg.chat_id_) then  
if tonumber(MATRIXg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.voice_ then 
local mr = result.content_.voice_.voice_.persistent_id_ 
Addmp3(MATRIXg,MATRIXg.chat_id_,mr,MATRIXg.sender_user_id_..'.mp3')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = MATRIXg.chat_id_, message_id_ = tonumber(MATRIXg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'تحويل' and not database:get(bot_id..'DRAGOON:change:sofi'..MATRIXg.chat_id_) then  
if tonumber(MATRIXg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.audio_ then 
local mr = result.content_.audio_.audio_.persistent_id_
Addvoi(MATRIXg,MATRIXg.chat_id_,mr,MATRIXg.sender_user_id_..'.ogg')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = MATRIXg.chat_id_, message_id_ = tonumber(MATRIXg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'تحويل' and not database:get(bot_id..'DRAGOON:change:sofi'..MATRIXg.chat_id_) then  
if tonumber(MATRIXg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.sticker_ then 
local Str = result.content_.sticker_.sticker_.persistent_id_ 
Addjpg(MATRIXg,MATRIXg.chat_id_,Str,MATRIXg.sender_user_id_..'.jpg')
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = MATRIXg.chat_id_, message_id_ = tonumber(MATRIXg.reply_to_message_id_) }, by_reply, nil)
end
end

-------------------
------------------------------------------------------------------------
if text == ("مسح الاساسين") and CoSu(MATRIXg) then
database:del(bot_id..'Basic:Constructor'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 تم مسح المنشئين الاساسين')
return false
end
if text == 'المنشئين الاساسين' and CoSu(MATRIXg) then
local list = database:smembers(bot_id..'Basic:Constructor'..MATRIXg.chat_id_)
t = "\n 👻 قائمة المنشئين الاساسين \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد منشئين اساسين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
return false
end
if text == ("تاك للمنشئين الاساسين") or text == ("صيح المنشئين الاساسين") then
local list = database:smembers(bot_id..'Basic:Constructor'..MATRIXg.chat_id_)
t = "\n 👻 وينكم تعالو يريدوكم بالجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- ↝ '..v..' ↜\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد منشئين اساسين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end

if text == ("رفع منشئ اساسي") and MATRIXg.reply_to_message_id_ and CoSu(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Basic:Constructor'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته منشئ اساسي'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع منشئ اساسي @(.*)$") and CoSu(MATRIXg) then
local username = text:match("^رفع منشئ اساسي @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Basic:Constructor'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم ترقيته منشئ اساسي'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^رفع منشئ اساسي (%d+)$") and CoSu(MATRIXg) then
local userid = text:match("^رفع منشئ اساسي (%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'Basic:Constructor'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته منشئ اساسي'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم ترقيته منشئ اساسي'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("تنزيل منشئ اساسي") and MATRIXg.reply_to_message_id_ and CoSu(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Basic:Constructor'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من الاساسيين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي @(.*)$") and CoSu(MATRIXg) then
local username = text:match("^تنزيل منشئ اساسي @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Basic:Constructor'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من الاساسيين'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل منشئ اساسي (%d+)$") and CoSu(MATRIXg) then
local userid = text:match("^تنزيل منشئ اساسي (%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'Basic:Constructor'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من الاساسيين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم تنزيله من الاساسيين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == 'مسح المنشئين' and BasicConstructor(MATRIXg) then
database:del(bot_id..'Constructor'..MATRIXg.chat_id_)
texts = ' 👻 تم مسح المنشئين '
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end

if text == ("المنشئين") and BasicConstructor(MATRIXg) then
local list = database:smembers(bot_id..'Constructor'..MATRIXg.chat_id_)
t = "\n 👻 قائمة المنشئين \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد منشئين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
if text == ("تاك للمنشئين") or text == ("صيح المنشئين") then
local list = database:smembers(bot_id..'Constructor'..MATRIXg.chat_id_)
t = "\n 👻 وينكم تعالو يريدوكم بالجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- ↝ '..v..' ↜\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد منشئين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
if text ==("المنشئ") then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = MATRIXg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
owner_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = owner_id},function(arg,b) 
if b.first_name_ == false then
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 حساب المنشئ محذوف")
return false  
end
local UserName = (b.username_ or "SRC-DRAGON")
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 منشئ الجروب  ⇇["..b.first_name_.."](T.me/"..UserName..")")  
end,nil)   
end
end
end,nil)   
end

if text == "رفع منشئ" and MATRIXg.reply_to_message_id_ and BasicConstructor(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Constructor'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻  الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته منشئ'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
end
if text and text:match("^رفع منشئ @(.*)$") and BasicConstructor(MATRIXg) then
local username = text:match("^رفع منشئ @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Constructor'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم ترقيته منشئ'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
------------------------------------------------------------------------
if text and text:match("^رفع منشئ (%d+)$") and BasicConstructor(MATRIXg) then
local userid = text:match("^رفع منشئ (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'Constructor'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته منشئ'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻  الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم ترقيته منشئ'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
end
if text and text:match("^تنزيل منشئ$") and MATRIXg.reply_to_message_id_ and BasicConstructor(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Constructor'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المنشئين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ @(.*)$") and BasicConstructor(MATRIXg) then
local username = text:match("^تنزيل منشئ @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Constructor'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المنشئين'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ (%d+)$") and BasicConstructor(MATRIXg) then
local userid = text:match("^تنزيل منشئ (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'Constructor'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المنشئين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم تنزيله من المنشئين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
end
------------------------------------------------------------------------
if text == 'مسح المدراء' and Constructor(MATRIXg) then
database:del(bot_id..'Manager'..MATRIXg.chat_id_)
texts = ' 👻 تم مسح المدراء '
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
if text == ("المدراء") and Constructor(MATRIXg) then
local list = database:smembers(bot_id..'Manager'..MATRIXg.chat_id_)
t = "\n 👻 قائمة المدراء \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد مدراء"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
if text == ("تاك للمدراء") or text == ("صيح المدراء") then
local list = database:smembers(bot_id..'Manager'..MATRIXg.chat_id_)
t = "\n 👻 وينكم تعالو يريدوكم بالجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- ↝ '..v..' ↜\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد مدراء"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end

if text == ("رفع مدير") and MATRIXg.reply_to_message_id_ and Constructor(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Manager'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته مدير'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^رفع مدير @(.*)$") and Constructor(MATRIXg) then
local username = text:match("^رفع مدير @(.*)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Manager'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم ترقيته مدير'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end 

if text and text:match("^رفع مدير (%d+)$") and Constructor(MATRIXg) then
local userid = text:match("^رفع مدير (%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'Manager'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته مدير'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم ترقيته مدير'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end  
if text == ("تنزيل مدير") and MATRIXg.reply_to_message_id_ and Constructor(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Manager'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المدراء'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مدير @(.*)$") and Constructor(MATRIXg) then
local username = text:match("^تنزيل مدير @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Manager'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المدراء'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مدير (%d+)$") and Constructor(MATRIXg) then
local userid = text:match("^تنزيل مدير (%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'Manager'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المدراء'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم تنزيله من المدراء'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------ adddev2 sudog
if text == ("رفع مطور ثانوي") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and SudoBot(MATRIXg) then
function Function_DRAGON(extra, result, success)
database:sadd(bot_id.."Dev:SoFi:2", result.sender_user_id_)
Reply_Status(MATRIXg,result.sender_user_id_,"reply","👻 تم ترقيته مطور ثانوي في البوت")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, Function_DRAGON, nil)
return false 
end
if text and text:match("^رفع مطور ثانوي @(.*)$") and SudoBot(MATRIXg) then
local username = text:match("^رفع مطور ثانوي @(.*)$")
function Function_DRAGON(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_,"👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id.."Dev:SoFi:2", result.id_)
Reply_Status(MATRIXg,result.id_,"reply","👻 تم ترقيته مطور ثانوي في البوت")  
else
send(MATRIXg.chat_id_, MATRIXg.id_,"👻 لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_DRAGON, nil)
return false 
end
if text and text:match("^رفع مطور ثانوي (%d+)$") and SudoBot(MATRIXg) then
local userid = text:match("^رفع مطور ثانوي (%d+)$")
database:sadd(bot_id.."Dev:SoFi:2", userid)
Reply_Status(MATRIXg,userid,"reply","👻 تم ترقيته مطور ثانوي في البوت")  
return false 
end
if text == ("تنزيل مطور ثانوي") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and SudoBot(MATRIXg) then
function Function_DRAGON(extra, result, success)
database:srem(bot_id.."Dev:SoFi:2", result.sender_user_id_)
Reply_Status(MATRIXg,result.sender_user_id_,"reply","👻 تم تنزيله من المطور ثانويين")  
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, Function_DRAGON, nil)
return false 
end
if text and text:match("^تنزيل مطور ثانوي @(.*)$") and SudoBot(MATRIXg) then
local username = text:match("^تنزيل مطور ثانوي @(.*)$")
function Function_DRAGON(extra, result, success)
if result.id_ then
database:srem(bot_id.."Dev:SoFi:2", result.id_)
Reply_Status(MATRIXg,result.id_,"reply","👻 تم تنزيله من المطور ثانويين")  
else
send(MATRIXg.chat_id_, MATRIXg.id_,"👻 لا يوجد حساب بهاذا المعرف")
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, Function_DRAGON, nil)
return false
end  
if text and text:match("^تنزيل مطور ثانوي (%d+)$") and SudoBot(MATRIXg) then
local userid = text:match("^تنزيل مطور ثانوي (%d+)$")
database:srem(bot_id.."Dev:SoFi:2", userid)
Reply_Status(MATRIXg,userid,"reply","👻 تم تنزيله من المطور ثانويين")  
return false 
end
if text == ("الثانوين") and SudoBot(MATRIXg) then
local list = database:smembers(bot_id.."Dev:SoFi:2")
t = "\n 👻  قائمة مطورين الثانويين للبوت \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " ??  لا يوجد مطورين ثانويين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
if text == ("مسح الثانوين") and SudoBot(MATRIXg) then
database:del(bot_id.."Dev:SoFi:2")
send(MATRIXg.chat_id_, MATRIXg.id_, "\n 👻 تم مسح قائمة المطورين الثانوين  ")
end
------------------------------------------------------------------------
if text == ("رفع مدير عام") and MATRIXg.reply_to_message_id_ and Constructor(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'onall'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته مدير عام'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^رفع مدير عام @(.*)$") and Constructor(MATRIXg) then
local username = text:match("^رفع مدير عام @(.*)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'onall'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم ترقيته مدير عام'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end 

if text and text:match("^رفع مدير عام (%d+)$") and Constructor(MATRIXg) then
local userid = text:match("^رفع مدير عام (%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'onall'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته مدير عام'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم ترقيته مدير عام'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end  
if text == ("تنزيل مدير عام") and MATRIXg.reply_to_message_id_ and Constructor(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'onall'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المدراء'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مدير عام @(.*)$") and Constructor(MATRIXg) then
local username = text:match("^تنزيل مدير عام @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'onall'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المدراء'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مدير عام (%d+)$") and Constructor(MATRIXg) then
local userid = text:match("^تنزيل مدير عام (%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'onall'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المدراء'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم تنزيله من المدراء'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == ("رفع ادمن عام") and MATRIXg.reply_to_message_id_ and Constructor(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'moall'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته ادمن عام'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^رفع ادمن عام @(.*)$") and Constructor(MATRIXg) then
local username = text:match("^رفع ادمن عام @(.*)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'moall'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم ترقيته ادمن عام'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end 

if text and text:match("^رفع ادمن عام (%d+)$") and Constructor(MATRIXg) then
local userid = text:match("^رفع ادمن عام (%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:sadd(bot_id..'moall'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته ادمن عام'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم ترقيته ادمن عام'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end  
if text == ("تنزيل ادمن عام") and MATRIXg.reply_to_message_id_ and Constructor(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'moall'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من الادمنه'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^تنزيل ادمن عام @(.*)$") and Constructor(MATRIXg) then
local username = text:match("^تنزيل ادمن عام @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'moall'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من الادمنه'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل ادمن عام (%d+)$") and Constructor(MATRIXg) then
local userid = text:match("^تنزيل ادمن عام (%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'moall'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من الادمنه'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم تنزيله من الادمنه'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text ==("رفع الادمنيه") and Manager(MATRIXg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = MATRIXg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local num2 = 0
local admins = data.members_
for i=0 , #admins do
if data.members_[i].bot_info_ == false and data.members_[i].status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id.."Mod:User"..MATRIXg.chat_id_, admins[i].user_id_)
num2 = num2 + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,b) 
if b.username_ == true then
end
if b.first_name_ == false then
database:srem(bot_id.."Mod:User"..MATRIXg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
database:srem(bot_id.."Mod:User"..MATRIXg.chat_id_, admins[i].user_id_)
end
end
if num2 == 0 then
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 لا يوجد ادمنيه ليتم رفعهم") 
else
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تمت ترقيه { "..num2.." } من الادمنيه") 
end
end,nil)   
end
if text == 'مسح الادمنيه' and Manager(MATRIXg) then
database:del(bot_id..'Mod:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم مسح الادمنيه')
end
if text == ("الادمنيه") and Manager(MATRIXg) then
local list = database:smembers(bot_id..'Mod:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة الادمنيه \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد ادمنيه"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
if text == ("تاك للادمنيه") or text == ("صيح الادمنيه") then
local list = database:smembers(bot_id..'Mod:User'..MATRIXg.chat_id_)
t = "\n 👻 وينكم تعالو يريدوكم بالجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- ↝ '..v..' ↜\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد ادمنيه"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
if text == ("رفع ادمن") and MATRIXg.reply_to_message_id_ and Manager(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
database:sadd(bot_id..'Mod:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته ادمن'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع ادمن @(.*)$") and Manager(MATRIXg) then
local username = text:match("^رفع ادمن @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Mod:User'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم ترقيته ادمن'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^رفع ادمن (%d+)$") and Manager(MATRIXg) then
local userid = text:match("^رفع ادمن (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
database:sadd(bot_id..'Mod:User'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته ادمن'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم ترقيته ادمن'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("تنزيل ادمن") and MATRIXg.reply_to_message_id_ and Manager(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من الادمنيه'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل ادمن @(.*)$") and Manager(MATRIXg) then
local username = text:match("^تنزيل ادمن @(.*)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من الادمنيه'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل ادمن (%d+)$") and Manager(MATRIXg) then
local userid = text:match("^تنزيل ادمن (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من الادمنيه'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم تنزيله من الادمنيه'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end
if text == 'مسح المنظفين' and BasicConstructor(MATRIXg) then
database:del(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم مسح المنظفين')
end
if text == ("المنظفين") and BasicConstructor(MATRIXg) then
local list = database:smembers(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_)
t = "\n 👻 قائمة المنظفين \n━━━━━━𝓓𝓡𝓖━━━━━━\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد المنظفين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
if text == ("تاك للمنظفين") or text == ("صيح المنظفين") then
local list = database:smembers(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_)
t = "\n 👻 وينكم تعالو يريدوكم بالجروب \n━━━━━━𝓓𝓡𝓖━━━━━━\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- ↝ '..v..' ↜\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد منظفيه"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
if text == ("رفع منظف") and MATRIXg.reply_to_message_id_ and BasicConstructor(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not BasicConstructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
database:sadd(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته منظف'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع منظف @(.*)$") and BasicConstructor(MATRIXg) then
local username = text:match("^رفع منظف @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not BasicConstructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم ترقيته منظف'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^رفع منظف (%d+)$") and BasicConstructor(MATRIXg) then
local userid = text:match("^رفع منظف (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not BasicConstructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
database:sadd(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم ترقيته منظف'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم ترقيته منظف'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end
if text == ("تنزيل منظف") and MATRIXg.reply_to_message_id_ and BasicConstructor(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المنظفين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل منظف @(.*)$") and BasicConstructor(MATRIXg) then
local username = text:match("^تنزيل منظف @(.*)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المنظفين'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل منظف (%d+)$") and BasicConstructor(MATRIXg) then
local userid = text:match("^تنزيل منظف (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المنظفين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم تنزيله من المنظفين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == ("طرد") and MATRIXg.reply_to_message_id_ ~=0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:kick'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الطرد') 
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع طرد البوت ")
return false 
end
if Can_or_NotCan(result.sender_user_id_, MATRIXg.chat_id_) == true then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 عذرا لا تستطيع طرد ( '..Rutba(result.sender_user_id_,MATRIXg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = MATRIXg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
statusk  = '\n 👻 تم طرد الـعـضو '
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statusk)
end,nil)
chat_kick(result.chat_id_, result.sender_user_id_)
end,nil)   
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end  
if text and text:match("^طرد @(.*)$") and Mod(MATRIXg) then 
local username = text:match("^طرد @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:kick'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الطرد') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع طرد البوت ")
return false 
end
if Can_or_NotCan(result.id_, MATRIXg.chat_id_) == true then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 عذرا لا تستطيع طرد ( '..Rutba(result.id_,MATRIXg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = MATRIXg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_,"⚠| عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
statusk  = '\n 👻 تم طرد الـعـضو '
texts = usertext..statusk
chat_kick(MATRIXg.chat_id_, result.id_)
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end,nil)   
end
else
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  

if text and text:match("^طرد (%d+)$") and Mod(MATRIXg) then 
local userid = text:match("^طرد (%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:kick'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الطرد') 
return false
end
if tonumber(userid) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع طرد البوت ")
return false 
end
if Can_or_NotCan(userid, MATRIXg.chat_id_) == true then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 عذرا لا تستطيع طرد ( '..Rutba(userid,MATRIXg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = MATRIXg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
chat_kick(MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
 usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
 statusk  = '\n 👻 تم طرد الـعـضو '
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statusk)
else
 usertext = '\n 👻 الـعـضو   ⇇'..userid..''
 statusk  = '\n 👻 تم طرد الـعـضو '
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statusk)
end;end,nil)
end,nil)   
end
return false
end
------------------------------------------------------------------------
------------------------------------------------------------------------
if text == 'مسح المميزين' and Mod(MATRIXg) then
database:del(bot_id..'Special:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم مسح المميزين')
end
if text == ("المميزين") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Special:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة مميزين الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد مميزين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
if text == ("تاك للمميزين") or text == ("صيح المميزين") then
local list = database:smembers(bot_id..'Special:User'..MATRIXg.chat_id_)
t = "\n 👻 وينكم تعالو يريدوكم بالجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- {[@"..username.."]}\n"
else
t = t..""..k.."- ↝ '..v..' ↜\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد مميزين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
if text == ("رفع مميز") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Special:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local  statuss  = '\n 👻 تم ترقيته مميز'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع مميز @(.*)$") and Mod(MATRIXg) then
local username = text:match("^رفع مميز @(.*)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Special:User'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
local  statuss  = '\n 👻 تم ترقيته مميز'
texts = usertext..statuss
else
texts = ' ?? لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match("^رفع مميز (%d+)$") and Mod(MATRIXg) then
local userid = text:match("^رفع مميز (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
database:sadd(bot_id..'Special:User'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local  statuss  = '\n 👻 تم ترقيته مميز'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
local  statuss  = '\n 👻 تم ترقيته مميز'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end;end,nil)
return false
end

if (text == ("تنزيل مميز")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المميزين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل مميز @(.*)$") and Mod(MATRIXg) then
local username = text:match("^تنزيل مميز @(.*)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المميزين'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match("^تنزيل مميز (%d+)$") and Mod(MATRIXg) then
local userid = text:match("^تنزيل مميز (%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 لعضو  ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيله من المميزين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم تنزيله من المميزين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end  
------------------------------------------------------------------------
if text == 'مسح المتوحدين' and Mod(MATRIXg) then
database:del(bot_id..'Mote:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم مسح جميع المتوحدين')
end
if text == ("تاك للمتوحدين") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Mote:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة متوحدين الجروب \n⧬━┅┅┄⟞❲[MATRIX](t.me/UU_matrixx)❳⟝┄┉┉━⧬\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.." ⇇المتوحد [@"..username.."]\n"
else
t = t..""..k.." ⇇المتوحد `"..v.."`\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد متوحدين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع متوحد") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Mote:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'DEVBESSO')..')'
local  statuss  = '\n 👻 تم رفع الـعـضو  متوحد في الجروب \n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل متوحد")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Mote:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيل الـعـضو  متوحد في الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح الزوجات' and Mod(MATRIXg) then
database:del(bot_id..'Mode:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم مسح جميع الزوجات')
end
if text == ("تاك للزوجات") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Mode:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمه زوجات الجروب \n 👻═───═❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳═───═??\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.." ⇇الزوجه [@"..username.."]\n"
else
t = t..""..k.." ⇇الزوجه `"..v.."`\n"
end
end
if #list == 0 then
t = " 👻 مع الاسف لا يوجد زوجه"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع زوجتي") or text == ("زواج") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Mode:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 العضــو  ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'DEVBESSO')..')'
local  statuss  = '\n 👻 تم رفع العضــو زوجه في الجروب \n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if text == ("تنزيل زوجتي") or text == ("طلاق") and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Mode:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 العضــو  ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيل العضــو الزوجات من الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح الكلاب' and Mod(MATRIXg) then
database:del(bot_id..'Modde:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم مسح جميع الكلاب')
end
if text == ("تاك للكلاب") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Modde:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمه كلاب الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.." ⇇الكلب [@"..username.."]\n"
else
t = t..""..k.." ⇇الكلب `"..v.."`\n"
end
end
if #list == 0 then
t = " 👻 مع الاسف لا يوجد كلاب"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع كلب") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Modde:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 العضــو  ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'DEVBESSO')..')'
local  statuss  = '\n 👻 تم رفع العضــو كلب في الجروب \n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل كلب")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Modde:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 العضــو  ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيل العضــو كلب من الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'ممسح الحمير' and Mod(MATRIXg) then
database:del(bot_id..'Sakl:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تنزيل جميع حمير من الجروب')
end
if text == ("تاك للحمير") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Sakl:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة حمير الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.." ⇇الحمار [@"..username.."]\n"
else
t = t..""..k.." ⇇الحمار `"..v.."`\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد حمير"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع حمار") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Sakl:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local  statuss  = '\n 👻 تم رفع المتهم حمار بالجروب\n 👻 الان اصبح حمار الجروب'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end


if (text == ("تنزيل حمار")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Sakl:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيل الـعـضو  حمار\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح الوتكات' and Mod(MATRIXg) then
database:del(bot_id..'Motte:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تنزيل جميع وتكات الجروب')
end
if text == ("تاك للوتكات") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Motte:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة وتكات الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.." ⇇الوتكه [@"..username.."]\n"
else
t = t..""..k.." ⇇الوتكه `"..v.."`\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد وتكات"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع وتكه") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Motte:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local  statuss  = '\n 👻 تم رفع وتكه في الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل وتكه")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Motte:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيل وتكه في الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح القرده' and Mod(MATRIXg) then
database:del(bot_id..'Motee:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تنزيل جميع القرده بالجروب')
end
if text == ("تاك للقرود") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Motee:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة القرود الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.." ⇇القرد [@"..username.."]\n"
else
t = t..""..k.." ⇇القرد `"..v.."`\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد قرد"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع قرد") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Motee:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local  statuss  = '\n 👻 تم رفع قرد في الجروب\n 👻 تعال حبي استلم موزه'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل قرد")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Motee:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيل قرد من الجروب\n 👻 رجع موزه حبي'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح الارامل' and Mod(MATRIXg) then
database:del(bot_id..'Bro:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تنزيل جميع الارامل بالجروب')
end
if text == ("تاك للارامل") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Bro:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة ارامل الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.." ⇇الارمله [@"..username.."]\n"
else
t = t..""..k.." ⇇الارمله `"..v.."`\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد ارامل"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع ارمله") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Bro:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local  statuss  = '\n 👻 تم رفع ارمله في الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل ارمله")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Bro:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيل ارمله من الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح الخولات' and Mod(MATRIXg) then
database:del(bot_id..'Girl:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تنزيل جميع الخولات بالجروب')
end
if text == ("تاك للخولات") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Girl:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة خولات الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.." ⇇الخول [@"..username.."]\n"
else
t = t..""..k.." ⇇الخول `"..v.."`\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد خولات"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع خول") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Girl:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local  statuss  = '\n 👻 تم رفع خول في الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل خول")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Girl:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيل خول من الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح البقرات' and Mod(MATRIXg) then
database:del(bot_id..'Bakra:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تنزيل جميع البقرات بالجروب')
end
if text == ("تاك للبقرات") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Bakra:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة البقرات الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.." ⇇البقره [@"..username.."]\n"
else
t = t..""..k.." ⇇البقره "..v.."\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد البقره"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع بقره") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Bakra:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local  statuss  = '\n 👻 تم رفع بقره في الجروب\n 👻 ها يالهايشه تع احلبك'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل بقره")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n??  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Bakra:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيل بقره من الجروب\n 👻 تعال هاك حليب مالتك'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح المزز' and Mod(MATRIXg) then
database:del(bot_id..'Tele:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تنزيل جميع المزز بالجروب')
end
if text == ("تاك للمزز") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Tele:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة مزز الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.." ⇇االمزه@"..username.."]\n"
else
t = t..""..k.." ⇇المزه "..v.."\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد مزز"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع مزه") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Tele:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local  statuss  = '\n 👻 تم رفع مزه في الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل مزه")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Tele:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيل مزه من الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح الاكساس' and Mod(MATRIXg) then
database:del(bot_id..'Zahf:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تنزيل جميع االاكساس')
end
if text == ("تاك للاكساس") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Zahf:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة كساس الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.." ⇇االكس[@"..username.."]\n"
else
t = t..""..k.." ⇇الكس "..v.."\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد كس"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع كس") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Zahf:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local  statuss  = '\n 👻 تم رفع كس في الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل كس")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Zahf:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيل كس من الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text == 'مسح قلبي' and Mod(MATRIXg) then
database:del(bot_id..'Zahf:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تنزيل جميع القلوب ')
end
if text == ("تاك لقلبي") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Zahf:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة القلوب في الجروب\n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."← قلبي [@"..username.."]\n"
else
t = t..""..k.."← قلبي "..v.."\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد قلوب"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع قلبي") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Zahf:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو  ← ['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local  statuss  = '\n 👻 تم رفع قلبي في الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل قلبي")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Zahf:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو  ← ['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيل قلبي من الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح ابني' and Mod(MATRIXg) then
database:del(bot_id..'Zahf:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تنزيل جميع أولادي')
end
if text == ("تاك لولادي") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Zahf:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة كساس الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."← ابني [@"..username.."]\n"
else
t = t..""..k.."← ابني "..v.."\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد ابني"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع ابني") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Zahf:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو  ← ['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local  statuss  = '\n 👻 تم رفع ابني في الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل ابني")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Zahf:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو  ← ['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيل ابني من الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح بنتي' and Mod(MATRIXg) then
database:del(bot_id..'Zahf:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تنزيل جميع االاكساس')
end
if text == ("تاك لبناتي") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Zahf:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة بناتي الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."← بنتي [@"..username.."]\n"
else
t = t..""..k.."← بنتي"..v.."\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد بنات"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع بنتي") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Zahf:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو  ← ['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local  statuss  = '\n 👻 تم رفع بنتي في الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل بنتي")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Zahf:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو  ← ['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيل بنتي من الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'مسح خاين' and Mod(MATRIXg) then
database:del(bot_id..'Zahf:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تنزيل جميع االاكساس')
end
if text == ("تاك للخاينين") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Zahf:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة الخاينين الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."← خاين [@"..username.."]\n"
else
t = t..""..k.."← خاين"..v.."\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد خاينين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع خاين") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Zahf:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو  ← ['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local  statuss  = '\n 👻 تم رفع خاين في الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل خاين")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Zahf:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو  ← ['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تنزيل خاين من الجروب\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'تنزيل الرقصات' and Mod(MATRIXg) then
database:del(bot_id..'Zahf:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تنزيل جميع زواحف')
end
if text == ("تاك للرقاصات") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Zahf:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة رقاصات الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.." ⇇الرقاصه [@"..username.."]\n"
else
t = t..""..k.." ⇇الرقاصه "..v.."\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد رقاصات"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع رقاصه") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻 يرجى الاشتراك بالقناه اولا \n 👻 اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Zahf:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'UU_matrixx')..')'
local statuss = '\n 👻 تم رفع رقاصه في الجروب\n 👻 مبقتش شريفه لا اله الي الله'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل رقاصه")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻 يرجى الاشتراك بالقناه اولا \n 👻 اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Zahf:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'UU_matrixx')..')'
status = '\n 👻 تم تنزيل رقاصه من الجروب\n 👻 بقت شريفه لا اله الي الله'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == 'تنزيل المتناكين' and Mod(MATRIXg) then
database:del(bot_id..'Jred:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تنزيل جميع جريزي')
end
if text == ("تاك للمتناكين") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Jred:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة المتناكين الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.." ⇇المتناك [@"..username.."]\n"
else
t = t..""..k.." ⇇المتناك "..v.."\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد متناكين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع علي زبي") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻 يرجى الاشتراك بالقناه اولا \n 👻 اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Jred:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'UU_matrixx')..')'
local statuss = '\n 👻 تم رفع الـعـضو  علي زبك بنجاح\n 👻 تفضل ابدا نيك'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل من زبي")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻 يرجى الاشتراك بالقناه اولا \n 👻 اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Jred:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'UU_matrixx')..')'
status = '\n 👻 تم تنزيل الـعـضو  من زبك\n 👻 هيفضل متناك بردو'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if text == 'مسح الحكاكين' and Mod(MATRIXg) then
database:del(bot_id..'Zahf:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم مسح كل الحكاكين')
end
if text == ("تاك للحكاكين") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Zahf:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة حكاكين الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."← الحكاك [@"..username.."]\n"
else
t = t..""..k.."← الحكاك `"..v.."`\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد حكاك"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع حكاك") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Zahf:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو  ← ['..data.first_name_..'](t.me/'..(data.username_ or 's_o_op')..')'
local  statuss  = '\n 👻 تم رفع حكاك في الجروب\n 👻 احمرت ولا لسا'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل حكاك")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Zahf:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو  ← ['..data.first_name_..'](t.me/'..(data.username_ or 's_o_op')..')'
status  = '\n 👻 تم تنزيل حكاك من الجروب\n 👻 لا يسطت هيفضل حكاك رسمي'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text == 'مسح النسوان' and Mod(MATRIXg) then
database:del(bot_id..'Girl:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم مسح كل النسوان بالجروب')
end
if text == ("تاك للنسوان") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Girl:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة نسوان الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."← المره [@"..username.."]\n"
else
t = t..""..k.."← المره `"..v.."`\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد نسوان غيرك"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("رفع مره") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Girl:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو  ← ['..data.first_name_..'](t.me/'..(data.username_ or 's_o_op')..')'
local  statuss  = '\n 👻 تم رفع مره في الجروب\n 👻 ها صرتي من نسواني تعي ندخل'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل مره")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Girl:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو  ← ['..data.first_name_..'](t.me/'..(data.username_ or 's_o_op')..')'
status  = '\n 👻 تم تنزيل مره من الجروب\n 👻 بتاعي غضبان عليكي ليوم الدين'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text == 'مسح المتزوجين' and Mod(MATRIXg) then
database:del(bot_id..'Mode:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم مسح جميع المتزوجين')
end
if text == ("تاك للمتزوجين") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Mode:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمه ازواج الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."← الزوج [@"..username.."]\n"
else
t = t..""..k.."← الزوجه `"..v.."`\n"
end
end
if #list == 0 then
t = " 👻 مع الاسف لا يوجد متزوجين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("زواج") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الرفع') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Mode:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 العضــو ← ['..data.first_name_..'](t.me/'..(data.username_ or 'DEVBESSO')..')'
local  statuss  = '\n 👻 تم زواجكم بنجاح في الجروب \n 👻 الطلاق امتي عشان ابقي موجود '
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("طلاق")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Mode:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 العضــو ← ['..data.first_name_..'](t.me/'..(data.username_ or 's_o_op')..')'
status  = '\n 👻 تم طلاقكم بنجاح في الجروب\n 👻 اوجعو تاني ونبي'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end 
-----------------------------------------------------
if text == 'مسح الميتين' and Mod(MATRIXg) then
database:del(bot_id..'Zahf:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تنزيل جميع االاكساس')
end
if text == ("تاك للميتنين") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Zahf:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة الميتنين \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.." ⇇الميت[@"..username.."]\n"
else
t = t..""..k.." ⇇الميت "..v.."\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد ميتين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
---------
if text == ("تخ") and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل القتل') 
return false
end
function start_function(extra, result, success)
database:sadd(bot_id..'Zahf:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local  statuss  = '\n 👻تم قتله بنجاح\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("اصحه")) and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Zahf:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم رجوع للحياه\n'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text == 'مسح المحظورين' and Mod(MATRIXg) then
database:del(bot_id..'Ban:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 تم مسح المحظورين')
end
if text == ("المحظورين") then
local list = database:smembers(bot_id..'Ban:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة محظورين الجروب \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد محظورين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
if text == ("حظر") and MATRIXg.reply_to_message_id_ ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:kick'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الحظر') 
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع حظر البوت ")
return false 
end
if Can_or_NotCan(result.sender_user_id_, MATRIXg.chat_id_) == true then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 عذرا لا تستطيع حظر ( '..Rutba(result.sender_user_id_,MATRIXg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = MATRIXg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
database:sadd(bot_id..'Ban:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم حظره'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
chat_kick(result.chat_id_, result.sender_user_id_)
end,nil)   
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if text and text:match("^حظر @(.*)$") and Mod(MATRIXg) then
local username = text:match("^حظر @(.*)$")
if database:get(bot_id..'Lock:kick'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الحظر') 
return false
end
function start_function(extra, result, success)
if result.id_ then
if Can_or_NotCan(result.id_, MATRIXg.chat_id_) == true then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 عذرا لا تستطيع حظر ( '..Rutba(result.id_,MATRIXg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = MATRIXg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
database:sadd(bot_id..'Ban:User'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻  المستخدم  ⇇['..result.title_..'](t.me/'..(username or 'GLOBLA')..')'
status  = '\n 👻 تم حظره'
texts = usertext..status
chat_kick(MATRIXg.chat_id_, result.id_)
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end,nil)   
end
else
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match("^حظر (%d+)$") and Mod(MATRIXg) then
local userid = text:match("^حظر (%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Lock:kick'..MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل الحظر') 
return false
end
if tonumber(userid) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع حظر البوت")
return false 
end
if Can_or_NotCan(userid, MATRIXg.chat_id_) == true then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 عذرا لا تستطيع حظر ( '..Rutba(userid,MATRIXg.chat_id_)..' )')
else
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = MATRIXg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusKicked" },},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
database:sadd(bot_id..'Ban:User'..MATRIXg.chat_id_, userid)
chat_kick(MATRIXg.chat_id_, userid)  
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم حظره'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n?? تم حظره'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
end,nil)   
end
return false
end
if text == ("الغاء حظر") and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 انا لست محظورآ \n') 
return false 
end
database:srem(bot_id..'Ban:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم الغاء حظره'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = MATRIXg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
 
if text and text:match("^الغاء حظر @(.*)$") and Mod(MATRIXg) then
local username = text:match("^الغاء حظر @(.*)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 انا لست محظورآ \n') 
return false 
end
database:srem(bot_id..'Ban:User'..MATRIXg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = MATRIXg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم الغاء حظره'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match("^الغاء حظر (%d+)$") and Mod(MATRIXg) then
local userid = text:match("^الغاء حظر (%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if tonumber(userid) == tonumber(bot_id) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 انا لست محظورآ \n') 
return false 
end
database:srem(bot_id..'Ban:User'..MATRIXg.chat_id_, userid)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = MATRIXg.chat_id_, user_id_ = userid, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم الغاء حظره'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم الغاء حظره'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end
------------------------------------------------------------------------
if text == 'مسح المكتومين' and Mod(MATRIXg) then
database:del(bot_id..'Muted:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم مسح المكتومين')
end
if text == ("المكتومين") and Mod(MATRIXg) then
local list = database:smembers(bot_id..'Muted:User'..MATRIXg.chat_id_)
t = "\n 👻 قائمة المكتومين \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد مكتومين"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end

if text == ("كتم") and MATRIXg.reply_to_message_id_ ~= 0 and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع كتم البوت ")
return false 
end
if Can_or_NotCan(result.sender_user_id_, MATRIXg.chat_id_) == true then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 عذرا لا تستطيع كتم ( '..Rutba(result.sender_user_id_,MATRIXg.chat_id_)..' )')
else
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم كتمه'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^كتم @(.*)$") and Mod(MATRIXg) then
local username = text:match("^كتم @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع كتم البوت ")
return false 
end
if Can_or_NotCan(result.id_, MATRIXg.chat_id_) == true then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 عذرا لا تستطيع كتم ( '..Rutba(result.id_,MATRIXg.chat_id_)..' )')
else
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم كتمه'
texts = usertext..status
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
else
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text and text:match('^كتم (%d+) (.*)$') and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
local TextEnd = {string.match(text, "^(كتم) (%d+) (.*)$")}
function start_function(extra, result, success)
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Can_or_NotCan(result.sender_user_id_, MATRIXg.chat_id_) then
send(MATRIXg.chat_id_, MATRIXg.id_, "\n 👻 عذرا لا تستطيع كتم ( "..Rutba(result.sender_user_id_,MATRIXg.chat_id_).." )")
else
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم كتم لمدة ~ { '..TextEnd[2]..' '..TextEnd[3]..'}'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..MATRIXg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(MATRIXg.date_+Time))
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end


if text and text:match('^كتم (%d+) (.*) @(.*)$') and Mod(MATRIXg) then
local TextEnd = {string.match(text, "^(كتم) (%d+) (.*) @(.*)$")}
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Can_or_NotCan(result.id_, MATRIXg.chat_id_) then
send(MATRIXg.chat_id_, MATRIXg.id_, "\n 👻 عذرا لا تستطيع كتم ( "..Rutba(result.id_,MATRIXg.chat_id_).." )")
else
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم كتم لمدة ~ { '..TextEnd[2]..' '..TextEnd[3]..'}'
texts = usertext..status
send(MATRIXg.chat_id_, MATRIXg.id_,texts)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..MATRIXg.chat_id_.."&user_id="..result.id_..'&until_date='..tonumber(MATRIXg.date_+Time))
end
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = TextEnd[4]}, start_function, nil)
return false
end
if text and text:match("^كتم (%d+)$") and Mod(MATRIXg) then
local userid = text:match("^كتم (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if tonumber(userid) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع كتم البوت ")
return false 
end
if Can_or_NotCan(userid, MATRIXg.chat_id_) == true then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 عذرا لا تستطيع كتم ( '..Rutba(userid,MATRIXg.chat_id_)..' )')
else
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
database:sadd(bot_id..'Muted:User'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم كتمه'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم كتمه'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
end
return false
end
if text == ("الغاء كتم") and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
database:srem(bot_id..'Muted:User'..MATRIXg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم الغاء كتمه'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^الغاء كتم @(.*)$") and Mod(MATRIXg) then
local username = text:match("^الغاء كتم @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
database:srem(bot_id..'Muted:User'..MATRIXg.chat_id_, result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم الغاء كتمه'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match("^الغاء كتم (%d+)$") and Mod(MATRIXg) then
local userid = text:match("^الغاء كتم (%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:srem(bot_id..'Muted:User'..MATRIXg.chat_id_, userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم الغاء كتمه'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم الغاء كتمه'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end

if text == ("تقيد") and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع تقيد البوت ")
return false 
end
if Can_or_NotCan(result.sender_user_id_, MATRIXg.chat_id_) then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 عذرا لا تستطيع تقيد ( '..Rutba(result.sender_user_id_,MATRIXg.chat_id_)..' )')
else
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..MATRIXg.chat_id_.."&user_id="..result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تقيده'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد @(.*)$") and Mod(MATRIXg) then
local username = text:match("^تقيد @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع تقيد البوت ")
return false 
end
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if Can_or_NotCan(result.id_, MATRIXg.chat_id_) then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 عذرا لا تستطيع تقيد ( '..Rutba(result.id_,MATRIXg.chat_id_)..' )')
return false 
end      
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..MATRIXg.chat_id_.."&user_id="..result.id_)
 
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم تقيده'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match('^تقيد (%d+) (.*)$') and tonumber(MATRIXg.reply_to_message_id_) ~= 0 and Mod(MATRIXg) then
local TextEnd = {string.match(text, "^(تقيد) (%d+) (.*)$")}
function start_function(extra, result, success)
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Can_or_NotCan(result.sender_user_id_, MATRIXg.chat_id_) then
send(MATRIXg.chat_id_, MATRIXg.id_, "\n 👻 عذرا لا تستطيع تقيد ( "..Rutba(result.sender_user_id_,MATRIXg.chat_id_).." )")
else
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تقيده لمدة ~ { '..TextEnd[2]..' '..TextEnd[3]..'}'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..MATRIXg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(MATRIXg.date_+Time))
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end


if text and text:match('^تقيد (%d+) (.*) @(.*)$') and Mod(MATRIXg) then
local TextEnd = {string.match(text, "^(تقيد) (%d+) (.*) @(.*)$")}
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Can_or_NotCan(result.id_, MATRIXg.chat_id_) then
send(MATRIXg.chat_id_, MATRIXg.id_, "\n 👻 عذرا لا تستطيع تقيد ( "..Rutba(result.id_,MATRIXg.chat_id_).." )")
else
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم تقيده لمدة ~ { '..TextEnd[2]..' '..TextEnd[3]..'}'
texts = usertext..status
send(MATRIXg.chat_id_, MATRIXg.id_,texts)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..MATRIXg.chat_id_.."&user_id="..result.id_..'&until_date='..tonumber(MATRIXg.date_+Time))
end
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = TextEnd[4]}, start_function, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد (%d+)$") and Mod(MATRIXg) then
local userid = text:match("^تقيد (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if tonumber(userid) == tonumber(bot_id) then  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا تسطيع تقيد البوت ")
return false 
end
if Can_or_NotCan(userid, MATRIXg.chat_id_) then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 عذرا لا تستطيع تقيد ( '..Rutba(userid,MATRIXg.chat_id_)..' )')
else
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" ..userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم تقيده'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم تقيده'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
end
return false
end
------------------------------------------------------------------------
if text == ("الغاء تقيد") and MATRIXg.reply_to_message_id_ and Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم الغاء تقيد'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقيد @(.*)$") and Mod(MATRIXg) then
local username = text:match("^الغاء تقيد @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم الغاء تقيد'
texts = usertext..status
else
texts = ' 👻 لا يوجد حساب بهاذا المعرف'
end
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقيد (%d+)$") and Mod(MATRIXg) then
local userid = text:match("^الغاء تقيد (%d+)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" ..userid.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم الغاء تقيد'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
else
usertext = '\n 👻 الـعـضو   ⇇'..userid..''
status  = '\n 👻 تم الغاء تقيد'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end;end,nil)
return false
end
if text and text:match('^رفع القيود @(.*)') and Manager(MATRIXg) then 
local username = text:match('^رفع القيود @(.*)') 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if DevSoFi(MATRIXg) then
database:srem(bot_id..'GBan:User',result.id_)
database:srem(bot_id..'Ban:User'..MATRIXg.chat_id_,result.id_)
database:srem(bot_id..'Muted:User'..MATRIXg.chat_id_,result.id_)
database:srem(bot_id..'Gmute:User'..MATRIXg.chat_id_,result.id_)
usertext = '\n ?? الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم الغاء جميع القيود'
texts = usertext..status
send(MATRIXg.chat_id_, MATRIXg.id_,texts)
else
database:srem(bot_id..'Ban:User'..MATRIXg.chat_id_,result.id_)
database:srem(bot_id..'Muted:User'..MATRIXg.chat_id_,result.id_)
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻 تم الغاء جميع القيود'
texts = usertext..status
send(MATRIXg.chat_id_, MATRIXg.id_,texts)
end
else
Text = ' 👻 المعرف غلط'
send(MATRIXg.chat_id_, MATRIXg.id_,Text)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
if text == "رفع القيود" and Manager(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if DevSoFi(MATRIXg) then
database:srem(bot_id..'GBan:User',result.sender_user_id_)
database:srem(bot_id..'Ban:User'..MATRIXg.chat_id_,result.sender_user_id_)
database:srem(bot_id..'Muted:User'..MATRIXg.chat_id_,result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم الغاء جميع القيود'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
else
database:srem(bot_id..'Ban:User'..MATRIXg.chat_id_,result.sender_user_id_)
database:srem(bot_id..'Muted:User'..MATRIXg.chat_id_,result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻 تم الغاء جميع القيود'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
end
if text and text:match('^كشف القيود @(.*)') and Manager(MATRIXg) then 
local username = text:match('^كشف القيود @(.*)') 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
if database:sismember(bot_id..'Muted:User'..MATRIXg.chat_id_,result.id_) then
Muted = 'مكتوم'
else
Muted = 'غير مكتوم'
end
if database:sismember(bot_id..'Ban:User'..MATRIXg.chat_id_,result.id_) then
Ban = 'محظور'
else
Ban = 'غير محظور'
end
if database:sismember(bot_id..'GBan:User',result.id_) then
GBan = 'محظور عام'
else
GBan = 'غير محظور عام'
end
Textt = " 👻 الحظر العام  ⇇"..GBan.."\n 👻 الحظر  ⇇"..Ban.."\n 👻 الكتم  ⇇"..Muted..""
send(MATRIXg.chat_id_, MATRIXg.id_,Textt)
else
Text = ' 👻 المعرف غلط'
send(MATRIXg.chat_id_, MATRIXg.id_,Text)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end

if text == "كشف القيود" and Manager(MATRIXg) then 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if database:sismember(bot_id..'Muted:User'..MATRIXg.chat_id_,result.sender_user_id_) then
Muted = 'مكتوم'
else
Muted = 'غير مكتوم'
end
if database:sismember(bot_id..'Ban:User'..MATRIXg.chat_id_,result.sender_user_id_) then
Ban = 'محظور'
else
Ban = 'غير محظور'
end
if database:sismember(bot_id..'GBan:User',result.sender_user_id_) then
GBan = 'محظور عام'
else
GBan = 'غير محظور عام'
end
if database:sismember(bot_id..'Gmute:User',result.sender_user_id_) then
Gmute = 'محظور عام'
else
Gmute = 'غير محظور عام'
end
Textt = " 👻 الحظر العام  ⇇"..GBan.."\n 👻 الكتم العام  ⇇"..Gmute.."\n 👻 الحظر  ⇇"..Ban.."\n 👻 الكتم  ⇇"..Muted..""
send(MATRIXg.chat_id_, MATRIXg.id_,Textt)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
end
if text == ("رفع مشرف") and MATRIXg.reply_to_message_id_ ~= 0 and Constructor(MATRIXg) then
function start_function(extra, result, success)
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻  الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻  الايدي  ⇇`'..result.sender_user_id_..'`\n 👻  تم رفعه مشرف '
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع مشرف @(.*)$") and Constructor(MATRIXg) then
local username = text:match("^رفع مشرف @(.*)$")
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻  عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
usertext = '\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻  تم رفعه مشرف '
texts = usertext..status
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
else
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻  لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text == ("تنزيل مشرف") and MATRIXg.reply_to_message_id_ ~= 0 and Constructor(MATRIXg) then
function start_function(extra, result, success)
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻  الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻  الايدي  ⇇`'..result.sender_user_id_..'`\n 👻  تم تنزيله ادمن من الجروب'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل مشرف @(.*)$") and Constructor(MATRIXg) then
local username = text:match("^تنزيل مشرف @(.*)$")
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," ??  عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
usertext = '\n 👻  الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻  تم تنزيله ادمن من الجروب'
texts = usertext..status
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
else
send(MATRIXg.chat_id_, MATRIXg.id_, '⚠¦ لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end


if text == ("رفع مشرف كامل") and MATRIXg.reply_to_message_id_ ~= 0 and BasicConstructor(MATRIXg) then
function start_function(extra, result, success)
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻  الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n ​ 👻 الايدي  ⇇`'..result.sender_user_id_..'`\n 👻  تم رفعه مشرف بكل الصلاحيات'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع مشرف كامل @(.*)$") and BasicConstructor(MATRIXg) then
local username = text:match("^رفع مشرف @(.*)$")
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻  عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
usertext = '\n 👻  الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻  تم رفعه مشرف بكل الصلاحيات'
texts = usertext..status
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
else
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻  لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text == ("تنزيل مشرف كامل") and MATRIXg.reply_to_message_id_ ~= 0 and BasicConstructor(MATRIXg) then
function start_function(extra, result, success)
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻  الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻  الايدي  ⇇`'..result.sender_user_id_..'`\n 👻  تم تنزيله ادمن من الجروب بكل الصلاحيات'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل مشرف كامل @(.*)$") and BasicConstructor(MATRIXg) then
local username = text:match("^تنزيل مشرف @(.*)$")
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_,"⚠¦ عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
usertext = '\n 👻  الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻  تم تنزيله مشرف من الجروب بكل الصلاحيات'
texts = usertext..status
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
else
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻  لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
---------------------- بداء كشف المجموعة
----------------------------------------- انتهاء كشف المجموعة
if text == 'الاعدادات' and Mod(MATRIXg) then    
if database:get(bot_id..'lockpin'..MATRIXg.chat_id_) then    
lock_pin = '✓'
else 
lock_pin = '✘'    
end
if database:get(bot_id..'lock:tagservr'..MATRIXg.chat_id_) then    
lock_tagservr = '✓'
else 
lock_tagservr = '✘'    
end
if database:get(bot_id..'lock:text'..MATRIXg.chat_id_) then    
lock_text = '✓'
else 
lock_text = '✘'    
end
if database:get(bot_id.."lock:AddMempar"..MATRIXg.chat_id_) == 'kick' then
lock_add = '✓'
else 
lock_add = '✘'    
end    
if database:get(bot_id.."lock:Join"..MATRIXg.chat_id_) == 'kick' then
lock_join = '✓'
else 
lock_join = '✘'    
end    
if database:get(bot_id..'lock:edit'..MATRIXg.chat_id_) then    
lock_edit = '✓'
else 
lock_edit = '✘'    
end
print(welcome)
if database:get(bot_id..'Get:Welcome:Group'..MATRIXg.chat_id_) then
welcome = '✓'
else 
welcome = '✘'    
end
if database:get(bot_id..'lock:edit'..MATRIXg.chat_id_) then    
lock_edit_med = '✓'
else 
lock_edit_med = '✘'    
end
if database:hget(bot_id.."flooding:settings:"..MATRIXg.chat_id_, "flood") == "kick" then     
flood = 'بالطرد'     
elseif database:hget(bot_id.."flooding:settings:"..MATRIXg.chat_id_,"flood") == "keed" then     
flood = 'بالتقيد'     
elseif database:hget(bot_id.."flooding:settings:"..MATRIXg.chat_id_,"flood") == "mute" then     
flood = 'بالكتم'           
elseif database:hget(bot_id.."flooding:settings:"..MATRIXg.chat_id_,"flood") == "del" then     
flood = 'بالمسح'           
else     
flood = '✘'     
end
if database:get(bot_id.."lock:Photo"..MATRIXg.chat_id_) == "del" then
lock_photo = '✓' 
elseif database:get(bot_id.."lock:Photo"..MATRIXg.chat_id_) == "ked" then 
lock_photo = 'بالتقيد'   
elseif database:get(bot_id.."lock:Photo"..MATRIXg.chat_id_) == "ktm" then 
lock_photo = 'بالكتم'    
elseif database:get(bot_id.."lock:Photo"..MATRIXg.chat_id_) == "kick" then 
lock_photo = 'بالطرد'   
else
lock_photo = '✘'   
end    
if database:get(bot_id.."lock:Contact"..MATRIXg.chat_id_) == "del" then
lock_phon = '✓' 
elseif database:get(bot_id.."lock:Contact"..MATRIXg.chat_id_) == "ked" then 
lock_phon = 'بالتقيد'    
elseif database:get(bot_id.."lock:Contact"..MATRIXg.chat_id_) == "ktm" then 
lock_phon = 'بالكتم'    
elseif database:get(bot_id.."lock:Contact"..MATRIXg.chat_id_) == "kick" then 
lock_phon = 'بالطرد'    
else
lock_phon = '✘'    
end    
if database:get(bot_id.."lock:Link"..MATRIXg.chat_id_) == "del" then
lock_links = '✓'
elseif database:get(bot_id.."lock:Link"..MATRIXg.chat_id_) == "ked" then
lock_links = 'بالتقيد'    
elseif database:get(bot_id.."lock:Link"..MATRIXg.chat_id_) == "ktm" then
lock_links = 'بالكتم'    
elseif database:get(bot_id.."lock:Link"..MATRIXg.chat_id_) == "kick" then
lock_links = 'بالطرد'    
else
lock_links = '✘'    
end
if database:get(bot_id.."lock:Cmd"..MATRIXg.chat_id_) == "del" then
lock_cmds = '✓'
elseif database:get(bot_id.."lock:Cmd"..MATRIXg.chat_id_) == "ked" then
lock_cmds = 'بالتقيد'    
elseif database:get(bot_id.."lock:Cmd"..MATRIXg.chat_id_) == "ktm" then
lock_cmds = 'بالكتم'   
elseif database:get(bot_id.."lock:Cmd"..MATRIXg.chat_id_) == "kick" then
lock_cmds = 'بالطرد'    
else
lock_cmds = '✘'    
end
if database:get(bot_id.."lock:user:name"..MATRIXg.chat_id_) == "del" then
lock_user = '✓'
elseif database:get(bot_id.."lock:user:name"..MATRIXg.chat_id_) == "ked" then
lock_user = 'بالتقيد'    
elseif database:get(bot_id.."lock:user:name"..MATRIXg.chat_id_) == "ktm" then
lock_user = 'بالكتم'    
elseif database:get(bot_id.."lock:user:name"..MATRIXg.chat_id_) == "kick" then
lock_user = 'بالطرد'    
else
lock_user = '✘'    
end
if database:get(bot_id.."lock:hashtak"..MATRIXg.chat_id_) == "del" then
lock_hash = '✓'
elseif database:get(bot_id.."lock:hashtak"..MATRIXg.chat_id_) == "ked" then 
lock_hash = 'بالتقيد'    
elseif database:get(bot_id.."lock:hashtak"..MATRIXg.chat_id_) == "ktm" then 
lock_hash = 'بالكتم'    
elseif database:get(bot_id.."lock:hashtak"..MATRIXg.chat_id_) == "kick" then 
lock_hash = 'بالطرد'    
else
lock_hash = '✘'    
end
if database:get(bot_id.."lock:vico"..MATRIXg.chat_id_) == "del" then
lock_muse = '✓'
elseif database:get(bot_id.."lock:vico"..MATRIXg.chat_id_) == "ked" then 
lock_muse = 'بالتقيد'    
elseif database:get(bot_id.."lock:vico"..MATRIXg.chat_id_) == "ktm" then 
lock_muse = 'بالكتم'    
elseif database:get(bot_id.."lock:vico"..MATRIXg.chat_id_) == "kick" then 
lock_muse = 'بالطرد'    
else
lock_muse = '✘'    
end 
if database:get(bot_id.."lock:Video"..MATRIXg.chat_id_) == "del" then
lock_ved = '✓'
elseif database:get(bot_id.."lock:Video"..MATRIXg.chat_id_) == "ked" then 
lock_ved = 'بالتقيد'    
elseif database:get(bot_id.."lock:Video"..MATRIXg.chat_id_) == "ktm" then 
lock_ved = 'بالكتم'    
elseif database:get(bot_id.."lock:Video"..MATRIXg.chat_id_) == "kick" then 
lock_ved = 'بالطرد'    
else
lock_ved = '✘'    
end
if database:get(bot_id.."lock:Animation"..MATRIXg.chat_id_) == "del" then
lock_gif = '✓'
elseif database:get(bot_id.."lock:Animation"..MATRIXg.chat_id_) == "ked" then 
lock_gif = 'بالتقيد'    
elseif database:get(bot_id.."lock:Animation"..MATRIXg.chat_id_) == "ktm" then 
lock_gif = 'بالكتم'    
elseif database:get(bot_id.."lock:Animation"..MATRIXg.chat_id_) == "kick" then 
lock_gif = 'بالطرد'    
else
lock_gif = '✘'    
end
if database:get(bot_id.."lock:Sticker"..MATRIXg.chat_id_) == "del" then
lock_ste = '✓'
elseif database:get(bot_id.."lock:Sticker"..MATRIXg.chat_id_) == "ked" then 
lock_ste = 'بالتقيد'    
elseif database:get(bot_id.."lock:Sticker"..MATRIXg.chat_id_) == "ktm" then 
lock_ste = 'بالكتم'    
elseif database:get(bot_id.."lock:Sticker"..MATRIXg.chat_id_) == "kick" then 
lock_ste = 'بالطرد'    
else
lock_ste = '✘'    
end
if database:get(bot_id.."lock:geam"..MATRIXg.chat_id_) == "del" then
lock_geam = '✓'
elseif database:get(bot_id.."lock:geam"..MATRIXg.chat_id_) == "ked" then 
lock_geam = 'بالتقيد'    
elseif database:get(bot_id.."lock:geam"..MATRIXg.chat_id_) == "ktm" then 
lock_geam = 'بالكتم'    
elseif database:get(bot_id.."lock:geam"..MATRIXg.chat_id_) == "kick" then 
lock_geam = 'بالطرد'    
else
lock_geam = '✘'    
end    
if database:get(bot_id.."lock:vico"..MATRIXg.chat_id_) == "del" then
lock_vico = '✓'
elseif database:get(bot_id.."lock:vico"..MATRIXg.chat_id_) == "ked" then 
lock_vico = 'بالتقيد'    
elseif database:get(bot_id.."lock:vico"..MATRIXg.chat_id_) == "ktm" then 
lock_vico = 'بالكتم'    
elseif database:get(bot_id.."lock:vico"..MATRIXg.chat_id_) == "kick" then 
lock_vico = 'بالطرد'    
else
lock_vico = '✘'    
end    
if database:get(bot_id.."lock:Keyboard"..MATRIXg.chat_id_) == "del" then
lock_inlin = '✓'
elseif database:get(bot_id.."lock:Keyboard"..MATRIXg.chat_id_) == "ked" then 
lock_inlin = 'بالتقيد'
elseif database:get(bot_id.."lock:Keyboard"..MATRIXg.chat_id_) == "ktm" then 
lock_inlin = 'بالكتم'    
elseif database:get(bot_id.."lock:Keyboard"..MATRIXg.chat_id_) == "kick" then 
lock_inlin = 'بالطرد'
else
lock_inlin = '✘'
end
if database:get(bot_id.."lock:forward"..MATRIXg.chat_id_) == "del" then
lock_fwd = '✓'
elseif database:get(bot_id.."lock:forward"..MATRIXg.chat_id_) == "ked" then 
lock_fwd = 'بالتقيد'    
elseif database:get(bot_id.."lock:forward"..MATRIXg.chat_id_) == "ktm" then 
lock_fwd = 'بالكتم'    
elseif database:get(bot_id.."lock:forward"..MATRIXg.chat_id_) == "kick" then 
lock_fwd = 'بالطرد'    
else
lock_fwd = '✘'    
end    
if database:get(bot_id.."lock:Document"..MATRIXg.chat_id_) == "del" then
lock_file = '✓'
elseif database:get(bot_id.."lock:Document"..MATRIXg.chat_id_) == "ked" then 
lock_file = 'بالتقيد'    
elseif database:get(bot_id.."lock:Document"..MATRIXg.chat_id_) == "ktm" then 
lock_file = 'بالكتم'    
elseif database:get(bot_id.."lock:Document"..MATRIXg.chat_id_) == "kick" then 
lock_file = 'بالطرد'    
else
lock_file = '✘'    
end    
if database:get(bot_id.."lock:Unsupported"..MATRIXg.chat_id_) == "del" then
lock_self = '✓'
elseif database:get(bot_id.."lock:Unsupported"..MATRIXg.chat_id_) == "ked" then 
lock_self = 'بالتقيد'    
elseif database:get(bot_id.."lock:Unsupported"..MATRIXg.chat_id_) == "ktm" then 
lock_self = 'بالكتم'    
elseif database:get(bot_id.."lock:Unsupported"..MATRIXg.chat_id_) == "kick" then 
lock_self = 'بالطرد'    
else
lock_self = '✘'    
end
if database:get(bot_id.."lock:Bot:kick"..MATRIXg.chat_id_) == 'del' then
lock_bots = '✓'
elseif database:get(bot_id.."lock:Bot:kick"..MATRIXg.chat_id_) == 'ked' then
lock_bots = 'بالتقيد'   
elseif database:get(bot_id.."lock:Bot:kick"..MATRIXg.chat_id_) == 'kick' then
lock_bots = 'بالطرد'    
else
lock_bots = '✘'    
end
if database:get(bot_id.."lock:Markdaun"..MATRIXg.chat_id_) == "del" then
lock_mark = '✓'
elseif database:get(bot_id.."lock:Markdaun"..MATRIXg.chat_id_) == "ked" then 
lock_mark = 'بالتقيد'    
elseif database:get(bot_id.."lock:Markdaun"..MATRIXg.chat_id_) == "ktm" then 
lock_mark = 'بالكتم'    
elseif database:get(bot_id.."lock:Markdaun"..MATRIXg.chat_id_) == "kick" then 
lock_mark = 'بالطرد'    
else
lock_mark = '✘'    
end
if database:get(bot_id.."lock:Spam"..MATRIXg.chat_id_) == "del" then    
lock_spam = '✓'
elseif database:get(bot_id.."lock:Spam"..MATRIXg.chat_id_) == "ked" then 
lock_spam = 'بالتقيد'    
elseif database:get(bot_id.."lock:Spam"..MATRIXg.chat_id_) == "ktm" then 
lock_spam = 'بالكتم'    
elseif database:get(bot_id.."lock:Spam"..MATRIXg.chat_id_) == "kick" then 
lock_spam = 'بالطرد'    
else
lock_spam = '✘'    
end        
if not database:get(bot_id..'Reply:Manager'..MATRIXg.chat_id_) then
rdmder = '✓'
else
rdmder = '✘'
end
if not database:get(bot_id..'Reply:Sudo'..MATRIXg.chat_id_) then
rdsudo = '✓'
else
rdsudo = '✘'
end
if not database:get(bot_id..'Bot:Id'..MATRIXg.chat_id_)  then
idgp = '✓'
else
idgp = '✘'
end
if not database:get(bot_id..'Bot:Id:Photo'..MATRIXg.chat_id_) then
idph = '✓'
else
idph = '✘'
end
if not database:get(bot_id..'Lock:kick'..MATRIXg.chat_id_)  then
setadd = '✓'
else
setadd = '✘'
end
if not database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_)  then
banm = '✓'
else
banm = '✘'
end
if not database:get(bot_id..'Added:Me'..MATRIXg.chat_id_) then
addme = '✓'
else
addme = '✘'
end
if not database:get(bot_id..'Seh:User'..MATRIXg.chat_id_) then
sehuser = '✓'
else
sehuser = '✘'
end
if not database:get(bot_id..'Cick:Me'..MATRIXg.chat_id_) then
kickme = '✓'
else
kickme = '✘'
end
NUM_MATRIXG_MAX = database:hget(bot_id.."flooding:settings:"..MATRIXg.chat_id_,"floodmax") or 0
local text = 
'\n❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳'..
'\n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'..
'\n 👻 اعدادات الجروب كتالي ☆𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'..
'\nء𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'..
'\n 👻  علامة ال {✓} تعني مفعل'..
'\n 👻  علامة ال {✘} تعني معطل'..
'\nء𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'..
'\n 👻  الروابط  ⇇{ '..lock_links..
' }\n'..' 👻  المعرفات  ⇇{ '..lock_user..
' }\n'..' 👻  التاك  ⇇{ '..lock_hash..
' }\n'..' 👻  البوتات  ⇇{ '..lock_bots..
' }\n'..' 👻  التوجيه  ⇇{ '..lock_fwd..
' }\n'..' 👻  التثبيت  ⇇{ '..lock_pin..
' }\n'..' 👻  الاشعارات  ⇇{ '..lock_tagservr..
' }\n'..' 👻  الماركدون  ⇇{ '..lock_mark..
' }\n'..' 👻  التعديل  ⇇{ '..lock_edit..
' }\n'..' 👻  تعديل الميديا  ⇇{ '..lock_edit_med..
' }\nء𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'..
'\n'..' ??  الكلايش  ⇇{ '..lock_spam..
' }\n'..' 👻  الكيبورد  ⇇{ '..lock_inlin..
' }\n'..' 👻  الاغاني  ⇇{ '..lock_vico..
' }\n'..' 👻  المتحركه  ⇇{ '..lock_gif..
' }\n'..' 👻  الملفات  ⇇{ '..lock_file..
' }\n'..' 👻  الدردشه  ⇇{ '..lock_text..
' }\n'..' 👻   الفيديو  ⇇{ '..lock_ved..
' }\n'..' 👻   الصور  ⇇{ '..lock_photo..
' }\nء𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'..
'\n'..' 👻   الصوت  ⇇{ '..lock_muse..
' }\n'..' 👻  الملصقات  ⇇{ '..lock_ste..
' }\n'..' 👻  الجهات  ⇇{ '..lock_phon..
' }\n'..' 👻  الدخول  ⇇{ '..lock_join..
' }\n'..' 👻  الاضافه  ⇇{ '..lock_add..
' }\n'..' 👻  السيلفي  ⇇{ '..lock_self..
' }\n'..' 👻  الالعاب  ⇇{ '..lock_geam..
' }\n'..' 👻  التكرار  ⇇{ '..flood..
' }\n'..' 👻  الترحيب  ⇇{ '..welcome..
' }\n'..' 👻  عدد التكرار  ⇇{ '..NUM_MATRIXG_MAX..
' }\nء⧬━┅┅┄⟞❲[꧁MATRIX ꧂](t.me/UU_matrixx)❳⟝┄┉┉━⧬'..
'\n 👻  علامة ال {✓} تعني مفعل'..
'\n 👻  علامة ال {✘} تعني معطل'..
'\nء𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍'..
'\n'..' 👻  امر صيح  ⇇{ '..kickme..
' }\n'..' 👻  امر اطردني  ⇇{ '..sehuser..
' }\n'..' 👻  امر منو ضافني  ⇇{ '..addme..
' }\n'..' 👻  الردود  ⇇{ '..rdmder..
' }\n'..' 👻  الردود العامه  ⇇{ '..rdsudo..
' }\n'..' 👻  الايدي  ⇇{ '..idgp..
' }\n'..' 👻  الايدي بالصوره  ⇇{ '..idph..
' }\n'..' 👻  الرفع  ⇇{ '..setadd..
' }\n'..' 👻  الحظر  ⇇{ '..banm..' }\n\n 👻═───═❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳═───═ 👻\n 👻 قناة سورس MATRIX𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n [ ❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳](t.me/UU_matrixx) \n'
send(MATRIXg.chat_id_, MATRIXg.id_,text)     
end
if text ==('تثبيت') and MATRIXg.reply_to_message_id_ ~= 0 and Mod(MATRIXg) then  
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:sismember(bot_id..'lock:pin',MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرآ تم قفل التثبيت")  
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = MATRIXg.chat_id_:gsub('-100',''),message_id_ = MATRIXg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم تثبيت الرساله")   
database:set(bot_id..'Pin:Id:MATRIXg'..MATRIXg.chat_id_,MATRIXg.reply_to_message_id_)
elseif data.code_ == 6 then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
elseif data.message_ == "CHAT_NOT_MODIFIED" then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 لا توجد رساله مثبته")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
end
end,nil) 
end
if text == 'الغاء التثبيت' and Mod(MATRIXg) then  
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:sismember(bot_id..'lock:pin',MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرآ تم قفل الثبيت")  
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = MATRIXg.chat_id_:gsub('-100','')},function(arg,data) 
if data.ID == "Ok" then
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم الغاء تثبيت الرساله")   
database:del(bot_id..'Pin:Id:MATRIXg'..MATRIXg.chat_id_)
elseif data.code_ == 6 then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
elseif data.message_ == "CHAT_NOT_MODIFIED" then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 لا توجد رساله مثبته")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
end
end,nil)
end
if text == 'الغاء تثبيت الكل' and Mod(MATRIXg) then  
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:sismember(bot_id..'lock:pin',MATRIXg.chat_id_) and not Constructor(MATRIXg) then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 عذرآ تم قفل الثبيت")  
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = MATRIXg.chat_id_:gsub('-100','')},function(arg,data) 
if data.ID == "Ok" then
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم الغاء تثبيت الكل")   
https.request('https://api.telegram.org/bot'..token..'/unpinAllChatMessages?chat_id='..MATRIXg.chat_id_)
database:del(bot_id..'Pin:Id:MATRIXg'..MATRIXg.chat_id_)
elseif data.code_ == 6 then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
elseif data.message_ == "CHAT_NOT_MODIFIED" then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 لا توجد رساله مثبته")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
end
end,nil)
end
if text and text:match('^ضع تكرار (%d+)$') and Mod(MATRIXg) then   
local Num = text:match('ضع تكرار (.*)')
database:hset(bot_id.."flooding:settings:"..MATRIXg.chat_id_ ,"floodmax" ,Num) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم وضع عدد التكرار ('..Num..')')  
end 
if text and text:match('^ضع زمن التكرار (%d+)$') and Mod(MATRIXg) then   
local Num = text:match('^ضع زمن التكرار (%d+)$')
database:hset(bot_id.."flooding:settings:"..MATRIXg.chat_id_ ,"floodtime" ,Num) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم وضع زمن التكرار ('..Num..')') 
end
if text == "تعطيل الزخرفه" and Manager(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تعطيل الزخرفه')
database:set(bot_id.." sofi:zhrf_Bots"..MATRIXg.chat_id_,"close")
end
if text == "تفعيل الزخرفه" and Manager(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تفعيل الزخرفه')
database:set(bot_id.." sofi:zhrf_Bots"..MATRIXg.chat_id_,"open")
end
if text and text:match("^زخرفه (.*)$") and database:get(bot_id.." sofi:zhrf_Bots"..MATRIXg.chat_id_) == "open" then
local TextZhrfa = text:match("^زخرفه (.*)$")
zh = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(TextZhrfa)..'')
zx = JSON.decode(zh)
t = "\n 👻قائمه الزخرفه \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
i = 0
for k,v in pairs(zx.ok) do
i = i + 1
t = t..i.."-  `"..v.."` \n"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t..'𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\nاضغط علي الاسم ليتم نسخه\n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍ٴ\n 👻 ❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳ 👻 ')
end
if text == "ضع رابط" or text == 'وضع رابط' then
if MATRIXg.reply_to_message_id_ == 0  and Mod(MATRIXg) then  
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 حسنآ ارسل اليه الرابط الان")
database:setex(bot_id.."Set:Priovate:Group:Link"..MATRIXg.chat_id_..""..MATRIXg.sender_user_id_,120,true) 
return false
end
end
if text == "تفعيل رابط" or text == 'تفعيل الرابط' then
if Mod(MATRIXg) then  
database:set(bot_id.."Link_Group:status"..MATRIXg.chat_id_,true) 
send(MATRIXg.chat_id_, MATRIXg.id_," ✔️ تم تفعيل الرابط") 
return false  
end
end
if text == "تعطيل رابط" or text == 'تعطيل الرابط' then
if Mod(MATRIXg) then  
database:del(bot_id.."Link_Group:status"..MATRIXg.chat_id_) 
send(MATRIXg.chat_id_, MATRIXg.id_," ✘ تم تعطيل الرابط") 
return false end
end


---------------------
if text == "تفعيل صورتي" or text == 'تفعيل الصوره' then
if Constructor(MATRIXg) then  
database:set(bot_id.."my_photo:status"..MATRIXg.chat_id_,true) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم تفعيل الصوره") 
return false  
end
end
if text == "تعطيل الصوره" or text == 'تعطيل صورتي' then
if Constructor(MATRIXg) then  
database:del(bot_id.."my_photo:status"..MATRIXg.chat_id_) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم تعطيل الصوره") 
return false end
end
if text == "تفعيل نسبه جمالي" or text == 'تفعيل جمالي' then
if Constructor(MATRIXg) then  
database:set(bot_id.."pp_photo:status"..MATRIXg.chat_id_,true) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم تفعيل نسبه جمالك") 
return false  
end
end
if text == "تعطيل جمالي" or text == 'تعطيل نسبه جمالي' then
if Constructor(MATRIXg) then  
database:del(bot_id.."pp_photo:status"..MATRIXg.chat_id_) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم تعطيل نسبه جمالك") 
return false end
end
if text == "الرابط" then 
local status_Link = database:get(bot_id.."Link_Group:status"..MATRIXg.chat_id_) 
if not status_Link then 
send(MATRIXg.chat_id_, MATRIXg.id_,"الرابط معطل")  
return false   
end 
tdcli_function({ID ="GetChat",chat_id_=MATRIXg.chat_id_},function(arg,ta) 
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..MATRIXg.chat_id_)) or database:get(bot_id.."Private:Group:Link"..MATRIXg.chat_id_) 
if linkgpp.ok == true then 
local Teext = '✧'..ta.title_..'\n'..linkgpp.result 
local inline = {{{text = ta.title_, url=linkgpp.result}},} 
send_inline_key(MATRIXg.chat_id_,Teext,nil,inline,MATRIXg.id_/2097152/0.5) 
else 
send(MATRIXg.chat_id_, MATRIXg.id_,'✧لا يوجد رابط ارسل ضع رابط') 
end 
end,nil) 
end

if text == 'مسح الرابط' or text == 'مسح الرابط' then
if Mod(MATRIXg) then     
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 تم مسح الرابط")           
database:del(bot_id.."Private:Group:Link"..MATRIXg.chat_id_) 
return false      
end
end
if text and text:match("^ضع صوره") and Mod(MATRIXg) and MATRIXg.reply_to_message_id_ == 0 then  
database:set(bot_id..'Change:Chat:Photo'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_,true) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ارسل لي الصوره') 
return false
end
if text == "مسح الصوره" or text == "مسح الصوره" then 
if Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
https.request('https://api.telegram.org/bot'..token..'/deleteChatPhoto?chat_id='..MATRIXg.chat_id_) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم ازالة صورة الجروب') 
end
return false  
end
if text == 'ضع وصف' or text == 'وضع وصف' then  
if Mod(MATRIXg) then
database:setex(bot_id.."Set:Description" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_, 120, true)  
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ارسل الان الوصف')
end
return false  
end
if text == 'ضع ترحيب' or text == 'وضع ترحيب' then  
if Mod(MATRIXg) then
database:setex(bot_id.."Welcome:Group" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_, 120, true)  
t  = ' 👻 ارسل لي الترحيب الان'
tt = '\n 👻 تستطيع اضافة مايلي !\n 👻 دالة عرض الاسم  ↚{`name`}\n 👻 دالة عرض المعرف  ↚{`user`}'
send(MATRIXg.chat_id_, MATRIXg.id_,t..tt) 
end
return false  
end
if text == 'الترحيب' and Mod(MATRIXg) then 
local GetWelcomeGroup = database:get(bot_id..'Get:Welcome:Group'..MATRIXg.chat_id_)  
if GetWelcomeGroup then 
GetWelcome = GetWelcomeGroup
else 
GetWelcome = ' 👻 لم يتم تعيين ترحيب للكروب'
end 
send(MATRIXg.chat_id_, MATRIXg.id_,'['..GetWelcome..']') 
return false  
end
if text == 'تفعيل الترحيب' and Mod(MATRIXg) then  
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id..'Chek:Welcome'..MATRIXg.chat_id_,true) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تفعيل ترحيب الجروب') 
return false  
end
if text == 'تعطيل الترحيب' and Mod(MATRIXg) then  
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id..'Chek:Welcome'..MATRIXg.chat_id_) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل ترحيب الجروب') 
return false  
end
if text == 'مسح الترحيب' or text == 'مسح الترحيب' then 
if Mod(MATRIXg) then
database:del(bot_id..'Get:Welcome:Group'..MATRIXg.chat_id_) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم ازالة ترحيب الجروب') 
end
end
if text and text == "منع" and MATRIXg.reply_to_message_id_ == 0 and Manager(MATRIXg)  then       
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 ارسل الكلمه لمنعها")  
database:set(bot_id.."DRAGON1:Add:Filter:Rp1"..MATRIXg.sender_user_id_..MATRIXg.chat_id_,"rep")  
return false  
end    
if text then   
local tsssst = database:get(bot_id.."DRAGON1:Add:Filter:Rp1"..MATRIXg.sender_user_id_..MATRIXg.chat_id_)  
if tsssst == "rep" then   
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 ارسل التحذير عند ارسال الكلمه")  
database:set(bot_id.."DRAGON1:Add:Filter:Rp1"..MATRIXg.sender_user_id_..MATRIXg.chat_id_,"repp")  
database:set(bot_id.."DRAGON1:filtr1:add:reply2"..MATRIXg.sender_user_id_..MATRIXg.chat_id_, text)  
database:sadd(bot_id.."DRAGON1:List:Filter"..MATRIXg.chat_id_,text)  
return false  end  
end
if text then  
local test = database:get(bot_id.."DRAGON1:Add:Filter:Rp1"..MATRIXg.sender_user_id_..MATRIXg.chat_id_)  
if test == "repp" then  
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم منع الكلمه مع التحذير")  
database:del(bot_id.."DRAGON1:Add:Filter:Rp1"..MATRIXg.sender_user_id_..MATRIXg.chat_id_)  
local test = database:get(bot_id.."DRAGON1:filtr1:add:reply2"..MATRIXg.sender_user_id_..MATRIXg.chat_id_)  
if text then   
database:set(bot_id.."DRAGON1:Add:Filter:Rp2"..test..MATRIXg.chat_id_, text)  
end  
database:del(bot_id.."DRAGON1:filtr1:add:reply2"..MATRIXg.sender_user_id_..MATRIXg.chat_id_)  
return false  end  
end

if text == "الغاء منع" and MATRIXg.reply_to_message_id_ == 0 and Manager(MATRIXg) then    
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 ارسل الكلمه الان")  
database:set(bot_id.."DRAGON1:Add:Filter:Rp1"..MATRIXg.sender_user_id_..MATRIXg.chat_id_,"reppp")  
return false  end
if text then 
local test = database:get(bot_id.."DRAGON1:Add:Filter:Rp1"..MATRIXg.sender_user_id_..MATRIXg.chat_id_)  
if test and test == "reppp" then   
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم الغاء منعها")  
database:del(bot_id.."DRAGON1:Add:Filter:Rp1"..MATRIXg.sender_user_id_..MATRIXg.chat_id_)  
database:del(bot_id.."DRAGON1:Add:Filter:Rp2"..text..MATRIXg.chat_id_)  
database:srem(bot_id.."DRAGON1:List:Filter"..MATRIXg.chat_id_,text)  
return false  end  
end


if text == 'منع' and tonumber(MATRIXg.reply_to_message_id_) > 0 and Manager(MATRIXg) then     
function cb(a,b,c) 
textt = ' 👻 تم منع '
if b.content_.sticker_ then
local idsticker = b.content_.sticker_.set_id_
database:sadd(bot_id.."filtersteckr"..MATRIXg.chat_id_,idsticker)
text = 'الملصق'
send(MATRIXg.chat_id_, MATRIXg.id_,textt..'( '..text..' ) بنجاح لن يتم ارسالها مجددا')  
return false
end
if b.content_.ID == "MessagePhoto" then
local photo = b.content_.photo_.id_
database:sadd(bot_id.."filterphoto"..MATRIXg.chat_id_,photo)
text = 'الصوره'
send(MATRIXg.chat_id_, MATRIXg.id_,textt..'( '..text..' ) بنجاح لن يتم ارسالها مجددا')  
return false
end
if b.content_.animation_.animation_ then
local idanimation = b.content_.animation_.animation_.persistent_id_
database:sadd(bot_id.."filteranimation"..MATRIXg.chat_id_,idanimation)
text = 'المتحركه'
send(MATRIXg.chat_id_, MATRIXg.id_,textt..'( '..text..' ) بنجاح لن يتم ارسالها مجددا')  
return false
end
end
tdcli_function ({ ID = "GetMessage", chat_id_ = MATRIXg.chat_id_, message_id_ = tonumber(MATRIXg.reply_to_message_id_) }, cb, nil)
end
if text == 'الغاء منع' and tonumber(MATRIXg.reply_to_message_id_) > 0 and Manager(MATRIXg) then     
function cb(a,b,c) 
textt = ' 👻 تم الغاء منع '
if b.content_.sticker_ then
local idsticker = b.content_.sticker_.set_id_
database:srem(bot_id.."filtersteckr"..MATRIXg.chat_id_,idsticker)
text = 'الملصق'
send(MATRIXg.chat_id_, MATRIXg.id_,textt..'( '..text..' ) بنجاح يمكنهم الارسال الان')  
return false
end
if b.content_.ID == "MessagePhoto" then
local photo = b.content_.photo_.id_
database:srem(bot_id.."filterphoto"..MATRIXg.chat_id_,photo)
text = 'الصوره'
send(MATRIXg.chat_id_, MATRIXg.id_,textt..'( '..text..' ) بنجاح يمكنهم الارسال الان')  
return false
end
if b.content_.animation_.animation_ then
local idanimation = b.content_.animation_.animation_.persistent_id_
database:srem(bot_id.."filteranimation"..MATRIXg.chat_id_,idanimation)
text = 'المتحركه'
send(MATRIXg.chat_id_, MATRIXg.id_,textt..'( '..text..' ) بنجاح يمكنهم الارسال الان')  
return false
end
end
tdcli_function ({ ID = "GetMessage", chat_id_ = MATRIXg.chat_id_, message_id_ = tonumber(MATRIXg.reply_to_message_id_) }, cb, nil)
end

if text == "مسح قائمه المنع"and Manager(MATRIXg) then   
local list = database:smembers(bot_id.."DRAGON1:List:Filter"..MATRIXg.chat_id_)  
for k,v in pairs(list) do  
database:del(bot_id.."DRAGON1:Add:Filter:Rp1"..MATRIXg.sender_user_id_..MATRIXg.chat_id_)  
database:del(bot_id.."DRAGON1:Add:Filter:Rp2"..v..MATRIXg.chat_id_)  
database:srem(bot_id.."DRAGON1:List:Filter"..MATRIXg.chat_id_,v)  
end  
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم مسح قائمه المنع")  
end

if text == "قائمه المنع" and Manager(MATRIXg) then   
local list = database:smembers(bot_id.."DRAGON1:List:Filter"..MATRIXg.chat_id_)  
t = "\n 👻 قائمة المنع \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do  
local DRAGON_MATRIXg = database:get(bot_id.."DRAGON1:Add:Filter:Rp2"..v..MATRIXg.chat_id_)   
t = t..""..k.."- "..v.."  ⇇{"..DRAGON_MATRIXg.."}\n"    
end  
if #list == 0 then  
t = " 👻 لا يوجد كلمات ممنوعه"  
end  
send(MATRIXg.chat_id_, MATRIXg.id_,t)  
end  

if text == 'مسح قائمه منع المتحركات' and Manager(MATRIXg) then     
database:del(bot_id.."filteranimation"..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم مسح قائمه منع المتحركات')  
end
if text == 'مسح قائمه منع الصور' and Manager(MATRIXg) then     
database:del(bot_id.."filterphoto"..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم مسح قائمه منع الصور')  
end
if text == 'مسح قائمه منع الملصقات' and Manager(MATRIXg) then     
database:del(bot_id.."filtersteckr"..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم مسح قائمه منع الملصقات')  
end
------------------

if text == 'مسح كليشه المطور' and DevSoFi(MATRIXg) then
database:del(bot_id..'TEXT_SUDO')
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم مسح كليشه المطور')
end
if text == 'ضع كليشه المطور' and DevSoFi(MATRIXg) then
database:set(bot_id..'Set:TEXT_SUDO'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_,true)
send(MATRIXg.chat_id_,MATRIXg.id_,' 👻 ارسل الكليشه الان')
return false
end
if text and database:get(bot_id..'Set:TEXT_SUDO'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) then
if text == 'الغاء' then 
database:del(bot_id..'Set:TEXT_SUDO'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_)
send(MATRIXg.chat_id_,MATRIXg.id_,' 👻 تم الغاء حفظ كليشة المطور')
return false
end
database:set(bot_id..'TEXT_SUDO',text)
database:del(bot_id..'Set:TEXT_SUDO'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_)
send(MATRIXg.chat_id_,MATRIXg.id_,' 👻 تم حفظ كليشة المطور')
return false
end
-----------------
if text == 'تعين الايدي' and Manager(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:setex(bot_id.."CHENG:ID"..MATRIXg.chat_id_..""..MATRIXg.sender_user_id_,240,true)  
local Text= [[
 👻 ارسل الان النص
 👻 يمكنك اضافه :
 👻 `#rdphoto` ⇜ تعليق الصوره
 👻 `#username` ⇜ اسم 
 👻 `#MATRIXgs` ⇜ عدد رسائل 
 👻 `#photos` ⇜ عدد صور 
 👻 `#id` ⇜ ايدي 
 👻 `#auto` ⇜ تفاعل 
 👻 `#stast` ⇜ موقع  
 👻 `#edit` ⇜ السحكات
 👻 `#game` ⇜ النقاط
]]
send(MATRIXg.chat_id_, MATRIXg.id_,Text)
return false  
end 
if text == 'مسح الايدي' or text == 'مسح الايدي' then
if Manager(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."KLISH:ID"..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم ازالة كليشة الايدي')
end
return false  
end 

if database:get(bot_id.."CHENG:ID"..MATRIXg.chat_id_..""..MATRIXg.sender_user_id_) then 
if text == 'الغاء' then 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم الغاء تعين الايدي") 
database:del(bot_id.."CHENG:ID"..MATRIXg.chat_id_..""..MATRIXg.sender_user_id_) 
return false  
end 
database:del(bot_id.."CHENG:ID"..MATRIXg.chat_id_..""..MATRIXg.sender_user_id_) 
local CHENGER_ID = text:match("(.*)")  
database:set(bot_id.."KLISH:ID"..MATRIXg.chat_id_,CHENGER_ID)
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعين الايدي')    
end

if text == 'طرد البوتات' and Mod(MATRIXg) then 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = getChatId(MATRIXg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah)  
local admins = tah.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if tah.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(bot_id) then
chat_kick(MATRIXg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا توجد بوتات في الجروب")
else
local t = ' 👻 عدد البوتات هنا >> {'..c..'}\n 👻 عدد البوتات التي هي ادمن >> {'..x..'}\n 👻 تم طرد >> {'..(c - x)..'} من البوتات'
send(MATRIXg.chat_id_, MATRIXg.id_,t) 
end 
end,nil)  
end   
end
if text == ("كشف البوتات") and Mod(MATRIXg) then  
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(MATRIXg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = "\n 👻 قائمة البوتات الموجوده \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,ta) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
tr = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
tr = ' {★}'
end
text = text..">> [@"..ta.username_..']'..tr.."\n"
if #admins == 0 then
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 لا توجد بوتات في الجروب")
return false 
end
if #admins == i then 
local a = '\n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n 👻 عدد البوتات التي هنا >> {'..n..'} بوت\n'
local f = ' 👻 عدد البوتات التي هي ادمن >> {'..t..'}\n 👻 ملاحضه علامة ال ( 👻) تعني ان البوت ادمن \n'
send(MATRIXg.chat_id_, MATRIXg.id_, text..a..f)
end
end,nil)
end
end,nil)
end

if database:get(bot_id.."Set:Rules:" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_) then 
if text == 'الغاء' then 
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 تم الغاء حفظ القوانين") 
database:del(bot_id.."Set:Rules:" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_)
return false  
end 
database:set(bot_id.."Set:Rules:Group" .. MATRIXg.chat_id_,text) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم حفظ قوانين الجروب") 
database:del(bot_id.."Set:Rules:" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_)
end  

if text == 'ضع قوانين' or text == 'وضع قوانين' then 
if Mod(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:setex(bot_id.."Set:Rules:" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_, 600, true) 
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 ارسل لي القوانين الان")  
end
end
if text == 'مسح القوانين' or text == 'مسح القوانين' then  
if Mod(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم ازالة قوانين الجروب")  
database:del(bot_id.."Set:Rules:Group"..MATRIXg.chat_id_) 
end
end
if text == 'القوانين' then 
local Set_Rules = database:get(bot_id.."Set:Rules:Group" .. MATRIXg.chat_id_)   
if Set_Rules then     
send(MATRIXg.chat_id_,MATRIXg.id_, Set_Rules)   
else      
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 لا توجد قوانين")   
end    
end
if text == 'قفل التفليش' and MATRIXg.reply_to_message_id_ == 0 and Mod(MATRIXg) then 
database:set(bot_id..'lock:tagrvrbot'..MATRIXg.chat_id_,true)   
list ={"lock:Bot:kick","lock:user:name","lock:Link","lock:forward","lock:Sticker","lock:Animation","lock:Video","lock:Fshar","lock:Fars","Bot:Id:Photo","lock:Audio","lock:vico","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
database:set(bot_id..lock..MATRIXg.chat_id_,'del')    
end
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 تـم قفـل التفليش ')  
end,nil)   
end
if text == 'فتح التفليش' and MATRIXg.reply_to_message_id_ == 0 and Mod(MATRIXg) then 
database:del(bot_id..'lock:tagrvrbot'..MATRIXg.chat_id_)   
list ={"lock:Bot:kick","lock:user:name","lock:Link","lock:forward","lock:Sticker","lock:Animation","lock:Video","lock:Fshar","lock:Fars","Bot:Id:Photo","lock:Audio","lock:vico","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
database:del(bot_id..lock..MATRIXg.chat_id_)    
end
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  مـن قبـل  ⇇[↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜](T.ME/'..(data.username_ or 'textchuser')..') \n 👻 مع فـتح التفليش ')  
end,nil)   
end
if text == 'طرد المحذوفين' or text == 'مسح المحذوفين' then  
if Mod(MATRIXg) then    
tdcli_function({ID = "GetChannelMembers",channel_id_ = MATRIXg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
Group_Kick(MATRIXg.chat_id_, data.id_)
end
end,nil)
end
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم طرد المحذوفين')
end,nil)
end
end
if text == 'الصلاحيات' and Mod(MATRIXg) then 
local list = database:smembers(bot_id..'Coomds'..MATRIXg.chat_id_)
if #list == 0 then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا توجد صلاحيات مضافه')
return false
end
t = "\n 👻 قائمة الصلاحيات المضافه \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
var = database:get(bot_id.."Comd:New:rt:bot:"..v..MATRIXg.chat_id_)
if var then
t = t..''..k..'- '..v..'  ⇇('..var..')\n'
else
t = t..''..k..'- '..v..'\n'
end
end
send(MATRIXg.chat_id_, MATRIXg.id_,t)
end
if text and text:match("^اضف صلاحيه (.*)$") and Mod(MATRIXg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."Comd:New:rt"..MATRIXg.chat_id_..MATRIXg.sender_user_id_,ComdNew)  
database:sadd(bot_id.."Coomds"..MATRIXg.chat_id_,ComdNew)  
database:setex(bot_id.."Comd:New"..MATRIXg.chat_id_..""..MATRIXg.sender_user_id_,200,true)  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 ارسل نوع الرتبه \n 👻 {عـضـو -- ممـيـز -- ادمـن -- مـديـر}") 
end
if text and text:match("^مسح صلاحيه (.*)$") and Mod(MATRIXg) then 
ComdNew = text:match("^مسح صلاحيه (.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:del(bot_id.."Comd:New:rt:bot:"..ComdNew..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, "* 👻 تم مسح الصلاحيه *\n") 
end
if database:get(bot_id.."Comd:New"..MATRIXg.chat_id_..""..MATRIXg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(MATRIXg.chat_id_, MATRIXg.id_,"* 👻 تم الغاء الامر *\n") 
database:del(bot_id.."Comd:New"..MATRIXg.chat_id_..""..MATRIXg.sender_user_id_) 
return false  
end 
if text == 'مدير' then
if not Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_"* 👻 تستطيع اضافه صلاحيات {ادمن - مميز - عضو} \n 👻 ارسل الصلاحيه مجددا*\n") 
return false
end
end
if text == 'ادمن' then
if not Manager(MATRIXg) then 
send(MATRIXg.chat_id_, MATRIXg.id_,"* 👻 تستطيع اضافه صلاحيات {مميز - عضو} \n 👻 ارسل الصلاحيه مجددا*\n") 
return false
end
end
if text == 'مميز' then
if not Mod(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,"* 👻  تستطيع اضافه صلاحيات {عضو} \n 👻 ارسل الصلاحيه مجددا*\n") 
return false
end
end
if text == 'مدير' or text == 'ادمن' or text == 'مميز' or text == 'عضو' then
local textn = database:get(bot_id.."Comd:New:rt"..MATRIXg.chat_id_..MATRIXg.sender_user_id_)  
database:set(bot_id.."Comd:New:rt:bot:"..textn..MATRIXg.chat_id_,text)
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 تـم اضـافـه الامـر") 
database:del(bot_id.."Comd:New"..MATRIXg.chat_id_..""..MATRIXg.sender_user_id_) 
return false  
end 
end
if text and text:match('رفع (.*)') and tonumber(MATRIXg.reply_to_message_id_) > 0 and Mod(MATRIXg) then 
local RTPA = text:match('رفع (.*)')
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:sismember(bot_id..'Coomds'..MATRIXg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local blakrt = database:get(bot_id.."Comd:New:rt:bot:"..RTPA..MATRIXg.chat_id_)
if blakrt == 'مميز' and Mod(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'..'\n 👻 تم رفعه '..RTPA..'\n')   
database:set(bot_id.."Comd:New:rt:user:"..MATRIXg.chat_id_..result.sender_user_id_,RTPA) 
database:sadd(bot_id..'Special:User'..MATRIXg.chat_id_,result.sender_user_id_)  
elseif blakrt == 'ادمن' and Manager(MATRIXg) then 
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'..'\n 👻 تم رفعه '..RTPA..'\n')   
database:set(bot_id.."Comd:New:rt:user:"..MATRIXg.chat_id_..result.sender_user_id_,RTPA)
database:sadd(bot_id..'Mod:User'..MATRIXg.chat_id_,result.sender_user_id_)  
elseif blakrt == 'مدير' and Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'..'\n 👻 تم رفعه '..RTPA..'\n')   
database:set(bot_id.."Comd:New:rt:user:"..MATRIXg.chat_id_..result.sender_user_id_,RTPA)  
database:sadd(bot_id..'Manager'..MATRIXg.chat_id_,result.sender_user_id_)  
elseif blakrt == 'عضو' and Mod(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'..'\n 👻 تم رفعه '..RTPA..'\n')   
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = MATRIXg.chat_id_, message_id_ = tonumber(MATRIXg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match('تنزيل (.*)') and tonumber(MATRIXg.reply_to_message_id_) > 0 and Mod(MATRIXg) then 
local RTPA = text:match('تنزيل (.*)')
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:sismember(bot_id..'Coomds'..MATRIXg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local blakrt = database:get(bot_id.."Comd:New:rt:bot:"..RTPA..MATRIXg.chat_id_)
if blakrt == 'مميز' and Mod(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'..'\n 👻 م تنزيله من '..RTPA..'\n')   
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_,result.sender_user_id_)  
database:del(bot_id.."Comd:New:rt:user:"..MATRIXg.chat_id_..result.sender_user_id_)
elseif blakrt == 'ادمن' and Manager(MATRIXg) then 
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'..'\n 👻 تم تنزيله من '..RTPA..'\n')   
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_,result.sender_user_id_) 
database:del(bot_id.."Comd:New:rt:user:"..MATRIXg.chat_id_..result.sender_user_id_)
elseif blakrt == 'مدير' and Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'..'\n 👻  تم تنزيله من '..RTPA..'\n')   
database:srem(bot_id..'Manager'..MATRIXg.chat_id_,result.sender_user_id_)  
database:del(bot_id.."Comd:New:rt:user:"..MATRIXg.chat_id_..result.sender_user_id_)
elseif blakrt == 'عضو' and Mod(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'..'\n 👻 تم تنزيله من '..RTPA..'\n')   
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = MATRIXg.chat_id_, message_id_ = tonumber(MATRIXg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match('^رفع (.*) @(.*)') and Mod(MATRIXg) then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:sismember(bot_id..'Coomds'..MATRIXg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local blakrt = database:get(bot_id.."Comd:New:rt:bot:"..text1[2]..MATRIXg.chat_id_)
if blakrt == 'مميز' and Mod(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(text1[3] or 'textchuser')..')'..'\n 👻 تم رفعه '..text1[2]..'')   
database:sadd(bot_id..'Special:User'..MATRIXg.chat_id_,result.id_)  
database:set(bot_id.."Comd:New:rt:user:"..MATRIXg.chat_id_..result.id_,text1[2])
elseif blakrt == 'ادمن' and Manager(MATRIXg) then 
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(text1[3] or 'textchuser')..')'..'\n 👻 تم رفعه '..text1[2]..'')   
database:sadd(bot_id..'Mod:User'..MATRIXg.chat_id_,result.id_)  
database:set(bot_id.."Comd:New:rt:user:"..MATRIXg.chat_id_..result.id_,text1[2])
elseif blakrt == 'مدير' and Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(text1[3] or 'textchuser')..')'..'\n 👻 تم رفعه '..text1[2]..'')   
database:sadd(bot_id..'Manager'..MATRIXg.chat_id_,result.id_)  
database:set(bot_id.."Comd:New:rt:user:"..MATRIXg.chat_id_..result.id_,text1[2])
elseif blakrt == 'عضو' and Mod(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(text1[3] or 'textchuser')..')'..'\n 👻 تم رفعه '..text1[2]..'')   
end
else
info = ' 👻 المعرف غلط'
send(MATRIXg.chat_id_, MATRIXg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match('^تنزيل (.*) @(.*)') and Mod(MATRIXg) then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:sismember(bot_id..'Coomds'..MATRIXg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local blakrt = database:get(bot_id.."Comd:New:rt:bot:"..text1[2]..MATRIXg.chat_id_)
if blakrt == 'مميز' and Mod(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(text1[3] or 'textchuser')..')'..'\n 👻 تم تنريله من '..text1[2]..'')   
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_,result.id_)  
database:del(bot_id.."Comd:New:rt:user:"..MATRIXg.chat_id_..result.id_)
elseif blakrt == 'ادمن' and Manager(MATRIXg) then 
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(text1[3] or 'textchuser')..')'..'\n 👻 تم تنريله من '..text1[2]..'')   
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_,result.id_)  
database:del(bot_id.."Comd:New:rt:user:"..MATRIXg.chat_id_..result.id_)
elseif blakrt == 'مدير' and Constructor(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(text1[3] or 'textchuser')..')'..'\n 👻 تم تنريله من '..text1[2]..'')   
database:srem(bot_id..'Manager'..MATRIXg.chat_id_,result.id_)  
database:del(bot_id.."Comd:New:rt:user:"..MATRIXg.chat_id_..result.id_)
elseif blakrt == 'عضو' and Mod(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻 الـعـضو   ⇇['..result.title_..'](t.me/'..(text1[3] or 'textchuser')..')'..'\n 👻 تم تنريله من '..text1[2]..'')   
end
else
info = ' 👻 المعرف غلط'
send(MATRIXg.chat_id_, MATRIXg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
if text == "مسح رسايلي" or text == "مسح رسائلي" or text == "مسح رسايلي" or text == "مسح رسائلي" then  
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم مسح رسائلك'  )  
database:del(bot_id..'MATRIXg_User'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) 
end
if text == "رسايلي" or text == "رسائلي" or text == "MATRIXg" then 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 عدد رسائلك  ⇇{ '..database:get(bot_id..'MATRIXg_User'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_)..'}' ) 
end 
if text == 'تفعيل الاذاعه' and SudoBot(MATRIXg) then  
if database:get(bot_id..'Bc:Bots') then
database:del(bot_id..'Bc:Bots') 
Text = '\n 👻 تم تفعيل الاذاعه' 
else
Text = '\n 👻 بالتاكيد تم تفعيل الاذاعه'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل الاذاعه' and SudoBot(MATRIXg) then  
if not database:get(bot_id..'Bc:Bots') then
database:set(bot_id..'Bc:Bots',true) 
Text = '\n 👻 تم تعطيل الاذاعه' 
else
Text = '\n 👻  بالتاكيد تم تعطيل الاذاعه'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تفعيل التواصل' and SudoBot(MATRIXg) then  
if database:get(bot_id..'Tuasl:Bots') then
database:del(bot_id..'Tuasl:Bots') 
Text = '\n 👻 تم تفعيل التواصل' 
else
Text = '\n 👻 بالتاكيد تم تفعيل التواصل'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل التواصل' and SudoBot(MATRIXg) then  
if not database:get(bot_id..'Tuasl:Bots') then
database:set(bot_id..'Tuasl:Bots',true) 
Text = '\n 👻 تم تعطيل التواصل' 
else
Text = '\n 👻 بالتاكيد تم تعطيل التواصل'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تفعيل البوت الخدمي' and SudoBot(MATRIXg) then  
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if database:get(bot_id..'Free:Bots') then
database:del(bot_id..'Free:Bots') 
Text = '\n 👻 تم تفعيل البوت الخدمي' 
else
Text = '\n 👻 بالتاكيد تم تفعيل البوت الخدمي'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل البوت الخدمي' and SudoBot(MATRIXg) then  
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not database:get(bot_id..'Free:Bots') then
database:set(bot_id..'Free:Bots',true) 
Text = '\n 👻 تم تعطيل البوت الخدمي' 
else
Text = '\n 👻 بالتاكيد تم تعطيل البوت الخدمي'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text and text:match('^مسح (%d+)$') and Manager(MATRIXg) then
if not database:get(bot_id..'S00F4:Delete:Time'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) then           
local num = tonumber(text:match('^مسح (%d+)$')) 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if num > 1000 then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻تستطيع التنظيف 1000 رساله كحد اقصى') 
return false  
end  
local MATRIXgm = MATRIXg.id_
for i=1,tonumber(num) do
DeleteMessage(MATRIXg.chat_id_, {[0] = MATRIXgm})
MATRIXgm = MATRIXgm - 1048576
end
send(MATRIXg.chat_id_,MATRIXg.id_,' 👻 تم مسح {'..num..'}')  
database:setex(bot_id..'S00F4:Delete:Time'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_,300,true)
end
end
if text == "تنظيف الميديا" and Manager(MATRIXg) then
MATRIXgm = {[0]=MATRIXg.id_}
local Message = MATRIXg.id_
for i=1,100 do
Message = Message - 1048576
MATRIXgm[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = MATRIXg.chat_id_,message_ids_ = MATRIXgm},function(arg,data)
new = 0
MATRIXgm2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and data.messages_[i].content_ and data.messages_[i].content_.ID ~= "MessageText" then
MATRIXgm2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(MATRIXg.chat_id_,MATRIXgm2)
end,nil)  
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم تنظيف جميع الميديا")
end
if (MATRIXg.content_.animation_) or (MATRIXg.content_.photo_) or (MATRIXg.content_.video_) or (MATRIXg.content_.document) or (MATRIXg.content_.sticker_) and MATRIXg.reply_to_message_id_ == 0 then
database:sadd(bot_id.."S00F4:allM"..MATRIXg.chat_id_, MATRIXg.id_)
end
if text == ("امسح") and cleaner(MATRIXg) then  
local list = database:smembers(bot_id.."S00F4:allM"..MATRIXg.chat_id_)
for k,v in pairs(list) do
local Message = v
if Message then
t = " 👻 تم مسح "..k.." من الوسائط الموجوده"
DeleteMessage(MATRIXg.chat_id_,{[0]=Message})
database:del(bot_id.."S00F4:allM"..MATRIXg.chat_id_)
end
end
if #list == 0 then
t = " 👻 لا يوجد ميديا في المجموعه"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
if text == ("عدد الميديا") and cleaner(MATRIXg) then  
local num = database:smembers(bot_id.."S00F4:allM"..MATRIXg.chat_id_)
for k,v in pairs(num) do
local numl = v
if numl then
l = " 👻 عدد الميديا الموجود هو "..k
end
end
if #num == 0 then
l = " 👻 لا يوجد ميديا في المجموعه"
end
send(MATRIXg.chat_id_, MATRIXg.id_, l)
end
if text == "تنظيف التعديل" and Manager(MATRIXg) then
MATRIXgs = {[0]=MATRIXg.id_}
local Message = MATRIXg.id_
for i=1,100 do
Message = Message - 1048576
MATRIXgs[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = MATRIXg.chat_id_,message_ids_ = MATRIXgs},function(arg,data)
new = 0
MATRIXgs2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
MATRIXgs2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(MATRIXg.chat_id_,MATRIXgs2)
end,nil)  
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تنظيف جميع الرسائل المعدله')
end
if text == "تغير اسم البوت" or text == "تغيير اسم البوت" then 
if DevSoFi(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:setex(bot_id..'Set:Name:Bot'..MATRIXg.sender_user_id_,300,true) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 ارسل لي الاسم الان ")  
end
return false
end
if MATRIXg.content_.ID == "MessageChatJoinByLink" then
print("This is [ MATRIXg Join By link ]")
if database:get(bot_id.."UnKedDeleteMessage"..MATRIXg.chat_id_) == "open" then
local Text = 'اهلاً بك في المجموعة\n للتأكد بأنك لست { ربوت }\n تم تقييدك اضغط الزر بالاسفل\n للتأكد انك { عضو حقيقي }\n'
keyboard = {}
keyboard.inline_keyboard = {{{text = '- اضغط هنا لفك تقييدك •', callback_data="/UnKed"},},}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..tokenbot.."/restrictChatMember?chat_id="..MATRIXg.chat_id_.."&user_id="..MATRIXg.sender_user_id_)
database:sadd(bot_id.."database:Un:Ked"..MATRIXg.chat_id_,MATRIXg.sender_user_id_)
https.request("https://api.telegram.org/bot"..tokenbot..'/sendMessage?chat_id=' .. MATRIXg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
MATRIXg_type = 'MATRIXG:NewUser'
end


if text == ""..(database:get(bot_id..'Name:Bot') or 'MATRIX').."" then  
Namebot = (database:get(bot_id..'Name:Bot') or 'MATRIX')
local DRAGON_MATRIXg = {
'ننعم يروحي 😻♥️',
'نعم يا قلب  '..Namebot..'',
'عاوز اي من '..Namebot..'',
'دوختو  '..Namebot..'',
'بتشقط وجي ويت 🤪',
'ايوا جاي 🙈',
'يعم هتسحر واجي 😾',
'طب متصلي على النبي كدا 🙂💜',
'تع اشرب شاي 🥺💙',
'دوس على الخوخه 🍑',
'متيجي 😉',
'ياض خش نام 😂',
'انا '..Namebot..' احسن البوتات 🤩♥️',
'نعم'
} 

Namebot = DRAGON_MATRIXg[math.random(#DRAGON_MATRIXg)] 
local MATRIXg_id = MATRIXg.id_/2097152/0.5  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الـمـطـور', url="http://t.me/"..sudos.UserName},
},
{
{text = 'اضف البوت الي مجموعتك ↯' ,url="t.me/"..dofile("./kkkklInfo.lua").botUserName.."?startgroup=start"},
},
}
local function getpro(extra, result, success) 
if result.photos_[0] then 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&caption=' .. URL.escape(Namebot).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else 
send(MATRIXg.chat_id_, MATRIXg.id_,Namebot, 1, 'md') 
end 
end 
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = bot_id, offset_ = 0, limit_ = 1 }, getpro, nil) 
end

if text == "بوت" then
local Namebot = (database:get(bot_id..'Name:Bot') or 'MATRIX') 
local DRAGON_MATRIXg = { 
'اسمي  '..Namebot..' يا قلبي 🤤💚',
'اسمي '..Namebot..' يا روحي🙈❤️',
'اسمي  '..Namebot..' يعمري🕊🌹',
'اسمي  '..Namebot..' يا قمر 🐭🤍',
'اسمي  '..Namebot..' يامزه 🥺❤️',
'اسمي  '..Namebot..' يعم 😒',
'مقولت اسمي '..Namebot..' في اي 🙄',
'اسمي الكيوت '..Namebot..' 🌝💘',
'اسمي  '..Namebot..' ياحياتي🧸♥️',
'اسمي  '..Namebot..' يوتكه🙈🍑',
} 
Namebot = DRAGON_MATRIXg[math.random(#DRAGON_MATRIXg)] 
local MATRIXg_id = MATRIXg.id_/2097152/0.5  
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الـمـطـور', url="http://t.me/"..sudos.UserName},
},
{
{text = 'اضف البوت الي مجموعتك ↯' ,url="t.me/"..dofile("./kkkklInfo.lua").botUserName.."?startgroup=start"},
},
}
local function getpro(extra, result, success) 
if result.photos_[0] then 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo='..result.photos_[0].sizes_[1].photo_.persistent_id_..'&caption=' .. URL.escape(Namebot).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else 
send(MATRIXg.chat_id_, MATRIXg.id_,Namebot, 1, 'md') 
end 
end 
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = bot_id, offset_ = 0, limit_ = 1 }, getpro, nil) 
end

if text=="اذاعه خاص" and MATRIXg.reply_to_message_id_ == 0 and SudoBot(MATRIXg) then 
if database:get(bot_id..'Bc:Bots') and not DevSoFi(MATRIXg) then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 الاذاعه معطله من قبل المطور الاساسي')
return false
end
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:setex(bot_id.."Send:Bc:Pv" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_, 600, true) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 ارسل الان اذاعتك \n 👻 للخروج ارسل الغاء") 
return false
end 
if text=="اذاعه" and MATRIXg.reply_to_message_id_ == 0 and SudoBot(MATRIXg) then 
if database:get(bot_id..'Bc:Bots') and not DevSoFi(MATRIXg) then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 الاذاعه معطله من قبل المطور الاساسي')
return false
end
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:setex(bot_id.."Send:Bc:Grops" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_, 600, true) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 ارسل الان اذاعتك \n 👻 للخروج ارسل الغاء ") 
return false
end  
if text=="اذاعه بالتوجيه" and MATRIXg.reply_to_message_id_ == 0  and SudoBot(MATRIXg) then 
if database:get(bot_id..'Bc:Bots') and not DevSoFi(MATRIXg) then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 الاذاعه معطله من قبل المطور الاساسي')
return false
end
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:setex(bot_id.."Send:Fwd:Grops" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_, 600, true) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 ارسل لي التوجيه الان") 
return false
end 
if text=="اذاعه بالتوجيه خاص" and MATRIXg.reply_to_message_id_ == 0  and SudoBot(MATRIXg) then 
if database:get(bot_id..'Bc:Bots') and not DevSoFi(MATRIXg) then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  الاذاعه معطله من قبل المطور الاساسي')
return false
end
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:setex(bot_id.."Send:Fwd:Pv" .. MATRIXg.chat_id_ .. ":" .. MATRIXg.sender_user_id_, 600, true) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 ارسل لي التوجيه الان") 
return false
end 
if text and text:match('^ضع اسم (.*)') and Manager(MATRIXg) or text and text:match('^وضع اسم (.*)') and Manager(MATRIXg) then 
local Name = text:match('^ضع اسم (.*)') or text and text:match('^وضع اسم (.*)') 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = MATRIXg.chat_id_,title_ = Name },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 البوت ليس ادمن يرجى ترقيتي !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 ليست لدي صلاحية تغير اسم الجروب")  
else
sebd(MATRIXg.chat_id_,MATRIXg.id_,' 👻 تم تغيير اسم الجروب الى {[↝'..Name..'↜]}')  
end
end,nil) 
end

if text and text:match("^تنزيل الكل @(.*)$") and Manager(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if (result.id_) then
if tonumber(result.id_) == true then
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 لا تستطيع تنزيل المطور الاساسي")
return false 
end
if database:sismember(bot_id.."Sudo:User",result.id_) then
dev = "المطور ،" else dev = "" end
if database:sismember(bot_id.."CoSu",result.id_) then
cu = "MATRIX،" else cu = "" end
if database:sismember(bot_id.."Basic:Constructor"..MATRIXg.chat_id_, result.id_) then
crr = "منشئ اساسي ،" else crr = "" end
if database:sismember(bot_id..'Constructor'..MATRIXg.chat_id_, result.id_) then
cr = "منشئ ،" else cr = "" end
if database:sismember(bot_id..'Manager'..MATRIXg.chat_id_, result.id_) then
own = "مدير ،" else own = "" end
if database:sismember(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.id_) then
mn = 'منظف ،' else mn = '' end
if database:sismember(bot_id..'Mod:User'..MATRIXg.chat_id_, result.id_) then
mod = "ادمن ،" else mod = "" end
if database:sismember(bot_id..'Special:User'..MATRIXg.chat_id_, result.id_) then
vip = "مميز ،" else vip = ""
end
if Can_or_NotCan(result.id_,MATRIXg.chat_id_) ~= false then
send(MATRIXg.chat_id_, MATRIXg.id_,"\n 👻 تم تنزيل الشخص من الرتب التاليه \n 👻  { "..dev..""..crr..""..cr..""..own..""..mod..""..mn..""..vip.." } \n")
else
send(MATRIXg.chat_id_, MATRIXg.id_,"\n 👻  عذرا الـعـضو  لايملك رتبه \n")
end
if tonumber(MATRIXg.sender_user_id_) == true then
database:srem(bot_id.."Sudo:User", result.id_)
database:srem(bot_id.."CoSu", result.id_)
database:srem(bot_id.."Basic:Constructor"..MATRIXg.chat_id_,result.id_)
database:srem(bot_id..'Constructor'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Manager'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_, result.id_)
elseif database:sismember(bot_id.."Sudo:User",MATRIXg.sender_user_id_) then
database:srem(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Manager'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Constructor'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id.."Basic:Constructor"..MATRIXg.chat_id_,result.id_)
elseif database:sismember(bot_id.."CoSu",MATRIXg.sender_user_id_) then
database:srem(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Manager'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Constructor'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id.."Basic:Constructor"..MATRIXg.chat_id_,result.id_)
elseif database:sismember(bot_id.."Basic:Constructor"..MATRIXg.chat_id_, MATRIXg.sender_user_id_) then
database:srem(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Manager'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Constructor'..MATRIXg.chat_id_, result.id_)
elseif database:sismember(bot_id..'Constructor'..MATRIXg.chat_id_, MATRIXg.sender_user_id_) then
database:srem(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Manager'..MATRIXg.chat_id_, result.id_)
elseif database:sismember(bot_id..'Manager'..MATRIXg.chat_id_, MATRIXg.sender_user_id_) then
database:srem(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_, result.id_)
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_, result.id_)
end
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text:match("^تنزيل الكل @(.*)$")}, start_function, nil)
end

if text == ("تنزيل الكل") and MATRIXg.reply_to_message_id_ ~= 0 and Manager(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if tonumber(SUDO) == tonumber(result.sender_user_id_) then
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 لا تستطيع تنزيل المطور الاساسي")
return false 
end
if database:sismember(bot_id..'Sudo:User',result.sender_user_id_) then
dev = 'المطور ،' else dev = '' end
if database:sismember(bot_id..'CoSu'..MATRIXg.chat_id_, result.sender_user_id_) then
cu = 'MATRIX،' else cu = '' end
if database:sismember(bot_id..'Basic:Constructor'..MATRIXg.chat_id_, result.sender_user_id_) then
crr = 'منشئ اساسي ،' else crr = '' end
if database:sismember(bot_id..'Constructor'..MATRIXg.chat_id_, result.sender_user_id_) then
cr = 'منشئ ،' else cr = '' end
if database:sismember(bot_id..'Manager'..MATRIXg.chat_id_, result.sender_user_id_) then
own = 'مدير ،' else own = '' end
if database:sismember(bot_id..'onall'..MATRIXg.chat_id_, result.sender_user_id_) then
onall = 'مدير عام ،' else  onall = '' end
if database:sismember(bot_id..'Mod:User'..MATRIXg.chat_id_, result.sender_user_id_) then
mod = 'ادمن عام ،' else mod = '' end
if database:sismember(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.sender_user_id_) then
mn = 'منظف ،' else mn = '' end
if database:sismember(bot_id..'Mod:User'..MATRIXg.chat_id_, result.sender_user_id_) then
mod = 'ادمن ،' else mod = '' end
if database:sismember(bot_id..'Special:User'..MATRIXg.chat_id_, result.sender_user_id_) then
vip = 'مميز ،' else vip = ''
end
if Can_or_NotCan(result.sender_user_id_,MATRIXg.chat_id_) ~= false then
send(MATRIXg.chat_id_, MATRIXg.id_,"\n 👻 تم تنزيل الشخص من الرتب التاليه \n 👻 { "..dev..''..crr..''..cr..''..own..''..mod..''..mn..''..vip.." } \n")
else
send(MATRIXg.chat_id_, MATRIXg.id_,"\n 👻  عذرا الـعـضو  لايملك رتبه \n")
end
if tonumber(SUDO) == tonumber(MATRIXg.sender_user_id_) then
database:srem(bot_id..'Sudo:User', result.sender_user_id_)
database:srem(bot_id..'CoSu'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Basic:Constructor'..MATRIXg.chat_id_,result.sender_user_id_)
database:srem(bot_id..'Constructor'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Manager'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id..'Dev:SoFi:2',MATRIXg.sender_user_id_) then
database:srem(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Manager'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Constructor'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Basic:Constructor'..MATRIXg.chat_id_,result.sender_user_id_)
database:srem(bot_id..'CoSu'..MATRIXg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id..'Sudo:User',MATRIXg.sender_user_id_) then
database:srem(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Manager'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Constructor'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Basic:Constructor'..MATRIXg.chat_id_,result.sender_user_id_)
database:srem(bot_id..'CoSu'..MATRIXg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id..'CoSu'..MATRIXg.chat_id_, MATRIXg.sender_user_id_) then
database:srem(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Manager'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Constructor'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Basic:Constructor'..MATRIXg.chat_id_,result.sender_user_id_)
elseif database:sismember(bot_id..'Basic:Constructor'..MATRIXg.chat_id_, MATRIXg.sender_user_id_) then
database:srem(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Manager'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Constructor'..MATRIXg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id..'Constructor'..MATRIXg.chat_id_, MATRIXg.sender_user_id_) then
database:srem(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Manager'..MATRIXg.chat_id_, result.sender_user_id_)
elseif database:sismember(bot_id..'Manager'..MATRIXg.chat_id_, MATRIXg.sender_user_id_) then
database:srem(bot_id..'S00F4:MN:TF'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Mod:User'..MATRIXg.chat_id_, result.sender_user_id_)
database:srem(bot_id..'Special:User'..MATRIXg.chat_id_, result.sender_user_id_)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
end

if text == ("مسح الردود العامه") and DevSoFi(MATRIXg) then 
local list = database:smembers(bot_id..'List:Rd:Sudo')
for k,v in pairs(list) do
database:del(bot_id.."Add:Rd:Sudo:Gif"..v)   
database:del(bot_id.."Add:Rd:Sudo:vico"..v)   
database:del(bot_id.."Add:Rd:Sudo:stekr"..v)     
database:del(bot_id.."Add:Rd:Sudo:Text"..v)   
database:del(bot_id.."Add:Rd:Sudo:Photo"..v)
database:del(bot_id.."Add:Rd:Sudo:Video"..v)
database:del(bot_id.."Add:Rd:Sudo:File"..v)
database:del(bot_id.."Add:Rd:Sudo:Audio"..v)
database:del(bot_id..'List:Rd:Sudo')
end
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم مسح الردود العامه")
end

if text == ("الردود العامه") and DevSoFi(MATRIXg) then 
local list = database:smembers(bot_id..'List:Rd:Sudo')
text = "\n 👻 قائمة الردود العامه \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
if database:get(bot_id.."Add:Rd:Sudo:Gif"..v) then
db = 'متحركه'
elseif database:get(bot_id.."Add:Rd:Sudo:vico"..v) then
db = 'بصمه'
elseif database:get(bot_id.."Add:Rd:Sudo:stekr"..v) then
db = 'ملصق'
elseif database:get(bot_id.."Add:Rd:Sudo:Text"..v) then
db = 'رساله'
elseif database:get(bot_id.."Add:Rd:Sudo:Photo"..v) then
db = 'صوره'
elseif database:get(bot_id.."Add:Rd:Sudo:Video"..v) then
db = 'فيديو'
elseif database:get(bot_id.."Add:Rd:Sudo:File"..v) then
db = 'ملف'
elseif database:get(bot_id.."Add:Rd:Sudo:Audio"..v) then
db = 'اغنيه'
end
text = text..""..k.." >> ↝ '..v..' ↜  ⇇↝ '..db..' ↜\n"
end
if #list == 0 then
text = " 👻 لا يوجد ردود للمطور"
end
send(MATRIXg.chat_id_, MATRIXg.id_,'['..text..']')
end
if text or MATRIXg.content_.sticker_ or MATRIXg.content_.voice_ or MATRIXg.content_.animation_ or MATRIXg.content_.audio_ or MATRIXg.content_.document_ or MATRIXg.content_.photo_ or MATRIXg.content_.video_ then  
local test = database:get(bot_id..'Text:Sudo:Bot↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_)
if database:get(bot_id..'Set:Rd↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_) == 'true1' then
database:del(bot_id..'Set:Rd↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_)
if MATRIXg.content_.sticker_ then   
database:set(bot_id.."Add:Rd:Sudo:stekr"..test, MATRIXg.content_.sticker_.sticker_.persistent_id_)  
end   
if MATRIXg.content_.voice_ then  
database:set(bot_id.."Add:Rd:Sudo:vico"..test, MATRIXg.content_.voice_.voice_.persistent_id_)  
end   
if MATRIXg.content_.animation_ then   
database:set(bot_id.."Add:Rd:Sudo:Gif"..test, MATRIXg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
database:set(bot_id.."Add:Rd:Sudo:Text"..test, text)  
end  
if MATRIXg.content_.audio_ then
database:set(bot_id.."Add:Rd:Sudo:Audio"..test, MATRIXg.content_.audio_.audio_.persistent_id_)  
end
if MATRIXg.content_.document_ then
database:set(bot_id.."Add:Rd:Sudo:File"..test, MATRIXg.content_.document_.document_.persistent_id_)  
end
if MATRIXg.content_.video_ then
database:set(bot_id.."Add:Rd:Sudo:Video"..test, MATRIXg.content_.video_.video_.persistent_id_)  
end
if MATRIXg.content_.photo_ then
if MATRIXg.content_.photo_.sizes_[0] then
photo_in_group = MATRIXg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if MATRIXg.content_.photo_.sizes_[1] then
photo_in_group = MATRIXg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if MATRIXg.content_.photo_.sizes_[2] then
photo_in_group = MATRIXg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if MATRIXg.content_.photo_.sizes_[3] then
photo_in_group = MATRIXg.content_.photo_.sizes_[3].photo_.persistent_id_
end
database:set(bot_id.."Add:Rd:Sudo:Photo"..test, photo_in_group)  
end
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم حفظ الرد')
return false  
end  
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'Set:Rd↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_) == 'true' then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ارسل الرد الذي تريد اضافته')
database:set(bot_id..'Set:Rd↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_, 'true1')
database:set(bot_id..'Text:Sudo:Bot↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_, text)
database:sadd(bot_id..'List:Rd:Sudo', text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'Set:On↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_) == 'true' then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم ازالة الرد العام')
list = {"Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do
database:del(bot_id..v..text)
end
database:del(bot_id..'Set:On↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_)
database:srem(bot_id..'List:Rd:Sudo', text)
return false
end
end
if text == 'اضف رد عام' and DevSoFi(MATRIXg) then 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ارسل الكلمه تريد اضافتها')
database:set(bot_id..'Set:Rd↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_,true)
return false 
end
if text == 'مسح رد عام' and DevSoFi(MATRIXg) then 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ارسل الكلمه تريد مسحها')
database:set(bot_id..'Set:On↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_,true)
return false 
end
if text and not database:get(bot_id..'Reply:Sudo'..MATRIXg.chat_id_) then
if not database:sismember(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) then
local anemi = database:get(bot_id.."Add:Rd:Sudo:Gif"..text)   
local veico = database:get(bot_id.."Add:Rd:Sudo:vico"..text)   
local stekr = database:get(bot_id.."Add:Rd:Sudo:stekr"..text)     
local text1 = database:get(bot_id.."Add:Rd:Sudo:Text"..text)   
local photo = database:get(bot_id.."Add:Rd:Sudo:Photo"..text)
local video = database:get(bot_id.."Add:Rd:Sudo:Video"..text)
local document = database:get(bot_id.."Add:Rd:Sudo:File"..text)
local audio = database:get(bot_id.."Add:Rd:Sudo:Audio"..text)
------------------------------------------------------------------------
if text and text:match("^(.*)$") then
if database:get(bot_id.."botss:DRAGON:Set:Rd"..MATRIXg.sender_user_id_..":"..MATRIXg.chat_id_) == "true" then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 ارسل الكلمه تريد اضافتها')
database:set(bot_id.."botss:DRAGON:Set:Rd"..MATRIXg.sender_user_id_..":"..MATRIXg.chat_id_, "true1")
database:set(bot_id.."botss:DRAGON:Text:Sudo:Bot"..MATRIXg.sender_user_id_..":"..MATRIXg.chat_id_, text)
database:sadd(bot_id.."botss:DRAGON:List:Rd:Sudo", text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id.."botss:DRAGON:Set:On"..MATRIXg.sender_user_id_..":"..MATRIXg.chat_id_) == "true" then
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم مسح الرد من ردود المتعدده")
database:del(bot_id..'botss:DRAGON:Add:Rd:Sudo:Text'..text)
database:del(bot_id..'botss:DRAGON:Add:Rd:Sudo:Text1'..text)
database:del(bot_id..'botss:DRAGON:Add:Rd:Sudo:Text2'..text)
database:del(bot_id.."botss:DRAGON:Set:On"..MATRIXg.sender_user_id_..":"..MATRIXg.chat_id_)
database:srem(bot_id.."botss:DRAGON:List:Rd:Sudo", text)
return false
end
end
if text == ("مسح الردود المتعدده") and CoSu(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local list = database:smembers(bot_id.."botss:DRAGON:List:Rd:Sudo")
for k,v in pairs(list) do  
database:del(bot_id.."botss:DRAGON:Add:Rd:Sudo:Text"..v) 
database:del(bot_id.."botss:DRAGON:Add:Rd:Sudo:Text1"..v) 
database:del(bot_id.."botss:DRAGON:Add:Rd:Sudo:Text2"..v)   
database:del(bot_id.."botss:DRAGON:List:Rd:Sudo")
end
send(MATRIXg.chat_id_, MATRIXg.id_," 👻تم مسح ردود المتعدده")
end
------------------------------------------------------------------------
if text1 then 
send(MATRIXg.chat_id_, MATRIXg.id_,text1)
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
end
if stekr then 
sendSticker(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, stekr)   
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
end
if veico then 
sendVoice(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, veico)   
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
end
if video then 
sendVideo(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil,video)
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
end
if anemi then 
sendDocument(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, anemi, '', nil)  
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
end
if document then
sendDocument(MATRIXg.chat_id_, MATRIXg.id_, 0, 1,nil, document)   
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
end  
if audio then
sendAudio(MATRIXg.chat_id_,MATRIXg.id_,audio)  
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
end
if photo then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil,photo,'')
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
end  
end
end
if text == ("مسح الردود") and Manager(MATRIXg) then
local list = database:smembers(bot_id..'List:Manager'..MATRIXg.chat_id_..'')
for k,v in pairs(list) do
database:del(bot_id.."Add:Rd:Manager:Gif"..v..MATRIXg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Vico"..v..MATRIXg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Stekrs"..v..MATRIXg.chat_id_)     
database:del(bot_id.."Add:Rd:Manager:Text"..v..MATRIXg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Photo"..v..MATRIXg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:Video"..v..MATRIXg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:File"..v..MATRIXg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:Audio"..v..MATRIXg.chat_id_)
database:del(bot_id..'List:Manager'..MATRIXg.chat_id_)
end
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم مسح الردود")
end

if text == ("الردود") and Manager(MATRIXg) then
local list = database:smembers(bot_id..'List:Manager'..MATRIXg.chat_id_..'')
text = " 👻 قائمه الردود \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
if database:get(bot_id.."Add:Rd:Manager:Gif"..v..MATRIXg.chat_id_) then
db = 'متحركه'
elseif database:get(bot_id.."Add:Rd:Manager:Vico"..v..MATRIXg.chat_id_) then
db = 'بصمه'
elseif database:get(bot_id.."Add:Rd:Manager:Stekrs"..v..MATRIXg.chat_id_) then
db = 'ملصق'
elseif database:get(bot_id.."Add:Rd:Manager:Text"..v..MATRIXg.chat_id_) then
db = 'رساله'
elseif database:get(bot_id.."Add:Rd:Manager:Photo"..v..MATRIXg.chat_id_) then
db = 'صوره'
elseif database:get(bot_id.."Add:Rd:Manager:Video"..v..MATRIXg.chat_id_) then
db = 'فيديو'
elseif database:get(bot_id.."Add:Rd:Manager:File"..v..MATRIXg.chat_id_) then
db = 'ملف'
elseif database:get(bot_id.."Add:Rd:Manager:Audio"..v..MATRIXg.chat_id_) then
db = 'اغنيه'
end
text = text..""..k..">> ↝ '..v..' ↜  ⇇↝ '..db..' ↜\n"
end
if #list == 0 then
text = " 👻 لا يوجد ردود للمدير"
end
send(MATRIXg.chat_id_, MATRIXg.id_,'['..text..']')
end
if text or MATRIXg.content_.sticker_ or MATRIXg.content_.voice_ or MATRIXg.content_.animation_ or MATRIXg.content_.audio_ or MATRIXg.content_.document_ or MATRIXg.content_.photo_ or MATRIXg.content_.video_ then  
local test = database:get(bot_id..'Text:Manager↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_..'')
if database:get(bot_id..'Set:Manager:rd↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_) == 'true1' then
database:del(bot_id..'Set:Manager:rd↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_)
if MATRIXg.content_.sticker_ then   
database:set(bot_id.."Add:Rd:Manager:Stekrs"..test..MATRIXg.chat_id_, MATRIXg.content_.sticker_.sticker_.persistent_id_)  
end   
if MATRIXg.content_.voice_ then  
database:set(bot_id.."Add:Rd:Manager:Vico"..test..MATRIXg.chat_id_, MATRIXg.content_.voice_.voice_.persistent_id_)  
end   
if MATRIXg.content_.animation_ then   
database:set(bot_id.."Add:Rd:Manager:Gif"..test..MATRIXg.chat_id_, MATRIXg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
database:set(bot_id.."Add:Rd:Manager:Text"..test..MATRIXg.chat_id_, text)  
end  
if MATRIXg.content_.audio_ then
database:set(bot_id.."Add:Rd:Manager:Audio"..test..MATRIXg.chat_id_, MATRIXg.content_.audio_.audio_.persistent_id_)  
end
if MATRIXg.content_.document_ then
database:set(bot_id.."Add:Rd:Manager:File"..test..MATRIXg.chat_id_, MATRIXg.content_.document_.document_.persistent_id_)  
end
if MATRIXg.content_.video_ then
database:set(bot_id.."Add:Rd:Manager:Video"..test..MATRIXg.chat_id_, MATRIXg.content_.video_.video_.persistent_id_)  
end
if MATRIXg.content_.photo_ then
if MATRIXg.content_.photo_.sizes_[0] then
photo_in_group = MATRIXg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if MATRIXg.content_.photo_.sizes_[1] then
photo_in_group = MATRIXg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if MATRIXg.content_.photo_.sizes_[2] then
photo_in_group = MATRIXg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if MATRIXg.content_.photo_.sizes_[3] then
photo_in_group = MATRIXg.content_.photo_.sizes_[3].photo_.persistent_id_
end
database:set(bot_id.."Add:Rd:Manager:Photo"..test..MATRIXg.chat_id_, photo_in_group)  
end
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم حفظ الرد')
return false  
end  
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'Set:Manager:rd↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_) == 'true' then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ارسل الرد الذي تريد اضافته')
database:set(bot_id..'Set:Manager:rd↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_,'true1')
database:set(bot_id..'Text:Manager↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_, text)
database:del(bot_id.."Add:Rd:Manager:Gif"..text..MATRIXg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Vico"..text..MATRIXg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Stekrs"..text..MATRIXg.chat_id_)     
database:del(bot_id.."Add:Rd:Manager:Text"..text..MATRIXg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Photo"..text..MATRIXg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:Video"..text..MATRIXg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:File"..text..MATRIXg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:Audio"..text..MATRIXg.chat_id_)
database:sadd(bot_id..'List:Manager'..MATRIXg.chat_id_..'', text)
return false end
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'Set:Manager:rd↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_..'') == 'true2' then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم ازالة الرد ')
database:del(bot_id.."Add:Rd:Manager:Gif"..text..MATRIXg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Vico"..text..MATRIXg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Stekrs"..text..MATRIXg.chat_id_)     
database:del(bot_id.."Add:Rd:Manager:Text"..text..MATRIXg.chat_id_)   
database:del(bot_id.."Add:Rd:Manager:Photo"..text..MATRIXg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:Video"..text..MATRIXg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:File"..text..MATRIXg.chat_id_)
database:del(bot_id.."Add:Rd:Manager:Audio"..text..MATRIXg.chat_id_)
database:del(bot_id..'Set:Manager:rd↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_)
database:srem(bot_id..'List:Manager'..MATRIXg.chat_id_..'', text)
return false
end
end
if text == 'اضف رد' and Manager(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ارسل الكلمه التي تريد اضافتها')
database:set(bot_id..'Set:Manager:rd↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_,true)
return false 
end
if text == 'مسح رد' and Manager(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ارسل الكلمه التي تريد مسحها')
database:set(bot_id..'Set:Manager:rd↝'..MATRIXg.sender_user_id_..'↜:'..MATRIXg.chat_id_,'true2')
return false 
end
if text and not database:get(bot_id..'Reply:Manager'..MATRIXg.chat_id_) then
if not database:sismember(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) then
local anemi = database:get(bot_id.."Add:Rd:Manager:Gif"..text..MATRIXg.chat_id_)   
local veico = database:get(bot_id.."Add:Rd:Manager:Vico"..text..MATRIXg.chat_id_)   
local stekr = database:get(bot_id.."Add:Rd:Manager:Stekrs"..text..MATRIXg.chat_id_)     
local text1 = database:get(bot_id.."Add:Rd:Manager:Text"..text..MATRIXg.chat_id_)   
local photo = database:get(bot_id.."Add:Rd:Manager:Photo"..text..MATRIXg.chat_id_)
local video = database:get(bot_id.."Add:Rd:Manager:Video"..text..MATRIXg.chat_id_)
local document = database:get(bot_id.."Add:Rd:Manager:File"..text..MATRIXg.chat_id_)
local audio = database:get(bot_id.."Add:Rd:Manager:Audio"..text..MATRIXg.chat_id_)
------------------------------------------------------------------------
if text and text:match("^قول (.*)$") then
local Textxt = text:match("^قول (.*)$")
send(MATRIXg.chat_id_, MATRIXg.id_, '['..Textxt..']')
end
if text and text:match("^انطق (.*)$") then   
local textntk = text:match("^انطق (.*)$")   
UrlAntk = https.request('https://apiabs.ml/Antk.php?abs='..URL.escape(textntk)..'')   
Antk = JSON.decode(UrlAntk)   
if UrlAntk.ok ~= false then   
download_to_file("https://translate"..Antk.result.google..Antk.result.code.."UTF-8"..Antk.result.utf..Antk.result.translate.."&tl=ar-IN",Antk.result.translate..'.mp3')    
local curlm = 'curl "'..'https://api.telegram.org/bot'..token..'/sendDocument'..'" -F "chat_id='.. MATRIXg.chat_id_ ..'" -F "document=@'..''..textntk..'.mp3'..'"' io.popen(curlm) 
end   
end

if text == "كلمني" then
rpl = {"ها هلاو","انطق","كول"};
sender = rpl[math.random(#rpl)]
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendmessage?chat_id=' .. MATRIXg.sender_user_id_ .. '&text=' .. URL.escape(sender))
end
if text == 'حصل' then
local Text = [[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '《𝐒》MATRIX🌺', url="t.me/UU_matrixx"}},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. MATRIXg.chat_id_ .. '&video=https://t.me/comxnxp/18&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'كسمهم' then
local Text = [[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"}},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. MATRIXg.chat_id_ .. '&video=https://t.me/comxnxp/19&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'انا جيت' then
local Text = [[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = ' 《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"}},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendsticker?chat_id=' .. MATRIXg.chat_id_ .. '&sticker=https://t.me/comxnxp/20&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'النرد' then
local Text = [[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = ' 《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"}},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendsticker?chat_id=' .. MATRIXg.chat_id_ .. '&sticker=https://t.me/Qtdao/14&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'النشال' then
local Text = [[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = ' 《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"}},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendsticker?chat_id=' .. MATRIXg.chat_id_ .. '&sticker=https://t.me/Qtdao/15&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'طرطر' then
local Text = [[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '《𝐒》MATRIX🌺', url="t.me/UU_matrixx"}},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. MATRIXg.chat_id_ .. '&video=https://t.me/comxnxp/21&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'كره الساله' then
local Text = [[
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '《𝚂》MATRIX🌺', url="t.me/UU_matrixx"}},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendvideo?chat_id=' .. MATRIXg.chat_id_ .. '&video=https://t.me/Qtdao/16&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "تويت بالصوره" and not  database:get(bot_id.."sing:for:me"..MATRIXg.chat_id_) then 
ght = math.random(3,300); 
local Text =' ' 
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = 'ᶜʰ ᵛᶦᵈᵉᵒ', url="t.me/comxnxp"}}, 
{{text = '《𝚂》MATRIX🌺 ', url="t.me/UU_matrixx"}}, 
} 
local MATRIXg_id = MATRIXg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&Photo=https://t.me/wffhvv/'..ght..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text and text:match("^وضع لقب (.*)$") and MATRIXg.reply_to_message_id_ ~= 0 and Constructor(MATRIXg) then
local tiMATRIXh = text:match("^وضع لقب (.*)$")
function start_function(extra, result, success)
local chek = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='..MATRIXg.chat_id_..'&user_id='..bot_id)
local getInfo = JSON.decode(chek)
if getInfo.result.can_promote_members == false then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻لا يمكنني تعديل  او وضع لقب ليس لدي صلاحيه\n 👻قم بترقيتي جميع الصلاحيات او صلاحية اضافه مشرف ') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻 الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..') '
status  = '\n 👻 الايدي  ⇇'..result.sender_user_id_..'\n 👻تم ضافه {'..tiMATRIXh..'} كلقب له'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
https.request("https://api.telegram.org/bot"..token.."/setChatAdministratorCustomTitle?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&custom_title="..tiMATRIXh)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end

if text == ("مسح لقب") and MATRIXg.reply_to_message_id_ ~= 0 and Constructor(MATRIXg) then
function start_function(extra, result, success)
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس مشرف يرجى ترقيتي !') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n 👻  الـعـضو   ⇇['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
status  = '\n 👻  الايدي  ⇇`'..result.sender_user_id_..'`\n 👻  تم مسح لقبه من الجروب'
send(MATRIXg.chat_id_, MATRIXg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^مسح لقب @(.*)$") and Constructor(MATRIXg) then
local username = text:match("^مسح لقب @(.*)$")
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس مشرف يرجى ترقيتي !') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(MATRIXg.chat_id_,MATRIXg.id_," 👻  عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه !")   
return false 
end      
usertext = '\n 👻  الـعـضو   ⇇['..result.title_..'](t.me/'..(username or 'textchuser')..')'
status  = '\n 👻  تم مسح لقبه من الجروب'
texts = usertext..status
send(MATRIXg.chat_id_, MATRIXg.id_, texts)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
else
send(MATRIXg.chat_id_, MATRIXg.id_, '⚠¦ لا يوجد حساب بهاذا المعرف')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text == 'لقبي' and tonumber(MATRIXg.reply_to_message_id_) == 0 then
Ge = https.request("https://api.telegram.org/bot"..token.."/getChatMember?chat_id=" .. MATRIXg.chat_id_ .. "&user_id=" ..MATRIXg.sender_user_id_)
GeId = JSON.decode(Ge)
if not GeId.result.custom_title then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻وينك وين القب ') 
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻لقبك هو : '..GeId.result.custom_title) 
end
end
if text == "فحص البوت" and Manager(MATRIXg) then
local chek = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='..MATRIXg.chat_id_..'&user_id='..bot_id)
local getInfo = JSON.decode(chek)
if getInfo.ok == true then
if getInfo.result.can_change_info == true then
INf = '❴ ✔️ ❵' 
else 
INf = '❴ ✖ ❵' 
end
if getInfo.result.can_delete_messages == true then
DEL = '❴ ✔️ ❵' 
else 
DEL = '❴ ✖ ❵' 
end
if getInfo.result.can_invite_users == true then
INv = '❴ ✔️ ❵' 
else
INv = '❴ ✖ ❵' 
end
if getInfo.result.can_pin_messages == true then
Pin = '❴ ✔️ ❵' 
else
Pin = '❴ ✖ ❵' 
end
if getInfo.result.can_restrict_members == true then
REs = '❴ ✔️ ❵' 
else 
REs = '❴ ✖ ❵' 
end
if getInfo.result.can_promote_members == true then
PRo = '❴ ✔️ ❵'
else
PRo = '❴ ✖ ❵'
end 
send(MATRIXg.chat_id_, MATRIXg.id_,'\n 👻صلاحيات البوت هي\n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n 👻  علامة ال {✔️} تعني مفعل\n 👻  علامة ال {✖} تعني غير مفعل\n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n 👻تغير معلومات المجموعة ↞ '..INf..'\n 👻مسح الرسائل ↞ '..DEL..'\n 👻حظر المستخدمين ↞ '..REs..'\n 👻دعوة المستخدمين ↞ '..INv..'\n 👻ثتبيت الرسالة ↞ '..Pin..'\n ??اضافة مشرفين ↞ '..PRo)   
end
end
if text == "تعطيل الانستا" and Manager(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, '⌯ تم تعطيل الانستا')
database:set(bot_id.."textchuser:insta_bot"..MATRIXg.chat_id_,"close")
end
if text == "تفعيل الانستا" and Manager(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,'⌯ تم تفعيل الانستا')
database:set(bot_id.."textchuser:insta_bot"..MATRIXg.chat_id_,"open")
end
if text and text:match("^معلومات (.*)$") and database:get(bot_id.."textchuser:insta_bot"..MATRIXg.chat_id_) == "open" then
local Textni = text:match("^معلومات (.*)$")
data,res = https.request('https://forhassan.ml/Black/insta.php?username='..URL.escape(Textni)..'')
if res == 200 then
muaed = json:decode(data)
if muaed.Info == true then
local filee = download_to_file(muaed.ph,MATRIXg.sender_user_id_..'.jpg')
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_,'./↝'..MATRIXg.sender_user_id_..'↜.jpg',muaed.info)     
os.execute('rm -rf ./↝'..MATRIXg.sender_user_id_..'↜.jpg') 
end
end
end
if text and text == "تفعيل تاك المشرفين" and Manager(MATRIXg) then 
database:set(bot_id.."textchuser:Tag:Admins:"..MATRIXg.chat_id_,true)
send(MATRIXg.chat_id_, MATRIXg.id_," 👻تم تفعيل تاك المشرفين")
end
if text and text == "تعطيل تاك المشرفين" and Manager(MATRIXg) then 
database:del(bot_id.."textchuser:Tag:Admins:"..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻تم تعطيل تاك المشرفين")
end

if text == 'صيح المشرفين' or text == "تاك للمشرفين" or text == "وين المشرفين" or text == "المشرفين" then
if database:get(bot_id.."textchuser:Tag:Admins:"..MATRIXg.chat_id_) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = MATRIXg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data)
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,b)  
if b.username_ then 
User_id = "@"..b.username_
else
User_id = MATRIXg.sender_user_id_
end --الكود حصري سورس MATRIXيعني لو بكتهن راح اعرفك انت الاخذتهن
local t = "\n 👻المستخدم ~ ["..User_id .."] يصيح المشرفين \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
k = 0
for i,v in pairs(data.members_) do
if bot_id ~= v.user_id_ then 
k = k + 1
local username = database:get(bot_id.."user:Name"..v.user_id_)
if database:get(bot_id..'user:Name'..v.user_id_) then
t = t..""..k.." → {[@"..database:get(bot_id..'user:Name'..v.user_id_).."]}\n"
else
t = t..""..k.." → {`"..v.user_id_.."`}\n"
end
end
end
send(MATRIXg.chat_id_, MATRIXg.id_,t)
end,nil)
end,nil)
end
end

if text == "الساعه" then
local raMATRIXesj20 = "\n الساعه الان : "..os.date("%I:%M%p")
send(MATRIXg.chat_id_, MATRIXg.id_,raMATRIXesj20)
end

if text == "التاريخ" then
local raMATRIXesj20 =  "\n التاريخ : "..os.date("%Y/%m/%d")
send(MATRIXg.chat_id_, MATRIXg.id_,raMATRIXesj20)
end
--------------
--- هههه ها فرخ دتبوك ؟ ههههههههههه 
if text == ("الردود المتعدده") and CoSu(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local list = database:smembers(bot_id.."botss:DRAGON:List:Rd:Sudo")
text = "\nقائمة ردود المتعدده \n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n"
for k,v in pairs(list) do
db = "رساله "
text = text..""..k.." => ↝ '..v..' ↜ => ↝ '..db..' ↜\n"
end
if #list == 0 then
text = "لا توجد ردود متعدده"
end
send(MATRIXg.chat_id_, MATRIXg.id_,"["..text.."]")
end

if text == "اضف رد متعدد" and CoSu(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."botss:DRAGON:Set:Rd"..MATRIXg.sender_user_id_..":"..MATRIXg.chat_id_,true)
return send(MATRIXg.chat_id_, MATRIXg.id_," 👻ارسل الرد الذي اريد اضافته")
end
if text == "مسح رد متعدد" and CoSu(MATRIXg) then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
database:set(bot_id.."botss:DRAGON:Set:On"..MATRIXg.sender_user_id_..":"..MATRIXg.chat_id_,true)
return send(MATRIXg.chat_id_, MATRIXg.id_," 👻ارسل الان الكلمه لمسحها ")
end
if text then  
local test = database:get(bot_id.."botss:DRAGON:Text:Sudo:Bot"..MATRIXg.sender_user_id_..":"..MATRIXg.chat_id_)
if database:get(bot_id.."botss:DRAGON:Set:Rd"..MATRIXg.sender_user_id_..":"..MATRIXg.chat_id_) == "true1" then
database:set(bot_id.."botss:DRAGON:Set:Rd"..MATRIXg.sender_user_id_..":"..MATRIXg.chat_id_,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."botss:DRAGON:Add:Rd:Sudo:Text"..test, text)  
end  
send(MATRIXg.chat_id_, MATRIXg.id_," 👻تم حفظ الرد الاول ارسل الرد الثاني")
return false  
end  
end
if text then  
local test = database:get(bot_id.."botss:DRAGON:Text:Sudo:Bot"..MATRIXg.sender_user_id_..":"..MATRIXg.chat_id_)
if database:get(bot_id.."botss:DRAGON:Set:Rd"..MATRIXg.sender_user_id_..":"..MATRIXg.chat_id_) == "rd1" then
database:set(bot_id.."botss:DRAGON:Set:Rd"..MATRIXg.sender_user_id_..":"..MATRIXg.chat_id_,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."botss:DRAGON:Add:Rd:Sudo:Text1"..test, text)  
end  
send(MATRIXg.chat_id_, MATRIXg.id_," 👻تم حفظ الرد الثاني ارسل الرد الثالث")
return false  
end  
end
if text then  
local test = database:get(bot_id.."botss:DRAGON:Text:Sudo:Bot"..MATRIXg.sender_user_id_..":"..MATRIXg.chat_id_)
if database:get(bot_id.."botss:DRAGON:Set:Rd"..MATRIXg.sender_user_id_..":"..MATRIXg.chat_id_) == "rd2" then
database:set(bot_id.."botss:DRAGON:Set:Rd"..MATRIXg.sender_user_id_..":"..MATRIXg.chat_id_,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
database:set(bot_id.."botss:DRAGON:Add:Rd:Sudo:Text2"..test, text)  
end  
send(MATRIXg.chat_id_, MATRIXg.id_," 👻تم حفظ الرد")
return false  
end  
end
if text then
local Text = database:get(bot_id.."botss:DRAGON:Add:Rd:Sudo:Text"..text)   
local Text1 = database:get(bot_id.."botss:DRAGON:Add:Rd:Sudo:Text1"..text)   
local Text2 = database:get(bot_id.."botss:DRAGON:Add:Rd:Sudo:Text2"..text)   
if Text or Text1 or Text2 then 
local texting = {
Text,
Text1,
Text2
}
Textes = math.random(#texting)
send(MATRIXg.chat_id_, MATRIXg.id_,texting[Textes])
end
end
------------------------------------------------------------------------
if text1 then 
send(MATRIXg.chat_id_, MATRIXg.id_, text1)
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
end
if stekr then 
sendSticker(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, stekr)   
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
end
if veico then 
sendVoice(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, veico)   
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
end
if video then 
sendVideo(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil,video)
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
end
if anemi then 
sendDocument(MATRIXg.chat_id_, MATRIXg.id_, 0, 1,nil, anemi)   
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
end
if document then
sendDocument(MATRIXg.chat_id_, MATRIXg.id_, 0, 1,nil, document)   
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
end  
if audio then
sendAudio(MATRIXg.chat_id_,MATRIXg.id_,audio)  
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
end
if photo then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil,photo,photo_caption)
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
end  
end
end

-------------------------------
if text == ""..(database:get(bot_id..'Name:Bot') or 'MATRIX').." غادر" or text == 'غادر' then  
if Sudo(MATRIXg) and not database:get(bot_id..'Left:Bot'..MATRIXg.chat_id_)  then 
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=MATRIXg.chat_id_,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
send(MATRIXg.chat_id_, MATRIXg.id_,'※ تم مغادرة المجموعه') 
database:srem(bot_id..'Chek:Groups',MATRIXg.chat_id_)  
end
return false  
end
if text == 'الاحصائيات' then
if Sudo(MATRIXg) then 
local Groups = database:scard(bot_id..'Chek:Groups')  
local Users = database:scard(bot_id..'User_Bot')  
Text = ' 👻 الاحصائيات  \n'..' 👻 عدد الجروبات  ⇇{'..Groups..'}'..'\n 👻  عدد المشتركين  ⇇{'..Users..'}'
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
return false
end
if text == 'الجروبات' then
if Sudo(MATRIXg) then 
local Groups = database:scard(bot_id..'Chek:Groups')  
local Users = database:scard(bot_id..'User_Bot')  
Text = ' 👻 عدد الجروبات  ⇇{`'..Groups..'`}'
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
return false
end
if text == 'المشتركين' then
if Sudo(MATRIXg) then 
local Groups = database:scard(bot_id..'Chek:Groups')  
local Users = database:scard(bot_id..'User_Bot')  
Text = ' 👻 عدد المشتركين  ⇇{`'..Users..'|}'
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
return false
end
if text == 'تفعيل المغادره' and DevSoFi(MATRIXg) then   
if database:get(bot_id..'Left:Bot'..MATRIXg.chat_id_) then
Text = ' 👻 تم تفعيل مغادرة البوت'
database:del(bot_id..'Left:Bot'..MATRIXg.chat_id_)  
else
Text = ' 👻 بالتاكيد تم تفعيل مغادرة البوت'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل المغادره' and DevSoFi(MATRIXg) then  
if not database:get(bot_id..'Left:Bot'..MATRIXg.chat_id_) then
Text = ' 👻 تم تعطيل مغادرة البوت'
database:set(bot_id..'Left:Bot'..MATRIXg.chat_id_,true)   
else
Text = ' 👻 بالتاكيد تم تعطيل مغادرة البوت'
end
send(MATRIXg.chat_id_, MATRIXg.id_, Text) 
end

if text == 'تفعيل الردود العامه' and Manager(MATRIXg) then   
if database:get(bot_id..'Reply:Sudo'..MATRIXg.chat_id_) then
database:del(bot_id..'Reply:Sudo'..MATRIXg.chat_id_)  
Text = '\n 👻 تم تفعيل الردود العامه' 
else
Text = '\n 👻 بالتاكيد تم تفعيل الردود العامه'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل الردود العامه' and Manager(MATRIXg) then  
if not database:get(bot_id..'Reply:Sudo'..MATRIXg.chat_id_) then
database:set(bot_id..'Reply:Sudo'..MATRIXg.chat_id_,true)   
Text = '\n 👻 تم تعطيل الردود العامه' 
else
Text = '\n 👻 بالتاكيد تم تعطيل الردود العامه'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تفعيل الايدي' and Manager(MATRIXg) then   
if database:get(bot_id..'Bot:Id'..MATRIXg.chat_id_)  then
database:del(bot_id..'Bot:Id'..MATRIXg.chat_id_) 
Text = '\n 👻 تم تفعيل الايدي' 
else
Text = '\n 👻  بالتاكيد تم تفعيل الايدي'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل الايدي' and Manager(MATRIXg) then  
if not database:get(bot_id..'Bot:Id'..MATRIXg.chat_id_)  then
database:set(bot_id..'Bot:Id'..MATRIXg.chat_id_,true) 
Text = '\n 👻 تم تعطيل الايدي' 
else
Text = '\n 👻 بالتاكيد تم تعطيل الايدي'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تفعيل ايدي صوره' and Manager(MATRIXg) then   
if database:get(bot_id..'Bot:Id:Photo'..MATRIXg.chat_id_)  then
database:del(bot_id..'Bot:Id:Photo'..MATRIXg.chat_id_) 
Text = '\n 👻 تم تفعيل الايدي بالصور' 
else
Text = '\n 👻 بالتاكيد تم تفعيل الايدي بالصوره'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل ايدي صوره' and Manager(MATRIXg) then  
if not database:get(bot_id..'Bot:Id:Photo'..MATRIXg.chat_id_)  then
database:set(bot_id..'Bot:Id:Photo'..MATRIXg.chat_id_,true) 
Text = '\n 👻 تم تعطيل الايدي بالصوره' 
else
Text = '\n 👻 بالتاكيد تم تعطيل الايدي بالصوره'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تفعيل الحظر' and Constructor(MATRIXg) then   
if database:get(bot_id..'Lock:kick'..MATRIXg.chat_id_)  then
database:del(bot_id..'Lock:kick'..MATRIXg.chat_id_) 
Text = '\n 👻 تم تفعيل الحظر' 
else
Text = '\n 👻 بالتاكيد تم تفعيل الحظر'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل الحظر' and Constructor(MATRIXg) then  
if not database:get(bot_id..'Lock:kick'..MATRIXg.chat_id_)  then
database:set(bot_id..'Lock:kick'..MATRIXg.chat_id_,true) 
Text = '\n 👻 تم تعطيل الحظر' 
else
Text = '\n 👻 بالتاكيد تم تعطيل الحظر'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تفعيل الرفع' and Constructor(MATRIXg) then   
if database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_)  then
database:del(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_) 
Text = '\n 👻 تم تفعيل الرفع' 
else
Text = '\n 👻 بالتاكيد تم تفعيل الرفع'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل الرفع' and Constructor(MATRIXg) then  
if not database:get(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_)  then
database:set(bot_id..'Lock:Add:Bot'..MATRIXg.chat_id_,true) 
Text = '\n 👻 تم تعطيل الرفع' 
else
Text = '\n 👻 بالتاكيد تم تعطيل الرفع'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'ايدي' and tonumber(MATRIXg.reply_to_message_id_) > 0 then
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(extra,data) 
local MATRIXguser = tonumber(database:get(bot_id..'MATRIXg_User'..MATRIXg.chat_id_..':'..result.sender_user_id_) or 1) 
local Contact = tonumber(database:get(bot_id..'Add:Contact'..MATRIXg.chat_id_..':'..result.sender_user_id_) or 0) 
local NUMPGAME = tonumber(database:get(bot_id..'NUM:GAMES'..MATRIXg.chat_id_..result.sender_user_id_) or 0)
local edit = tonumber(database:get(bot_id..'edits'..MATRIXg.chat_id_..result.sender_user_id_) or 0)
local rtp = Rutba(result.sender_user_id_,MATRIXg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.sender_user_id_
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ايديه ⇜ '..iduser..'\n 👻 معرفه ⇜ ↝'..username..'↜\n 👻 رتبته ⇜ '..rtp..'\n 👻 تعديلاته ⇜ '..edit..'\n 👻 نقاطه ⇜ '..NUMPGAME..'\n 👻 جهاته ⇜ '..Contact..'\n 👻 رسائله ⇜ ↝'..MATRIXguser..'↜')
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
end
if text and text:match("^ايدي @(.*)$") then
local username = text:match("^ايدي @(.*)$")
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
function start_function(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(extra,data) 
local MATRIXguser = tonumber(database:get(bot_id..'MATRIXg_User'..MATRIXg.chat_id_..':'..result.id_) or 1) 
local Contact = tonumber(database:get(bot_id..'Add:Contact'..MATRIXg.chat_id_..':'..result.id_) or 0) 
local NUMPGAME = tonumber(database:get(bot_id..'NUM:GAMES'..MATRIXg.chat_id_..result.id_) or 0)
local edit = tonumber(database:get(bot_id..'edits'..MATRIXg.chat_id_..result.id_) or 0)
local rtp = Rutba(result.id_,MATRIXg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.id_
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ايديه ⇜↝'..iduser..'↜\n 👻 معرفه ⇜↝'..username..'↜\n 👻 رتبته ⇜↝'..rtp..'↜\n 👻 تعديلاته ⇜('..edit..')\n 👻 نقاطه ⇜('..NUMPGAME..')\n 👻 جهاته ⇜('..Contact..')\n 👻 رسائله ⇜(↝'..MATRIXguser..'↜)')
end,nil)
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 المعرف غير صحيح ')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end


if text == 'رتبتي' then
local rtp = Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_,' 👀 رتبتك ↝ '..rtp..' ↜ 👀\n ') 
end
if text == "تفعيل انا مين"  then
if Constructor(msg) then  
database:set(bot_id.."my_anamen:status"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_," 👽تـم تـفعـيل انا مين") 
return false  
end
end

if text == "تعطيل انا مين"  then
if Constructor(msg) then  
database:del(bot_id.."my_anamen:status"..msg.chat_id_) 
send(msg.chat_id_, msg.id_," 👽 تـم تـعـطـيل انا مين") 
return false end
end
if text == 'انا مين' and SudoBot(msg) then 
local my_ph = database:get(bot_id.."my_anamen:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," 👽انا مين معطله") 
return false  
end
send(msg.chat_id_,msg.id_, '[نت مبرمج السورس يروحي😊](t.me/UU_matrixx)')
return false
end

if text == 'انا مين' and SudoBot(msg) then 
local my_ph = database:get(bot_id.."my_anamen:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," 👽انا مين معطله") 
return false  
end
send(msg.chat_id_,msg.id_, '[نت مطوري تاج راسي 😊](t.me/UU_matrixx)')
return false
end
if text == 'انا مين' and DevSoFi(msg) then 
local my_ph = database:get(bot_id.."my_anamen:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," 👽انا مين معطله") 
return false  
end
send(msg.chat_id_,msg.id_, '[انت مطور السورس يجامد 😍💚](t.me/UU_matrixx)')
return false
end

if text == 'انا مين' and DevSoFi(msg) then 
local my_ph = database:get(bot_id.."my_anamen:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," 👽انا مين معطله") 
return false  
end
send(msg.chat_id_,msg.id_, '[انت مالك السورس يجامد 😍💚](t.me/UU_matrixx)')
return false
end
if text == 'انا مين' and DevSoFi(msg) then 
local my_ph = database:get(bot_id.."my_anamen:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," 👽انا مين معطله") 
return false  
end
send(msg.chat_id_,msg.id_, '[انت مطوري الثاني حته مني 😍💚](t.me/UU_matrixx)')
return false
end

if text == 'انا مين' and Sudo(msg) then 
local my_ph = database:get(bot_id.."my_anamen:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," 👽انا مين معطله") 
return false  
end
send(msg.chat_id_,msg.id_, '[انت المطور بس الصغنن 🌝💘](t.me/UU_matrixx)')
return false
end

if text == 'انا مين' and CoSu(msg) then 
local my_ph = database:get(bot_id.."my_anamen:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," 👽انا مين معطله") 
return false  
end
send(msg.chat_id_,msg.id_, '[نت المالك هن يعني حاجه فوق فوف راسي 😂♥](t.me/UU_matrixx)')
return false
end

if text == 'انا مين' and Constructor(msg) then 
local my_ph = database:get(bot_id.."my_anamen:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," 👽انا مين معطله") 
return false  
end
send(msg.chat_id_,msg.id_, '[انت منشئ يسطا عتلاء منشئ عاوز حاجه تانيه😹🤦‍♂️](t.me/UU_matrixx)')
return false
end

if text == 'انا مين' and BasicConstructor(msg) then 
local my_ph = database:get(bot_id.."my_anamen:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," 👽انا مين معطله") 
return false  
end
send(msg.chat_id_,msg.id_, '[ انت هنا منشئ اساسي يعني اعلى رتبه عاوزك تفتخر😂🎯](t.me/UU_matrixx)')
return false
end

if text == 'انا مين' and Manager(msg) then 
local my_ph = database:get(bot_id.."my_anamen:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," 👽انا مين معطله") 
return false  
end
send(msg.chat_id_,msg.id_, '[ انت المدير يعني الروم تحت سيطرتك😹](t.me/UU_matrixx)')
return false
end

if text == 'انا مين' and Mod(msg) then
local my_ph = database:get(bot_id.."my_anamen:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," 👽انا مين معطله") 
return false  
end
send(msg.chat_id_,msg.id_, '[انت مجرد ادمن اجتهد عشان ياخد رتبه😹 ](t.me/UU_matrixx)')
return false
end

if text == 'انا مين' and Special(msg) then 
local my_ph = database:get(bot_id.."my_anamen:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," 👽انا مين معطله") 
return false  
end
send(msg.chat_id_,msg.id_, '[ انت مميز ابن ناس 😊 ](t.me/UU_matrixx)')
return false
end

if text == 'انا مين' then
local my_ph = database:get(bot_id.."my_anamen:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," 👽انا مين معطله") 
return false  
end
send(msg.chat_id_,msg.id_, '[انت مجرد عضو زليل حقير ملوش لزمه 😂](t.me/UU_matrixx)')
return false
end

if text == "تفعيل ردود السورس"  then
if Constructor(MATRIXg) then  
database:set(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_,true) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻تـم تـفعـيل ردود السورس") 
return false  
end
end
if text == "تعطيل ردود السورس"  then
if Constructor(MATRIXg) then  
database:del(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تـم تـعـطـيل ردود السورس") 
return false end
end

if text == 'تيست' then 
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, ' البوت شغال ') 
return false
end


if text == 'سلام' then 
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_," ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[مع الف سلامه يقلبي متجيش تاني..😹💔🎶](t.me/UU_matrixx)')
return false
end

if text == 'هاي' or text == 'هيي' then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_," 👻معطله") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[باي..😺💜](t.me/UU_matrixx)')
return false
end

if text then 
list = {'برايفت'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[خدوني معاكم برايفت والنبي..🥺💜](t.me/UU_matrixx)')
return false
end
end
end

if text then 
list = {'النبي'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[عليه الصلاه والسلام..💛🙂](t.me/UU_matrixx)')
return false
end
end
end

if text then 
list = {'قفل المحن'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, 'اهلا عزيزي تم قفل المحن بنجاح اتمحونوا بف عشان المراره 😹??') 
return false
end
end
end

if text then 
list = {'🙄'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[نزل عينك تحت كدا علشان هتخاد علي قفاك..👻♥️](t.me/UU_matrixx)')
return false
end
end
end

if text then 
list = {'فتح المحن'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, 'اهلا عزيزي تم فتح المحن بنجاح') 
return false
end
end
end
if text == "حلوه"  or text == "حلو" then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[انت الي حلو ياقمر..♥️🦋](t.me/UU_matrixx)')
return false
end

if text then 
list = {'💋'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[انا عايز مح انا كمان 🥺💛](t.me/UU_matrixx)')
return false
end
end
end

if text then 
list = {'بف'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[وحيات امك ياكبتن خدوني معاكو بيف...🥺💔](t.me/UU_matrixx)')
return false
end
end
end

if text then 
list = {'😭'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[بتعيط تيب لي طيب..😥](t.me/UU_matrixx)')
return false
end
end
end
if text then 
list = {'خاص'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[ونجيب اشخاص ...😂😜](t.me/UU_matrixx)')
return false
end
end
end

if text then 
list = {'بحبك'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[بـعشـقق .🥰❤️](t.me/UU_matrixx)')
return false
end
end
end

if text then 
list = {'بيف'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[وحيات امك ياكبتن خدوني معاكو بيف...🥺💔](t.me/UU_matrixx)')
return false
end
end
end
if text then 
list = {'سلام عليكم'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[وعليكم السلام ..🖤👻](t.me/UU_matrixx)')
return false
end
end
end
if text then 
list = {'++٩٠'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[خخخ امال ..😹](t.me/UU_matrixx)')
return false
end
end
end
if text then 
list = {'قامد'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[قامد قموده ..🌝♥️](t.me/UU_matrixx)')
return false
end
end
end
if text then 
list = {'جامد'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[انا اجمد ..👻💕](t.me/UU_matrixx)')
return false
end
end
end
if text then 
list = {'جمد'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[انا اجمد ..??💕](t.me/UU_matrixx)')
return false
end
end
end
if text then 
list = {'تيجي'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[مش هروح ..😹👻](t.me/UU_matrixx)')
return false
end
end
end
if text then 
list = {'مش'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[مش بدودو ..😹👻](t.me/UU_matrixx)')
return false
end
end
end
if text then 
list = {'بنتي'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[الود كبر وبقي عندو بنت ..😻💥](t.me/UU_matrixx)')
return false
end
end
end
if text then 
list = {'ابني'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[عندو كام سنه ..😹💥](t.me/UU_matrixx)')
return false
end
end
end
if text then 
list = {'😂'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[القمر مهو بيضكك اهوه ..👻💕](t.me/UU_matrixx)')
return false
end
end
end
if text then 
list = {'😹'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
local my_ph = database:get(bot_id.."my_GHoeq2:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_,"  ") 
return false  
end
send(MATRIXg.chat_id_,MATRIXg.id_, '[القمر مهو بيضكك اهوه ..👻💕](t.me/UU_matrixx)')
return false
end
end
end
if text == "اسمي"  then 
tdcli_function({ID="GetUser",user_id_=MATRIXg.sender_user_id_},function(extra,result,success)
if result.first_name_  then
first_name = ' 👻 اسمك الاول  ⇇{`'..(result.first_name_)..'`}'
else
first_name = ''
end   
if result.last_name_ then 
last_name = ' 👻 اسمك الثاني  ⇇{`'..result.last_name_..'`}' 
else
last_name = ''
end      
send(MATRIXg.chat_id_, MATRIXg.id_,first_name..'\n'..last_name) 
end,nil)
end 
if text == 'بايو' then   
send(MATRIXg.chat_id_, MATRIXg.id_,getbio(MATRIXg.sender_user_id_)) 
end 
if text == 'ايديي' then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ايديك  ⇇'..MATRIXg.sender_user_id_)
end
if text == 'الرتبه' and tonumber(MATRIXg.reply_to_message_id_) > 0 then
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(extra,data) 
local rtp = Rutba(result.sender_user_id_,MATRIXg.chat_id_)
local username = ' ['..data.first_name_..'](t.me/'..(data.username_ or 'textchuser')..')'
local iduser = result.sender_user_id_
send(MATRIXg.chat_id_, MATRIXg.id_,'*- الـعـضو  ↭ ↝*'..username..'*↜\n- الرتبه ↭ ↝'..rtp..'↜*\n')
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
end
---------
if text and text:match("^الرتبه @(.*)$") then
local username = text:match("^الرتبه @(.*)$")
function start_function(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(extra,data) 
local rtp = Rutba(result.id_,MATRIXg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.id_
send(MATRIXg.chat_id_, MATRIXg.id_,'*- الـعـضو  ↭ ↝*'..username..'*↜\n- الرتبه ↭ ↝'..rtp..'↜*\n')
end,nil)
else
send(MATRIXg.chat_id_, MATRIXg.id_,'- المعرف غير صحيح ')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
if text and text:match("^الرتبه @(.*)$") then
local userid = text:match("^الرتبه @(.*)$")
function start_function(extra, result, success) 
if userid then 
tdcli_function ({ID = "GetUser",user_id_ = userid},function(extra,data)  
local rtp = Rutba(userid,MATRIXg.chat_id_) 
local username = ('[@'..data.username_..']' or 'لا يوجد') 
local iduser = userid 
send(MATRIXg.chat_id_, MATRIXg.id_,'*- الـعـضو  ↭ ↝*'..username..'*↜\n- الرتبه ↭ ↝'..rtp..'↜*\n')
end,nil) 
else 
send(MATRIXg.chat_id_, MATRIXg.id_,' ✧الايدي غير صحيح') 
end 
end 
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil) 
end
if text == 'كشف' and tonumber(MATRIXg.reply_to_message_id_) > 0 then
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(extra,data) 
local rtp = Rutba(result.sender_user_id_,MATRIXg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.sender_user_id_
send(MATRIXg.chat_id_, MATRIXg.id_,'✧الايدي ↭ ↝'..iduser..'↜\n✧المعرف ↭ ↝'..username..'↜\n✧الرتبه ↭ ↝'..rtp..'↜\n✧نوع الكشف ↭ بالرد')
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, start_function, nil)
end
---------
if text and text:match("^كشف @(.*)$") then
local username = text:match("^كشف @(.*)$")
function start_function(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(extra,data) 
local rtp = Rutba(result.id_,MATRIXg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.id_
send(MATRIXg.chat_id_, MATRIXg.id_,'✧الايدي ↭ ↝'..iduser..'↜\n✧المعرف ↭ ↝'..username..'↜\n✧الرتبه ↭ ↝'..rtp..'↜\n✧نوع الكشف ↭ بالمعرف')
end,nil)
else
send(MATRIXg.chat_id_, MATRIXg.id_,'✧المعرف غير صحيح')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
if text and text:match("^كشف (.*)$") then 
local userid = text:match("^كشف (.*)$") 
function start_function(extra, result, success) 
if userid then 
tdcli_function ({ID = "GetUser",user_id_ = userid},function(extra,data)  
local rtp = Rutba(userid,MATRIXg.chat_id_) 
local username = ('[@'..data.username_..']' or 'لا يوجد') 
local iduser = userid 
send(MATRIXg.chat_id_, MATRIXg.id_,'✧الايدي ↭ ↝'..iduser..'↜\n✧المعرف ↭ ↝'..username..'↜\n✧الرتبه ↭ ↝'..rtp..'↜\n✧نوع الكشف↭ الايدي')
end,nil) 
else 
send(MATRIXg.chat_id_, MATRIXg.id_,' ✧الايدي غير صحيح') 
end 
end 
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil) 
end
if text==('معلومات الجروب') and Mod(MATRIXg) then  
if MATRIXg.can_be_deleted_ == false then 
send(MATRIXg.chat_id_,MATRIXg.id_," 👻 البوت ليس ادمن \n") 
return false  
end 
tdcli_function({ID ="GetChat",chat_id_=MATRIXg.chat_id_},function(arg,ta) 
tdcli_function({ID="GetChannelFull",channel_id_ = MATRIXg.chat_id_:gsub('-100','')},function(arg,data) 
local sofi = ' 👻 عدد الادمنيه : '..data.administrator_count_..
'\n\n 👻 عدد المطرودين : '..data.kicked_count_..
'\n\n 👻 عدد الاعضاء : '..data.member_count_..
'\n\n 👻 عدد رسائل الجروب : '..(MATRIXg.id_/2097152/0.5)..
'\n\n 👻  اسم الجروب : ['..ta.title_..']'
send(MATRIXg.chat_id_, MATRIXg.id_, sofi) 
end,nil)
end,nil)
end 
if text == 'اطردني' or text == 'طلعني' then
if not database:get(bot_id..'Cick:Me'..MATRIXg.chat_id_) then
if Can_or_NotCan(MATRIXg.sender_user_id_, MATRIXg.chat_id_) == true then
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 عذرا لا استطيع طرد ( ↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜ )')
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=MATRIXg.chat_id_,user_id_=MATRIXg.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,data) 
if (data and data.code_ and data.code_ == 400 and data.message_ == "CHAT_ADMIN_REQUIRED") then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !') 
return false  
end
if (data and data.code_ and data.code_ == 3) then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 البوت ليس ادمن يرجى ترقيتي !') 
return false  
end
if data and data.code_ and data.code_ == 400 and data.message_ == "USER_ADMIN_INVALID" then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 عذرا لا استطيع طرد ادمنية الجروب') 
return false  
end
if data and data.ID and data.ID == 'Ok' then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم طردك من الجروب') 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = MATRIXg.chat_id_, user_id_ = MATRIXg.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
return false
end
end,nil)   
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل امر اطردني') 
end
end
if text and text:match("^صيح (.*)$") then
local username = text:match("^صيح (.*)$") 
if not database:get(bot_id..'Seh:User'..MATRIXg.chat_id_) then
function start_function(extra, result, success)
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 المعرف غلط ') 
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا استطيع اصيح معرف قنوات') 
return false  
end
if result.type_.user_.type_.ID == "UserTypeBot" then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا استطيع اصيح معرف بوتات') 
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.is_supergroup_ == true then
send(MATRIXg.chat_id_, MATRIXg.id_,'⚠| لا اسطيع صيح معرفات الجروبات') 
return false  
end
if result.id_ then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 😾تع يعم كلم الود دا قرفني [@↝'..username..'↜]') 
return false
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل امر صيح') 
end
return false
end

if string.find(text,"ضافني") or string.find(text,"ضفني") then
if not database:get(bot_id..'Added:Me'..MATRIXg.chat_id_) then
tdcli_function ({ID = "GetChatMember",chat_id_ = MATRIXg.chat_id_,user_id_ = MATRIXg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusCreator" then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 انت منشئ الجروب') 
return false
end
local Added_Me = database:get(bot_id.."Who:Added:Me"..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_)
if Added_Me then 
tdcli_function ({ID = "GetUser",user_id_ = Added_Me},function(extra,result,success)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
Text = ' 👻 هوا ابن القمر دا الي ضافك😹 ⇇'..Name
sendText(MATRIXg.chat_id_,Text,MATRIXg.id_/2097152/0.5,'md')
end,nil)
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 انت دخلت عبر الرابط يوسخ 🌝') 
end
end,nil)
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل امر  مين ضافني') 
end
end
if text == 'مين ضافني هنا' then
if not database:get(bot_id..'Added:Me'..MATRIXg.chat_id_) then
tdcli_function ({ID = "GetChatMember",chat_id_ = MATRIXg.chat_id_,user_id_ = MATRIXg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusCreator" then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 انت منشئ الجروب') 
return false
end
local Added_Me = database:get(bot_id.."Who:Added:Me"..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_)
if Added_Me then 
tdcli_function ({ID = "GetUser",user_id_ = Added_Me},function(extra,result,success)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
Text = ' 👻 هوا ابن الكلب دا الي ضافك😹 ⇇'..Name
sendText(MATRIXg.chat_id_,Text,MATRIXg.id_/2097152/0.5,'md')
end,nil)
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 انت دخلت عبر الرابط يوسخ 🌝') 
end
end,nil)
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تعطيل امر  مين ضافني') 
end
end

if text == 'تفعيل ضافني' and Manager(MATRIXg) then   
if database:get(bot_id..'Added:Me'..MATRIXg.chat_id_) then
Text = ' 👻 تم تفعيل امر مين ضافني '
database:del(bot_id..'Added:Me'..MATRIXg.chat_id_)  
else
Text = ' 👻 بالتاكيد تم تفعيل امر مين ضافني '
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل ضافني' and Manager(MATRIXg) then  
if not database:get(bot_id..'Added:Me'..MATRIXg.chat_id_) then
database:set(bot_id..'Added:Me'..MATRIXg.chat_id_,true)  
Text = '\n 👻 تم تعطيل امر مين ضافني '
else
Text = '\n 👻 بالتاكيد تم تعطيل امر مين ضافني '
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تفعيل صيح' and Manager(MATRIXg) then   
if database:get(bot_id..'Seh:User'..MATRIXg.chat_id_) then
Text = ' 👻 تم تفعيل امر صيح'
database:del(bot_id..'Seh:User'..MATRIXg.chat_id_)  
else
Text = ' 👻 بالتاكيد تم تفعيل امر صيح'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تنزيل الرتب' and BasicConstructor(MATRIXg) then  
database:del(bot_id..'Constructor'..MATRIXg.chat_id_)
database:del(bot_id..'Manager'..MATRIXg.chat_id_)
database:del(bot_id..'Mod:User'..MATRIXg.chat_id_)
database:del(bot_id..'Special:User'..MATRIXg.chat_id_)
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 تم مسح تلكل ')
end
if text == 'تعطيل صيح' and Manager(MATRIXg) then  
if not database:get(bot_id..'Seh:User'..MATRIXg.chat_id_) then
database:set(bot_id..'Seh:User'..MATRIXg.chat_id_,true)  
Text = '\n 👻 تم تعطيل امر صيح'
else
Text = '\n 👻 بالتاكيد تم تعطيل امر صيح'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تفعيل اطردني' and Manager(MATRIXg) then   
if database:get(bot_id..'Cick:Me'..MATRIXg.chat_id_) then
Text = ' 👻 تم تفعيل امر اطردني إلى عايز يخرج يتنيل 😹'
database:del(bot_id..'Cick:Me'..MATRIXg.chat_id_)  
else
Text = ' 👻 بالتاكيد تم تفعيل امر اطردني مخلاص كفايه تفعيل الأمر 😾'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل اطردني' and Manager(MATRIXg) then  
if not database:get(bot_id..'Cick:Me'..MATRIXg.chat_id_) then
database:set(bot_id..'Cick:Me'..MATRIXg.chat_id_,true)  
Text = '\n 👻 تم تعطيل امر اطردني اترزع هن بقى مفيش خروج 😹'
else
Text = '\n 👻 بالتاكيد تم تعطيل امر اطردني مفيش خروج يولاد القمر 😹'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == "صورتي"  then
local my_ph = database:get(bot_id.."my_photo:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 الصوره معطله") 
return false  
end
local function getpro(extra, result, success)
if result.photos_[0] then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_," 👻 عدد صورك ⇜ "..result.total_count_.." صوره‌‏", MATRIXg.id_, MATRIXg.id_, "md")
else
send(MATRIXg.chat_id_, MATRIXg.id_,'لا تمتلك صوره في حسابك', 1, 'md')
  end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = MATRIXg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
if text and text:match("^صورتي (%d+)$") and faeder11(MATRIXg) then
local pronumb = {string.match(text, "^(صورتي) (%d+)$")}
local function gproen(extra, result, success)
if not is_momod(MATRIXg.sender_user_id_, MATRIXg.chat_id_) and faederdx1:get(FAEDER.."lock:get:photo"..MATRIXg.chat_id_)  then 
faederdx(MATRIXg.chat_id_, MATRIXg.id_, 1, '️❅∫ جلب الصوره الشخصيه معطل ،', 1, 'md')
else
if pronumb[2] == '1' then
if result.photos_[0] then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_)
else
faederdx(MATRIXg.chat_id_, MATRIXg.id_, 1, "❅∫ لا تمتلك صوره في حسابك  ", 1, 'md')
end
elseif pronumb[2] == '2' then
if result.photos_[1] then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, result.photos_[1].sizes_[1].photo_.persistent_id_)
else
faederdx(MATRIXg.chat_id_, MATRIXg.id_, 1, '️❅∫ انت لا تمتلك الصوره التي طلبت رقمها ،', 1, 'md')
end
elseif pronumb[2] == '3' then
if result.photos_[2] then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, result.photos_[2].sizes_[1].photo_.persistent_id_)
else
faederdx(MATRIXg.chat_id_, MATRIXg.id_, 1, '️❅∫ انت لا تمتلك الصوره التي طلبت رقمها ،', 1, 'md')
end
elseif pronumb[2] == '4' then
if result.photos_[3] then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, result.photos_[3].sizes_[1].photo_.persistent_id_)
else
faederdx(MATRIXg.chat_id_, MATRIXg.id_, 1, '️❅∫ انت لا تمتلك الصوره التي طلبت رقمها ،', 1, 'md')
end
elseif pronumb[2] == '5' then
if result.photos_[4] then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, result.photos_[4].sizes_[1].photo_.persistent_id_)
else
faederdx(MATRIXg.chat_id_, MATRIXg.id_, 1, '️❅∫ انت لا تمتلك الصوره التي طلبت رقمها ،', 1, 'md')
end
elseif pronumb[2] == '6' then
if result.photos_[5] then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, result.photos_[5].sizes_[1].photo_.persistent_id_)
else
faederdx(MATRIXg.chat_id_, MATRIXg.id_, 1, '️❅∫ انت لا تمتلك الصوره التي طلبت رقمها ،', 1, 'md')
end
elseif pronumb[2] == '7' then
if result.photos_[6] then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, result.photos_[6].sizes_[1].photo_.persistent_id_)
else
faederdx(MATRIXg.chat_id_, MATRIXg.id_, 1, '️❅∫ انت لا تمتلك الصوره التي طلبت رقمها ،', 1, 'md')
end
elseif pronumb[2] == '8' then
if result.photos_[7] then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, result.photos_[7].sizes_[1].photo_.persistent_id_)
else
faederdx(MATRIXg.chat_id_, MATRIXg.id_, 1, '️❅∫ انت لا تمتلك الصوره التي طلبت رقمها ،', 1, 'md')
end
elseif pronumb[2] == '9' then
if result.photos_[8] then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, result.photos_[8].sizes_[1].photo_.persistent_id_)
else
faederdx(MATRIXg.chat_id_, MATRIXg.id_, 1, '️❅∫ انت لا تمتلك الصوره التي طلبت رقمها ،', 1, 'md')
end
elseif pronumb[2] == '10' then
if result.photos_[9] then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, result.photos_[9].sizes_[1].photo_.persistent_id_)
else
faederdx(MATRIXg.chat_id_, MATRIXg.id_, 1, '️❅∫ انت لا تمتلك الصوره التي طلبت رقمها ،', 1, 'md')
end else
faederdx(MATRIXg.chat_id_, MATRIXg.id_, 1, "❅∫ لا يمكنني ان ارسل لك اكثر من 10 صور ", 1, 'md')
end end end
tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = MATRIXg.sender_user_id_,
offset_ = 0,
limit_ = pronumb[2]
}, gproen, nil) 
end
if text == "نسبه جمالي" or text == "جمالي"   then
local my_ph = database:get(bot_id.."pp_photo:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_," 👻اكتب تفعيل نسبه جمالي") 
return false  
end
local function getpro(extra, result, success)
if result.photos_[0] then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_," 👻نسبه جمالك هيا ⇜ %"..result.total_count_.." يختي قمر يجدعان 👻💕", MATRIXg.id_, MATRIXg.id_, "md")
else
send(MATRIXg.chat_id_, MATRIXg.id_,'لا تمتلك صوره في حسابك', 1, 'md')
  end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = MATRIXg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
if text == ("ايدي") and MATRIXg.reply_to_message_id_ == 0 and not database:get(bot_id..'Bot:Id'..MATRIXg.chat_id_) then     
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not database:sismember(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) then
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
tdcli_function ({ID = "GetChatMember",chat_id_ = MATRIXg.chat_id_,user_id_ = MATRIXg.sender_user_id_},function(arg,da)  tdcli_function ({ ID = "SendChatAction",  chat_id_ = MATRIXg.sender_user_id_, action_ = {  ID = "SendMessageTypingAction", progress_ = 100}  },function(arg,ta)  tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(extra,result,success)  tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = MATRIXg.sender_user_id_,offset_ = 0,limit_ = 1},function(extra,sofi,success) 
if da.status_.ID == "ChatMemberStatusCreator" then 
rtpa = 'المالك'
elseif da.status_.ID == "ChatMemberStatusEditor" then 
rtpa = 'مشرف' 
elseif da.status_.ID == "ChatMemberStatusMember" then 
rtpa = 'عضو'
end
local getbioY = getbio(MATRIXg.sender_user_id_)
local MATRIXguser = tonumber(database:get(bot_id..'MATRIXg_User'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) or 1) 
local numMATRIXggp = tonumber(MATRIXg.id_/2097152/0.5)
local nspatfa = tonumber(MATRIXguser / numMATRIXggp * 100)
local Contact = tonumber(database:get(bot_id..'Add:Contact'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) or 0) 
local NUMPGAME = tonumber(database:get(bot_id..'NUM:GAMES'..MATRIXg.chat_id_..MATRIXg.sender_user_id_) or 0)
local rtp = Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
local iduser = MATRIXg.sender_user_id_
local edit = tonumber(database:get(bot_id..'edits'..MATRIXg.chat_id_..MATRIXg.sender_user_id_) or 0)
local photps = (sofi.total_count_ or 0)
local interaction = Total_MATRIXg(MATRIXguser)
local rtpg = rtpa
local sofia = {
	
"يتي القمر نزل الارض يعمل اي🥺",

"صورتك عفنت غيرها بقي....🤓🧡",

"اي يعم القمر دا ملاك يجدعان...🥺💕",

"اي الصوره المفنه دي يعم....😜",

"هوا الي مجننا هوا هوا القمر هوا....😂👻",

"صورتك دي ولا صورت القمر.....👻💌",

}
local rdphoto = sofia[math.random(#sofia)]
if not database:get(bot_id..'Bot:Id:Photo'..MATRIXg.chat_id_) then      
local get_id_text = database:get(bot_id.."KLISH:ID"..MATRIXg.chat_id_)
if get_id_text then
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
get_id_text = get_id_text:gsub('#rdphoto',rdphoto) 
get_id_text = get_id_text:gsub('#bio',getbioY) 
get_id_text = get_id_text:gsub('#id',iduser) 
get_id_text = get_id_text:gsub('#username',username) 
get_id_text = get_id_text:gsub('#MATRIXgs',MATRIXguser) 
get_id_text = get_id_text:gsub('#edit',edit) 
get_id_text = get_id_text:gsub('#stast',rtp) 
get_id_text = get_id_text:gsub('#auto',interaction) 
get_id_text = get_id_text:gsub('#game',NUMPGAME) 
get_id_text = get_id_text:gsub('#photos',photps) 
if result.status_.ID == "UserStatusRecently" and result.profile_photo_ ~= false then   
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, sofi.photos_[0].sizes_[1].photo_.persistent_id_,get_id_text)       
else 
if result.status_.ID == "UserStatusEmpty" and result.profile_photo_ == false then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..get_id_text..']')   
else
send(MATRIXg.chat_id_, MATRIXg.id_, '\n     ꙰🦅 ليس لديك صور في حسابك \n['..get_id_text..']')      
end 
end
else
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
if result.status_.ID == "UserStatusRecently" and result.profile_photo_ ~= false then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, sofi.photos_[0].sizes_[1].photo_.persistent_id_,''..rdphoto..'\n¦• 𝚄𝚂𝙴𝚁 ↬  ↝'..username..'↜  ↝💘\n¦• 𝙼𝚂𝙶𝚂↬  ↝'..MATRIXguser..'↜  ↝💘\n¦• 𝚁𝙰𝙽𝙺↬ ↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜  ↝💘\n¦• 𝙸𝙳↬   ↝'..MATRIXg.sender_user_id_..'↜ ↝💘\n¦• 𝙱𝙸𝙾 ↬ ↝'..getbioY..'↜ ↝💘\n ¦• 𝒄𝒉↬  ↝@UU_matrixx↜   ↝💘\n')
else 
if result.status_.ID == "UserStatusEmpty" and result.profile_photo_ == false then
send(MATRIXg.chat_id_, MATRIXg.id_,'[\n ¦✙ بيك عزيزي ↝'..Name..'↜ \n¦• 𝚄𝚂𝙴𝚁 ↬  ↝'..Name..'↜    ↝💘\n¦• 𝙼𝚂𝙶𝚂↬ ↝'..MATRIXguser..'↜.   ↝💘\n ¦• 𝚁𝙰𝙽𝙺↬ ↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜    ↝💘\n¦• 𝙸𝙳↬  ↝'..MATRIXg.sender_user_id_..'↜    ↝💘\n¦• 𝒄𝒉↬   ↝@UU_matrixx↜ ↝🇧??\n')
else
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 الصوره ⇜ ليس لديك صور في حسابك'..'[\n¦• 𝚄𝚂𝙴𝚁 ↬ ↝'..username..'↜\n¦• 𝙼𝚂𝙶𝚂↬ ↝'..MATRIXguser..'↜\n¦• 𝙸𝙳↬  ↝'..MATRIXg.sender_user_id_..'↜\n¦• 𝒄𝒉↬  ↝@UU_matrixx↜\n')
end 
end
end
else
local get_id_text = database:get(bot_id.."KLISH:ID"..MATRIXg.chat_id_)
if get_id_text then
get_id_text = get_id_text:gsub('#rdphoto',rdphoto) 
get_id_text = get_id_text:gsub('#bio',getbioY) 
get_id_text = get_id_text:gsub('#id',iduser) 
get_id_text = get_id_text:gsub('#username',username) 
get_id_text = get_id_text:gsub('#MATRIXgs',MATRIXguser) 
get_id_text = get_id_text:gsub('#edit',edit) 
get_id_text = get_id_text:gsub('#stast',rtp) 
get_id_text = get_id_text:gsub('#auto',interaction) 
get_id_text = get_id_text:gsub('#game',NUMPGAME) 
get_id_text = get_id_text:gsub('#photos',photps) 
send(MATRIXg.chat_id_, MATRIXg.id_,'['..get_id_text..']')   
else
send(MATRIXg.chat_id_, MATRIXg.id_,'[\n¦• 𝚄𝚂𝙴𝚁 ↬  ↝'..username..'↜   ↝💘\n¦• 𝙼𝚂𝙶𝚂↬ ↝'..MATRIXguser..'↜   ↝💘\n¦• 𝚁𝙰𝙽𝙺↬ ↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜   ↝💘\n¦• 𝙸𝙳↬  ↝'..MATRIXg.sender_user_id_..'↜   ↝💘\n¦• 𝒄𝒉↬ ↝@UU_matrixx↜   ↝💘\n')
end
end

end,nil)
end,nil)
end,nil)
end,nil)
end
end
if text == ("Id") and MATRIXg.reply_to_message_id_ == 0 and not database:get(bot_id..'Bot:Id'..MATRIXg.chat_id_) then     
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if not database:sismember(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) then
database:sadd(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) 
tdcli_function ({ID = "GetChatMember",chat_id_ = MATRIXg.chat_id_,user_id_ = MATRIXg.sender_user_id_},function(arg,da)  tdcli_function ({ ID = "SendChatAction",  chat_id_ = MATRIXg.sender_user_id_, action_ = {  ID = "SendMessageTypingAction", progress_ = 100}  },function(arg,ta)  tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(extra,result,success)  tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = MATRIXg.sender_user_id_,offset_ = 0,limit_ = 1},function(extra,sofi,success) 
if da.status_.ID == "ChatMemberStatusCreator" then 
rtpa = 'المالك'
elseif da.status_.ID == "ChatMemberStatusEditor" then 
rtpa = 'مشرف' 
elseif da.status_.ID == "ChatMemberStatusMember" then 
rtpa = 'عضو'
end
local MATRIXguser = tonumber(database:get(bot_id..'MATRIXg_User'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) or 1) 
local numMATRIXggp = tonumber(MATRIXg.id_/2097152/0.5)
local nspatfa = tonumber(MATRIXguser / numMATRIXggp * 100)
local Contact = tonumber(database:get(bot_id..'Add:Contact'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) or 0) 
local NUMPGAME = tonumber(database:get(bot_id..'NUM:GAMES'..MATRIXg.chat_id_..MATRIXg.sender_user_id_) or 0)
local rtp = Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
local iduser = MATRIXg.sender_user_id_
local edit = tonumber(database:get(bot_id..'edits'..MATRIXg.chat_id_..MATRIXg.sender_user_id_) or 0)
local photps = (sofi.total_count_ or 0)
local interaction = Total_MATRIXg(MATRIXguser)
local rtpg = rtpa
local sofia = {
	
"يتي القمر نزل الارض يعمل اي🥺",

"صورتك عفنت غيرها بقي....🤓🧡",

"اي يعم القمر دا ملاك يجدعان...🥺💕",

"اي الصوره المفنه دي يعم....😜",

"هوا الي مجننا هوا هوا القمر هوا....😂👻",

"صورتك دي ولا صورت القمر.....👻💌",

}
local rdphoto = sofia[math.random(#sofia)]
if not database:get(bot_id..'Bot:Id:Photo'..MATRIXg.chat_id_) then      
local get_id_text = database:get(bot_id.."KLISH:ID"..MATRIXg.chat_id_)
if get_id_text then
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
get_id_text = get_id_text:gsub('#rdphoto',rdphoto) 
get_id_text = get_id_text:gsub('#id',iduser) 
get_id_text = get_id_text:gsub('#username',username) 
get_id_text = get_id_text:gsub('#MATRIXgs',MATRIXguser) 
get_id_text = get_id_text:gsub('#edit',edit) 
get_id_text = get_id_text:gsub('#stast',rtp) 
get_id_text = get_id_text:gsub('#auto',interaction) 
get_id_text = get_id_text:gsub('#game',NUMPGAME) 
get_id_text = get_id_text:gsub('#photos',photps) 
if result.status_.ID == "UserStatusRecently" and result.profile_photo_ ~= false then   
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, sofi.photos_[0].sizes_[1].photo_.persistent_id_,get_id_text)       
else 
if result.status_.ID == "UserStatusEmpty" and result.profile_photo_ == false then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..get_id_text..']')   
else
send(MATRIXg.chat_id_, MATRIXg.id_, '\n  ¦✙•  ليس لديك صور في حسابك \n['..get_id_text..']')      
end 
end
else
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
if result.status_.ID == "UserStatusRecently" and result.profile_photo_ ~= false then
sendPhoto(MATRIXg.chat_id_, MATRIXg.id_, 0, 1, nil, sofi.photos_[0].sizes_[1].photo_.persistent_id_,''..rdphoto..'\n¦• 𝚄𝚂𝙴𝚁 ↬  ↝'..username..'↜     ↝💘\n¦• 𝙼𝚂𝙶𝚂↬  ↝'..MATRIXguser..'↜     ↝💘\n¦• 𝚁𝙰𝙽𝙺↬ ↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜     ↝💘\n¦• 𝙸𝙳↬   ↝'..MATRIXg.sender_user_id_..'↜    ↝💘\n¦• 𝒄𝒉↬  ↝@UU_matrixx↜     ↝💘\n')
else 
if result.status_.ID == "UserStatusEmpty" and result.profile_photo_ == false then
send(MATRIXg.chat_id_, MATRIXg.id_,'[\n ¦• 𝚄𝚂𝙴𝚁 ↬  ↝'..username..'↜    ↝💘\n¦• 𝙼𝚂𝙶𝚂↬ ↝'..MATRIXguser..'↜.   ↝💘\n ¦• 𝚁𝙰𝙽𝙺↬ ↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜    ↝💘\n¦• 𝙸𝙳↬  ↝'..MATRIXg.sender_user_id_..'↜    ↝💘\n¦• 𝒄𝒉↬   ↝@UU_matrixx↜    ↝💘\n')
else
send(MATRIXg.chat_id_, MATRIXg.id_, '\n 👻 الصوره ⇜ ليس لديك صور في حسابك'..'[\n¦• 𝚄𝚂𝙴𝚁 ↬ ↝'..username..'↜\n¦• 𝙼𝚂𝙶𝚂↬ ↝'..MATRIXguser..'↜\n¦• 𝙸𝙳↬  ↝'..MATRIXg.sender_user_id_..'↜\n¦• 𝒄𝒉↬  ↝@UU_matrixx↜\n')
end 
end
end
else
local get_id_text = database:get(bot_id.."KLISH:ID"..MATRIXg.chat_id_)
if get_id_text then
get_id_text = get_id_text:gsub('#rdphoto',rdphoto) 
get_id_text = get_id_text:gsub('#id',iduser) 
get_id_text = get_id_text:gsub('#username',username) 
get_id_text = get_id_text:gsub('#MATRIXgs',MATRIXguser) 
get_id_text = get_id_text:gsub('#edit',edit) 
get_id_text = get_id_text:gsub('#stast',rtp) 
get_id_text = get_id_text:gsub('#auto',interaction) 
get_id_text = get_id_text:gsub('#game',NUMPGAME) 
get_id_text = get_id_text:gsub('#photos',photps) 
send(MATRIXg.chat_id_, MATRIXg.id_,'['..get_id_text..']')   
else
send(MATRIXg.chat_id_, MATRIXg.id_,'[\n¦• 𝚄𝚂𝙴𝚁 ↬  ↝'..username..'↜   ↝💘\n¦• 𝙼𝚂𝙶𝚂↬ ↝'..MATRIXguser..'↜   ↝💘\n¦• 𝚁𝙰𝙽𝙺↬ ↝'..Rutba(MATRIXg.sender_user_id_,MATRIXg.chat_id_)..'↜   ↝💘\n¦• 𝙸𝙳↬  ↝'..MATRIXg.sender_user_id_..'↜   ↝💘\n¦• 𝒄𝒉↬ ↝@UU_matrixx↜   ↝💘\n')
end
end

end,nil)
end,nil)
end,nil)
end,nil)
end
end
if text == 'تغير الايدي' and Manager(MATRIXg) then 
local List = {
[[
゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 .
゠??𝚂𝙶 𖨈 #MATRIXgs 𖥲 .
゠𝚂𝚃𝙰 𖨈 #stast 𖥲 .
゠𝙸𝙳 𖨈 #id 𖥲 .
]],
[[ 👻 ᴜѕᴇʀɴᴀᴍᴇ ➥• #username .
 👻ᴍѕɢѕ ➥• #MATRIXgs .
 👻 ѕᴛᴀᴛѕ ➥• #stast .
 👻 ʏᴏᴜʀ ɪᴅ ➥• #id  .
 👻ᴇᴅɪᴛ ᴍsɢ ➥• #edit .
 👻ᴅᴇᴛᴀɪʟs ➥• #auto . 
 👻 ɢᴀᴍᴇ ➥• #game .
]],
[[
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕
➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕
➭- 𝒎𝒔𝒈𝒆𓂅 #MATRIXgs 𓍯. 💕
➭- 𝒊𝒅 𓂅 #id 𓍯. 💕
]],
[[
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑮𝒓𝒐𝒖𝒑 ★
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🖤 | 𝑺𝑻?? : #stast 🧙🏻‍♂ ☥
• 🖤 | 𝑰𝑫 : #id ‌‌‏♕
• 🖤 | 𝑴𝑺𝑮 : #MATRIXgs 𓆊
]],
[[
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 .
├ 𝐌𝐒𝐆 𖤱 #MATRIXgs 𖦴 .
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 .
└ 𝐈?? 𖤱 #id 𖦴 .
]],
[[
𓄼🇮🇶 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 :#username 
𓄼🇮🇶 𝑺𝒕𝒂𝒔𝒕 :#stast 
𓄼🇮🇶 𝒊𝒅 :#id 
𓄼🇮🇶 ??𝒂𝒎𝒆𝑺 :#game 
𓄼🇮🇶 𝑴𝒔𝒈𝒔 :#MATRIXgs
]],
[[
- 🇨🇰 𝒖𝒔𝒆𝒓𝒏𝒂𝒎𝒆 . #username 𖣂.
- 🇨🇰 𝒔𝒕𝒂𝒔𝒕 . #stast 𖣂.
- 🇨🇰 ??𝒅 . #id 𖣂.
- 🇨🇰 𝒈𝒂𝒎𝒆𝒔 . #game ??.
- 🇨🇰 𝒎𝒔𝒈𝒔 . #MATRIXgs 𖣂.
]],
[[
𝟓 𝟔 𖡻 #username  ࿇🦄
𝟓 𝟔 𖡻 #MATRIXgs  ࿇🦄
𝟓 𝟔 𖡻 #auto  ࿇🦄
𝟓 𝟔 𖡻 #stast  ࿇🦄
𝟓 𝟔 𖡻 #id  ࿇🦄
]],
[[
金 - 𝓾𝓼𝓮𝓻𝓷𝓪𝓶𝓮 . #username ⸙ 
金 - 𝓼𝓽𝓪𝓼𝓽  . #stast ⸙ 
金 - 𝓲𝓭 . #id ⸙ 
金 - 𝓰𝓶𝓪𝓼 . #gmas ⸙ 
金 - 𝓶𝓼𝓰𝓼 . #MATRIXgs ⸙
]],
[[
🇯🇵 - 𝄬 username . #username  𓃠
🇯🇵 - 𝄬 stast . #stast  𓃠
🇯🇵 - 𝄬 id . #id 𓃠
🇯🇵 - 𝄬 gmas . #gmas 𓃠
🇯🇵 - 𝄬 MATRIXgs . #MATRIXgs  𓃠
]],
[[
𓄼🇪🇭 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 : #username ♕
𓄼🇪🇭 𝑺𝒕𝒂𝒔𝒕 : #stast    ☥
𓄼🇪🇭 𝒊𝒅 : #id ‌‌‏⚚
𓄼🇪🇭 𝑮𝒂𝒎𝒆𝑺 : #edit ⚚
𓄼🇪🇭 𝑴𝒔𝒈𝒔 : #MATRIXgs 𓆊
]],
[[
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞.
➞: ??𝒔𝒆𝒓𓂅 #username 𓍯➸💞.
➞: 𝒎𝒔𝒈𝒆𓂅 #MATRIXgs 𓍯➸💞.
➞: 𝒊𝒅 𓂅 #id 𓍯➸💞.
]],
[[
☆•𝐮𝐬𝐞𝐫 : #username 𖣬  
☆•𝐦𝐬𝐠  : #MATRIXgs 𖣬 
☆•𝐬𝐭𝐚 : #stast 𖣬 
☆•𝐢𝐝  : #id 𖣬
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #username 𓂅 .
- 𓏬 𝐌𝐬𝐆  : #MATRIXgs 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 .
- 𓏬 𝐈𝐃 : #id 𓂅 .
]],
[[
.𖣂 𝙪𝙨𝙚𝙧𝙣𝙖𝙢𝙚 , #username  
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast  
.𖣂 𝙡𝘿 , #id  
.𖣂 𝙂𝙖𝙢𝙨 , #game 
.𖣂 𝙢𝙨𝙂𝙨 , #MATRIXgs
]],
[[
𖤍 |↶ #id    ꙰🇪🇬.
𖤍 |↶ #username    ꙰🇪🇬.
𖤍 |↶ #MATRIXgs    ꙰🇪🇬.
𖤍 |↶ #stast    ꙰🇪🇬.
𖤍 |↶ 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 𝗨𝗦𝗘𝗥 ⟿ #username  « 
 𝗠𝗦𝗚𝗦 ⟿  #MATRIXgs  « 
 𝗦𝗧𝗔 ⟿ #stast  « 
 𝗜𝗗  ⟿ #id  « 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
🇪🇬≪💎≫ #username • メ
🇪🇬≪💎≫ #stast  •メ
🇪🇬≪💎≫ #id  • メ
🇪🇬≪💎≫ #MATRIXgs  •メ
🇪🇬≪💎≫ #game •メ
🇪🇬𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
 𝚄𝚂𝙴𝚁 𓄹𓄼 #username
 𝙸𝙳  ??𓄼 #id 
 𝚂𝚃𝙰 𓄹𓄼 #stast 
 𝙼𝚂𝙶𝚂𓄹𓄼 #MATRIXgs
 𝗖𝗛 - ↝@UU_matrixx↜ ??.
]],
[[
𓅓➪:ᗰᔕᘜᔕ : #MATRIXgs - ❦ .
??➪ : Iᗪ : #id - ❦ . 
𓅓➪ : ᔕTᗩᔕT : #stast - ❦ . 
𓅓➪ : ᑌᔕᖇᗴᑎᗩᗰᗴ : #username _ ❦ .
𓅓➪ : 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
- ايديڪ  ⁞ #id 💘 ٬
- يوزرڪ القميل ⁞ #username ?? ٬
- رسائلڪ  الطيفهہَ ⁞ #MATRIXgs 💘 ٬
- رتبتڪ الحلوه ⁞ #stast  💘٬
- سحڪاتڪ الفول ⁞ #edit 💘 ٬
- 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
𓁷⁦⁦ - 𝙪𝙚𝙨 †: #username 𓀀 .
𓁷 - 𝙢𝙨𝙜 † : #MATRIXgs 𓀀 .
𓁷 - 𝙨𝙩𝙖 †: #stast 𓀀  .
𓁷 - 𝙞?? †: #id 𓀀 .
𓁷 - 𝗖𝗛 - ↝@UU_matrixx↜ ??.
]],
[[
𖡋 𝐔𝐒𝐄 #username 
𖡋 𝐌𝐒𝐆 #MATRIXgs 
𖡋 𝐒𝐓𝐀 #stast 
𖡋 𝐈𝐃 #id 
𖡋 𝐄𝐃𝐈𝐓 #edit
𖡋 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
𖤂 ~ 𝑢𝑠𝑒 #username  𖤐
𖤂 ~ 𝑚??𝑔 #MATRIXgs 𖤐
𖤂 ~ 𝑠𝑡𝑎 #stast  
𖤂 ~ 𝑖𝑑 #id 𖤐
𖤂 ~ 𝑒𝑑𝑖𝑡 #edit 𖤐
𖤂 ~ 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
••• ••• ••• ••• ••• ••• ••• 
࿕ ¦• 𝙐𝙎𝙀𝙍  ⟿ #username ༆
 ࿕ ¦• 𝙈𝙎𝙂𝙎   ⟿ #MATRIXgs ༆
 ࿕ ¦• 𝙂𝙈𝘼𝙎  ⟿ #stast ༆
 ࿕ ¦• 𝙏𝘿 𝙎𝙏𝘼  ⟿ #id ༆
••• ••• ••• ••• ••• ••• •••
 ࿕ ¦• 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
► 𝗨𝗦𝗘𝗥𝗡𝗔𝗠𝗘 #username 𓃚  ꙰
► ??𝗗 #id 𓃚 ꙰
► 𝗦??𝗔𝗦 #stast 𓃚 ꙰
► 𝗠𝗦𝗔𝗚 #MATRIXgs 𓃚 ꙰
► 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
-↯   𝚄𝚂𝙴𝚁𝙽𝙰𝙼𝙴 . #username 🇪🇬 ꙰ 
-↯   𝚂𝚃𝙰𝚂𝚃 . #stast 🇪🇬 ꙰
-↯   𝙸𝙳 . #id 🇪🇬 ꙰ 
-↯   𝙶𝙼𝙰𝚂 . #stast 🇪🇬 ꙰ 
-↯   𝙼𝚂𝙶𝚂 . #MATRIXgs 🇪🇬 ꙰
-↯   ??𝗛 - ↝@UU_matrixx↜ 🇪🇬 ꙰.
]],
[[
- UsEr🇪🇬 ꙰ #username
- StA🇪🇬 ꙰   #MATRIXgs
- MATRIXGs🇪🇬 ꙰ #stast
- ID🇪🇬 ꙰  #id
- 𝗖𝗛 🇪🇬 ꙰  ↝@UU_matrixx↜ 💞.
]],
[[
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🇪🇬 - 𝚄𝚂𝙴𝚁 ⟿ #username 💘.
🇪🇬 - ??𝚂𝙶𝚂 ⟿  #MATRIXgs 💘.
🇪🇬 - 𝙶𝙼𝙰𝚂 ⟿ #stast 💘.
🇪🇬 - 𝙸𝙳 𝚂𝚃𝙰 ⟿ #id 💘.  
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🇪🇬 - 𝗖?? - ↝@UU_matrixx↜ 👻.
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #username 𓂅 .
- 𓏬 𝐌𝐬𝐆  : #MATRIXgs 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 .
- 𓏬 𝐈𝐃 : #id 𓂅 .
- 𓏬 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
ᯓ 𝟔𝟔𝟔 𖡋 #username •✟
ᯓ 𝟔𝟔𝟔𖡋 #stast  •✟
ᯓ 𝟔𝟔𝟔𖡋 #id  • ✟
ᯓ 𝟔𝟔𝟔𖡋 #MATRIXgs  •✟ 
ᯓ 𝟔𝟔𝟔𖡋 #game •✟
ᯓ 𝟔𝟔𝟔𖡋 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
 👻•𝐮𝐬𝐞𝐫 : #username 𖣬  
 👻•𝐦𝐬𝐠  : #MATRIXgs 𖣬 
 👻•𝐬𝐭𝐚 : #stast 𖣬 
 👻•𝐢𝐝  : #id 𖣬
 👻•𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
- ᴜѕᴇʀɴᴀᴍᴇ ➣ #username .
- ᴍѕɢѕ ➣ #MATRIXgs .
- ѕᴛᴀᴛѕ ➣ #stast .
- ʏᴏᴜʀ ɪᴅ ➣ #id  .
- 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
- ᴜѕʀ: #username ঌ.
- ᴍѕɢ: #MATRIXgs  ঌ.
- ѕᴛᴀ: #stast  ঌ.
- ɪᴅ: #id ঌ.
- 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
- 𝑢𝑠𝑒𝑟𝑛𝑎𝑚𝑒 ⟿ #username
- 𝑚𝑠𝑔𝑠 ⟿ #MATRIXgs
- 𝑖𝑑 ⟿ #id
- 𝑒𝑑𝑖𝑡 ⟿ #edit
- 𝑔𝑎𝑚𝑒 ⟿ #game
- 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
⌔➺: MATRIXgs : #MATRIXgs - 🔹.
⌔➺: ID : #id - 🔹.
⌔➺: Stast : #stast -🔹.
⌔➺: UserName : #username -🔹.
⌔➺: 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🇪🇬 ꙰  - 𝚞 𝚜𝚎 𝚛 ➟ #username  ❃.
🇪🇬 ꙰  - 𝚖 𝚜𝚐 𝚜 ➟ #MATRIXgs ❃.
🇪🇬 ꙰  - 𝚐 𝚖 𝚊𝚜  ➟ #stast ❃.
🇪🇬 ꙰  - 𝙸𝙳 𝚜𝚝𝚊   ➟ #id ❃.
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🇪🇬 ꙰  - 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
🌯 ¦✙• 𝐮𝐬𝐞𝐫𝒏𝒂𝒎𝒆 ➢ ⁞  #username 🇪🇬
🌯 ¦✙• 𝐦𝐬𝐠 ➢ ⁞  #MATRIXgs  📝
🌯 ¦✙• 𝒓𝒂𝒏𝒌 ➢ ⁞ #stast  
🌯 ¦✙• 𝐢𝐝 𝒔𝒕𝒂 ➢ ⁞ #id  🆔
🌯 ¦ 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
¦• 𝚄𝚂𝙴𝚁  ⇉⁞ #username ↝🇪??.
¦• 𝙼𝚂𝙶𝚂 ⇉ ⁞  #MATRIXgs  ↝ 🇪🇬.
¦• 𝚁𝙰𝙽𝙺  ⇉⁞ #stast  ↝🇪🇬.
¦• 𝙸𝙳 𝚂𝚃𝙰 ⇉ #id  ↝🇪🇬.
¦• 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞.
➞: 𝒖??𝒆𝒓𓂅 #username 𓍯➸💞.
➞: 𝒎𝒔𝒈𝒆𓂅 #MATRIXgs 𓍯➸💞.
➞: 𝐢𝐝 𓂅 #id 𓍯➸💞.
➞: 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
➼ : 𝐼𝐷 𖠀 #id . ♡
➼ : 𝑈𝑆𝐸𝑅 𖠀 #username .♡
➼ : 𝑀𝑆𝐺𝑆 𖠀 #MATRIXgs .♡
➼ : 𝑆𝑇𝐴S𝑇 𖠀 #stast .♡ 
➼ : 𝐸𝐷𝐼𝑇  𖠀 #edit .♡
➼ : 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
▽ ¦❀• USER ➭ ⁞ #username .
▽ ¦❀• 𝙼𝚂𝙶𝚂 ➬ ⁞  #MATRIXgs  .
▽ ¦❀• STAT ➬ ⁞ #stast  .
▽ ¦❀• 𝙸𝙳  ➬ ⁞ #id  .
▽ ¦❀• 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
• ❉ 𝑼𝑬𝑺 : #username ‌‌‏.
• ❉ 𝑺𝑻𝑨 : #stast .
• ❉ 𝑰𝑫 : #id  ‌‌‏.
• ❉  𝑴𝑺𝑮 : #MATRIXgs 𓆊.
• ❉ 𝑾𝒆𝒍𝒄𝒐𝒎𝒆  ⁞ .
• ❉ 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
|USERNAME #username 𓃚
| YOUR -ID - #id 𓃚
| STAS-#stast 𓃚
 | MATRIXAG - #MATRIXgs 𓃚
 | 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
𝟔𝟔𝟔 𖡋 #username • 𖣰💞
??𝟔𝟔 𖡋  #stast •??💞
𝟔𝟔𝟔 𖡋 #id • 𖣰💞
𝟔𝟔𝟔 𖡋 #game • 𖣰💞
𝟔𝟔𝟔 𖡋 #MATRIXgs • 𖣰💞
𝟔𝟔𝟔 𖡋 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
⌔➺: MATRIXgs : #MATRIXgs - 🔹.
⌔➺: ID : #id - 🔹.
⌔➺: Stast : #stast -🔹.
⌔➺: UserName : #username -🔹.
⌔➺: 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
 👻 - 𝓾𝓼𝓮𝓻 ➪ #username 👻.
 👻 - ??𝓽𝓪𝓼𝓽  ➪ #stast 👻.
 👻 - 𝓲𝓭 ➪ #id ⸙ 👻.
 👻 - 𝓰𝓶𝓪𝓼 ➪ #gmas ⸙ 👻.
 👻 - 𝓶𝓼𝓰𝓼 ➪ #MATRIXgs 👻.
 👻 - 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
- 𝄬 username . #username ➪🇪🇬
 - 𝄬 stast . #stast ➪🇪🇬
 - 𝄬 id . #id ➪🇪🇬
 - 𝄬 MATRIXgs . #MATRIXgs ➪🇪🇬
 - 𝄬 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
◣: 𝒔𝒕𝒂𓂅 #stast 𓍯➥♡.
◣: 𝐮𝐬𝐞𝐫𓂅 #username 𓍯➥♡.
◣: 𝒎𝒔𝒈𝒆𓂅 #MATRIXgs 𓍯➥♡.
◣: 𝐢𝐝 𓂅 #id 𓍯➥♡.
◣: 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
↣• USE ➤ #username  ↝🍬.
↣• MATRIXG ➤  #MATRIXgs  ↝🍬.
↣• STA ➤  #stast  ↝🍬.
↣• iD ➤ #id  ↝🍬.
↣• 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
➫✿: S #stast 𓍯➟♡.
➫✿: U𓂅 #username 𓍯➟♡.
➫✿: M𓂅 #MATRIXgs 𓍯➟♡.
➫✿:  I  #id ➟♡.
➫✿: 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
✶- 𝒔𝒕𝒂𓂅 #stast 𓍯↝❃ .
✶- 𝐮𝐬𝐞𝐫𓂅 #username 𓍯↝❃.
✶- 𝒎𝒔𝒈𝒆𓂅 #MATRIXgs 𓍯↝❃.
✶- 𝐢𝐝 𓂅 #id 𓍯↝❃.
✶- 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
• 🖤 | 𝑼𝑬𝑺 :  #username

• 🖤 | 𝑺𝑻𝑨 : #stast

• 🖤 | 𝑰𝑫 :  #id

• 🖤 | 𝑴𝑺𝑮 : #MATRIXgs

• 🖤 | 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
• USE 𖦹 #username 
• MATRIXG 𖥳 #MATRIXgs  
• STA 𖦹 #stast 
• iD 𖥳 #id
• 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
- ᴜѕᴇʀɴᴀᴍᴇ ➣ #username .
- ᴍѕɢѕ ➣ #MATRIXgs .
- ѕᴛᴀᴛѕ ➣ #stast .
- ʏᴏᴜʀ ɪᴅ ➣ #id  .
- ᴇᴅɪᴛ ᴍsɢ ➣ #edit .
- ᴅᴇᴛᴀɪʟs ➣ #auto . 
-  ɢᴀᴍᴇ ➣ #game .
- 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
⚕𝙐𝙎𝙀𝙍𝙉𝘼𝙈𝙀 : #username
⚕𝙈𝙀𝙎𝙎𝘼𝙂𝙀𝙎 : #MATRIXgs
⚕𝙎𝙏𝘼𝙏𝙎 : #stast
⚕𝙄𝘿 : #id
⚕𝙅𝙀𝙒𝙀𝙇𝙎 : #game
⚕𝘿𝙀𝙑 : #ridha
⚕𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
• 🦄 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🦄 | 𝑺𝑻𝑨 : #stast ☥
• 🦄 | 𝑰𝑫 : #id ‌‌‏♕
• 🦄 | 𝑴𝑺𝑮 : #MATRIXgs 𓆊
• 🦄 | 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 : ⁞
• 🦄 | 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
• △ | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• ▽ | 𝑺𝑻𝑨 : #stast ☥
• ⊠ | 𝑰𝑫 : #id ‌‌‏♕
• ❏ | 𝑴𝑺𝑮 : #MATRIXgs 𓆊
• ❏ | 𝑾??𝒍𝒄𝒐𝒎𝒆 :
• ❏ | 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
┇iD ➺ #id 💘
┇UsEr ➺ #username 💕
┇MATRIXG ➺ #MATRIXgs 🧸 
┇StAtE ➺ #stast 🎀
┇EdIT ➺ #edit  💒
┇𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 ★
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🖤 | 𝑺𝑻𝑨 : #stast 🧙🏻‍♂ ☥
• 🖤 | 𝑰𝑫 : #id ‌‌‏♕
• 🖤 | 𝑴𝑺𝑮 : #MATRIXgs 𓆊
• 🖤 | 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
┄─━━ 👻━━─┄
𖣤 ᴜѕᴇʀɴᴀᴍᴇ 𓄹𓄼 #id 🇪🇬
𖦼 ʏᴏᴜʀ ɪᴅ 𓄹𓄼 #username  💛
𖥪 ᴍѕɢѕ 𓄹𓄼 #MATRIXgs ✉️
𖥧 ѕᴛᴀᴛѕ 𓄹𓄼 #stast 👩🏿‍?? 
𖥣 ᴇᴅɪᴛ 𓄹𓄼 #game🙇🏿‍♀💕
✰ ᴄʜ ᴇʟɪɴ ➣ #edit
┄─━━ 👻━━─┄
✰ 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
𓄼 ᴜѕᴇ : #username ♕
𓄼 ѕᴛᴀ : #stast ☥
𓄼 ɪᴅ : #id ‌‌‏⚚
𓄼 ᴍѕɢ : #MATRIXgs 𓆊
?? 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
• ﮼ايديك  #id 🌻 ٬
• ﮼يوزرك ➺ #username 🌻 ٬
• ﮼مسجاتك ➺ #MATRIXgs 🌻 ٬
•  ﮼رتبتك➺ #stast 🌻 ٬
• ﮼تعديلك ➺ #edit 🌻 ٬
• ﮼ تعين ➺ ↝@UU_matrixx↜ 💞.
]],
[[
‎⿻┊Yor iD 𖠄 #id ٫
‌‎⿻┊UsEr 𖠄 #username ٫
‌‎⿻┊MATRIXGs 𖠄 #MATRIXgs ٫
‌‎⿻┊StAtS 𖠄 #stast ٫
‌‎⿻┊‌‎EdiT 𖠄 #edit ٫
‌‎⿻┊‌‎𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
⌾ | 𝐢𝐝  𓃠 #id .
⌾ | 𝐮𝐬??𝐫 𓃠 #username .
⌾ | 𝐦𝐬𝐠 𓃠 #MATRIXgs .
⌾ | 𝐬??𝐚 𓃠 #stast .
⌾ | 𝒆𝒅𝒊𝒕 𓃠 #edit .
⌾ | 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
♡ : 𝐼𝐷 𖠀 #id .
♡ : 𝑈𝑆𝐸𝑅 𖠀 #username .
♡ : 𝑀𝑆𝐺𝑆 𖠀 #MATRIXgs .
♡ : 𝑆𝑇𝐴𝑇𝑆 𖠀 #stast .
♡ : 𝐸𝐷𝐼𝑇  𖠀 #edit .
♡ : 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
•ᑌᔕᗴᖇ- #username 
•ᔕTᗩ- #stast 
•ᗰᔕ- #MATRIXgs 
•Iᗪ- #id
•𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
• USE ➤ #username  .
• MATRIXG ➤  #MATRIXgs  .
• STA ➤  #stast  .
• iD ➤ #id  .
• 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
𝐘𝐨𝐮𝐫 𝐈𝐃 ☤🇪🇬- #id 
𝐔𝐬𝐞𝐫𝐍𝐚☤🇪🇬- #username 
𝐒𝐭𝐚𝐬𝐓 ☤🇪🇬- #stast 
𝐌𝐬𝐠𝐒☤🇪🇬 - #MATRIXgs
𝗖𝗛☤🇪🇬 - ↝@UU_matrixx↜ 👻.
]],
[[
⭐️𝖘𝖙𝖆 : #stast ـ🍭
⭐️𝖚𝖘𝖊𝖗𝖓𝖆𝖒𝖊 : #username ـ🍭
⭐️𝖒𝖘𝖌𝖘 : #MATRIXgs ـ🍭
⭐️𝖎𝖉 : #id ـ 🍭
⭐️𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
• 🇪🇬 - 𝚄𝚂𝙴𝚁 « #username  🍭
• 🇪🇬 - 𝙸𝙳 « #id  🍭
• 🇪🇬 - 𝙼𝚂𝙶𝚂 « #MATRIXgs  🍭
• 🇪🇬 - 𝚂𝚃𝙰𝚂𝚃 « #stast  🍭
• 🇪🇬 - 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
• USE ➤  #username .
• MATRIXG ➤  #MATRIXgs .
• STA ➤  #stast .
• iD ➤ #id .
• 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
🇪🇬 - 𝄬 𝐔ˢᴱᴿᴺᴬᴹᴱ . #username  𓃠
🇪🇬 - 𝄬 ˢᵀᴬˢᵀ . #stast  𓃠
🇪?? - 𝄬 ᴵᴰ . #id 𓃠
🇪🇬 - 𝄬 ᴳᴹᴬˢ . #gmas 𓃠
🇪🇬 - 𝄬 ᴹˢᴳˢ . #MATRIXgs  𓃠
🇪🇬 - 𝄬 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
𓄼🇪🇬 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 : #username ♕
𓄼🇪?? 𝑺??𝒂𝒔𝒕 : #stast    ☥
𓄼🇪🇬 𝐢𝐝 : #id ‌‌‏⚚
𓄼🇪🇬 𝑮𝒂𝒎???? : #edit ⚚
𓄼🇪🇬 𝑴𝒔𝒈𝒔 : #MATRIXgs 𓆊
𓄼🇪🇬 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
Usᴇʀ Nᴀᴍᴇ ~ #username 
Yᴏᴜʀ ɪᴅ ~ #id 
Sᴛᴀsᴛ ~ #stast 
MATRIXᴀɢ ~ #MATRIXgs
𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
- 🇪🇬 UsErNaMe . #username 𖠲
- 🇪🇬 StAsT . #stast 𖠲
- 🇪🇬 Id . #id 𖠲
- 🇪🇬 GaMeS . #game 𖠲
- 🇪🇬 MATRIXGs . #MATRIXgs 𖠲
- 🇪🇬 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
🇪🇬 - 𝄬 username . #username  𓃠
🇪?? - 𝄬 stast . #stast  ??
🇪🇬 - ?? id . #id 𓃠
🇪🇬 - 𝄬 gmas . #gmas 𓃠
🇪🇬 - 𝄬 MATRIXgs . #MATRIXgs  𓃠
🇪?? - 𝄬 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
金 - 𝓾𝓼𝓮𝓻𝓷𝓪𝓶𝓮 . #username ⸙ 
金 - 𝓼𝓽𝓪𝓼𝓽  . #stast ⸙ 
金 - 𝓲𝓭 . #id ⸙ 
金 - 𝓰𝓶𝓪𝓼 . #gmas ⸙ 
金 - 𝓶𝓼𝓰?? . #MATRIXgs ⸙
金 - 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
➜𝗨𝗦??𝗥𝗡𝗔𝗠𝗘 : #username
➜𝗠𝗘𝗦𝗦𝗔𝗚𝗘𝗦 : #MATRIXgs
➜𝗦𝗧𝗔𝗧𝗦 : #stast
➜𝗜𝗗 : #id
➜𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
⌔┇MATRIXgs : #MATRIXgs.
⌔┇ID : #id.
⌔┇Stast : #stast.
⌔┇UserName : #username.
⌔┇𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
𝒔𝒕𝒂𓂅 #stast 𓍯
𝐮𝐬𝐞𝐫𓂅 #username 𓍯
𝒎𝒔𝒈𝒆𓂅 #MATRIXgs 𓍯
𝐢𝐝 𓂅 #id 𓍯
𓂅 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
- 🇪🇬 𝐮𝐬𝐞𝐫𝒏𝒂𝒎𝒆 . #username 𖣂.
- 🇪🇬 𝒔𝒕𝒂𝒔𝒕 . #stast 𖣂.
- 🇪🇬 𝐢𝐝 . #id 𖣂.
- 🇪🇬 𝒈𝒂𝒎𝒆𝒔 . #game 𖣂.
- 🇪🇬 𝐦𝐬𝐠 . #MATRIXgs 𖣂.
- 🇪🇬 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
ᯓ 𝗨𝗦𝗘𝗥??𝗮𝗺𝗘 . #username 🇪🇬 ꙰
ᯓ 𝗦??𝗮𝗦𝗧 . #stast 🇪🇬 ꙰
ᯓ 𝗜𝗗 . #id 🇪🇬 ꙰
ᯓ 𝗚𝗮𝗺𝗘𝗦 . #game 🇪🇬 ꙰
ᯓ 𝗺𝗦𝗚𝗦 . #MATRIXgs 🇪🇬 ꙰
ᯓ 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
.𖣂 𝙪𝙨𝙚𝙧𝙣𝙖𝙢𝙚 , #username  🖤 ↴
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast  🖤 ↴
.𖣂 𝙡𝘿 , #id  🖤 ↴
.𖣂 𝘼𝙪𝙩𝙤 , #auto  🖤 ↴
.𖣂 𝙢𝙨𝙂𝙨 , #MATRIXgs  🖤 ↴
.𖣂 𝗖𝗛 - ↝@UU_matrixx↜ ??.
]],
[[
➥• USE 𖦹 #username - 🇪🇬.
➥• MATRIXG 𖥳 #MATRIXgs  - 🇪🇬.
➥• STA 𖦹 #stast - 🇪🇬.
➥• iD 𖥳 #id - 🇪🇬.
➥• 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
👳🏼‍♂ - 𝄬 username . #username . 🇪🇬
👳🏼‍♂ - 𝄬 stast . #stast . 🇪🇬
👳🏼‍♂ - 𝄬 id . #id . 🇪🇬
👳🏼‍♂ - 𝄬 auto . #auto . 🇪🇬
👳🏼‍♂ - 𝄬 MATRIXgs . #MATRIXgs . 🇪🇬
👳🏼‍♂ - 𝄬 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕
➮- 𝐮𝐬𝐞𝐫𓂅 #username 𓍯. 💕
➭- 𝒎𝒔𝒈𝒆𓂅 #MATRIXgs 𓍯. 💕
➭- 𝐢𝐝 𓂅 #id 𓍯. 💕
➭- 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
𓄼 ᴜѕᴇ : #username ♕
𓄼 ѕᴛᴀ : #stast  ☥
𓄼 ɪᴅ : #id ‌‌‏⚚
𓄼 ᴍѕɢ : #MATRIXgs 𓆊 
𓐀 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𓀃.
𓄼 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
𝐓𝐓• 𝐘𝐎𝐔𝐑 𝐈𝐃 𖠰 #id .
𝐓𝐓• 𝐌𝐬𝐠𝐒 𖠰 #MATRIXgs .
𝐓𝐓• 𝐔𝐬𝐞??𝐍𝐚 𖠰 #username .
𝐓𝐓• 𝐒𝐓𝐀𝐒𝐓 𖠰 #stast .
𝐓𝐓• 𝐀𝐔𝐓𝐎 𖠰 #auto .
𝐓𝐓• 𝗘𝗗𝗜𝗧 𖠰 #edit .
𝐓𝐓• 𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
𝟓 𝟔 𖡻 #username  ࿇🦄
𝟓 𝟔 𖡻 #MATRIXgs  ࿇🦄
𝟓 𝟔 𖡻 #auto  ࿇🦄
𝟓 𝟔 𖡻 #stast  ࿇🦄
𝟓 𝟔 𖡻 #id  ࿇🦄
𝟓 𝟔 𖡻 𝗖𝗛 - ↝@UU_matrixx↜ 💞.
]],
[[
༻┉𖦹┉┉𖦹┉┉𖦹┉┉𖦹┉༺
• |𝗜𝗗  ⁞ #id
• |𝗨𝗦𝗘 ⁞ #username
• |𝗦𝗧𝗔  ⁞ #stast
• |𝗠𝗦𝗚  ⁞ #edit
• |𝗔𝗨𝗧𝗢 ⁞ #auto
—————————————
𝗖𝗛 - ↝@UU_matrixx↜ 👻.
]],
[[
┄─━━𖦹━━─┄
𖣰𖡻 𖡋𝗜𝗗• #id •𓀎
𖣰𖡻 𖡋𝗨𝗦𝗘• #username •𓀎
𖣰𖡻 𖡋𝗦𝗧𝗔• #stast •𓀎
𖣰𖡻 𖡋𝗠𝗦𝗚• #MATRIXgs •𓀎
𖣰𖡻 𖡋𝗔𝗨𝗧𝗢• #auto •𓀎
𖣰𖡻 𖡋𝗘𝗗𝗜𝗧• #edit • 𓀎
┄─━━𖦹━━─┄
𝗖𝗛 - ↝@UU_matrixx↜  𖦹 .
]],
[[
𖤍 |↶ #id    ꙰🇪🇬.
𖤍 |↶ #username    ꙰🇪🇬.
𖤍 |↶ #MATRIXgs    ꙰🇪🇬.
𖤍 |↶ #stast    ꙰🇪🇬.
𖤍 |↶ 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 𝗨𝗦𝗘𝗥 ⟿ #username  « 
 𝗠𝗦??𝗦 ⟿  #MATRIXgs  « 
 𝗦𝗧𝗔 ⟿ #stast  « 
 𝗜𝗗  ⟿ #id  « 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
🇪🇬≪💎≫ #username • メ
🇪🇬≪💎≫ #stast  •メ
🇪🇬≪💎≫ #id  • メ
🇪🇬≪💎≫ #MATRIXgs  •メ
🇪🇬≪💎≫ #game •メ
🇪🇬𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
 𝚄𝚂𝙴?? 𓄹𓄼 #username
 𝙸𝙳  𓄹𓄼 #id 
 𝚂𝚃𝙰 𓄹𓄼 #stast 
 𝙼𝚂𝙶𝚂𓄹𓄼 #MATRIXgs
 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
𓅓➪:ᗰᔕᘜᔕ : #MATRIXgs - ❦ .
𓅓➪ : Iᗪ : #id - ❦ . 
𓅓➪ : ᔕTᗩᔕT : #stast - ❦ . 
𓅓➪ : ᑌᔕᖇᗴᑎᗩᗰᗴ : #username _ ❦ .
𓅓➪ : 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
- ايديڪ  ⁞ #id 💘 ٬
- يوزرڪ القميل ⁞ #username 💘 ٬
- رسائلڪ  الطيفهہَ ⁞ #MATRIXgs 💘 ٬
- رتبتڪ الحلوه ⁞ #stast  💘٬
- سحڪاتڪ الفول ⁞ #edit 💘 ٬
- 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
𓁷⁦⁦ - 𝙪𝙚𝙨 †: #username 𓀀 .
𓁷 - 𝙢𝙨𝙜 † : #MATRIXgs 𓀀 .
𓁷 - 𝙨𝙩𝙖 †: #stast 𓀀  .
𓁷 - 𝙞𝙙 †: #id 𓀀 .
𓁷 - 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
𖡋 𝐔𝐒𝐄 #username 
𖡋 𝐌𝐒𝐆 #MATRIXgs 
𖡋 𝐒𝐓𝐀 #stast 
𖡋 𝐈𝐃 #id 
𖡋 𝐄𝐃𝐈𝐓 #edit
𖡋 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
𖤂 ~ 𝑢𝑠𝑒 #username  𖤐
𖤂 ~ 𝑚𝑠𝑔 #MATRIXgs 𖤐
𖤂 ~ 𝑠𝑡𝑎 #stast  
𖤂 ~ 𝑖𝑑 #id 𖤐
𖤂 ~ 𝑒𝑑𝑖𝑡 #edit 𖤐
𖤂 ~ 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
-↯   𝚄𝚂𝙴𝚁𝙽𝙰𝙼𝙴 . #username 🇪🇬 ꙰ 
-↯   𝚂𝚃𝙰𝚂𝚃 . #stast 🇪🇬 ꙰
-↯   𝙸𝙳 . #id 🇪🇬 ꙰ 
-↯   𝙶𝙼𝙰𝚂 . #stast 🇪🇬 ꙰ 
-↯   𝙼??𝙶𝚂 . #MATRIXgs 🇪🇬 ꙰
-↯   𝗖𝗛 - ↝@UU_matrixx↜ 🇪🇬 ꙰.
]],
[[
••• ••• ••• ••• ••• ••• ••• 
࿕ ¦• 𝙐𝙎𝙀𝙍  ⟿ #username ༆
 ࿕ ¦• 𝙈𝙎𝙂??   ⟿ #MATRIXgs ༆
 ࿕ ¦• 𝙂𝙈𝘼𝙎  ⟿ #stast ༆
 ࿕ ¦• 𝙏𝘿 𝙎𝙏𝘼  ⟿ #id ༆
••• ••• ••• ••• ••• ••• •••
 ࿕ ¦• 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
► 𝗨𝗦𝗘𝗥𝗡𝗔𝗠𝗘 #username 𓃚  ꙰
► 𝗜?? #id 𓃚 ꙰
► 𝗦𝗧𝗔𝗦 #stast 𓃚 ꙰
► 𝗠𝗦𝗔𝗚 #MATRIXgs 𓃚 ꙰
► 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
- UsEr🇪🇬 ꙰ #username
- StA🇪🇬 ꙰   #MATRIXgs
- MATRIXGs🇪🇬 ꙰ #stast
- ID🇪🇬 ꙰  #id
- 𝗖𝗛 🇪🇬 ꙰  ↝@UU_matrixx↜ 👻
]],
[[
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🇪🇬 - 𝚄𝚂𝙴𝚁 ⟿ #username 💘.
🇪🇬 - 𝙼𝚂𝙶𝚂 ⟿  #MATRIXgs 💘.
🇪🇬 - 𝙶𝙼𝙰𝚂 ⟿ #stast 💘.
🇪🇬 - 𝙸𝙳 𝚂𝚃𝙰 ⟿ #id 💘.  
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🇪🇬 - 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #username 𓂅 .
- 𓏬 𝐌𝐬𝐆  : #MATRIXgs 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 .
- 𓏬 𝐈𝐃 : #id 𓂅 .
- ?? 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
ᯓ 𝟔𝟔𝟔 𖡋 #username •✟
ᯓ 𝟔𝟔𝟔𖡋 #stast  •✟
ᯓ 𝟔𝟔𝟔𖡋 #id  • ✟
ᯓ 𝟔𝟔𝟔?? #MATRIXgs  •✟ 
ᯓ 𝟔𝟔𝟔𖡋 #game •✟
ᯓ 𝟔𝟔𝟔𖡋 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
 👻•𝐮𝐬𝐞𝐫 : #username 𖣬  
 👻•𝐦𝐬𝐠  : #MATRIXgs 𖣬 
 👻•𝐬𝐭𝐚 : #stast 𖣬 
 👻•𝐢𝐝  : #id 𖣬
 👻•𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
- ᴜѕᴇʀɴᴀᴍᴇ ➣ #username .
- ᴍѕɢѕ ➣ #MATRIXgs .
- ѕᴛᴀᴛѕ ➣ #stast .
- ʏᴏᴜʀ ɪᴅ ➣ #id  .
- 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
- ᴜѕʀ: #username ঌ.
- ᴍѕɢ: #MATRIXgs  ঌ.
- ѕᴛᴀ: #stast  ঌ.
- ɪᴅ: #id ঌ.
- 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
- 𝑢𝑠𝑒𝑟𝑛𝑎𝑚𝑒 ⟿ #username
- 𝑚𝑠𝑔𝑠 ⟿ #MATRIXgs
- 𝑖𝑑 ⟿ #id
- 𝑒𝑑𝑖𝑡 ⟿ #edit
- 𝑔𝑎𝑚𝑒 ⟿ #game
- 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
🌯 ¦✙• 𝐮𝐬𝐞𝐫𝒏𝒂𝒎𝒆 ➢ ⁞  #username 🇪🇬
🌯 ¦✙• 𝐦𝐬𝐠 ➢ ⁞  #MATRIXgs  📝
🌯 ¦✙• 𝒓𝒂𝒏𝒌 ➢ ⁞ #stast  
🌯 ¦✙• 𝐢𝐝 𝒔𝒕𝒂 ➢ ⁞ #id  🆔
🌯 ¦ 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🇪🇬 ꙰  - 𝚞 𝚜𝚎 𝚛 ➟ #username  ❃.
🇪🇬 ꙰  - 𝚖 𝚜𝚐 𝚜 ➟ #MATRIXgs ❃.
🇪🇬 ꙰  - 𝚐 𝚖 𝚊𝚜  ➟ #stast ❃.
🇪🇬 ꙰  - 𝙸𝙳 𝚜𝚝𝚊   ➟ #id ❃.
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🇪🇬 ꙰  - 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
⌔➺: MATRIXgs : #MATRIXgs - 🔹.
⌔➺: ID : #id - 🔹.
⌔➺: Stast : #stast -🔹.
⌔➺: UserName : #username -🔹.
⌔➺: 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
¦• 𝚄𝚂𝙴𝚁  ⇉⁞ #username ↝🇪🇬.
¦• 𝙼𝚂𝙶𝚂 ⇉ ⁞  #MATRIXgs  ↝ 🇪🇬.
¦• 𝚁𝙰𝙽??  ⇉⁞ #stast  ↝🇪🇬.
¦• 𝙸𝙳 𝚂𝚃𝙰 ⇉ #id  ↝🇪🇬.
¦• 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞.
➞: 𝐮𝐬𝐞𝐫𓂅 #username 𓍯➸💞.
➞: 𝒎𝒔𝒈??𓂅 #MATRIXgs 𓍯➸💞.
➞: ??𝒅 𓂅 #id 𓍯➸💞.
➞: 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
➼ : 𝐼𝐷 𖠀 #id . ♡
➼ : 𝑈𝑆𝐸𝑅 𖠀 #username .♡
➼ : 𝑀𝑆𝐺𝑆 𖠀 #MATRIXgs .♡
➼ : 𝑆𝑇𝐴S𝑇 𖠀 #stast .♡ 
➼ : 𝐸𝐷𝐼𝑇  𖠀 #edit .♡
➼ : 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
▽ ¦❀• USER ➭ ⁞ #username .
▽ ¦❀• 𝙼𝚂𝙶𝚂 ➬ ⁞  #MATRIXgs  .
▽ ¦❀• STAT ➬ ⁞ #stast  .
▽ ¦❀• 𝙸𝙳  ➬ ⁞ #id  .
▽ ¦❀• 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
• ❉ 𝑼𝑬𝑺 : #username ‌‌‏.
• ❉ 𝑺𝑻𝑨 : #stast .
• ❉ 𝑰𝑫 : #id  ‌‌‏.
• ❉  𝑴𝑺𝑮 : #MATRIXgs 𓆊.
• ❉ 𝑾𝒆𝒍𝒄𝒐𝒎𝒆  ⁞ .
• ❉ 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
|USERNAME #username 𓃚
| YOUR -ID - #id 𓃚
| STAS-#stast 𓃚
 | MATRIXAG - #MATRIXgs 𓃚
 | 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
𝟔𝟔𝟔 𖡋 #username • 𖣰💞
𝟔𝟔𝟔 𖡋  #stast •𖣰💞
𝟔??𝟔 𖡋 #id • 𖣰💞
𝟔𝟔𝟔 𖡋 #game • 𖣰💞
𝟔𝟔𝟔 𖡋 #MATRIXgs • 𖣰💞
𝟔𝟔𝟔 𖡋 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
⌔➺: MATRIXgs : #MATRIXgs - 🔹.
⌔➺: ID : #id - 🔹.
⌔➺: Stast : #stast -🔹.
⌔➺: UserName : #username -🔹.
⌔➺: 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
 👻 - 𝓾𝓼𝓮𝓻 ➪ #username 👻.
 👻 - 𝓼𝓽𝓪𝓼𝓽  ➪ #stast 👻.
 👻 - 𝓲𝓭 ➪ #id ⸙ 👻.
 👻 - 𝓰𝓶𝓪𝓼 ➪ #gmas ⸙ 👻.
 👻 - 𝓶𝓼𝓰𝓼 ➪ #MATRIXgs 👻.
 👻 - 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
◣: 𝒔𝒕𝒂𓂅 #stast 𓍯➥♡.
◣: 𝐮𝐬𝐞𝐫𓂅 #username 𓍯➥♡.
◣: 𝒎𝒔𝒈𝒆𓂅 #MATRIXgs 𓍯➥♡.
◣: 𝐢𝐝 𓂅 #id 𓍯➥♡.
◣: 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
- 𝄬 username . #username ➪🇪🇬
 - 𝄬 stast . #stast ➪🇪🇬
 - 𝄬 id . #id ➪🇪🇬
 - 𝄬 MATRIXgs . #MATRIXgs ➪🇪🇬
 - 𝄬 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
↣• USE ➤ #username  ↝🍬.
↣• MATRIXG ➤  #MATRIXgs  ↝🍬.
↣• STA ➤  #stast  ↝🍬.
↣• iD ➤ #id  ↝🍬.
↣• 𝗖𝗛 - ↝@UU_matrixx↜ 🍬
]],
[[
➫✿: S #stast 𓍯➟♡.
➫✿: U𓂅 #username 𓍯➟♡.
➫✿: M𓂅 #MATRIXgs 𓍯➟♡.
➫✿:  I  #id ➟♡.
➫✿: 𝗖?? - ↝@UU_matrixx↜ ♡.
]],
[[
✶- 𝒔𝒕𝒂𓂅 #stast 𓍯↝❃ .
✶- 𝐮𝐬??𝐫𓂅 #username 𓍯↝❃.
✶- 𝒎𝒔𝒈𝒆𓂅 #MATRIXgs 𓍯↝❃.
✶- 𝐢𝐝 𓂅 #id ??↝❃.
✶- 𝗖𝗛 - ↝@UU_matrixx↜ ↝❃.
]],
[[
• 🖤 | 𝑼𝑬𝑺 :  #username

• 🖤 | 𝑺𝑻𝑨 : #stast

• 🖤 | 𝑰𝑫 :  #id

• 🖤 | 𝑴𝑺𝑮 : #MATRIXgs

• 🖤 | 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
• USE 𖦹 #username 
• MATRIXG 𖥳 #MATRIXgs  
• STA 𖦹 #stast 
• iD 𖥳 #id
• 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
🌨𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍Use ⇨ #username 🌨
🌨𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍iD ⇨ #id 🌨
🌨𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍Sta ⇨  #stast 🌨
🌨𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍MATRIXg ⇨ #MATRIXgs 🌨
🌨𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍NaMe ⇨ #name  🌨
]],
[[
- ᴜѕᴇʀɴᴀᴍᴇ ➣ #username .
- ᴍѕɢѕ ➣ #MATRIXgs .
- ѕᴛᴀᴛѕ ➣ #stast .
- ʏᴏᴜʀ ɪᴅ ➣ #id  .
- ᴇᴅɪᴛ ᴍsɢ ➣ #edit .
- ᴅᴇᴛᴀɪʟs ➣ #auto . 
-  ɢᴀᴍᴇ ➣ #game .
- 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
⚕𝙐𝙎𝙀𝙍??𝘼𝙈𝙀 : #username
⚕𝙈𝙀𝙎𝙎??𝙂𝙀𝙎 : #MATRIXgs
⚕𝙎𝙏𝘼𝙏𝙎 : #stast
⚕𝙄𝘿 : #id
⚕??𝙀𝙒𝙀𝙇𝙎 : #game
⚕𝘿𝙀𝙑 : #ridha
⚕𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
• 🦄 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🦄 | 𝑺𝑻𝑨 : #stast ☥
• 🦄 | 𝑰𝑫 : #id ‌‌‏♕
• 🦄 | 𝑴𝑺𝑮 : #MATRIXgs 𓆊
• 🦄 | 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 : ⁞
• 🦄 | 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
• △ | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• ▽ | 𝑺𝑻𝑨 : #stast ☥
• ⊠ | 𝑰𝑫 : #id ‌‌‏♕
• ❏ | 𝑴𝑺𝑮 : #MATRIXgs 𓆊
• ❏ | 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 :
• ❏ | 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
┇iD ➺ #id 💘
┇UsEr ➺ #username 💕
┇MATRIXG ➺ #MATRIXgs 🧸 
┇StAtE ➺ #stast 🎀
┇EdIT ➺ #edit  💒
┇𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🖤 | 𝑺??𝑨 : #stast 🧙🏻‍♂ ☥
• 🖤 | 𝑰𝑫 : #id ‌‌‏♕
• 🖤 | 𝑴𝑺𝑮 : #MATRIXgs 𓆊
• 🖤 | 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
𓄼 ᴜѕᴇ : #username ♕
𓄼 ѕᴛᴀ : #stast ☥
𓄼 ɪᴅ : #id ‌‌‏⚚
𓄼 ᴍѕɢ : #MATRIXgs 𓆊
𓄼 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
‎⿻┊Yor iD 𖠄 #id ٫
‌‎⿻┊UsEr 𖠄 #username ٫
‌‎⿻┊MATRIXGs 𖠄 #MATRIXgs ٫
‌‎⿻┊StAtS 𖠄 #stast ٫
‌‎⿻┊‌‎EdiT 𖠄 #edit ٫
‌‎⿻┊‌‎𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
• ﮼ايديك  #id 🌻 ٬
• ﮼يوزرك ➺ #username 🌻 ٬
• ﮼مسجاتك ➺ #MATRIXgs 🌻 ٬
•  ﮼رتبتك➺ #stast 🌻 ٬
• ﮼تعديلك ➺ #edit 🌻 ٬
•  تعين ➺ ↝@UU_matrixx↜ 👻
]],
[[
┄─━━ 👻━━─┄
𖣤 ᴜѕᴇʀɴᴀᴍᴇ 𓄹?? #id 🇪🇬
𖦼 ʏᴏᴜʀ ɪᴅ 𓄹𓄼 #username  💛
𖥪 ᴍѕɢѕ 𓄹𓄼 #MATRIXgs ✉️
𖥧 ѕᴛᴀᴛѕ 𓄹𓄼 #stast 👩🏿‍🚒 
𖥣 ᴇᴅɪᴛ 𓄹𓄼 #game🙇🏿‍♀💕
✰ ᴄʜ ᴇʟɪɴ ➣ #edit
┄─━━ 👻━━─┄
✰ 𝗖?? - ↝@UU_matrixx↜ 👻
]],
[[
⌾ | 𝐢𝐝  𓃠 #id .
⌾ | 𝐮𝐬𝐞𝐫 𓃠 #username .
⌾ | 𝐦𝐬𝐠 𓃠 #MATRIXgs .
⌾ | 𝐬𝐭𝐚 𓃠 #stast .
⌾ | 𝒆𝒅𝒊𝒕 𓃠 #edit .
⌾ | 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
♡ : 𝐼𝐷 𖠀 #id .
♡ : 𝑈𝑆𝐸𝑅 𖠀 #username .
♡ : 𝑀𝑆𝐺𝑆 𖠀 #MATRIXgs .
♡ : 𝑆𝑇𝐴𝑇𝑆 𖠀 #stast .
♡ : 𝐸𝐷𝐼𝑇  𖠀 #edit .
♡ : 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
•ᑌᔕᗴᖇ- #username 
•ᔕTᗩ- #stast 
•ᗰᔕ- #MATRIXgs 
•Iᗪ- #id
•𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
• USE ➤ #username  .
• MATRIXG ➤  #MATRIXgs  .
• STA ➤  #stast  .
• iD ➤ #id  .
• 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
𝐘??𝐮𝐫 𝐈𝐃 ☤🇪🇬- #id 
𝐔𝐬𝐞𝐫𝐍𝐚☤🇪🇬- #username 
𝐒𝐭𝐚𝐬𝐓 ☤🇪🇬- #stast 
𝐌𝐬𝐠𝐒☤🇪🇬 - #MATRIXgs
𝗖𝗛☤🇪🇬 - ↝@UU_matrixx↜ 👻
]],
[[
⭐️𝖘𝖙𝖆 : #stast ـ🍭
⭐️𝖚𝖘𝖊𝖗𝖓𝖆𝖒𝖊 : #username ـ🍭
⭐️𝖒𝖘𝖌𝖘 : #MATRIXgs ـ🍭
⭐️𝖎𝖉 : #id ـ 🍭
⭐️𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
• 🇪🇬 - 𝚄𝚂𝙴𝚁 « #username  🍭
• 🇪🇬 - 𝙸𝙳 « #id  🍭
• 🇪🇬 - 𝙼𝚂𝙶𝚂 « #MATRIXgs  🍭
• 🇪🇬 - 𝚂𝚃𝙰𝚂𝚃 « #stast  🍭
• 🇪🇬 - 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
• USE ➤  #username .
• MATRIXG ➤  #MATRIXgs .
• STA ➤  #stast .
• iD ➤ #id .
• 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
🇪🇬 - 𝄬 𝐔ˢᴱᴿᴺᴬᴹᴱ . #username  𓃠
🇪🇬 - 𝄬 ˢᵀᴬˢᵀ . #stast  𓃠
🇪🇬 - 𝄬 ᴵᴰ . #id 𓃠
🇪🇬 - 𝄬 ᴳᴹᴬˢ . #gmas 𓃠
🇪🇬 - 𝄬 ᴹˢᴳˢ . #MATRIXgs  𓃠
🇪🇬 - 𝄬 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
➜𝗨𝗦𝗘𝗥𝗡𝗔𝗠𝗘 : #username
➜𝗠𝗘𝗦𝗦??𝗚𝗘𝗦 : #MATRIXgs
➜𝗦𝗧𝗔𝗧𝗦 : #stast
➜𝗜𝗗 : #id
➜𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
- 🇪🇬 UsErNaMe . #username 𖠲
- 🇪?? StAsT . #stast 𖠲
- 🇪🇬 Id . #id 𖠲
- 🇪🇬 GaMeS . #game 𖠲
- 🇪🇬 MATRIXGs . #MATRIXgs 𖠲
- 🇪🇬 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
⌔┇MATRIXgs : #MATRIXgs.
⌔┇ID : #id.
⌔┇Stast : #stast.
⌔┇UserName : #username.
⌔┇𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
𝒔𝒕𝒂𓂅 #stast 𓍯
𝐮𝐬𝐞𝐫𓂅 #username 𓍯
𝒎????𝒆𓂅 #MATRIXgs 𓍯
𝐢𝐝 𓂅 #id 𓍯
𓂅 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
𓄼🇪🇬 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 : #username ♕
𓄼🇪🇬 𝑺𝒕𝒂𝒔𝒕 : #stast    ☥
𓄼🇪🇬 𝐢𝐝 : #id ‌‌‏⚚
𓄼🇪🇬 𝑮𝒂𝒎𝒆𝑺 : #edit ⚚
𓄼🇪🇬 𝑴𝒔𝒈𝒔 : #MATRIXgs 𓆊
𓄼🇪🇬 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
Usᴇʀ Nᴀᴍᴇ ~ #username 
Yᴏᴜʀ ɪᴅ ~ #id 
Sᴛᴀsᴛ ~ #stast 
MATRIXᴀɢ ~ #MATRIXgs
𝗖?? - ↝@UU_matrixx↜ 👻
]],
[[
➥• USE 𖦹 #username - 🇪??.
➥• MATRIXG 𖥳 #MATRIXgs  - 🇪🇬.
➥• STA 𖦹 #stast - 🇪??.
➥• iD 𖥳 #id - 🇪🇬.
➥• 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
🇪🇬 - 𝄬 username . #username  ??
🇪🇬 - 𝄬 stast . #stast  𓃠
🇪🇬 - 𝄬 id . #id 𓃠
🇪🇬 - 𝄬 gmas . #gmas 𓃠
🇪🇬 - 𝄬 MATRIXgs . #MATRIXgs  𓃠
🇪🇬 - 𝄬 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
.𖣂 𝙪𝙨𝙚𝙧𝙣𝙖𝙢𝙚 , #username  🖤 ↴
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast  🖤 ↴
.𖣂 𝙡𝘿 , #id  🖤 ↴
.𖣂 𝘼𝙪𝙩𝙤 , #auto  🖤 ↴
.𖣂 𝙢𝙨𝙂𝙨 , #MATRIXgs  🖤 ↴
.𖣂 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
金 - 𝓾𝓼𝓮𝓻??𝓪𝓶𝓮 . #username ⸙ 
金 - 𝓼𝓽𝓪𝓼𝓽  . #stast ⸙ 
金 - 𝓲𝓭 . #id ⸙ 
金 - 𝓰𝓶𝓪𝓼 . #gmas ⸙ 
金 - 𝓶𝓼𝓰𝓼 . #MATRIXgs ⸙
金 - 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
- 🇪🇬 𝐮𝐬𝐞𝐫𝒏𝒂𝒎𝒆 . #username 𖣂.
- 🇪🇬 𝒔𝒕𝒂𝒔𝒕 . #stast 𖣂.
- 🇪🇬 𝐢𝐝 . #id 𖣂.
- 🇪🇬 𝒈𝒂𝒎𝒆𝒔 . #game 𖣂.
- 🇪🇬 𝐦𝐬𝐠 . #MATRIXgs 𖣂.
- 🇪🇬 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
ᯓ 𝗨𝗦𝗘𝗥𝗡𝗮𝗺𝗘 . #username 🇪🇬 ꙰
ᯓ 𝗦𝗧𝗮𝗦𝗧 . #stast 🇪🇬 ꙰
ᯓ 𝗜𝗗 . #id 🇪🇬 ꙰
ᯓ 𝗚𝗮𝗺𝗘𝗦 . #game 🇪🇬 ꙰
ᯓ 𝗺𝗦𝗚?? . #MATRIXgs ??🇬 ꙰
ᯓ 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
👳🏼‍♂ - 𝄬 username . #username . 🇪🇬
👳🏼‍♂ - 𝄬 stast . #stast . 🇪🇬
👳🏼‍♂ - 𝄬 id . #id . 🇪🇬
👳🏼‍♂ - 𝄬 auto . #auto . 🇪🇬
👳🏼‍♂ - 𝄬 MATRIXgs . #MATRIXgs . 🇪🇬
👳🏼‍♂ - 𝄬 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕
➮- 𝐮𝐬𝐞𝐫𓂅 #username 𓍯. 💕
➭- 𝒎𝒔𝒈𝒆𓂅 #MATRIXgs 𓍯. 💕
➭- 𝐢𝐝 𓂅 #id 𓍯. 💕
➭- 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
𓄼 ᴜѕᴇ : #username ♕
𓄼 ѕᴛᴀ : #stast  ☥
𓄼 ɪᴅ : #id ‌‌‏⚚
𓄼 ᴍѕɢ : #MATRIXgs 𓆊 
𓐀 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𓀃.
𓄼 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
𝐓𝐓• 𝐘𝐎𝐔𝐑 𝐈𝐃 𖠰 #id .
𝐓𝐓• 𝐌𝐬𝐠𝐒 𖠰 #MATRIXgs .
𝐓𝐓• 𝐔𝐬??𝐫𝐍𝐚 𖠰 #username .
𝐓𝐓• 𝐒𝐓𝐀𝐒𝐓 𖠰 #stast .
𝐓𝐓• 𝐀𝐔𝐓𝐎 𖠰 #auto .
𝐓𝐓• 𝗘𝗗𝗜𝗧 𖠰 #edit .
𝐓𝐓• 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
↑𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍𝙐𝙎𝙀𝙍𝙉𝘼𝙈𝙀 ➱ #username ??  
↑𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍𝙄𝘿 ➱ #id
↑𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍𝙍𝘼𝙉𝙆 ➱  #stast 👻  
↑𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍𝙈𝘼𝙎𝙂 ➱ #MATRIXgs 👻  
↑𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍𝗖𝗛 ➯  ↝@UU_matrixx↜ 👻  
]],
[[
𝟓 𝟔 𖡻 #username  ࿇🦄
𝟓 𝟔 𖡻 #MATRIXgs  ࿇🦄
𝟓 𝟔 𖡻 #auto  ࿇🦄
𝟓 𝟔 𖡻 #stast  ࿇🦄
𝟓 𝟔 𖡻 #id  ࿇🦄
𝟓 𝟔 𖡻 𝗖𝗛 - ↝@UU_matrixx↜ 👻
]],
[[
► 𝗨𝗦𝗘𝗥𝗡𝗔𝗠𝗘 #username 𓃚  ꙰
► 𝗜𝗗 #id ?? ꙰
► 𝗦𝗧𝗔𝗦 #stast 𓃚 ꙰
► 𝗠𝗦𝗔𝗚 #MATRIXgs 𓃚 ꙰
► 𝗶𝗗 - ↝@UU_matrixx↜ ☆
]],
[[
- UsEr🇺🇸 ꙰ #username
- StA🇺🇸 ꙰   #MATRIXgs
- MATRIXGs🇺🇸 ꙰ #stast
- ID🇺🇸 ꙰  #id
- 𝗶𝗗 🇺🇸 ꙰  ↝@UU_matrixx↜ ☆
]],
[[
¦• 𝚄𝚂𝙴𝚁  ⇉⁞ #username ↝🇵🇷.
¦• 𝙼𝚂𝙶𝚂 ⇉ ⁞  #MATRIXgs  ↝ 🇵🇷.
¦• 𝚁𝙰𝙽𝙺  ⇉⁞ #stast  ↝🇵🇷.
¦• 𝙸𝙳 𝚂𝚃𝙰 ⇉ #id  ↝🇵🇷.
¦• 𝗶𝗗 - ↝@UU_matrixx↜ ☆
]],
[[
- 🦋 UsErNaMe . #username 𖠲
- 🦋 StAsT . #stast 𖠲
- 🦋 Id . #id 𖠲
- 🦋 GaMeS . #game 𖠲
- 🦋 MATRIXGs . #MATRIXgs 𖠲
- 🦋 𝗖𝗛 - ↝@UU_matrixx↜ ☆
]]}
local Text_Rand = List[math.random(#List)]
database:set(bot_id.."KLISH:ID"..MATRIXg.chat_id_,Text_Rand)
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تغير الايدي ارسل ايدي لرؤيته')
end

if text == 'سحكاتي' or text == 'تعديلاتي' then 
local Num = tonumber(database:get(bot_id..'edits'..MATRIXg.chat_id_..MATRIXg.sender_user_id_) or 0)
if Num == 0 then 
Text = ' 👻  ليس لديك سحكات'
else
Text = ' 👻 عدد سحكاتك * ⇇↝ '..Num..' ↜ *'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == "مسح سحكاتي" or text == "مسح سحكاتي" then  
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم مسح سحكاتك'  )  
database:del(bot_id..'edits'..MATRIXg.chat_id_..MATRIXg.sender_user_id_)
end
if text == "مسح جهاتي" or text == "مسح جهاتي" then  
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم مسح جهاتك'  )  
database:del(bot_id..'Add:Contact'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_)
end
if text == 'جهاتي' or text == 'شكد ضفت' then
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local Num = tonumber(database:get(bot_id..'Add:Contact'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) or 0) 
if Num == 0 then 
Text = ' 👻 لم تقم بأضافه احد'
else
Text = ' 👻 عدد جهاتك * ⇇↝ '..Num..' ↜ *'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == "تنظيف المشتركين" and DevSoFi(MATRIXg) then 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,'- لا تستطيع استخدام البوت يرجى الاشتراك في القناة حتى تتمكن من استخدام الاوامر \n- اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local pv = database:smembers(bot_id.."User_Bot")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
else
database:srem(bot_id.."User_Bot",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  لا يوجد مشتركين وهميين في البوت \n')   
else
local ok = #pv - sendok
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 عدد المشتركين الان  ⇇( '..#pv..' )\n- تم ازالة  ⇇( '..sendok..' ) من المشتركين\n- الان عدد المشتركين الحقيقي  ⇇( '..ok..' ) مشترك \n')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "تنظيف الجروبات" and DevSoFi(MATRIXg) then 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,'- لا تستطيع استخدام البوت يرجى الاشتراك في القناة حتى تتمكن من استخدام الاوامر \n- اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local group = database:smembers(bot_id..'Chek:Groups') 
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
database:srem(bot_id..'Chek:Groups',group[i])  
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=group[i],user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻  لا يوجد جروبات وهميه في البوت\n')   
else
local DRAGON = (w + q)
local sendok = #group - DRAGON
if q == 0 then
DRAGON = ''
else
DRAGON = '\n- تم ازالة  ⇇↝ '..q..' ↜ جروبات من البوت'
end
if w == 0 then
DRAGONk = ''
else
DRAGONk = '\n- تم ازالة  ⇇↝ '..w..' ↜ كروب لان البوت عضو'
end
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 عدد الجروبات الان  ⇇↝ '..#group..' ↜'..DRAGONk..''..DRAGON..'\n*- الان عدد الجروبات الحقيقي  ⇇↝ '..sendok..' ↜ جروبات\n')   
end
end
end,nil)
end
return false
end

if text and text:match("^(gpinfo)$") or text and text:match("^معلومات الجروب$") then
function gpinfo(arg,data)
-- vardump(data) 
DRAGONdx(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 ايدي المجموعة  ⇇↝ '..MATRIXg.chat_id_..' ↜\n 👻 عدد الادمنيه  ⇇↝ *'..data.administrator_count_..' ↜*\n 👻 عدد المحظورين  ⇇↝ *'..data.kicked_count_..' ↜*\n 👻 عدد الاعضاء  ⇇↝ *'..data.member_count_..' ↜*\n', 'md') 
end 
getChannelFull(MATRIXg.chat_id_, gpinfo, nil) 
end
-----------
if text ==("مسح") and Mod(MATRIXg) and tonumber(MATRIXg.reply_to_message_id_) > 0 then
DeleteMessage(MATRIXg.chat_id_,{[0] = tonumber(MATRIXg.reply_to_message_id_),MATRIXg.id_})   
end   
if database:get(bot_id.."numadd:user" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del(bot_id..'id:user'..MATRIXg.chat_id_)  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 تم الغاء الامر ") 
database:del(bot_id.."numadd:user" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_)  
return false  
end 
database:del(bot_id.."numadd:user" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id..'id:user'..MATRIXg.chat_id_)  
database:del(bot_id..'MATRIXg_User'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) 
database:incrby(bot_id..'MATRIXg_User'..MATRIXg.chat_id_..':'..iduserr,numadded)  
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم اضافة له {"..numadded..'} من الرسائل')  
end
------------------------------------------------------------------------
if database:get(bot_id.."gemadd:user" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del(bot_id..'idgem:user'..MATRIXg.chat_id_)  
send(MATRIXg.chat_id_, MATRIXg.id_, " 👻 تم الغاء الامر ") 
database:del(bot_id.."gemadd:user" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_)  
return false  
end 
database:del(bot_id.."gemadd:user" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get(bot_id..'idgem:user'..MATRIXg.chat_id_)  
database:incrby(bot_id..'NUM:GAMES'..MATRIXg.chat_id_..iduserr,numadded)  
send(MATRIXg.chat_id_, MATRIXg.id_,  1, " 👻| تم اضافة له {"..numadded..'} من النقود', 1 , 'md')  
end
------------------------------------------------------------
if text and text:match("^اضف رسائل (%d+)$") and MATRIXg.reply_to_message_id_ == 0 and Constructor(MATRIXg) then    
sofi = text:match("^اضف رسائل (%d+)$")
database:set(bot_id..'id:user'..MATRIXg.chat_id_,sofi)  
database:setex(bot_id.."numadd:user" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_, 120, true)  
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 ارسل لي عدد الرسائل الان') 
return false
end
------------------------------------------------------------------------
if text and text:match("^اضف نقاط (%d+)$") and MATRIXg.reply_to_message_id_ == 0 and Constructor(MATRIXg) then  
sofi = text:match("^اضف نقاط (%d+)$")
database:set(bot_id..'idgem:user'..MATRIXg.chat_id_,sofi)  
database:setex(bot_id.."gemadd:user" .. MATRIXg.chat_id_ .. "" .. MATRIXg.sender_user_id_, 120, true)  
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 ارسل لي عدد النقاط التي تريد اضافتها') 
return false
end
------------------------------------------------------------------------
if text and text:match("^اضف نقاط (%d+)$") and MATRIXg.reply_to_message_id_ ~= 0 and Constructor(MATRIXg) then
local Num = text:match("^اضف نقاط (%d+)$")
function reply(extra, result, success)
database:incrby(bot_id..'NUM:GAMES'..MATRIXg.chat_id_..result.sender_user_id_,Num)  
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم اضافة له {"..Num..'} من النقاط')  
end
tdcli_function ({ID = "GetMessage",chat_id_=MATRIXg.chat_id_,message_id_=tonumber(MATRIXg.reply_to_message_id_)},reply, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^اضف رسائل (%d+)$") and MATRIXg.reply_to_message_id_ ~= 0 and Constructor(MATRIXg) then
local Num = text:match("^اضف رسائل (%d+)$")
function reply(extra, result, success)
database:del(bot_id..'MATRIXg_User'..MATRIXg.chat_id_..':'..result.sender_user_id_) 
database:incrby(bot_id..'MATRIXg_User'..MATRIXg.chat_id_..':'..result.sender_user_id_,Num)  
send(MATRIXg.chat_id_, MATRIXg.id_, "\n 👻 تم اضافة له {"..Num..'} من الرسائل')  
end
tdcli_function ({ID = "GetMessage",chat_id_=MATRIXg.chat_id_,message_id_=tonumber(MATRIXg.reply_to_message_id_)},reply, nil)
return false
end
if text == 'نقاط' or text == 'نقاطي' then 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local Num = database:get(bot_id..'NUM:GAMES'..MATRIXg.chat_id_..MATRIXg.sender_user_id_) or 0
if Num == 0 then 
Text = ' 👻 لم تلعب اي لعبه للحصول على نقاط'
else
Text = ' 👻 عدد نقاطك التي ربحتها هيه * ⇇↝ '..Num..' ↜ نقاط *'
end
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text and text:match("^بيع نقاطي (%d+)$") or text and text:match("^بيع نقاط (%d+)$") then
local NUMPY = text:match("^بيع نقاطي (%d+)$") or text and text:match("^بيع نقاط (%d+)$") 
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا تستطيع استخدام البوت \n 👻  يرجى الاشتراك بالقناه اولا \n 👻  اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
if tonumber(NUMPY) == tonumber(0) then
send(MATRIXg.chat_id_,MATRIXg.id_,"\n* 👻 لا استطيع البيع اقل من 1 *") 
return false 
end
if tonumber(database:get(bot_id..'NUM:GAMES'..MATRIXg.chat_id_..MATRIXg.sender_user_id_)) == tonumber(0) then
send(MATRIXg.chat_id_,MATRIXg.id_,' 👻 ليس لديك نقاط في الالعاب\n 👻 اذا كنت تريد ربح نقاط \n 👻 ارسل الالعاب وابدأ اللعب ! ') 
else
local NUM_GAMES = database:get(bot_id..'NUM:GAMES'..MATRIXg.chat_id_..MATRIXg.sender_user_id_)
if tonumber(NUMPY) > tonumber(NUM_GAMES) then
send(MATRIXg.chat_id_,MATRIXg.id_,'\n 👻 ليس لديك نقاط في هذه لعبه \n 👻 لزيادة نقاطك في اللعبه \n 👻 ارسل الالعاب وابدأ اللعب !') 
return false 
end
local NUMNKO = (NUMPY * 50)
database:decrby(bot_id..'NUM:GAMES'..MATRIXg.chat_id_..MATRIXg.sender_user_id_,NUMPY)  
database:incrby(bot_id..'MATRIXg_User'..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_,NUMNKO)  
send(MATRIXg.chat_id_,MATRIXg.id_,' 👻 تم خصم * ⇇{ '..NUMPY..' }* من نقاطك \n 👻 وتم اضافة*  ⇇{ '..(NUMPY * 50)..' } رساله الى رسالك *')
end 
return false 
end
if text == 'فحص البوتت' and Manager(MATRIXg) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. MATRIXg.chat_id_ ..'&user_id='.. bot_id..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = '✔️' else info = '✖' end
if Json_Info.result.can_delete_messages == true then
delete = '✔️' else delete = '✖' end
if Json_Info.result.can_invite_users == true then
invite = '✔️' else invite = '✖' end
if Json_Info.result.can_pin_messages == true then
pin = '✔️' else pin = '✖' end
if Json_Info.result.can_restrict_members == true then
restrict = '✔️' else restrict = '✖' end
if Json_Info.result.can_promote_members == true then
promote = '✔️' else promote = '✖' end 
send(MATRIXg.chat_id_,MATRIXg.id_,'\n 👻 اهلا عزيزي البوت هنا ادمن'..'\n 👻 وصلاحياته هي 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍 \n━━━━━━━━━━'..'\n 👻 تغير معلومات الجروب ↞ ❴ '..info..' ❵'..'\n 👻 مسح الرسائل ↞ ❴ '..delete..' ❵'..'\n 👻 حظر المستخدمين ↞ ❴ '..restrict..' ❵'..'\n 👻 دعوة مستخدمين ↞ ❴ '..invite..' ❵'..'\n 👻 تثبيت الرسائل ↞ ❴ '..pin..' ❵'..'\n 👻 اضافة مشرفين جدد ↞ ❴ '..promote..' ❵')   
end
end
end


if text and text:match("^تغير رد المطور (.*)$") and Manager(MATRIXg) then
local Teext = text:match("^تغير رد المطور (.*)$") 
database:set(bot_id.."Sudo:Rd"..MATRIXg.chat_id_,Teext)
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم تغير رد المطور الى  ⇇"..Teext)
end
if text and text:match("^تغير رد المالك (.*)$") and Manager(MATRIXg) then
local Teext = text:match("^تغير رد المالك (.*)$") 
database:set(bot_id.."CoSu:Rd"..MATRIXg.chat_id_,Teext)
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم تغير رد المالك الى  ⇇"..Teext)
end
if text and text:match("^تغير رد منشئ الاساسي (.*)$") and Manager(MATRIXg) then
local Teext = text:match("^تغير رد منشئ الاساسي (.*)$") 
database:set(bot_id.."BasicConstructor:Rd"..MATRIXg.chat_id_,Teext)
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم تغير رد المنشئ الاساسي الى  ⇇"..Teext)
end
if text and text:match("^تغير رد المنشئ (.*)$") and Manager(MATRIXg) then
local Teext = text:match("^تغير رد المنشئ (.*)$") 
database:set(bot_id.."Constructor:Rd"..MATRIXg.chat_id_,Teext)
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم تغير رد المنشئ الى  ⇇"..Teext)
end
if text and text:match("^تغير رد المدير (.*)$") and Manager(MATRIXg) then
local Teext = text:match("^تغير رد المدير (.*)$") 
database:set(bot_id.."Manager:Rd"..MATRIXg.chat_id_,Teext) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم تغير رد المدير الى  ⇇"..Teext)
end
if text and text:match("^تغير رد الادمن (.*)$") and Manager(MATRIXg) then
local Teext = text:match("^تغير رد الادمن (.*)$") 
database:set(bot_id.."Mod:Rd"..MATRIXg.chat_id_,Teext)
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم تغير رد الادمن الى  ⇇"..Teext)
end
if text and text:match("^تغير رد المميز (.*)$") and Manager(MATRIXg) then
local Teext = text:match("^تغير رد المميز (.*)$") 
database:set(bot_id.."Special:Rd"..MATRIXg.chat_id_,Teext)
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم تغير رد المميز الى  ⇇"..Teext)
end
if text and text:match("^تغير رد الـعـضو  (.*)$") and Manager(MATRIXg) then
local Teext = text:match("^تغير رد الـعـضو  (.*)$") 
database:set(bot_id.."Memp:Rd"..MATRIXg.chat_id_,Teext)
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تم تغير رد الـعـضو  الى  ⇇"..Teext)
end

if text and text:match("^(.*)$") then
if database:get(bot_id..'help'..MATRIXg.sender_user_id_) == 'true' then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم حفظ الكليشه')
database:del(bot_id..'help'..MATRIXg.sender_user_id_)
database:set(bot_id..'help_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'help1'..MATRIXg.sender_user_id_) == 'true' then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم حفظ الكليشه')
database:del(bot_id..'help1'..MATRIXg.sender_user_id_)
database:set(bot_id..'help1_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'help2'..MATRIXg.sender_user_id_) == 'true' then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم حفظ الكليشه')
database:del(bot_id..'help2'..MATRIXg.sender_user_id_)
database:set(bot_id..'help2_text',text)
return false
end
end

if text and text:match("^(.*)$") then
if database:get(bot_id..'help3'..MATRIXg.sender_user_id_) == 'true' then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم حفظ الكليشه')
database:del(bot_id..'help3'..MATRIXg.sender_user_id_)
database:set(bot_id..'help3_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'help4'..MATRIXg.sender_user_id_) == 'true' then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم حفظ الكليشه')
database:del(bot_id..'help4'..MATRIXg.sender_user_id_)
database:set(bot_id..'help4_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'help5'..MATRIXg.sender_user_id_) == 'true' then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم حفظ الكليشه')
database:del(bot_id..'help5'..MATRIXg.sender_user_id_)
database:set(bot_id..'help5_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'help6'..MATRIXg.sender_user_id_) == 'true' then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم حفظ الكليشه')
database:del(bot_id..'help6'..MATRIXg.sender_user_id_)
database:set(bot_id..'help6_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'help7'..MATRIXg.sender_user_id_) == 'true' then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم حفظ الكليشه')
database:del(bot_id..'help7'..MATRIXg.sender_user_id_)
database:set(bot_id..'help7_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'help8'..MATRIXg.sender_user_id_) == 'true' then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم حفظ الكليشه')
database:del(bot_id..'help8'..MATRIXg.sender_user_id_)
database:set(bot_id..'help8_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'help9'..MATRIXg.sender_user_id_) == 'true' then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم حفظ الكليشه')
database:del(bot_id..'help9'..MATRIXg.sender_user_id_)
database:set(bot_id..'help9_text',text)
return false
end
end
if text and text:match("^(.*)$") then
if database:get(bot_id..'help10'..MATRIXg.sender_user_id_) == 'true' then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم حفظ الكليشه')
database:del(bot_id..'help10'..MATRIXg.sender_user_id_)
database:set(bot_id..'help10_text',text)
return false
end
end

if text == 'استعاده الاوامر' and DevSoFi(MATRIXg) then
database:del(bot_id..'help_text')
database:del(bot_id..'help1_text')
database:del(bot_id..'help2_text')
database:del(bot_id..'help3_text')
database:del(bot_id..'help4_text')
database:del(bot_id..'help5_text')
database:del(bot_id..'help6_text')
database:del(bot_id..'help7_text')
database:del(bot_id..'help8_text')
database:del(bot_id..'help9_text')
database:del(bot_id..'help10_text')
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم استعادة الاوامر القديمه')
end
if text == 'تغير امر الاوامر' and DevSoFi(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 الان يمكنك ارسال الكليشه الاوامر')
database:set(bot_id..'help'..MATRIXg.sender_user_id_,'true')
return false 
end
if text == 'تغير امر ⓵' and DevSoFi(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 الان يمكنك ارسال الكليشه ⓵')
database:set(bot_id..'help1'..MATRIXg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر⓶' and DevSoFi(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 الان يمكنك ارسال الكليشه⓶')
database:set(bot_id..'help2'..MATRIXg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر ⓷' and DevSoFi(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 الان يمكنك ارسال الكليشه ⓷')
database:set(bot_id..'help3'..MATRIXg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر⓸' and DevSoFi(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 الان يمكنك ارسال الكليشه⓸')
database:set(bot_id..'help4'..MATRIXg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر ⓹' and DevSoFi(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 الان يمكنك ارسال الكليشه ⓹')
database:set(bot_id..'help5'..MATRIXg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر ⓺' and DevSoFi(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 الان يمكنك ارسال الكليشه ⓺')
database:set(bot_id..'help6'..MATRIXg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر اوامر التسليه' and DevSoFi(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 الان يمكنك ارسال الكليشه اوامر التسليه')
database:set(bot_id..'help7'..MATRIXg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر اوامر مطور البوت' and DevSoFi(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻  الان يمكنك ارسال الكليشه اوامر مطور البوت')
database:set(bot_id..'help8'..MATRIXg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر اوامر مطور الاساسي' and DevSoFi(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 الان يمكنك ارسال الكليشه اوامر مطور الاساسي')
database:set(bot_id..'help9'..MATRIXg.sender_user_id_,'true')
return false 
end

if text == 'تغير امر اوامر الاعضاء' and DevSoFi(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 الان يمكنك ارسال الكليشه اوامر الاعضاء')
database:set(bot_id..'help10'..MATRIXg.sender_user_id_,'true')
return false 
end
---------------------- الاوامر الجديدة
if text == 'الاوامر' then
if not Mod(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 هذا الامر خاص بي\n الادمن ، المطور الاساسي ، المدير ، المطور الثانوي\n ، المطور ، المدير عام ، الادمن العام ، المنشئ\n ارسل ❲اوامر الاعضاء❳لعرض اوامر الاعضاء')
return false
end
if AddChannel(MATRIXg.sender_user_id_) == false then
local textchuser = database:get(bot_id..'text:ch:user')
if textchuser then
send(MATRIXg.chat_id_, MATRIXg.id_,'['..textchuser..']')
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻لا تستطيع استخدام البوت \n 👻يرجى الاشتراك بالقناه اولا \n 👻اشترك هنا ['..database:get(bot_id..'add:ch:username')..']')
end
return false
end
local Text =[[
🚨 اهلا بك في قسم الاوامر ..↑𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 اختر الامر الذي تريدها .↑𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
ده من الازرار بلاسفل . 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳ 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اوامر الحمايه ⇊', callback_data="/help1"},{text = 'ااوامر التسليه ⇊', callback_data="/help7"},
},
{
{text = 'اوامر الاعضاء ⇊', callback_data="/help6"},{text = 'اوامر المطورين ⇊', callback_data="/help5"},
},
{
{text = 'ااوامر اصحاب الرتب ⇊', callback_data="/help2"},
},
{
{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"},
},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. MATRIXg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
----------------------------------------------------------------------------
if text == 'الالعاب' then
local Text = [[
🎮 اهلا بك في قسم الالعاب ..↑𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 اختر العبه الذي تريدها .↑𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
ده من الازرار بلاسفل . 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 ❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳ 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'العاب السورس💌', callback_data="/mute-name"},{text = 'مميزات🎪', callback_data="/change-photo"},
},
{
{text = 'العاب متطوره🎮', callback_data="/sofi"},
},
{
{text = 'الاوامر🎡', callback_data="/help90"},
},
{
{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"},
},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. MATRIXg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'امر الـعـضو ' or text == 'اوامر الأعضاء' or text == 'اوامر الاعضاء' then
local Text = [[
 اتبع الاوامر الاعضاء
 تحت لي في الزر الأسفل𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 
 ..
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اوامر الاعضاء', callback_data="/change-names"},
},
{
{text = '˹《𝐒》MATRIX🌺˼', url="t.me/UU_matrixx"},
},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. MATRIXg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
----------------------------------------------------------------- انتهئ الاوامر الجديدة
if text == "تعطيل الابراج" and Manager(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تعطيل الابراج')
database:set(bot_id.." sofi:brj_Bots"..MATRIXg.chat_id_,"close")
end
if text == "تفعيل الابراج" and Manager(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تفعيل الابراج')
database:set(bot_id.." sofi:brj_Bots"..MATRIXg.chat_id_,"open")
end
if text and text:match("^برج (.*)$") and database:get(bot_id.." sofi:brj_Bots"..MATRIXg.chat_id_) == "open" then
local Textbrj = text:match("^برج (.*)$")
gk = https.request('https://rudi-dev.tk/Amir2/Boyka.php?br='..URL.escape(Textbrj)..'')
br = JSON.decode(gk)
i = 0
for k,v in pairs(br.ok) do
i = i + 1
t = v.."\n"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
if text == "تعطيل حساب العمر" and Manager(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تعطيل حساب العمر')
database:set(bot_id.." sofi:age_Bots"..MATRIXg.chat_id_,"close")
end
if text == "تعطيل حساب العمر" and Manager(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تعطيل حساب العمر')
database:set(bot_id.." sofi:age_Bots"..MATRIXg.chat_id_,"close")
end
if text == "تفعيل حساب العمر" and Manager(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تفعيل حساب العمر')
database:set(bot_id.." sofi:age_Bots"..MATRIXg.chat_id_,"open")
end
if text and text:match("^احسب (.*)$") and database:get(bot_id.." sofi:age_Bots"..MATRIXg.chat_id_) == "open" then
local Textage = text:match("^احسب (.*)$")
ge = https.request('https://rudi-dev.tk/Amir3/Boyka.php?age='..URL.escape(Textage)..'')
ag = JSON.decode(ge)
i = 0
for k,v in pairs(ag.ok) do
i = i + 1
t = v.."\n"
end
send(MATRIXg.chat_id_, MATRIXg.id_, t)
end
if text == "تعطيل الافلام" and Mod(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تعطيل الافلام')
database:set(bot_id.."SOFI:movie_bot"..MATRIXg.chat_id_,"close")
end
if text == "تفعيل الافلام" and Mod(MATRIXg) then
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم تفعيل الافلام')
database:set(bot_id.."SOFI:movie_bot"..MATRIXg.chat_id_,"open")
end
if text and text:match("^فلم (.*)$") and database:get(bot_id.."SOFI:movie_bot"..MATRIXg.chat_id_) == "open" then
local Textm = text:match("^فلم (.*)$")
data,res = https.request('https://forhassan.ml/Black/movie.php?serch='..URL.escape(Textm)..'')
if res == 200 then
getmo = json:decode(data)
if getmo.Info == true then
local Text ='قصه الفلم'..getmo.info
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'مشاهده الفلم بجوده 240',url=getmo.sd}},
{{text = 'مشاهده الفلم بجوده 480', url=getmo.Web},{text = 'مشاهده الفلم بجوده 1080', url=getmo.hd}},
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendMessage?chat_id=' .. MATRIXg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
if text == "رد عليه يابوت" or text == "رد عليه" or text == "در انت يابوت" then
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"ولد ولا بنت 🤓"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "عقاب" or text == "قول عقاب" or text == "العقاب" then
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"قل لواحد ماتعرفه عطني كف 🧸","🧸سو مشهد تمثيلي عن مصرية بتولد","🧸صور اي شيء يطلبه منك الاعبين","🧸البس طرحه امك او اختك ","🧸لا خلاص معتش في سمحتك"," 🧸اتصل لاخوك و قول له انك سويت حادث و الخ....","🧸تكلم باللغة الانجليزية الين يجي دورك مرة ثانية لازم تتكلم اذا ما تكلمت تنفذ عقاب ثاني","🧸تروح عند شخص تقول له ","🧸 اتصل على ابوك و قول له انك رحت مع بنت و احين هي حامل....","🧸اتصل على امك و قول لها انك ","🧸اذا انت ولد اكسر اغلى او احسن عطور عندك اذا انتي بنت اكسري الروج حقك او الميك اب حقك"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "تفعيل مريم"  then
if Constructor(MATRIXg) then  
database:set(bot_id.."my_maryam:status"..MATRIXg.chat_id_,true) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻تـم تـفعـيل مريم") 
return false  
end
end

if text == "تعطيل مريم"  then
if Constructor(MATRIXg) then  
database:del(bot_id.."my_maryam:status"..MATRIXg.chat_id_) 
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 تـم تـعـطـيل مريم") 
return false end
end
if text == "مريم" then
local my_ph = database:get(bot_id.."my_maryam:status"..MATRIXg.chat_id_)
if not my_ph then
send(MATRIXg.chat_id_, MATRIXg.id_," 👻مريم  معطله") 
return false  
end
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"هل انت جاهز ؟🧟‍♀🧟‍♂ ❲لو هتكمل ارسل يلا❳"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "يلا" or text == "هيا بنا"  then
local my_ph = database:get(bot_id.."my_maryam:status"..MATRIXg.chat_id_)
if not my_ph then
return false  
end
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {" ؟لا تصدر اي صوت ! 🧟‍♀🧟‍♂ ❲لو هتكمل ارسال حاضر ❳"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "ماشي" or text == "حاضر"  then
local my_ph = database:get(bot_id.."my_maryam:status"..MATRIXg.chat_id_)
if not my_ph then
return false  
end
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {" لقد وصلنا الى المنزل شكراَ جزيلَ انتطرني ثواني وسوف اعود! 🧟‍♀🧟‍♂ ❲لو هتكمل ارسال مستني ❳"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "مستني" or text == "منتظر"  then
local my_ph = database:get(bot_id.."my_maryam:status"..MATRIXg.chat_id_)
if not my_ph then
return false  
end
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {" لقد عودت إليك ظهر شيئ 🧟‍♂🧟‍♀ ❲لو هتكمل إرسال احد ما خرج من المنزل! 🧟‍♀🧟‍♂❳"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "احد ما خرج من المنزل! 🧟‍♀🧟‍♂" or text == "احد ما خرج من المنزل"  then
local my_ph = database:get(bot_id.."my_maryam:status"..MATRIXg.chat_id_)
if not my_ph then
return false  
end
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"هيا نذهب داخل المنزل🧟‍♀🧟‍♂ ❲لو هتكمل ارسال هيا❳"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "هيا"  then
local my_ph = database:get(bot_id.."my_maryam:status"..MATRIXg.chat_id_)
if not my_ph then
return false  
end
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {" نحنو نتوه في هذه المكان🧟‍♀🧟‍♂❲لو هتكمل ارسال تعالي نذهب الي الضوء❳"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "تعالي نذهب الي الضوء"  then
local my_ph = database:get(bot_id.."my_maryam:status"..MATRIXg.chat_id_)
if not my_ph then
return false  
end
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"❲لو هتكمل ارسل ياالهي كان هناك❳ 🧟‍♀🧟‍♂لايوجد ضوء هناك انظر"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "ياالهي كان هناك" then
local my_ph = database:get(bot_id.."my_maryam:status"..MATRIXg.chat_id_)
if not my_ph then
return false  
end
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"تع نذهب الي الباب الرئيسي🧟‍♀🧟‍♂ ❲لو هتكمل ارسل انهو مغلق❳"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "انهو مغلق" then
local my_ph = database:get(bot_id.."my_maryam:status"..MATRIXg.chat_id_)
if not my_ph then
return false  
end
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"انها النهايه  ❲هتكمل ولا لا❳"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "هكمل" then
local my_ph = database:get(bot_id.."my_maryam:status"..MATRIXg.chat_id_)
if not my_ph then
return false  
end
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"سارسل اليك اختيارت لو حليت صح ستنجو من العقاب لو خطأ سيقوم عليك العقاب🧟‍♀🧟‍♂❲عدد يقبل القسمة على 2,3,4,5,6 وعند القسمة في كل مرة يتبقى واحد، ما هو العدد؟❳❲61،44,00,121,90،99,70❳"}

send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "لا" then
local my_ph = database:get(bot_id.."my_maryam:status"..MATRIXg.chat_id_)
if not my_ph then
return false  
end
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"هي انت ستندم سأقتلك🧟‍♀🧟‍♂"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "61" then
local my_ph = database:get(bot_id.."my_maryam:status"..MATRIXg.chat_id_)
if not my_ph then
return false  
end
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"لقد فازت ونجوت من العقاب 👻🌟"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "99" or text == "70" or text == "44" or text == "00" or text == "121" or text == "90" then
local my_ph = database:get(bot_id.."my_maryam:status"..MATRIXg.chat_id_)
if not my_ph then
return false  
end
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"قل لواحد ماتعرفه عطني كف خطأ العقاب هوا ؟؟","خطأ العقاب هوا ؟؟سو مشهد تمثيلي عن مصرية بتولد","خطأ العقاب هوا ؟؟صور اي شيء يطلبه منك الاعبين","خطأ العقاب هوا ؟؟البس طرحه امك او اختك ","خطأ العقاب هوا ؟؟لا خلاص معتش في سمحتك"," خطأ العقاب هوا ؟؟اتصل لاخوك و قول له انك سويت حادث و الخ....","خطأ العقاب هوا ؟؟تكلم باللغة الانجليزية الين يجي دورك مرة ثانية لازم تتكلم اذا ما تكلمت تنفذ عقاب ثاني","خطأ العقاب هوا ؟؟تروح عند شخص تقول له ","خطأ العقاب هوا ؟؟ اتصل على ابوك و قول له انك رحت مع بنت و احين هي حامل....","خطأ العقاب هوا ؟؟اتصل على امك و قول لها انك ","خطأ العقاب هوا ؟؟اذا انت ولد اكسر اغلى او احسن عطور عندك اذا انتي بنت اكسري الروج حقك او الميك اب حقك"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "بنت" then
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"اي ي جامده تعي بف هاتي رقمك وهكلمك بليل ي وتكه انتي هاتي بوسه💋😉","اي ي جامده متجبي بوسه ولا اقولك هاتي رقمك اكلمك واتس واخلي بابا يتجوزك??💋🤸‍♂","ي بت كلمي بابا عايزك بف وابعتي رقمك ها بابا بيحبك 💋❤️🤍🤸‍♂🤸‍♂😉","يعم دي اقل من اني اديها رقمي 😎😜"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "ولد" then
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"دا عيل بيضااان","ولا بطيقه اصلا","اقل من اني افكر فيه","كسمو مش حوار"," ظريط سيببك منو"," يعم دا حكاك هتعمل عقلك بي","يابا دا اقل من انك ترد عليه","فكك منه م يستاهلش","احظره واريخ دماغي؟!!"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "بتحبو" or text == "بتحب دا" then
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"طبعا دا قلبي ♥🙄"," هحب فيه اي دا😹🙂","تؤ محصلش😹"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "بتكره دا" then
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"دا عيل بيضااان","ولا بطيقه اصلا","اقل من اني افكر فيه"}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "هينه" or text == "رزله" or text == "هيني" or text == "رزلي" then
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"يابا دا اقل من انك ترد عليه","فكك منه م يستاهلش","احظره واريخ دماغي؟!! "}
send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "مصه" or text == "بوسه" or text == "بوسي" or text == "مصي" then
if not database:get(bot_id..'lock:add'..MATRIXg.chat_id_) then
local texting = {"مووووووووواححح💋","الوجه ميساعد😒","تؤ مش ادام الناس😉","لا عيب","يوهه بتكثف🙄","مش بايس حد انا"}send(MATRIXg.chat_id_, MATRIXg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == 'تفعيل الردود' and Manager(MATRIXg) then   
database:del(bot_id..'lock:reply'..MATRIXg.chat_id_)  
Text = ' 👻 تم تفعيل الردود'
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'تعطيل الردود' and Manager(MATRIXg) then  
database:set(bot_id..'lock:reply'..MATRIXg.chat_id_,true)  
Text = '\n 👻 تم تعطيل الردود'
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
if text == 'روابط الحذف' or text == 'رابط  حذف' or text == 'رابط الحذف' then
local Text = [[
مواقع  مسح حسابات،🍂
فكر قبل لا تتسرع وتروح
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'Telegram',url="https://my.telegram.org/auth?to=delete"}},
{{text = 'instagram', url="https://www.instagram.com/accounts/login/?next=/accounts/remove/request/permanent/"}}, 
{{text = 'Facebook', url="https://www.facebook.com/help/deleteaccount"}}, 
{{text = 'Snspchat', url="https://accounts.snapchat.com/accounts/login?continue=https%3A%2F%2Faccounts.snapchat.com%2Faccounts%2Fdeleteaccount"}}, 
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=https://t.me/yhu79/8&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'بوت الحذف' or text == 'بوت حذف' or text == 'بوت حذف حسابات' then
local Text = [[
بوت  مسح حسابات،🍂
فكر قبل لا تتسرع وتروح
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'BOT Telegram', url="t.me/LC6BOT"}}, 
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=https://t.me/yhu79/7&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'twasol' or text == 'تواصل' or text == 'بوت التواصل' then
local Text = [[
[تواصل سورس MATRIX،🍂❤️](t.me/UU_matrixx)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'تواصل MATRIX',url="t.me/UU_metoren"}},
{{text = 'بوت التواصل', url="t.me/uu_mido123BOT"}}, 
{{text = 'قناه السورس', url="t.me/UU_matrixx"}}, 
}
local MATRIXg_id = MATRIXg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..token..'/sendPhoto?chat_id=' .. MATRIXg.chat_id_ .. '&photo=t.me/UU_matrixx/99&caption=' .. URL.escape(Text).."&reply_to_message_id="..MATRIXg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "صلاحياته" and tonumber(MATRIXg.reply_to_message_id_) > 0 then    
if tonumber(MATRIXg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
Get_Info(MATRIXg,MATRIXg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=MATRIXg.chat_id_,message_id_=tonumber(MATRIXg.reply_to_message_id_)},prom_reply, nil)
end
end
------------------------------------------------------------------------
if text == "صلاحياتي" then 
if tonumber(MATRIXg.reply_to_message_id_) == 0 then 
Get_Info(MATRIXg,MATRIXg.chat_id_,MATRIXg.sender_user_id_)
end  
------------------------------------------------------------------------
if text and text:match('^صلاحياته @(.*)') then   
local username = text:match('صلاحياته @(.*)')   
if tonumber(MATRIXg.reply_to_message_id_) == 0 then 
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
SendText(MATRIXg.chat_id_,MATRIXg.id_,"- المعرف غير صحيح \n*")   
return false  end   

Get_Info(MATRIXg,MATRIXg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end -- Chat_Type = 'GroupBot' 
end -- end MATRIXg 
--------------------------------------------------------------------------------------------------------------
function tdcli_update_callback(data)  -- clback
if data.ID == "UpdateChannel" then 
if data.channel_.status_.ID == "ChatMemberStatusKicked" then 
database:srem(bot_id..'Chek:Groups','-100'..data.channel_.id_)  
end
end
if data.ID == "UpdateNewCallbackQuery" then
local Chat_id = data.chat_id_
local MATRIXg_id = data.message_id_
local MATRIXg_idd = MATRIXg_id/2097152/0.5
local Text = data.payload_.data_
if Text == '/help1' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
اوامر حماية المجموعه ⇊
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
قفل  ⌁  فتح + الامر 
قفل  ⌁  فتح ❲ الكـــل ❳
❲ بالتقيد ، بالطرد ، بالكتم ❳
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻الروابط
 👻المعرف
 👻التاك
 👻الشارحه
 👻التعديل
 👻التثبيت
 👻المتحركه
 👻الملفات
 👻الصور
 👻التفليش
 👻الماركداون
 👻البوتات
 👻الاباحي
 👻 الازعاج
 👻 السب
 👻التكرار
 👻الكلايش
 👻السيلفي
 👻الملصقات
 👻الفيديو
 👻الانلاين
 👻الدردشه
 👻التوجيه
 👻الاغاني
 👻الصوت
 👻الجهات
 👻الاشعارات
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳ 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الرجوع الاوامر 🃏', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help2' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
 👻  اوامر اصحاب الرتب ⇊
 👻الادمن ⌁ المنشئ ⌁ المالك
 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻❲ المميز❳ ⇊
 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻 كشف
 👻 المحظورين
 👻 المكتومين
 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻❲ الادمن❳ ⇊
 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻 رفع مميز ⌁ تنزيل مميز
 👻 الترحيب
 👻 اضف مغادره ⌁ مسح المغادره
 👻 رساله المغادره
 👻 كشف البوتات
 👻 المميزين ⌁  مسح المميزين
 👻 حظر ⌁ الغاء حظر
 👻 كتم ⌁ الغاء كتم
 👻 حظر لمده + المده
 👻 كتم لمده + المده
 👻 طرد ⌁ تطهير 
 👻 تثبيت ⌁ تثبيت بدون اشعار
 👻 الغاء تثبيت الكل
 👻  ❲ + ❳ جميع ماسبق
 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━??
 👻 ❲ المنشئ❳ ⇊
 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻  رفع ⌁ تنزيل ادمن
 👻 اضف ⌁  مسح  ❲ رد ❳
 👻 الردود ⌁  مسح الردود
 👻 ايقاف المنشن
 👻 تعيين ⌁ مسح  ❲ الايدي ❳
 👻 الادمنيه ⌁  مسح الادمنيه
 👻 اضف ترحيب
 👻  مسح المحظورين ⌁ المكتومين
 👻 منع + الكلمه
 👻 الغاء منع + الكلمه
 👻  مسح الكلمات الممنوعه
 👻 المميزين عام
 👻  ❲ + ❳ جميع ماسبق
 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻 ❲ المالك❳ ⇊
 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻 اضف صوره ⌁ وصف (للجروب)
 👻 رفع منشئ ⌁ تنزيل منشئ
 👻 تاج للاعضاء ⌁ للكل
 👻 اضف رابط ⌁ مسح الرابط
 👻 اضف ⌁  مسح  ❲ امر ❳
 👻 الاوامر المضافه
 👻  مسح الاوامر المضافه
 👻 ضع اسم+الاسم ⌁ تحديث
 👻 المنشئين ⌁  مسح المنشئين
 👻  ❲ + ❳ جميع ماسبق
 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳ 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الرجوع الاوامر 🃏', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help3' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
 👻مرحب بيك في اوامر الوضع واضف 👻
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍 
 👻اوامر الوضع - اضف
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻اضف / مسح ← رد
 👻اضف / مسح ← صلاحيه
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻ضع + امر …
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻اسم
 👻رابط
 👻ترحيب
 👻قوانين
 👻رد متعدد 
 👻صوره
 👻وصف
 👻تكرار + عدد
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻اوامر مسح / المسح ← امر
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻مسح + امر 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻الايدي 
 👻المميزين
 👻الادمنيه
 👻المدراء
 👻المنشئين
 👻الاساسين
 👻الاسماء المكتومه
 👻الردود الجروب
 👻البوتات
 👻امسح
 👻صلاحيه
 👻قائمه منع المتحركات
 👻قائمه منع الصور
 👻قائمه منع الملصقات
 👻مسح قائمه المنع
 👻المحذوفين
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻مسح  امر + الامر القديم  
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻الاوامر المضافه ( لعرض الاوامر المضافه ) 
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳ 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اوامر التنزيل والرفع', callback_data="/help4"},
},
{
{text = '◗القائمه الرائسيه◖', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help4' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
 👻مرحب بيك في اوامر تنزيل ورفع 👻
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍 
 👻اوامر تنزيل ورفع
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍 
 👻مميز
 ??ادمن
 👻مدير
 👻منشئ
 👻منشئ اساسي
 👻مالك
 👻الادمنيه
 👻ادمن بالجروب
 👻مشرف كامل
 👻القيود 
 👻تنزيل جميع الرتب
 👻تنزيل الكل 
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻اوامر التغير …
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻تغير رد المطور + اسم
 👻تغير رد المالك + اسم
 👻تغير رد منشئ الاساسي + اسم
 👻تغير رد المنشئ + اسم
 👻تغير رد المدير + اسم
 👻تغير رد الادمن + اسم
 👻تغير رد المميز + اسم
 👻تغير رد الـعـضو  + اسم
 👻تغير امر الاوامر
 👻تغير امر م1 ~ الئ م10
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍 
 👻اوامر المجموعه 📢 .
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻استعاده الاوامر 
 👻تحويل كالاتي⇜ بالرد على صوره او ملصق او صوت او بصمه بالامر ← تحويل 
 👻صيح ~ تاك ~ المميزين : الادمنيه : المدراء : المنشئين : المنشئين الاساسين
 👻كشف القيود
 👻تعين الايدي
 👻تغير الايدي
 👻الحساب + ايدي الحساب
 👻مسح + العدد
 👻تنزيل الكل
 👻تنزيل جميع الرتب
 👻منع + برد
┇~ الصور + متحركه + ملصق ~
 👻حظر ~ كتم ~ تقيد ~ طرد
 👻المحظورين ~ المكتومين ~ المقيدين
 👻الغاء كتم + حظر + تقيد ~ بالرد و معرف و ايدي
 👻تقيد ~ كتم + الرقم + ساعه
 👻تقيد ~ كتم + الرقم + يوم
 👻تقيد ~ كتم + الرقم + دقيقه
 👻تثبيت ~ الغاء تثبيت
 👻الترحيب
 👻الغاء تثبيت الكل
 👻كشف البوتات
 👻الصلاحيات
 👻كشف ~ برد ← بمعرف ← ايدي
 👻تاك للكل
 👻وضع لقب + لقب
 👻مسح لقب بالرد
 👻اعدادات المجموعه
 👻عدد الجروب
 👻الردود الجروب
 👻اسم بوت + الرتبه
 👻الاوامر المضافه
 👻وضع توحيد + توحيد
 👻تعين عدد الكتم + رقم
 👻كتم اسم + اسم
 👻التوحيد
 👻قائمه المنع
 👻نسبه الحب 
 👻نسبه رجوله
 👻نسبه الكره
 👻نسبه الانوثه
 👻الساعه
 👻التاريخ
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳ 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اوامر المطورين', callback_data="/help5"},
},
{
{text = 'الامر السابق', callback_data="/help3"},
},
{
{text = 'Back 👻', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help5' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
 👻مرحب بيك في اوامر للمطورين 👻
اوامر المطورين ⇊
❲المطرو❳  ⇊
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻تفعيل ← تعطيل 
 👻المجموعات ← المشتركين ← الاحصائيات
 👻رفع ← تنزيل منشئ اساسي
 👻مسح الاساسين ← المنشئين الاساسين
 👻مسح المنشئين ← المنشئين
 👻اسم ~ ايدي + بوت غادر 
 👻اذاعه 
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
❲المطور الاساسي+ المطور الثانوي❳
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻تفعيل
 👻تعطيل
 👻مسح الاساسين
 👻المنشئين الاساسين
 👻رفع/تنزيل منشئ اساسي
 👻رفع/تنزيل مطور اساسي 
 👻  رفع/تنزيل مدير عام
 👻  رفع /تنزيل ادمن عام
 👻مسح المطورين
 👻المطورين
 👻رفع | تنزيل مطور
 👻اسم البوت + غادر
 👻غادر
 👻اسم بوت + الرتبه
 👻تحديث السورس
 👻حضر عام
 👻كتم عام
 👻الغاء العام
 👻قائمه العام
 👻مسح قائمه العام
 👻جلب النسخه
 👻رفع النسخه
 👻 جلب المشتركين
 👻 رفع المشتركين
 👻اذاعه خاص
 👻اذاعه
 👻اذاعه بالتوجيه
 👻اذاعه بالتوجيه خاص
 👻اذاعه بالتثبيت
 👻جلب نسخه البوت
 👻رفع نسخه البوت
 👻ضع عدد الاعضاء + العدد
 👻ضع كليشه المطور
 👻تفعيل/تعطيل الاذاعه
 👻تفعيل/تعطيل البوت الخدمي
 👻تفعيل/تعطيل التواصل
 👻تغير اسم البوت
 👻اضف/مسح رد عام
 ??الردود العامه
 👻مسح الردود العامه
 👻الاشتراك الاجباري
 👻تعطيل الاشتراك الاجباري
 👻تفعيل الاشتراك الاجباري
 👻مسح رساله الاشتراك
 👻تغير رساله الاشتراك
 👻تغير الاشتراك
 👻الاحصائيات
 👻المشتركين
 👻المجموعات 
 👻تفعيل/تعطيل المغادره
 👻مسح الجروبات
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳ 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الرجوع الاوامر 🃏', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help6' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
    ❲اوامر الاعضاء ⇊❳     
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻   غنيلي ⌁ حساب العمر   
 👻   صورتي ⌁ نسبه جمالي
 👻   نقاطي
 👻    مسح ⌁ بيع ❲نقاطي ❳ 
 👻   رسائلي ⌁  مسح ❲رسائلي ❳ 
 👻   زخرفه ⌁ اغاني 
 👻   اسمي ⌁ الرتبه
 👻  جهاتي 
 👻  صلاحياتي
 👻  قول +الكلمه
 👻  تفعيل  تعطيل+ اطردني   
 👻   سورس ⌁ المطور
 👻   الرابط ⌁ ايدي
 👻   رتبتي ⌁ كشف
 👻   رد  انت يا بوت
 👻  ي رايك يابوت
 👻   هينو ⌁ هينها
 👻   بوسو ⌁ بوسها
 👻   بتحب دي ⌁ بتحب ده
 👻  بوت الحذف⌁رابط الحذف
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳ 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الرجوع الاوامر 🃏', callback_data="/help8"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help7' then
if not Mod(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
اوامر ❲التسليه❳  ⇊
رفع ⌁ تنزيل + الامر
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻رفع + تنزيل ← متوحد
 👻تاك للمتوحدين
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 👻رفع + تنزيل ← كلب
 👻تاك للكلاب
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 👻رفع + تنزيل ← قرد
 👻تاك للقرود
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 👻رفع + تنزيل ← زوجتي
 👻تاك للزوجات
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 👻رفع + تنزيل ← قلبي
 👻تاك لقلبي
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 👻رفع + تنزيل ← بقره
 👻تاك للبقرات
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 👻رفع + تنزيل ← ارمله
 👻تاك للارامل
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 👻رفع + تنزيل ← خول
 👻تاك للخولات
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 👻رفع + تنزيل ← حمار
 👻تاك للحمير
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 👻رفع + تنزيل ← مزه
 👻تاك للمزز
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 👻رفع + تنزيل ← وتكه
 👻تاك للوتكات
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 👻رفع + تنزيل ← كس
 👻تاك للاكساس
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 👻رفع + تنزيل ← ابني
 👻تاك لولادي 
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 👻رفع + تنزيل ← بنتي
 👻تاك لبناتي
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 👻رفع + تنزيل ← خاين
 👻تاك للخاينين
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 👻رفع  ← علي زبي
 👻تنزيل ←من زبي 
 👻تاك للمتناكين
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳ 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الرجوع الاوامر 🃏', callback_data="/help8"},
},
{
{text = 'مميزات التسليه 🧸', callback_data="/help10"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end

if Text == '/help8' then
if not Sudo(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
🚨 اهلا بك في قسم الاوامر ..↑𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 اختر الامر الذي تريدها .↑𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
ده من الازرار بلاسفل . 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳ 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اوامر الحمايه ⇊', callback_data="/help1"},{text = 'ااوامر التسليه ⇊', callback_data="/help7"},
},
{
{text = 'اوامر الاعضاء ⇊', callback_data="/help6"},{text = 'اوامر المطورين ⇊', callback_data="/help5"},
},
{
{text = 'ااوامر اصحاب الرتب ⇊', callback_data="/help2"},
},
{
{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help9' then
if not Sudo(data) then
local notText = '🚫 عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
🎖┇ 𝙱𝙰??𝙸𝙲 𝙳𝙴𝚅𝙴??𝙾𝙿𝙴𝚁 𝙲𝙾𝙼𝙼𝙰??𝙳𝚂 .
━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ ━ 
 👻 اهلا بك عزيزي 🔊
 👻 اوامر مطور الاساسي 👨🏼‍✈️
•┉ • ┉ • ┉ MATRIX🌺 ┉ • ┉ • ┉•
 👻 تفعيل
 👻 تعطيل
 👻 مسح الاساسين
 👻 المنشئين الاساسين
 👻 رفع/تنزيل منشئ اساسي
 👻 رفع/تنزيل مطور اساسي 
 👻 مسح المطورين
 👻 المطورين
 👻 رفع | تنزيل مطور
•┉ • ┉ • ┉ MATRIX🌺 ┉ • ┉ • ┉•
 👻 اسم البوت + غادر
 👻 غادر
 👻 اسم بوت + الرتبه
 👻 تحديث السورس
 👻 حضر عام
 👻 كتم عام
 👻 الغاء العام
 👻 قائمه العام
 ?? مسح قائمه العام
 👻 جلب النسخه
 👻 رفع النسخه
•┉ • ┉ • ┉ MATRIX🌺 ┉ • ┉ • ┉•
 👻 اذاعه خاص
 👻 اذاعه
 👻 اذاعه بالتوجيه
 👻 اذاعه بالتوجيه خاص
 👻 اذاعه بالتثبيت
•┉ • ┉ • ┉ MATRIX🌺 ┉ • ┉ • ┉•
 👻 جلب نسخه البوت
 👻 رفع نسخه البوت
 👻 ضع عدد الاعضاء + العدد
 👻 ضع كليشه المطور
 👻 تفعيل/تعطيل الاذاعه
 👻 تفعيل/تعطيل البوت الخدمي
 👻 تفعيل/تعطيل التواصل
 👻 تغير اسم البوت
 👻 اضف/مسح رد عام
 👻 الردود العامه
 👻 مسح الردود العامه
•┉ • ┉ • ┉ MATRIX🌺 ┉ • ┉ • ┉•
 👻 الاشتراك الاجباري
 👻 تعطيل الاشتراك الاجباري
 👻 تفعيل الاشتراك الاجباري
 👻 مسح رساله الاشتراك
 👻 تغير رساله الاشتراك
 👻 تغير الاشتراك
•┉ • ┉ • ┉ MATRIX🌺 ┉ • ┉ • ┉•
 👻 الاحصائيات
 👻 المشتركين
 👻 المجموعات 
 👻 تفعيل/تعطيل المغادره
 👻 مسح الجروبات
•┉ • ┉ • ┉ MATRIX🌺 ┉ • ┉ • ┉•
➫ .[🖨┇𝚂𝙾𝚄𝚁𝙲𝙴𝚂 𝙿𝙾𝚆𝙴𝚁.](t.me/sopowerb0t)➤
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '1️⃣', callback_data="/help1"},{text = '2️⃣', callback_data="/help2"},{text = '3️⃣', callback_data="/help3"},
},
{
{text = '4️⃣', callback_data="/help4"},{text = '5️⃣', callback_data="/help5"},
},
{
{text = '6️⃣', callback_data="/help6"},{text = '7️⃣', callback_data="/help7"},{text = '8️⃣', callback_data="/help8"},
},
{
{text = '9️⃣', callback_data="/help9"},{text = '🔟', callback_data="/help10"},
},
{
{text = '🔙 الاوامر الرئيسيه 🔙', callback_data="/help"},
},
{
{text = '𓆩𝑷𝑶𝑾𝑬𝑹𓆪', url="t.me/sopowerb0t"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end

if Text == '/help10' then
local help_text = database:get(bot_id..'help10_text')
local Teext =[[
 👻   بك في مميزات سورس MATRIX 👻  
 👻   مميزات الخاصه بسورس 👻 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'تويت', callback_data="/help12"},{text = 'تويت بالصور', callback_data="/help56"}},   
{{text = 'لو خيروك', callback_data="/help20"},{text = 'لو خيروك بالصور', callback_data="/help25"}}, 
{{text = 'انصحني', callback_data="/help13"},{text = 'كتبات', callback_data="/help19"}}, 
{{text = 'الصراحه', callback_data="/help14"},{text = 'حروف', callback_data="/help21"}}, 
{{text = 'رزله', callback_data="/help15"},{text = 'رد عليه يابوت', callback_data="/help22"}}, 
{{text = 'بتكره دا', callback_data="/help16"},{text = 'نكته', callback_data="/help23"}}, 
{{text = 'غنيلي', callback_data="/help17"}},
{{text = 'نسبه جمالي', callback_data="/help18"},{text = 'اليتيوب', callback_data="/help24"}},
{{text = '◗القائمه الرائسيه◖', callback_data="/help7"}},
{{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help90' then
if not Sudo(data) then
local notText = '✘ عذرا الاوامر هذه لا تخصك'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(notText).."&show_alert=true")
return false
end
local Teext =[[
🚨 اهلا بك في قسم الاوامر ..↑𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 اختر الامر الذي تريدها .↑𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
ده من الازرار بلاسفل . 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 ❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳ 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اوامر الحمايه ⇊', callback_data="/help1"},{text = 'ااوامر التسليه ⇊', callback_data="/help7"},
},
{
{text = 'اوامر الاعضاء ⇊', callback_data="/help6"},{text = 'اوامر المطورين ⇊', callback_data="/help5"},
},
{
{text = 'ااوامر اصحاب الرتب ⇊', callback_data="/help2"},
},
{
{text = '◗القائمه الرائسيه◖', callback_data="/add"},
},
{
{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
------------------------------ callback add dev mr sofi
if Text == '/mute-name' then
local Teext =[[
 👻أنت الآن في العاب السورس 👻
اتبع الازار الي في الاسفل⇣
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'لعبه البات', callback_data="/help30"},{text = 'لعبه الرياضيات', callback_data="/help37"}},   
{{text = 'لعبه المختلف', callback_data="/help31"},{text = 'لعبه السمايلات', callback_data="/help38"}}, 
{{text = 'لعبه التخمين', callback_data="/help32"},{text = 'لعبه العكس', callback_data="/help39"}}, 
{{text = 'لعبه الاسرع', callback_data="/help33"},{text = 'لعبه الانكليزي', callback_data="/help40"}}, 
{{text = 'لعبه حزوره', callback_data="/help34"},{text = 'لعبه المعاني', callback_data="/help41"}}, 
{{text = 'لعبه الامثله', callback_data="/help35"}},
{{text = 'لعبه كشف الكذب', callback_data="/help47"}},
{{text = 'مريم', callback_data="/help36"},{text = 'عقاب', callback_data="/help42"}},
{{text = '◗القائمه الرائسيه◖', callback_data="/add"}},
{{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end

if Text == '/help30' then
local Text = 'لتجربه العلبه عليك ان تكتب البات في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help31' then
local Text = 'لتجربه العلبه عليك ان تكتب المختلف في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help32' then
local Text = 'لتجربه العلبه عليك ان تكتب التخمين في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help33' then
local Text = 'لتجربه العلبه عليك ان تكتب الاسرع في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help34' then
local Text = 'لتجربه العلبه عليك ان تكتب الحزوه في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help35' then
local Text = 'لتجربه العلبه عليك ان تكتب امثله في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help36' then
local Text = 'لتجربه العلبه عليك ان تكتب مريم في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help37' then
local Text = 'لتجربه العلبه عليك ان تكتب الرياضيات في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help38' then
local Text = 'لتجربه العلبه عليك ان تكتب السمايلات في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help39' then
local Text = 'لتجربه العلبه عليك ان تكتب العكس في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help40' then
local Text = 'لتجربه العلبه عليك ان تكتب الانكليزي في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help41' then
local Text = 'لتجربه العلبه عليك ان تكتب المعاني في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help42' then
local Text = 'لتجربه العلبه عليك ان تكتب عقاب في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help47' then
local Text = 'لتجربه العلبه عليك ان تكتب كشف الكذب في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end

if Text == '/sofi' then
local Teext =[[
 👻 اهلا في قائمه الالعاب المتطوره سورس MATRIX 👻 
تفضل اختر لعبه من القائمه 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'فلابي بيرد', url="https://t.me/awesomebot?game=FlappyBird"},{text = 'تحداني فالرياضيات',url="https://t.me/gamebot?game=MathBattle"}},   
{{text = 'لعبه دراجات', url="https://t.me/gamee?game=MotoFX"},{text = 'سباق سيارات', url="https://t.me/gamee?game=F1Racer"}}, 
{{text = 'تشابه', url="https://t.me/gamee?game=DiamondRows"},{text = 'كره القدم', url="https://t.me/gamee?game=FootballStar"}}, 
{{text = 'ورق', url="https://t.me/gamee?game=Hexonix"},{text = 'لعبه 2048', url="https://t.me/awesomebot?game=g2048"}}, 
{{text = 'SQUARES', url="https://t.me/gamee?game=Squares"},{text = 'ATOMIC', url="https://t.me/gamee?game=AtomicDrop1"}}, 
{{text = 'CORSAIRS', url="https://t.me/gamebot?game=Corsairs"},{text = 'LumberJack', url="https://t.me/gamebot?game=LumberJack"}}, 
{{text = 'LittlePlane', url="https://t.me/gamee?game=LittlePlane"},{text = 'RollerDisco', url="https://t.me/gamee?game=RollerDisco"}},  
{{text = 'كره القدم 2', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'جمع المياه', url="https://t.me/gamee?game=BlockBuster"}},  
{{text = 'لا تجعلها تسقط', url="https://t.me/gamee?game=Touchdown"},{text = 'GravityNinja', url="https://t.me/gamee?game=GravityNinjaEmeraldCity"}},  
{{text = 'Astrocat', url="https://t.me/gamee?game=Astrocat"},{text = 'Skipper', url="https://t.me/gamee?game=Skipper"}},  
{{text = 'WorldCup', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'GeometryRun', url="https://t.me/gamee?game=GeometryRun"}},  
{{text = 'Ten2One', url="https://t.me/gamee?game=Ten2One"},{text = 'NeonBlast2', url="https://t.me/gamee?game=NeonBlast2"}},  
{{text = 'Paintio', url="https://t.me/gamee?game=Paintio"},{text = 'onetwothree', url="https://t.me/gamee?game=onetwothree"}},  
{{text = 'BrickStacker', url="https://t.me/gamee?game=BrickStacker"},{text = 'StairMaster3D', url="https://t.me/gamee?game=StairMaster3D"}},  
{{text = 'LoadTheVan', url="https://t.me/gamee?game=LoadTheVan"},{text = 'BasketBoyRush', url="https://t.me/gamee?game=BasketBoyRush"}},  
{{text = 'GravityNinja21', url="https://t.me/gamee?game=GravityNinja21"},{text = 'MarsRover', url="https://t.me/gamee?game=MarsRover"}},  
{{text = 'LoadTheVan', url="https://t.me/gamee?game=LoadTheVan"},{text = 'GroovySki', url="https://t.me/gamee?game=GroovySki"}},  
{{text = 'PaintioTeaMATRIX', url="https://t.me/gamee?game=PaintioTeaMATRIX"},{text = 'KeepItUp', url="https://t.me/gamee?game=KeepItUp"}},  
{{text = 'SunshineSolitaire', url="https://t.me/gamee?game=SunshineSolitaire"},{text = 'Qubo', url="https://t.me/gamee?game=Qubo"}},  
{{text = 'PenaltyShooter2', url="https://t.me/gamee?game=PenaltyShooter2"},{text = 'Getaway', url="https://t.me/gamee?game=Getaway"}},  
{{text = 'PaintioTeaMATRIX', url="https://t.me/gamee?game=PaintioTeaMATRIX"},{text = 'SpikyFish2', url="https://t.me/gamee?game=SpikyFish2"}},  
{{text = 'GroovySki', url="https://t.me/gamee?game=GroovySki"},{text = 'KungFuInc', url="https://t.me/gamee?game=KungFuInc"}},  
{{text = 'SpaceTraveler', url="https://t.me/gamee?game=SpaceTraveler"},{text = 'RedAndBlue', url="https://t.me/gamee?game=RedAndBlue"}},  
{{text = 'SkodaHockey1 ', url="https://t.me/gamee?game=SkodaHockey1"},{text = 'SummerLove', url="https://t.me/gamee?game=SummerLove"}},  
{{text = 'SmartUpShark', url="https://t.me/gamee?game=SmartUpShark"},{text = 'SpikyFish3', url="https://t.me/gamee?game=SpikyFish3"}},  
{{text = '◗القائمه الرائسيه◖', callback_data="/add"}},
{{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/change-names' then
local Teext =[[
    ❲اوامر الاعضاء ⇊❳  
 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 👻   غنيلي ⌁ حساب العمر   
 👻   صورتي ⌁ نسبه جمالي
 👻   نقاطي
 👻    مسح ⌁ بيع ❲نقاطي ❳ 
 👻   رسائلي ⌁  مسح ❲رسائلي ❳ 
 👻   زخرفه ⌁ اغاني 
 👻   اسمي ⌁ الرتبه
 👻  جهاتي 
 👻  صلاحياتي
 👻  قول +الكلمه
 👻  تفعيل  تعطيل+ اطردني   
 👻   سورس ⌁ المطور
 👻   الرابط ⌁ ايدي
 👻   رتبتي ⌁ كشف
 👻   رد  انت يا بوت
 👻  ي رايك يابوت
 👻   هينو ⌁ هينها
 👻   بوسو ⌁ بوسها
 👻   بتحب دي ⌁ بتحب ده
 👻  بوت الحذف⌁رابط الحذف
𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 ❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳ 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '◗القائمه الرائسيه◖', callback_data="/change-id"},
},
{
{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/change-id' then
local Teext =[[
 اتبع الاوامر الاعضاء
 تحت لي في الزر الأسفل𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 
 ..
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اوامر الاعضاء', callback_data="/change-names"},
},
{
{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/change-photo' then
local Teext =[[
 👻مرحب  بك في مميزات سورس MATRIX 👻
 👻 مميزات الخاصه بسورس 👻
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'تويت', callback_data="/help12"},{text = 'تويت بالصور', callback_data="/help56"}},   
{{text = 'لو خيروك', callback_data="/help20"},{text = 'لو خيروك بالصور', callback_data="/help25"}}, 
{{text = 'انصحني', callback_data="/help13"},{text = 'كتبات', callback_data="/help19"}}, 
{{text = 'الصراحه', callback_data="/help14"},{text = 'حروف', callback_data="/help21"}}, 
{{text = 'رزله', callback_data="/help15"},{text = 'رد عليه يابوت', callback_data="/help22"}}, 
{{text = 'بتكره دا', callback_data="/help16"},{text = 'نكته', callback_data="/help23"}}, 
{{text = 'غنيلي', callback_data="/help17"}},
{{text = 'نسبه جمالي', callback_data="/help18"},{text = 'اليتيوب', callback_data="/help24"}},
{{text = '◗القائمه الرائسيه◖', callback_data="/add"}},
{{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"}},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
if Text == '/help12' then
local Text = 'لتجربه العلبه عليك ان تكتب تويت في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help13' then
local Text = 'لتجربه العلبه عليك ان تكتب انصحني في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help14' then
local Text = 'لتجربه العلبه عليك ان تكتب الصراحه في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help15' then
local Text = 'لتجربه العلبه عليك ان تكتب رزله في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help16' then
local Text = 'لتجربه العلبه عليك ان تكتب بتكره دا في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help17' then
local Text = 'للاستماع للاغاني عليك ان تكتب غنيلي في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help18' then
local Text = 'لتجربه العلبه عليك ان تكتب نسبه جمالي في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help19' then
local Text = 'لتجربه العلبه عليك ان تكتب كتبات في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help20' then
local Text = 'لتجربه العلبه عليك ان تكتب لو خيروك في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help21' then
local Text = 'لتجربه العلبه عليك ان تكتب حروف في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help22' then
local Text = 'لتجربه العلبه عليك ان تكتب رد عليه يابوت في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help23' then
local Text = 'لتجربه العلبه عليك ان تكتب نكته في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help24' then
local Text = 'لتحميل من المواقع عليك ان تكتب اليتيوب في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help25' then
local Text = 'لتجربه العلبه عليك ان تكتب لو خيروك بالصور في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
if Text == '/help56' then
local Text = 'لتجربه العلبه عليك ان تكتب تويت بالصور في الشات☏↯'
https.request("https://api.telegram.org/bot"..token.."/answerCallbackQuery?callback_query_id="..data.id_.."&text="..URL.escape(Text).."&show_alert=true")
return false
end
--- callback added
if Text == '/add' then
local Teext =[[
🎮 اهلا بك في قسم الالعاب ..↑𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
 اختر العبه الذي تريدها .↑𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
ده من الازرار بلاسفل . 𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍
╾╾╾╾╾╾╾╾╾╾╾╾╾╾╾╸
 ❲[《𝐒》MATRIX🌺  ](t.me/UU_matrixx)❳ 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'العاب السورس💌', callback_data="/mute-name"},{text = 'مميزات🎪', callback_data="/change-photo"},
},
{
{text = 'العاب متطوره🎮', callback_data="/sofi"},
},
{
{text = 'الاوامر🎡', callback_data="/help12"},
},
{
{text = '《𝐒》MATRIX🌺 ', url="t.me/UU_matrixx"},
},
}
return https.request("https://api.telegram.org/bot"..token..'/editMessageText?chat_id='..Chat_id..'&text='..URL.escape(Teext)..'&message_id='..MATRIXg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
if data.ID == "UpdateNewMessage" then  -- new MATRIXg
MATRIXg = data.message_
text = MATRIXg.content_.text_
--------------------------------------------------------------------------------------------------------------
if text and not database:sismember(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_,text) then
database:del(bot_id..'Spam:Texting'..MATRIXg.sender_user_id_) 
end
--------------------------------------------------------------------------------------------------------------
if text and database:get(bot_id.."Del:Cmd:Group"..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_) == 'true' then
local NewCmmd = database:get(bot_id.."Set:Cmd:Group:New1"..MATRIXg.chat_id_..':'..text)
if NewCmmd then
database:del(bot_id.."Set:Cmd:Group:New1"..MATRIXg.chat_id_..':'..text)
database:del(bot_id.."Set:Cmd:Group:New"..MATRIXg.chat_id_)
database:srem(bot_id.."List:Cmd:Group:New"..MATRIXg.chat_id_,text)
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 تم مسح الامر')  
else
send(MATRIXg.chat_id_, MATRIXg.id_,' 👻 لا يوجد امر بهاذا الاسم')  
end
database:del(bot_id.."Del:Cmd:Group"..MATRIXg.chat_id_..':'..MATRIXg.sender_user_id_)
return false
end 
-------------------------------------------------------------------------------------------------------------- 
if data.message_.content_.text_ then
local NewCmmd = database:get(bot_id.."Set:Cmd:Group:New1"..MATRIXg.chat_id_..':'..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if (text and text == "تعطيل اوامر التسليه") then 
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻 تم تعطيل اوامر التسليه')
database:set(bot_id.."Fun_Bots:"..MATRIXg.chat_id_,"true")
end
if (text and text == "تفعيل اوامر التسليه") then 
send(MATRIXg.chat_id_, MATRIXg.id_, ' 👻  تم تفعيل اوامر التسليه')
database:del(bot_id.."Fun_Bots:"..MATRIXg.chat_id_)
end
local Name_Bot = (database:get(bot_id..'Name:Bot') or 'MATRIX')
if not database:get(bot_id.."Fun_Bots:"..MATRIXg.chat_id_) then
if text ==  ""..Name_Bot..' شنو رئيك بهاذا' and tonumber(MATRIXg.reply_to_message_id_) > 0 then     
function FunBot(extra, result, success) 
local Fun = {'لوكي وزاحف من ساع زحفلي وحضرته 😒','خوش ولد و ورده مال الله 💋🙄','يلعب ع البنات 🙄', 'ولد زايعته الكاع 😶🙊','صاك يخبل ومعضل ','محلو وشواربه جنها مكناسه 😂🤷🏼‍♀️','اموت عليه 🌝','هوه غير ا��حب مال اني 🤓❤️','مو خوش ولد صراحه ☹️','ادبسز وميحترم البنات  ', 'فد واحد قذر 🙄😒','ماطيقه كل ما اكمشه ريحته جنها بخاخ بف باف مال حشرات 😂🤷‍♀️','مو خوش ولد 🤓' } 
send(MATRIXg.chat_id_, result.id_,''..Fun[math.random(#Fun)]..'')   
end   
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, FunBot, nil)
return false
end  
if text == ""..Name_Bot..' تحب هذا' and tonumber(MATRIXg.reply_to_message_id_) > 0 then    
function FunBot(extra, result, success) 
local Fun = {'الكبد مال اني ','يولي ماحبه ',' لٱ ايع ','بس لو الكفها اله اعضها 💔','ماخب مطايه اسف','اكلك ۿذﭑ يكلي احبكك لولا ﭑݩٺ شتكول  ','ئووووووووف اموت ع ربه ','ايععععععععع','بلعباس اعشكك','ماحب مخابيل','احبب ميدو وبس','لٱ ماحبه','بله هاي جهره تكلي تحبهه ؟ ','بربك ئنته والله فارغ وبطران وماعدك شي تسوي جاي تسئلني احبهم لولا','افبس حبيبي هذا' } 
send(MATRIXg.chat_id_,result.id_,''..Fun[math.random(#Fun)]..'') 
end  
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.reply_to_message_id_)}, FunBot, nil)
return false
end    
end
if text and text:match('^'..Name_Bot..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..Name_Bot..' ','')
end
if text and text:match('^'..Name_Bot..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..Name_Bot..' ','')
end
if text == "نسبه الحب" or text == "نسبه حب" and MATRIXg.reply_to_message_id_ ~= 0 and Addictive(MATRIXg) then
if not database:get(bot_id..'Cick:lov'..MATRIXg.chat_id_) then
database:set(bot_id..":"..MATRIXg.sender_user_id_..":lov_Bots"..MATRIXg.chat_id_,"sendlove")
Text = 'ارسل اسمك واسم الشخص الثاني،  \n مثال روظي و وروان'
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
end
if text and text ~="نسبه الحب" and database:get(bot_id..":"..MATRIXg.sender_user_id_..":lov_Bots"..MATRIXg.chat_id_) == "sendlove" then
num = {"10","20","30","35","75","34","66","82","23","19","55","8","63","32","27","89","99","98","3","80","49","100","6","0",};
sendnum = num[math.random(#num)]
sl = 'نسبه حب '..text..' هي : '..sendnum..'%'
send(MATRIXg.chat_id_, MATRIXg.id_,sl) 
database:del(bot_id..":"..MATRIXg.sender_user_id_..":lov_Bots"..MATRIXg.chat_id_)
end
if text == "نسبه الكره" or text == "نسبه كره" and MATRIXg.reply_to_message_id_ ~= 0 and Addictive(MATRIXg) then
if not database:get(bot_id..'Cick:krh'..MATRIXg.chat_id_) then
database:set(bot_id..":"..MATRIXg.sender_user_id_..":krh_Bots"..MATRIXg.chat_id_,"sendkrhe")
Text = 'ارسل اسمك واسم الشخص الثاني،  \n مثال اسد و لبوى'
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
end
if text and text ~="نسبه الكره" and database:get(bot_id..":"..MATRIXg.sender_user_id_..":krh_Bots"..MATRIXg.chat_id_) == "sendkrhe" then
num = {"10","20","30","35","75","34","66","82","23","19","55","8","63","32","27","89","99","98","3","80","8","100","6","0",};
sendnum = num[math.random(#num)]
sl = 'نسبه كره '..text..' هي : '..sendnum..'%'
send(MATRIXg.chat_id_, MATRIXg.id_,sl) 
database:del(bot_id..":"..MATRIXg.sender_user_id_..":krh_Bots"..MATRIXg.chat_id_)
end
if text == "نسبه رجوله" or text == "نسبه الرجوله" and MATRIXg.reply_to_message_id_ ~= 0 and Addictive(MATRIXg) then
if not database:get(bot_id..'Cick:rjo'..MATRIXg.chat_id_) then
database:set(bot_id..":"..MATRIXg.sender_user_id_..":rjo_Bots"..MATRIXg.chat_id_,"sendrjoe")
Text = 'ارسل اسم الشخص الذي تريد قياس نسبه رجولته \n مثال مصطفئ'
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
end
if text and text ~="نسبه رجوله" and database:get(bot_id..":"..MATRIXg.sender_user_id_..":rjo_Bots"..MATRIXg.chat_id_) == "sendrjoe" then
numj = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",};
sendnuj = numj[math.random(#numj)]
xl = 'نسبه رجوله '..text..' هي : \n '..sendnuj..'%'
send(MATRIXg.chat_id_, MATRIXg.id_,xl) 
database:del(bot_id..":"..MATRIXg.sender_user_id_..":rjo_Bots"..MATRIXg.chat_id_)
end
if text == "صراحه" or text == "الصراحه" and MATRIXg.reply_to_message_id_ ~= 0 and Addictive(MATRIXg) then
if not database:get(bot_id..'Cick:rkko'..MATRIXg.chat_id_) then
database:set(bot_id..":"..MATRIXg.sender_user_id_..":rkko_Bots"..MATRIXg.chat_id_,"sendrkkoe")
local LEADER_MATRIXg = {
"صراحه  |  صوتك حلوة؟",
"صراحه  |  التقيت الناس مع وجوهين؟",
"صراحه  |  شيء وكنت تحقق اللسان؟",
"صراحه  |  أنا شخص ضعيف عندما؟",
"صراحه  |  هل ترغب في إظهار حبك ومرفق لشخص أو رؤية هذا الضعف؟",
"صراحه  |  يدل على أن الكذب مرات تكون ضرورية شي؟",
"صراحه  |  أشعر بالوحدة على الرغم من أنني تحيط بك كثيرا؟",
"صراحه  |  كيفية الكشف عن من يكمن عليك؟",
"صراحه  |  إذا حاول شخص ما أن يكرهه أن يقترب منك ويهتم بك تعطيه فرصة؟",
"صراحه  |  أشجع شيء حلو في حياتك؟",
"صراحه  |  طريقة جيدة يقنع حتى لو كانت الفكرة خاطئة توافق؟",
"صراحه  |  كيف تتصرف مع من يسيئون فهمك ويأخذ على ذهنه ثم ينتظر أن يرفض؟",
"صراحه  |  التغيير العادي عندما يكون الشخص الذي يحبه؟",
"صراحه  |  المواقف الصعبة تضعف لك ولا ترفع؟",
"صراحه  |  نظرة و يفسد الصداقة؟",
"صراحه  |  ‏‏إذا أحد قالك كلام سيء بالغالب وش تكون ردة فعلك؟",
"صراحه  |  شخص معك بالحلوه والمُره؟",
"صراحه  |  ‏هل تحب إظهار حبك وتعلقك بالشخص أم ترى ذلك ضعف؟",
"صراحه  |  تأخذ بكلام اللي ينصحك ولا تسوي اللي تبي؟",
"صراحه  |  وش تتمنى الناس تعرف عليك؟",
"صراحه  |  ابيع المجرة عشان؟",
"صراحه  |  أحيانا احس ان الناس ، كمل؟",
"صراحه  |  مع مين ودك تنام اليوم؟",
"صراحه  |  صدفة العمر الحلوة هي اني؟",
"صراحه  |  الكُره العظيم دايم يجي بعد حُب قوي تتفق؟",
"صراحه  |  صفة تحبها في نفسك؟",
"صراحه  |  ‏الفقر فقر العقول ليس الجيوب  ، تتفق؟",
"صراحه  |  تصلي صلواتك الخمس كلها؟",
"صراحه  |  ‏تجامل أحد على راحتك؟",
"صراحه  |  اشجع شيء سويتة بحياتك؟",
"صراحه  |  وش ناوي تسوي اليوم؟",
"صراحه  |  وش شعورك لما تشوف المطر؟",
"صراحه  |  غيرتك هاديه ولا تسوي مشاكل؟",
"صراحه  |  ما اكثر شي ندمن عليه؟",
"صراحه  |  اي الدول تتمنى ان تزورها؟",
"صراحه  |  متى اخر مره بكيت؟",
"صراحه  |  تقيم حظك ؟ من عشره؟",
"صراحه  |  هل تعتقد ان حظك سيئ؟",
"صراحه  |  شـخــص تتمنــي الإنتقــام منـــه؟",
"صراحه  |  كلمة تود سماعها كل يوم؟",
"صراحه  |  **هل تُتقن عملك أم تشعر بالممل؟",
"صراحه  |  هل قمت بانتحال أحد الشخصيات لتكذب على من حولك؟",
"صراحه  |  متى آخر مرة قمت بعمل مُشكلة كبيرة وتسببت في خسائر؟",
"صراحه  |  ما هو اسوأ خبر سمعته بحياتك؟",
"‏صراحه  | هل جرحت شخص تحبه من قبل ؟",
"صراحه  |  ما هي العادة التي تُحب أن تبتعد عنها؟",
"‏صراحه  | هل تحب عائلتك ام تكرههم؟",
"‏صراحه  |  من هو الشخص الذي يأتي في قلبك بعد الله – سبحانه وتعالى- ورسوله الكريم – صلى الله عليه وسلم؟",
"‏صراحه  |  هل خجلت من نفسك من قبل؟",
"‏صراحه  |  ما هو ا الحلم  الذي لم تستطيع ان تحققه؟",
"‏صراحه  |  ما هو الشخص الذي تحلم به كل ليلة؟",
"‏صراحه  |  هل تعرضت إلى موقف مُحرج جعلك تكره صاحبهُ؟",
"‏صراحه  |  هل قمت بالبكاء أمام من تُحب؟",
"‏صراحه  |  ماذا تختار حبيبك أم صديقك؟",
"‏صراحه  | هل حياتك سعيدة أم حزينة؟",
"صراحه  |  ما هي أجمل سنة عشتها بحياتك؟",
"‏صراحه  |  ما هو عمرك الحقيقي؟",
"‏صراحه  |  ما اكثر شي ندمن عليه؟",
"صراحه  |  ما هي أمنياتك المُستقبلية؟‏",
"صراحه  | هل قبلت فتاه؟"
}
send(MATRIXg.chat_id_, MATRIXg.id_,'['..LEADER_MATRIXg[math.random(#LEADER_MATRIXg)]..']') 
return false
end
end
if text and text ~="صراحه" and database:get(bot_id..":"..MATRIXg.sender_user_id_..":rkko_Bots"..MATRIXg.chat_id_) == "sendrkkoe" then
numj = {"اما قله ادب صحيح كلو كدب فى كدب💔😔"," ده مظبوط🙂😹"," اقلك الكلام ده كدب واللى قالولك كداب وانت كداب واللى بيتفرج كمان كداب🤝😂"," ده برجوله وموثق كمان❤️😁","فعلا بتتكلم صح🤗","يجدع قول كلام غير دا😹","احس هل شي كذب👻💕","طب عيني ف عينك كدا ??","انت صح",};
sendnuj = numj[math.random(#numj)]
xl = ' ⟨  '..text..'  ⟩ \n '..sendnuj..'.'
send(MATRIXg.chat_id_, MATRIXg.id_,xl) 
database:del(bot_id..":"..MATRIXg.sender_user_id_..":rkko_Bots"..MATRIXg.chat_id_)
end
if text and text ~="نسبه رجوله" and database:get(bot_id..":"..MATRIXg.sender_user_id_..":rjo_Bots"..MATRIXg.chat_id_) == "sendrjoe" then
numj = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",};
sendnuj = numj[math.random(#numj)]
xl = 'نسبه رجوله '..text..' هي : \n '..sendnuj..'%'
send(MATRIXg.chat_id_, MATRIXg.id_,xl) 
database:del(bot_id..":"..MATRIXg.sender_user_id_..":rjo_Bots"..MATRIXg.chat_id_)
end
if text == "كشف الكذب" or text == "كشف الكدب" and MATRIXg.reply_to_message_id_ ~= 0 and Addictive(MATRIXg) then
if not database:get(bot_id..'Cick:rkko'..MATRIXg.chat_id_) then
database:set(bot_id..":"..MATRIXg.sender_user_id_..":rkko_Bots"..MATRIXg.chat_id_,"sendrkkoe")
local LEADER_MATRIXg = {
"ارسل لى الجمله لتعرف صدق ام كذب👻✨"
}
send(MATRIXg.chat_id_, MATRIXg.id_,'['..LEADER_MATRIXg[math.random(#LEADER_MATRIXg)]..']') 
return false
end
end


if text == "نسبه الانوثه" or text == "نسبه انوثه" and MATRIXg.reply_to_message_id_ ~= 0 and Addictive(MATRIXg) then
if not database:get(bot_id..'Cick:ano'..MATRIXg.chat_id_) then
database:set(bot_id..":"..MATRIXg.sender_user_id_..":ano_Bots"..MATRIXg.chat_id_,"sendanoe")
Text = 'ارسل اسم الشخص الذي تريد قياس نسبه انوثتها \n مثال روان'
send(MATRIXg.chat_id_, MATRIXg.id_,Text) 
end
end
if text and text ~="نسبه الانوثه" and database:get(bot_id..":"..MATRIXg.sender_user_id_..":ano_Bots"..MATRIXg.chat_id_) == "sendanoe" then
numj = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",};
sendnuj = numj[math.random(#numj)]
xl = 'نسبه الانوثه '..text..' هي : \n '..sendnuj..'%'
send(MATRIXg.chat_id_, MATRIXg.id_,xl) 
database:del(bot_id..":"..MATRIXg.sender_user_id_..":ano_Bots"..MATRIXg.chat_id_)
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.sender_user_id_ and Muted_User(MATRIXg.chat_id_,MATRIXg.sender_user_id_) then 
DeleteMessage(MATRIXg.chat_id_, {[0] = MATRIXg.id_})  
return false  
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.sender_user_id_ and Ban_User(MATRIXg.chat_id_,MATRIXg.sender_user_id_) then 
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_) 
DeleteMessage(MATRIXg.chat_id_, {[0] = MATRIXg.id_}) 
return false  
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_ and MATRIXg.content_.members_ and MATRIXg.content_.members_[0] and MATRIXg.content_.members_[0].id_ and Ban_User(MATRIXg.chat_id_,MATRIXg.content_.members_[0].id_) then 
chat_kick(MATRIXg.chat_id_,MATRIXg.content_.members_[0].id_) 
DeleteMessage(MATRIXg.chat_id_, {[0] = MATRIXg.id_}) 
return false
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.sender_user_id_ and GBan_User(MATRIXg.sender_user_id_) then 
chat_kick(MATRIXg.chat_id_,MATRIXg.sender_user_id_) 
DeleteMessage(MATRIXg.chat_id_, {[0] = MATRIXg.id_}) 
return false 
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.sender_user_id_ and Gmute_User(MATRIXg.sender_user_id_) then 
DeleteMessage(MATRIXg.chat_id_, {[0] = MATRIXg.id_}) 
return false 
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_ and MATRIXg.content_.members_ and MATRIXg.content_.members_[0] and MATRIXg.content_.members_[0].id_ and GBan_User(MATRIXg.content_.members_[0].id_) then 
chat_kick(MATRIXg.chat_id_,MATRIXg.content_.members_[0].id_) 
DeleteMessage(MATRIXg.chat_id_, {[0] = MATRIXg.id_})  
end 
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.ID == "MessageChatAddMembers" then  
database:set(bot_id.."Who:Added:Me"..MATRIXg.chat_id_..':'..MATRIXg.content_.members_[0].id_,MATRIXg.sender_user_id_)
local mem_id = MATRIXg.content_.members_  
local Bots = database:get(bot_id.."lock:Bot:kick"..MATRIXg.chat_id_) 
for i=0,#mem_id do  
if MATRIXg.content_.members_[i].type_.ID == "UserTypeBot" and not Mod(MATRIXg) and Bots == "kick" then   
https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..MATRIXg.chat_id_.."&user_id="..MATRIXg.sender_user_id_)
DRAGON = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..MATRIXg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(DRAGON)
if Json_Info.ok == true and #mem_id == i then
local MATRIXgs = {}
MATRIXgs[0] = MATRIXg.id_
MATRIXgs_id = MATRIXg.id_-1048576
for i=1 ,(150) do 
MATRIXgs_id = MATRIXgs_id+1048576
table.insert(MATRIXgs,MATRIXgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = MATRIXg.chat_id_,message_ids_ = MATRIXgs},function(arg,data);MATRIXgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MATRIXgsDel[0] then;MATRIXgsDel[0] = MATRIXgs[i];end;table.insert(MATRIXgsDel,MATRIXgs[i]);end;end;if MATRIXgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MATRIXgsDel},function(arg,data)end,nil);end;end,{chat_id_=MATRIXg.chat_id_})
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(MATRIXg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_mod(MATRIXg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = MATRIXg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.ID == "MessageChatAddMembers" then  
local mem_id = MATRIXg.content_.members_  
local Bots = database:get(bot_id.."lock:Bot:kick"..MATRIXg.chat_id_) 
for i=0,#mem_id do  
if MATRIXg.content_.members_[i].type_.ID == "UserTypeBot" and not Mod(MATRIXg) and Bots == "del" then   
DRAGON = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..MATRIXg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(DRAGON)
if Json_Info.ok == true and #mem_id == i then
local MATRIXgs = {}
MATRIXgs[0] = MATRIXg.id_
MATRIXgs_id = MATRIXg.id_-1048576
for i=1 ,(150) do 
MATRIXgs_id = MATRIXgs_id+1048576
table.insert(MATRIXgs,MATRIXgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = MATRIXg.chat_id_,message_ids_ = MATRIXgs},function(arg,data);MATRIXgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MATRIXgsDel[0] then;MATRIXgsDel[0] = MATRIXgs[i];end;table.insert(MATRIXgsDel,MATRIXgs[i]);end;end;if MATRIXgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MATRIXgsDel},function(arg,data)end,nil);end;end,{chat_id_=MATRIXg.chat_id_})
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(MATRIXg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_mod(MATRIXg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = MATRIXg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
if MATRIXg.content_.ID == 'MessagePinMessage' then
if Constructor(MATRIXg) then 
database:set(bot_id..'Pin:Id:MATRIXg'..MATRIXg.chat_id_,MATRIXg.content_.message_id_)
else
local MATRIXg_Pin = database:get(bot_id..'Pin:Id:MATRIXg'..MATRIXg.chat_id_)
if MATRIXg_Pin and database:get(bot_id.."lockpin"..MATRIXg.chat_id_) then
PinMessage(MATRIXg.chat_id_,MATRIXg_Pin)
end
end
end
--------------------------------------------------------------------------------------------------------------
if MATRIXg.content_.ID == "MessageChatDeletePhoto" or MATRIXg.content_.ID == "MessageChatChangePhoto" or MATRIXg.content_.ID == 'MessagePinMessage' or MATRIXg.content_.ID == "MessageChatJoinByLink" or MATRIXg.content_.ID == "MessageChatAddMembers" or MATRIXg.content_.ID == 'MessageChatChangeTitle' or MATRIXg.content_.ID == "MessageChatDeleteMember" then   
if database:get(bot_id..'lock:tagservr'..MATRIXg.chat_id_) then  
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.id_})       
return false
end    
end   
--------------------------------------------------------------------------------------------------------------
SourceDRAGON(data.message_,data)
plugin_Dragon(data.message_)
--------------------------------------------------------------------------------------------------------------
if Chat_Type == 'GroupBot' and ChekAdd(MATRIXg.chat_id_) == true then
tdcli_function ({ID = "GetUser",user_id_ = MATRIXg.sender_user_id_},function(arg,data) 
if data.username_ then
database:set(bot_id..'user:Name'..MATRIXg.sender_user_id_,(data.username_))
end
--------------------------------------------------------------------------------------------------------------
if tonumber(data.id_) == tonumber(bot_id) then
return false
end
end,nil)   
end
elseif (data.ID == "UpdateMessageEdited") then
local MATRIXg = data
tdcli_function ({ID = "GetMessage",chat_id_ = MATRIXg.chat_id_,message_id_ = tonumber(MATRIXg.message_id_)},function(extra, result, success)
database:incr(bot_id..'edits'..result.chat_id_..result.sender_user_id_)
local Text = result.content_.text_
if database:get(bot_id.."lock_edit_med"..MATRIXg.chat_id_) and not Text and not BasicConstructor(result) then
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local username = data.username_
local name = data.first_name_
local iduser = data.id_
local users = ('[@'..data.username_..']' or iduser)
local list = database:smembers(bot_id..'Constructor'..MATRIXg.chat_id_)
t = "\n 👻 شخص ما يحاول تعديل الميديا \n"
for k,v in pairs(list) do
local username = database:get(bot_id.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = " 👻 لا يوجد ادمن"
end
send(MATRIXg.chat_id_,0,''..t..'\n𖤍━┅┄⟞⟦꧁MATRIX ꧂⟧⟝┄┉━𖤍\n 👻 تم التعديل على الميديا\n 👻 الشخص الي قام بالتعديل\n 👻 ايدي الشخص ◂ '..result.sender_user_id_..'\n 👻 معرف الشخص ↚{ '..users..' }') 
end,nil)
DeleteMessage(MATRIXg.chat_id_,{[0] = MATRIXg.message_id_}) 
end
local text = result.content_.text_
if not Mod(result) then
------------------------------------------------------------------------

------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."lock:Link"..MATRIXg.chat_id_) then
DeleteMessage(MATRIXg.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."lock:Link"..MATRIXg.chat_id_) then
DeleteMessage(MATRIXg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text and text:match("[Tt].[Mm][Ee]") or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text and text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get(bot_id.."lock:Link"..MATRIXg.chat_id_) then
DeleteMessage(MATRIXg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("[hH][tT][tT][pP][sT]") or text and text:match("[tT][eE][lL][eE][gG][rR][aA].[Pp][Hh]") or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa].[Pp][Hh]") then
if database:get(bot_id.."lock:Link"..MATRIXg.chat_id_) then
DeleteMessage(MATRIXg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("(.*)(@)(.*)") then
if database:get(bot_id.."lock:user:name"..MATRIXg.chat_id_) then
DeleteMessage(MATRIXg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text and text:match("@") then
if database:get(bot_id.."lock:user:name"..MATRIXg.chat_id_) then
DeleteMessage(MATRIXg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("(.*)(#)(.*)") then
if database:get(bot_id.."lock:hashtak"..MATRIXg.chat_id_) then
DeleteMessage(MATRIXg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text and text:match("#") then
if database:get(bot_id.."lock:user:name"..MATRIXg.chat_id_) then
DeleteMessage(MATRIXg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
local DRAGONAbot = database:get(bot_id.."DRAGON1:Add:Filter:Rp2"..text..result.chat_id_)   
if DRAGONAbot then    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(MATRIXg.chat_id_,0," 👻 الـعـضو  : {["..data.first_name_.."](T.ME/"..data.username_..")}\n 👻 ["..DRAGONAbot.."] \n") 
else
send(MATRIXg.chat_id_,0," 👻 الـعـضو  : {["..data.first_name_.."](T.ME/UU_matrixx)}\n 👻 ["..DRAGONAbot.."] \n") 
end
end,nil)   
DeleteMessage(MATRIXg.chat_id_,{[0] = data.message_id_}) 
return false
end
------------------------------------------------------------------------
if text and text:match("/") then
if database:get(bot_id.."lock:Cmd"..MATRIXg.chat_id_) then
DeleteMessage(MATRIXg.chat_id_,{[0] = data.message_id_}) 
return false
end 
end 
if text and text:match("(.*)(/)(.*)") then
if database:get(bot_id.."lock:Cmd"..MATRIXg.chat_id_) then
DeleteMessage(MATRIXg.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text then
local DRAGON1_MATRIXg = database:get(bot_id.."DRAGON1:Add:Filter:Rp2"..text..result.chat_id_)   
if DRAGON1_MATRIXg then    
send(MATRIXg.chat_id_, MATRIXg.id_," 👻 "..DRAGON1_MATRIXg)
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
end
end,nil)
------------------------------------------------------------------------

elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then 
local list = database:smembers(bot_id.."User_Bot") 
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end         
local list = database:smembers(bot_id..'Chek:Groups') 
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
database:srem(bot_id..'Chek:Groups',v)  
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=bot_id,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem(bot_id..'Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem(bot_id..'Chek:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
database:srem(bot_id..'Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
database:sadd(bot_id..'Chek:Groups',v)  
end 
end,nil)
end

elseif (data.ID == "UpdateMessageSendSucceeded") then
local MATRIXg = data.message_
local text = MATRIXg.content_.text_
local Get_MATRIXg_Pin = database:get(bot_id..'MATRIXg:Pin:Chat'..MATRIXg.chat_id_)
if Get_MATRIXg_Pin ~= nil then
if text == Get_MATRIXg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = MATRIXg.chat_id_:gsub('-100',''),message_id_ = MATRIXg.id_,disable_notification_ = 0},function(arg,d) if d.ID == 'Ok' then;database:del(bot_id..'MATRIXg:Pin:Chat'..MATRIXg.chat_id_);end;end,nil)   
elseif (MATRIXg.content_.sticker_) then 
if Get_MATRIXg_Pin == MATRIXg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = MATRIXg.chat_id_:gsub('-100',''),message_id_ = MATRIXg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'MATRIXg:Pin:Chat'..MATRIXg.chat_id_) end,nil)   
end
end
if (MATRIXg.content_.animation_) then 
if MATRIXg.content_.animation_.animation_.persistent_id_ == Get_MATRIXg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = MATRIXg.chat_id_:gsub('-100',''),message_id_ = MATRIXg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'MATRIXg:Pin:Chat'..MATRIXg.chat_id_) end,nil)   
end
end
if (MATRIXg.content_.photo_) then
if MATRIXg.content_.photo_.sizes_[0] then
id_photo = MATRIXg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if MATRIXg.content_.photo_.sizes_[1] then
id_photo = MATRIXg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if MATRIXg.content_.photo_.sizes_[2] then
id_photo = MATRIXg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if MATRIXg.content_.photo_.sizes_[3] then
id_photo = MATRIXg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == Get_MATRIXg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = MATRIXg.chat_id_:gsub('-100',''),message_id_ = MATRIXg.id_,disable_notification_ = 0},function(arg,d) database:del(bot_id..'MATRIXg:Pin:Chat'..MATRIXg.chat_id_) end,nil)   
end
end
end


end -- end new MATRIXg dev.mr sofi 
end -- end callback dev.mr sofi
















