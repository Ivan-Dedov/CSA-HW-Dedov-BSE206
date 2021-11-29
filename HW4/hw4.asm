; Global functions
global _get_creature_metric
global _compare
global _copy
global _get_creature_name
global _generate_creature
global _print_creature_to_file
global _read_data_from_file
global _generate_randomly
global _write_data_to_file
global _swap
global _heapify
global _heap_sort_desc
global _main

; Functions imported from C
extern _atoi
extern _strcmp
extern _srand
extern _time
extern _puts
extern _clock
extern _fclose
extern _fscanf
extern _fopen
extern _fwrite
extern _fprintf
extern _exit
extern _printf
extern _rand
extern _sprintf
extern _strlen
extern ___chkstk_ms
extern ___main


SECTION .text                                           

.text:  ; Local function

_get_creature_metric:
        push    ebx                                     
        sub     esp, 40                                 
        mov     ebx, dword [esp+30H]                    
        mov     dword [esp], ebx                        
        call    _strlen                                 
        test    eax, eax                                
        jz      ?_003                                   
        fldz                                            
        mov     edx, ebx                                
        add     eax, ebx                                

ALIGN   8
?_001:  movsx   cx, byte [edx]                          
        add     edx, 1                                  
        cmp     eax, edx                                
        mov     word [esp+1EH], cx                      
        fild    word [esp+1EH]                          
        faddp   st1, st0                                
        jnz     ?_001                                   
?_002:  fild    dword [ebx+40H]                         
        add     esp, 40                                 
        pop     ebx                                     
        fdivp   st1, st0                                
        ret                                             

?_003:  ; Local function
        fldz                                            
        jmp     ?_002                                   


ALIGN   16

_compare: ; Compares two creatures
        sub     esp, 44                                 
        mov     eax, dword [esp+30H]                    
        mov     dword [esp], eax                        
        call    _get_creature_metric                    
        mov     eax, dword [esp+34H]                    
        fstp    dword [esp+1CH]                         
        mov     dword [esp], eax                        
        call    _get_creature_metric                    
        fld     dword [esp+1CH]                         
        fxch    st1                                     
        fucom   st1                                     
        fnstsw  ax                                      
        sahf                                            
        ja      ?_005                                   
        fxch    st1                                     
        fucompp                                         
        fnstsw  ax                                      
        sahf                                            
        seta    al                                      
        movzx   eax, al                                 
?_004:  add     esp, 44                                 
        ret                                             

ALIGN   8
?_005:  fstp    st0                                     
        fstp    st0                                     
        mov     eax, 4294967295                         
        jmp     ?_004                                   
; _compare

        nop                                             

ALIGN   8

_copy:  ; Copies one creature to another one
        push    esi                                     
        push    ebx                                     
        sub     esp, 20                                 
        mov     ebx, dword [esp+20H]                    
        mov     esi, dword [esp+24H]                    
        mov     dword [esp], ebx                        
        call    _strlen                                 
        test    eax, eax                                
        jz      ?_007                                   
        xor     edx, edx                                
        nop                                             

ALIGN   8
?_006:  movzx   ecx, byte [ebx+edx]                     
        mov     byte [esi+edx], cl                      
        add     edx, 1                                  
        cmp     eax, edx                                
        jnz     ?_006                                   
?_007:  mov     byte [esi+eax], 0                       
        mov     eax, dword [ebx+40H]                    
        mov     dword [esi+40H], eax                    
        mov     eax, dword [ebx+44H]                    
        mov     dword [esi+44H], eax                    
        mov     eax, dword [ebx+48H]                    
        mov     dword [esi+48H], eax                    
        mov     eax, dword [ebx+48H]                    
        mov     dword [esi+48H], eax                    
        mov     eax, dword [ebx+48H]                    
        mov     dword [esi+48H], eax                    
        add     esp, 20                                 
        pop     ebx                                     
        pop     esi                                     
        ret                                             
; _copy End of function

ALIGN   16

_get_creature_name: ; Retrieves the name of the creatur
        push    esi                                     
        push    ebx                                     
        sub     esp, 36                                 
        mov     eax, dword [esp+34H]                    
        lea     ebx, [esp+1BH]                          
        mov     dword [esp+4H], ?_054                   
        mov     esi, dword [esp+30H]                    
        mov     dword [esp], ebx                        
        mov     dword [esp+8H], eax                     
        call    _sprintf                                
        xor     eax, eax                                
?_008:  movzx   edx, byte [ebx+eax]                     
        mov     byte [esi+eax], dl                      
        add     eax, 1                                  
        cmp     eax, 5                                  
        jnz     ?_008                                   
        add     esp, 36                                 
        pop     ebx                                     
        pop     esi                                     
        ret                                             
; _get_creature_name End of function

ALIGN   8

_generate_creature: ; Generates a random creature
        push    edi                                     
        push    esi                                     
        push    ebx                                     
        sub     esp, 112                                
        mov     eax, dword [esp+84H]                    
        lea     edi, [esp+1FH]                          
        mov     dword [esp+4H], ?_054                   
        lea     esi, [esp+24H]                          
        mov     ebx, dword [esp+80H]                    
        mov     dword [esp], edi                        
        mov     dword [esp+8H], eax                     
        call    _sprintf                                
        xor     eax, eax                                
?_009:  movzx   edx, byte [edi+eax]                     
        mov     byte [esi+eax], dl                      
        add     eax, 1                                  
        cmp     eax, 5                                  
        jnz     ?_009                                   
        call    _rand                                   
        mov     edx, 274877907                          
        mov     ecx, eax                                
        mov     edi, 1431655766                         
        imul    edx                                     
        mov     eax, ecx                                
        sar     eax, 31                                 
        sar     edx, 6                                  
        sub     edx, eax                                
        imul    edx, edx, 1000                          
        sub     ecx, edx                                
        add     ecx, 1                                  
        mov     dword [esp+64H], ecx                    
        call    _rand                                   
        mov     ecx, eax                                
        imul    edi                                     
        mov     eax, ecx                                
        sar     eax, 31                                 
        sub     edx, eax                                
        lea     eax, [edx+edx*2]                        
        sub     ecx, eax                                
        lea     eax, [ecx+1H]                           
        cmp     eax, 2                                  
        mov     dword [esp+68H], eax                    
        jz      ?_013                                   
        cmp     eax, 3                                  
        jz      ?_012                                   
        cmp     eax, 1                                  
        jz      ?_011                                   
