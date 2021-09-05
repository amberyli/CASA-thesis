;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; Variables ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
globals
[
  ;1. Network and population
  ; no-of-nodes                             ;the number of places in the world
  ; average-node-degree                     ;the average number of links for each
  ; rural-pop                               ;the number of population in each city area
  ; urban-pop                               ;the number of population in each countryside

  ;2. SIR
  ; initial-outbreak-area                   ;select areas to have the initial outbreak
  ; initial-outbreak-size                   ;the number of places that initial infection happen
  ; prob-infected                           ;the probability that people might get infected
  ; prob-recovered                          ;the probability that people could recover after infection
  ; prob-resistant                          ;the probability that people could gain resistance after recovery

  ;3. Tourist
  ; tourist-rate                            ;the percetange of people would migrate between areas

  ;4. For Monitoring and research purpose

  ;4.1 for WHOLE population
  ;4.1.1 store the value in lists
  total-pop                                      ;the LIST of WHOLE population
  total-pop-urban                                ;the LIST of WHOLE population in cities
  total-pop-rural                                ;the LIST of WHOLE population in countryside
  total-pop-s                                    ;the LIST of Susceptible population
  total-pop-s-urban                              ;the LIST of Susceptible population in cities
  total-pop-s-rural                              ;the LIST of Susceptible population in countryside
  total-pop-i                                    ;the LIST of Infected population
  total-pop-i-urban                              ;the LIST of Infected population in cities
  total-pop-i-rural                              ;the LIST of Infected population in countryside
  total-pop-r                                    ;the LIST of Resistant population
  total-pop-r-urban                              ;the LIST of Resistant population in cities
  total-pop-r-rural                              ;the LIST of Resistant population in countryside
  ;4.1.2 calculate the sum value
  sum-total-pop                                  ;the SUM of WHOLEpopulation
  sum-total-pop-urban                            ;the SUM of WHOLE population in cities
  sum-total-pop-rural                            ;the SUM of WHOLE population in countryside
  %-sum-total-pop-s                              ;the RATIO of All Susceptible population over Whole population
  %-sum-total-pop-s-urban                        ;the RATIO of All Susceptible population over Whole population in cities
  %-sum-total-pop-s-rural                        ;the RATIO of All Susceptible population over Whole population in countryside
  %-sum-total-pop-i                              ;the RATIO of All Infected population over Whole population
  %-sum-total-pop-i-urban                        ;the RATIO of All Infected population over Whole population in cities
  %-sum-total-pop-i-rural                        ;the RATIO of All Infected population over Whole population in countryside
  %-sum-total-pop-r                              ;the RATIO of All Resistant population over Whole population
  %-sum-total-pop-r-urban                        ;the RATIO of All Resistant population over Whole population in cities
  %-sum-total-pop-r-rural                        ;the RATIO of All Resistant population over Whole population in countryside

  ;4.2 for EACH nodes
  ;4.2.1 store the value in lists
  total-pop-s-%                               ;The LIST of the percentage of Susceptible people
  total-pop-s-%-urban                         ;The LIST of the percentage of Susceptible people in cities
  total-pop-s-%-rural                         ;The LIST of the percentage of Susceptible people in countryside
  total-pop-i-%                               ;The LIST of the percentage of Infected people
  total-pop-i-%-urban                         ;The LIST of the percentage of Infected people in cities
  total-pop-i-%-rural                         ;The LIST of the percentage of Infected people in countryside
  total-pop-r-%                               ;The LIST of the percentage of Resistant people
  total-pop-r-%-urban                         ;The LIST of the percentage of Resistant people in cities
  total-pop-r-%-rural                         ;The LIST of the percentage of Resistant people in countryside
  ;4.2.2 calculate the mean
  mean-total-pop-s-%                          ;The MEAN of the percentage of Susceptible people
  mean-total-pop-s-%-urban                    ;The MEAN of the percentage of Susceptible people in cities
  mean-total-pop-s-%-rural                    ;The MEAN of the percentage of Susceptible people in countryside
  mean-total-pop-i-%                          ;The MEAN of the percentage of Infected people
  mean-total-pop-i-%-urban                    ;The MEAN of the percentage of Infected people in cities
  mean-total-pop-i-%-rural                    ;The MEAN of the percentage of Infected people in countryside
  mean-total-pop-r-%                          ;The MEAN of the percentage of Resistant people
  mean-total-pop-r-%-urban                    ;The MEAN of the percentage of Resistant people in cities
  mean-total-pop-r-%-rural                    ;The MEAN of the percentage of Resistant people in countryside
  ;4.2.3 calculate the mean
  var-total-pop-r-%                           ;The VARIANCE of the percentage of Resistant people
  var-total-pop-r-%-urban                     ;The VARIANCE of the percentage of Resistant people in cities
  var-total-pop-r-%-rural                     ;The VARIANCE of the percentage of Resistant people in countryside
]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

