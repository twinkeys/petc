@echo off
TITLE Press Enter to Continue v.1.1
color 0a
:menu
cls
echo.
echo Press Enter to Continue v.1.1
echo.
echo 1) Start
echo 2) Load Save
echo 3) Exit
set /p f=

if %f% == 1 goto setvar
if %f% == 2 goto load
if %f% == 3 goto exit
goto menu

::Save/Load System

:load
< save.sav (
set /p name=
set /p level=
set /p money=
set /p xp=
set /p xpcap=
set /p skill=
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
echo %enskill%
) > save.sav
cls
echo.
echo Game Saved to save.sav
pause >nul
goto home

::Sets variables at beginning of game

:setvar
set level=1
set money=20
set xp=0
set xpcap=30
set skill=5
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

::Main select screen of game

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

::Dungeons

:dungeonlist
if %skill% == 0 goto noskill
cls
echo.
echo Choose a dungeon
echo ----------------
echo 1) Levels 1 - 5
echo 2) Levels 6 - 10
echo 3) Levels 11 - 20
echo 4) Levels 21 - 50
echo 5) Levels 51+
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
set enemy=Damn Slime
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
set /a enskill=%enskill% + 50
cls
set enemy=Goblin
echo.
echo User: %name%     Lvl: %level%     Money: $%money%
echo.
echo %xp%/%xpcap%     Skill: %skill%
echo -------------------------------------------------
echo DUNGEON TWO
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
if %level% LSS 11 goto nolvl
set /a enskill=%enskill% + 100
cls
set enemy=Giant Golem
echo.
echo User: %name%     Lvl: %level%     Money: $%money%
echo.
echo %xp%/%xpcap%     Skill: %skill%
echo -------------------------------------------------
echo DUNGEON THREE
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
goto dungeon3

:dungeon4
if %level% LSS 21 goto nolvl
set /a enskill=%enskill% + 500
cls
set enemy=Wraith King
echo.
echo User: %name%     Lvl: %level%     Money: $%money%
echo.
echo %xp%/%xpcap%     Skill: %skill%
echo -------------------------------------------------
echo DUNGEON FOUR
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
goto dungeon4

:dungeon5
if %level% LSS 51 goto nolvl
set /a enskill=%enskill% + 1500
cls
set enemy=Great Dragon
echo.
echo User: %name%     Lvl: %level%     Money: $%money%
echo.
echo %xp%/%xpcap%     Skill: %skill%
echo -------------------------------------------------
echo DUNGEON FIVE
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
goto dungeon5

::All possibilties in a fight

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
goto monloss

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

:monloss
set /a money=%money% - %enskill% / 2
if %money% LSS 0 set /a money=0
goto home

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

::Shop Code

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
echo 4) 2x Skill Multiplier       $5000   Lvl: 50
echo 5) Exit
echo.
set /p f=You: 

if %f% == a goto inshop1
if %f% == b goto shop2

if %f% == 1 goto desc1.1
if %f% == 2 goto desc2.1
if %f% == 3 goto desc3.1
if %f% == 4 goto desc4.1
if %f% == 5 goto home
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
echo 1) Lesser XP Boost   $100     Lvl: 1
echo 2) Normal XP Boost   $500     Lvl: 5
echo 3) Greater XP Boost  $1500    Lvl: 10
echo 4) 2x XP Multiplier   $5000    Lvl: 50
echo 5) Exit
echo.
set /p f=You: 

if %f% == a goto shop1
if %f% == b goto inshop2

if %f% == 1 goto desc1.2
if %f% == 2 goto desc2.2
if %f% == 3 goto desc3.2
if %f% == 4 goto desc4.2
if %f% == 5 goto home
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

::Item Descriptions

:desc1.1
cls
echo.
echo Lesser Skill Capsule
echo --------------------
echo Increases skill by 5.
echo --------------------
echo 1) Purchase Item
echo 2) Go Back
echo.
set /p f=You: 

if %f% == 1 goto buy1.1
if %f% == 2 goto shop1
goto desc1.1

:desc2.1
cls
echo.
echo Normal Skill Capsule
echo ---------------------
echo Increases skill by 50
echo ---------------------
echo 1) Purchase Item
echo 2) Go Back
echo.
set /p f=You: 

if %f% == 1 goto buy2.1
if %f% == 2 goto shop1
goto desc2.1

