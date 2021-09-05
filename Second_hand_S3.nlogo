;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; GENERAL SETTINGS ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


extensions [                                    ;; load extensions used
  rnd
  gis
  csv
]


globals [
  wards-dataset                                 ;; the dataset of wards

  temp-x                                        ;; temporary values
  temp-y
  temp-type
  temp-poisson
  temp-uni
  temp-co-price
  temp-co-convenience
  temp-co-time
  temp-co-quality
  temp-satisfied-utility
  temp-accessibility
  temp-tolerant-t
  temp-waited-t
  temp-type-d
  temp-volume-d
  temp-average-orininal-p
  temp-xcor
  temp-ycor
  temp-sellers
  temp-owner
  temp-main-body
  temp-main-body-d
  temp-main-body-s
  temp-distance
  temp-cost-walk
  temp-convenience-walk
  temp-time-walk
  temp-price-convenience-time-walk
  temp-cost-public-transport
  temp-convenience-public-transport
  temp-time-public-transport
  temp-price-convenience-time-public-transport
  temp-cost-postage
  temp-convenience-postage
  temp-time-postage
  temp-price-convenience-time-postage
  temp-prior?
  temp-p-ratio
  temp-price
  temp-accessibility-student-d
  temp-quality
  temp-tolerant-t-s
  temp-waited-t-s
  temp-accessibility-student-s
  temp-delivery-method
  temp-ward-number

  self-collection?                           ;; values for determination the delivery methods
  walk?
  public-transport?
  postage?
  target-d
  target-s
  utility-price-convenience-time
  csv

  p-walk                                      ;; prices for different delivery methods
  p-public-transport
  p-post-letter
  p-post-small
  p-post-medium
  p-post-large
  p-mover-xlarge
  prior-post-extra-rate

  t-walk                                      ;; time required for different delivery methods
  t-public-transport
  t-post-letter
  t-post-small
  t-post-medium
  t-post-large
  t-mover-xlarge



  competition-lost-d                          ;; values for statistics
  competition-lost-s
  total-successfully-buy
  total-failed-buy
  total-successfully-sell
  total-failed-sell

  total-suc-buy-5-1                          ;; values for statistics, general condition classified by items attributes
  total-suc-buy-5-2
  total-suc-buy-5-3
  total-suc-buy-5-4
  total-suc-buy-5-5
  total-suc-buy-20-1
  total-suc-buy-20-2
  total-suc-buy-20-3
  total-suc-buy-20-4
  total-suc-buy-20-5
  total-suc-buy-50-1
  total-suc-buy-50-2
  total-suc-buy-50-3
  total-suc-buy-50-4
  total-suc-buy-50-5
  total-suc-buy-100-1
  total-suc-buy-100-2
  total-suc-buy-100-3
  total-suc-buy-100-4
  total-suc-buy-100-5
  total-suc-buy-500-1
  total-suc-buy-500-2
  total-suc-buy-500-3
  total-suc-buy-500-4
  total-suc-buy-500-5

  total-fail-buy-5-1                          ;; values for statistics, general condition classified by items attributes
  total-fail-buy-5-2
  total-fail-buy-5-3
  total-fail-buy-5-4
  total-fail-buy-5-5
  total-fail-buy-20-1
  total-fail-buy-20-2
  total-fail-buy-20-3
  total-fail-buy-20-4
  total-fail-buy-20-5
  total-fail-buy-50-1
  total-fail-buy-50-2
  total-fail-buy-50-3
  total-fail-buy-50-4
  total-fail-buy-50-5
  total-fail-buy-100-1
  total-fail-buy-100-2
  total-fail-buy-100-3
  total-fail-buy-100-4
  total-fail-buy-100-5
  total-fail-buy-500-1
  total-fail-buy-500-2
  total-fail-buy-500-3
  total-fail-buy-500-4
  total-fail-buy-500-5

  total-fail-sell-5-1                          ;; values for statistics, general condition classified by items attributes
  total-fail-sell-5-2
  total-fail-sell-5-3
  total-fail-sell-5-4
  total-fail-sell-5-5
  total-fail-sell-20-1
  total-fail-sell-20-2
  total-fail-sell-20-3
  total-fail-sell-20-4
  total-fail-sell-20-5
  total-fail-sell-50-1
  total-fail-sell-50-2
  total-fail-sell-50-3
  total-fail-sell-50-4
  total-fail-sell-50-5
  total-fail-sell-100-1
  total-fail-sell-100-2
  total-fail-sell-100-3
  total-fail-sell-100-4
  total-fail-sell-100-5
  total-fail-sell-500-1
  total-fail-sell-500-2
  total-fail-sell-500-3
  total-fail-sell-500-4
  total-fail-sell-500-5




]


breed [borough-labels borough-label]
breed [students student]
breed [HEIs HEI]
breed [items-s item-s]
breed [items-d item-d]


patches-own [                          ;; Regional attributes
  ward-name
  accessibility
  ward-number
  density

  total-suc-buy-p-5-1                  ;; values for statistics, regional condition classified by items attributes
  total-suc-buy-p-5-2
  total-suc-buy-p-5-3
  total-suc-buy-p-5-4
  total-suc-buy-p-5-5
  total-suc-buy-p-20-1
  total-suc-buy-p-20-2
  total-suc-buy-p-20-3
  total-suc-buy-p-20-4
  total-suc-buy-p-20-5
  total-suc-buy-p-50-1
  total-suc-buy-p-50-2
  total-suc-buy-p-50-3
  total-suc-buy-p-50-4
  total-suc-buy-p-50-5
  total-suc-buy-p-100-1
  total-suc-buy-p-100-2
  total-suc-buy-p-100-3
  total-suc-buy-p-100-4
  total-suc-buy-p-100-5
  total-suc-buy-p-500-1
  total-suc-buy-p-500-2
  total-suc-buy-p-500-3
  total-suc-buy-p-500-4
  total-suc-buy-p-500-5

  total-suc-sell-p-5-1                  ;; values for statistics, regional condition classified by items attributes
  total-suc-sell-p-5-2
  total-suc-sell-p-5-3
  total-suc-sell-p-5-4
  total-suc-sell-p-5-5
  total-suc-sell-p-20-1
  total-suc-sell-p-20-2
  total-suc-sell-p-20-3
  total-suc-sell-p-20-4
  total-suc-sell-p-20-5
  total-suc-sell-p-50-1
  total-suc-sell-p-50-2
  total-suc-sell-p-50-3
  total-suc-sell-p-50-4
  total-suc-sell-p-50-5
  total-suc-sell-p-100-1
  total-suc-sell-p-100-2
  total-suc-sell-p-100-3
  total-suc-sell-p-100-4
  total-suc-sell-p-100-5
  total-suc-sell-p-500-1
  total-suc-sell-p-500-2
  total-suc-sell-p-500-3
  total-suc-sell-p-500-4
  total-suc-sell-p-500-5

  total-fail-buy-p-5-1                  ;; values for statistics, regional condition classified by items attributes
  total-fail-buy-p-5-2
  total-fail-buy-p-5-3
  total-fail-buy-p-5-4
  total-fail-buy-p-5-5
  total-fail-buy-p-20-1
  total-fail-buy-p-20-2
  total-fail-buy-p-20-3
  total-fail-buy-p-20-4
  total-fail-buy-p-20-5
  total-fail-buy-p-50-1
  total-fail-buy-p-50-2
  total-fail-buy-p-50-3
  total-fail-buy-p-50-4
  total-fail-buy-p-50-5
  total-fail-buy-p-100-1
  total-fail-buy-p-100-2
  total-fail-buy-p-100-3
  total-fail-buy-p-100-4
  total-fail-buy-p-100-5
  total-fail-buy-p-500-1
  total-fail-buy-p-500-2
  total-fail-buy-p-500-3
  total-fail-buy-p-500-4
  total-fail-buy-p-500-5

  total-fail-sell-p-5-1                  ;; values for statistics, regional condition classified by items attributes
  total-fail-sell-p-5-2
  total-fail-sell-p-5-3
  total-fail-sell-p-5-4
  total-fail-sell-p-5-5
  total-fail-sell-p-20-1
  total-fail-sell-p-20-2
  total-fail-sell-p-20-3
  total-fail-sell-p-20-4
  total-fail-sell-p-20-5
  total-fail-sell-p-50-1
  total-fail-sell-p-50-2
  total-fail-sell-p-50-3
  total-fail-sell-p-50-4
  total-fail-sell-p-50-5
  total-fail-sell-p-100-1
  total-fail-sell-p-100-2
  total-fail-sell-p-100-3
  total-fail-sell-p-100-4
  total-fail-sell-p-100-5
  total-fail-sell-p-500-1
  total-fail-sell-p-500-2
  total-fail-sell-p-500-3
  total-fail-sell-p-500-4
  total-fail-sell-p-500-5

]


students-own [
  poisson                    ;; variables to control students location, which is poisson distribution around the universities
  university                 ;; students' university
  if-arranged                ;; variables to control students location, which is poisson distribution around the universities
  uni-add-x                  ;; x-coordinates of students' university
  uni-add-y                  ;; y-coordinates of students' university
  ward-student               ;; ward of a student live
  accessibility-student      ;; ward accessibility of a student live

  active-d?                  ;; variables to demonstrate if students available to buy
  active-s?                  ;; variables to demonstrate if students available to sell

  co-price                   ;; coefficient for perception of price
  co-convenience             ;; coefficient for perception of convenience
  co-time                    ;; coefficient for perception of time
  co-quality                 ;; coefficient for perception of quality
  co-total                   ;; sum of coefficients
  satisfied-utility          ;; utility threshold to buy
  lowest-p-ratio             ;; lowest current/original price ratio to sell

  total-successfully-buy-student                  ;; values for statistics, student condition
  total-failed-buy-student
  total-successfully-sell-student
  total-failed-sell-student

]