?_010:  mov     edi, ebx                                
        mov     ecx, 19                                 
        mov     eax, ebx                                
        rep movsd                                       
        add     esp, 112                                
        pop     ebx                                     
        pop     esi                                     
        pop     edi                                     
        ret                                             

ALIGN   8
?_011:  call    _rand                                   
        cdq                                             
        shr     edx, 30                                 
        add     eax, edx                                
        and     eax, 03H                                
        sub     eax, edx                                
        add     eax, 1                                  
        mov     dword [esp+6CH], eax                    
        jmp     ?_010                                   

ALIGN   8
?_012:  call    _rand                                   
        mov     ecx, eax                                
        imul    edi                                     
        mov     eax, ecx                                
        sar     eax, 31                                 
        sub     edx, eax                                
        lea     eax, [edx+edx*2]                        
        sub     ecx, eax                                
        add     ecx, 1                                  
        mov     dword [esp+6CH], ecx                    
        jmp     ?_010                                   

ALIGN   8
?_013:  call    _rand                                   
        mov     edx, eax                                
        shr     edx, 31                                 
        add     eax, edx                                
        and     eax, 01H                                
        sub     eax, edx                                
        mov     dword [esp+6CH], eax                    
        jmp     ?_010                                   
; _generate_creature End of function

ALIGN   16

_print_creature_to_file: ; Prints the creature to file
        push    esi                                     
        push    ebx                                     
        sub     esp, 20                                 
        mov     ebx, dword [esp+24H]                    
        mov     esi, dword [esp+20H]                    
        mov     eax, dword [ebx+44H]                    
        cmp     eax, 2                                  
        je      ?_017                                   
        cmp     eax, 3                                  
        je      ?_016                                   
        cmp     eax, 1                                  
        jz      ?_014                                   
        mov     dword [esp+8H], eax                     
        mov     eax, dword [esp+28H]                    
        mov     dword [esp], ?_069                      
        mov     dword [esp+4H], eax                     
        call    _printf                                 
        mov     dword [esp], -6                         
        call    _exit                                   
        nop                                             

ALIGN   8
?_014:  mov     eax, dword [ebx+40H]                    
        mov     dword [esp+8H], ebx                     
        mov     dword [esp+4H], ?_055                   
        mov     dword [esp], esi                        
        mov     dword [esp+0CH], eax                    
        call    _fprintf                                
        mov     eax, dword [ebx+48H]                    
        cmp     eax, 2                                  
        je      ?_023                                   
        jbe     ?_019                                   
        cmp     eax, 3                                  
        je      ?_025                                   
        cmp     eax, 4                                  
        jne     ?_024                                   
        mov     dword [esp+0CH], esi                    
        mov     dword [esp+8H], 25                      
        mov     dword [esp+4H], 1                       
        mov     dword [esp], ?_059                      
        call    _fwrite                                 
?_015:  add     esp, 20                                 
        pop     ebx                                     
        pop     esi                                     
        ret                                             

?_016:  mov     eax, dword [ebx+40H]                    
        mov     dword [esp+8H], ebx                     
        mov     dword [esp+4H], ?_064                   
        mov     dword [esp], esi                        
        mov     dword [esp+0CH], eax                    
        call    _fprintf                                
        mov     eax, dword [ebx+48H]                    
        cmp     eax, 2                                  
        je      ?_020                                   
        cmp     eax, 3                                  
        je      ?_022                                   
        cmp     eax, 1                                  
        je      ?_021                                   
        mov     dword [esp+8H], eax                     
        mov     eax, dword [esp+28H]                    
        mov     dword [esp], ?_068                      
        mov     dword [esp+4H], eax                     
        call    _printf                                 
        mov     dword [esp], -5                         
        call    _exit                                   
?_017:  mov     eax, dword [ebx+40H]                    
        mov     dword [esp+8H], ebx                     
        mov     dword [esp+4H], ?_061                   
        mov     dword [esp], esi                        
        mov     dword [esp+0CH], eax                    
        call    _fprintf                                
        mov     eax, dword [ebx+48H]                    
        mov     dword [esp+0CH], esi                    
        test    eax, eax                                
        jnz     ?_018                                   
        mov     dword [esp+8H], 23                      
        mov     dword [esp+4H], 1                       
        mov     dword [esp], ?_062                      
        call    _fwrite                                 
        add     esp, 20                                 
        pop     ebx                                     
        pop     esi                                     
        ret                                             

ALIGN   8
?_018:  mov     dword [esp+8H], 22                      
        mov     dword [esp+4H], 1                       
        mov     dword [esp], ?_063                      
        call    _fwrite                                 
        add     esp, 20                                 
        pop     ebx                                     
        pop     esi                                     
        ret                                             

?_019:  cmp     eax, 1                                  
        jne     ?_024                                   
        mov     dword [esp+0CH], esi                    
        mov     dword [esp+8H], 26                      
        mov     dword [esp+4H], 1                       
        mov     dword [esp], ?_056                      
        call    _fwrite                                 
        jmp     ?_015                                   

?_020:  mov     dword [esp+0CH], esi                    
        mov     dword [esp+8H], 18                      
        mov     dword [esp+4H], 1                       
        mov     dword [esp], ?_066                      
        call    _fwrite                                 
        jmp     ?_015                                   

?_021:  mov     dword [esp+0CH], esi                    
        mov     dword [esp+8H], 17                      
        mov     dword [esp+4H], 1                       
        mov     dword [esp], ?_065                      
        call    _fwrite                                 
        jmp     ?_015                                   

ALIGN   8
?_022:  mov     dword [esp+0CH], esi                    
        mov     dword [esp+8H], 16                      
        mov     dword [esp+4H], 1                       
        mov     dword [esp], ?_067                      
        call    _fwrite                                 
        jmp     ?_015                                   

