# Verifica dei privilegi di amministratore
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "Questo script richiede privilegi di amministratore. Eseguilo come amministratore."
    exit
}

# Path del file hosts
$hostsPath = "$env:windir\System32\drivers\etc\hosts"

# Indirizzi IP da bloccare (127.0.0.1 è l'indirizzo di loopback che blocca l'accesso ai siti)
$blockEntries = @"
127.0.0.1    openai.com
127.0.0.1    chat.openai.com
127.0.0.1    www.chat.openai.com
127.0.0.1    api.openai.com
127.0.0.1    ai.google.com
127.0.0.1    bard.google.com
127.0.0.1    gemini.google.com
127.0.0.1    api.ai.google.com
127.0.0.1    azure.microsoft.com
127.0.0.1    copilot.microsoft.com
127.0.0.1    copilot.github.com
127.0.0.1    api.copilot.microsoft.com
127.0.0.1    ibm.com
127.0.0.1    watson.ibm.com
127.0.0.1    api.watson.ibm.com
127.0.0.1    api.ai
127.0.0.1    wit.ai
127.0.0.1    api.wit.ai
127.0.0.1    chatbotslife.com
127.0.0.1    nlp.stanford.edu
127.0.0.1    huggingface.co
127.0.0.1    api.huggingface.co
127.0.0.1    anthropic.com
127.0.0.1    api.anthropic.com
127.0.0.1    deepmind.com
127.0.0.1    api.deepmind.com
127.0.0.1    x.ai
127.0.0.1    replika.ai
127.0.0.1    api.replika.ai
127.0.0.1    ai.facebook.com
127.0.0.1    api.facebook.ai
127.0.0.1    ai.intel.com
127.0.0.1    cambridgeconsultants.com
127.0.0.1    affects.ai
127.0.0.1    arago.co
127.0.0.1    sense.ly
127.0.0.1    cloud.google.com/products/ai
127.0.0.1    convo.ai
127.0.0.1    artificial-solutions.com
127.0.0.1    fetch.ai
127.0.0.1    api.fetch.ai
127.0.0.1    graphcore.ai
127.0.0.1    orbitai.com
127.0.0.1    ai.cmu.edu
127.0.0.1    synopsys.ai
127.0.0.1    vicarious.com
127.0.0.1    soundhound.com
127.0.0.1    wolframalpha.com
127.0.0.1    assemblyai.com
127.0.0.1    api.assemblyai.com
127.0.0.1    speechmatics.com
127.0.0.1    braincorp.com
127.0.0.1    elementai.com
127.0.0.1    zymergen.com
127.0.0.1    mimiktechnology.com
127.0.0.1    singularitynet.io
127.0.0.1    api.singularitynet.io
127.0.0.1    cloudfactory.com
127.0.0.1    indico.io
127.0.0.1    api.indico.io
127.0.0.1    landing.ai
127.0.0.1    roboticprocessautomation.ai
127.0.0.1    scalablepath.com
127.0.0.1    snips.ai
127.0.0.1    starmind.ai
127.0.0.1    swoopdatamanagement.com
127.0.0.1    teller.io
127.0.0.1    vize.ai
127.0.0.1    xnor.ai
127.0.0.1    yhat.com
127.0.0.1    zenedge.com
127.0.0.1    mightygpt.com
127.0.0.1    perplexity.ai
127.0.0.1    cohere.ai
127.0.0.1    api.cohere.ai
127.0.0.1    seekr.com
127.0.0.1    meltwater.com
127.0.0.1    blackbox.ai
127.0.0.1    www.blackbox.ai
127.0.0.1    api.blackbox.ai
127.0.0.1    chatgpt.com
127.0.0.1    www.chatgpt.com
"@

# Leggi il contenuto attuale del file hosts
$hostsContent = Get-Content -Path $hostsPath -Raw

# Aggiungi le nuove voci al file hosts
if ($hostsContent -notmatch $blockEntries) {
    Add-Content -Path $hostsPath -Value $blockEntries
    Write-Output "Indirizzi delle intelligenze artificiali bloccati con successo."
} else {
    Write-Output "Le voci per bloccare gli indirizzi delle intelligenze artificiali sono già presenti nel file hosts."
}