HEIs-own [                          ;; attributes of universities
  hei-name
  international-students-number
  ratio

]

items-d-own [
  main-body-d                    ;; variables to link students and items to buy
  co-price                       ;; coefficient for perception of price
  co-convenience                 ;; coefficient for perception of convenience
  co-time                        ;; coefficient for perception of time
  co-quality                     ;; coefficient for perception of quality
  tolerant-t-d                   ;; consumers tolerant days
  waited-t-d                     ;; consumers waited days
  satisfied-utility              ;; utility threshold to buy
  average-original-p             ;; average original price of items
  volume-d                       ;; size of items
  type-d                         ;; function types of items
  accessibility-student          ;; ward accessibility of a student live
  preference                     ;; preference of consumers
]

items-s-own [
  main-body-s                    ;; variables to link students and items to sell
  original-p                     ;; original price of items
  p-ratio                        ;; current/original price ratio of items
  price                          ;; current price of items
  convenience                    ;; convenience score of items
  quality                        ;; quality score of items
  volume-s                       ;; size of items
  type-s                         ;; function type of items
  tolerant-t-s                   ;; sellers tolerant days
  waited-t-s                     ;; sellers waited days
  utility                        ;; utility score of items
  lowest-p-ratio                 ;; lowest current/original price ratio to sell
  accessibility-student          ;; ward accessibility of a student live
  browse-number                  ;; the number of browses
  delivery-method                ;; chose delivery method of items
]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; SETUP CONTENT ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


to setup

  clear-all
  reset-ticks

;; Form The Map Of London

  set wards-dataset gis:load-dataset "ESRI/wards_with_attributes.shp"

  ; Set the world envelope to the union of all of our dataset's envelopes
  gis:set-transformation gis:envelope-of wards-dataset (list min-pxcor max-pxcor min-pycor max-pycor)

  ; Assign variables and values for patches
  gis:apply-coverage wards-dataset "NAME" ward-name
  gis:apply-coverage wards-dataset "PTAL" accessibility
  gis:apply-coverage wards-dataset "NUMBER" ward-number

  ; Set different colors to distinguish patches in or out of London
  ask patches with [accessibility = "1"] [set pcolor white]
  ask patches with [accessibility = "1.5"] [set pcolor white]
  ask patches with [accessibility = "2"] [set pcolor white]
  ask patches with [accessibility = "3"] [set pcolor white]
  ask patches with [accessibility = "4"] [set pcolor white]
  ask patches with [accessibility = "5"] [set pcolor white]
  ask patches with [accessibility = "6"] [set pcolor white]
  ask patches with [accessibility = "6.5"] [set pcolor white]

  ; Show boundaries of London
  display-boroughs


;; Create Higher Education Institutions (HEIs) With The Data From CSV File

  create-HEIs 20 [setxy random-xcor random-ycor set shape "building institution" ]
  let input csv:from-file "London_Universities.csv"
  (foreach (sort HEIs) input [
    [ u dpair ] ->
    ask u [
      set hei-name item 0 dpair
      set international-students-number item 1 dpair
      set ratio item 2 dpair
      set xcor item 3 dpair
      set ycor item 4 dpair
    ]
  ])


;; Create International Students Of Each HEIs

  set-default-shape students "person"

  ask HEIs [set temp-uni hei-name
    set temp-x xcor
    set temp-y ycor
    hatch-students ratio * total-students [
    set size 0.5
    set poisson random-poisson 8
    set university temp-uni
    set if-arranged false
    set uni-add-x temp-x
    set uni-add-y temp-y
    set active-d? False
    set active-s? False
    set co-price abs (random-normal 5 2.5)
    set co-convenience abs (random-normal 3 2.5)
    set co-time abs (random-normal 3 2.5)
    set co-quality abs (random-normal 3 2.5)
    set co-total (co-price + co-convenience + co-time + co-quality)
    set co-price co-price / co-total
    set co-convenience co-convenience / co-total
    set co-time co-time / co-total
    set co-quality co-quality / co-total
    set satisfied-utility random-normal 6 1.5
    set lowest-p-ratio random-float-in-range 0.1 0.9
    set total-successfully-buy-student 0
    set total-failed-buy-student 0
    set total-successfully-sell-student 0
    set total-failed-sell-student 0
    setxy random-xcor random-ycor
    ]
  ]


;; Relocate International Students To Form Poisson Distribution

  ; Define the range of poisson distribution
  ask students with [poisson > 20] [die]
  set temp-poisson 20

  ; Let international students follow poisson distribution
  while [temp-poisson >= 0] [
    rearrange-students
    ]

  ; Deal with the international students who are out of London
  make-students-in-london

  ; Deal with the international students who are in City of London
  make-students-out-CoL

  ; Record boroughs info that studetens live
  ask students [
    let temp-borough [ward-name] of patch-here
    let temp-PTAL read-from-string ([accessibility] of patch-here)
    set ward-student temp-borough
    set accessibility-student temp-PTAL]

  ; Set the statistics value
  set competition-lost-d 0
  set competition-lost-s 0
  set total-successfully-buy 0
  set total-successfully-sell 0

  set total-suc-buy-5-1 0
  set total-suc-buy-5-2 0
  set total-suc-buy-5-3 0
  set total-suc-buy-5-4 0
  set total-suc-buy-5-5 0
  set total-suc-buy-20-1 0
  set total-suc-buy-20-2 0
  set total-suc-buy-20-3 0
  set total-suc-buy-20-4 0
  set total-suc-buy-20-5 0
  set total-suc-buy-50-1 0
  set total-suc-buy-50-2 0
  set total-suc-buy-50-3 0
  set total-suc-buy-50-4 0
  set total-suc-buy-50-5 0
  set total-suc-buy-100-1 0
  set total-suc-buy-100-2 0
  set total-suc-buy-100-3 0
  set total-suc-buy-100-4 0
  set total-suc-buy-100-5 0
  set total-suc-buy-500-1 0
  set total-suc-buy-500-2 0
  set total-suc-buy-500-3 0
  set total-suc-buy-500-4 0
  set total-suc-buy-500-5 0

  set total-fail-buy-5-1 0
  set total-fail-buy-5-2 0
  set total-fail-buy-5-3 0
  set total-fail-buy-5-4 0
  set total-fail-buy-5-5 0
  set total-fail-buy-20-1 0
  set total-fail-buy-20-2 0
  set total-fail-buy-20-3 0
  set total-fail-buy-20-4 0
  set total-fail-buy-20-5 0
  set total-fail-buy-50-1 0
  set total-fail-buy-50-2 0
  set total-fail-buy-50-3 0
  set total-fail-buy-50-4 0
  set total-fail-buy-50-5 0
  set total-fail-buy-100-1 0
  set total-fail-buy-100-2 0
  set total-fail-buy-100-3 0
  set total-fail-buy-100-4 0
  set total-fail-buy-100-5 0
  set total-fail-buy-500-1 0
  set total-fail-buy-500-2 0
  set total-fail-buy-500-3 0
  set total-fail-buy-500-4 0
  set total-fail-buy-500-5 0

  set total-fail-sell-5-1 0
  set total-fail-sell-5-2 0
  set total-fail-sell-5-3 0
  set total-fail-sell-5-4 0
  set total-fail-sell-5-5 0
  set total-fail-sell-20-1 0
  set total-fail-sell-20-2 0
  set total-fail-sell-20-3 0
  set total-fail-sell-20-4 0
  set total-fail-sell-20-5 0
  set total-fail-sell-50-1 0
  set total-fail-sell-50-2 0
  set total-fail-sell-50-3 0
  set total-fail-sell-50-4 0
  set total-fail-sell-50-5 0
  set total-fail-sell-100-1 0
  set total-fail-sell-100-2 0
  set total-fail-sell-100-3 0
  set total-fail-sell-100-4 0
  set total-fail-sell-100-5 0
  set total-fail-sell-500-1 0
  set total-fail-sell-500-2 0
  set total-fail-sell-500-3 0
  set total-fail-sell-500-4 0
  set total-fail-sell-500-5 0


;; Set The Global Variables

  set p-walk 0
  set p-public-transport 4
  set p-post-letter 2
  set p-post-small 5
  set p-post-medium 8
  set p-post-large 12
  set p-mover-xlarge 20
  set prior-post-extra-rate 0.2

  set t-walk 0
  set t-public-transport 0
  set t-post-letter 2
  set t-post-small 2
  set t-post-medium 2
  set t-post-large 2
  set t-mover-xlarge 1

end





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; RUNTIME CONTENT ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


to go

  tick

;; The Second Hand Shopping Demands Emerge

  set-default-shape items-d "face happy"

  ask n-of new-consumers students with [active-d? = False ] [
    set temp-owner who
    set active-d? True
    hatch-items-d random-in-range 1 max-demand-number [
      set main-body-d temp-owner
      set tolerant-t-d random-in-range 0 14
      set waited-t-d 0
      set type-d round (random-normal 6 2)
      set average-original-p one-of [5 20 50 100 500]
      set volume-d random-in-range 1 5
      set hidden? false
    ]
  ]