?_023:  mov     dword [esp+0CH], esi                    
        mov     dword [esp+8H], 26                      
        mov     dword [esp+4H], 1                       
        mov     dword [esp], ?_057                      
        call    _fwrite                                 
        jmp     ?_015                                   

ALIGN   8
?_024:  mov     dword [esp+8H], eax                     
        mov     eax, dword [esp+28H]                    
        mov     dword [esp], ?_060                      
        mov     dword [esp+4H], eax                     
        call    _printf                                 
        mov     dword [esp], -4                         
        call    _exit                                   
?_025:  mov     dword [esp+0CH], esi                    
        mov     dword [esp+8H], 28                      
        mov     dword [esp+4H], 1                       
        mov     dword [esp], ?_058                      
        call    _fwrite                                 
        jmp     ?_015                                   
; _print_creature_to_file End of function

ALIGN   8

_read_data_from_file: ; Reads data from file (format spe
        push    ebp                                     
        push    edi                                     
        push    esi                                     
        push    ebx                                     
        sub     esp, 60                                 
        mov     esi, dword [esp+50H]                    
        mov     dword [esp+4H], ?_070                   
        mov     dword [esp], esi                        
        call    _fopen                                  
        test    eax, eax                                
        je      ?_035                                   
        test    byte [eax+0CH], 10H                     
        mov     ebx, eax                                
        jne     ?_033                                   
        mov     eax, dword [esp+58H]                    
        test    eax, eax                                
        jle     ?_033                                   
        mov     eax, dword [esp+54H]                    
        lea     ebp, [esp+2CH]                          
        xor     esi, esi                                
        lea     edi, [eax+44H]                          
?_026:  lea     eax, [edi-4H]                           
        mov     dword [esp+10H], edi                    
        mov     dword [esp+4H], ?_072                   
        mov     dword [esp], ebx                        
        mov     dword [esp+0CH], eax                    
        lea     eax, [edi-44H]                          
        mov     dword [esp+8H], eax                     
        call    _fscanf                                 
        mov     eax, dword [edi-4H]                     
        test    eax, eax                                
        jle     ?_034                                   
        mov     eax, dword [edi]                        
        cmp     eax, 2                                  
        jz      ?_027                                   
        cmp     eax, 3                                  
        je      ?_032                                   
        cmp     eax, 1                                  
        jz      ?_030                                   
        mov     dword [esp+8H], eax                     
        mov     dword [esp+4H], esi                     
        mov     dword [esp], ?_076                      
        call    _printf                                 
        mov     dword [esp], -14                        
        call    _exit                                   

ALIGN   8
?_027:  lea     eax, [edi+4H]                           
        mov     dword [esp+4H], ?_054                   
        mov     dword [esp], ebx                        
        mov     dword [esp+8H], eax                     
        call    _fscanf                                 
?_028:  add     esi, 1                                  
        add     edi, 76                                 
        test    byte [ebx+0CH], 10H                     
        jnz     ?_029                                   
        cmp     dword [esp+58H], esi                    
        jg      ?_026                                   
?_029:  mov     dword [esp], ebx                        
        call    _fclose                                 
        add     esp, 60                                 
        mov     eax, esi                                
        pop     ebx                                     
        pop     esi                                     
        pop     edi                                     
        pop     ebp                                     
        ret                                             

ALIGN   8
?_030:  mov     dword [esp+8H], ebp                     
        mov     dword [esp+4H], ?_054                   
        mov     dword [esp], ebx                        
        call    _fscanf                                 
        mov     eax, dword [esp+2CH]                    
        lea     ecx, [eax-1H]                           
        cmp     ecx, 3                                  
        ja      ?_036                                   
?_031:  mov     dword [edi+4H], eax                     
        jmp     ?_028                                   

ALIGN   8
?_032:  mov     dword [esp+8H], ebp                     
        mov     dword [esp+4H], ?_054                   
        mov     dword [esp], ebx                        
        call    _fscanf                                 
        mov     eax, dword [esp+2CH]                    
        lea     ecx, [eax-1H]                           
        cmp     ecx, 2                                  
        jbe     ?_031                                   
        mov     dword [esp+8H], eax                     
        mov     dword [esp+4H], esi                     
        mov     dword [esp], ?_075                      
        call    _printf                                 
        mov     dword [esp], -13                        
        call    _exit                                   
?_033:  xor     esi, esi                                
        jmp     ?_029                                   

?_034:  mov     dword [esp+8H], eax                     
        mov     dword [esp+4H], esi                     
        mov     dword [esp], ?_073                      
        call    _printf                                 
        mov     dword [esp], -11                        
        call    _exit                                   
?_035:  mov     dword [esp+4H], esi                     
        mov     dword [esp], ?_071                      
        call    _printf                                 
        mov     dword [esp], -10                        
        call    _exit                                   
?_036:  mov     dword [esp+8H], eax                     
        mov     dword [esp+4H], esi                     
        mov     dword [esp], ?_074                      
        call    _printf                                 
        mov     dword [esp], -12                        
        call    _exit                                   

ALIGN   16

_generate_randomly: ; Randomly generates creatures
        push    ebp                                     
        push    edi                                     
        push    esi                                     
        push    ebx                                     
        sub     esp, 124                                
        mov     edx, dword [esp+98H]                    
        mov     eax, dword [esp+94H]                    
        cmp     edx, eax                                
        mov     dword [esp+1CH], edx                    
        jle     ?_037                                   
        mov     dword [esp+1CH], eax                    
?_037:  mov     eax, dword [esp+1CH]                    
        xor     ebx, ebx                                
        mov     ebp, dword [esp+90H]                    
        test    eax, eax                                
        jle     ?_039                                   
?_038:  lea     eax, [esp+20H]                          
        mov     dword [esp+4H], ebx                     
        mov     edi, ebp                                
        add     ebx, 1                                  
        add     ebp, 76                                 
        lea     esi, [esp+20H]                          
        mov     dword [esp], eax                        
        call    _generate_creature                      
        cmp     dword [esp+1CH], ebx                    
        mov     ecx, 19                                 
        rep movsd                                       
        jnz     ?_038                                   
?_039:  mov     eax, dword [esp+1CH]                    
        add     esp, 124                                
        pop     ebx                                     
        pop     esi                                     
        pop     edi                                     
        pop     ebp                                     
        ret                                             
; _read_data_from_file End of function

ALIGN   16

_write_data_to_file: ; Writes the data to file
        push    ebp                                     
        push    edi                                     
        push    esi                                     
        push    ebx                                     
        sub     esp, 28                                 
        mov     eax, dword [esp+3CH]                    
        mov     ebx, dword [esp+30H]                    
        mov     esi, dword [esp+34H]                    
        mov     ebp, dword [esp+38H]                    
        test    eax, eax                                
        jnz     ?_043                                   
        mov     dword [esp+4H], ?_077                   
        mov     dword [esp], ebx                        
        call    _fopen                                  
        test    eax, eax                                
        mov     edi, eax                                
        jz      ?_044                                   
        mov     dword [esp+8H], ebp                     
        mov     dword [esp+4H], ?_080                   
        mov     dword [esp], eax                        
        call    _fprintf                                
?_040:  xor     ebx, ebx                                
        test    ebp, ebp                                
        jle     ?_042                                   
        nop                                             

ALIGN   8
?_041:  mov     dword [esp+8H], ebx                     
        mov     dword [esp+4H], esi                     
        add     ebx, 1                                  
        mov     dword [esp], edi                        
        add     esi, 76                                 
        call    _print_creature_to_file                 
        cmp     ebp, ebx                                
        jnz     ?_041                                   
?_042:  mov     dword [esp+30H], edi                    
        add     esp, 28                                 
        pop     ebx                                     
        pop     esi                                     
        pop     edi                                     
        pop     ebp                                     
        jmp     _fclose                                 

ALIGN   8
?_043:  mov     dword [esp+4H], ?_079                   
        mov     dword [esp], ebx                        
        call    _fopen                                  
        test    eax, eax                                
        mov     edi, eax                                
        jz      ?_044                                   
        mov     dword [esp+8H], ebp                     
        mov     dword [esp+4H], ?_081                   
        mov     dword [esp], eax                        
        call    _fprintf                                
        jmp     ?_040                                   
; _write_data_to_file End of function

?_044:  ; Local function
        mov     dword [esp+4H], ebx                     
        mov     dword [esp], ?_078                      
        call    _printf                                 
        mov     dword [esp], -14                        
        call    _exit                                   
        nop                                             

ALIGN   8

_swap:
        push    edi                                     
        push    esi                                     
        push    ebx                                     
        sub     esp, 96                                 
        mov     edi, dword [esp+70H]                    
        mov     esi, dword [esp+74H]                    
        lea     ebx, [esp+14H]                          
        mov     dword [esp+54H], 69                     
        mov     dword [esp+4H], ebx                     
        mov     dword [esp], edi                        
        call    _copy                                   
        mov     dword [esp+4H], edi                     
        mov     dword [esp], esi                        
        call    _copy                                   
        mov     dword [esp+4H], esi                     
        mov     dword [esp], ebx                        
        call    _copy                                   
        add     esp, 96                                 
        pop     ebx                                     
        pop     esi                                     
        pop     edi                                     
        ret                                             

ALIGN   16

_heapify: ; Heapifies the tree.
        push    ebp                                     
        push    edi                                     
        push    esi                                     
        push    ebx                                     
        sub     esp, 44                                 
        mov     esi, dword [esp+40H]                    
        mov     edi, dword [esp+48H]                    
        jmp     ?_047                                   

?_045:  cmp     dword [esp+44H], ebx                    
        jle     ?_048                                   
        imul    eax, edi, 76                            
        add     eax, esi                                
        mov     dword [esp+4H], eax                     
        imul    eax, ebx, 76                            
        add     eax, esi                                
        mov     dword [esp], eax                        
        call    _compare                                
        cmp     eax, -1                                 
        jnz     ?_048                                   
?_046:  cmp     ebx, edi                                
        jz      ?_048                                   
        imul    edx, edi, 76                            
        mov     edi, ebx                                
        imul    eax, ebx, 76                            
        add     edx, esi                                
        add     eax, esi                                
        mov     dword [esp], edx                        
        mov     dword [esp+4H], eax                     
        call    _swap                                   
?_047:  lea     ebx, [edi+edi]                          
        lea     ecx, [ebx+1H]                           
        add     ebx, 2                                  
        cmp     dword [esp+44H], ecx                    
        jle     ?_045                                   
        imul    ebp, ecx, 76                            
        mov     dword [esp+1CH], ecx                    
        imul    eax, edi, 76                            
        add     ebp, esi                                
        add     eax, esi                                
        mov     dword [esp], ebp                        
        mov     dword [esp+4H], eax                     
        call    _compare                                
        cmp     eax, -1                                 
        mov     ecx, dword [esp+1CH]                    
        jnz     ?_045                                   
        cmp     dword [esp+44H], ebx                    
        jg      ?_049                                   
        mov     ebx, ecx                                
        jmp     ?_046                                   

ALIGN   8
?_048:  add     esp, 44                                 
        pop     ebx                                     
        pop     esi                                     
        pop     edi                                     
        pop     ebp                                     
        ret                                             
; _heapify End of function

?_049:  ; Local function
        imul    eax, ebx, 76                            
        mov     dword [esp+4H], ebp                     
        add     eax, esi                                
        mov     dword [esp], eax                        
        call    _compare                                
        cmp     eax, -1                                 
        jz      ?_046                                   
        mov     ecx, dword [esp+1CH]                    
        mov     ebx, ecx                                
        jmp     ?_046                                   

ALIGN   8

_heap_sort_desc: ; Sorts the creatures in descending ord
        push    edi                                     
        push    esi                                     
        push    ebx                                     
        sub     esp, 16                                 
        mov     ebx, dword [esp+24H]                    
        mov     edi, dword [esp+20H]                    
        mov     esi, ebx                                
        shr     esi, 31                                 
        add     esi, ebx                                
        sar     esi, 1                                  
        sub     esi, 1                                  
        js      ?_051                                   

ALIGN   8
?_050:  mov     dword [esp+8H], esi                     
        mov     dword [esp+4H], ebx                     
        sub     esi, 1                                  
        mov     dword [esp], edi                        
        call    _heapify                                
        cmp     esi, -1                                 
        jnz     ?_050                                   
?_051:  sub     ebx, 1                                  
        js      ?_053                                   
        imul    esi, ebx, 76                            
        add     esi, edi                                
?_052:  mov     dword [esp+4H], esi                     
        mov     dword [esp], edi                        
        sub     esi, 76                                 
        call    _swap                                   
        mov     dword [esp+4H], ebx                     
        mov     dword [esp+8H], 0                       
        sub     ebx, 1                                  
        mov     dword [esp], edi                        
        call    _heapify                                
        cmp     ebx, -1                                 
        jnz     ?_052                                   
?_053:  add     esp, 16                                 
        pop     ebx                                     
        pop     esi                                     
        pop     edi                                     
        ret                                             
; _heap_sort_desc End of function

        nop                                             
        nop                                             
        nop                                             
        nop                                             
        nop                                             
        nop                                             
        nop                                             
        nop                                             
        nop                                             
        nop                                             
        nop                                             
        nop                                             


SECTION .data


SECTION .bss


SECTION .rdata ; String constants used for output.

?_054: ; %d (used when writing to file)
        db 25H, 64H, 00H, 00H

?_055: ; ANIMAL { name = "%s", weight = %d, 
        db 41H, 4EH, 49H, 4DH, 41H, 4CH, 20H, 7BH
        db 20H, 6EH, 61H, 6DH, 65H, 20H, 3DH, 20H
        db 22H, 25H, 73H, 22H, 2CH, 20H, 77H, 65H
        db 69H, 67H, 68H, 74H, 20H, 3DH, 20H, 25H
        db 64H, 2CH, 20H, 00H                    

?_056:; food_source = CARNIVORE }
        db 66H, 6FH, 6FH, 64H, 5FH, 73H, 6FH, 75H
        db 72H, 63H, 65H, 20H, 3DH, 20H, 43H, 41H
        db 52H, 4EH, 49H, 56H, 4FH, 52H, 45H, 20H
        db 7DH, 0AH, 00H

?_057:; food_source = HERBIVORE }
        db 66H, 6FH, 6FH, 64H, 5FH, 73H, 6FH, 75H
        db 72H, 63H, 65H, 20H, 3DH, 20H, 48H, 45H
        db 52H, 42H, 49H, 56H, 4FH, 52H, 45H, 20H
        db 7DH, 0AH, 00H

