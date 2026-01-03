.MODEL SMALL
.STACK 100H

.DATA
    ; ========== WELCOME MESSAGES ==========
    welcomeMsg1 DB '********************************************************$'
    welcomeMsg2 DB '**      Welcome to LOCAL EVENT BOOKING SYSTEM          **$'
    welcomeMsg3 DB '********************************************************$'
    newline DB 13, 10, '$'

    ; ========== EVENT CATEGORIES ==========
    eventCategoryMsg DB '**            EVENT CATEGORIES                     **$'
    concertMsg       DB '**  [C] Concerts         - BDT $'
    sportsMsg        DB '**  [S] Sports Events    - BDT $'
    workshopMsg      DB '**  [W] Workshops        - BDT $'
    categoryEnd      DB '********************************************************$'
    menuPadding      DB '                 **$'

    ; ========== EXTRA OPTIONS ==========
    extrasHeader     DB '**            EXTRA OPTIONS                        **$'
    parkingMsg       DB '**  [P] Parking Pass     - BDT $'
    merchandiseMsg   DB '**  [M] Merchandise      - BDT $'
    vipMsg           DB '**  [V] VIP Upgrade      - BDT $'

    ; ========== USER PROMPTS ==========
    promptSelectEvent DB 'Select event (C/S/W): $'
    promptNumTickets  DB 'Number of tickets (max $'
    non               DB '): $'
    promptAddMore     DB 'Add another event? (Y/N): $'
    promptWhichExtra  DB 'Select extra (P/M/V) or X to finish: $'
    promptCoupon      DB 'Have a coupon code? (Y/N): $'
    enterCouponCode   DB 'Enter coupon code (3 chars): $'
    confirmBooking    DB 'Confirm booking? (Y/N): $'

    ; ========== FEATURE 3: CART MODIFICATION ==========
    modifyCartMsg     DB 'Modify cart? (Y/N): $'
    modifyMenuMsg     DB '** [R] Remove Event  [Q] Change Quantity  [E] Change Extras **$'
    selectModOption   DB 'Select option (R/Q/E) or X to finish: $'
    selectEventNum    DB 'Enter event number to modify $'
    noEventsMsg       DB 'No events in cart to modify!$'
    eventRemovedMsg   DB 'Event removed successfully!$'
    enterNewQuantity  DB 'Enter new quantity : $'
    quantityUpdated   DB 'Quantity updated successfully!$'
    modifyExtrasMsg   DB 'Modify Extras: [A] Add  [D] Remove  [X] Done: $'
    selectExtraOption DB 'Select extra (P/M/V): $'
    extraAddedMsg     DB 'Extra added successfully!$'
    extraRemovedMsg   DB 'Extra removed successfully!$'
    noExtraToRemove   DB 'Extra not in cart!$'

    ; ========== FEATURE 6: ADMIN MODE ==========
    adminModeMsg      DB '**            ADMIN MODE                           **$'
    enterPasswordMsg  DB 'Enter 4-character password: $'
    passwordCorrect   DB 'Access Granted! Welcome Admin.$'
    passwordIncorrect DB 'Access Denied! Incorrect password.$'
    adminMenuMsg      DB '** [P] Change Prices  [T] Change Ticket Limit **$'
    adminMenuMsg2     DB '** [D] Change Coupon Discount  [X] Exit Admin **$'
    selectAdminOpt    DB 'Select option: $'
    enterConcertPrice DB 'Enter new Concert price: $'
    enterSportsPrice  DB 'Enter new Sports price: $'
    enterWorkshopPrice DB 'Enter new Workshop price: $'
    enterParkingPrice DB 'Enter new Parking price: $'
    enterMerchPrice   DB 'Enter new Merchandise price: $'
    enterVIPPrice     DB 'Enter new VIP price: $'
    enterMaxTickets   DB 'Enter new max tickets (1-9): $'
    enterCouponDisc   DB 'Enter new coupon discount % (1-99): $'
    pricesUpdated     DB 'Prices updated successfully!$'
    ticketLimitUpdated DB 'Ticket limit updated successfully!$'
    couponUpdated     DB 'Coupon discount updated successfully!$'
    adminPrompt       DB 'Access Admin Mode? (Y/N): $'

    ; ========== SUCCESS AND ERROR MESSAGES ==========
    thankyouMsg        DB 'Thank you for using Local Event Booking System!$'
    bookingSuccessMsg  DB 'Yay, booking confirmed! Enjoy your events!$'
    errorInvEvent      DB 'Invalid event code. Try again.$'
    errorTooMany       DB 'Error: Invalid Input.$'
    errorInvInput      DB 'Invalid input. Try again.$'
    errorInvExtra      DB 'Invalid extra selection.$'
    alreadySelectedMsg DB 'Extra already selected.Choose different extras$'
    maxEventsMsg       DB 'Maximum 5 events allowed per booking.$'
    eventAlreadyBooked DB 'Event already booked! Choose different event.$'
    allEventsBooked    DB 'All event types booked! Moving to extras...$'
    allExtrasSelected  DB 'All extras selected! Moving to checkout...$'

    ; ========== BILL DISPLAY ==========
    billHeader       DB '************** BOOKING DETAILS **************$'
    eventTypeMsg     DB 'Event Type: $'
    concertType      DB 'Concert$'
    sportsType       DB 'Sports Event$'
    workshopType     DB 'Workshop$'
    numTicketsMsg    DB 'Tickets: $'
    ticketPriceMsg   DB 'Price/ticket: BDT $'
    extrasListMsg    DB 'Extras: $'
    parkingSelected  DB 'Parking, $'
    merchSelected    DB 'Merchandise, $'
    vipSelected      DB 'VIP Upgrade, $'
    noExtrasSelected DB 'None$'
    subtotalMsg      DB 'Subtotal: BDT $'
    discountMsg      DB 'Group Discount (15%): BDT $'
    couponDiscountMsg DB 'Coupon Discount: BDT $'
    totalBillMsg     DB 'TOTAL AMOUNT: BDT $'
    discountApplied  DB 'Group discount applied (15%)!$'
    validCouponMsg   DB 'Coupon applied! Discount: $'
    invalidCouponMsg DB 'Invalid coupon code.$'
    divider          DB '--------------------------------------------$'
    eventNumMsg      DB 'Event #$'

    ; ========== PRICE TABLES ==========
    eventPrices DW 500, 300, 200     ; Concert, Sports, Workshop
    extraPrices DW 100, 150, 250     ; Parking, Merchandise, VIP

    ; ========== MULTI-EVENT STORAGE ==========
    MAX_EVENTS EQU 5
    eventTypes    DB MAX_EVENTS DUP(?)   ; Store event codes (C/S/W)
    eventTickets  DB MAX_EVENTS DUP(?)   ; Store ticket quantities
    numEvents     DB 0                    ; Current number of events

    ; ========== EXTRAS FLAGS ==========
    hasParking DB 0
    hasMerch   DB 0
    hasVIP     DB 0

    ; ========== BILLING VARIABLES ==========
    subtotal   DW 0
    discount   DW 0
    couponDisc DW 0
    totalBill  DW 0

    ; ========== COUPON VALIDATION ==========
    couponCode  DB 3 DUP(?)
    validCoupon DB 'AST'
    couponDiscountPercent DB 10

    ; ========== ADMIN CREDENTIALS ==========
    adminPassword DB 'PASS'
    adminInputBuffer DB 4 DUP(?)

    ; ========== CONFIGURATION ==========
    maxTicketsLimit DB 5

    ; ========== TEMPORARY STORAGE ==========
    tempAX DW 0
    tempBX DW 0
    tempDX DW 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; ========== CHECK FOR ADMIN MODE ==========
    CALL PrintNewline
    LEA DX, adminPrompt
    CALL PrintString
    CALL GetCharToUpper
    
    CMP AL, 'Y'
    JE AdminModeAccess
    CMP AL, 'N'
    JNE InvalidAdminChoice
    JMP StartBooking