;; The Second Hand Items To Be Sold Emerge

  set-default-shape items-s "box"

  ask n-of new-sellers students with [active-s? = False ] [
    set temp-owner who
    set active-s? True
    hatch-items-s random-in-range 1 max-sell-number [
      set main-body-s temp-owner
      set original-p one-of [5 20 50 100 500]
      set p-ratio random-float-in-range lowest-p-ratio 1
      set price original-p * p-ratio
      set convenience 0
      set quality random-float-in-range 0.2 1
      set volume-s random-in-range 1 5
      set type-s round (random-normal 6 2)
      set tolerant-t-s random-in-range 7 30
      set waited-t-s 0
      set utility 0
      set temp-type type-s
      set browse-number 0
      set hidden? false
      if any? items-d-here with [type-d = temp-type] [
        set competition-lost-d competition-lost-d + 1
        ask items-d-here with [type-d = temp-type] [die]
        set competition-lost-s competition-lost-s + 1
        die
     ]
    ]
  ]


;; Browsing And Shopping Behaviors

  ask items-d [
    ask items-s [
    set utility 0
    ]
    compare-items
    decide-to-buy
  ]


;; Sellers Respond Consumers Demands Actively

  ask items-d [
    set waited-t-d waited-t-d + 1
    if waited-t-d > tolerant-t-d [
      set temp-main-body-d main-body-d
      ask students with [who = temp-main-body-d] [set total-failed-buy-student total-failed-buy-student + 1]
      set total-failed-buy total-failed-buy + 1
      classify-and-account-fail-buy
      classify-and-account-fail-buy-p
      die
    ]
  ]


;; Consumers And Sellers Lose Patience And Leave The Market

  ask items-s [
    set waited-t-s waited-t-s + 1
    if waited-t-s > tolerant-t-s [
      set temp-main-body-s main-body-s
      ask students with [who = temp-main-body-s] [set total-failed-sell-student total-failed-sell-student + 1]
      set total-failed-sell total-failed-sell + 1
      classify-and-account-fail-sell
      classify-and-account-fail-sell-p
      die
    ]
  ]


;; Define The Shopping Condition Of Consumers And Sellers

  ask students [
    set temp-main-body who
    set target-d one-of items-d with [main-body-d = temp-main-body]
    if target-d = nobody [
      set active-d? False
    ]
    set target-s one-of items-s with [main-body-s = temp-main-body]
    if target-s = nobody [
      set active-s? False
    ]
  ]


;; Sellers Adjust Price

  ask items-s [
    adjust-price
  ]


end






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; OTHER DEFINITIONS ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;  Visualization Tools

  ; Show boundaries of London
to display-boroughs

  clear-drawing

  gis:set-drawing-color gray
  gis:draw wards-dataset 1

end


  ; Show boroughs labels
to show-boroughs-labels

  ask borough-labels [die]

  if label-boroughs
  [foreach gis:feature-list-of wards-dataset [vector-feature ->
    let centroid gis:location-of gis:centroid-of vector-feature
    if not empty? centroid
    [create-borough-labels 1
      [set xcor item 0 centroid
       set ycor item 1 centroid
       set size 0
       set label gis:property-value vector-feature "NAME"
       set ward-name gis:property-value vector-feature "NAME"
      ]
    ]
    ]
  ]

end


  ; Show students
to show-students

  ifelse students-visibility [ask students [set hidden? false]] [ask students [set hidden? true]]

end


;; Initializing Students Related

to rearrange-students
  ask students with [if-arranged = false] [
    set temp-x random-float-in-range (- (temp-poisson + 1) + uni-add-x) (temp-poisson + 1 + uni-add-x)
    ifelse temp-x > max-pxcor or temp-x < min-pxcor [set xcor (-(temp-x - uni-add-x) + uni-add-x)]
    [set xcor temp-x]

    ifelse temp-poisson ^ 2 - (xcor - uni-add-x) ^ 2 <= 0
    [ifelse random-float 1 < 0.5
      [set ycor random-float-in-range (0 + uni-add-y) (sqrt ((temp-poisson + 1) ^ 2 - (xcor - uni-add-x) ^ 2) + uni-add-y)
      ]
      [set ycor random-float-in-range (- (sqrt ((temp-poisson + 1) ^ 2 - (xcor - uni-add-x) ^ 2)) + uni-add-y)  (0 + uni-add-y)
      ]
    ]

    [ifelse random-float 1 < 0.5
      [set ycor random-float-in-range (sqrt (temp-poisson ^ 2 - (xcor - uni-add-x) ^ 2) + uni-add-y) (sqrt ((temp-poisson + 1) ^ 2 - (xcor - uni-add-x) ^ 2) + uni-add-y)
      ]
      [set ycor random-float-in-range (-(sqrt ((temp-poisson + 1) ^ 2 - (xcor - uni-add-x) ^ 2)) + uni-add-y) (-(sqrt (temp-poisson ^ 2 - (xcor - uni-add-x) ^ 2)) + uni-add-y)
      ]
    ]
  ]

    ask students with [poisson = temp-poisson] [
      set if-arranged true
    ]
    set temp-poisson temp-poisson - 1

end


to make-students-in-london
  ask students-on patches with [pcolor = 0] [
      set temp-x (-(xcor - uni-add-x) + uni-add-x)
      set temp-y (-(ycor - uni-add-y) + uni-add-y)
    ifelse temp-x > max-pxcor or temp-x < min-pxcor [set xcor (2 * uni-add-x - temp-x)] [set xcor temp-x]
    ifelse temp-y > max-pycor or temp-y < min-pycor [set ycor (2 * uni-add-y - temp-y)] [set ycor temp-y]
  ]
  ask students-on patches with [pcolor = 0] [die]
  ask patches [
    set pcolor 0
  ]


end


to make-students-out-CoL
  ask students-on patches with [ward-name = "City of London"] [
    set temp-uni university
    set heading towards one-of HEIs with [hei-name = temp-uni]]
  while [(count students-on patches with [ward-name = "City of London"]) > 0]
  [ask students-on patches with [ward-name = "City of London"] [fd 1]
  ]

end


;; Shopping Behaviors

to compare-items
  set temp-co-price co-price
  set temp-co-convenience co-convenience
  set temp-co-time co-time
  set temp-co-quality co-quality
  set temp-type-d type-d
  set temp-xcor xcor
  set temp-ycor ycor
  set temp-accessibility accessibility-student
  set temp-volume-d volume-d
  set temp-average-orininal-p average-original-p
  ifelse tolerant-t-d - waited-t-d = 1 [set temp-prior? true] [set temp-prior? false]
  ifelse tolerant-t-d - waited-t-d = 0 [set postage? false] [set postage? true]
  set temp-sellers (count items-s with [type-s = temp-type-d and volume-s = temp-volume-d and original-p <=  temp-average-orininal-p * (1 + 1 / (temp-average-orininal-p ^ (1 / 3))) and original-p >=  temp-average-orininal-p * (1 - 1 / (temp-average-orininal-p ^ (1 / 3)))])
  ifelse temp-sellers < search-engine-power [set temp-sellers temp-sellers] [set temp-sellers search-engine-power]

  ;; utility function calculation

  confirm-preference

  if any? items-s with [type-s = temp-type-d and volume-s = temp-volume-d and original-p = temp-average-orininal-p] [
    (ifelse
    preference = 1 [
      ask max-n-of temp-sellers items-s with [type-s = temp-type-d and volume-s = temp-volume-d and original-p = temp-average-orininal-p] [p-ratio] [
        set browse-number browse-number + 1
        confirm-available-delivery-method
        confirm-highest-utility
        set utility (utility-price-convenience-time + temp-co-quality * quality * 10)
      ]
    ]
    preference = 2 [
      ask min-n-of temp-sellers items-s with [type-s = temp-type-d and volume-s = temp-volume-d and original-p = temp-average-orininal-p] [distance myself] [
        set browse-number browse-number + 1
        confirm-available-delivery-method
        confirm-highest-utility
        set utility (utility-price-convenience-time + temp-co-quality * quality * 10)
      ]
    ]
    preference = 3 [
      ask max-n-of temp-sellers items-s with [type-s = temp-type-d and volume-s = temp-volume-d and original-p = temp-average-orininal-p] [quality] [
        set browse-number browse-number + 1
        confirm-available-delivery-method
        confirm-highest-utility
        set utility (utility-price-convenience-time + temp-co-quality * quality * 10)
      ]
    ]
    preference = 4 [
      ask n-of temp-sellers items-s with [type-s = temp-type-d and volume-s = temp-volume-d and original-p = temp-average-orininal-p] [
        set browse-number browse-number + 1
        confirm-available-delivery-method
        confirm-highest-utility
        set utility (utility-price-convenience-time + temp-co-quality * quality * 10)
      ]
    ]
  )]

end


;; confirm preference through coefficients

to confirm-preference
  (ifelse (co-price >= 5 / 3 * co-time) and (co-price >= 5 / 3 * co-quality) [set preference 1] (co-time >= 3 / 5 * co-price) and (co-time >= co-quality) [set preference 2] (co-quality >= 3 / 5 * co-price) and (co-quality >= co-time) [set preference 3] [set preference 4])

end


