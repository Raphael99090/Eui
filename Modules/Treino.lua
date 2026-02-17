local Treino = {}

function Treino.Iniciar(Aba)
    local Config = { Modo = "Canguru", Qtd = 130, Delay = 1.4 }
    local Rodando = false

    Aba:CriarLabel("--- SISTEMA DE TREINO V6 ---")
    
    Aba:CriarDropdown("Exercício", {"Canguru", "Flexão", "Polichinelo"}, function(v)
        Config.Modo = v
    end)

    Aba:CriarSlider("Quantidade", 1, 500, 130, function(v)
        Config.Qtd = v
    end)

    Aba:CriarBotao("INICIAR", function()
        Rodando = true
        task.spawn(function()
            for i = 1, Config.Qtd do
                if not Rodando then break end
                local msg = "/" .. Config.Modo .. " " .. i
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
                task.wait(Config.Delay)
            end
        end)
    end)

    Aba:CriarBotao("PARAR", function()
        Rodando = false
    end)
end

return Treino