InvalidAdminChoice:
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP MAIN

AdminModeAccess:
    CALL AdminMode
    
StartBooking:
    ;DISPLAY WELCOME SCREEN 
    CALL PrintNewline
    LEA DX, welcomeMsg1
    CALL PrintString
    CALL PrintNewline
    LEA DX, welcomeMsg2
    CALL PrintString
    CALL PrintNewline
    LEA DX, welcomeMsg3
    CALL PrintString
    
    ; Initialize event counter
    MOV numEvents, 0
    
;  FEATURE 1 & 2: EVENT BOOKING LOOP 
EventBookingLoop:
    ; Check if max events reached
    MOV AL, numEvents
    CMP AL, MAX_EVENTS
    JGE MaxEventsReached
    
    ; Display event menu with dynamic prices
    CALL PrintNewline
    LEA DX, eventCategoryMsg
    CALL PrintString
    CALL PrintNewline
    
    ; Display Concert with price
    LEA DX, concertMsg
    CALL PrintString
    MOV AX, eventPrices[0]
    CALL DisplayNumber
    LEA DX, menuPadding
    CALL PrintString
    CALL PrintNewline
    
    ; Display Sports with price
    LEA DX, sportsMsg
    CALL PrintString
    MOV AX, eventPrices[2]
    CALL DisplayNumber
    LEA DX, menuPadding
    CALL PrintString
    CALL PrintNewline
    
    ; Display Workshop with price
    LEA DX, workshopMsg
    CALL PrintString
    MOV AX, eventPrices[4]
    CALL DisplayNumber
    LEA DX, menuPadding
    CALL PrintString
    CALL PrintNewline
    
    LEA DX, categoryEnd
    CALL PrintString
    
EventSelection:
    CALL PrintNewline
    LEA DX, promptSelectEvent
    CALL PrintString
    CALL GetCharToUpper
    
    ; Validate event code
    CMP AL, 'C'
    JE ValidEvent
    CMP AL, 'S'
    JE ValidEvent
    CMP AL, 'W'
    JE ValidEvent
    
    ; Invalid event code
    CALL PrintNewline
    LEA DX, errorInvEvent
    CALL PrintString
    JMP EventSelection
    
ValidEvent:
    ; Check if this event type already booked
    MOV CL, AL
    MOV BX, 0
    