to confirm-available-delivery-method

  set temp-distance sqrt ((temp-xcor - xcor) ^ 2 + (temp-ycor - ycor) ^ 2)
  ifelse volume-s <= 3 [
    set self-collection? true
    ifelse (temp-distance <= 10) [
    set walk? true
    set public-transport? false
      ] [
      ifelse (temp-accessibility * accessibility-student >= 8) [
        set walk? false
        set public-transport? true
      ] [
        set walk? false
        set public-transport? false
      ]
    ]
  ]
    [set self-collection? false
      set walk? false
      set public-transport? false]

  ifelse (tolerant-t-s - waited-t-s = 1 or temp-prior? = true) [set temp-prior? true] [set temp-prior? false]

  ifelse (tolerant-t-s - waited-t-s = 0 or postage? = false) [
    set postage? false
    set temp-prior? false
  ] [
    set postage? true]

end


to confirm-highest-utility
  (ifelse

    ; 1. volume 1-3, distance <= 10, walk, postage
    self-collection? = true and walk? = true and public-transport? = false and postage? = true and temp-prior? = false [
      set temp-cost-walk 0
      set temp-convenience-walk (8 / (temp-distance + 8)) / (volume-s ^ 0.5) * 10
      set temp-time-walk 10
      set temp-price-convenience-time-walk (1 - (price + temp-cost-walk) / original-p) * temp-co-price * 10 + temp-convenience-walk * temp-co-convenience + temp-time-walk * temp-co-time

      (ifelse
        volume-s = 1 [set temp-cost-postage p-post-letter]
        volume-s = 2 [set temp-cost-postage p-post-small]
        volume-s = 3 [set temp-cost-postage p-post-medium])
      set temp-convenience-postage 10
      set temp-time-postage 6
      set temp-price-convenience-time-postage (1 - (price + temp-cost-postage) / original-p) * temp-co-price * 10 + temp-convenience-postage * temp-co-convenience + temp-time-postage * temp-co-time

      ifelse
      temp-price-convenience-time-walk < temp-price-convenience-time-postage [
        set utility-price-convenience-time temp-price-convenience-time-postage
        set delivery-method 3
        ] [
        set utility-price-convenience-time temp-price-convenience-time-walk
        set delivery-method 1
      ]
    ]

    ; 2. volume 1-3, distance <= 10, walk, prior postage
    self-collection? = true and walk? = true and public-transport? = false and postage? = true and temp-prior? = true [
      set temp-cost-walk 0
      set temp-convenience-walk (8 / (temp-distance + 8)) / (volume-s ^ 0.5) * 10
      set temp-time-walk 10
      set temp-price-convenience-time-walk (1 - (price + temp-cost-walk) / original-p) * temp-co-price * 10 + temp-convenience-walk * temp-co-convenience + temp-time-walk * temp-co-time

      (ifelse
        volume-s = 1 [set temp-cost-postage p-post-letter * (1 + prior-post-extra-rate)]
        volume-s = 2 [set temp-cost-postage p-post-small * (1 + prior-post-extra-rate)]
        volume-s = 3 [set temp-cost-postage p-post-medium * (1 + prior-post-extra-rate)])
      set temp-convenience-postage 10
      set temp-time-postage 8
      set temp-price-convenience-time-postage (1 - (price + temp-cost-postage) / original-p) * temp-co-price * 10 + temp-convenience-postage * temp-co-convenience + temp-time-postage * temp-co-time

      ifelse
      temp-price-convenience-time-walk < temp-price-convenience-time-postage [
        set utility-price-convenience-time temp-price-convenience-time-postage
        set delivery-method 3
        ] [
        set utility-price-convenience-time temp-price-convenience-time-walk
        set delivery-method 1
      ]
    ]

    ; 3. volume 1-3, distance <= 10, walk
    self-collection? = true and walk? = true and public-transport? = false and postage? = false and temp-prior? = false [
      set temp-cost-walk 0
      set temp-convenience-walk (8 / (temp-distance + 8)) / (volume-s ^ 0.5) * 10
      set temp-time-walk 10
      set temp-price-convenience-time-walk (1 - (price + temp-cost-walk) / original-p) * temp-co-price * 10 + temp-convenience-walk * temp-co-convenience + temp-time-walk * temp-co-time

      set utility-price-convenience-time temp-price-convenience-time-walk
      set delivery-method 1
    ]

    ; 4. volume 1-3, distance > 10, public, postage
    self-collection? = true and walk? = false and public-transport? = true and postage? = true and temp-prior? = false [
      set temp-cost-public-transport 4
      set temp-convenience-public-transport (9 / (temp-distance) / (volume-s ^ 0.5) * 10)
      set temp-time-public-transport 10
      set temp-price-convenience-time-public-transport (1 - (price + temp-cost-public-transport) / original-p) * temp-co-price * 10 + temp-convenience-public-transport * temp-co-convenience + temp-time-public-transport * temp-co-time

      (ifelse
        volume-s = 1 [set temp-cost-postage p-post-letter]
        volume-s = 2 [set temp-cost-postage p-post-small]
        volume-s = 3 [set temp-cost-postage p-post-medium])
      set temp-convenience-postage 10
      set temp-time-postage 6
      set temp-price-convenience-time-postage (1 - (price + temp-cost-postage) / original-p) * temp-co-price * 10 + temp-convenience-postage * temp-co-convenience + temp-time-postage * temp-co-time

      ifelse
      temp-price-convenience-time-public-transport < temp-price-convenience-time-postage [
        set utility-price-convenience-time temp-price-convenience-time-postage
        set delivery-method 3
        ] [
        set utility-price-convenience-time temp-price-convenience-time-public-transport
        set delivery-method 2
      ]
    ]

    ; 5. volume 1-3, distance > 10, public, prior postage
    self-collection? = true and walk? = false and public-transport? = true and postage? = true and temp-prior? = true [
      set temp-cost-public-transport 4
      set temp-convenience-public-transport (9 / (temp-distance) / (volume-s ^ 0.5) * 10)
      set temp-time-public-transport 10
      set temp-price-convenience-time-public-transport (1 - (price + temp-cost-public-transport) / original-p) * temp-co-price * 10 + temp-convenience-public-transport * temp-co-convenience + temp-time-public-transport * temp-co-time

      (ifelse
        volume-s = 1 [set temp-cost-postage p-post-letter * (1 + prior-post-extra-rate)]
        volume-s = 2 [set temp-cost-postage p-post-small * (1 + prior-post-extra-rate)]
        volume-s = 3 [set temp-cost-postage p-post-medium * (1 + prior-post-extra-rate)])
      set temp-convenience-postage 10
      set temp-time-postage 8
      set temp-price-convenience-time-postage (1 - (price + temp-cost-postage) / original-p) * temp-co-price * 10 + temp-convenience-postage * temp-co-convenience + temp-time-postage * temp-co-time

      ifelse
      temp-price-convenience-time-public-transport < temp-price-convenience-time-postage [
        set utility-price-convenience-time temp-price-convenience-time-postage
        set delivery-method 3
        ] [
        set utility-price-convenience-time temp-price-convenience-time-public-transport
        set delivery-method 2
      ]
    ]

    ; 6. volume 1-3, distance > 10, public
    self-collection? = true and walk? = false and public-transport? = true and postage? = false and temp-prior? = false [
      set temp-cost-public-transport 4
      set temp-convenience-public-transport (9 / (temp-distance) / (volume-s ^ 0.5) * 10)
      set temp-time-public-transport 10
      set temp-price-convenience-time-public-transport (1 - (price + temp-cost-public-transport) / original-p) * temp-co-price * 10 + temp-convenience-public-transport * temp-co-convenience + temp-time-public-transport * temp-co-time

      set utility-price-convenience-time temp-price-convenience-time-public-transport
      set delivery-method 2
    ]

    ; 7. volume 1-3, distance > 10, accessibility < 8, postage
    self-collection? = true and walk? = false and public-transport? = false and postage? = true and temp-prior? = false [
      (ifelse
        volume-s = 1 [set temp-cost-postage p-post-letter]
        volume-s = 2 [set temp-cost-postage p-post-small]
        volume-s = 3 [set temp-cost-postage p-post-medium])
      set temp-convenience-postage 10
      set temp-time-postage 6
      set temp-price-convenience-time-postage (1 - (price + temp-cost-postage) / original-p) * temp-co-price * 10 + temp-convenience-postage * temp-co-convenience + temp-time-postage * temp-co-time

      set utility-price-convenience-time temp-price-convenience-time-postage
      set delivery-method 3
    ]

    ; 8. volume 1-3, distance > 10, accessibility < 8, prior postage
    self-collection? = true and walk? = false and public-transport? = false and postage? = true and temp-prior? = true [
      (ifelse
        volume-s = 1 [set temp-cost-postage p-post-letter * (1 + prior-post-extra-rate)]
        volume-s = 2 [set temp-cost-postage p-post-small * (1 + prior-post-extra-rate)]
        volume-s = 3 [set temp-cost-postage p-post-medium * (1 + prior-post-extra-rate)])
      set temp-convenience-postage 10
      set temp-time-postage 8
      set temp-price-convenience-time-postage (1 - (price + temp-cost-postage) / original-p) * temp-co-price * 10 + temp-convenience-postage * temp-co-convenience + temp-time-postage * temp-co-time

      set utility-price-convenience-time temp-price-convenience-time-postage
      set delivery-method 3
    ]

    ; 9. volume 1-3, distance > 10, accessibility < 8, last day
    self-collection? = true and walk? = false and public-transport? = false and postage? = false and temp-prior? = false [

      set utility-price-convenience-time -1000
      set delivery-method 0
    ]

    ; 10. volume 4-5, postage, mover
    self-collection? = false and walk? = false and public-transport? = false and postage? = true and temp-prior? = false [
      (ifelse
        volume-s = 4 [set temp-cost-postage p-post-large]
        volume-s = 5 [set temp-cost-postage p-mover-xlarge])
      set temp-convenience-postage 10
      set temp-time-postage 6
      set temp-price-convenience-time-postage (1 - (price + temp-cost-postage) / original-p) * temp-co-price * 10 + temp-convenience-postage * temp-co-convenience + temp-time-postage * temp-co-time

      set utility-price-convenience-time temp-price-convenience-time-postage
      set delivery-method 3
    ]

    ; 11. volume 4-5, prior postage, mover
    self-collection? = false and walk? = false and public-transport? = false and postage? = true and temp-prior? = true [
      (ifelse
        volume-s = 4 [set temp-cost-postage p-post-large * (1 + prior-post-extra-rate)]
        volume-s = 5 [set temp-cost-postage p-mover-xlarge])
      set temp-convenience-postage 10
      set temp-time-postage 8
      set temp-price-convenience-time-postage (1 - (price + temp-cost-postage) / original-p) * temp-co-price * 10 + temp-convenience-postage * temp-co-convenience + temp-time-postage * temp-co-time

      set utility-price-convenience-time temp-price-convenience-time-postage
      set delivery-method 3
    ]

    ; 12. volume 4-5, walk maybe?
    self-collection? = false and walk? = false and public-transport? = false and postage? = false and temp-prior? = false [
      ifelse temp-distance < 0.8 [
        set temp-cost-walk 0
        set temp-convenience-walk (8 / (temp-distance + 8)) / (volume-s ^ 0.5) * 10
        set temp-time-walk 10
        set temp-price-convenience-time-walk (1 - (price + temp-cost-walk) / original-p) * temp-co-price * 10 + temp-convenience-walk * temp-co-convenience + temp-time-walk * temp-co-time

        set utility-price-convenience-time temp-price-convenience-time-walk
        set delivery-method 1
      ] [
        set utility-price-convenience-time -1000
        set delivery-method 0
      ]
    ])


