module("extensions.luck", package.seeall)
extension = sgs.Package("luck")

sgs.LoadTranslationTable{
	["luck"] = "幸运包",
	["dasheng"] = "大圣",
	["&dasheng"] = "大圣",
	["#dasheng"] = "血精灵的领袖",
	["designer:dasheng"] = "Owen",
	["cv:dasheng"] = "Owen",
	["illustrator:dasheng"] = "Owen",
	["shali"] = "傻梨",
	["&shali"] = "傻梨",
	["#shali"] = "静如瘫痪",
	["designer:shali"] = "Owen",
	["cv:shali"] = "Owen",
	["illustrator:shali"] = "Owen",
	["bill"] = "比尔",
	["&bill"] = "比尔",
	["#bill"] = "铁血沙场",
	["designer:bill"] = "Owen",
	["cv:bill"] = "Owen",
	["illustrator:bill"] = "Owen",
	["helen"] = "齐冬冬",
	["&helen"] = "齐冬冬",
	["#helen"] = "圣光之力",
	["designer:helen"] = "Owen",
	["cv:helen"] = "Owen",
	["illustrator:helen"] = "Owen",
	["jg"] = "鸡哥",
	["&jg"] = "鸡哥",
	["#jg"] = "斯卡雷特",
	["designer:jg"] = "Owen",
	["cv:jg"] = "Owen",
	["illustrator:jg"] = "Owen",
	["kevin"] = "凯爷",
	["&kevin"] = "凯爷",
	["#kevin"] = "浅红色",
	["designer:kevin"] = "Owen",
	["cv:kevin"] = "Owen",
	["illustrator:kevin"] = "Owen",
	["owen"] = "欧文",
	["&owen"] = "欧文",
	["#owen"] = "凤舞九天",
	["designer:owen"] = "Owen",
	["cv:owen"] = "Owen",
	["illustrator:owen"] = "Owen",
	["fanchong"] = "反冲",
	[":fanchong"] = "弃牌阶段结束时，你可以选择一名其他角色令其执行一项：1. 摸X张牌；2. 弃X张牌，X为此阶段你弃牌的数量且最多为3.",
	["d3"] = "摸X张牌",
	["t3"] = "弃X张牌",
	["yemu"] = "夜幕",
	[":yemu"] = "你的判定牌均视为梅花.",
	["#LuaYemu"] = "夜幕",
	["mingxiang"] = "冥想",
	[":mingxiang"] = "你的手牌上限+1， 当你没有手牌时，任何【杀】或锦囊对你无效.",
	["Luaxianji"] = "献祭",
	[":Luaxianji"] = "回合结束阶段开始时，令一名除你以外的角色对其他最多3名由你指定的角色发起决斗.",
	["@LuaXianji"] = "是否发动 献祭",
	["baoliu"] = "瀑流",
	[":baoliu"] = "出牌阶段，你可以弃X张黑色牌，对一名角色造成一点伤害，或弃X张红色牌令一名角色恢复一点体力，X为该角色当前体力值.",
	["boya"] = "博雅",
	["&boya"] = "博雅",
	["#boya"] = "梦醉良缘",
	["designer:boya"] = "Owen",
	["cv:boya"] = "Owen",
	["illustrator:boya"] = "Owen",
	["feifei"] = "菲菲",
	["&feifei"] = "菲菲",
	["#feifei"] = "闭月羞花",
	["designer:feifei"] = "Owen",
	["cv:feifei"] = "Owen",
	["illustrator:feifei"] = "Owen",
	["LuaWuce"] = "无策",
	[":LuaWuce"] = "除你以外所有角色不能使用锦囊，此效果直到你下回合开始为止",
	["LuaBaoliuCard"] = "瀑流",
	["LuaBaoliu"] = "瀑流",
	["luabaoliu"] = "瀑流",
	["shouge"] = "收割",
	[":shouge"] = "其他角色死亡时，你恢复一点体力；你对自己使用【桃】额外恢复一点体力.",
	["xuefei"] = "血沸",
	[":xuefei"] = "你与其他角色的距离+1；你使用锦囊无距离限制；每使用一张锦囊便失去一点体力.",
	["jiaoxie"] = "缴械",
	[":jiaoxie"] = "你可以将一张梅花基本牌当【借刀杀人】使用.",
	["lianyu"] = "炼狱",
	[":lianyu"] = "当你处于濒死状态时，你可以减5点体力上限并摸两张牌，若如此做，视为你对自己使用一张【桃】，并失去技能“血沸”.",
	["@lianyubiaoji"] = "炼狱标记",
	["@xianjibiaoji"] = "献祭标记",








}

