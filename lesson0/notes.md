## 2023-08-22

### boot the ship
`./zod/.run`

### create new desk, mount it - along with %base for dependencies
`|new-desk %alfa`
`|mount %alfa`
`|mount %base`

### create a `desk.bill` file inside %alfa - which lists agents to be run


### create an /app folder and add our gall agent `alfa.hoon`


### commit the changes
`|commit %alfa`

#### - we'll get an error because we don't have certain mar definitions
```
> |commit %alfa
>=
crud: %into event failed
[%poke %into]
bar-stack=[i=[i=//sync/0v1d.lji4n t=~] t=~]
call: failed
[ from=1
  deletes={}
  changes={[i=~.desk t=/bill] [i=~.app t=/alfa/hoon]}
]
[%error-validating /desk/bill]
[%validate-page-fail /desk/bill %from %mime]
[%error-building-tube %mime %bill]
[%error-building-cast %mime %bill]
clay: no files match /mar/mime/hoon
```
`cp ../base/mar/bill.hoon ../base/mar/mime.hoon mar`

#### now it works:
```
> |commit %alfa
>=
+ /~zod/alfa/2/app/alfa/hoon
+ /~zod/alfa/2/mar/bill/hoon
+ /~zod/alfa/2/mar/mime/hoon
+ /~zod/alfa/2/desk/bill
```

### test it:
`|install our %alfa`

#### result:
```
> |install our %alfa
>=
gall: booted %alfa
```


### our desk has no state, so let's poke it with something, in this case a mark with a null value:
`:alfa &noun ~` 

#### we crash:
```
> :alfa &noun ~
/sys/vane/gall/hoon:<[1.378 9].[1.378 37]>
/app/alfa/hoon:<[5 23].[5 25]>
dojo: app poke failed
```

#### line 5 [on-poke] has issue - because it's expecting a mark?

#### we'll modify this arm a little, to output more information, in this case, we'll print the output `~&` of the [bowl]:
```
++  on-poke
  |=  =cage
  ~&  bowl
  !!
```

#### commit our changes, and poke it again::
`|commit %alfa`
`:alfa &noun ~`


#### we get the identity, where the poke came from, what the agent was, and 3 lists: [wex,sup,sky] and some entropy, timestamp and version info:
```
[ [our=~zod src=~zod dap=%alfa]
  [wex=~ sup=~ sky=~]
  act=4
    eny
  0v3dv.aggm1.a5iq3.fsil7.6u9c1.9bbkg.36p8s.mk5fk.2linh.1k76s.klv3r.dv7tg.rpqql.0q7gi.9npkv.7jase.426mi.2kg6g.53fkt.irmr6.2redb
  now=~2023.8.24..18.22.50..4dde
    byk
  [p=~zod q=%alfa r=[%da p=~2023.8.24..18.22.20..e25a]]
]
```

## A second agent

### instead of defining every arm - we can use defaults:
`++  on-save  on-save:default`

