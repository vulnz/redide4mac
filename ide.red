 Red [needs: 'view
]

    labels: [


        ["Blue" "Green" "Project" "Exit without saving" "Red" "Yellow" "White" "Black" "Save session" "Load last session""Load project 2 session" "Load project 3 session"]

    ]
    set-lang: function [f event][
        root: f/parent
        condition: [all [face/text face/type <> 'drop-list]]

        list: collect [foreach-face/with root [keep face/text] condition]
        forall list [append clear list/1 labels/(f/selected)/(index? list)]

        foreach-face/with root [
            pads: any [metrics?/total face 'paddings 'x 0]
            prev: face/size/x
            face/size/x: pads + first size-text face
            face/offset/x: face/offset/x + ((prev - face/size/x) / 2)
        ][face/type = 'button]

        
    ]





; colors

    view [ 



        style txt: text right

        radio "Blue" [set-focus f  f/color: green or blue t2/color: green or blue a/color: white ]  
        radio "Green" [set-focus f  f/color: green t2/color: green a/color: white ]  
        radio "Red" [set-focus f  f/color: t2/color: red red a/color: white ]  
        radio "Yellow" [set-focus f f/color: t2/color: yellow yellow a/color: black]  
        radio "White" [set-focus f  f/color: white t2/color: white a/color: black ]     

return



;tabs

        tab-panel 900x600 [

        "Project GUI " [   f: area 900x600  {Red [ ] 
          view/flags  [text "Hello World" ]'modal }  no-border
        font [name: "Comic Sans MS" size: 10 color: black]


        ]



        "Project Console " [   t2: area 900x600    { Red [Title: "Simple hello world script"]
     print "Hello World!"}
        no-border
        font [name: "Comic Sans MS" size: 10 color: black]


        ]


            "TODO " [   t3: area 900x600  no-border 
        font [name: "Comic Sans MS" size: 10 color: black]



        ]


                   ]






;save to path



return

;run
button "Run GUI project"[ do f/text  "Try some different code" ]
button "Run Console project" [ do t2/text  "Try some different code" ]
            return
button "Save gui tab" [if sf: request-file/save  [unless suffix? sf [append sf %.red]  write sf f/text ] ]
       button "Save console tab" [if sf: request-file/save  [unless suffix? sf [append sf %.red]  write sf t2/text ] ]
       button "Save loaded file" [if sf: request-file/save  [unless suffix? sf [append sf %.red]  write sf t4/text ] ]
       button "Save TODO" [if sf: request-file/save  [unless suffix? sf [append sf %.red]  write sf t3/text ] ]
    return


      
; SAVER

     button "Save gui session" [save %redscript1.red f/text]
      button "Save console session" [save %redscript2.red t2/text]
      button "Save TODO session" [save %redscript3.red t3/text]


;LOADER
    button "Load Gui session" [f/text: load %redscript1.red]
    button "Load CLI session" [t2/text: load %redscript2.red]
    button "Load TODO" [t3/text: load %redscript3.red]


       return
       button right "Install rebel from Github  " [on-click do https://raw.githubusercontent.com/red/community/master/tools/celer.red]
       button right "Download last version of Red " [on-click do https://raw.githubusercontent.com/red/community/master/tools/red-master-dl.red]

       button right "Exit without saving" [quit]
      
    ]