?_058: ; food_source = INSECTIVORE }
        db 66H, 6FH, 6FH, 64H, 5FH, 73H, 6FH, 75H
        db 72H, 63H, 65H, 20H, 3DH, 20H, 49H, 4EH
        db 53H, 45H, 43H, 54H, 49H, 56H, 4FH, 52H
        db 45H, 20H, 7DH, 0AH, 00H

?_059: ; food_source = OMNIVORE }
        db 66H, 6FH, 6FH, 64H, 5FH, 73H, 6FH, 75H
        db 72H, 63H, 65H, 20H, 3DH, 20H, 4FH, 4DH
        db 4EH, 49H, 56H, 4FH, 52H, 45H, 20H, 7DH
        db 0AH, 00H, 00H, 00H, 00H

?_060: ; Unknown food source of animal at index %d: %d.
        db 55H, 6EH, 6BH, 6EH, 6FH, 77H, 6EH, 20H
        db 66H, 6FH, 6FH, 64H, 20H, 73H, 6FH, 75H
        db 72H, 63H, 65H, 20H, 6FH, 66H, 20H, 61H
        db 6EH, 69H, 6DH, 61H, 6CH, 20H, 61H, 74H
        db 20H, 69H, 6EH, 64H, 65H, 78H, 20H, 25H
        db 64H, 3AH, 20H, 25H, 64H, 2EH, 0AH, 00H

