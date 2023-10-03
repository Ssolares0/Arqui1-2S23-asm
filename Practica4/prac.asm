include macros1.asm 

.model Large 
; -------------- SEGMENTO DE PILA -----------------
.stack 
; -------------- Variables a utilizar -----------------
.data ;Salto de linea

skip db 0ah,0dh, ' ' , '$'


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
            print marco
            print marco1
            print marco2
            print marco3
            print marco4
            print marco5
            print marco6
            print marco7
            print skip

            getChar
            cmp al,13 ;13 es el codigo ascii de enter
            je menuprin
            jmp menu
            

    menuprin:
        print skip


main endp
end main