turtles-own
[
  ;0.
  pop-at-start                              ;the number of population at this node at the start of each tick

  ;1. Population and SIR
  current-pop                               ;the number of population at this node at the end of each tick
  pop-s                                     ;the number of susceptible people at here
  pop-i                                     ;the number of infected people at here
  pop-r                                     ;the number of resistant people at here

  ;2. Migration

  ;2.1 Linked Neighbors
  neighbor-index-list                       ;for each, the list of its linked neighbor's index
  neighbor-pop-list                         ;for each, the list of its linked neighbor's population
  neighbor-pop-normalised-list              ;for each, the normalised list of its linked neighbor's population
  p                                         ;random value between 0 and 1
  turtle-who                                ;for each, the index of the destination turlte

  ;2.2 Tourist
  here-pop-list                             ;for each, the list of its SIR population
  here-pop-normalised-list                  ;for each, the normalied list of its SIR population
  pop-tourists                              ;for each, the number of tourist population
  ;q                                        ;random value between 0 and 1 (repeat several times)
  tourist-status-list                       ;for each, the list containing the status of every tourist
  t-pop-s                                   ;for each, the number of TOURISTS that are susceptible
  t-pop-i                                   ;for each, the number of TOURISTS that are infected
  t-pop-r                                   ;for each, the number of TOURISTS that are resistant
]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SETUP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to setup
  clear-all

  ;1. Network
  setup-nodes
  setup-spatially-clustered-network

  ;2. Define 2 types of area and assign population
  setup-urban-rural

  ;3. Set initial outbreak
  ; Note, they won't start to be infected at tick = 0, the infection would be set at "go"
  setup-initial-outbreak

  ;4. Record the linked neighbors population and corresponding index at the beginning
  setup-neighbor-list

  ;5. Monitoring I
  monitor-pop-all-turtles
  monitor-pop-urban-turtles
  monitor-pop-rural-turtles

  ;6. Monitoring II
  monitor-pop-%-all-turtles
  monitor-pop-%-urban-turtles
  monitor-pop-%-rural-turtles

  reset-ticks
end

;1.1;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to setup-nodes
  ;set-default-shape turtles "circle"
  create-turtles no-of-nodes
  [
    ; Scenario1. for visual reasons, we don't put any nodes *too* close to the edges
    setxy (random-xcor * 0.95) (random-ycor * 0.95)
    ; Scenario2. Don't care about that. In reality, it is possible to have *close* cases.
    ;setxy random-xcor random-ycor
  ]
end

;1.2;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to setup-spatially-clustered-network
  let num-links (average-node-degree * no-of-nodes) / 2
  while [count links < num-links ]
  [
    ask one-of turtles
    [
      let choice (min-one-of (other turtles with [not link-neighbor? myself])
                   [distance myself])
      if choice != nobody [ create-link-with choice ]
      ask links [ set color gray - 3 ]
    ]
  ]

  ; make the network look a little prettier
  repeat 10
  [
    layout-spring turtles links 0.3 (world-width / (sqrt no-of-nodes)) 1
  ]
end

;2;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to setup-urban-rural
  ask turtles[

    ;at beginning, set all to be colored by blue
    set color blue

    ;no infection and no resistance at this step
    set pop-i 0
    set pop-r 0

    ;compare links to distinguish urban and rural areas
    ifelse count link-neighbors < average-node-degree
    [
      ; Scenario 1. less linked --> countryside
      set shape "triangle"
      set pop-S rural-pop
    ]
    [
      ; Scenario 2. more linked --> city
      set shape "house"
      set pop-S urban-pop
    ]
    set current-pop (pop-s + pop-i + pop-r)
  ]
end