?_061: ; BIRD { name = "%d", weight = %d, 
        db 42H, 49H, 52H, 44H, 20H, 7BH, 20H, 6EH
        db 61H, 6DH, 65H, 20H, 3DH, 20H, 22H, 25H
        db 73H, 22H, 2CH, 20H, 77H, 65H, 69H, 67H
        db 68H, 74H, 20H, 3DH, 20H, 25H, 64H, 2CH
        db 20H, 00H

?_062: ; does_migrate = FALSE }
        db 64H, 6FH, 65H, 73H, 5FH, 6DH, 69H, 67H
        db 72H, 61H, 74H, 65H, 20H, 3DH, 20H, 46H
        db 41H, 4CH, 53H, 45H, 20H, 7DH, 0AH, 00H

?_063: ; does_migrate = TRUE }
        db 64H, 6FH, 65H, 73H, 5FH, 6DH, 69H, 67H
        db 72H, 61H, 74H, 65H, 20H, 3DH, 20H, 54H
        db 52H, 55H, 45H, 20H, 7DH, 0AH, 00H, 00H
        db 00H, 00H

?_064: ; FISH { name = "%d", weight = %d, 
        db 46H, 49H, 53H, 48H, 20H, 7BH, 20H, 6EH
        db 61H, 6DH, 65H, 20H, 3DH, 20H, 22H, 25H
        db 73H, 22H, 2CH, 20H, 77H, 65H, 69H, 67H
        db 68H, 74H, 20H, 3DH, 20H, 25H, 64H, 2CH
        db 20H, 00H

?_065: ; habitat = LAKE }
        db 68H, 61H, 62H, 69H, 74H, 61H, 74H, 20H
        db 3DH, 20H, 4CH, 41H, 4BH, 45H, 20H, 7DH
        db 0AH, 00H

?_066: ; habitat = RIVER }
        db 68H, 61H, 62H, 69H, 74H, 61H, 74H, 20H
        db 3DH, 20H, 52H, 49H, 56H, 45H, 52H, 20H
        db 7DH, 0AH, 00H