CheckDuplicateLoop:
    CMP BL, numEvents
    JGE NoDuplicate
    
    LEA SI, eventTypes
    ADD SI, BX
    MOV DL, [SI]
    CMP DL, CL
    JE DuplicateFound
    
    INC BX
    JMP CheckDuplicateLoop
    
DuplicateFound:
    CALL PrintNewline
    LEA DX, eventAlreadyBooked
    CALL PrintString
    JMP EventSelection
    
NoDuplicate:
    ; Store event code
    MOV AL, CL
    MOV BL, numEvents
    MOV BH, 0
    LEA SI, eventTypes
    ADD SI, BX
    MOV [SI], AL
    
TicketQuantity:
    CALL PrintNewline
    LEA DX, promptNumTickets
    CALL PrintString
    
    ; Display max ticket limit
    MOV DL, maxTicketsLimit
    ADD DL, 48
    MOV AH, 2
    INT 21H
    
    LEA DX, non
    CALL PrintString
    
    ; Get ticket quantity input
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    
    ; Validate ticket quantity
    CMP AL, 0
    JLE InvalidTickets
    MOV BL, maxTicketsLimit
    CMP AL, BL
    JG TooManyTickets
    
    ; Store ticket quantity
    MOV BL, numEvents
    MOV BH, 0
    LEA SI, eventTickets
    ADD SI, BX
    MOV [SI], AL
    
    ; Increment event counter
    INC numEvents
    
    ; Check if all 3 event types have been booked
    MOV AL, numEvents
    CMP AL, 3
    JGE AllEventsBookedCheck
    
AskAddMore:
    CALL PrintNewline
    LEA DX, promptAddMore
    CALL PrintString
    CALL GetCharToUpper
    
    CMP AL, 'Y'
    JE EventBookingLoop
    CMP AL, 'N'
    JE ExtrasPrompt
    
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP AskAddMore

AllEventsBookedCheck:
    CALL PrintNewline
    LEA DX, allEventsBooked
    CALL PrintString
    JMP ExtrasPrompt
    
InvalidTickets:
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP TicketQuantity
    
TooManyTickets:
    CALL PrintNewline
    LEA DX, errorTooMany
    CALL PrintString
    JMP TicketQuantity
    
MaxEventsReached:
    CALL PrintNewline
    LEA DX, maxEventsMsg
    CALL PrintString
    JMP ExtrasPrompt

; ========== EXTRAS SELECTION ==========
ExtrasPrompt:
    ; Display extras menu with dynamic prices
    CALL PrintNewline
    LEA DX, extrasHeader
    CALL PrintString
    CALL PrintNewline
    
    ; Display Parking with price
    LEA DX, parkingMsg
    CALL PrintString
    MOV AX, extraPrices[0]
    CALL DisplayNumber
    LEA DX, menuPadding
    CALL PrintString
    CALL PrintNewline
    
    ; Display Merchandise with price
    LEA DX, merchandiseMsg
    CALL PrintString
    MOV AX, extraPrices[2]
    CALL DisplayNumber
    LEA DX, menuPadding
    CALL PrintString
    CALL PrintNewline
    
    ; Display VIP with price
    LEA DX, vipMsg
    CALL PrintString
    MOV AX, extraPrices[4]
    CALL DisplayNumber
    LEA DX, menuPadding
    CALL PrintString
    CALL PrintNewline
    
    LEA DX, categoryEnd
    CALL PrintString
    
SelectExtras:
    CALL PrintNewline
    LEA DX, promptWhichExtra
    CALL PrintString
    CALL GetCharToUpper
    
    CMP AL, 'P'
    JE AddParking
    CMP AL, 'M'
    JE AddMerchandise
    CMP AL, 'V'
    JE AddVIP
    CMP AL, 'X'
    JE ModifyCartCheck
    
    CALL PrintNewline
    LEA DX, errorInvExtra
    CALL PrintString
    JMP SelectExtras
    
AddParking:
    CMP hasParking, 1
    JE AlreadySelected
    MOV hasParking, 1
    CALL CheckAllExtras
    CMP AL, 1
    JE AllExtrasComplete
    JMP SelectExtras
    
AddMerchandise:
    CMP hasMerch, 1
    JE AlreadySelected
    MOV hasMerch, 1
    CALL CheckAllExtras
    CMP AL, 1
    JE AllExtrasComplete
    JMP SelectExtras
    
AddVIP:
    CMP hasVIP, 1
    JE AlreadySelected
    MOV hasVIP, 1
    CALL CheckAllExtras
    CMP AL, 1
    JE AllExtrasComplete
    JMP SelectExtras
    
AlreadySelected:
    CALL PrintNewline
    LEA DX, alreadySelectedMsg
    CALL PrintString
    JMP SelectExtras

AllExtrasComplete:
    CALL PrintNewline
    LEA DX, allExtrasSelected
    CALL PrintString
    JMP ModifyCartCheck

; ========== FEATURE 3: MODIFY CART ==========
ModifyCartCheck:
    ; Check if there are any events
    CMP numEvents, 0
    JE CalculateBill
    
    CALL PrintNewline
    LEA DX, modifyCartMsg
    CALL PrintString
    CALL GetCharToUpper
    
    CMP AL, 'Y'
    JE ModifyCartMenu
    CMP AL, 'N'
    JE CalculateBill
    
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP ModifyCartCheck

