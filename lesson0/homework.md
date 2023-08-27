### Q1. Which programming languages have you had previous experience with?  (You've at least done Hoon...)

C#
Go
Hoon
HTML/CSS
Java
Javascript
Lisp
Python
Visual Basic
Other: Kotlin,Ruby,


### Q2. Match the arm to its function.

++on-fail	Clean up after a crash.
++on-leave	Register a dropped subscriber.
++on-init	Creates and returns agent.
++on-load	Pack agent state for an upgrade.		
++on-agent	Allow read-only scry into agent state.
++on-peek	Handle one-time message.
++on-poke	Handle a subscription update.
++on-save	Update agent state after an upgrade.			
++on-watch	Register a new subscriber.
++on-arvo	Handles returned information from Arvo.		
++on-peek	Handle one-time message.	



### Q3. Modify either of the minimalist Gall agents to print the poke they receive using ~& sigpam.  (You don't need to process the poke data, just output it.)

Poke it at the command line using the :agent &noun notation.  Respond to this question with the result of that action.
*
At first I just recycled the default-agent's on-poke debug method:
```
++  on-poke
  |=  =noun
  ~&  >  "bravo received a poke with: {<noun>}"
  !!
```
... but the result was to print the input noun in it's raw form:
```
>   "bravo received a poke with: [1.853.189.998 [1.684.828.008 [1.701.998.435 [1.819.043.171 ... " 
```


Are you sure we don't need to process this in some way?


If I assign a variable name to the input:
```
  |=  =input=noun
  ~&  >  "bravo received a poke with: {<input>}"
  !!
```
...then I still get the raw input printed.

However, if I go back to `~& > "...{<noun>}"` - then I can get something a little more readable:
```
>   "bravo received a poke with: <1.kvs [* <139.uat 33.rnj 1.pnw %139>]>"
```
Is this the vase? This doesn't make sense to me. What is {<noun>} referring to here? Is it there another noun in the ++on-poke context? *


If I go back to the default-agent's method of using a cage:
```
  |=  input=cage
  ~&  >  "bravo received a poke with {<p.input>} and {<q.input>}"
  !!   
```
...then I'm getting closer to something sensibility:
```
>   "bravo received a poke with %noun and [#t/%~ q=0]"
```

* I think I answered my own question from earlier:
"""
The difference you're observing comes from the distinction between the data you're sending (`input` or `noun` in the code) and the implicit noun structure that Gall uses to wrap pokes, which contains not just the data but also metadata.
 
When you're referencing `input`, you're trying to print the entire structure of the poke (the full noun), which includes more than just the data you sent—it also includes metadata about the poke itself. This is why you're seeing raw and unrecognizable data.

On the other hand, when you reference `noun` (in the context of an on-poke arm), you're actually referencing a part of the poke data that Gall has implicitly unwrapped for you.
"""