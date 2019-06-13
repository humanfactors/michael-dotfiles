#Include %A_ScriptDir%\emacs-key-sequence.ahk
#SingleInstance, force

$!\::
map:=Object()
map.insert("!\a", "alpha")
map.insert("!\b", "beta")
map.insert("!\c", "gamma")
map.insert("!\d", "delta")
map.insert("!\e", "epislon")
map.insert("!\z", "zeta")
map.insert("!\h", "eta")
map.insert("!\j", "theta")
map.insert("!\i", "iota")
map.insert("!\k", "kappa")
map.insert("!\l", "lambda")
map.insert("!\m", "mu")
map.insert("!\n", "nu")
map.insert("!\q", "xi")
map.insert("!\o", "omicron")
map.insert("!\p", "pi")
map.insert("!\r", "rho")
map.insert("!\s", "sigma")
map.insert("!\t", "tau")
map.insert("!\u", "upsilon")
map.insert("!\f", "phi")
map.insert("!\x", "chi")
map.insert("!\y", "psi")
map.insert("!\w", "omega")
prefixKey("!\",map)
return

$!|::
map:=Object()
map.insert("!|a", "BigAlpha")
map.insert("!|b", "BigBeta")
map.insert("!|g", "BigGamma")
map.insert("!|d", "BigDelta")
map.insert("!|e", "BigEpislon")
map.insert("!|z", "BigZeta")
map.insert("!|h", "BigEta")
map.insert("!|j", "BigTheta")
map.insert("!|i", "BigIota")
map.insert("!|k", "BigKappa")
map.insert("!|l", "BigLambda")
map.insert("!|m", "BigMu")
map.insert("!|n", "BigNu")
map.insert("!|q", "BigXi")
map.insert("!|o", "BigOmicron")
map.insert("!|p", "BigPi")
map.insert("!|r", "BigRho")
map.insert("!|s", "BigSigma")
map.insert("!|t", "BigTau")
map.insert("!|u", "BigUpsilon")
map.insert("!|f", "BigPhi")
map.insert("!|x", "BigChi")
map.insert("!|y", "BigPsi")
map.insert("!|w", "BigOmega")
prefixKey("!|",map)
return

alpha() {
    Send {U+03B1}
}

beta() {
    Send {U+03B2}
}
gamma() {
    Send {U+03B3}
}
delta() {
    Send {U+03B4}
}
epislon() {
    Send {U+03B5}
}
zeta() {
    Send {U+03B6}
}
eta() {
    Send {U+03B7}
}
theta() {
    Send {U+03B8}
}
iota() {
    Send {U+03B9}
}
kappa() {
    Send {U+03BA}
}
lambda() {
    Send {U+03BB}
}
mu() {
    Send {U+03BC}
}
nu() {
    Send {U+03BD}
}
xi() {
    Send {U+03BE}
}
omicron() {
    Send {U+03BF}
}
pi() {
    Send {U+03C0}
}
rho() {
    Send {U+03C1}
}
sigma() {
    Send {U+03C3}
}
finalsigma() {
    Send {U+03C2}
}
tau() {
    Send {U+03C4}
}
upsilon() {
    Send {U+03C5}
}
phi() {
    Send {U+03C6}
}
chi() {
    Send {U+03C7}
}
psi() {
    Send {U+03C8}
}
omega() {
    Send {U+03C9}
}

BigAlpha() {
    Send {U+0391} 
}
BigBeta() {
    Send {U+0392} 
}
BigGamma() {
    Send {U+0393} 
}
BigDelta() {
    Send {U+0394} 
}
BigEpislon() {
    Send {U+0395} 
}
BigZeta() {
    Send {U+0396} 
}
BigEta() {
    Send {U+0397} 
}
BigTheta() {
    Send {U+0398} 
}
BigIota() {
    Send {U+0399} 
}
BigKappa() {
    Send {U+039A} 
}
BigLambda() {
    Send {U+039B} 
}
BigMu() {
    Send {U+039C} 
}
BigNu() {
    Send {U+039D} 
}
BigXi() {
    Send {U+039E} 
}
BigOmicron() {
    Send {U+039F} 
}
BigPi() {
    Send {U+03A0} 
}
BigRho() {
    Send {U+03A1} 
}
BigSigma() {
    Send {U+03A3} 
}
BigTau() {
    Send {U+03A4} 
}
BigUpsilon() {
    Send {U+03A5} 
}
BigPhi() {
    Send {U+03A6} 
}
BigChi() {
    Send {U+03A7} 
}
BigPsi() {
    Send {U+03A8} 
}
BigOmega() {
    Send {U+03A9} 
}