?_067: ; habitat = SEA }
        db 68H, 61H, 62H, 69H, 74H, 61H, 74H, 20H
        db 3DH, 20H, 53H, 45H, 41H, 20H, 7DH, 0AH
        db 00H

?_068: ; Unknown habitat of fish at index %d: %d.
        db 55H, 6EH, 6BH, 6EH, 6FH, 77H, 6EH, 20H
        db 68H, 61H, 62H, 69H, 74H, 61H, 74H, 20H
        db 6FH, 66H, 20H, 66H, 69H, 73H, 68H, 20H
        db 61H, 74H, 20H, 69H, 6EH, 64H, 65H, 78H
        db 20H, 25H, 64H, 3AH, 20H, 25H, 64H, 2EH
        db 0AH, 00H, 00H, 00H

?_069: ; Unknown creature at index %d: %d.
        db 55H, 6EH, 6BH, 6EH, 6FH, 77H, 6EH, 20H
        db 63H, 72H, 65H, 61H, 74H, 75H, 72H, 65H
        db 20H, 61H, 74H, 20H, 69H, 6EH, 64H, 65H
        db 78H, 20H, 25H, 64H, 3AH, 20H, 25H, 64H
        db 2EH, 0AH, 00H

?_070: ; r (i.e. read from file mode)
        db 72H, 00H

?_071: ; Could not open file: %s.
        db 43H, 6FH, 75H, 6CH, 64H, 20H, 6EH, 6FH
        db 74H, 20H, 6FH, 70H, 65H, 6EH, 20H, 66H
        db 69H, 6CH, 65H, 3AH, 20H, 25H, 73H, 2EH
        db 0AH, 00H

?_072: ; %s %d %d (used for reading creatures from file)
        db 25H, 73H, 20H, 25H, 64H, 20H, 25H, 64H
        db 00H

?_073: ; Invalid weight of creature at index %d: %d. Must be an integer, at least 1.
        db 49H, 6EH, 76H, 61H, 6CH, 69H, 64H, 20H
        db 77H, 65H, 69H, 67H, 68H, 74H, 20H, 6FH
        db 66H, 20H, 63H, 72H, 65H, 61H, 74H, 75H
        db 72H, 65H, 20H, 61H, 74H, 20H, 69H, 6EH
        db 64H, 65H, 78H, 20H, 25H, 64H, 3AH, 20H
        db 25H, 64H, 2EH, 20H, 4DH, 75H, 73H, 74H
        db 20H, 62H, 65H, 20H, 61H, 6EH, 20H, 69H
        db 6EH, 74H, 65H, 67H, 65H, 72H, 2CH, 20H
        db 61H, 74H, 20H, 6CH, 65H, 61H, 73H, 74H
        db 20H, 31H, 2EH, 0AH, 00H, 00H, 00H, 00H

?_074: ; Unknown food_source value for animal at index %d: %d.
       ; Expected value in range from 1 to 4.
        db 55H, 6EH, 6BH, 6EH, 6FH, 77H, 6EH, 20H
        db 66H, 6FH, 6FH, 64H, 5FH, 73H, 6FH, 75H
        db 72H, 63H, 65H, 20H, 76H, 61H, 6CH, 75H
        db 65H, 20H, 66H, 6FH, 72H, 20H, 61H, 6EH
        db 69H, 6DH, 61H, 6CH, 20H, 61H, 74H, 20H
        db 69H, 6EH, 64H, 65H, 78H, 20H, 25H, 64H
        db 3AH, 20H, 25H, 64H, 2EH, 20H, 45H, 78H
        db 70H, 65H, 63H, 74H, 65H, 64H, 20H, 76H
        db 61H, 6CH, 75H, 65H, 20H, 69H, 6EH, 20H
        db 72H, 61H, 6EH, 67H, 65H, 20H, 66H, 72H
        db 6FH, 6DH, 20H, 31H, 20H, 74H, 6FH, 20H
        db 34H, 2EH, 0AH, 00H

?_075: ; Unknown havitat value for fish at index %d: %d.
       ; Expected value in range from 1 to 3.
        db 55H, 6EH, 6BH, 6EH, 6FH, 77H, 6EH, 20H
        db 68H, 61H, 62H, 69H, 74H, 61H, 74H, 20H
        db 76H, 61H, 6CH, 75H, 65H, 20H, 66H, 6FH
        db 72H, 20H, 66H, 69H, 73H, 68H, 20H, 61H
        db 74H, 20H, 69H, 6EH, 64H, 65H, 78H, 20H
        db 25H, 64H, 3AH, 20H, 25H, 64H, 2EH, 20H
        db 45H, 78H, 70H, 65H, 63H, 74H, 65H, 64H
        db 20H, 76H, 61H, 6CH, 75H, 65H, 20H, 69H
        db 6EH, 20H, 72H, 61H, 6EH, 67H, 65H, 20H
        db 66H, 72H, 6FH, 6DH, 20H, 31H, 20H, 74H
        db 6FH, 20H, 33H, 2EH, 0AH, 00H, 00H, 00H

?_076: ; Invalid creature type for creature at index %d: %d.
       ; Only 1 (animal), 2 (bird), 3 (fish) are allowed.
        db 49H, 6EH, 76H, 61H, 6CH, 69H, 64H, 20H
        db 63H, 72H, 65H, 61H, 74H, 75H, 72H, 65H
        db 20H, 74H, 79H, 70H, 65H, 20H, 66H, 6FH
        db 72H, 20H, 63H, 72H, 65H, 61H, 74H, 75H
        db 72H, 65H, 20H, 61H, 74H, 20H, 69H, 6EH
        db 64H, 65H, 78H, 20H, 25H, 64H, 3AH, 20H
        db 25H, 64H, 2EH, 20H, 4FH, 6EH, 6CH, 79H
        db 20H, 31H, 20H, 28H, 61H, 6EH, 69H, 6DH
        db 61H, 6CH, 29H, 2CH, 20H, 32H, 20H, 28H
        db 62H, 69H, 72H, 64H, 29H, 2CH, 20H, 33H
        db 20H, 28H, 66H, 69H, 73H, 68H, 29H, 20H
        db 61H, 72H, 65H, 20H, 61H, 6CH, 6CH, 6FH
        db 77H, 65H, 64H, 2EH, 0AH, 00H