;3.;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to setup-initial-outbreak
  ; Scenario 1. initially happened in cities, then randomly pick turtles in cities to be red
  ifelse initial-outbreak-area = "urban-area"
  [
    ask n-of initial-outbreak-size turtles with [shape = "house"]
    [set color red]
  ]
  ; Scenario 2. norice only 3 selection, neither happen randomly nor in cities, means happen in countryside
  [
    ask n-of initial-outbreak-size turtles with [shape = "triangle"]
    [set color red]
  ]
end

;4.;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to setup-neighbor-list
  ask turtles[
    ;get their index
    set neighbor-index-list ([who] of link-neighbors)
    ;get their population
    set neighbor-pop-list ([current-pop] of link-neighbors)
  ]
end

;5.;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;See 5.1 ~ 5.3 in "go"

;6.;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;See 6.1 ~ 6.3 in "go"


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; to go function ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to go
  ;0. Record the overall population at the start of each tick
  population-at-beginning

  ;1. Internal SIR calculation
  ;Must done first!
  update-turtles-population-SIR

  ;2. External Migration preparation
  prepare-normalisation-for-destination
  prepare-decide-destination
  prepare-normalisation-for-status
  prepare-decide-status

  ;3. External Migration update
  update-turtles-population-Migration

  ;4. Update colors
  update-links-color
  update-turtles-color

  ;5. Monitoring I
  monitor-pop-all-turtles
  monitor-pop-urban-turtles
  monitor-pop-rural-turtles

  ;6. Monitoring II
  monitor-pop-%-all-turtles
  monitor-pop-%-urban-turtles
  monitor-pop-%-rural-turtles

  ;6. Stop at the fixed time to compare the results
  if ticks = 100 [stop]
  tick

end

;0.;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to population-at-beginning
  ask turtles[
    ; Store the overall population at the beginning of each tick.
    set pop-at-start current-pop
  ]
end

;1.;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to update-turtles-population-SIR
  ; this part, only apply the SIR calculation for those who have infections
  ask turtles with [color = red]
  [
    ; For group S, there are 4 final results
    let new-pop-s1  (pop-s * (1 - prob-infected))
    let new-pop-s2  (pop-s * prob-infected * prob-recovered * (1 - prob-resistant))
    let new-pop-i1  (pop-s * prob-infected * (1 - prob-recovered))
    let new-pop-r1  (pop-s * prob-infected * prob-recovered * prob-resistant)

    ; For group I, there are 3 final results
    let new-pop-s3  (pop-i * prob-recovered * (1 - prob-resistant))
    let new-pop-i2  (pop-i * (1 - prob-recovered))
    let new-pop-r2  (pop-i * prob-recovered * prob-resistant)

    ; For group R, only 1 result
    let new-pop-R3   pop-r

    ; Update the 3 groups and the total population for every node
    set pop-i floor (new-pop-i1 + new-pop-i2)
    set pop-r floor (new-pop-r1 + new-pop-r2 + new-pop-r3)
    ; Because no death rate and SIR is in fron of Migration,
    ; the total number of people would not change
    ; say: at this stage: current-pop = pop-at-start
    ; So no matter to use which in the below line
    set pop-s (current-pop - pop-i - pop-r)
    ; Notice floor is used for pop-i and pop-r
    ; The exact value of pop-s is the line below
    ;set pop-s (new-pop-s1 + new-pop-s2 + new-pop-s3)
  ]
end

;2.1;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to prepare-normalisation-for-destination
  ask turtles
  [
    ; create a new variable to store the population of all linked neighbors as a list
    let new-lst neighbor-pop-list
    ; calculate the sum of the new list
    let lst-sum sum neighbor-pop-list
    ; let every element in the list divided by its sum
    let divided-var map [ i -> i / lst-sum] new-lst
    ; cumulatively add each element one by one (means the first keeps the same and the last to be 1)
    set neighbor-pop-normalised-list butfirst reduce [[result-so-far next-item] -> lput (next-item + last result-so-far) result-so-far] fput [0] divided-var
  ]
end

;2.2;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to prepare-decide-destination
  ask turtles
  [
    ; Set a random value between 0 and 1
    set p random-float 1
    ; Compare p with each element in the neighbor-cum-list and get its index
    let p-index position p (sort lput p neighbor-pop-normalised-list)
    ; Find the [who] of the destination turtle that has the same index
    set turtle-who item p-index neighbor-index-list
  ]
