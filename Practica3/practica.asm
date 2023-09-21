;llamada a macros
include macros1.asm 

ImprimirTablero macro arreglo 
    LOCAL Mientras, FinMientras, ImprimirSalto
    push si
    push di

    xor si,si
    mov si,1 ;source index  = 1 Para que empiece a contar desde 1
    xor di,di; destination index = 0
    print tabhead
    
    print skip
	Mientras:
		cmp si,43 ;if si==42 si el actual tiene el numero 43
		je FinMientras				; while(si<=42){}
			xor ax,ax               ; limpia ax
			mov al, arreglo[si]     ; actual pasa al registro bajo al
			mov aux, al 		   ; print(arreglo[si])
			print aux               ; imprime el valor de aux (se quema antes)

			cmp di,6    
			je ImprimirSalto	 ; if(di == 6){ Imprimir salto}


			mov aux,32   		; else{print(" ")
			print aux
			

			inc di				;di++
			inc si   			; si++}
		jmp Mientras

	ImprimirSalto:
		xor di,di 			; di = 0
		print skip			;print("/n")
		inc si  			; si++
		jmp Mientras

	FinMientras:
pop di
pop si
endm

.model Large 
; -------------- SEGMENTO DE PILA -----------------
.stack 
; -------------- Variables a utilizar -----------------
.data ;Salto de linea
skip db 0ah,0dh, ' ' , '$'
;Boleano
bool db 5 dup('$'), '$'
bool2 db 5 dup('$'), '$'
;convertidor
conver db 100 dup('$') , '$'

nameJugador1 db 50 dup('$') , '$'
nameJugador2 db 50 dup('$') , '$'

; variable del tablero
tabhead db 0ah,0dh, " A S D F J K L" , '$'
tab db 42 dup('$') , '$'

aux db 0, '$'

;Maneja la entrada del teclado
handlerentrada dw ?

;DATOS PERSONALES DE LA APP
rotulo  db 0ah,0dh, "----------------------------------------------" , '$'
rotulo1  db 0ah,0dh, " UNIVERSIDAD SAN CARLOS DE GUATEMALA" , '$'
marco   db 0ah,0dh, " FACULTAD DE INGENIERIA" , '$'
marco1  db 0ah,0dh, " ARQUITECTURA DE COMPUTADORAS Y ESAMBLADORES 1" , '$'
marco2  db 0ah,0dh, "SECCION B" , '$'
marco3  db 0ah,0dh, " SEGUNDO SEMESTRE 2023" , '$'
marco4  db 0ah,0dh, " Nombre: Sebastian Solares" , '$'
marco5  db 0ah,0dh, " Carnet: 202004822" , '$'
marco6  db 0ah,0dh, "Presione enter para continuar" , '$'

marco7 db 0ah,0dh, "-----------------------------------------------" , '$'


; Menu principal del juego
menuPrincipal db 0ah,0dh, "----------------------------------------------" , '$'
menuPrincipal1 db 0ah,0dh, " 1. Ayuda" , '$'
menuPrincipal2 db 0ah,0dh, " 2. Nuevo Juego" , '$'
menuPrincipal3 db 0ah,0dh, " 3. cargar Partida" , '$'

menuPrincipal4 db 0ah,0dh, " 4. Salir" , '$'


; menu del juego

menuJuego db 0ah,0dh, "----------------------------------------------" , '$'
menuJuego1 db 0ah,0dh, " 1. jugador vs jugador" , '$'
menuJuego2 db 0ah,0dh, " 2. jugador vs pc" , '$'
menuJuego3 db 0ah,0dh, " 3. Regresar al menu" , '$'


; -------------------------- Mensajes -----------

ingreseName1 db 0ah,0dh, 'Ingrese el nombre del jugador 1: ', '$'
ingreseName2 db 0ah,0dh, 'Ingrese el nombre del jugador 2 ', '$'

msjInicialJuego db 0ah,0dh, 'Empezando juego!!', '$'

;----------------Variables para escribir en un archivo----------------
;Nombre del archivo
nombreArchivo db 'reporte.html',0

;Cadena que almacenada todo el reporte esta llena de espacios vacios
reporte db 30000 dup(' '), '$'

;Maneja como la interrupcion del buffer que utilizaremos para escribir
;Datos del archivo
file db 'c:\repo.html','00h' ;ojo con el 00h es importante
handler dw ?
buffer db 100 dup(' '), '$' ;<-------------------Modifique el tamaño del buffer segun el tamaño de sus archivo

;ruta del archivo help.txt <--------------------------
rute db 'c:/masm611/bin/HELP.TXT' ,'00h'

;Variables para el control de donde escribir en el reporte
indiceReporte db 0
indice_reporte db 100
indiceOP db 100 dup('$') , '$'
contadorIndiceOP db 0

;Cadena para escribir en un archivo HTML (Solo tienen que copiar linea por linea su html casi)
linea1 db  '<html>$' , 0
linea2 db  '<head>$' , 0
linea3 db  '<title>Reporte</title> ' , '$'
linea4 db 0ah,0dh, '<style>  ' , '$'
linea5 db 0ah,0dh, 'body{background-color: #e6e6ff;} ' , '$'
linea6 db 0ah,0dh, '</style> ' , '$'
linea7 db 0ah,0dh, '</head> ' , '$'
linea8 db 0ah,0dh, '<body>' , '$'
linea9 db 0ah,0dh, '<H1> Practica 3 Sebas solares </H1>' , '$'
linea10 db 0ah,0dh, '</body>' , '$'
linea11 db 0ah,0dh, '<html>' , '$'

