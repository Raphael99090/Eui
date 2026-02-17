local Visual = {}

function Visual.Iniciar(Aba)
    Aba:CriarLabel("--- AJUSTES VISUAIS ---")

    Aba:CriarToggle("FPS Boost (Anti-Lag)", false, function(state)
        if state then _G.Functions.AntiLag() end
    end)

    Aba:CriarBotao("Tela Preta (Economia)", function()
        local bg = Instance.new("Frame", game.CoreGui:FindFirstChild("1NX_UI"))
        bg.Size = UDim2.new(1,0,1,0)
        bg.BackgroundColor3 = Color3.new(0,0,0)
        bg.ZIndex = 100
        local btn = Instance.new("TextButton", bg)
        btn.Size = UDim2.new(1,0,0,50)
        btn.Text = "CLIQUE PARA SAIR DA TELA PRETA"
        btn.MouseButton1Click:Connect(function() bg:Destroy() end)
    end)
end

return Visual

