@echo off
TITLE Press Enter to Continue
color 0a
:menu
cls
echo.
echo Press Enter to Continue v.1.0
echo.
echo 1) Start
echo 2) Info
echo 3) Load Save
echo 4) Exit
set /p f=

if %f% == 1 goto setvar
if %f% == 2 goto info
if %f% == 3 goto load
if %f% == 4 goto exit
goto menu

:load
< save.sav (
set /p name=
set /p level=
set /p money=
set /p xp=
set /p xpcap=
set /p skill=
set /p enemy=
set /p enskill=
)
cls
echo.
echo Save file loaded!
pause >nul
goto home

:save
(
echo %name%
echo %level%
echo %money%
echo %xp%
echo %xpcap%
echo %skill%
echo %enemy%
echo %enskill%
) > save.sav
cls
echo.
echo Game Saved to save.sav
pause >nul
goto home

:setvar
set level=1
set money=50
set xp=0
set xpcap=10
set skill=5
set enemy=Damn Slime
set enskill=15
goto start

:start
cls
echo.
echo Welcome to Press Enter to Continue!
echo.
echo What's your name?
echo.
set /p name=Name: 
echo.
echo Well I wish you the best of luck, %name%.
echo.
echo Press a random button to continue...
pause >nul
goto home

:home
cls
echo.
echo User: %name%     Lvl: %level%     Money: $%money%
echo.
echo %xp%/%xpcap%     Skill: %skill%
echo -------------------------------------------------
echo.
echo 1) To the dungeon...
echo 2) The Cavern
echo 3) Save Game
echo 4) Patch Notes
echo 5) Log out
echo.
set /p f=You: 

if %f% == 1 goto dungeonlist
if %f% == 2 goto shop1
if %f% == 3 goto save
if %f% == 4 goto patchnotes
if %f% == 5 goto exit
goto home

:dungeonlist
if %skill% == 0 goto noskill
cls
echo.
echo Choose a dungeon
echo ----------------
echo 1) Levels 1 - 5
echo 2) Levels 6 - 10
echo 3) Levels 11 - 20 (NOT FINISHED)
echo 4) Levels 21 - 50 (NOT FINISHED)
echo 5) Levels 51+ (NOT FINISHED)
echo a) Go back
echo.
set /p f=Dungeon 

if %f% == 1 goto dungeon1
if %f% == 2 goto dungeon2
if %f% == 3 goto dungeon3
if %f% == 4 goto dungeon4
if %f% == 5 goto dungeon5
if %f% == a goto home
goto dungeonlist

:dungeon1
cls
echo.
echo User: %name%     Lvl: %level%     Money: $%money%
echo.
echo %xp%/%xpcap%     Skill: %skill%
echo -------------------------------------------------
echo DUNGEON ONE
echo -------------------------------------------------
echo Enemy: %enemy%
echo Skill: %enskill%
echo -------------------------------------------------
echo 1) Attack
echo 2) Defend
echo 3) Run
echo.
set /p f=You: 

if %f% == 1 goto attack
if %f% == 2 goto defend
if %f% == 3 goto run
goto dungeon1

:dungeon2
if %level% LSS 6 goto nolvl
set /a enemy=Goblin
set /a enskill=250
cls
echo.
echo User: %name%     Lvl: %level%     Money: $%money%
echo.
echo %xp%/%xpcap%     Skill: %skill%
echo -------------------------------------------------
echo DUNGEON ONE
echo -------------------------------------------------
echo Enemy: %enemy%
echo Skill: %enskill%
echo -------------------------------------------------
echo 1) Attack
echo 2) Defend
echo 3) Run
echo.
set /p f=You: 

if %f% == 1 goto attack
if %f% == 2 goto defend
if %f% == 3 goto run
goto dungeon2

:dungeon3
cls
echo.
echo I SAID IT WASN'T FINISHED YET, DIDN'T I?
pause >nul
goto home

:dungeon4
cls
echo.
echo I SAID IT WASN'T FINISHED YET, DIDN'T I?
pause >nul
goto home

:dungeon5
cls
echo.
echo I SAID IT WASN'T FINISHED YET, DIDN'T I?
pause >nul
goto home

:nolvl
cls
echo.
echo You are not a high enough level. Come back when you're ready.
pause >nul
goto home

:noskill
cls
echo.
echo You have no skill. Go buy some before you enter this domain.
pause >nul
goto home

:attack
if %skill% GTR %enskill% goto victory
if %skill% LSS %enskill% goto fail
if %skill% EQU %enskill% goto escape

:defend
if %skill% LSS %enskill% goto skillloss
if %skill% GTR %enskill% goto fail
if %skill% EQU %enskill% goto escape

:skillloss
set /a skill=%skill% / 2
if %skill% LSS 0 set /a skill=0
cls
echo.
echo You lost some skill. Remember to buy some in the shop.
pause >nul
goto home

