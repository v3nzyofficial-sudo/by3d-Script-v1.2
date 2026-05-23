-- ═══════════════════════════════════════════════════════════════════════════
-- KEYBINDS TAB WITH CROSSHAIR PREVIEW, SLIDER & HITSOUND DROPDOWN
-- ═══════════════════════════════════════════════════════════════════════════

local keybindsTab = create("ScrollingFrame", {
	Name = "KeybindsTab",
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundTransparency = 1,
	ScrollBarThickness = 4,
	ScrollBarImageColor3 = CONFIG.ACCENT,
	CanvasSize = UDim2.new(0, 0, 0, 0),
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	Visible = false,
	ZIndex = 13
}, contentContainer)

create("UIListLayout", {
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 8)
}, keybindsTab)

-- 1. КОНТЕЙНЕР НАСТРОЕК ПРИЦЕЛА (LayoutOrder = 0)
local crosshairSettingsFrame = create("Frame", {
	Name = "CrosshairSettingsFrame",
	Size = UDim2.new(1, 0, 0, 100),
	BackgroundColor3 = CONFIG.BACKGROUND_SECONDARY,
	LayoutOrder = 0,
	ZIndex = 14
}, keybindsTab)
create("UICorner", {CornerRadius = UDim.new(0, 6)}, crosshairSettingsFrame)
create("UIStroke", {Color = CONFIG.BORDER, Thickness = 1}, crosshairSettingsFrame)

-- Заголовок секции настроек прицела
create("TextLabel", {
	Size = UDim2.new(1, -20, 0, 25),
	Position = UDim2.new(0, 15, 0, 8),
	BackgroundTransparency = 1,
	Text = "НАСТРОЙКА ПРИЦЕЛА / CROSSHAIR SETTINGS",
	TextColor3 = CONFIG.ACCENT,
	TextSize = 12,
	Font = Enum.Font.GothamBlack,
	TextXAlignment = Enum.TextXAlignment.Left,
	ZIndex = 15
}, crosshairSettingsFrame)

-- Окно интерактивного предпросмотра прицела (Preview Box)
local previewBox = create("Frame", {
	Name = "PreviewBox",
	Size = UDim2.new(0, 54, 0, 54),
	Position = UDim2.new(0, 15, 0, 36),
	BackgroundColor3 = CONFIG.BACKGROUND,
	ZIndex = 15
}, crosshairSettingsFrame)
create("UICorner", {CornerRadius = UDim.new(0, 4)}, previewBox)
create("UIStroke", {Color = CONFIG.BORDER, Thickness = 1}, previewBox)

-- Точка внутри окна предпросмотра
local previewDot = create("Frame", {
	Name = "PreviewDot",
	Size = UDim2.new(0, 4, 0, 4),
	Position = UDim2.new(0.5, 0, 0.5, 0),
	AnchorPoint = Vector2.new(0.5, 0.5),
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	ZIndex = 17
}, previewBox)
create("UICorner", {CornerRadius = UDim.new(1, 0)}, previewDot)
create("UIStroke", {Color = Color3.fromRGB(0, 0, 0), Thickness = 1, Transparency = 0.2}, previewDot)

-- Кольцо внутри окна предпросмотра
local previewRing = create("Frame", {
	Name = "PreviewRing",
	Size = UDim2.new(0, 24, 0, 24),
	Position = UDim2.new(0.5, 0, 0.5, 0),
	AnchorPoint = Vector2.new(0.5, 0.5),
	BackgroundTransparency = 1,
	ZIndex = 16
}, previewBox)
create("UICorner", {CornerRadius = UDim.new(1, 0)}, previewRing)
local previewRingStroke = create("UIStroke", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1.5, Transparency = 0.1}, previewRing)

-- Текст с отображением процентов размера
local sliderLabel = create("TextLabel", {
	Size = UDim2.new(0, 250, 0, 16),
	Position = UDim2.new(0, 85, 0, 38),
	BackgroundTransparency = 1,
	Text = "Размер прицела / Size: 100%",
	TextColor3 = CONFIG.TEXT_PRIMARY,
	TextSize = 13,
	Font = Enum.Font.GothamSemibold,
	TextXAlignment = Enum.TextXAlignment.Left,
	ZIndex = 15
}, crosshairSettingsFrame)

