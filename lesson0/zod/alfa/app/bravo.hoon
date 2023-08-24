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
=|  state-0                                         :: bar-tis |= let's us define somethign with its default value, in this case, it saves us from populating it manually
=*  state  -                                        :: tis-star =* is registering an alias to this hep - which is the last thing that was put in our subject, ie 'state-0'
^-  agent:gall                                      :: making sure everything conforms to the type of a gall agent
|_  =bowl:gall
+*  this      .
    default   ~(. (default-agent this %|) bowl)
++  on-init                                         :: 
  ^-  (quip card _this)
  ~&  >  '%bravo initialized successfully'
  =.  state  [%0 *(list @)]
  [~ this]      :: or `~this`                       ::
++  on-save   on-save:default
++  on-load   on-load:default
++  on-poke   on-poke:default
++  on-arvo   on-arvo:default
++  on-watch  on-watch:default
++  on-leave  on-leave:default
++  on-peek   on-peek:default
++  on-agent  on-agent:default
++  on-fail   on-fail:default
--