:run
cls
echo.
echo You ran like a bitch...
pause >nul
goto home

:victory
cls
echo.
echo You killed %enemy%!
pause >nul
goto xpgain

:escape
cls
echo.
echo %enemy% escaped!
pause >nul
goto home

:fail
cls
echo.
echo You have been slain by %enemy%...
pause >nul
goto xploss

:xpgain
set /a enskill = %enskill% + 5
set /a xp=%xp% + %enskill%
set /a money=%money% + %enskill% + 5
if %xp% GEQ %xpcap% goto levelup
goto home

:xploss
set /a xp=%xp% - %enskill%
if %xp% LSS 0 set /a xp=0
goto home

:levelup
set /a level=%level% + 1
set /a xp=0
set /a xpcap = %xpcap% * 2 - 5
cls
echo.
echo You have leveled up!
pause >nul
goto home

:shop1
cls
echo.
echo User: %name%     Lvl: %level%     Money: $%money%
echo.
echo %xp%/%xpcap%     Skill: %skill%
echo -------------------------------------------------
echo Welcome to The Cavern! 
echo Here you can find items to boost yourself.
echo -------------------------------------------------
echo [a) Skill][b) XP]
echo.
echo 1) Lesser Skill Capsule     $10     Lvl: 1
echo 2) Normal Skill Capsule     $50     Lvl: 5
echo 3) Greater Skill Capsule    $100    Lvl: 10
echo 4) Exit
echo.
set /p f=You: 

if %f% == a goto inshop1
if %f% == b goto shop2

if %f% == 1 goto buy1.1
if %f% == 2 goto buy2.1
if %f% == 3 goto buy3.1
if %f% == 4 goto home
goto shop1

:shop2
cls
echo.
echo User: %name%     Lvl: %level%     Money: $%money%
echo.
echo %xp%/%xpcap%     Skill: %skill%
echo -------------------------------------------------
echo Welcome to The Cavern! 
echo Here you can find items to boost yourself.
echo -------------------------------------------------
echo [a) Skill][b) XP]
echo.
echo 1) Lesser XP Boost   $100     Lvl: 10
echo 2) Normal XP Boost   $500     Lvl: 50
echo 3) Greater XP Boost  $1500    Lvl: 150
echo 4) Exit
echo.
set /p f=You: 

if %f% == a goto shop1
if %f% == b goto inshop2

if %f% == 1 goto buy1.2
if %f% == 2 goto buy2.2
if %f% == 3 goto buy3.2
if %f% == 4 goto home
goto shop2

:inshop1
cls
echo.
echo You're already browsing Skill!
pause >nul
goto shop1

:inshop2
cls
echo.
echo You're already browsing XP!
pause >nul
goto shop2

:buy1.1
if %money% LSS 10 goto nobuy
if %level% LSS 1 goto nobuy
set /a money=%money% - 10
set /a skill=%skill% + 5
cls
echo.
echo Lesser Skill Capsule purchased!
pause >nul
goto shop1

:buy2.1
if %money% LSS 50 goto nobuy
if %level% LSS 5 goto nobuy
set /a money=%money% - 50
set /a skill=%skill% + 50
cls
echo.
echo Normal Skill Capsule purchased!
pause >nul
goto shop1

:buy3.1
if %money% LSS 100 goto nobuy
if %level% LSS 10 goto nobuy
set /a money=%money% - 100
set /a skill=%skill% + 250
cls
echo.
echo Greater Skill Capsule purchased!
pause >nul
goto shop1

:buy1.2
if %money% LSS 100 goto nobuy
if %level% LSS 10 goto nobuy
set /a money=%money% - 100
set /a xp=%xp% + 50
cls
echo.
echo Lesser XP Boost purchased!
pause >nul
goto shop2

:buy2.2
if %money% LSS 500 goto nobuy
if %level% LSS 50 goto nobuy
set /a money=%money% - 500
set /a xp=%xp% + 350
cls
echo.
echo Normal XP Boost purchased!
pause >nul
goto shop2

:buy3.2
if %money% LSS 1500 goto nobuy
if %level% LSS 150 goto nobuy
set /a money=%money% - 1500
set /a xp=%xp% + 1000
cls
echo.
echo Greater XP Boost purchased!
pause >nul
goto shop2

:nobuy
cls
echo.
echo You don't have enough money/levels!
pause >nul
goto shop1

:patchnotes
cls
echo.
echo Patch Notes
echo.
echo v.1.0
echo First release of game.
echo Still in development.
echo.
pause >nul
goto home

:info
cls
echo.
echo WIP
echo.
pause
goto menu

:exit
cls
echo.
echo Are you sure you want to leave? (y/n)
echo.
set /p f=

if %f% == n goto menu
if %f% == y exit
goto exit