end

;2.3;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to prepare-normalisation-for-status
  ask turtles
  [
    ; Calcualte the proportion of SIR population among the whole population at each node
    let rate-pop-s (pop-s / current-pop)
    let rate-pop-i (pop-i / current-pop)
    let rate-pop-r (pop-r / current-pop)

    ; Define a new list to store the 3 rates
    set here-pop-list list (rate-pop-s) (rate-pop-i)
    set here-pop-list lput rate-pop-r here-pop-list

    ; Normalise the here-pop-list and store in a new list
    set here-pop-normalised-list butfirst reduce [[result-so-far1 next-item1] -> lput (next-item1 + last result-so-far1) result-so-far1] fput [0] here-pop-list
  ]
end

;2.4;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to prepare-decide-status
  ask turtles
  [
    ; Calculate the number of tourists
    set pop-tourists (tourist-rate * current-pop)

    ; When it is bigger than 1, it's okay to use floor
    ifelse pop-tourists >= 1
    [ set pop-tourists (floor pop-tourists) ]
    [
      ; When it is less than 1, and current population is bigger than 1
      ; Set it to be 1
      ifelse current-pop > 1
      [set pop-tourists 1]
      ; Otherwise, it is 0
      [set pop-tourists 0]
    ]

    ; If no tourist, no decision to make
    ifelse pop-tourists = 0[
      set t-pop-s 0
      set t-pop-i 0
      set t-pop-r 0]
    [
      ; If there is tourist then:
      ; Set a new list as a indicator for status, which is simply [s i r]
      let sir-indicator-list list "s" "i"
      set sir-indicator-list lput "r" sir-indicator-list
      ; For each tourist, pick their status independently and store their status in a new list
      set tourist-status-list []
      repeat pop-tourists[
        let q random-float 1
        let q-index position q (sort lput q here-pop-normalised-list)
        set tourist-status-list lput (item q-index sir-indicator-list) tourist-status-list]
      ; Count occurrence in the list and get the number of each status
      set t-pop-s reduce [ [occurrence-count next-item] -> ifelse-value (next-item = "s") [occurrence-count + 1] [occurrence-count] ] (fput 0 tourist-status-list)
      set t-pop-i reduce [ [occurrence-count next-item] -> ifelse-value (next-item = "i") [occurrence-count + 1] [occurrence-count] ] (fput 0 tourist-status-list)
      set t-pop-r reduce [ [occurrence-count next-item] -> ifelse-value (next-item = "r") [occurrence-count + 1] [occurrence-count] ] (fput 0 tourist-status-list)
    ]
  ]
end

;3.;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to update-turtles-population-Migration

  ;For origins: as tourists are leaving, population should go down
  ask turtles[
    ; update each S/I/R group
    set pop-s (pop-s - t-pop-s)
    set pop-i (pop-i - t-pop-i)
    set pop-r (pop-r - t-pop-r)
    ; update the whole population
    set current-pop (pop-i + pop-s + pop-r)
  ]

  ; For destinations: as tourists are coming, population should go up
  ask turtles [
    ; for each node, find their corresponding destination node and passing the values for them to update
    ask turtle turtle-who[
      ; update each S/I/R group
      set pop-s (pop-s + [t-pop-s] of myself)
      set pop-i (pop-i + [t-pop-i] of myself)
      set pop-r (pop-r + [t-pop-r] of myself)
      ; update the overall population
      set current-pop (pop-i + pop-s + pop-r)
    ]
  ]
end