-- Дорожка ползунка (Slider Track)
local sliderTrack = create("Frame", {
	Name = "SliderTrack",
	Size = UDim2.new(1, -105, 0, 6),
	Position = UDim2.new(0, 85, 0, 66),
	BackgroundColor3 = CONFIG.BACKGROUND,
	ZIndex = 15
}, crosshairSettingsFrame)
create("UICorner", {CornerRadius = UDim.new(1, 0)}, sliderTrack)

-- Заполнение ползунка (Slider Fill)
local sliderFill = create("Frame", {
	Name = "SliderFill",
	Size = UDim2.new(0.35, 0, 1, 0),
	BackgroundColor3 = CONFIG.ACCENT,
	ZIndex = 16
}, sliderTrack)
create("UICorner", {CornerRadius = UDim.new(1, 0)}, sliderFill)

-- Интерактивная круглая кнопка триггера (Slider Trigger)
local sliderButton = create("ImageButton", {
	Name = "SliderButton",
	Size = UDim2.new(0, 16, 0, 16),
	Position = UDim2.new(0.35, -8, 0.5, -8),
	BackgroundColor3 = CONFIG.TEXT_PRIMARY,
	ZIndex = 17
}, sliderTrack)
create("UICorner", {CornerRadius = UDim.new(1, 0)}, sliderButton)
create("UIStroke", {Color = CONFIG.ACCENT, Thickness = 1.5}, sliderButton)


-- 2. КОНТЕЙНЕР НАСТРОЕК ЗВУКОВ ПОПАДАНИЯ (LayoutOrder = 1)
local hitsoundFrame = create("Frame", {
	Name = "HitsoundSettingsFrame",
	Size = UDim2.new(1, 0, 0, 50),
	BackgroundColor3 = CONFIG.BACKGROUND_SECONDARY,
	LayoutOrder = 1,
	ClipsDescendants = true,
	ZIndex = 14
}, keybindsTab)
create("UICorner", {CornerRadius = UDim.new(0, 6)}, hitsoundFrame)
create("UIStroke", {Color = CONFIG.BORDER, Thickness = 1}, hitsoundFrame)

create("TextLabel", {
	Size = UDim2.new(0, 200, 0, 50),
	Position = UDim2.new(0, 15, 0, 0),
	BackgroundTransparency = 1,
	Text = "Звук попадания / Hitsound",
	TextColor3 = CONFIG.TEXT_PRIMARY,
	TextSize = 13,
	Font = Enum.Font.GothamSemibold,
	TextXAlignment = Enum.TextXAlignment.Left,
	ZIndex = 15
}, hitsoundFrame)

local dropdownBtn = create("TextButton", {
	Name = "DropdownButton",
	Size = UDim2.new(0, 140, 0, 32),
	Position = UDim2.new(1, -155, 0, 9),
	BackgroundColor3 = CONFIG.BACKGROUND,
	Text = State.currentHitsoundName .. "  ▼",
	TextColor3 = CONFIG.ACCENT,
	TextSize = 13,
	Font = Enum.Font.GothamBold,
	ZIndex = 16
}, hitsoundFrame)
create("UICorner", {CornerRadius = UDim.new(0, 4)}, dropdownBtn)
create("UIStroke", {Color = CONFIG.BORDER, Thickness = 1}, dropdownBtn)

local dropdownList = create("Frame", {
	Name = "DropdownList",
	Size = UDim2.new(0, 140, 0, 0),
	BackgroundTransparency = 1,
	ClipsDescendants = true,
	ZIndex = 17
}, hitsoundFrame)

create("UIListLayout", {
	SortOrder = Enum.SortOrder.LayoutOrder,
	Padding = UDim.new(0, 4)
}, dropdownList)

local isDropdownOpen = false

