function IsBuffActive(buffname, unit)
	IsBuffActiveTooltip:SetOwner(UIParent, "ANCHOR_NONE");
	if (not buffname) then
		return;
	end;
	if (not unit) then
		unit="player";
	end;
	if string.lower(unit) == "mainhand" then
		IsBuffActiveTooltip:ClearLines();
		IsBuffActiveTooltip:SetInventoryItem("player",GetInventorySlotInfo("MainHandSlot"));
		for i = 1,IsBuffActiveTooltip:NumLines() do
			if string.find((getglobal("IsBuffActiveTooltipTextLeft"..i):GetText() or ""),buffname) and string.len(getglobal("IsBuffActiveTooltipTextLeft"..i):GetText()) == string.len(buffname) then
				return true
			end;
		end
		return false
	end
	if string.lower(unit) == "offhand" then
		IsBuffActiveTooltip:ClearLines();
		IsBuffActiveTooltip:SetInventoryItem("player",GetInventorySlotInfo("SecondaryHandSlot"));
		for i=1,IsBuffActiveTooltip:NumLines() do
			if string.find((getglobal("IsBuffActiveTooltipTextLeft"..i):GetText() or ""),buffname) and string.len(getglobal("IsBuffActiveTooltipTextLeft"..i):GetText()) == string.len(buffname) then
				return true
			end;
		end
		return false
	end
  local i = 1;
  while UnitBuff(unit, i) do 
		IsBuffActiveTooltip:ClearLines();
		IsBuffActiveTooltip:SetUnitBuff(unit,i);
    if string.find(IsBuffActiveTooltipTextLeft1:GetText() or "", buffname) and string.len(IsBuffActiveTooltipTextLeft1:GetText()) == string.len(buffname) then
	  return true, i
    end;
    i = i + 1;
  end;
  local i = 1;
  while UnitDebuff(unit, i) do 
		IsBuffActiveTooltip:ClearLines();
		IsBuffActiveTooltip:SetUnitDebuff(unit,i);
    if string.find(IsBuffActiveTooltipTextLeft1:GetText() or "", buffname) and string.len(IsBuffActiveTooltipTextLeft1:GetText()) == string.len(buffname) then
      return true, i
    end;
    i = i + 1;
  end;
end
