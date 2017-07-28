# theTemplate
Template for Löve2D,  to speed up game development  

You'll want to draw your own icon, most likely.  
It's there to show conf.lua syntax.  

Includes a bunch'a **3-letter abbreviations.**  See inside for details.  

You could type out *'love.graphics'* everytime, or just *'gra'* with this template.  
Simply type out the first 3 letters of the Love module you wish to use.  

---  
To use this, you'll need Löve2d  
https://love2d.org  

Linux: *enter dir, then type*  
`love .`  

Win, Mac:  *drag folder on Love shortcut*  

for more info, see https://love2d.org/wiki/Getting_Started  

Android:  use any file manager that lets you *Open As...*  
https://play.google.com/store/apps/details?id=com.alphainventor.filemanager  

Open a .love file as other, complete action using Löve for Android.  
Alternatively, open the folder, and do the same thing with *main.lua*  

---  
I realize there's no player in there yet.  
Was going to put a guy at the bottom that runs around,  
using a gun you aim with the mouse...  

Then I thought of a breakout clone,  
where you control a paddle-and-ball that destroy the words.  

But that would take individual clone / placement of letters,  
and collision detection - which is do-able, just takes time.  

---
The spacing is so I can explain it to my kid.  

'space space equals' accentuates the difference between = and ==  
You'll see inside the code.  It's not that hard to figure out. 

Lua doesn't mind spacing, so you can do a  
find 'space dot' and replace with 'dot' easily enough,  
substitute 'space space equals' with 'equals' if you prefer.  

The idea is to make Lua games easy.  
If my kid can get it, you can too.

---  
**YouTube clips to help speed up the learning process.**

I hate "Learn X programming language in an Hour" vids,  
'cuz they skim over everything, to cram it all in.  

That said, this one is decent.  

Learn Lua in an Hour - by Tyler Neylon  
https://www.youtube.com/watch?v=S4eNl1rA1Ns  


Here's a playlist that breaks down the steps involved.  
Make your own game - by goature  
https://www.youtube.com/playlist?list=PL924F20B05A624D91  
I got the simple gamestate-management from his vid 14.  


Here's a cheat-sheet that's decent, easier than listening to the guy rattle on.  
http://www.newthinktank.com/2015/06/learn-lua-one-video  

I've watched a ton of Lua vids, and that might be the best way,  
'cuz you'll get something from one, and something else from another.  

---
Obviously, you'll want to refer to the Love2D wiki, and Lua docs.  
https://love2d.org/wiki/Main_Page  

You might find useful source code examples in other GitHub projects,  
or games at itch.io  https://itch.io/games/tag-love2d   

Reddit is a good source for info.
> /r/lua  
> /r/love2d  
> /r/gamedev  
> /r/lua_questions  

To try out code, you can type **lua**  
in your comand prompt / console, to get an interactive interpreter.  
No exit command, must tap *(Linux, Mac)* **Ctrl-D** or *(Win)* **Ctrl-Z**, to exit.  

Can try out snippets of code online  
https://repl.it/languages/lua

If you're stumped, can look / ask at StackOverflow,  
but their whole conversational ranking system **sux**.  
https://stackoverflow.com/questions/tagged/lua  

Poco8 carts might be of some use when trying to figure out Lua conventions.  
https://www.lexaloffle.com/bbs/?cat=7&sub=2&mode=carts  
But you have to be aware there may be specifics that won't transfer over.  

---
You can try out ZeroBrane Studio  

Tho it's easier to navigate the filesystem in Pluma,  
and I dig their code snippets plugin. 