ModifyCartMenu:
    CALL PrintNewline
    LEA DX, modifyMenuMsg
    CALL PrintString
    CALL PrintNewline
    LEA DX, selectModOption
    CALL PrintString
    CALL GetCharToUpper
    
    CMP AL, 'R'
    JE RemoveEvent
    CMP AL, 'Q'
    JE ChangeQuantity
    CMP AL, 'E'
    JE ModifyExtrasMenu
    CMP AL, 'X'
    JE CalculateBill
    
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP ModifyCartMenu

RemoveEvent:
    ; Display current events
    CALL DisplayCurrentCart
    
    CALL PrintNewline
    LEA DX, selectEventNum
    CALL PrintString

    MOV DL, ':'
    MOV AH, 2
    INT 21H
    MOV DL, ' '
    MOV AH, 2
    INT 21H
    
    ; Get event number to remove
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    

    CMP AL, 1
    JL InvalidEventNum
    MOV BL, numEvents
    CMP AL, BL
    JG InvalidEventNum
    
    ; Remove event 
    DEC AL
    MOV BL, AL
    MOV BH, 0
    
RemoveLoop:
    MOV AL, numEvents
    DEC AL
    CMP BL, AL
    JGE RemoveDone
    
    ; Shift event types
    LEA SI, eventTypes
    ADD SI, BX
    MOV AL, [SI+1]
    MOV [SI], AL
    
    ; Shift ticket quantities
    LEA SI, eventTickets
    ADD SI, BX
    MOV AL, [SI+1]
    MOV [SI], AL
    
    INC BX
    JMP RemoveLoop
    
RemoveDone:
    DEC numEvents
    CALL PrintNewline
    LEA DX, eventRemovedMsg
    CALL PrintString
    JMP ModifyCartMenu

InvalidEventNum:
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP RemoveEvent

ChangeQuantity:
    ; Display current events
    CALL DisplayCurrentCart
    
    CALL PrintNewline
    LEA DX, selectEventNum
    CALL PrintString
    
    MOV DL, ':'
    MOV AH, 2
    INT 21H
    MOV DL, ' '
    MOV AH, 2
    INT 21H
    
    ; Get event number
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    
    CMP AL, 1
    JL InvalidQtyEvent
    MOV BL, numEvents
    CMP AL, BL
    JG InvalidQtyEvent
    
    DEC AL
    MOV BL, AL
    
    ; Get new quantity
    CALL PrintNewline
    LEA DX, enterNewQuantity
    CALL PrintString
    
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    
    CMP AL, 0
    JLE InvalidNewQty
    MOV CL, maxTicketsLimit
    CMP AL, CL
    JG InvalidNewQty
    
    ; Update quantity
    MOV BH, 0
    LEA SI, eventTickets
    ADD SI, BX
    MOV [SI], AL
    
    CALL PrintNewline
    LEA DX, quantityUpdated
    CALL PrintString
    JMP ModifyCartMenu

InvalidQtyEvent:
InvalidNewQty:
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP ChangeQuantity

ModifyExtrasMenu:
    CALL PrintNewline
    LEA DX, modifyExtrasMsg
    CALL PrintString
    CALL GetCharToUpper
    
    CMP AL, 'A'
    JE AddExtraOption
    CMP AL, 'D'
    JE RemoveExtraOption
    CMP AL, 'X'
    JE CalculateBill
    
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP ModifyExtrasMenu

AddExtraOption:
    CALL PrintNewline
    LEA DX, selectExtraOption
    CALL PrintString
    CALL GetCharToUpper
    
    CMP AL, 'P'
    JE AddParkingMod
    CMP AL, 'M'
    JE AddMerchMod
    CMP AL, 'V'
    JE AddVIPMod
    
    CALL PrintNewline
    LEA DX, errorInvExtra
    CALL PrintString
    JMP AddExtraOption

AddParkingMod:
    CMP hasParking, 1
    JE AlreadyHasExtra
    MOV hasParking, 1
    CALL PrintNewline
    LEA DX, extraAddedMsg
    CALL PrintString
    JMP ModifyExtrasMenu

AddMerchMod:
    CMP hasMerch, 1
    JE AlreadyHasExtra
    MOV hasMerch, 1
    CALL PrintNewline
    LEA DX, extraAddedMsg
    CALL PrintString
    JMP ModifyExtrasMenu

AddVIPMod:
    CMP hasVIP, 1
    JE AlreadyHasExtra
    MOV hasVIP, 1
    CALL PrintNewline
    LEA DX, extraAddedMsg
    CALL PrintString
    JMP ModifyExtrasMenu

AlreadyHasExtra:
    CALL PrintNewline
    LEA DX, alreadySelectedMsg
    CALL PrintString
    JMP AddExtraOption

RemoveExtraOption:
    CALL PrintNewline
    LEA DX, selectExtraOption
    CALL PrintString
    CALL GetCharToUpper
    
    CMP AL, 'P'
    JE RemoveParkingMod
    CMP AL, 'M'
    JE RemoveMerchMod
    CMP AL, 'V'
    JE RemoveVIPMod
    
    CALL PrintNewline
    LEA DX, errorInvExtra
    CALL PrintString
    JMP RemoveExtraOption