;4.1;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to update-links-color
  ; At beginning, set all links the same color
  ask links
  [ set color gray - 3 ]

  ; Then, update the links color
  ask turtles[


    ; 1: Take care of those who are both destination and origin (say 2 node, A and B)
    ifelse who = [turtle-who] of turtle turtle-who
    [
      ; Scenario 1. if no tourist are generated, BOTH from A and B
      ; set link to the origin color gray
      ifelse pop-tourists = 0 and [pop-tourists] of turtle turtle-who = 0
      [ ask link-with turtle turtle-who [set color gray]]
      [
        ; Scneario 2. if all tourists are susceptible, BOTH from A and B,
        ; set the link blue
        ifelse t-pop-s = pop-tourists and [t-pop-s] of turtle turtle-who = [pop-tourists] of turtle turtle-who[
          ask link-with turtle turtle-who
          [ set color blue ]]
        [
          ; Scneario 3. if there is infected tourist, EITHER from A and B,
          ; set the link red
          ifelse t-pop-i > 0 or [t-pop-i] of turtle turtle-who > 0[
            ask link-with turtle turtle-who
            [ set color red ]]
          [
            ; Scenario 4. if no tourist are infected, Both from A and B
            ; deduced by the situation, they are resistant, set link green
            ask link-with turtle turtle-who
            [ set color green]
          ]
        ]
      ]
    ]
    ; 2: No worry about both destination and origin
    [
      ;Scenario 1. if no tourist, set link to the origin color gray
      ifelse pop-tourists = 0
      [ ask link-with turtle turtle-who [set color gray]]
      [
        ; Scenario 2. if all tourists are susceptible, set the link blue
        ifelse t-pop-s = pop-tourists [
          ask link-with turtle turtle-who
          [ set color blue ]]
        [
          ; Scneario 3. if there is infected tourist, set the link red
          ifelse t-pop-i > 0 [
            ask link-with turtle turtle-who
            [ set color red ]]
          [
            ; Scenario 4. if no tourist are infected, deduced by the situation, they are resistant, set link green
            ask link-with turtle turtle-who
            [ set color green]
          ]
        ]
      ]
    ]
  ]

end

;4.2;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to update-turtles-color
  ; when all population are set, it is going to update color for each node based on that
  ask turtles
  [
    ifelse pop-s = current-pop
    ; BLUE = all Susceptible
    [set color blue]
    [
      ifelse pop-r < 0.9 * current-pop
      ; RED = majority not Resistant and exist infection
      [set color red]
      ; GREEN = majority Resistant
      [set color green]
    ]

  ]
end

;5.1;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to monitor-pop-all-turtles

  ; set to be empty lists
  set total-pop []
  set total-pop-s []
  set total-pop-i []
  set total-pop-r []

  ; store population of each turtles
  ask turtles[
    set total-pop lput (current-pop) total-pop
    set total-pop-s lput (pop-s) total-pop-s
    set total-pop-i lput (pop-i) total-pop-i
    set total-pop-r lput (pop-r) total-pop-r
  ]

  ; get the sum of the lists
  set sum-total-pop sum total-pop
  set %-sum-total-pop-s (sum total-pop-s) / sum-total-pop
  set %-sum-total-pop-i (sum total-pop-i) / sum-total-pop
  set %-sum-total-pop-r (sum total-pop-r) / sum-total-pop
end

;5.2;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to monitor-pop-urban-turtles

  ; set to be empty lists
  set total-pop-urban []
  set total-pop-s-urban []
  set total-pop-i-urban []
  set total-pop-r-urban []

  ; store population of each turtles
  ask turtles with [shape = "house"][
    set total-pop-urban lput (current-pop) total-pop-urban
    set total-pop-s-urban lput (pop-s) total-pop-s-urban
    set total-pop-i-urban lput (pop-i) total-pop-i-urban
    set total-pop-r-urban lput (pop-r) total-pop-r-urban
  ]

  ; get the sum of the lists
  set sum-total-pop-urban sum total-pop-urban
  set %-sum-total-pop-s-urban (sum total-pop-s-urban) / sum-total-pop-urban
  set %-sum-total-pop-i-urban (sum total-pop-i-urban) / sum-total-pop-urban
  set %-sum-total-pop-r-urban (sum total-pop-r-urban) / sum-total-pop-urban
end

;5.3;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to monitor-pop-rural-turtles

  ; set to be empty lists
  set total-pop-rural []
  set total-pop-s-rural []
  set total-pop-i-rural []
  set total-pop-r-rural []

  ; store population of each turtles
  ask turtles with [shape = "triangle"][
    set total-pop-rural lput (current-pop) total-pop-rural
    set total-pop-s-rural lput (pop-s) total-pop-s-rural
    set total-pop-i-rural lput (pop-i) total-pop-i-rural
    set total-pop-r-rural lput (pop-r) total-pop-r-rural
  ]

  ; get the sum of the lists
  set sum-total-pop-rural sum total-pop-rural
  set %-sum-total-pop-s-rural (sum total-pop-s-rural) / sum-total-pop-rural
  set %-sum-total-pop-i-rural (sum total-pop-i-rural) / sum-total-pop-rural
  set %-sum-total-pop-r-rural (sum total-pop-r-rural) / sum-total-pop-rural
