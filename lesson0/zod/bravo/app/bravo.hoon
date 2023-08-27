/+  default-agent, dbug                             :: we're importing two libraries
|%                                                  :: not our agent core
+$  versioned-state                                 ::
  $%  state-0                                       ::
  ==                                                ::
+$  state-0                                         :: these lus-buc arms `+$` are 'type-definitions' define the state inside our agent
  $:  [%0 values=(list @)]                          ::  we're defining a new type, which has a name "versioned-state" it is a union (buc-sen `$%`) - so we could add more `state-x`. state-0 consists of a named tuple, with a head-tag of 0, and a list of @s 
  ==                                                ::  
+$  card  card:agent:gall                           :: aliasing card:agent:gall to just 'card'. the card is our fundamental unit of communication which is received in on-agent or on-arvo
--
%-  agent:dbug                                      :: we're applying a gate called 'agent' (boilerplate)
=|  state-0                                         :: tis-bar (a 'bunt') =| let's us define somethign with its default value, in this case, it saves us from populating it manually
=*  state  -                                        :: tis-star =* is registering an alias to this hep - which is the last thing that was put in our subject, ie 'state-0'
^-  agent:gall                                      :: making sure everything conforms to the type of a gall agent
|_  =bowl:gall
+*  this      .
    default   ~(. (default-agent this %|) bowl)
++  on-init                                         :: 
  ^-  (quip card _this)                             ::  _this cab is short for $_ buc-cab which is type of example - whatever the current core is, is the shape which is returned - eg ^_  ((list card) _this) - a list of cards means all the things this agent would like to tell the world to do, eg check and see if %pals is running? 
  ~&  >  '%bravo initialized successfully'
  =.  state  [%0 *(list @)]                         :: tis-dot is used to edit the arm in subject (ie changing the state to be the following value - the 'bunt' of the state)
  [~ this]      :: or `~this`                       :: in this case, we have no cards, so we're sending null ~ sig
++  on-save   on-save:default
++  on-load   on-load:default
++  on-poke   :: on-poke:default
  |=  =noun
  ~&  >  "on-poke received: {<noun>}"
  ::~|  "unexpected poke to {<dap.bowl>} with mark {<p.cage>}"
  !!
++  on-arvo   on-arvo:default
++  on-watch  on-watch:default
++  on-leave  on-leave:default
++  on-peek   on-peek:default
++  on-agent  on-agent:default
++  on-fail   on-fail:default
--