RemoveParkingMod:
    CMP hasParking, 0
    JE NoExtraFound
    MOV hasParking, 0
    CALL PrintNewline
    LEA DX, extraRemovedMsg
    CALL PrintString
    JMP ModifyExtrasMenu

RemoveMerchMod:
    CMP hasMerch, 0
    JE NoExtraFound
    MOV hasMerch, 0
    CALL PrintNewline
    LEA DX, extraRemovedMsg
    CALL PrintString
    JMP ModifyExtrasMenu

RemoveVIPMod:
    CMP hasVIP, 0
    JE NoExtraFound
    MOV hasVIP, 0
    CALL PrintNewline
    LEA DX, extraRemovedMsg
    CALL PrintString
    JMP ModifyExtrasMenu

NoExtraFound:
    CALL PrintNewline
    LEA DX, noExtraToRemove
    CALL PrintString
    JMP RemoveExtraOption

; ========== FEATURE 4 & 5: CALCULATE BILL ==========
CalculateBill:
    MOV subtotal, 0
    MOV SI, 0
    
CalcEventLoop:
    ; Calculate event costs
    MOV AL, numEvents
    MOV AH, 0
    CMP SI, AX
    JGE AddExtras
    
    LEA BX, eventTypes
    ADD BX, SI
    MOV AL, [BX]
    
    CMP AL, 'C'
    JE UseConcertPrice
    CMP AL, 'S'
    JE UseSportsPrice
    CMP AL, 'W'
    JE UseWorkshopPrice
    
UseConcertPrice:
    MOV AX, eventPrices[0]
    JMP CalcEventCost
    
UseSportsPrice:
    MOV AX, eventPrices[2]
    JMP CalcEventCost
    
UseWorkshopPrice:
    MOV AX, eventPrices[4]
    
CalcEventCost:
    ; Multiply price by quantity
    LEA BX, eventTickets
    ADD BX, SI
    MOV BL, [BX]
    MOV BH, 0
    MUL BX
    ADD subtotal, AX
    
    INC SI
    JMP CalcEventLoop
    
AddExtras:
    ; Add parking cost
    CMP hasParking, 1
    JNE CheckMerch
    MOV AX, extraPrices[0]
    ADD subtotal, AX
    
CheckMerch:
    ; Add merchandise cost
    CMP hasMerch, 1
    JNE CheckVIPCost
    MOV AX, extraPrices[2]
    ADD subtotal, AX
    
CheckVIPCost:
    ; Add VIP cost
    CMP hasVIP, 1
    JNE CalcDiscount
    MOV AX, extraPrices[4]
    ADD subtotal, AX
    
CalcDiscount:
    MOV discount, 0
    MOV AL, 0
    MOV SI, 0
    
CountTicketsLoop:
    ; Count total tickets for group discount
    MOV BL, numEvents
    MOV BH, 0
    CMP SI, BX
    JGE CheckGroupDisc
    
    LEA BX, eventTickets
    ADD BX, SI
    ADD AL, [BX]
    
    INC SI
    JMP CountTicketsLoop
    
CheckGroupDisc:
    ; Apply 15% discount if 3+ tickets
    CMP AL, 3
    JL CouponPrompt
    
    MOV AX, subtotal
    MOV DX, 0
    MOV BX, 15
    MUL BX
    MOV BX, 100
    DIV BX
    MOV discount, AX
    
CouponPrompt:
    CALL PrintNewline
    LEA DX, promptCoupon
    CALL PrintString
    CALL GetCharToUpper
    
    CMP AL, 'Y'
    JE EnterCoupon
    CMP AL, 'N'
    JE FinalizeTotal
    
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP CouponPrompt
    
EnterCoupon:
    CALL PrintNewline
    LEA DX, enterCouponCode
    CALL PrintString
    
    ; Read 3 character coupon code
    MOV CX, 3
    LEA SI, couponCode
    
ReadCoupon:
    CALL GetCharToUpper
    MOV [SI], AL
    INC SI
    LOOP ReadCoupon
    
    ; Validate coupon byte by byte
    MOV CX, 3
    LEA SI, couponCode
    LEA DI, validCoupon
    
ValidateCoupon:
    MOV AL, [SI]
    MOV BL, [DI]
    CMP AL, BL
    JNE InvalidCoupon
    INC SI
    INC DI
    LOOP ValidateCoupon
    
    ; Apply coupon discount
    MOV AX, subtotal
    MOV DX, 0
    MOV BL, couponDiscountPercent
    MOV BH, 0
    MUL BX
    MOV BX, 100
    DIV BX
    MOV couponDisc, AX
    
    CALL PrintNewline
    LEA DX, validCouponMsg
    CALL PrintString
    MOV AL, couponDiscountPercent
    MOV AH, 0
    CALL DisplayNumber
    MOV DL, '%'
    MOV AH, 2
    INT 21H
    JMP FinalizeTotal
    
InvalidCoupon:
    CALL PrintNewline
    LEA DX, invalidCouponMsg
    CALL PrintString
    MOV couponDisc, 0
    
FinalizeTotal:
    ; Calculate final total
    MOV AX, subtotal
    SUB AX, discount
    SUB AX, couponDisc
    MOV totalBill, AX
    
    ; Display booking details
    CALL PrintNewline
    CALL PrintNewline
    LEA DX, billHeader
    CALL PrintString
    
    MOV SI, 0
    