dasheng = sgs.General(extension, "dasheng", "god", "3")
shali = sgs.General(extension, "shali", "god", "2", false)
bill = sgs.General(extension, "bill", "god", "4")
helen = sgs.General(extension, "helen", "god", "3", false)
jg = sgs.General(extension, "jg", "god", "9")
kevin = sgs.General(extension, "kevin", "god", "4")
owen = sgs.General(extension, "owen", "god", "4")
dasheng2 = sgs.General(extension, "dasheng2", "god", "3", true, true, true)
boya = sgs.General(extension, "boya", "god", "3", false)
feifei = sgs.General(extension, "feifei", "god", "3", false)






LuaFanchong = sgs.CreateTriggerSkill{
	name = "fanchong",
	frequency = sgs.Skill_NotFrequent,
	events = {sgs.EventPhaseStart},
	on_trigger = function(self, event, player, data)
		if not player:hasSkill(self:objectName()) then return end
		if event == sgs.EventPhaseStart then
			if player:getPhase() == sgs.Player_Discard then
				Num_of_Discard = player:getHandcardNum() - player:getMaxCards()
			elseif player:getPhase() == sgs.Player_Finish and Num_of_Discard > 0 then
				local room = player:getRoom()
				if not room:askForSkillInvoke(player, self:objectName()) then return end
				local good = false
				local x = Num_of_Discard
				local dest = room:askForPlayerChosen(player, room:getOtherPlayers(player), "fanchong")
				if not dest then return end
				local choice = room:askForChoice(player, self:objectName(), "d3+t3")
				local y = math.min(x, 3)
				if choice == "d3" then
					dest:drawCards(y)
					good = true
				else
					room:askForDiscard(dest, self:objectName(), y, y, false, true)
					good = false
				end
				if good then
					room:setEmotion(dest, "good")
				else
					room:setEmotion(dest, "bad")
				end
				return false
			end
		end
	end,
}





XLuaYemu = sgs.CreateFilterSkill{
	name = "#LuaYemu",
	view_filter = function(self, to_select)
		return true
	end,
	view_as = function(self, card)
		local id = card:getEffectiveId()
		local new_card = sgs.Sanguosha:getWrappedCard(id)
		new_card:setSkillName(self:objectName())
		new_card:setSuit(sgs.Card_Club)
		new_card:setModified(true)
		return new_card
	end
}

LuaYemu = sgs.CreateTriggerSkill{
	name = "yemu",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.StartJudge, sgs.FinishJudge},
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if event == sgs.StartJudge then
			room:acquireSkill(player, "#LuaYemu", false)
		elseif event == sgs.FinishJudge then
			room:detachSkillFromPlayer(player, "#LuaYemu")
		end
	end
}



LuaMingxiang = sgs.CreateProhibitSkill{
	name = "mingxiang",
	is_prohibited = function(self, from, to, card)
		return to:hasSkill(self:objectName()) and (card:isKindOf("Slash") or card:isNDTrick()) and to:isKongcheng()
	end 
}





LuaMingxiangX = sgs.CreateMaxCardsSkill{
	name = "#mingxiang",
	extra_func = function(self, target)
		if target:hasSkill("#mingxiang") then
			return 1
		end
	end
}


newDuel = function()
	return sgs.Sanguosha:cloneCard("duel", sgs.Card_NoSuit, 0)