end


to decide-to-buy
  set temp-satisfied-utility satisfied-utility

  if any? items-s with [type-s = temp-type-d and volume-s = temp-volume-d and original-p = temp-average-orininal-p] [
    ask max-one-of items-s with [type-s = temp-type-d and volume-s = temp-volume-d and original-p = temp-average-orininal-p] [utility] [
    if utility >= temp-satisfied-utility [
      set temp-distance distance myself
      set temp-p-ratio p-ratio
      set temp-price price
      set temp-quality quality
      set temp-tolerant-t-s tolerant-t-s
      set temp-waited-t-s waited-t-s
      set temp-accessibility-student-s accessibility-student
      set temp-delivery-method delivery-method

      ask myself [
      set total-successfully-buy total-successfully-buy + 1
      classify-and-account-suc-buy
      classify-and-account-suc-buy-p

      set temp-accessibility-student-d accessibility-student


          set temp-main-body-d main-body-d
          ask students with [who = temp-main-body-d] [set total-successfully-buy-student total-successfully-buy-student + 1]
      die
      ]
      set total-successfully-sell total-successfully-sell + 1
        set temp-main-body-s main-body-s
        ask students with [who = temp-main-body-s] [set total-successfully-sell-student total-successfully-sell-student + 1]
        classify-and-account-suc-sell-p
      die
    ]
  ]
  ]

end


to adjust-price
  if 1 < (browse-number / waited-t-s) and waited-t-s >= tolerant-t-s / 2 [
    ifelse p-ratio - 0.1 > lowest-p-ratio [
      set p-ratio p-ratio - 0.1
      set price original-p * p-ratio] [
      set p-ratio lowest-p-ratio
      set price original-p * p-ratio]
  ]

end


;; Statistics Process

to classify-and-account-suc-buy
  (ifelse
  average-original-p = 5 and volume-d = 1 [set total-suc-buy-5-1 total-suc-buy-5-1 + 1]
  average-original-p = 5 and volume-d = 2 [set total-suc-buy-5-2 total-suc-buy-5-2 + 1]
  average-original-p = 5 and volume-d = 3 [set total-suc-buy-5-3 total-suc-buy-5-3 + 1]
  average-original-p = 5 and volume-d = 4 [set total-suc-buy-5-4 total-suc-buy-5-4 + 1]
  average-original-p = 5 and volume-d = 5 [set total-suc-buy-5-5 total-suc-buy-5-5 + 1]
  average-original-p = 20 and volume-d = 1 [set total-suc-buy-20-1 total-suc-buy-20-1 + 1]
  average-original-p = 20 and volume-d = 2 [set total-suc-buy-20-2 total-suc-buy-20-2 + 1]
  average-original-p = 20 and volume-d = 3 [set total-suc-buy-20-3 total-suc-buy-20-3 + 1]
  average-original-p = 20 and volume-d = 4 [set total-suc-buy-20-4 total-suc-buy-20-4 + 1]
  average-original-p = 20 and volume-d = 5 [set total-suc-buy-20-5 total-suc-buy-20-5 + 1]
  average-original-p = 50 and volume-d = 1 [set total-suc-buy-50-1 total-suc-buy-50-1 + 1]
  average-original-p = 50 and volume-d = 2 [set total-suc-buy-50-2 total-suc-buy-50-2 + 1]
  average-original-p = 50 and volume-d = 3 [set total-suc-buy-50-3 total-suc-buy-50-3 + 1]
  average-original-p = 50 and volume-d = 4 [set total-suc-buy-50-4 total-suc-buy-50-4 + 1]
  average-original-p = 50 and volume-d = 5 [set total-suc-buy-50-5 total-suc-buy-50-5 + 1]
  average-original-p = 100 and volume-d = 1 [set total-suc-buy-100-1 total-suc-buy-100-1 + 1]
  average-original-p = 100 and volume-d = 2 [set total-suc-buy-100-2 total-suc-buy-100-2 + 1]
  average-original-p = 100 and volume-d = 3 [set total-suc-buy-100-3 total-suc-buy-100-3 + 1]
  average-original-p = 100 and volume-d = 4 [set total-suc-buy-100-4 total-suc-buy-100-4 + 1]
  average-original-p = 100 and volume-d = 5 [set total-suc-buy-100-5 total-suc-buy-100-5 + 1]
  average-original-p = 500 and volume-d = 1 [set total-suc-buy-500-1 total-suc-buy-500-1 + 1]
  average-original-p = 500 and volume-d = 2 [set total-suc-buy-500-2 total-suc-buy-500-2 + 1]
  average-original-p = 500 and volume-d = 3 [set total-suc-buy-500-3 total-suc-buy-500-3 + 1]
  average-original-p = 500 and volume-d = 4 [set total-suc-buy-500-4 total-suc-buy-500-4 + 1]
  average-original-p = 500 and volume-d = 5 [set total-suc-buy-500-5 total-suc-buy-500-5 + 1]
  )

end


to classify-and-account-fail-buy
  (ifelse
  average-original-p = 5 and volume-d = 1 [set total-fail-buy-5-1 total-fail-buy-5-1 + 1]
  average-original-p = 5 and volume-d = 2 [set total-fail-buy-5-2 total-fail-buy-5-2 + 1]
  average-original-p = 5 and volume-d = 3 [set total-fail-buy-5-3 total-fail-buy-5-3 + 1]
  average-original-p = 5 and volume-d = 4 [set total-fail-buy-5-4 total-fail-buy-5-4 + 1]
  average-original-p = 5 and volume-d = 5 [set total-fail-buy-5-5 total-fail-buy-5-5 + 1]
  average-original-p = 20 and volume-d = 1 [set total-fail-buy-20-1 total-fail-buy-20-1 + 1]
  average-original-p = 20 and volume-d = 2 [set total-fail-buy-20-2 total-fail-buy-20-2 + 1]
  average-original-p = 20 and volume-d = 3 [set total-fail-buy-20-3 total-fail-buy-20-3 + 1]
  average-original-p = 20 and volume-d = 4 [set total-fail-buy-20-4 total-fail-buy-20-4 + 1]
  average-original-p = 20 and volume-d = 5 [set total-fail-buy-20-5 total-fail-buy-20-5 + 1]
  average-original-p = 50 and volume-d = 1 [set total-fail-buy-50-1 total-fail-buy-50-1 + 1]
  average-original-p = 50 and volume-d = 2 [set total-fail-buy-50-2 total-fail-buy-50-2 + 1]
  average-original-p = 50 and volume-d = 3 [set total-fail-buy-50-3 total-fail-buy-50-3 + 1]
  average-original-p = 50 and volume-d = 4 [set total-fail-buy-50-4 total-fail-buy-50-4 + 1]
  average-original-p = 50 and volume-d = 5 [set total-fail-buy-50-5 total-fail-buy-50-5 + 1]
  average-original-p = 100 and volume-d = 1 [set total-fail-buy-100-1 total-fail-buy-100-1 + 1]
  average-original-p = 100 and volume-d = 2 [set total-fail-buy-100-2 total-fail-buy-100-2 + 1]
  average-original-p = 100 and volume-d = 3 [set total-fail-buy-100-3 total-fail-buy-100-3 + 1]
  average-original-p = 100 and volume-d = 4 [set total-fail-buy-100-4 total-fail-buy-100-4 + 1]
  average-original-p = 100 and volume-d = 5 [set total-fail-buy-100-5 total-fail-buy-100-5 + 1]
  average-original-p = 500 and volume-d = 1 [set total-fail-buy-500-1 total-fail-buy-500-1 + 1]
  average-original-p = 500 and volume-d = 2 [set total-fail-buy-500-2 total-fail-buy-500-2 + 1]
  average-original-p = 500 and volume-d = 3 [set total-fail-buy-500-3 total-fail-buy-500-3 + 1]
  average-original-p = 500 and volume-d = 4 [set total-fail-buy-500-4 total-fail-buy-500-4 + 1]
  average-original-p = 500 and volume-d = 5 [set total-fail-buy-500-5 total-fail-buy-500-5 + 1]
  )

