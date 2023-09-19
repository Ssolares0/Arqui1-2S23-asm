;llamada a macros
include macros1.asm 
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
menuJuego1 db 0ah,0dh, " 1. jugador vs pc" , '$'
menuJuego2 db 0ah,0dh, " 2. jugador vs jugador" , '$'
menuJuego3 db 0ah,0dh, " 3. Regresar al menu" , '$'


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
        cmp al,52 ;52 es el codigo ascii de 4
        je exit

    ayuda:


    exit:
        je menu
    



            

main endp
end main