DisplayEventsLoop:
    ; Display each event details
    MOV AL, numEvents
    MOV AH, 0
    CMP SI, AX
    JGE DisplayExtrasInfo
    
    CALL PrintNewline
    LEA DX, eventNumMsg
    CALL PrintString
    
    ; Display event number
    MOV AX, SI
    INC AL
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H
    
    CALL PrintNewline
    LEA DX, eventTypeMsg
    CALL PrintString
    
    ; Display event type
    LEA BX, eventTypes
    ADD BX, SI
    MOV AL, [BX]
    
    CMP AL, 'C'
    JE DispConcert
    CMP AL, 'S'
    JE DispSports
    JMP DispWorkshop
    
DispConcert:
    LEA DX, concertType
    JMP PrintEvType
    
DispSports:
    LEA DX, sportsType
    JMP PrintEvType
    
DispWorkshop:
    LEA DX, workshopType
    
PrintEvType:
    CALL PrintString
    
    ; Display number of tickets
    CALL PrintNewline
    LEA DX, numTicketsMsg
    CALL PrintString
    
    LEA BX, eventTickets
    ADD BX, SI
    MOV DL, [BX]
    ADD DL, 30H
    MOV AH, 2
    INT 21H
    
    INC SI
    JMP DisplayEventsLoop
    
DisplayExtrasInfo:
    ; Display extras information
    CALL PrintNewline
    LEA DX, extrasListMsg
    CALL PrintString
    CALL DisplayExtras
    
    ; Display subtotal
    CALL PrintNewline
    LEA DX, subtotalMsg
    CALL PrintString
    MOV AX, subtotal
    CALL DisplayNumber
    
    ; Display group discount if applicable
    CMP discount, 0
    JE CheckCouponDisc
    
    CALL PrintNewline
    LEA DX, discountApplied
    CALL PrintString
    CALL PrintNewline
    LEA DX, discountMsg
    CALL PrintString
    MOV AX, discount
    CALL DisplayNumber
    
CheckCouponDisc:
    ; Display coupon discount if applicable
    CMP couponDisc, 0
    JE DisplayTotal
    
    CALL PrintNewline
    LEA DX, couponDiscountMsg
    CALL PrintString
    MOV AX, couponDisc
    CALL DisplayNumber
    
DisplayTotal:
    ; Display final total
    CALL PrintNewline
    LEA DX, divider
    CALL PrintString
    CALL PrintNewline
    LEA DX, totalBillMsg
    CALL PrintString
    MOV AX, totalBill
    CALL DisplayNumber
    CALL PrintNewline
    LEA DX, divider
    CALL PrintString
    
ConfirmPrompt:
    ; Ask for booking confirmation
    CALL PrintNewline
    LEA DX, confirmBooking
    CALL PrintString
    CALL GetCharToUpper
    
    CMP AL, 'Y'
    JE BookingConfirmed
    CMP AL, 'N'
    JE CancelBooking
    
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP ConfirmPrompt
    
BookingConfirmed:
    CALL PrintNewline
    LEA DX, bookingSuccessMsg
    CALL PrintString
    JMP ExitProgram
    
CancelBooking:
    CALL PrintNewline
    LEA DX, thankyouMsg
    CALL PrintString
    
ExitProgram:
    MOV AX, 4C00H
    INT 21H
MAIN ENDP


; FEATURE 6: ADMIN MODE PROCEDURE

AdminMode PROC
TryPassword:
    CALL PrintNewline
    LEA DX, adminModeMsg
    CALL PrintString
    CALL PrintNewline
    LEA DX, enterPasswordMsg
    CALL PrintString
    
    ; Read 4 character password (masked with *)
    MOV CX, 4
    LEA SI, adminInputBuffer
    
ReadPassword:
    MOV AH, 8                 ; Read character without echo
    INT 21H
    MOV [SI], AL
    MOV DL, '*'               ; Display asterisk
    MOV AH, 2
    INT 21H
    INC SI
    LOOP ReadPassword
    
    ; Validate password byte by byte
    MOV CX, 4
    LEA SI, adminInputBuffer
    LEA DI, adminPassword
    
CheckPassword:
    MOV AL, [SI]
    MOV BL, [DI]
    CMP AL, BL
    JNE PasswordFailed
    INC SI
    INC DI
    LOOP CheckPassword
    
    ; Password correct - grant access
    CALL PrintNewline
    LEA DX, passwordCorrect
    CALL PrintString
    
AdminMenuLoop:
    ; Display admin menu options
    CALL PrintNewline
    LEA DX, adminMenuMsg
    CALL PrintString
    CALL PrintNewline
    LEA DX, adminMenuMsg2
    CALL PrintString
    CALL PrintNewline
    LEA DX, selectAdminOpt
    CALL PrintString
    CALL GetCharToUpper
    
    CMP AL, 'P'
    JE ChangePrices
    CMP AL, 'T'
    JE ChangeTicketLimit
    CMP AL, 'D'
    JE ChangeCouponDiscount
    CMP AL, 'X'
    JE ExitAdmin
    
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP AdminMenuLoop

ChangePrices:
    ; Change all price values