end


to classify-and-account-fail-sell
  (ifelse
  original-p = 5 and volume-s = 1 [set total-fail-sell-5-1 total-fail-sell-5-1 + 1]
  original-p = 5 and volume-s = 2 [set total-fail-sell-5-2 total-fail-sell-5-2 + 1]
  original-p = 5 and volume-s = 3 [set total-fail-sell-5-3 total-fail-sell-5-3 + 1]
  original-p = 5 and volume-s = 4 [set total-fail-sell-5-4 total-fail-sell-5-4 + 1]
  original-p = 5 and volume-s = 5 [set total-fail-sell-5-5 total-fail-sell-5-5 + 1]
  original-p = 20 and volume-s = 1 [set total-fail-sell-20-1 total-fail-sell-20-1 + 1]
  original-p = 20 and volume-s = 2 [set total-fail-sell-20-2 total-fail-sell-20-2 + 1]
  original-p = 20 and volume-s = 3 [set total-fail-sell-20-3 total-fail-sell-20-3 + 1]
  original-p = 20 and volume-s = 4 [set total-fail-sell-20-4 total-fail-sell-20-4 + 1]
  original-p = 20 and volume-s = 5 [set total-fail-sell-20-5 total-fail-sell-20-5 + 1]
  original-p = 50 and volume-s = 1 [set total-fail-sell-50-1 total-fail-sell-50-1 + 1]
  original-p = 50 and volume-s = 2 [set total-fail-sell-50-2 total-fail-sell-50-2 + 1]
  original-p = 50 and volume-s = 3 [set total-fail-sell-50-3 total-fail-sell-50-3 + 1]
  original-p = 50 and volume-s = 4 [set total-fail-sell-50-4 total-fail-sell-50-4 + 1]
  original-p = 50 and volume-s = 5 [set total-fail-sell-50-5 total-fail-sell-50-5 + 1]
  original-p = 100 and volume-s = 1 [set total-fail-sell-100-1 total-fail-sell-100-1 + 1]
  original-p = 100 and volume-s = 2 [set total-fail-sell-100-2 total-fail-sell-100-2 + 1]
  original-p = 100 and volume-s = 3 [set total-fail-sell-100-3 total-fail-sell-100-3 + 1]
  original-p = 100 and volume-s = 4 [set total-fail-sell-100-4 total-fail-sell-100-4 + 1]
  original-p = 100 and volume-s = 5 [set total-fail-sell-100-5 total-fail-sell-100-5 + 1]
  original-p = 500 and volume-s = 1 [set total-fail-sell-500-1 total-fail-sell-500-1 + 1]
  original-p = 500 and volume-s = 2 [set total-fail-sell-500-2 total-fail-sell-500-2 + 1]
  original-p = 500 and volume-s = 3 [set total-fail-sell-500-3 total-fail-sell-500-3 + 1]
  original-p = 500 and volume-s = 4 [set total-fail-sell-500-4 total-fail-sell-500-4 + 1]
  original-p = 500 and volume-s = 5 [set total-fail-sell-500-5 total-fail-sell-500-5 + 1]
  )

end


to classify-and-account-suc-buy-p
  set temp-ward-number [ward-number] of patch-here
    (ifelse
    average-original-p = 5 and volume-d = 1 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-5-1 total-suc-buy-p-5-1 + 1]]
    average-original-p = 5 and volume-d = 2 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-5-2 total-suc-buy-p-5-2 + 1]]
    average-original-p = 5 and volume-d = 3 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-5-3 total-suc-buy-p-5-3 + 1]]
    average-original-p = 5 and volume-d = 4 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-5-4 total-suc-buy-p-5-4 + 1]]
    average-original-p = 5 and volume-d = 5 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-5-5 total-suc-buy-p-5-5 + 1]]
    average-original-p = 20 and volume-d = 1 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-20-1 total-suc-buy-p-20-1 + 1]]
    average-original-p = 20 and volume-d = 2 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-20-2 total-suc-buy-p-20-2 + 1]]
    average-original-p = 20 and volume-d = 3 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-20-3 total-suc-buy-p-20-3 + 1]]
    average-original-p = 20 and volume-d = 4 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-20-4 total-suc-buy-p-20-4 + 1]]
    average-original-p = 20 and volume-d = 5 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-20-5 total-suc-buy-p-20-5 + 1]]
    average-original-p = 50 and volume-d = 1 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-50-1 total-suc-buy-p-50-1 + 1]]
    average-original-p = 50 and volume-d = 2 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-50-2 total-suc-buy-p-50-2 + 1]]
    average-original-p = 50 and volume-d = 3 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-50-3 total-suc-buy-p-50-3 + 1]]
    average-original-p = 50 and volume-d = 4 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-50-4 total-suc-buy-p-50-4 + 1]]
    average-original-p = 50 and volume-d = 5 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-50-5 total-suc-buy-p-50-5 + 1]]
    average-original-p = 100 and volume-d = 1 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-100-1 total-suc-buy-p-100-1 + 1]]
    average-original-p = 100 and volume-d = 2 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-100-2 total-suc-buy-p-100-2 + 1]]
    average-original-p = 100 and volume-d = 3 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-100-3 total-suc-buy-p-100-3 + 1]]
    average-original-p = 100 and volume-d = 4 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-100-4 total-suc-buy-p-100-4 + 1]]
    average-original-p = 100 and volume-d = 5 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-100-5 total-suc-buy-p-100-5 + 1]]
    average-original-p = 500 and volume-d = 1 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-500-1 total-suc-buy-p-500-1 + 1]]
    average-original-p = 500 and volume-d = 2 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-500-2 total-suc-buy-p-500-2 + 1]]
    average-original-p = 500 and volume-d = 3 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-500-3 total-suc-buy-p-500-3 + 1]]
    average-original-p = 500 and volume-d = 4 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-500-4 total-suc-buy-p-500-4 + 1]]
    average-original-p = 500 and volume-d = 5 [ask patches with [ward-number = temp-ward-number] [set total-suc-buy-p-500-5 total-suc-buy-p-500-5 + 1]]
  )

end


to classify-and-account-fail-buy-p
  set temp-ward-number [ward-number] of patch-here
    (ifelse
    average-original-p = 5 and volume-d = 1 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-5-1 total-fail-buy-p-5-1 + 1]]
    average-original-p = 5 and volume-d = 2 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-5-2 total-fail-buy-p-5-2 + 1]]
    average-original-p = 5 and volume-d = 3 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-5-3 total-fail-buy-p-5-3 + 1]]
    average-original-p = 5 and volume-d = 4 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-5-4 total-fail-buy-p-5-4 + 1]]
    average-original-p = 5 and volume-d = 5 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-5-5 total-fail-buy-p-5-5 + 1]]
    average-original-p = 20 and volume-d = 1 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-20-1 total-fail-buy-p-20-1 + 1]]
    average-original-p = 20 and volume-d = 2 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-20-2 total-fail-buy-p-20-2 + 1]]
    average-original-p = 20 and volume-d = 3 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-20-3 total-fail-buy-p-20-3 + 1]]
    average-original-p = 20 and volume-d = 4 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-20-4 total-fail-buy-p-20-4 + 1]]
    average-original-p = 20 and volume-d = 5 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-20-5 total-fail-buy-p-20-5 + 1]]
    average-original-p = 50 and volume-d = 1 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-50-1 total-fail-buy-p-50-1 + 1]]
    average-original-p = 50 and volume-d = 2 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-50-2 total-fail-buy-p-50-2 + 1]]
    average-original-p = 50 and volume-d = 3 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-50-3 total-fail-buy-p-50-3 + 1]]
    average-original-p = 50 and volume-d = 4 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-50-4 total-fail-buy-p-50-4 + 1]]
    average-original-p = 50 and volume-d = 5 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-50-5 total-fail-buy-p-50-5 + 1]]
    average-original-p = 100 and volume-d = 1 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-100-1 total-fail-buy-p-100-1 + 1]]
    average-original-p = 100 and volume-d = 2 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-100-2 total-fail-buy-p-100-2 + 1]]
    average-original-p = 100 and volume-d = 3 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-100-3 total-fail-buy-p-100-3 + 1]]
    average-original-p = 100 and volume-d = 4 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-100-4 total-fail-buy-p-100-4 + 1]]
    average-original-p = 100 and volume-d = 5 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-100-5 total-fail-buy-p-100-5 + 1]]
    average-original-p = 500 and volume-d = 1 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-500-1 total-fail-buy-p-500-1 + 1]]
    average-original-p = 500 and volume-d = 2 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-500-2 total-fail-buy-p-500-2 + 1]]
    average-original-p = 500 and volume-d = 3 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-500-3 total-fail-buy-p-500-3 + 1]]
    average-original-p = 500 and volume-d = 4 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-500-4 total-fail-buy-p-500-4 + 1]]
    average-original-p = 500 and volume-d = 5 [ask patches with [ward-number = temp-ward-number] [set total-fail-buy-p-500-5 total-fail-buy-p-500-5 + 1]]
  )