end

;6.1;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to monitor-pop-%-all-turtles
  ; set to be empty lists
  set total-pop-s-% []
  set total-pop-i-% []
  set total-pop-r-% []

  ; store population of each turtles
  ask turtles[
    set total-pop-s-% lput (pop-s / current-pop) total-pop-s-%
    set total-pop-i-% lput (pop-i / current-pop) total-pop-i-%
    set total-pop-r-% lput (pop-r / current-pop) total-pop-r-%
  ]

  ; get the mean of the lists
  set mean-total-pop-s-% mean total-pop-s-%
  set mean-total-pop-i-% mean total-pop-i-%
  set mean-total-pop-r-% mean total-pop-r-%

  ;get the variacne of the lists
  set var-total-pop-r-% variance total-pop-r-%

end

;6.2;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to monitor-pop-%-urban-turtles

  ; set to be empty lists
  set total-pop-s-%-urban []
  set total-pop-i-%-urban []
  set total-pop-r-%-urban []

  ; store population rate of each turtles in cities
  ask turtles with [shape = "house"][
    set total-pop-s-%-urban lput (pop-s / current-pop) total-pop-s-%-urban
    set total-pop-i-%-urban lput (pop-i / current-pop) total-pop-i-%-urban
    set total-pop-r-%-urban lput (pop-r / current-pop) total-pop-r-%-urban
  ]

  ; get the mean of the lists
  set mean-total-pop-s-%-urban mean total-pop-s-%-urban
  set mean-total-pop-i-%-urban mean total-pop-i-%-urban
  set mean-total-pop-r-%-urban mean total-pop-r-%-urban

  ;get the variacne of the lists
  set var-total-pop-r-%-urban variance total-pop-r-%-urban
end

;6.3;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to monitor-pop-%-rural-turtles

  ; set to be empty lists
  set total-pop-s-%-rural []
  set total-pop-i-%-rural []
  set total-pop-r-%-rural []

  ; store population rate of each turtles in countryside
  ask turtles with [shape = "triangle"][
    set total-pop-s-%-rural lput (pop-s / current-pop) total-pop-s-%-rural
    set total-pop-i-%-rural lput (pop-i / current-pop) total-pop-i-%-rural
    set total-pop-r-%-rural lput (pop-r / current-pop) total-pop-r-%-rural
  ]

  ; get the mean of the lists
  set mean-total-pop-s-%-rural mean total-pop-s-%-rural
  set mean-total-pop-i-%-rural mean total-pop-i-%-rural
  set mean-total-pop-r-%-rural mean total-pop-r-%-rural

  ;get the variacne of the lists
  set var-total-pop-r-%-rural variance total-pop-r-%-rural
end
@#$#@#$#@
GRAPHICS-WINDOW
206
12
666
473
-1
-1
13.7
1
10
1
1
1
0
0
0
1
-16
16
-16
16
0
0
1
ticks
30.0

BUTTON
10
10
65
44
NIL
setup\n
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
11
50
66
83
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
1

BUTTON
72
51
127
84
step
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

SLIDER
16
356
189
389
prob-infected
prob-infected
0
1
0.7
0.01
1
NIL
HORIZONTAL

SLIDER
16
393
189
426
prob-recovered
prob-recovered
0
1
0.2
0.01
1
NIL
HORIZONTAL

SLIDER
16
430
189
463
prob-resistant
prob-resistant
0
1
0.2
0.01
1
NIL
HORIZONTAL

SLIDER
15
107
187
140
no-of-nodes
no-of-nodes
1
100
60.0
1
1
NIL
HORIZONTAL

SLIDER
15
144
194
177
average-node-degree
average-node-degree
1
20
10.0
1
1
NIL
HORIZONTAL

TEXTBOX
14
92
118
110
1. Network setting
11
0.0
1

TEXTBOX
13
253
88
271
2. SIR setting
11
0.0
1

SLIDER
16
319
198
352
initial-outbreak-size
initial-outbreak-size
1
100
6.0
1
1
NIL
HORIZONTAL

