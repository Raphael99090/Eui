--[[
    1NXITER FRAMEWORK - INITIALIZER
    Repositório: Eui
]]

local Repo = "Raphael99090/Eui"
local Branch = "main"
local BaseURL = "https://raw.githubusercontent.com/" .. Repo .. "/" .. Branch .. "/"

-- Gerenciador de Carregamento (Protege contra erros de link/internet)
local function SafeImport(Path)
    local Success, Result = pcall(function()
        return loadstring(game:HttpGet(BaseURL .. Path .. ".lua"))()
    end)
    
    if Success and Result then
        return Result
    else
        warn("⚠️ [1NX_ERROR] Falha ao carregar: " .. Path)
        print("Erro: ", Result)
        return nil
    end
end

-- 1. Carregar Componentes do Core
print("---------------------------------------")
print("🚀 Iniciando 1NXITER Framework...")

_G.Library = SafeImport("Core/Library")
_G.Functions = SafeImport("Core/Functions") -- Certifique-se de criar este arquivo na pasta Core

if not _G.Library then 
    error("❌ Biblioteca base não encontrada. Execução abortada.")
    return 
end

-- 2. Configurações Globais (Acessíveis por todos os scripts)
_G.1NX_Configs = {
    Version = "5.1",
    Developer = "Raphael99090",
    Theme = "RedDark"
}

-- 3. Executar o Módulo Principal (Seu script de treino, por exemplo)
-- Aqui você escolhe qual script da pasta Modules quer rodar
local MainModule = SafeImport("Modules/Treino_V6")

if MainModule and type(MainModule) == "table" and MainModule.Iniciar then
    MainModule.Iniciar()
else
    -- Se não tiver módulo de treino, ele abre a Janela de Boas-vindas padrão
    local Win = _G.Library:CriarJanela("1NXITER HUB")
    local Tab = Win:CriarAba("Home")
    Tab:CriarPerfil()
    Tab:CriarLabel("Bem-vindo ao Framework!")
    _G.Library:Notificar("Sistema", "Framework carregado sem módulo específico.", 5)
end

print("✅ Framework pronto!")
print("---------------------------------------")

