# ═══════════════════════════════════════════
# NEUROBRIDGE BRAND FIX SCRIPT
# Run from: C:\Users\Mo\Downloads\neuro-bridge-v2
# ═══════════════════════════════════════════

$file = "index.html"
$content = [System.IO.File]::ReadAllText("$(Get-Location)\$file", [System.Text.Encoding]::UTF8)

# ── 1. FIX BROKEN ENCODED CHARACTERS ──
$content = $content -replace '-€"', '—'
$content = $content -replace '-€™', "'"
$content = $content -replace '-†'', '→'
$content = $content -replace '-·', '·'
$content = $content -replace "'‰", '✅'
$content = $content -replace '"š', '✅'
$content = $content -replace '"¢', '✅'
$content = $content -replace '"±', '▶'
$content = $content -replace '"Š', '💡'
$content = $content -replace "\"'", '🔑'
$content = $content -replace '¤Ÿ', '🤟'
$content = $content -replace '«', '🏠'
$content = $content -replace '§', '💡'
$content = $content -replace "'‹", '👋'
$content = $content -replace "'ª", '👨‍👩‍👧'
$content = $content -replace 'Ž¨', '🎨'
$content = $content -replace 'Ž', '🍎'
$content = $content -replace "š€", '🚀'
$content = $content -replace "'©«", '👩‍🏫'
$content = $content -replace "Ž¯", '🎯'
$content = $content -replace '-©', '©'
$content = $content -replace 'Ã—', '×'

# ── 2. REPLACE ALL PURPLE WITH MCF BRAND COLOURS ──

# Primary purple → MCF Orange
$content = $content -replace '#7C3AED', '#FF5F00'
$content = $content -replace '#6D28D9', '#EB001B'
$content = $content -replace '#8B5CF6', '#F79E1B'

# Purple rgba values → Orange rgba
$content = $content -replace 'rgba\(124,58,237,0\.3\)', 'rgba(255,95,0,0.3)'
$content = $content -replace 'rgba\(124,58,237,0\.2\)', 'rgba(255,95,0,0.2)'
$content = $content -replace 'rgba\(124,58,237,0\.1\)', 'rgba(255,95,0,0.1)'
$content = $content -replace 'rgba\(124,58,237,0\.4\)', 'rgba(255,95,0,0.4)'
$content = $content -replace 'rgba\(124,58,237,0\.5\)', 'rgba(255,95,0,0.5)'
$content = $content -replace 'rgba\(124,58,237', 'rgba(255,95,0'

# ── 3. FIX CSS ROOT VARIABLES ──
$oldVars = ':root \{[^}]*\}'
$newVars = ':root {
            --primary: #FF5F00;
            --primary-dark: #EB001B;
            --primary-light: #F79E1B;
            --mc-red: #EB001B;
            --mc-orange: #FF5F00;
            --mc-yellow: #F79E1B;
            --mc-black: #231F20;
            --mc-warm: #F5F2EE;
            --success: #10B981;
            --accent: #F79E1B;
            --accent-red: #EB001B;
            --bg-dark: #0F0F0F;
            --bg-card: #1A1A1A;
            --bg-light: #2A2A2A;
            --text-primary: #FFFFFF;
            --text-secondary: #D1D5DB;
            --text-muted: #9CA3AF;
            --border: #2A2A2A;
            --shadow-glow: 0 0 30px rgba(255,95,0,0.3);
            --shadow-hover: 0 30px 35px rgba(255,95,0,0.2);
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }'
$content = $content -replace $oldVars, $newVars

# ── 4. FIX LOGO — BIGGER, VISIBLE ──
$content = $content -replace '(?s)<a href="/" class="logo"[^>]*>.*?</a>', '<a href="/" class="logo" style="display:flex;align-items:center;gap:12px;text-decoration:none;"><img src="./logo.png" alt="NeuroBridge Africa" style="height:56px;width:auto;object-fit:contain;" onerror="this.style.display=`"none`""><span style="font-size:1.2rem;font-weight:800;background:linear-gradient(90deg,#FF5F00,#F79E1B);-webkit-background-clip:text;-webkit-text-fill-color:transparent;">NeuroBridge Africa</span></a>'

# ── 5. FIX FOOTER LOGO ──
$content = $content -replace '(?s)<div class="footer-logo">.*?</div>', '<div class="footer-logo" style="display:flex;align-items:center;gap:10px;margin-bottom:16px;"><img src="./logo.png" alt="NeuroBridge Africa" style="height:44px;width:auto;filter:brightness(0) invert(1);" onerror="this.style.display=`"none`""><span style="font-weight:800;color:white;font-size:1rem;">NEUROBRIDGE AFRICA</span></div>'

# ── 6. ADD MCF FELLOWSHIP BANNER AT TOP ──
$mcfBanner = '<div style="background:linear-gradient(90deg,#EB001B,#FF5F00,#F79E1B);padding:10px 5%;text-align:center;font-size:0.82rem;font-weight:700;color:white;letter-spacing:0.03em;">🏆 Applying for Mastercard Foundation EdTech Fellowship Kenya Cohort 4 · iHUB Kenya · Deadline April 10, 2026 · <a href="https://futureoflearning.ihub.co.ke/cohort-4/" target="_blank" style="color:white;text-decoration:underline;">Learn More →</a></div>'

$content = $content -replace '(<nav)', "$mcfBanner`n`$1"

# ── 7. FIX STATS TO USE REAL NUMBERS ──
$content = $content -replace 'data-target="950"', 'data-target="30"'
$content = $content -replace 'data-target="300"', 'data-target="60"'
$content = $content -replace 'data-target="150"', 'data-target="15"'
$content = $content -replace 'data-target="25"', 'data-target="3"'
$content = $content -replace '950\+', '30'
$content = $content -replace '300\+', '60'
$content = $content -replace '200k\+', '15'
$content = $content -replace '25 Counselors', '3 Partners'

# ── 8. FIX FOUNDER NAME ──
$content = $content -replace 'Anab Mohamed', 'Annab Mohamed'
$content = $content -replace 'Anab ', 'Annab '

# ── 9. FIX FOOTER YEAR ──
$content = $content -replace '2025 Ability Inclusion', '2026 Ability Inclusion'

# ── 10. SAVE WITH UTF-8 ENCODING ──
[System.IO.File]::WriteAllText("$(Get-Location)\$file", $content, [System.Text.Encoding]::UTF8)

Write-Host ""
Write-Host "═══════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  NEUROBRIDGE BRAND FIX COMPLETE ✅" -ForegroundColor Green
Write-Host "═══════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  ✅ Broken characters fixed" -ForegroundColor Green
Write-Host "  ✅ Purple → MCF Orange/Red/Yellow" -ForegroundColor Green
Write-Host "  ✅ Logo fixed and bigger" -ForegroundColor Green
Write-Host "  ✅ MCF fellowship banner added" -ForegroundColor Green
Write-Host "  ✅ Real stats (30/60/15/3)" -ForegroundColor Green
Write-Host "  ✅ Founder name: Annab Mohamed" -ForegroundColor Green
Write-Host "  ✅ Footer year: 2026" -ForegroundColor Green
Write-Host "═══════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Host "NEXT: git add . then git commit then git push" -ForegroundColor Yellow