:desc3.1
cls
echo.
echo Greater Skill Capsule
echo ---------------------
echo Increases skill by 250
echo ---------------------
echo 1) Purchase Item
echo 2) Go Back
echo.
set /p f=You: 

if %f% == 1 goto buy3.1
if %f% == 2 goto shop1
goto desc3.1

:desc4.1
cls
echo.
echo 2x Skill Multiplier
echo --------------------------
echo Doubles your current skill
echo --------------------------
echo 1) Purchase Item
echo 2) Go Back
echo.
set /p f=You: 

if %f% == 1 goto buy4.1
if %f% == 2 goto shop1
goto desc4.1

:desc1.2
cls
echo.
echo Lesser XP Boost
echo ---------------------
echo Increases XP by 50
echo ---------------------
echo 1) Purchase Item
echo 2) Go Back
echo.
set /p f=You: 

if %f% == 1 goto buy1.2
if %f% == 2 goto shop2
goto desc1.2

:desc2.2
cls
echo.
echo Normal XP Boost
echo ---------------------
echo Increases XP by 350
echo ---------------------
echo 1) Purchase Item
echo 2) Go Back
echo.
set /p f=You: 

if %f% == 1 goto buy2.2
if %f% == 2 goto shop2
goto desc2.2

:desc3.2
cls
echo.
echo Greater XP Boost
echo ---------------------
echo Increases XP by 1000
echo ---------------------
echo 1) Purchase Item
echo 2) Go Back
echo.
set /p f=You: 

if %f% == 1 goto buy3.2
if %f% == 2 goto shop2
goto desc3.2

:desc4.2
cls
echo.
echo 2x XP Multiplier
echo ---------------------
echo Doubles current XP
echo ---------------------
echo 1) Purchase Item
echo 2) Go Back
echo.
set /p f=You: 

if %f% == 1 goto buy4.2
if %f% == 2 goto shop2
goto desc4.2

::Code for when you buy an item

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

:buy4.1
if %money% LSS 5000 goto nobuy
if %money% LSS 50 goto nobuy
set /a money=%money% - 5000
set /a skill=%skill% * 2
cls
echo.
echo 2x Skill Multiplier purchased!
pause >nul
goto shop1

:buy1.2
if %money% LSS 100 goto nobuy
if %level% LSS 1 goto nobuy
set /a money=%money% - 100
set /a xp=%xp% + 50
cls
echo.
echo Lesser XP Boost purchased!
pause >nul
goto shop2

:buy2.2
if %money% LSS 500 goto nobuy
if %level% LSS 5 goto nobuy
set /a money=%money% - 500
set /a xp=%xp% + 350
cls
echo.
echo Normal XP Boost purchased!
pause >nul
goto shop2

:buy3.2
if %money% LSS 1500 goto nobuy
if %level% LSS 10 goto nobuy
set /a money=%money% - 1500
set /a xp=%xp% + 1000
cls
echo.
echo Greater XP Boost purchased!
pause >nul
goto shop2

:buy4.2
if %money% LSS 5000 goto nobuy
if %level% LSS 50 goto nobuy
set /a money=%money% - 5000
set /a xp=%xp% * 2
cls
echo.
echo 2x XP Multiplier purchased!
pause >nul
goto shop2

:nobuy
cls
echo.
echo You don't have enough money/levels!
pause >nul
goto shop1

::Changelog

:patchnotes
cls
echo.
echo Patch Notes
echo.
echo v.1.2
echo Reduced starting money from 50 to 10
echo Increased starting xp from 10 to 30
echo Changed Dungeon 3 enemy name. Wraith to Wraith King
echo Changed new items' names. 2 Level Multiplier, 2 XP Multiplier to 2x Level Multiplier, 2x XP Multiplier
echo Added item descriptions
echo.
echo v.1.1
echo Changes to enemy skill gain after each win
echo All dungeons finished
echo Added 2 new items (2 Level Multiplier, 2 XP Multiplier)
echo Adjusted the level requirements of XP items
echo.
echo v.1.0
echo First release of game.
echo Still in development.
echo.
pause >nul
goto home

:exit
cls
echo.
echo Are you sure you want to leave? (y/n)
echo.
set /p f=

if %f% == n goto menu
if %f% == y exit
goto exit