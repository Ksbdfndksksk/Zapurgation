# Wii Funkin Animado
Sim, usei o port do luckydog de base pra ver esse trem, obviamente né? pra que eu iria portar de novo?...
Não... Não irei traduzir isso para inglês se quiser tradução, jogue no google tradutor por motivos de:
Primeiro eu sou BR
Segundo, eu não sou Gringo!!!
Terceiro, esse tutorial contem coisas da Mic'd Up
Quarto, você pode adaptar isso da forma como tu quiser
Quinto, essa versão é a adaptação da Zoiodness para PC e Mobile com trocentas correções de performance, downscroll liberado, e outras cositas mas.

Sexto, sim eu já usei esse tutorial antes kkkkkk

# Como compilar essa parada toda?
Bom... Vou copiar e colar um trem aqui que resolve, tem mais uns adicionais, mas que eu também vou colocar aqui.

Compilar o mod te dá acesso a pasta `/source`, permitindo que você faça coisas legais com algo em código aberto, ou então, sua própria leitura da animação jogável!

(I recommend having a good idea on how to program. Compiling the mod is not for everyone!) - Frase Original do cara que escreveu isso
E eu digo que não nescessariamente, eu nunca vi esses trens na vida, e deu pra fazer algo legal, então apenas digo: Vá com força meu Nobre!

### **Se você realmente quiser compilar, continue a leitura, se não... VAZA!!!**

# Instalando os programas nescessários

Primeiro, você precisa instalar Haxe e HaxelFlixel, FNF utilizou essa linguagem de programação não me julgue, julgue o NinjaMuffin99, ou não né...

1. [Instale Haxe 4.1.5](https://haxe.org/download/version/4.1.5/) (Baixe a versão 4.1.5 ao invés da 4.2.0 ou então baixe isso e corra o risco de algumas extensões como a webm não funcionarem propriamente.)
2. [Instale HaxeFlixel](https://haxeflixel.com/documentation/install-haxeflixel/) Depois de instalar Haxe

Outras paradas que tu vai precisar (Geralmente isso varia de mod pra mod, então sempre leia o  `Project.xml` para saber exatamente o que baixar:
```
flixel
flixel-addons
flixel-ui
hscript
newgrounds
```
Para instalar basta abrir o prompt de comando e digitar: `haxelib install [library]` 
exemplo: `haxelib install newgrounds` ou `haxelib install flixel`.

Você tambem vai precisar de umas coisinhas a mais: (Sim isso tudo é nescessário)
1. Baixe [git-scm] em (https://git-scm.com/downloads).
2. Siga as instruções da pagina.
3. Rode o código no cmd `haxelib git polymod https://github.com/larsiusprime/polymod.git` para instalar o Polymod.
4. Rode o código no cmd `haxelib git discord_rpc https://github.com/Aidan63/linc_discord-rpc` para instalar Discord RPC.
5. Optional, mas eu recomendo: - Rode o código no cmd `haxelib git flixel-addons https://github.com/HaxeFlixel/flixel-addons` para atualizar Flixel-Addons. Foi isso que corrigiu o bug da animação jogável.

Agora sim, dá pra dale, continue o tutorial.

# Adding `APIStuff.hx` into `/source` (A partir de agora, não irei mais traduzir)

The API keys of the mod were gitignored so no one could post fake high scores onto the leaderboards in Newgrounds. Unfortunately, because this mod requires the `API` and `EncKey` values to compile, you will need to add a file called `APIStuff.hx` into `/source`.

1. Create a new text file called `APIStuff.hx` inside of the `/source` folder.
2. Copy the following text:
```haxe
package;
class APIStuff
{
	public static var API:String = "";
	public static var EncKey:String = "";
}
```
3. Paste the text into the APIStuff.hx file and save the file.

You should be good from there! Now, onto compiling!

# Compiling the Mod

<p align="center">
	<a href="https://lime-ml.readthedocs.io/en/latest/" target="_blank"><img src="/art/limeLogo.png"></a>
</p>

## HTML Building:

HTML Compiling currently does not work as Mic'd Up! currently requires desktop-only libraries to function properly.

## Desktop Building:

Desktop building can be a bit tedious. Each different version requires a different setup.

### Linux Building:

1. Open your machine's command prompt/terminal and navigate to your root folder of the mod. [An easy guide can be found here!](https://ninjamuffin99.newgrounds.com/news/post/1090480)
2. Type `lime build linux -debug` to build the Linux version of the mod.
3. Type `lime run linux -debug` to run the Linux version of the mod from the command prompt/terminal. (You can also run the mod from `funkin/export/debug/linux/bin`)

### Mac Building:

1. Open your machine's command prompt/terminal and navigate to your root folder of the mod. [An easy guide can be found here!](https://ninjamuffin99.newgrounds.com/news/post/1090480)
2. Type `lime build mac -debug` to build the Mac version of the mod.
3. Type `lime run mac -debug` to run the Mac version of the mod from the command prompt/terminal. (You can also run the mod from `funkin/export/debug/mac/bin`)

### Windows Building:
**THIS METHOD REQUIRES AROUND 22 GIGABYTES OF STORAGE.** (Só voltei aqui pra dizer que sim, esses são os famosos 23 GIGAS QUE VOCÊ PRECISA BAIXAR)
1. Install [Visual Studio Community 2019](https://visualstudio.microsoft.com/downloads/).
2. Open the installer and go to the individual workloads tab and download the following:
```
* C++ CMake tools for windows 
* C++ Profiling tools 
* C++ ATL for v142 build tools (x86 & x64)
* C++ MFC for v142 build tools (x86 & x64)
* C++/CLI support for v142 build tools (14.21)
* C++ Modules for v142 build tools (x64/x86)
* Clang Compiler for Windows
* MSVC v140 - VS 2015 C++ build tools (v14.00) 
* MSVC v141 - VS 2017 C++ x64/x86 build tools
* MSVC v142 - VS 2019 C++ x64/x86 build tools
* Windows 10 SDK (10.0.16299.0)
* Windows 10 SDK (10.0.17134.0)
* Windows SDK (10.0.17763.0)
```
3. Wait for the install to finish, which might take a while.
4. Open your machine's command prompt/terminal and navigate to your root folder of the mod. [An easy guide can be found here!](https://ninjamuffin99.newgrounds.com/news/post/1090480)
5. Once everything is installed, type `lime build windows -debug` to build the windows version of the mod.
6. Type `lime run windows -debug` after the mod is compiled to run the windows version of the mod. (You can also run the mod from `funkin/export/debug/windows/bin`)

# Yay você terminou!

# Agradecimentos por parte do mod base deste
- [Fizzd/Hafiz](https://twitter.com/7thbeat) Stems and allowing me to do this lol
- [Jenny](https://twitter.com/megaminerjenny) Help wit the background effects
- [gwebdev](https://github.com/GrowtopiaFli) Video code (Inclusive, recomendo que você passe aqui e leia sobre o webm se quiser saber mais sobre as cutscenes em vídeo)