end
LuaXianjiCard = sgs.CreateSkillCard{
	name = "LuaXianjiCard" ,
	target_fixed = false ,
	will_throw = true ,
	filter = function(self, targets, to_select)
		if #targets == 0 then
			return true
		end
		if #targets == 4 then
			return false
		end
		if #targets >= 1 then
			local duel = sgs.Sanguosha:cloneCard("duel", sgs.Card_NoSuit, 0)
			duel:deleteLater()
			if to_select:isProhibited(targets[1], duel, targets[1]:getSiblings()) then return false end
			if to_select:isCardLimited(duel, sgs.Card_MethodUse) then return false end
			return true
		end
	end ,
	feasible = function(self, targets)
		if #targets >= 2 then
			return #targets <= 4
		end
		return false
	end ,
	about_to_use = function(self, room, cardUse)
		local diaochan = cardUse.from
		local logg = sgs.LogMessage()
		logg.from = diaochan
		logg.to = cardUse.to
		logg.type = "#UseCard"
		logg.card_str = self:toString()
		room:sendLog(logg)
		local data = sgs.QVariant()
		data:setValue(cardUse)
		local thread = room:getThread()
		thread:trigger(sgs.PreCardUsed, room, diaochan, data)
		local reason = sgs.CardMoveReason(sgs.CardMoveReason_S_REASON_THROW, diaochan:objectName(), nil, "LuaLijian", nil)
		room:moveCardTo(self, diaochan, nil, sgs.Player_DiscardPile, reason, true)
		thread:trigger(sgs.CardUsed, room, diaochan, data)
		thread:trigger(sgs.CardFinished, room, diaochan, data)
	end ,
	on_use = function(self, room, source, targets)
		local from = targets[1]
		local tos = targets
		table.removeOne(tos,from)
		local duel = sgs.Sanguosha:cloneCard("duel", sgs.Card_NoSuit, 0)
		duel:toTrick():setCancelable(false)
		duel:setSkillName(self:objectName())
		local use = sgs.CardUseStruct()
		use.from = from
		for _,to in ipairs(tos) do
			if (not to:isCardLimited(duel, sgs.Card_MethodUse)) and (not to:isProhibited(from, duel)) then
				use.to:append(to)
			end
		end
		use.card = duel
		room:useCard(use)
	end
}





LuaXianjiVS = sgs.CreateViewAsSkill{
	name = "Luaxianji",
	n = 0,
	view_as = function(self, cards)
		return LuaXianjiCard:clone()
	end,
	enabled_at_play = function(self, player)
		return false
	end,
	enabled_at_response = function(self, player, pattern)
		return pattern == "@@LuaXianji"
	end

}

LuaXianji = sgs.CreateTriggerSkill{
	name = "Luaxianji",
	frequency = sgs.Skill_Limited,
	events = {sgs.EventPhaseStart},
	view_as_skill = LuaXianjiVS,
	priority = -2,
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		room:askForUseCard(player, "@@LuaXianji", "@LuaXianji")
		player:loseMark("@xianjibiaoji")
		return false
	end,
	can_trigger = function(self, target)
		if target then
			if target:isAlive() and target:hasSkill(self:objectName()) then
				if target:getPhase() == sgs.Player_Finish then
					return target:getMark("@xianjibiaoji") > 0
				end
			end
		end
		return false
	end

}

LuaXianjiStart = sgs.CreateTriggerSkill{
	name = "#LuaXianjiStart",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.GameStart},
	on_trigger = function(self, event, player, data)
		player:gainMark("@xianjibiaoji")
	end
}

