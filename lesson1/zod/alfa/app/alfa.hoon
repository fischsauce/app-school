|_  =bowl:gall
++  on-init   [~ ..on-init]                     :: or `..on-init` --first-time startup (set up state)
++  on-save   !>(~)                             :: 'envases' -- produces a vase of current state
++  on-load   |=(vase `..on-init)               :: unwraps old case, makes state changes
++  on-poke       
  :: |=  input=cage
  :: ~&  >  "bravo received a poke with {<p.input>} and {<q.input>}"
  :: !!       
::                       :: single-time interaction
  |=  input=noun
  ~&  >  "bravo received a poke with: {<input>}"
  !!
::
  :: |=  =noun=noun
  :: ~|  "unexpected poke to {<dap.bowl>} with mark {<noun>}"
  :: !!
++  on-watch  |=(path !!)                       :: standing subscription -- Register a new subscriber
++  on-leave  |=(path `..on-init)               :: quit a subscription
++  on-peek   |=(path ~)                        :: single-time data request
++  on-agent  |=([wire sign:agent:gall] !!)     :: receive data from another agent
++  on-arvo   |=([wire sign-arvo] !!)           :: receive data from Arvo OS, eg a wake-up timer trigers, or packet from network is returned
++  on-fail   |=([term tang] `..on-init)        :: handle crash
--