local function toggleHitsoundDropdown()
	isDropdownOpen = not isDropdownOpen
	local targetListHeight = isDropdownOpen and (#State.hitsoundPresets * 34) or 0
	local targetMainHeight = isDropdownOpen and (54 + targetListHeight) or 50

	tween(hitsoundFrame, {Size = UDim2.new(1, 0, 0, targetMainHeight)}, 0.25)
	tween(dropdownList, {Size = UDim2.new(0, 140, 0, targetListHeight)}, 0.25)

	dropdownBtn.Text = State.currentHitsoundName .. (isDropdownOpen and "  ▲" or "  ▼")
end

dropdownBtn.MouseButton1Click:Connect(toggleHitsoundDropdown)

for idx, preset in ipairs(State.hitsoundPresets) do
	local optionBtn = create("TextButton", {
		Name = preset.name .. "Option",
		Size = UDim2.new(1, 0, 0, 30),
		BackgroundColor3 = CONFIG.BACKGROUND,
		Text = preset.name,
		TextColor3 = (State.currentHitsoundName == preset.name) and CONFIG.ACCENT or CONFIG.TEXT_SECONDARY,
		TextSize = 12,
		Font = Enum.Font.GothamSemibold,
		LayoutOrder = idx,
		ZIndex = 18
	}, dropdownList)
	create("UICorner", {CornerRadius = UDim.new(0, 4)}, optionBtn)
	create("UIStroke", {Color = CONFIG.BORDER, Thickness = 1}, optionBtn)

	optionBtn.MouseButton1Click:Connect(function()
		dispatch("SET_HITSOUND", {name = preset.name, id = preset.id})
		toggleHitsoundDropdown()

		local testSound = Instance.new("Sound")
		testSound.SoundId = preset.id
		testSound.Volume = 0.5
		testSound.Parent = game:GetService("SoundService")
		testSound:Play()
		game:GetService("Debris"):AddItem(testSound, 2)
	end)
end

local function syncHitsoundVisuals()
	dropdownBtn.Text = State.currentHitsoundName .. (isDropdownOpen and "  ▲" or "  ▼")

	for _, child in ipairs(dropdownList:GetChildren()) do
		if child:IsA("TextButton") then
			local isCurrent = (child.Text == State.currentHitsoundName)
			child.TextColor3 = isCurrent and CONFIG.ACCENT or CONFIG.TEXT_SECONDARY
		end
	end

	if screenGui then
		screenGui:SetAttribute("CurrentHitsoundId", State.currentHitsoundId)
	end
end


-- 3. РАЗДЕЛИТЕЛЬ СЕКЦИЙ (LayoutOrder = 2)
create("TextLabel", {
	Size = UDim2.new(1, 0, 0, 24),
	BackgroundTransparency = 1,
	Text = "НАЗНАЧЕНИЕ КЛАВИШ / KEYBINDS",
	TextColor3 = CONFIG.ACCENT,
	TextSize = 12,
	Font = Enum.Font.GothamBlack,
	TextXAlignment = Enum.TextXAlignment.Left,
	LayoutOrder = 2,
	ZIndex = 14
}, keybindsTab)


-- 4. СПИСОК НАЗНАЧЕНИЙ КЛАВИШ (LayoutOrder начинается с i + 2)
for i, bind in ipairs(State.keybinds) do
	local row = create("Frame", {
		Name = bind.key .. "Bind",
		Size = UDim2.new(1, 0, 0, 50),
		BackgroundColor3 = CONFIG.BACKGROUND_SECONDARY,
		LayoutOrder = i + 2, -- Сдвигаем на 2 позиции вниз, чтобы освободить место слайдеру и хитсаунду
		ZIndex = 14
	}, keybindsTab)

	create("UICorner", {CornerRadius = UDim.new(0, 6)}, row)

	-- Key display
	local keyDisplay = create("Frame", {
		Size = UDim2.new(0, 60, 0, 34),
		Position = UDim2.new(0, 10, 0.5, -17),
		BackgroundColor3 = CONFIG.BACKGROUND,
		ZIndex = 15
	}, row)

	create("UICorner", {CornerRadius = UDim.new(0, 4)}, keyDisplay)
	create("UIStroke", {Color = CONFIG.ACCENT, Thickness = 1.5}, keyDisplay)

	create("TextLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = bind.key,
		TextColor3 = CONFIG.ACCENT,
		TextSize = (bind.key == "SPACE" or bind.key == "SHIFT" or bind.key == "ALT") and 10 or 16,
		Font = Enum.Font.GothamBold,
		ZIndex = 16
	}, keyDisplay)

	-- Action text
	create("TextLabel", {
		Size = UDim2.new(1, -90, 0, 20),
		Position = UDim2.new(0, 80, 0, 8),
		BackgroundTransparency = 1,
		Text = bind.titleRu,
		TextColor3 = CONFIG.TEXT_PRIMARY,
		TextSize = 14,
		Font = Enum.Font.GothamSemibold,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 15
	}, row)

	create("TextLabel", {
		Size = UDim2.new(1, -90, 0, 16),
		Position = UDim2.new(0, 80, 0, 28),
		BackgroundTransparency = 1,
		Text = bind.titleEn,
		TextColor3 = CONFIG.TEXT_MUTED,
		TextSize = 11,
		Font = Enum.Font.Gotham,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 15
	}, row)
end