end


to classify-and-account-suc-sell-p
  set temp-ward-number [ward-number] of patch-here
    (ifelse
    original-p = 5 and volume-s = 1 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-5-1 total-suc-sell-p-5-1 + 1]]
    original-p = 5 and volume-s = 2 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-5-2 total-suc-sell-p-5-2 + 1]]
    original-p = 5 and volume-s = 3 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-5-3 total-suc-sell-p-5-3 + 1]]
    original-p = 5 and volume-s = 4 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-5-4 total-suc-sell-p-5-4 + 1]]
    original-p = 5 and volume-s = 5 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-5-5 total-suc-sell-p-5-5 + 1]]
    original-p = 20 and volume-s = 1 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-20-1 total-suc-sell-p-20-1 + 1]]
    original-p = 20 and volume-s = 2 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-20-2 total-suc-sell-p-20-2 + 1]]
    original-p = 20 and volume-s = 3 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-20-3 total-suc-sell-p-20-3 + 1]]
    original-p = 20 and volume-s = 4 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-20-4 total-suc-sell-p-20-4 + 1]]
    original-p = 20 and volume-s = 5 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-20-5 total-suc-sell-p-20-5 + 1]]
    original-p = 50 and volume-s = 1 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-50-1 total-suc-sell-p-50-1 + 1]]
    original-p = 50 and volume-s = 2 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-50-2 total-suc-sell-p-50-2 + 1]]
    original-p = 50 and volume-s = 3 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-50-3 total-suc-sell-p-50-3 + 1]]
    original-p = 50 and volume-s = 4 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-50-4 total-suc-sell-p-50-4 + 1]]
    original-p = 50 and volume-s = 5 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-50-5 total-suc-sell-p-50-5 + 1]]
    original-p = 100 and volume-s = 1 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-100-1 total-suc-sell-p-100-1 + 1]]
    original-p = 100 and volume-s = 2 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-100-2 total-suc-sell-p-100-2 + 1]]
    original-p = 100 and volume-s = 3 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-100-3 total-suc-sell-p-100-3 + 1]]
    original-p = 100 and volume-s = 4 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-100-4 total-suc-sell-p-100-4 + 1]]
    original-p = 100 and volume-s = 5 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-100-5 total-suc-sell-p-100-5 + 1]]
    original-p = 500 and volume-s = 1 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-500-1 total-suc-sell-p-500-1 + 1]]
    original-p = 500 and volume-s = 2 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-500-2 total-suc-sell-p-500-2 + 1]]
    original-p = 500 and volume-s = 3 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-500-3 total-suc-sell-p-500-3 + 1]]
    original-p = 500 and volume-s = 4 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-500-4 total-suc-sell-p-500-4 + 1]]
    original-p = 500 and volume-s = 5 [ask patches with [ward-number = temp-ward-number] [set total-suc-sell-p-500-5 total-suc-sell-p-500-5 + 1]]
  )

end


to classify-and-account-fail-sell-p
  set temp-ward-number [ward-number] of patch-here
    (ifelse
    original-p = 5 and volume-s = 1 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-5-1 total-fail-sell-p-5-1 + 1]]
    original-p = 5 and volume-s = 2 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-5-2 total-fail-sell-p-5-2 + 1]]
    original-p = 5 and volume-s = 3 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-5-3 total-fail-sell-p-5-3 + 1]]
    original-p = 5 and volume-s = 4 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-5-4 total-fail-sell-p-5-4 + 1]]
    original-p = 5 and volume-s = 5 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-5-5 total-fail-sell-p-5-5 + 1]]
    original-p = 20 and volume-s = 1 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-20-1 total-fail-sell-p-20-1 + 1]]
    original-p = 20 and volume-s = 2 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-20-2 total-fail-sell-p-20-2 + 1]]
    original-p = 20 and volume-s = 3 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-20-3 total-fail-sell-p-20-3 + 1]]
    original-p = 20 and volume-s = 4 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-20-4 total-fail-sell-p-20-4 + 1]]
    original-p = 20 and volume-s = 5 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-20-5 total-fail-sell-p-20-5 + 1]]
    original-p = 50 and volume-s = 1 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-50-1 total-fail-sell-p-50-1 + 1]]
    original-p = 50 and volume-s = 2 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-50-2 total-fail-sell-p-50-2 + 1]]
    original-p = 50 and volume-s = 3 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-50-3 total-fail-sell-p-50-3 + 1]]
    original-p = 50 and volume-s = 4 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-50-4 total-fail-sell-p-50-4 + 1]]
    original-p = 50 and volume-s = 5 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-50-5 total-fail-sell-p-50-5 + 1]]
    original-p = 100 and volume-s = 1 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-100-1 total-fail-sell-p-100-1 + 1]]
    original-p = 100 and volume-s = 2 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-100-2 total-fail-sell-p-100-2 + 1]]
    original-p = 100 and volume-s = 3 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-100-3 total-fail-sell-p-100-3 + 1]]
    original-p = 100 and volume-s = 4 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-100-4 total-fail-sell-p-100-4 + 1]]
    original-p = 100 and volume-s = 5 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-100-5 total-fail-sell-p-100-5 + 1]]
    original-p = 500 and volume-s = 1 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-500-1 total-fail-sell-p-500-1 + 1]]
    original-p = 500 and volume-s = 2 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-500-2 total-fail-sell-p-500-2 + 1]]
    original-p = 500 and volume-s = 3 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-500-3 total-fail-sell-p-500-3 + 1]]
    original-p = 500 and volume-s = 4 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-500-4 total-fail-sell-p-500-4 + 1]]
    original-p = 500 and volume-s = 5 [ask patches with [ward-number = temp-ward-number] [set total-fail-sell-p-500-5 total-fail-sell-p-500-5 + 1]]
  )

end


to calculate-density
  ask patches [
    set temp-ward-number ward-number
    set density count students-on patches with [ward-number = temp-ward-number] / (count (patches with [ward-number = temp-ward-number]) )
    ]

end


to record-regions-info
  export-world "S3.csv"

end


;; Rules Definitions

to-report random-float-in-range [low high]
  report low + random-float (high - low)

end


to-report random-in-range [low high]
  report low + random (high - low + 1)

end
@#$#@#$#@
GRAPHICS-WINDOW
233
16
1655
1439
-1
-1
14.0
1
10
1
1
1
0
0
0
1
-50
50
-50
50
1
1
1
ticks
30.0

BUTTON
1
740
76
773
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
153
740
233
773
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

BUTTON
77
740
152
773
go once
go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
4
502
233
547
NIL
temp-type
17
1
11

MONITOR
4
550
114
595
NIL
count items-d
17
1
11

BUTTON
2
842
118
875
NIL
show-boroughs-labels
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
2
361
174
394
total-students
total-students
0
50000
10000.0
1
1
NIL
HORIZONTAL

SWITCH
1
809
118
842
label-boroughs
label-boroughs
1
1
-1000

SLIDER
2
466
112
499
new-consumers
new-consumers
0
100
50.0
1
1
NIL
HORIZONTAL

SLIDER
2
431
112
464
max-demand-number
max-demand-number
1
10
2.0
1
1
NIL
HORIZONTAL

SLIDER
113
466
233
499
new-sellers
new-sellers
0
100
40.0
1
1
NIL
HORIZONTAL

MONITOR
117
550
233
595
NIL
count items-s
17
1
11

MONITOR
4
597
114
642
NIL
competition-lost-d
17
1
11

MONITOR
117
598
233
643
NIL
competition-lost-s
17
1
11

SLIDER
2
396
174
429
search-engine-power
search-engine-power
1
10
10.0
1
1
NIL
HORIZONTAL

MONITOR
4
644
114
689
NIL
total-successfully-buy
17
1
11

MONITOR
118
645
233
690
NIL
total-successfully-sell
17
1
11

MONITOR
4
692
114
737
NIL
total-successfully-buy / (total-successfully-buy + competition-lost-d + total-failed-buy)
17
1
11

MONITOR
118
691
233
736
NIL
total-successfully-sell / (total-successfully-sell + competition-lost-s + total-failed-sell)
17
1
11

SWITCH
118
809
232
842
students-visibility
students-visibility
1
1
-1000

BUTTON
119
843
232
876
NIL
show-students
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
114
431
233
464
max-sell-number
max-sell-number
1
10
4.0
1
1
NIL
HORIZONTAL

BUTTON
1
775
119
808
NIL
calculate-density
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
119
775
232
808
NIL
record-regions-info
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

@#$#@#$#@
## WHAT IS IT?

This model simulates the process of C2C online second-hand shopping among international students in London, aiming to enable people to better study second-hand trade, find relevant influencing factors, or test strategies and optimize the market. It focuses on the pre-purchase and purchase procedure rather than the post-purchase procedure. Specifically in this research, the model is used to find the spatial characteristics of the deal rates and proper ways to improve the deal rate. 

Based on the basic model, this model added the function that the system preferentially recommends items according to consumers’ preferences. Therefore, consumers will not randomly browse items anymore, but they will priorly browse the items which have higher score on their concerned aspects.

## HOW IT WORKS