;---------------Variables para carteles de error----------------
err1 db 0ah,0dh, 'Error al abrir el archivo puede que no exista' , '$'
err2 db 0ah,0dh, 'Error al cerrar el archivo' , '$'
err3 db 0ah,0dh, 'Error al escribir en el archivo' , '$'
err4 db 0ah,0dh, 'Error al crear en el archivo' , '$'
err5 db 0ah,0dh, 'Error al leer en el archivo' , '$'

;----------------SEGMENTO DE CODIGO---------------------

.code

main proc far	
mov ax,@data
mov ds,ax
mov es,ax

    menu:
            ;print operarReporte 

            print rotulo
            print rotulo1
            print marco;
            print marco1;
            print marco2;
            print marco3;
            print marco4;
            print marco5;
            print marco6;
            print marco7;
            print skip

            getChar
            cmp al,13 ;13 es el codigo ascii de enter
            je menuprin
            jmp menu
            

    menuprin:
        print menuPrincipal
        print menuPrincipal1
        print menuPrincipal2
        print menuPrincipal3
        print menuPrincipal4
        print skip

        getChar

        cmp al,49 ; 49 es el codigo ascii de 1
        je ayuda

        cmp al, 50 ; 50 es el codigo ascii de 2
        je menuGame

        cmp al,52 ;52 es el codigo ascii de 4
        je exit

        

    menuGame:
        print menuJuego
        print menuJuego1
        print menuJuego2
        print menuJuego3
        print skip
        
        getChar
        cmp al, 49 ; 49 es el codigo ascii de 1
        je jugadorvsjugador



    jugadorvsjugador:
        print ingreseName1
        ObtenerTexto nameJugador1

        print skip

        print ingreseName2
        ObtenerTexto nameJugador2

        print msjInicialJuego
        
        ;fila1
        mov tab[1],61
        mov tab[2],61
        mov tab[3],61
        mov tab[4],61
        mov tab[5],61
        mov tab[6],61
        mov tab[7],61

        mov tab[8],61
        mov tab[9],61
        mov tab[10],61
        mov tab[11],61
        mov tab[12],61
        mov tab[13],61
        mov tab[14],61

        mov tab[15],61
        mov tab[16],61
        mov tab[17],61
        mov tab[18],61
        mov tab[19],61
        mov tab[20],61
        mov tab[21],61

        mov tab[22],61
        mov tab[23],61
        mov tab[24],61
        mov tab[25],61
        mov tab[26],61
        mov tab[27],61
        mov tab[28],61

        mov tab[29],61
        mov tab[30],61
        mov tab[31],61
        mov tab[32],61
        mov tab[33],61
        mov tab[34],61
        mov tab[35],61

        mov tab[36],61
        mov tab[37],61
        mov tab[38],61
        mov tab[39],61
        mov tab[40],61
        mov tab[41],61
        mov tab[42],61

        
        ImprimirTablero tab


        


        ;jmp menu


        

        



    reportHTM:
        ;Concatenamos las cadenas que queremos a la del reporte
        concatenarCadena linea1,reporte,indiceReporte
        concatenarCadena linea2,reporte,indiceReporte
        concatenarCadena linea3,reporte,indiceReporte
        concatenarCadena linea4,reporte,indiceReporte
        concatenarCadena linea5,reporte,indiceReporte
        concatenarCadena linea6,reporte,indiceReporte
        concatenarCadena linea7,reporte,indiceReporte
        concatenarCadena linea8,reporte,indiceReporte
        concatenarCadena linea9,reporte,indiceReporte
        concatenarCadena linea10,reporte,indiceReporte
        concatenarCadena linea11,reporte,indiceReporte

        ;Limpiamos variables que utilizamos para escribir
        limpiar rute, SIZEOF rute,24h ;limpiamos el arreglo bufferentrada con $
		limpiar buffer, SIZEOF buffer,24h ;limpiamos el arreglo bufferentrada con $

        ;ObtenerTexto nombreArchivo (Por alguna razon aveces no se obtiene bien el nombre del archivo
        ;Y lo pueden ingresar manual en caso de cualquier error)
        mov nombreArchivo[0],114 ;R
		mov nombreArchivo[1],101 ;E
		mov nombreArchivo[2],112 ;P
		mov nombreArchivo[3],46  ;.
		mov nombreArchivo[4],104 ;h
		mov nombreArchivo[5],116 ;t
		mov nombreArchivo[6],109 ;m
        mov nombreArchivo[7],108 ;l

        ;Interrupcion para crear el archivo
		crear nombreArchivo, handler
        ;Interrupcion para escribir el archivo
        escribir handler, reporte, SIZEOF reporte
        ;Interrupcion para cerrar como que el buffer que se utilizo para escribir
		cerrar handler

 

        jmp menu

    ayuda:
        print skip
        abrir rute,handlerentrada  ;le mandamos la ruta y el handler,que será la referencia al fichero 
		limpiar buffer, SIZEOF buffer,24h  ;limpiamos la variable donde guardaremos los datos del archivo 
		leer handlerentrada, buffer, SIZEOF buffer ;leemos el archivo
        cerrar handlerentrada

        print skip 
        print buffer
        print skip 


        jmp menu


    ;Etiquetas para mostrar los errores
    Error1:
		print skip
		print err1
		getChar
		jmp menu

	Error2:
		print skip
		print err2
		getChar
		jmp menu
	
	Error3:
		print skip
		print err3
		getChar
		jmp menu
	
	Error4:
		print skip
		print err4
		getChar
		jmp menu

	Error5:
		print skip
		print err5
		getChar
		jmp menu

    exit:
        close
    



            

main endp
end main