LuaBaoliuCard = sgs.CreateSkillCard{
	name = "LuaBaoliuCard" ,
	filter = function(self, targets, to_select)
		if (#targets ~= 0) or (math.max(0, to_select:getHp()) ~= self:subcardsLength()) then return false end
		return true
	end ,
	on_effect = function(self,effect)
		if self:isBlack() then
			effect.from:getRoom():damage(sgs.DamageStruct("baoliu", effect.from, effect.to))
		elseif self:isRed() and effect.to:isWounded() then
			local recover = sgs.RecoverStruct()
			local room = effect.to:getRoom()
			recover.card = self
			recover.who = effect.from
			room:recover(effect.to, recover)
		end
	end
}



LuaBaoliuVS = sgs.CreateViewAsSkill{
	name = "baoliu" ,
	n = 999 ,
	view_filter = function()
		return true
	end ,
	view_as = function(self, cards)
		local baoliu = LuaBaoliuCard:clone()
		if #cards ~= 0 then
			for _, c in ipairs(cards) do
				baoliu:addSubcard(c)
			end
		end
		return baoliu
	end ,
	enabled_at_play = function(self, player)
		return player:canDiscard(player, "he")
	end
}



LuaBaoliu = sgs.CreateTriggerSkill{
	name = "baoliu" ,
	events = {},
	view_as_skill = LuaBaoliuVS,
	on_trigger = function(self, event, player, data)
	end,
	can_trigger = function(self, target)
		return target
	end
}



LuaWuceCard = sgs.CreateSkillCard{
	name = "LuaWuceCard",
	target_fixed = true,
	will_throw = true,
	on_use = function(self, room, source, targets)
		room:removePlayerMark(source, "@LuaWuce")
		room:setTag("Global_InSkill_LuaSkills",sgs.QVariant(true))
		local players = room:getOtherPlayers(source)
		for _,p in sgs.qlist(players) do
			if p:isAlive() then
				room:cardEffect(self, source, p)
			end
		end
	end,
	on_effect = function(self, effect)
		local room = effect.to:getRoom()
		room:setPlayerCardLimitation(effect.to,"use,response","TrickCard",false)
	end
}
LuaWuceVS = sgs.CreateViewAsSkill{
	name = "LuaWuce",
	n = 0,
	view_as = function(self, cards)
		return LuaWuceCard:clone()
	end,
	enabled_at_play = function(self, player)
		return player:getMark("@LuaWuce") >= 1
	end
}
LuaWuce = sgs.CreateTriggerSkill{
	name = "LuaWuce" ,
	frequency = sgs.Skill_Limited ,
	events = {sgs.Death,sgs.EventPhaseStart } ,
	view_as_skill = LuaWuceVS ,
	limit_mark = "@LuaWuce",
	on_trigger = function(self, event, player, data)
		local room = player:getRoom()
		if event == sgs.EventPhaseStart then
			if player:getPhase() == sgs.Player_Start then
				if room:getTag("Global_InSkill_LuaSkills"):toBool() then
					room:removeTag("Global_InSkill_LuaSkills")
					local players = room:getOtherPlayers(source)
					for _,p in sgs.qlist(players) do
						if p:isAlive() then
							room:removePlayerCardLimitation(p,"use,response","TrickCard")
						end
					end
				end
			end
		else
			local death = data:toDeath()
			if death.who:objectName() == player:objectName() then
				if room:getTag("Global_InSkill_LuaSkills"):toBool() then
					room:removeTag("Global_InSkill_LuaSkills")
					local players = room:getOtherPlayers(source)
					for _,p in sgs.qlist(players) do
						if p:isAlive() then
							room:removePlayerCardLimitation(p,"use,response","TrickCard")
						end
					end
				end
			end
		end
	end,
}


LuaShouge = sgs.CreateTriggerSkill{
	name = "shouge",
	frequency = sgs.Skill_Compulsory, 
	events = {sgs.Death}, 
	on_trigger = function(self, event, player, data) 
		local death = data:toDeath()
		local room = player:getRoom()
		if death.who:objectName() == player:objectName() then return false end
		if event == sgs.Death then
			local recover = sgs.RecoverStruct()
			recover.who = player
			recover.recover = 1
			room:recover(player,recover)
		end
	end, 
}

LuaShougeX = sgs.CreateTriggerSkill{
	name = "#shouge",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.PreHpRecover},
	on_trigger = function(self, event, player, data)
		if event == sgs.PreHpRecover then
			local rec = data:toRecover()
			if rec.card and (rec.card:isKindOf("Peach")) then
				rec.recover = rec.recover + 1
				data:setValue(rec)
			end
		end
	end,
	can_trigger = function(self, target)
		return target:hasSkill(self:objectName())
	end
}

