#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%


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

:CX:\alpha::alpha()
:CX:\beta::beta()
:CX:\gamma::gamma()
:CX:\delta::delta()
:CX:\epislon::epislon()
:CX:\zeta::zeta()
:CX:\eta::eta()
:CX:\theta::theta()
:CX:\iota::iota()
:CX:\kappa::kappa()
:CX:\lambda::lambda()
:CX:\mu::mu()
:CX:\nu::nu()
:CX:\xi::xi()
:CX:\omicron::omicron()
:CX:\pi::pi()
:CX:\rho::rho()
:CX:\sigma::sigma()
:CX:\tau::tau()
:CX:\upsilon::upsilon()
:CX:\phi::phi()
:CX:\chi::chi()
:CX:\psi::psi()
:CX:\omega::omega()

:CX:\Alpha::BigAlpha()
:CX:\Beta::BigBeta()
:CX:\Gamma::BigGamma()
:CX:\Delta::BigDelta()
:CX:\Epislon::BigEpislon()
:CX:\Zeta::BigZeta()
:CX:\Eta::BigEta()
:CX:\Theta::BigTheta()
:CX:\Iota::BigIota()
:CX:\Kappa::BigKappa()
:CX:\Lambda::BigLambda()
:CX:\Mu::BigMu()
:CX:\Nu::BigNu()
:CX:\Xi::BigXi()
:CX:\Omicron::BigOmicron()
:CX:\Pi::BigPi()
:CX:\Rho::BigRho()
:CX:\Sigma::BigSigma()
:CX:\Tau::BigTau()
:CX:\Upsilon::BigUpsilon()
:CX:\Phi::BigPhi()
:CX:\Chi::BigChi()
:CX:\Psi::BigPsi()
:CX:\Omega::BigOmega()

^NumpadDown::Suspend, Toggle