?_077: ; w (i.e. write to file)
        db 77H, 00H

?_078: ; Something went wrong when creating file: %s.
        db 53H, 6FH, 6DH, 65H, 74H, 68H, 69H, 6EH
        db 67H, 20H, 77H, 65H, 6EH, 74H, 20H, 77H
        db 72H, 6FH, 6EH, 67H, 20H, 77H, 68H, 65H
        db 6EH, 20H, 63H, 72H, 65H, 61H, 74H, 69H
        db 6EH, 67H, 20H, 66H, 69H, 6CH, 65H, 3AH
        db 20H, 25H, 73H, 2EH, 0AH, 00H

?_079: ; a (i.e. append file)
        db 61H, 00H

?_080: ; Data contains %d creatures:
        db 44H, 61H, 74H, 61H, 20H, 63H, 6FH, 6EH
        db 74H, 61H, 69H, 6EH, 73H, 20H, 25H, 64H
        db 20H, 63H, 72H, 65H, 61H, 74H, 75H, 72H
        db 65H, 73H, 3AH, 0AH, 00H, 00H, 00H, 00H

?_081: ; Sorted data of %d creatures.
        db 0AH, 53H, 6FH, 72H, 74H, 65H, 64H, 20H
        db 64H, 61H, 74H, 61H, 20H, 6FH, 66H, 20H
        db 25H, 64H, 20H, 63H, 72H, 65H, 61H, 74H
        db 75H, 72H, 65H, 73H, 3AH, 0AH, 00H, 00H

?_082: ; Incorrect number of imput parameters. Run the program like this:
       ; PROGRAM_NAME -f INPUT_FILE OUTPUT_FILE
       ; or like this:
       ; PROGRAM NAME -r NUMBER_OF_ELEMENTS OUTPUT_FILE
        db 49H, 6EH, 63H, 6FH, 72H, 72H, 65H, 63H
        db 74H, 20H, 6EH, 75H, 6DH, 62H, 65H, 72H
        db 20H, 6FH, 66H, 20H, 69H, 6EH, 70H, 75H
        db 74H, 20H, 70H, 61H, 72H, 61H, 6DH, 65H
        db 74H, 65H, 72H, 73H, 2EH, 20H, 52H, 75H
        db 6EH, 20H, 74H, 68H, 65H, 20H, 70H, 72H
        db 6FH, 67H, 72H, 61H, 6DH, 20H, 6CH, 69H
        db 6BH, 65H, 20H, 74H, 68H, 69H, 73H, 3AH
        db 0AH, 50H, 52H, 4FH, 47H, 52H, 41H, 4DH
        db 5FH, 4EH, 41H, 4DH, 45H, 20H, 2DH, 66H
        db 20H, 49H, 4EH, 50H, 55H, 54H, 5FH, 46H
        db 49H, 4CH, 45H, 20H, 4FH, 55H, 54H, 50H
        db 55H, 54H, 5FH, 46H, 49H, 4CH, 45H, 0AH
        db 6FH, 72H, 20H, 6CH, 69H, 6BH, 65H, 20H
        db 74H, 68H, 69H, 73H, 3AH, 0AH, 50H, 52H
        db 4FH, 47H, 52H, 41H, 4DH, 5FH, 4EH, 41H
        db 4DH, 45H, 20H, 2DH, 72H, 20H, 4EH, 55H
        db 4DH, 42H, 45H, 52H, 5FH, 4FH, 46H, 5FH
        db 45H, 4CH, 45H, 4DH, 45H, 4EH, 54H, 53H
        db 20H, 4FH, 55H, 54H, 50H, 55H, 54H, 5FH
        db 46H, 49H, 4CH, 45H, 00H

?_083: ; -r
        db 2DH, 72H, 00H

?_084: ; -f
        db 2DH, 66H, 00H, 00H

?_085: ; Cannot generate a negative number of elements. Pass the correct value when using -r.
        db 43H, 61H, 6EH, 6EH, 6FH, 74H, 20H, 67H
        db 65H, 6EH, 65H, 72H, 61H, 74H, 65H, 20H
        db 61H, 20H, 6EH, 65H, 67H, 61H, 74H, 69H
        db 76H, 65H, 20H, 6EH, 75H, 6DH, 62H, 65H
        db 72H, 20H, 6FH, 66H, 20H, 65H, 6CH, 65H
        db 6DH, 65H, 6EH, 74H, 73H, 2EH, 0AH, 50H
        db 61H, 73H, 73H, 20H, 74H, 68H, 65H, 20H
        db 63H, 6FH, 72H, 72H, 65H, 63H, 74H, 20H
        db 76H, 61H, 6CH, 75H, 65H, 20H, 77H, 68H
        db 65H, 6EH, 20H, 75H, 73H, 69H, 6EH, 67H
        db 20H, 2DH, 72H, 2EH, 00H, 00H, 00H, 00H

?_086: ; Unknown tag: %s. Expected -f or -r.
        db 55H, 6EH, 6BH, 6EH, 6FH, 77H, 6EH, 20H
        db 74H, 61H, 67H, 3AH, 20H, 25H, 73H, 2EH
        db 20H, 45H, 78H, 70H, 65H, 63H, 74H, 65H
        db 64H, 20H, 2DH, 66H, 20H, 6FH, 72H, 20H
        db 2DH, 72H, 2EH, 0AH, 00H

?_087: ; Retrieved data from file.
        db 52H, 65H, 74H, 72H, 69H, 65H, 76H, 65H
        db 64H, 20H, 64H, 61H, 74H, 61H, 20H, 66H
        db 72H, 6FH, 6DH, 20H, 66H, 69H, 6CH, 65H
        db 2EH, 00H, 00H

?_088: ; Written the original data in file.
        db 57H, 72H, 69H, 74H, 74H, 65H, 6EH, 20H
        db 74H, 68H, 65H, 20H, 6FH, 72H, 69H, 67H
        db 69H, 6EH, 61H, 6CH, 20H, 64H, 61H, 74H
        db 61H, 20H, 69H, 6EH, 20H, 66H, 69H, 6CH
        db 65H, 2EH, 00H