TEXTBOX
15
468
110
486
3. Tourist setting
11
0.0
1

SLIDER
17
484
195
517
tourist-rate
tourist-rate
0
1
0.3
0.01
1
NIL
HORIZONTAL

SLIDER
15
180
194
213
rural-pop
rural-pop
1
200
100.0
10
1
NIL
HORIZONTAL

SLIDER
15
216
194
249
urban-pop
urban-pop
1
20000
10000.0
100
1
NIL
HORIZONTAL

PLOT
682
274
1002
526
Measure 1 - urban VS rural
time
pop percentage
0.0
0.0
0.0
1.0
true
true
"" ""
PENS
"S-urban" 1.0 0 -14730904 true "" "plot %-sum-total-pop-s-urban"
"I-urban" 1.0 0 -8053223 true "" "plot %-sum-total-pop-i-urban"
"R-urban" 1.0 0 -11053225 true "" "plot %-sum-total-pop-r-urban"
"S-rural" 1.0 0 -8020277 true "" "plot %-sum-total-pop-s-rural"
"I-rural" 1.0 0 -1604481 true "" "plot %-sum-total-pop-i-rural"
"R-rural" 1.0 0 -4539718 true "" "plot %-sum-total-pop-r-rural"

PLOT
1013
64
1333
268
Compare Measure 1 VS 2 for all
time
pop percentage
0.0
0.0
0.0
1.0
true
true
"" "\n"
PENS
"%-sum-s" 1.0 0 -14730904 true "" "plot %-sum-total-pop-s"
"%-sum-i" 1.0 0 -8053223 true "" "plot %-sum-total-pop-i"
"%-sum-r" 1.0 0 -11053225 true "" "plot %-sum-total-pop-r"
"mean-s-%" 1.0 0 -8020277 true "" "plot mean-total-pop-s-%"
"mean-i-%" 1.0 0 -1604481 true "" "plot mean-total-pop-i-%"
"mean-r-%" 1.0 0 -4539718 true "" "plot mean-total-pop-r-%"

PLOT
1013
274
1333
526
Measure 2 - urban VS rural
time
pop percentage
0.0
0.0
0.0
1.0
true
true
"" ""
PENS
"S-urban" 1.0 0 -14730904 true "" "plot mean-total-pop-s-%-urban"
"I-urban" 1.0 0 -8053223 true "" "plot mean-total-pop-i-%-urban"
"R-urban" 1.0 0 -11053225 true "" "plot mean-total-pop-r-%-urban"
"S-rural" 1.0 0 -8020277 true "" "plot mean-total-pop-s-%-rural"
"I-rural" 1.0 0 -1604481 true "" "plot mean-total-pop-i-%-rural"
"R-rural" 1.0 0 -4539718 true "" "plot mean-total-pop-r-%-rural"

PLOT
682
64
1002
270
Visualise Migration
time
pop size
0.0
0.0
0.0
10.0
true
true
"" ""
PENS
"whole" 1.0 0 -8630108 true "" "plot sum-total-pop"
"urban" 1.0 0 -5825686 true "" "plot sum-total-pop-urban"
"rural" 1.0 0 -2064490 true "" "plot sum-total-pop-rural"

CHOOSER
15
269
171
314
initial-outbreak-area
initial-outbreak-area
"urban-area" "rural-area"
0

TEXTBOX
77
12
178
43
Notice if there exsists node has no link, please setup again.
8
0.0
1