LuaXuefei = sgs.CreateDistanceSkill{
	name = "xuefei",
	correct_func = function(Self, from, to)
		if from:hasSkill("xuefei") then
			return 1
		end
	end,
}




LuaXuefeiX = sgs.CreateTargetModSkill{
	name = "#xuefeix",
	pattern = "TrickCard",
	distance_limit_func = function(self, from, card)
		if from:hasSkill(self:objectName()) then
			return 1000
		else
			return 0
		end
	end
}


LuaXuefeiY = sgs.CreateTriggerSkill{
	name = "#xuefeiy",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.CardUsed, sgs.CardResponded},
	on_trigger = function(self, event, player, data)
		local card
		local room = player:getRoom()
		if event == sgs.CardUsed then 
			local use = data:toCardUse()
			card = use.card
		elseif event == sgs.CardResponded then
			card = data:toCardResponse().m_card
		end
		if card:isKindOf("TrickCard") then
			room:loseHp(player)
		end
	end
}

LuaJiaoxie = sgs.CreateViewAsSkill{
	name = "jiaoxie",
	n = 1,
	view_filter = function(self, selected, to_select)
		if to_select:getSuit() == sgs.Card_Club then
			return to_select:isKindOf("BasicCard")
		end
		return false
	end,
	view_as = function(self, cards)
		if #cards == 1 then
			local card = cards[1]
			local suit = card:getSuit()
			local point = card:getNumber()
			local id = card:getId()
			local disarm = sgs.Sanguosha:cloneCard("Collateral", suit, point)
			disarm:setSkillName(self:objectName())
			disarm:addSubcard(id)
			return disarm
		end
	end

}

LuaLianyuStart = sgs.CreateTriggerSkill{
	name = "#LuaLianyuStart",
	frequency = sgs.Skill_Compulsory,
	events = {sgs.GameStart},
	on_trigger = function(self, event, player, data)
		player:gainMark("@lianyubiaoji")
	end
}

LuaLianyu = sgs.CreateTriggerSkill{
	name = "lianyu",
	frequency = sgs.Skill_Limited,
	events = {sgs.AskForPeaches},
	on_trigger = function(self, event,player, data)
		local room = player:getRoom()
		local dying_data = data:toDying()
		local source = dying_data.who
		local rec = sgs.RecoverStruct()
		if source:objectName() == player:objectName() then
			if player:askForSkillInvoke(self:objectName(), data) then
				player:loseMark("@lianyubiaoji")
				room:loseMaxHp(player, 5)
				room:drawCards(player, 2, self:objectName())
				rec.who = player
				rec.card = nil
				rec.recover = 2
				room:recover(player, rec)
				room:detachSkillFromPlayer(player, "xuefei")
				room:detachSkillFromPlayer(player, "#xuefeix")
				room:detachSkillFromPlayer(player, "#xuefeiy")
			end
		end
		return false
	end,

	can_trigger = function(self, target)
		if target then
			if target:hasSkill(self:objectName()) then
				if target:isAlive() then
					return target:getMark("@lianyubiaoji") > 0
				end
			end
		end
	    return false
	end

}




dasheng2:addSkill(XLuaYemu)
dasheng:addSkill(LuaFanchong)
dasheng:addSkill(LuaYemu)
dasheng:addSkill(LuaXianji)
dasheng:addSkill(LuaXianjiStart)
shali:addSkill(LuaMingxiang)
shali:addSkill(LuaMingxiangX)
shali:addSkill(LuaBaoliu)
feifei:addSkill(LuaWuce)
jg:addSkill(LuaShouge)
jg:addSkill(LuaShougeX)
jg:addSkill(LuaXuefei)
jg:addSkill(LuaXuefeiX)
jg:addSkill(LuaXuefeiY)
jg:addSkill(LuaLianyu)
jg:addSkill(LuaLianyuStart)
bill:addSkill(LuaJiaoxie)



