?_089: ; Data sorted
        db 44H, 61H, 74H, 61H, 20H, 73H, 6FH, 72H
        db 74H, 65H, 64H, 2EH, 00H

?_090: ; Written the sorted data in file.
        db 57H, 72H, 69H, 74H, 74H, 65H, 6EH, 20H
        db 74H, 68H, 65H, 20H, 73H, 6FH, 72H, 74H
        db 65H, 64H, 20H, 64H, 61H, 74H, 61H, 20H
        db 69H, 6EH, 20H, 66H, 69H, 6CH, 65H, 2EH
        db 00H

?_091: ; Executed in %ld ms.
        db 45H, 78H, 65H, 63H, 75H, 74H, 65H, 64H
        db 20H, 69H, 6EH, 20H, 25H, 6CH, 64H, 20H
        db 6DH, 73H, 2EH, 00H, 00H, 00H, 00H


SECTION .text.startup                

.text.startup:; Local function

_main: ; main function
        push    ebp                  
        mov     eax, 760112          
        mov     ebp, esp             
        push    edi                  
        push    esi                  
        push    ebx                  
        and     esp, 0FFFFFFF0H      
        call    ___chkstk_ms         
        sub     esp, eax             
        call    ___main              
        call    _clock               
        cmp     dword [ebp+8H], 4    
        mov     dword [esp+10H], eax 
        jne     ?_099                
        mov     eax, dword [ebp+0CH] 
        mov     edi, ?_083           
        mov     ecx, 3               
        mov     edx, dword [eax+4H]  
        mov     esi, edx             
        repe cmpsb                   
        je      ?_095                
        mov     edi, ?_084           
        mov     ecx, 3               
        mov     esi, edx             
        repe cmpsb                   
        jne     ?_100                
?_092:  lea     eax, [esp+70H]       
        mov     dword [esp+8H], 10000
        mov     dword [esp+4H], eax  
        mov     dword [esp+14H], eax 
        mov     eax, dword [ebp+0CH] 
        mov     eax, dword [eax+8H]  
        mov     dword [esp], eax     
        call    _read_data_from_file 
        mov     ebx, eax             
?_093:  mov     dword [esp], ?_087   
        call    _puts                
        mov     esi, dword [esp+14H] 
        mov     eax, dword [ebp+0CH] 
        mov     dword [esp+0CH], 0   
        mov     dword [esp+8H], ebx  
        mov     dword [esp+4H], esi  
        mov     eax, dword [eax+0CH] 
        mov     dword [esp], eax     
        call    _write_data_to_file  
        mov     dword [esp], ?_088   
        call    _puts                
        mov     dword [esp+4H], ebx  
        mov     dword [esp], esi     
        call    _heap_sort_desc      
        mov     dword [esp], ?_089   
        call    _puts                
        mov     eax, dword [ebp+0CH] 
        mov     dword [esp+0CH], 1   
        mov     dword [esp+8H], ebx  
        mov     dword [esp+4H], esi  
        mov     eax, dword [eax+0CH] 
        mov     dword [esp], eax     
        call    _write_data_to_file  
        mov     dword [esp], ?_090   
        call    _puts                
        call    _clock               
        sub     eax, dword [esp+10H] 
        mov     dword [esp], ?_091   
        mov     dword [esp+4H], eax  
        call    _printf              
        xor     eax, eax             
?_094:  lea     esp, [ebp-0CH]       
        pop     ebx                  
        pop     esi                  
        pop     edi                  
        pop     ebp                  
        ret                          

?_095:  mov     dword [esp], 0       
        call    _time                
        mov     dword [esp], eax     
        call    _srand               
        mov     eax, dword [ebp+0CH] 
        mov     edx, dword [eax+4H]  
        mov     dword [esp+4H], ?_084
        mov     dword [esp], edx     
        mov     dword [esp+1CH], edx 
        call    _strcmp              
        test    eax, eax             
        mov     edx, dword [esp+1CH] 
        je      ?_092                
        mov     dword [esp], edx     
        mov     dword [esp+4H], ?_083
        mov     dword [esp+1CH], edx 
        call    _strcmp              
        test    eax, eax             
        mov     ebx, eax             
        mov     edx, dword [esp+1CH] 
        jne     ?_100                
        mov     eax, dword [ebp+0CH] 
        mov     eax, dword [eax+8H]  
        mov     dword [esp], eax     
        call    _atoi                
        test    eax, eax             
        js      ?_101                
        cmp     eax, 10000           
        mov     dword [esp+18H], eax 
        jle     ?_098                
        mov     dword [esp+18H], 1000
?_096:  lea     eax, [esp+70H]       
        mov     dword [esp+14H], eax 
        nop                          

ALIGN   8
?_097:  mov     dword [esp+1CH], eax 
        lea     eax, [esp+20H]       
        mov     dword [esp+4H], ebx  
        add     ebx, 1               
        lea     esi, [esp+20H]       
        mov     dword [esp], eax     
        call    _generate_creature   
        mov     eax, dword [esp+1CH] 
        mov     ecx, 19              
        mov     edi, eax             
        add     eax, 76              
        cmp     dword [esp+18H], ebx 
        rep movsd                    
        jnz     ?_097                
        jmp     ?_093                

?_098:  test    eax, eax             
        jnz     ?_096                
        lea     eax, [esp+70H]       
        mov     dword [esp+14H], eax 
        jmp     ?_093                

?_099:  mov     dword [esp], ?_082   
        call    _puts                
        or      eax, 0FFFFFFFFH      
        jmp     ?_094                

?_100:  mov     dword [esp+4H], edx  
        mov     dword [esp], ?_086   
        call    _printf              
        mov     eax, 4294967294      
        jmp     ?_094                

?_101:  ; Local function
        mov     dword [esp], ?_085   
        call    _printf              
        mov     eax, 4294967280      
        jmp     ?_094                

        nop                          
        nop                          
        nop                          
        nop                          
        nop                          