MONITOR
754
12
817
57
urban no
count turtles with [shape = \"house\"]
17
1
11

MONITOR
823
12
882
57
rural no
count turtles with [shape = \"triangle\"]
17
1
11

MONITOR
888
12
956
57
%-sum-r
%-sum-total-pop-r
17
1
11

MONITOR
965
12
1040
57
mean-r-%
mean-total-pop-r-%
17
1
11

MONITOR
1048
12
1114
57
red urban
count turtles with [color = red and shape = \"house\"]
17
1
11

MONITOR
1119
13
1178
58
red rural
count turtles with [color = red and shape = \"triangle\"]
17
1
11

MONITOR
683
12
748
57
all pop
sum-total-pop
17
1
11

MONITOR
1184
14
1242
59
red-%
count turtles with [color = red] / count turtles
17
1
11

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
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

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

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

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.2.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="virus-1" repetitions="30" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>%-sum-total-pop-i</metric>
    <metric>%-sum-total-pop-i-urban</metric>
    <metric>%-sum-total-pop-i-rural</metric>
    <metric>%-sum-total-pop-r</metric>
    <metric>%-sum-total-pop-r-urban</metric>
    <metric>%-sum-total-pop-r-rural</metric>
    <metric>mean-total-pop-i-%</metric>
    <metric>mean-total-pop-i-%-urban</metric>
    <metric>mean-total-pop-i-%-rural</metric>
    <metric>mean-total-pop-r-%</metric>
    <metric>mean-total-pop-r-%-urban</metric>
    <metric>mean-total-pop-r-%-rural</metric>
    <metric>var-total-pop-r-%</metric>
    <metric>var-total-pop-r-%-urban</metric>
    <metric>var-total-pop-r-%-rural</metric>
    <enumeratedValueSet variable="no-of-nodes">
      <value value="60"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-node-degree">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rural-pop">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="urban-pop">
      <value value="10000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="initial-outbreak-area">
      <value value="&quot;rural-area&quot;"/>
      <value value="&quot;urban-area&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="initial-outbreak-size">
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="prob-infected">
      <value value="0.7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="prob-recovered">
      <value value="0.55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="prob-resistant">
      <value value="0.2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="tourist-rate">
      <value value="0.05"/>
      <value value="0.15"/>
      <value value="0.3"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="virus-2" repetitions="30" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>%-sum-total-pop-i</metric>
    <metric>%-sum-total-pop-i-urban</metric>
    <metric>%-sum-total-pop-i-rural</metric>
    <metric>%-sum-total-pop-r</metric>
    <metric>%-sum-total-pop-r-urban</metric>
    <metric>%-sum-total-pop-r-rural</metric>
    <metric>mean-total-pop-i-%</metric>
    <metric>mean-total-pop-i-%-urban</metric>
    <metric>mean-total-pop-i-%-rural</metric>
    <metric>mean-total-pop-r-%</metric>
    <metric>mean-total-pop-r-%-urban</metric>
    <metric>mean-total-pop-r-%-rural</metric>
    <metric>var-total-pop-r-%</metric>
    <metric>var-total-pop-r-%-urban</metric>
    <metric>var-total-pop-r-%-rural</metric>
    <enumeratedValueSet variable="no-of-nodes">
      <value value="60"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-node-degree">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rural-pop">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="urban-pop">
      <value value="10000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="initial-outbreak-area">
      <value value="&quot;rural-area&quot;"/>
      <value value="&quot;urban-area&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="initial-outbreak-size">
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="prob-infected">
      <value value="0.7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="prob-recovered">
      <value value="0.2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="prob-resistant">
      <value value="0.55"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="tourist-rate">
      <value value="0.05"/>
      <value value="0.15"/>
      <value value="0.3"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="virus-3" repetitions="30" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <metric>%-sum-total-pop-i</metric>
    <metric>%-sum-total-pop-i-urban</metric>
    <metric>%-sum-total-pop-i-rural</metric>
    <metric>%-sum-total-pop-r</metric>
    <metric>%-sum-total-pop-r-urban</metric>
    <metric>%-sum-total-pop-r-rural</metric>
    <metric>mean-total-pop-i-%</metric>
    <metric>mean-total-pop-i-%-urban</metric>
    <metric>mean-total-pop-i-%-rural</metric>
    <metric>mean-total-pop-r-%</metric>
    <metric>mean-total-pop-r-%-urban</metric>
    <metric>mean-total-pop-r-%-rural</metric>
    <metric>var-total-pop-r-%</metric>
    <metric>var-total-pop-r-%-urban</metric>
    <metric>var-total-pop-r-%-rural</metric>
    <enumeratedValueSet variable="no-of-nodes">
      <value value="60"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="average-node-degree">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="rural-pop">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="urban-pop">
      <value value="10000"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="initial-outbreak-area">
      <value value="&quot;rural-area&quot;"/>
      <value value="&quot;urban-area&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="initial-outbreak-size">
      <value value="6"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="prob-infected">
      <value value="0.7"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="prob-recovered">
      <value value="0.2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="prob-resistant">
      <value value="0.2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="tourist-rate">
      <value value="0.05"/>
      <value value="0.15"/>
      <value value="0.3"/>
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