ChangeConcertPrice:
    CALL PrintNewline
    LEA DX, enterConcertPrice
    CALL PrintString
    CALL ReadThreeDigits
    CMP AX, 0FFFFH
    JE InvalidConcertPrice
    MOV eventPrices[0], AX
    
ChangeSportsPrice:
    CALL PrintNewline
    LEA DX, enterSportsPrice
    CALL PrintString
    CALL ReadThreeDigits
    CMP AX, 0FFFFH
    JE InvalidSportsPrice
    MOV eventPrices[2], AX
    
ChangeWorkshopPrice:
    CALL PrintNewline
    LEA DX, enterWorkshopPrice
    CALL PrintString
    CALL ReadThreeDigits
    CMP AX, 0FFFFH
    JE InvalidWorkshopPrice
    MOV eventPrices[4], AX
    
ChangeParkingPrice:
    CALL PrintNewline
    LEA DX, enterParkingPrice
    CALL PrintString
    CALL ReadThreeDigits
    CMP AX, 0FFFFH
    JE InvalidParkingPrice
    MOV extraPrices[0], AX
    
ChangeMerchPrice:
    CALL PrintNewline
    LEA DX, enterMerchPrice
    CALL PrintString
    CALL ReadThreeDigits
    CMP AX, 0FFFFH
    JE InvalidMerchPrice
    MOV extraPrices[2], AX
    
ChangeVIPPrice:
    CALL PrintNewline
    LEA DX, enterVIPPrice
    CALL PrintString
    CALL ReadThreeDigits
    CMP AX, 0FFFFH
    JE InvalidVIPPrice
    MOV extraPrices[4], AX
    
    CALL PrintNewline
    LEA DX, pricesUpdated
    CALL PrintString
    JMP AdminMenuLoop

InvalidConcertPrice:
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP ChangeConcertPrice
    
InvalidSportsPrice:
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP ChangeSportsPrice
    
InvalidWorkshopPrice:
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP ChangeWorkshopPrice
    
InvalidParkingPrice:
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP ChangeParkingPrice
    
InvalidMerchPrice:
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP ChangeMerchPrice
    
InvalidVIPPrice:
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP ChangeVIPPrice

ChangeTicketLimit:
    ; Change maximum tickets per event
    CALL PrintNewline
    LEA DX, enterMaxTickets
    CALL PrintString
    
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    
    CMP AL, 1
    JL InvalidTicketLimit
    CMP AL, 9
    JG InvalidTicketLimit
    
    MOV maxTicketsLimit, AL
    CALL PrintNewline
    LEA DX, ticketLimitUpdated
    CALL PrintString
    JMP AdminMenuLoop

InvalidTicketLimit:
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP ChangeTicketLimit

ChangeCouponDiscount:
    ; Change coupon discount percentage
    CALL PrintNewline
    LEA DX, enterCouponDisc
    CALL PrintString
    CALL ReadTwoDigits
    
    CMP AX, 0FFFFH
    JE InvalidCouponDisc
    CMP AX, 1
    JL InvalidCouponDisc
    CMP AX, 99
    JG InvalidCouponDisc
    
    MOV couponDiscountPercent, AL
    CALL PrintNewline
    LEA DX, couponUpdated
    CALL PrintString
    JMP AdminMenuLoop

InvalidCouponDisc:
    CALL PrintNewline
    LEA DX, errorInvInput
    CALL PrintString
    JMP ChangeCouponDiscount

PasswordFailed:
    ; Incorrect password - loop back to try again
    CALL PrintNewline
    LEA DX, passwordIncorrect
    CALL PrintString
    JMP TryPassword

ExitAdmin:
    RET
AdminMode ENDP

DisplayCurrentCart PROC
    CALL PrintNewline
    MOV SI, 0
    
DisplayCartLoop:
    MOV AL, numEvents
    MOV AH, 0
    CMP SI, AX
    JGE EndDisplayCart
    
    ; Display event number
    MOV AX, SI
    INC AL
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H
    
    MOV DL, '.'
    MOV AH, 2
    INT 21H
    MOV DL, ' '
    MOV AH, 2
    INT 21H
    
    ; Get event type
    LEA BX, eventTypes
    ADD BX, SI
    MOV AL, [BX]
    
    CMP AL, 'C'
    JE PrintConcertCart
    CMP AL, 'S'
    JE PrintSportsCart
    
    LEA DX, workshopType
    JMP PrintCartType
    
PrintConcertCart:
    LEA DX, concertType
    JMP PrintCartType
    
PrintSportsCart:
    LEA DX, sportsType
    
PrintCartType:
    CALL PrintString
    
    ; Display separator
    MOV DL, ' '
    MOV AH, 2
    INT 21H
    MOV DL, '-'
    MOV AH, 2
    INT 21H
    MOV DL, ' '
    MOV AH, 2
    INT 21H
    
    ; Display ticket quantity
    LEA BX, eventTickets
    ADD BX, SI
    MOV DL, [BX]
    ADD DL, 30H
    MOV AH, 2
    INT 21H
    
    ; Display " tickets" text
    MOV DL, ' '
    MOV AH, 2
    INT 21H
    MOV DL, 't'
    MOV AH, 2
    INT 21H
    MOV DL, 'i'
    MOV AH, 2
    INT 21H
    MOV DL, 'c'
    MOV AH, 2
    INT 21H
    MOV DL, 'k'
    MOV AH, 2
    INT 21H
    MOV DL, 'e'
    MOV AH, 2
    INT 21H
    MOV DL, 't'
    MOV AH, 2
    INT 21H
    MOV DL, 's'
    MOV AH, 2
    INT 21H
    
    CALL PrintNewline
    INC SI
    JMP DisplayCartLoop
    