The SETUP for the model creates international students with random locations. They can perform as both consumers and sellers. At each tick, random international students will become consumers or sellers. Consumers start to browse items and make a choice to buy items according to the coefficients with repect to different attributes and the attributes of items. This will be reflected by the result of utility function. The utility function of items as the basis for choice making, inspired by Joh, Arentze and Timmermans (2006):
U_ij  = A_i  * price_j + B_i  * convenience_j + C_i  * quality_j + D_i  * delivery_time_j
A_i + B_i + C_i + D_i=1
where U_ij is the utility. A, B, C, D are the coefficients of attributes. Others are the score values of attributes, and in this research, these values are simplified to be the score up to 10.

If consumers find the proper items, the item to buy and the item to sell will 'die'. If they do not find the proper items in the tolerant waiting time, they will 'die', which means giving up shopping in the real world. The tolerant waiting time is random for each international students as consumers or sellers. If the sellers can not sell items when the waiting time is more than half of tolerant time, they will reduce their price for 10%.


## HOW TO USE IT

Press SETUP to setup the model, then press GO to watch the model develop. You can control the total number of international students and new consumers/sellers every tick. You can also control the visualisation of international students and ward names.


## THINGS TO TRY


Change the search ability and the number of new consumers and sellers as well as their maximum items that can buy/sell each time. How the number of the deal and failed deal change? How about the deal rates? What about the regional conditions?


## EXTENDING THE MODEL

Add some functions that you think they can increase deal rates or performance of the whole market.

Calibrate the parameters and variable settings based on the real data and researches to make the model more accurate and quantifiable.

Set more attributes of consumers and sellers.

Adjust the value range and random mode of various variables to see what will happen.

Perfect the utility function and the elements in it.


## CREDITS AND REFERENCES

Joh, C., Arentze, T. and Timmermans, H., 2006. Characterisation and comparison of gender-specific utility functions of shopping duration episodes. Journal of Retailing and Consumer Services, 13(4), pp.249-259.
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

building institution
false
0
Rectangle -7500403 true true 0 60 300 270
Rectangle -16777216 true false 130 196 168 256
Rectangle -16777216 false false 0 255 300 270
Polygon -7500403 true true 0 60 150 15 300 60
Polygon -16777216 false false 0 60 150 15 300 60
Circle -1 true false 135 26 30
Circle -16777216 false false 135 25 30
Rectangle -16777216 false false 0 60 300 75
Rectangle -16777216 false false 218 75 255 90
Rectangle -16777216 false false 218 240 255 255
Rectangle -16777216 false false 224 90 249 240
Rectangle -16777216 false false 45 75 82 90
Rectangle -16777216 false false 45 240 82 255
Rectangle -16777216 false false 51 90 76 240
Rectangle -16777216 false false 90 240 127 255
Rectangle -16777216 false false 90 75 127 90
Rectangle -16777216 false false 96 90 121 240
Rectangle -16777216 false false 179 90 204 240
Rectangle -16777216 false false 173 75 210 90
Rectangle -16777216 false false 173 240 210 255
Rectangle -16777216 false false 269 90 294 240
Rectangle -16777216 false false 263 75 300 90
Rectangle -16777216 false false 263 240 300 255
Rectangle -16777216 false false 0 240 37 255
Rectangle -16777216 false false 6 90 31 240
Rectangle -16777216 false false 0 75 37 90
Line -16777216 false 112 260 184 260
Line -16777216 false 105 265 196 265

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

house colonial
false
0
Rectangle -7500403 true true 270 75 285 255
Rectangle -7500403 true true 45 135 270 255
Rectangle -16777216 true false 124 195 187 256
Rectangle -16777216 true false 60 195 105 240
Rectangle -16777216 true false 60 150 105 180
Rectangle -16777216 true false 210 150 255 180
Line -16777216 false 270 135 270 255
Polygon -7500403 true true 30 135 285 135 240 90 75 90
Line -16777216 false 30 135 285 135
Line -16777216 false 255 105 285 135
Line -7500403 true 154 195 154 255
Rectangle -16777216 true false 210 195 255 240
Rectangle -16777216 true false 135 150 180 180

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

person student
false
0
Polygon -13791810 true false 135 90 150 105 135 165 150 180 165 165 150 105 165 90
Polygon -7500403 true true 195 90 240 195 210 210 165 105
Circle -7500403 true true 110 5 80
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Polygon -1 true false 100 210 130 225 145 165 85 135 63 189
Polygon -13791810 true false 90 210 120 225 135 165 67 130 53 189
Polygon -1 true false 120 224 131 225 124 210
Line -16777216 false 139 168 126 225
Line -16777216 false 140 167 76 136
Polygon -7500403 true true 105 90 60 195 90 210 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.2.0
@#$#@#$#@
resize-world 0 500 0 500 setup ask turtles [ set size 5 ] repeat 150 [ go ]
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="8-20-08-19" repetitions="10" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="1825"/>
    <metric>total-failed-buy</metric>
    <metric>total-successfully-buy</metric>
    <metric>competition-lost-d</metric>
    <metric>total-failed-sell</metric>
    <metric>total-successfully-sell</metric>
    <metric>competition-lost-s</metric>
    <metric>total-suc-buy-5-1</metric>
    <metric>total-suc-buy-5-2</metric>
    <metric>total-suc-buy-5-3</metric>
    <metric>total-suc-buy-5-4</metric>
    <metric>total-suc-buy-5-5</metric>
    <metric>total-suc-buy-20-1</metric>
    <metric>total-suc-buy-20-2</metric>
    <metric>total-suc-buy-20-3</metric>
    <metric>total-suc-buy-20-4</metric>
    <metric>total-suc-buy-20-5</metric>
    <metric>total-suc-buy-50-1</metric>
    <metric>total-suc-buy-50-2</metric>
    <metric>total-suc-buy-50-3</metric>
    <metric>total-suc-buy-50-4</metric>
    <metric>total-suc-buy-50-5</metric>
    <metric>total-suc-buy-100-1</metric>
    <metric>total-suc-buy-100-2</metric>
    <metric>total-suc-buy-100-3</metric>
    <metric>total-suc-buy-100-4</metric>
    <metric>total-suc-buy-100-5</metric>
    <metric>total-suc-buy-500-1</metric>
    <metric>total-suc-buy-500-2</metric>
    <metric>total-suc-buy-500-3</metric>
    <metric>total-suc-buy-500-4</metric>
    <metric>total-suc-buy-500-5</metric>
    <metric>total-fail-buy-5-1</metric>
    <metric>total-fail-buy-5-2</metric>
    <metric>total-fail-buy-5-3</metric>
    <metric>total-fail-buy-5-4</metric>
    <metric>total-fail-buy-5-5</metric>
    <metric>total-fail-buy-20-1</metric>
    <metric>total-fail-buy-20-2</metric>
    <metric>total-fail-buy-20-3</metric>
    <metric>total-fail-buy-20-4</metric>
    <metric>total-fail-buy-20-5</metric>
    <metric>total-fail-buy-50-1</metric>
    <metric>total-fail-buy-50-2</metric>
    <metric>total-fail-buy-50-3</metric>
    <metric>total-fail-buy-50-4</metric>
    <metric>total-fail-buy-50-5</metric>
    <metric>total-fail-buy-100-1</metric>
    <metric>total-fail-buy-100-2</metric>
    <metric>total-fail-buy-100-3</metric>
    <metric>total-fail-buy-100-4</metric>
    <metric>total-fail-buy-100-5</metric>
    <metric>total-fail-buy-500-1</metric>
    <metric>total-fail-buy-500-2</metric>
    <metric>total-fail-buy-500-3</metric>
    <metric>total-fail-buy-500-4</metric>
    <metric>total-fail-buy-500-5</metric>
    <metric>total-fail-sell-5-1</metric>
    <metric>total-fail-sell-5-2</metric>
    <metric>total-fail-sell-5-3</metric>
    <metric>total-fail-sell-5-4</metric>
    <metric>total-fail-sell-5-5</metric>
    <metric>total-fail-sell-20-1</metric>
    <metric>total-fail-sell-20-2</metric>
    <metric>total-fail-sell-20-3</metric>
    <metric>total-fail-sell-20-4</metric>
    <metric>total-fail-sell-20-5</metric>
    <metric>total-fail-sell-50-1</metric>
    <metric>total-fail-sell-50-2</metric>
    <metric>total-fail-sell-50-3</metric>
    <metric>total-fail-sell-50-4</metric>
    <metric>total-fail-sell-50-5</metric>
    <metric>total-fail-sell-100-1</metric>
    <metric>total-fail-sell-100-2</metric>
    <metric>total-fail-sell-100-3</metric>
    <metric>total-fail-sell-100-4</metric>
    <metric>total-fail-sell-100-5</metric>
    <metric>total-fail-sell-500-1</metric>
    <metric>total-fail-sell-500-2</metric>
    <metric>total-fail-sell-500-3</metric>
    <metric>total-fail-sell-500-4</metric>
    <metric>total-fail-sell-500-5</metric>
    <enumeratedValueSet variable="total-students">
      <value value="10000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="students-visibility">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-demand-number">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-sell-number">
      <value value="4"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="label-boroughs">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="new-consumers">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="search-engine-power">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="new-sellers">
      <value value="40"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="experiment" repetitions="1" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <metric>count turtles</metric>
    <enumeratedValueSet variable="total-students">
      <value value="10000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="students-visibility">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-demand-number">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-sell-number">
      <value value="4"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="label-boroughs">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="new-consumers">
      <value value="50"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="search-engine-power">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="new-sellers">
      <value value="30"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