EndDisplayCart:
    RET
DisplayCurrentCart ENDP

ReadThreeDigits PROC
    MOV BX, 0
    MOV CX, 3
    
ReadThreeLoop:
    MOV AH, 1
    INT 21H
    
    CMP AL, '0'
    JL InvalidThreeDigit
    CMP AL, '9'
    JG InvalidThreeDigit
    
    SUB AL, 30H
    PUSH AX
    MOV AX, BX
    PUSH CX
    MOV CX, 10
    MUL CX
    POP CX
    MOV BX, AX
    POP AX
    MOV AH, 0
    ADD BX, AX
    LOOP ReadThreeLoop
    
    MOV AX, BX
    RET
    
InvalidThreeDigit:
    MOV AX, 0FFFFH
    RET
ReadThreeDigits ENDP


ReadTwoDigits PROC
    MOV BX, 0
    MOV CX, 2
    
ReadTwoLoop:
    MOV AH, 1
    INT 21H
    
    CMP AL, '0'
    JL InvalidTwoDigit
    CMP AL, '9'
    JG InvalidTwoDigit
    
    SUB AL, 30H
    PUSH AX
    MOV AX, BX
    PUSH CX
    MOV CX, 10
    MUL CX
    POP CX
    MOV BX, AX
    POP AX
    MOV AH, 0
    ADD BX, AX
    LOOP ReadTwoLoop
    
    MOV AX, BX
    RET
    
InvalidTwoDigit:
    MOV AX, 0FFFFH
    RET
ReadTwoDigits ENDP

PrintNewline PROC
    MOV tempDX, DX
    MOV tempAX, AX
    LEA DX, newline
    MOV AH, 9
    INT 21H
    MOV AX, tempAX
    MOV DX, tempDX
    RET
PrintNewline ENDP


PrintString PROC
    MOV tempAX, AX
    MOV AH, 9
    INT 21H
    MOV AX, tempAX
    RET
PrintString ENDP


GetCharToUpper PROC
    MOV tempBX, BX
    MOV AH, 1
    INT 21H
    
    CMP AL, 'a'
    JL NotLower
    CMP AL, 'z'
    JG NotLower
    SUB AL, 32            ; Convert to uppercase
    
NotLower:
    MOV BX, tempBX
    RET
GetCharToUpper ENDP


CheckAllExtras PROC
    MOV tempBX, BX
    
    MOV AL, hasParking
    CMP AL, 1
    JNE NotAllExtras
    
    MOV AL, hasMerch
    CMP AL, 1
    JNE NotAllExtras
    
    MOV AL, hasVIP
    CMP AL, 1
    JNE NotAllExtras
    
    MOV AL, 1             ; All extras selected
    JMP ExitCheckExtras
    
NotAllExtras:
    MOV AL, 0             ; Not all extras selected
    
ExitCheckExtras:
    MOV BX, tempBX
    RET
CheckAllExtras ENDP


DisplayExtras PROC
    MOV tempAX, AX
    MOV tempBX, BX
    MOV tempDX, DX
    MOV BH, 0             ; Flag for extras found
    
    CMP hasParking, 1
    JNE ChkMerch
    LEA DX, parkingSelected
    CALL PrintString
    MOV BH, 1
    
ChkMerch:
    CMP hasMerch, 1
    JNE ChkVIP
    LEA DX, merchSelected
    CALL PrintString
    MOV BH, 1
    
ChkVIP:
    CMP hasVIP, 1
    JNE FinExtras
    LEA DX, vipSelected
    CALL PrintString
    MOV BH, 1
    
FinExtras:
    CMP BH, 0
    JNE ExtrasDone
    LEA DX, noExtrasSelected
    CALL PrintString
    
ExtrasDone:
    MOV DX, tempDX
    MOV BX, tempBX
    MOV AX, tempAX
    RET
DisplayExtras ENDP


DisplayNumber PROC
    PUSH BX
    PUSH CX
    PUSH DX
    
    CMP AX, 0
    JNE NotZero
    MOV DL, '0'
    MOV AH, 2
    INT 21H
    JMP EndDisplayNum
    
NotZero:
    MOV CX, 0
    MOV BX, 10
    
PushDigits:
    ; Extract digits by dividing by 10
    MOV DX, 0
    DIV BX
    PUSH DX               ; Push remainder (digit)
    INC CX                ; Count digits
    CMP AX, 0
    JNE PushDigits
    
PopDigits:
    ; Pop and display each digit
    POP DX
    ADD DL, 30H           ; Convert to ASCII
    MOV AH, 2
    INT 21H
    LOOP PopDigits
    
EndDisplayNum:
    POP DX
    POP CX
    POP BX
    RET
DisplayNumber ENDP

END MAIN