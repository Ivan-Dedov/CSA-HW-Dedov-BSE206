; Disassembly of file: hw4.o
; Sun Nov 21 14:49:30 2021
; Type: COFF32
; Syntax: NASM
; Instruction set: 80386, 80x87


global _get_creature_metric: function
global _compare: function
global _copy: function
global _get_creature_name: function
global _generate_creature: function
global _print_creature_to_file: function
global _read_data_from_file: function
global _generate_randomly: function
global _write_data_to_file: function
global _swap: function
global _heapify: function
global _heap_sort_desc: function
global _main: function

extern _atoi                                            ; near
extern _srand                                           ; near
extern _time                                            ; near
extern _strcmp                                          ; near
extern _puts                                            ; near
extern _clock                                           ; near
extern _fclose                                          ; near
extern _fscanf                                          ; near
extern _fopen                                           ; near
extern _exit                                            ; near
extern _printf                                          ; near
extern _fwrite                                          ; near
extern _fprintf                                         ; near
extern _rand                                            ; near
extern _sprintf                                         ; near
extern _strlen                                          ; near
extern ___chkstk_ms                                     ; near
extern ___main                                          ; near


SECTION .text   align=4 execute                         ; section number 1, code

.text:  ; Local function

_get_creature_metric:
        push    ebp                                     ; 0000 _ 55
        mov     ebp, esp                                ; 0001 _ 89. E5
        sub     esp, 72                                 ; 0003 _ 83. EC, 48
        mov     eax, dword [ebp+8H]                     ; 0006 _ 8B. 45, 08
        mov     dword [ebp-18H], eax                    ; 0009 _ 89. 45, E8
        mov     eax, dword [ebp-18H]                    ; 000C _ 8B. 45, E8
        mov     dword [esp], eax                        ; 000F _ 89. 04 24
        call    _strlen                                 ; 0012 _ E8, 00000000(rel)
        mov     dword [ebp-1CH], eax                    ; 0017 _ 89. 45, E4
        fldz                                            ; 001A _ D9. EE
        fstp    qword [ebp-10H]                         ; 001C _ DD. 5D, F0
        mov     dword [ebp-14H], 0                      ; 001F _ C7. 45, EC, 00000000
        jmp     ?_002                                   ; 0026 _ EB, 20

?_001:  mov     edx, dword [ebp-18H]                    ; 0028 _ 8B. 55, E8
        mov     eax, dword [ebp-14H]                    ; 002B _ 8B. 45, EC
        add     eax, edx                                ; 002E _ 01. D0
        movzx   eax, byte [eax]                         ; 0030 _ 0F B6. 00
        cbw                                             ; 0033 _ 66: 98
        mov     word [ebp-2CH], ax                      ; 0035 _ 66: 89. 45, D4
        fild    word [ebp-2CH]                          ; 0039 _ DF. 45, D4
        fld     qword [ebp-10H]                         ; 003C _ DD. 45, F0
        faddp   st1, st(0)                              ; 003F _ DE. C1
        fstp    qword [ebp-10H]                         ; 0041 _ DD. 5D, F0
        add     dword [ebp-14H], 1                      ; 0044 _ 83. 45, EC, 01
?_002:  mov     eax, dword [ebp-14H]                    ; 0048 _ 8B. 45, EC
        cmp     eax, dword [ebp-1CH]                    ; 004B _ 3B. 45, E4
        jc      ?_001                                   ; 004E _ 72, D8
        mov     eax, dword [ebp+8H]                     ; 0050 _ 8B. 45, 08
        mov     eax, dword [eax+40H]                    ; 0053 _ 8B. 40, 40
        mov     dword [ebp-2CH], eax                    ; 0056 _ 89. 45, D4
        fild    dword [ebp-2CH]                         ; 0059 _ DB. 45, D4
        fld     qword [ebp-10H]                         ; 005C _ DD. 45, F0
        fdivrp  st1, st(0)                              ; 005F _ DE. F1
        leave                                           ; 0061 _ C9
        ret                                             ; 0062 _ C3

_compare:; Function begin
        push    ebp                                     ; 0063 _ 55
        mov     ebp, esp                                ; 0064 _ 89. E5
        sub     esp, 40                                 ; 0066 _ 83. EC, 28
        mov     eax, dword [ebp+8H]                     ; 0069 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 006C _ 89. 04 24
        call    _get_creature_metric                    ; 006F _ E8, FFFFFF8C
        fstp    qword [ebp-10H]                         ; 0074 _ DD. 5D, F0
        mov     eax, dword [ebp+0CH]                    ; 0077 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 007A _ 89. 04 24
        call    _get_creature_metric                    ; 007D _ E8, FFFFFF7E
        fstp    qword [ebp-18H]                         ; 0082 _ DD. 5D, E8
        fld     qword [ebp-18H]                         ; 0085 _ DD. 45, E8
        fld     qword [ebp-10H]                         ; 0088 _ DD. 45, F0
        fxch    st1                                     ; 008B _ D9. C9
        fucompp                                         ; 008D _ DA. E9
        fnstsw  ax                                      ; 008F _ DF. E0
        sahf                                            ; 0091 _ 9E
        jbe     ?_003                                   ; 0092 _ 76, 07
        mov     eax, 4294967295                         ; 0094 _ B8, FFFFFFFF
        jmp     ?_005                                   ; 0099 _ EB, 1B

?_003:  fld     qword [ebp-10H]                         ; 009B _ DD. 45, F0
        fld     qword [ebp-18H]                         ; 009E _ DD. 45, E8
        fxch    st1                                     ; 00A1 _ D9. C9
        fucompp                                         ; 00A3 _ DA. E9
        fnstsw  ax                                      ; 00A5 _ DF. E0
        sahf                                            ; 00A7 _ 9E
        jbe     ?_004                                   ; 00A8 _ 76, 07
        mov     eax, 1                                  ; 00AA _ B8, 00000001
        jmp     ?_005                                   ; 00AF _ EB, 05

?_004:  mov     eax, 0                                  ; 00B1 _ B8, 00000000
?_005:  leave                                           ; 00B6 _ C9
        ret                                             ; 00B7 _ C3
; _compare End of function

_copy:  ; Function begin
        push    ebp                                     ; 00B8 _ 55
        mov     ebp, esp                                ; 00B9 _ 89. E5
        sub     esp, 40                                 ; 00BB _ 83. EC, 28
        mov     eax, dword [ebp+8H]                     ; 00BE _ 8B. 45, 08
        mov     dword [esp], eax                        ; 00C1 _ 89. 04 24
        call    _strlen                                 ; 00C4 _ E8, 00000000(rel)
        mov     dword [ebp-10H], eax                    ; 00C9 _ 89. 45, F0
        mov     dword [ebp-0CH], 0                      ; 00CC _ C7. 45, F4, 00000000
        jmp     ?_007                                   ; 00D3 _ EB, 19

?_006:  mov     edx, dword [ebp+8H]                     ; 00D5 _ 8B. 55, 08
        mov     eax, dword [ebp-0CH]                    ; 00D8 _ 8B. 45, F4
        add     eax, edx                                ; 00DB _ 01. D0
        movzx   eax, byte [eax]                         ; 00DD _ 0F B6. 00
        mov     ecx, dword [ebp+0CH]                    ; 00E0 _ 8B. 4D, 0C
        mov     edx, dword [ebp-0CH]                    ; 00E3 _ 8B. 55, F4
        add     edx, ecx                                ; 00E6 _ 01. CA
        mov     byte [edx], al                          ; 00E8 _ 88. 02
        add     dword [ebp-0CH], 1                      ; 00EA _ 83. 45, F4, 01
?_007:  mov     eax, dword [ebp-0CH]                    ; 00EE _ 8B. 45, F4
        cmp     eax, dword [ebp-10H]                    ; 00F1 _ 3B. 45, F0
        jc      ?_006                                   ; 00F4 _ 72, DF
        mov     edx, dword [ebp+0CH]                    ; 00F6 _ 8B. 55, 0C
        mov     eax, dword [ebp-10H]                    ; 00F9 _ 8B. 45, F0
        add     eax, edx                                ; 00FC _ 01. D0
        mov     byte [eax], 0                           ; 00FE _ C6. 00, 00
        mov     eax, dword [ebp+8H]                     ; 0101 _ 8B. 45, 08
        mov     edx, dword [eax+40H]                    ; 0104 _ 8B. 50, 40
        mov     eax, dword [ebp+0CH]                    ; 0107 _ 8B. 45, 0C
        mov     dword [eax+40H], edx                    ; 010A _ 89. 50, 40
        mov     eax, dword [ebp+8H]                     ; 010D _ 8B. 45, 08
        mov     edx, dword [eax+44H]                    ; 0110 _ 8B. 50, 44
        mov     eax, dword [ebp+0CH]                    ; 0113 _ 8B. 45, 0C
        mov     dword [eax+44H], edx                    ; 0116 _ 89. 50, 44
        mov     eax, dword [ebp+8H]                     ; 0119 _ 8B. 45, 08
        mov     edx, dword [eax+48H]                    ; 011C _ 8B. 50, 48
        mov     eax, dword [ebp+0CH]                    ; 011F _ 8B. 45, 0C
        mov     dword [eax+48H], edx                    ; 0122 _ 89. 50, 48
        mov     eax, dword [ebp+8H]                     ; 0125 _ 8B. 45, 08
        mov     edx, dword [eax+48H]                    ; 0128 _ 8B. 50, 48
        mov     eax, dword [ebp+0CH]                    ; 012B _ 8B. 45, 0C
        mov     dword [eax+48H], edx                    ; 012E _ 89. 50, 48
        mov     eax, dword [ebp+8H]                     ; 0131 _ 8B. 45, 08
        mov     edx, dword [eax+48H]                    ; 0134 _ 8B. 50, 48
        mov     eax, dword [ebp+0CH]                    ; 0137 _ 8B. 45, 0C
        mov     dword [eax+48H], edx                    ; 013A _ 89. 50, 48
        nop                                             ; 013D _ 90
        leave                                           ; 013E _ C9
        ret                                             ; 013F _ C3
; _copy End of function

_get_creature_name:; Function begin
        push    ebp                                     ; 0140 _ 55
        mov     ebp, esp                                ; 0141 _ 89. E5
        sub     esp, 40                                 ; 0143 _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 0146 _ 8B. 45, 0C
        mov     dword [esp+8H], eax                     ; 0149 _ 89. 44 24, 08
        mov     dword [esp+4H], ?_065                   ; 014D _ C7. 44 24, 04, 00000000(d)
        lea     eax, [ebp-11H]                          ; 0155 _ 8D. 45, EF
        mov     dword [esp], eax                        ; 0158 _ 89. 04 24
        call    _sprintf                                ; 015B _ E8, 00000000(rel)
        mov     dword [ebp-0CH], 0                      ; 0160 _ C7. 45, F4, 00000000
        jmp     ?_009                                   ; 0167 _ EB, 19

?_008:  mov     edx, dword [ebp-0CH]                    ; 0169 _ 8B. 55, F4
        mov     eax, dword [ebp+8H]                     ; 016C _ 8B. 45, 08
        add     edx, eax                                ; 016F _ 01. C2
        lea     ecx, [ebp-11H]                          ; 0171 _ 8D. 4D, EF
        mov     eax, dword [ebp-0CH]                    ; 0174 _ 8B. 45, F4
        add     eax, ecx                                ; 0177 _ 01. C8
        movzx   eax, byte [eax]                         ; 0179 _ 0F B6. 00
        mov     byte [edx], al                          ; 017C _ 88. 02
        add     dword [ebp-0CH], 1                      ; 017E _ 83. 45, F4, 01
?_009:  cmp     dword [ebp-0CH], 4                      ; 0182 _ 83. 7D, F4, 04
        jle     ?_008                                   ; 0186 _ 7E, E1
        nop                                             ; 0188 _ 90
        leave                                           ; 0189 _ C9
        ret                                             ; 018A _ C3
; _get_creature_name End of function

_generate_creature:; Function begin
        push    ebp                                     ; 018B _ 55
        mov     ebp, esp                                ; 018C _ 89. E5
        push    edi                                     ; 018E _ 57
        push    esi                                     ; 018F _ 56
        push    ebx                                     ; 0190 _ 53
        sub     esp, 156                                ; 0191 _ 81. EC, 0000009C
        mov     dword [ebp-1CH], 1                      ; 0197 _ C7. 45, E4, 00000001
        mov     dword [ebp-20H], 1000                   ; 019E _ C7. 45, E0, 000003E8
        mov     dword [ebp-24H], 1                      ; 01A5 _ C7. 45, DC, 00000001
        mov     dword [ebp-28H], 3                      ; 01AC _ C7. 45, D8, 00000003
        mov     dword [ebp-2CH], 1                      ; 01B3 _ C7. 45, D4, 00000001
        mov     dword [ebp-30H], 4                      ; 01BA _ C7. 45, D0, 00000004
        mov     dword [ebp-34H], 0                      ; 01C1 _ C7. 45, CC, 00000000
        mov     dword [ebp-38H], 1                      ; 01C8 _ C7. 45, C8, 00000001
        mov     dword [ebp-3CH], 1                      ; 01CF _ C7. 45, C4, 00000001
        mov     dword [ebp-40H], 3                      ; 01D6 _ C7. 45, C0, 00000003
        mov     eax, dword [ebp+0CH]                    ; 01DD _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 01E0 _ 89. 44 24, 04
        lea     eax, [ebp-98H]                          ; 01E4 _ 8D. 85, FFFFFF68
        mov     dword [esp], eax                        ; 01EA _ 89. 04 24
        call    _get_creature_name                      ; 01ED _ E8, FFFFFF4E
        call    _rand                                   ; 01F2 _ E8, 00000000(rel)
        mov     edx, eax                                ; 01F7 _ 89. C2
        mov     eax, dword [ebp-20H]                    ; 01F9 _ 8B. 45, E0
        sub     eax, dword [ebp-1CH]                    ; 01FC _ 2B. 45, E4
        lea     ecx, [eax+1H]                           ; 01FF _ 8D. 48, 01
        mov     eax, edx                                ; 0202 _ 89. D0
        cdq                                             ; 0204 _ 99
        idiv    ecx                                     ; 0205 _ F7. F9
        mov     eax, dword [ebp-1CH]                    ; 0207 _ 8B. 45, E4
        add     eax, edx                                ; 020A _ 01. D0
        mov     dword [ebp-58H], eax                    ; 020C _ 89. 45, A8
        call    _rand                                   ; 020F _ E8, 00000000(rel)
        mov     edx, eax                                ; 0214 _ 89. C2
        mov     eax, dword [ebp-28H]                    ; 0216 _ 8B. 45, D8
        sub     eax, dword [ebp-24H]                    ; 0219 _ 2B. 45, DC
        lea     ecx, [eax+1H]                           ; 021C _ 8D. 48, 01
        mov     eax, edx                                ; 021F _ 89. D0
        cdq                                             ; 0221 _ 99
        idiv    ecx                                     ; 0222 _ F7. F9
        mov     eax, dword [ebp-24H]                    ; 0224 _ 8B. 45, DC
        add     eax, edx                                ; 0227 _ 01. D0
        mov     dword [ebp-54H], eax                    ; 0229 _ 89. 45, AC
        mov     eax, dword [ebp-54H]                    ; 022C _ 8B. 45, AC
        cmp     eax, 2                                  ; 022F _ 83. F8, 02
        jz      ?_010                                   ; 0232 _ 74, 2F
        cmp     eax, 3                                  ; 0234 _ 83. F8, 03
        jz      ?_011                                   ; 0237 _ 74, 4F
        cmp     eax, 1                                  ; 0239 _ 83. F8, 01
        jnz     ?_012                                   ; 023C _ 75, 6E
        call    _rand                                   ; 023E _ E8, 00000000(rel)
        mov     edx, eax                                ; 0243 _ 89. C2
        mov     eax, dword [ebp-30H]                    ; 0245 _ 8B. 45, D0
        sub     eax, dword [ebp-2CH]                    ; 0248 _ 2B. 45, D4
        lea     ecx, [eax+1H]                           ; 024B _ 8D. 48, 01
        mov     eax, edx                                ; 024E _ 89. D0
        cdq                                             ; 0250 _ 99
        idiv    ecx                                     ; 0251 _ F7. F9
        mov     eax, dword [ebp-2CH]                    ; 0253 _ 8B. 45, D4
        add     eax, edx                                ; 0256 _ 01. D0
        mov     dword [ebp-44H], eax                    ; 0258 _ 89. 45, BC
        mov     eax, dword [ebp-44H]                    ; 025B _ 8B. 45, BC
        mov     dword [ebp-50H], eax                    ; 025E _ 89. 45, B0
        jmp     ?_012                                   ; 0261 _ EB, 49

?_010:  call    _rand                                   ; 0263 _ E8, 00000000(rel)
        mov     edx, eax                                ; 0268 _ 89. C2
        mov     eax, dword [ebp-38H]                    ; 026A _ 8B. 45, C8
        sub     eax, dword [ebp-34H]                    ; 026D _ 2B. 45, CC
        lea     ecx, [eax+1H]                           ; 0270 _ 8D. 48, 01
        mov     eax, edx                                ; 0273 _ 89. D0
        cdq                                             ; 0275 _ 99
        idiv    ecx                                     ; 0276 _ F7. F9
        mov     eax, dword [ebp-34H]                    ; 0278 _ 8B. 45, CC
        add     eax, edx                                ; 027B _ 01. D0
        mov     dword [ebp-48H], eax                    ; 027D _ 89. 45, B8
        mov     eax, dword [ebp-48H]                    ; 0280 _ 8B. 45, B8
        mov     dword [ebp-50H], eax                    ; 0283 _ 89. 45, B0
        jmp     ?_012                                   ; 0286 _ EB, 24

?_011:  call    _rand                                   ; 0288 _ E8, 00000000(rel)
        mov     edx, eax                                ; 028D _ 89. C2
        mov     eax, dword [ebp-40H]                    ; 028F _ 8B. 45, C0
        sub     eax, dword [ebp-3CH]                    ; 0292 _ 2B. 45, C4
        lea     ecx, [eax+1H]                           ; 0295 _ 8D. 48, 01
        mov     eax, edx                                ; 0298 _ 89. D0
        cdq                                             ; 029A _ 99
        idiv    ecx                                     ; 029B _ F7. F9
        mov     eax, dword [ebp-3CH]                    ; 029D _ 8B. 45, C4
        add     eax, edx                                ; 02A0 _ 01. D0
        mov     dword [ebp-4CH], eax                    ; 02A2 _ 89. 45, B4
        mov     eax, dword [ebp-4CH]                    ; 02A5 _ 8B. 45, B4
        mov     dword [ebp-50H], eax                    ; 02A8 _ 89. 45, B0
        nop                                             ; 02AB _ 90
?_012:  mov     eax, dword [ebp+8H]                     ; 02AC _ 8B. 45, 08
        mov     ebx, eax                                ; 02AF _ 89. C3
        lea     eax, [ebp-98H]                          ; 02B1 _ 8D. 85, FFFFFF68
        mov     edx, 19                                 ; 02B7 _ BA, 00000013
        mov     edi, ebx                                ; 02BC _ 89. DF
        mov     esi, eax                                ; 02BE _ 89. C6
        mov     ecx, edx                                ; 02C0 _ 89. D1
        rep movsd                                       ; 02C2 _ F3: A5
        mov     eax, dword [ebp+8H]                     ; 02C4 _ 8B. 45, 08
        add     esp, 156                                ; 02C7 _ 81. C4, 0000009C
        pop     ebx                                     ; 02CD _ 5B
        pop     esi                                     ; 02CE _ 5E
        pop     edi                                     ; 02CF _ 5F
        pop     ebp                                     ; 02D0 _ 5D
        ret                                             ; 02D1 _ C3
; _generate_creature End of function

_print_creature_to_file:; Function begin
        push    ebp                                     ; 02D2 _ 55
        mov     ebp, esp                                ; 02D3 _ 89. E5
        sub     esp, 24                                 ; 02D5 _ 83. EC, 18
        mov     eax, dword [ebp+0CH]                    ; 02D8 _ 8B. 45, 0C
        mov     eax, dword [eax+44H]                    ; 02DB _ 8B. 40, 44
        cmp     eax, 2                                  ; 02DE _ 83. F8, 02
        je      ?_020                                   ; 02E1 _ 0F 84, 00000124
        cmp     eax, 3                                  ; 02E7 _ 83. F8, 03
        je      ?_023                                   ; 02EA _ 0F 84, 00000197
        cmp     eax, 1                                  ; 02F0 _ 83. F8, 01
        jne     ?_028                                   ; 02F3 _ 0F 85, 00000261
        mov     eax, dword [ebp+0CH]                    ; 02F9 _ 8B. 45, 0C
        mov     edx, dword [eax+40H]                    ; 02FC _ 8B. 50, 40
        mov     eax, dword [ebp+0CH]                    ; 02FF _ 8B. 45, 0C
        mov     dword [esp+0CH], edx                    ; 0302 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0306 _ 89. 44 24, 08
        mov     dword [esp+4H], ?_066                   ; 030A _ C7. 44 24, 04, 00000004(d)
        mov     eax, dword [ebp+8H]                     ; 0312 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0315 _ 89. 04 24
        call    _fprintf                                ; 0318 _ E8, 00000000(rel)
        mov     eax, dword [ebp+0CH]                    ; 031D _ 8B. 45, 0C
        mov     eax, dword [eax+48H]                    ; 0320 _ 8B. 40, 48
        cmp     eax, 2                                  ; 0323 _ 83. F8, 02
        jz      ?_015                                   ; 0326 _ 74, 46
        cmp     eax, 2                                  ; 0328 _ 83. F8, 02
        ja      ?_013                                   ; 032B _ 77, 0A
        cmp     eax, 1                                  ; 032D _ 83. F8, 01
        jz      ?_014                                   ; 0330 _ 74, 14
        jmp     ?_018                                   ; 0332 _ E9, 000000A6

?_013:  cmp     eax, 3                                  ; 0337 _ 83. F8, 03
        jz      ?_016                                   ; 033A _ 74, 57
        cmp     eax, 4                                  ; 033C _ 83. F8, 04
        jz      ?_017                                   ; 033F _ 74, 77
        jmp     ?_018                                   ; 0341 _ E9, 00000097

?_014:  mov     eax, dword [ebp+8H]                     ; 0346 _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 0349 _ 89. 44 24, 0C
        mov     dword [esp+8H], 26                      ; 034D _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 1                       ; 0355 _ C7. 44 24, 04, 00000001
        mov     dword [esp], ?_067                      ; 035D _ C7. 04 24, 00000028(d)
        call    _fwrite                                 ; 0364 _ E8, 00000000(rel)
        jmp     ?_019                                   ; 0369 _ E9, 00000098

?_015:  mov     eax, dword [ebp+8H]                     ; 036E _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 0371 _ 89. 44 24, 0C
        mov     dword [esp+8H], 26                      ; 0375 _ C7. 44 24, 08, 0000001A
        mov     dword [esp+4H], 1                       ; 037D _ C7. 44 24, 04, 00000001
        mov     dword [esp], ?_068                      ; 0385 _ C7. 04 24, 00000043(d)
        call    _fwrite                                 ; 038C _ E8, 00000000(rel)
        jmp     ?_019                                   ; 0391 _ EB, 73

?_016:  mov     eax, dword [ebp+8H]                     ; 0393 _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 0396 _ 89. 44 24, 0C
        mov     dword [esp+8H], 28                      ; 039A _ C7. 44 24, 08, 0000001C
        mov     dword [esp+4H], 1                       ; 03A2 _ C7. 44 24, 04, 00000001
        mov     dword [esp], ?_069                      ; 03AA _ C7. 04 24, 0000005E(d)
        call    _fwrite                                 ; 03B1 _ E8, 00000000(rel)
        jmp     ?_019                                   ; 03B6 _ EB, 4E

?_017:  mov     eax, dword [ebp+8H]                     ; 03B8 _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 03BB _ 89. 44 24, 0C
        mov     dword [esp+8H], 25                      ; 03BF _ C7. 44 24, 08, 00000019
        mov     dword [esp+4H], 1                       ; 03C7 _ C7. 44 24, 04, 00000001
        mov     dword [esp], ?_070                      ; 03CF _ C7. 04 24, 0000007B(d)
        call    _fwrite                                 ; 03D6 _ E8, 00000000(rel)
        jmp     ?_019                                   ; 03DB _ EB, 29

?_018:  mov     eax, dword [ebp+0CH]                    ; 03DD _ 8B. 45, 0C
        mov     eax, dword [eax+48H]                    ; 03E0 _ 8B. 40, 48
        mov     dword [esp+8H], eax                     ; 03E3 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 03E7 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 03EA _ 89. 44 24, 04
        mov     dword [esp], ?_071                      ; 03EE _ C7. 04 24, 00000098(d)
        call    _printf                                 ; 03F5 _ E8, 00000000(rel)
        mov     dword [esp], -4                         ; 03FA _ C7. 04 24, FFFFFFFC
        call    _exit                                   ; 0401 _ E8, 00000000(rel)
?_019:  jmp     ?_029                                   ; 0406 _ E9, 00000178

?_020:  mov     eax, dword [ebp+0CH]                    ; 040B _ 8B. 45, 0C
        mov     edx, dword [eax+40H]                    ; 040E _ 8B. 50, 40
        mov     eax, dword [ebp+0CH]                    ; 0411 _ 8B. 45, 0C
        mov     dword [esp+0CH], edx                    ; 0414 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0418 _ 89. 44 24, 08
        mov     dword [esp+4H], ?_072                   ; 041C _ C7. 44 24, 04, 000000C8(d)
        mov     eax, dword [ebp+8H]                     ; 0424 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0427 _ 89. 04 24
        call    _fprintf                                ; 042A _ E8, 00000000(rel)
        mov     eax, dword [ebp+0CH]                    ; 042F _ 8B. 45, 0C
        mov     eax, dword [eax+48H]                    ; 0432 _ 8B. 40, 48
        test    eax, eax                                ; 0435 _ 85. C0
        jnz     ?_021                                   ; 0437 _ 75, 25
        mov     eax, dword [ebp+8H]                     ; 0439 _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 043C _ 89. 44 24, 0C
        mov     dword [esp+8H], 23                      ; 0440 _ C7. 44 24, 08, 00000017
        mov     dword [esp+4H], 1                       ; 0448 _ C7. 44 24, 04, 00000001
        mov     dword [esp], ?_073                      ; 0450 _ C7. 04 24, 000000EA(d)
        call    _fwrite                                 ; 0457 _ E8, 00000000(rel)
        jmp     ?_022                                   ; 045C _ EB, 24

?_021:  mov     eax, dword [ebp+8H]                     ; 045E _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 0461 _ 89. 44 24, 0C
        mov     dword [esp+8H], 22                      ; 0465 _ C7. 44 24, 08, 00000016
        mov     dword [esp+4H], 1                       ; 046D _ C7. 44 24, 04, 00000001
        mov     dword [esp], ?_074                      ; 0475 _ C7. 04 24, 00000102(d)
        call    _fwrite                                 ; 047C _ E8, 00000000(rel)
        nop                                             ; 0481 _ 90
?_022:  jmp     ?_029                                   ; 0482 _ E9, 000000FC

?_023:  mov     eax, dword [ebp+0CH]                    ; 0487 _ 8B. 45, 0C
        mov     edx, dword [eax+40H]                    ; 048A _ 8B. 50, 40
        mov     eax, dword [ebp+0CH]                    ; 048D _ 8B. 45, 0C
        mov     dword [esp+0CH], edx                    ; 0490 _ 89. 54 24, 0C
        mov     dword [esp+8H], eax                     ; 0494 _ 89. 44 24, 08
        mov     dword [esp+4H], ?_075                   ; 0498 _ C7. 44 24, 04, 0000011C(d)
        mov     eax, dword [ebp+8H]                     ; 04A0 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 04A3 _ 89. 04 24
        call    _fprintf                                ; 04A6 _ E8, 00000000(rel)
        mov     eax, dword [ebp+0CH]                    ; 04AB _ 8B. 45, 0C
        mov     eax, dword [eax+48H]                    ; 04AE _ 8B. 40, 48
        cmp     eax, 2                                  ; 04B1 _ 83. F8, 02
        jz      ?_024                                   ; 04B4 _ 74, 2F
        cmp     eax, 3                                  ; 04B6 _ 83. F8, 03
        jz      ?_025                                   ; 04B9 _ 74, 4F
        cmp     eax, 1                                  ; 04BB _ 83. F8, 01
        jnz     ?_026                                   ; 04BE _ 75, 6F
        mov     eax, dword [ebp+8H]                     ; 04C0 _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 04C3 _ 89. 44 24, 0C
        mov     dword [esp+8H], 17                      ; 04C7 _ C7. 44 24, 08, 00000011
        mov     dword [esp+4H], 1                       ; 04CF _ C7. 44 24, 04, 00000001
        mov     dword [esp], ?_076                      ; 04D7 _ C7. 04 24, 0000013E(d)
        call    _fwrite                                 ; 04DE _ E8, 00000000(rel)
        jmp     ?_027                                   ; 04E3 _ EB, 73

?_024:  mov     eax, dword [ebp+8H]                     ; 04E5 _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 04E8 _ 89. 44 24, 0C
        mov     dword [esp+8H], 18                      ; 04EC _ C7. 44 24, 08, 00000012
        mov     dword [esp+4H], 1                       ; 04F4 _ C7. 44 24, 04, 00000001
        mov     dword [esp], ?_077                      ; 04FC _ C7. 04 24, 00000150(d)
        call    _fwrite                                 ; 0503 _ E8, 00000000(rel)
        jmp     ?_027                                   ; 0508 _ EB, 4E

?_025:  mov     eax, dword [ebp+8H]                     ; 050A _ 8B. 45, 08
        mov     dword [esp+0CH], eax                    ; 050D _ 89. 44 24, 0C
        mov     dword [esp+8H], 16                      ; 0511 _ C7. 44 24, 08, 00000010
        mov     dword [esp+4H], 1                       ; 0519 _ C7. 44 24, 04, 00000001
        mov     dword [esp], ?_078                      ; 0521 _ C7. 04 24, 00000163(d)
        call    _fwrite                                 ; 0528 _ E8, 00000000(rel)
        jmp     ?_027                                   ; 052D _ EB, 29

?_026:  mov     eax, dword [ebp+0CH]                    ; 052F _ 8B. 45, 0C
        mov     eax, dword [eax+48H]                    ; 0532 _ 8B. 40, 48
        mov     dword [esp+8H], eax                     ; 0535 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 0539 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 053C _ 89. 44 24, 04
        mov     dword [esp], ?_079                      ; 0540 _ C7. 04 24, 00000174(d)
        call    _printf                                 ; 0547 _ E8, 00000000(rel)
        mov     dword [esp], -5                         ; 054C _ C7. 04 24, FFFFFFFB
        call    _exit                                   ; 0553 _ E8, 00000000(rel)
?_027:  jmp     ?_029                                   ; 0558 _ EB, 29

?_028:  mov     eax, dword [ebp+0CH]                    ; 055A _ 8B. 45, 0C
        mov     eax, dword [eax+44H]                    ; 055D _ 8B. 40, 44
        mov     dword [esp+8H], eax                     ; 0560 _ 89. 44 24, 08
        mov     eax, dword [ebp+10H]                    ; 0564 _ 8B. 45, 10
        mov     dword [esp+4H], eax                     ; 0567 _ 89. 44 24, 04
        mov     dword [esp], ?_080                      ; 056B _ C7. 04 24, 000001A0(d)
        call    _printf                                 ; 0572 _ E8, 00000000(rel)
        mov     dword [esp], -6                         ; 0577 _ C7. 04 24, FFFFFFFA
        call    _exit                                   ; 057E _ E8, 00000000(rel)
?_029:  nop                                             ; 0583 _ 90
        leave                                           ; 0584 _ C9
        ret                                             ; 0585 _ C3
; _print_creature_to_file End of function

_read_data_from_file:; Function begin
        push    ebp                                     ; 0586 _ 55
        mov     ebp, esp                                ; 0587 _ 89. E5
        push    ebx                                     ; 0589 _ 53
        sub     esp, 52                                 ; 058A _ 83. EC, 34
        mov     dword [esp+4H], ?_081                   ; 058D _ C7. 44 24, 04, 000001C3(d)
        mov     eax, dword [ebp+8H]                     ; 0595 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0598 _ 89. 04 24
        call    _fopen                                  ; 059B _ E8, 00000000(rel)
        mov     dword [ebp-10H], eax                    ; 05A0 _ 89. 45, F0
        cmp     dword [ebp-10H], 0                      ; 05A3 _ 83. 7D, F0, 00
        jnz     ?_030                                   ; 05A7 _ 75, 1F
        mov     eax, dword [ebp+8H]                     ; 05A9 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 05AC _ 89. 44 24, 04
        mov     dword [esp], ?_082                      ; 05B0 _ C7. 04 24, 000001C5(d)
        call    _printf                                 ; 05B7 _ E8, 00000000(rel)
        mov     dword [esp], -10                        ; 05BC _ C7. 04 24, FFFFFFF6
        call    _exit                                   ; 05C3 _ E8, 00000000(rel)
?_030:  mov     dword [ebp-0CH], 0                      ; 05C8 _ C7. 45, F4, 00000000
        jmp     ?_039                                   ; 05CF _ E9, 000001D4

?_031:  mov     eax, dword [ebp-0CH]                    ; 05D4 _ 8B. 45, F4
        imul    edx, eax, 76                            ; 05D7 _ 6B. D0, 4C
        mov     eax, dword [ebp+0CH]                    ; 05DA _ 8B. 45, 0C
        add     eax, edx                                ; 05DD _ 01. D0
        lea     edx, [eax+44H]                          ; 05DF _ 8D. 50, 44
        mov     eax, dword [ebp-0CH]                    ; 05E2 _ 8B. 45, F4
        imul    ecx, eax, 76                            ; 05E5 _ 6B. C8, 4C
        mov     eax, dword [ebp+0CH]                    ; 05E8 _ 8B. 45, 0C
        add     eax, ecx                                ; 05EB _ 01. C8
        add     eax, 64                                 ; 05ED _ 83. C0, 40
        mov     ecx, dword [ebp-0CH]                    ; 05F0 _ 8B. 4D, F4
        imul    ebx, ecx, 76                            ; 05F3 _ 6B. D9, 4C
        mov     ecx, dword [ebp+0CH]                    ; 05F6 _ 8B. 4D, 0C
        add     ecx, ebx                                ; 05F9 _ 01. D9
        mov     dword [esp+10H], edx                    ; 05FB _ 89. 54 24, 10
        mov     dword [esp+0CH], eax                    ; 05FF _ 89. 44 24, 0C
        mov     dword [esp+8H], ecx                     ; 0603 _ 89. 4C 24, 08
        mov     dword [esp+4H], ?_083                   ; 0607 _ C7. 44 24, 04, 000001DF(d)
        mov     eax, dword [ebp-10H]                    ; 060F _ 8B. 45, F0
        mov     dword [esp], eax                        ; 0612 _ 89. 04 24
        call    _fscanf                                 ; 0615 _ E8, 00000000(rel)
        mov     eax, dword [ebp-0CH]                    ; 061A _ 8B. 45, F4
        imul    edx, eax, 76                            ; 061D _ 6B. D0, 4C
        mov     eax, dword [ebp+0CH]                    ; 0620 _ 8B. 45, 0C
        add     eax, edx                                ; 0623 _ 01. D0
        mov     eax, dword [eax+40H]                    ; 0625 _ 8B. 40, 40
        test    eax, eax                                ; 0628 _ 85. C0
        jg      ?_032                                   ; 062A _ 7F, 31
        mov     eax, dword [ebp-0CH]                    ; 062C _ 8B. 45, F4
        imul    edx, eax, 76                            ; 062F _ 6B. D0, 4C
        mov     eax, dword [ebp+0CH]                    ; 0632 _ 8B. 45, 0C
        add     eax, edx                                ; 0635 _ 01. D0
        mov     eax, dword [eax+40H]                    ; 0637 _ 8B. 40, 40
        mov     dword [esp+8H], eax                     ; 063A _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 063E _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 0641 _ 89. 44 24, 04
        mov     dword [esp], ?_084                      ; 0645 _ C7. 04 24, 000001E8(d)
        call    _printf                                 ; 064C _ E8, 00000000(rel)
        mov     dword [esp], -11                        ; 0651 _ C7. 04 24, FFFFFFF5
        call    _exit                                   ; 0658 _ E8, 00000000(rel)
?_032:  mov     eax, dword [ebp-0CH]                    ; 065D _ 8B. 45, F4
        imul    edx, eax, 76                            ; 0660 _ 6B. D0, 4C
        mov     eax, dword [ebp+0CH]                    ; 0663 _ 8B. 45, 0C
        add     eax, edx                                ; 0666 _ 01. D0
        mov     eax, dword [eax+44H]                    ; 0668 _ 8B. 40, 44
        cmp     eax, 2                                  ; 066B _ 83. F8, 02
        jz      ?_034                                   ; 066E _ 74, 77
        cmp     eax, 3                                  ; 0670 _ 83. F8, 03
        je      ?_035                                   ; 0673 _ 0F 84, 00000098
        cmp     eax, 1                                  ; 0679 _ 83. F8, 01
        jne     ?_037                                   ; 067C _ 0F 85, 000000F1
        lea     eax, [ebp-14H]                          ; 0682 _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 0685 _ 89. 44 24, 08
        mov     dword [esp+4H], ?_065                   ; 0689 _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-10H]                    ; 0691 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 0694 _ 89. 04 24
        call    _fscanf                                 ; 0697 _ E8, 00000000(rel)
        mov     eax, dword [ebp-14H]                    ; 069C _ 8B. 45, EC
        test    eax, eax                                ; 069F _ 85. C0
        jle     ?_033                                   ; 06A1 _ 7E, 1E
        mov     eax, dword [ebp-14H]                    ; 06A3 _ 8B. 45, EC
        cmp     eax, 4                                  ; 06A6 _ 83. F8, 04
        jg      ?_033                                   ; 06A9 _ 7F, 16
        mov     eax, dword [ebp-0CH]                    ; 06AB _ 8B. 45, F4
        imul    edx, eax, 76                            ; 06AE _ 6B. D0, 4C
        mov     eax, dword [ebp+0CH]                    ; 06B1 _ 8B. 45, 0C
        add     eax, edx                                ; 06B4 _ 01. D0
        mov     edx, dword [ebp-14H]                    ; 06B6 _ 8B. 55, EC
        mov     dword [eax+48H], edx                    ; 06B9 _ 89. 50, 48
        jmp     ?_038                                   ; 06BC _ E9, 000000E3

?_033:  mov     eax, dword [ebp-14H]                    ; 06C1 _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 06C4 _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 06C8 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 06CB _ 89. 44 24, 04
        mov     dword [esp], ?_085                      ; 06CF _ C7. 04 24, 00000238(d)
        call    _printf                                 ; 06D6 _ E8, 00000000(rel)
        mov     dword [esp], -12                        ; 06DB _ C7. 04 24, FFFFFFF4
        call    _exit                                   ; 06E2 _ E8, 00000000(rel)
?_034:  mov     eax, dword [ebp-0CH]                    ; 06E7 _ 8B. 45, F4
        imul    edx, eax, 76                            ; 06EA _ 6B. D0, 4C
        mov     eax, dword [ebp+0CH]                    ; 06ED _ 8B. 45, 0C
        add     eax, edx                                ; 06F0 _ 01. D0
        add     eax, 72                                 ; 06F2 _ 83. C0, 48
        mov     dword [esp+8H], eax                     ; 06F5 _ 89. 44 24, 08
        mov     dword [esp+4H], ?_065                   ; 06F9 _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-10H]                    ; 0701 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 0704 _ 89. 04 24
        call    _fscanf                                 ; 0707 _ E8, 00000000(rel)
        jmp     ?_038                                   ; 070C _ E9, 00000093

?_035:  lea     eax, [ebp-14H]                          ; 0711 _ 8D. 45, EC
        mov     dword [esp+8H], eax                     ; 0714 _ 89. 44 24, 08
        mov     dword [esp+4H], ?_065                   ; 0718 _ C7. 44 24, 04, 00000000(d)
        mov     eax, dword [ebp-10H]                    ; 0720 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 0723 _ 89. 04 24
        call    _fscanf                                 ; 0726 _ E8, 00000000(rel)
        mov     eax, dword [ebp-14H]                    ; 072B _ 8B. 45, EC
        test    eax, eax                                ; 072E _ 85. C0
        jle     ?_036                                   ; 0730 _ 7E, 1B
        mov     eax, dword [ebp-14H]                    ; 0732 _ 8B. 45, EC
        cmp     eax, 3                                  ; 0735 _ 83. F8, 03
        jg      ?_036                                   ; 0738 _ 7F, 13
        mov     eax, dword [ebp-0CH]                    ; 073A _ 8B. 45, F4
        imul    edx, eax, 76                            ; 073D _ 6B. D0, 4C
        mov     eax, dword [ebp+0CH]                    ; 0740 _ 8B. 45, 0C
        add     eax, edx                                ; 0743 _ 01. D0
        mov     edx, dword [ebp-14H]                    ; 0745 _ 8B. 55, EC
        mov     dword [eax+48H], edx                    ; 0748 _ 89. 50, 48
        jmp     ?_038                                   ; 074B _ EB, 57

?_036:  mov     eax, dword [ebp-14H]                    ; 074D _ 8B. 45, EC
        mov     dword [esp+8H], eax                     ; 0750 _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 0754 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 0757 _ 89. 44 24, 04
        mov     dword [esp], ?_086                      ; 075B _ C7. 04 24, 00000294(d)
        call    _printf                                 ; 0762 _ E8, 00000000(rel)
        mov     dword [esp], -13                        ; 0767 _ C7. 04 24, FFFFFFF3
        call    _exit                                   ; 076E _ E8, 00000000(rel)
?_037:  mov     eax, dword [ebp-0CH]                    ; 0773 _ 8B. 45, F4
        imul    edx, eax, 76                            ; 0776 _ 6B. D0, 4C
        mov     eax, dword [ebp+0CH]                    ; 0779 _ 8B. 45, 0C
        add     eax, edx                                ; 077C _ 01. D0
        mov     eax, dword [eax+44H]                    ; 077E _ 8B. 40, 44
        mov     dword [esp+8H], eax                     ; 0781 _ 89. 44 24, 08
        mov     eax, dword [ebp-0CH]                    ; 0785 _ 8B. 45, F4
        mov     dword [esp+4H], eax                     ; 0788 _ 89. 44 24, 04
        mov     dword [esp], ?_087                      ; 078C _ C7. 04 24, 000002EC(d)
        call    _printf                                 ; 0793 _ E8, 00000000(rel)
        mov     dword [esp], -14                        ; 0798 _ C7. 04 24, FFFFFFF2
        call    _exit                                   ; 079F _ E8, 00000000(rel)
?_038:  add     dword [ebp-0CH], 1                      ; 07A4 _ 83. 45, F4, 01
?_039:  mov     eax, dword [ebp-10H]                    ; 07A8 _ 8B. 45, F0
        mov     eax, dword [eax+0CH]                    ; 07AB _ 8B. 40, 0C
        and     eax, 10H                                ; 07AE _ 83. E0, 10
        test    eax, eax                                ; 07B1 _ 85. C0
        jnz     ?_040                                   ; 07B3 _ 75, 0C
        mov     eax, dword [ebp-0CH]                    ; 07B5 _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 07B8 _ 3B. 45, 10
        jl      ?_031                                   ; 07BB _ 0F 8C, FFFFFE13
?_040:  mov     eax, dword [ebp-10H]                    ; 07C1 _ 8B. 45, F0
        mov     dword [esp], eax                        ; 07C4 _ 89. 04 24
        call    _fclose                                 ; 07C7 _ E8, 00000000(rel)
        mov     eax, dword [ebp-0CH]                    ; 07CC _ 8B. 45, F4
        add     esp, 52                                 ; 07CF _ 83. C4, 34
        pop     ebx                                     ; 07D2 _ 5B
        pop     ebp                                     ; 07D3 _ 5D
        ret                                             ; 07D4 _ C3
; _read_data_from_file End of function

_generate_randomly:; Function begin
        push    ebp                                     ; 07D5 _ 55
        mov     ebp, esp                                ; 07D6 _ 89. E5
        push    edi                                     ; 07D8 _ 57
        push    esi                                     ; 07D9 _ 56
        push    ebx                                     ; 07DA _ 53
        sub     esp, 124                                ; 07DB _ 83. EC, 7C
        mov     edx, dword [ebp+0CH]                    ; 07DE _ 8B. 55, 0C
        mov     eax, dword [ebp+10H]                    ; 07E1 _ 8B. 45, 10
        cmp     eax, edx                                ; 07E4 _ 39. D0
        jle     ?_041                                   ; 07E6 _ 7E, 02
        mov     eax, edx                                ; 07E8 _ 89. D0
?_041:  mov     dword [ebp-20H], eax                    ; 07EA _ 89. 45, E0
        mov     dword [ebp-1CH], 0                      ; 07ED _ C7. 45, E4, 00000000
        jmp     ?_043                                   ; 07F4 _ EB, 32

?_042:  mov     eax, dword [ebp-1CH]                    ; 07F6 _ 8B. 45, E4
        imul    edx, eax, 76                            ; 07F9 _ 6B. D0, 4C
        mov     eax, dword [ebp+8H]                     ; 07FC _ 8B. 45, 08
        lea     ebx, [edx+eax]                          ; 07FF _ 8D. 1C 02
        lea     eax, [ebp-78H]                          ; 0802 _ 8D. 45, 88
        mov     edx, dword [ebp-1CH]                    ; 0805 _ 8B. 55, E4
        mov     dword [esp+4H], edx                     ; 0808 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 080C _ 89. 04 24
        call    _generate_creature                      ; 080F _ E8, FFFFF977
        lea     eax, [ebp-78H]                          ; 0814 _ 8D. 45, 88
        mov     edx, 19                                 ; 0817 _ BA, 00000013
        mov     edi, ebx                                ; 081C _ 89. DF
        mov     esi, eax                                ; 081E _ 89. C6
        mov     ecx, edx                                ; 0820 _ 89. D1
        rep movsd                                       ; 0822 _ F3: A5
        add     dword [ebp-1CH], 1                      ; 0824 _ 83. 45, E4, 01
?_043:  mov     eax, dword [ebp-1CH]                    ; 0828 _ 8B. 45, E4
        cmp     eax, dword [ebp-20H]                    ; 082B _ 3B. 45, E0
        jl      ?_042                                   ; 082E _ 7C, C6
        mov     eax, dword [ebp-20H]                    ; 0830 _ 8B. 45, E0
        add     esp, 124                                ; 0833 _ 83. C4, 7C
        pop     ebx                                     ; 0836 _ 5B
        pop     esi                                     ; 0837 _ 5E
        pop     edi                                     ; 0838 _ 5F
        pop     ebp                                     ; 0839 _ 5D
        ret                                             ; 083A _ C3
; _generate_randomly End of function

_write_data_to_file:; Function begin
        push    ebp                                     ; 083B _ 55
        mov     ebp, esp                                ; 083C _ 89. E5
        sub     esp, 40                                 ; 083E _ 83. EC, 28
        cmp     dword [ebp+14H], 0                      ; 0841 _ 83. 7D, 14, 00
        jnz     ?_044                                   ; 0845 _ 75, 18
        mov     dword [esp+4H], ?_088                   ; 0847 _ C7. 44 24, 04, 00000352(d)
        mov     eax, dword [ebp+8H]                     ; 084F _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0852 _ 89. 04 24
        call    _fopen                                  ; 0855 _ E8, 00000000(rel)
        mov     dword [ebp-0CH], eax                    ; 085A _ 89. 45, F4
        jmp     ?_045                                   ; 085D _ EB, 16

?_044:  mov     dword [esp+4H], ?_089                   ; 085F _ C7. 44 24, 04, 00000354(d)
        mov     eax, dword [ebp+8H]                     ; 0867 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 086A _ 89. 04 24
        call    _fopen                                  ; 086D _ E8, 00000000(rel)
        mov     dword [ebp-0CH], eax                    ; 0872 _ 89. 45, F4
?_045:  cmp     dword [ebp-0CH], 0                      ; 0875 _ 83. 7D, F4, 00
        jnz     ?_046                                   ; 0879 _ 75, 1F
        mov     eax, dword [ebp+8H]                     ; 087B _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 087E _ 89. 44 24, 04
        mov     dword [esp], ?_090                      ; 0882 _ C7. 04 24, 00000358(d)
        call    _printf                                 ; 0889 _ E8, 00000000(rel)
        mov     dword [esp], -14                        ; 088E _ C7. 04 24, FFFFFFF2
        call    _exit                                   ; 0895 _ E8, 00000000(rel)
?_046:  cmp     dword [ebp+14H], 0                      ; 089A _ 83. 7D, 14, 00
        jnz     ?_047                                   ; 089E _ 75, 1C
        mov     eax, dword [ebp+10H]                    ; 08A0 _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 08A3 _ 89. 44 24, 08
        mov     dword [esp+4H], ?_091                   ; 08A7 _ C7. 44 24, 04, 00000386(d)
        mov     eax, dword [ebp-0CH]                    ; 08AF _ 8B. 45, F4
        mov     dword [esp], eax                        ; 08B2 _ 89. 04 24
        call    _fprintf                                ; 08B5 _ E8, 00000000(rel)
        jmp     ?_048                                   ; 08BA _ EB, 1A

?_047:  mov     eax, dword [ebp+10H]                    ; 08BC _ 8B. 45, 10
        mov     dword [esp+8H], eax                     ; 08BF _ 89. 44 24, 08
        mov     dword [esp+4H], ?_092                   ; 08C3 _ C7. 44 24, 04, 000003A4(d)
        mov     eax, dword [ebp-0CH]                    ; 08CB _ 8B. 45, F4
        mov     dword [esp], eax                        ; 08CE _ 89. 04 24
        call    _fprintf                                ; 08D1 _ E8, 00000000(rel)
?_048:  mov     dword [ebp-10H], 0                      ; 08D6 _ C7. 45, F0, 00000000
        jmp     ?_050                                   ; 08DD _ EB, 25

?_049:  mov     eax, dword [ebp-10H]                    ; 08DF _ 8B. 45, F0
        imul    edx, eax, 76                            ; 08E2 _ 6B. D0, 4C
        mov     eax, dword [ebp+0CH]                    ; 08E5 _ 8B. 45, 0C
        add     edx, eax                                ; 08E8 _ 01. C2
        mov     eax, dword [ebp-10H]                    ; 08EA _ 8B. 45, F0
        mov     dword [esp+8H], eax                     ; 08ED _ 89. 44 24, 08
        mov     dword [esp+4H], edx                     ; 08F1 _ 89. 54 24, 04
        mov     eax, dword [ebp-0CH]                    ; 08F5 _ 8B. 45, F4
        mov     dword [esp], eax                        ; 08F8 _ 89. 04 24
        call    _print_creature_to_file                 ; 08FB _ E8, FFFFF9D2
        add     dword [ebp-10H], 1                      ; 0900 _ 83. 45, F0, 01
?_050:  mov     eax, dword [ebp-10H]                    ; 0904 _ 8B. 45, F0
        cmp     eax, dword [ebp+10H]                    ; 0907 _ 3B. 45, 10
        jl      ?_049                                   ; 090A _ 7C, D3
        mov     eax, dword [ebp-0CH]                    ; 090C _ 8B. 45, F4
        mov     dword [esp], eax                        ; 090F _ 89. 04 24
        call    _fclose                                 ; 0912 _ E8, 00000000(rel)
        nop                                             ; 0917 _ 90
        leave                                           ; 0918 _ C9
        ret                                             ; 0919 _ C3
; _write_data_to_file End of function

_swap:  ; Function begin
        push    ebp                                     ; 091A _ 55
        mov     ebp, esp                                ; 091B _ 89. E5
        sub     esp, 104                                ; 091D _ 83. EC, 68
        mov     dword [ebp-14H], 69                     ; 0920 _ C7. 45, EC, 00000045
        lea     eax, [ebp-54H]                          ; 0927 _ 8D. 45, AC
        mov     dword [esp+4H], eax                     ; 092A _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 092E _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0931 _ 89. 04 24
        call    _copy                                   ; 0934 _ E8, FFFFF77F
        mov     eax, dword [ebp+8H]                     ; 0939 _ 8B. 45, 08
        mov     dword [esp+4H], eax                     ; 093C _ 89. 44 24, 04
        mov     eax, dword [ebp+0CH]                    ; 0940 _ 8B. 45, 0C
        mov     dword [esp], eax                        ; 0943 _ 89. 04 24
        call    _copy                                   ; 0946 _ E8, FFFFF76D
        mov     eax, dword [ebp+0CH]                    ; 094B _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 094E _ 89. 44 24, 04
        lea     eax, [ebp-54H]                          ; 0952 _ 8D. 45, AC
        mov     dword [esp], eax                        ; 0955 _ 89. 04 24
        call    _copy                                   ; 0958 _ E8, FFFFF75B
        nop                                             ; 095D _ 90
        leave                                           ; 095E _ C9
        ret                                             ; 095F _ C3
; _swap End of function

_heapify:; Function begin
        push    ebp                                     ; 0960 _ 55
        mov     ebp, esp                                ; 0961 _ 89. E5
        sub     esp, 40                                 ; 0963 _ 83. EC, 28
        mov     eax, dword [ebp+10H]                    ; 0966 _ 8B. 45, 10
        mov     dword [ebp-0CH], eax                    ; 0969 _ 89. 45, F4
        mov     eax, dword [ebp+10H]                    ; 096C _ 8B. 45, 10
        add     eax, eax                                ; 096F _ 01. C0
        add     eax, 1                                  ; 0971 _ 83. C0, 01
        mov     dword [ebp-10H], eax                    ; 0974 _ 89. 45, F0
        mov     eax, dword [ebp+10H]                    ; 0977 _ 8B. 45, 10
        add     eax, 1                                  ; 097A _ 83. C0, 01
        add     eax, eax                                ; 097D _ 01. C0
        mov     dword [ebp-14H], eax                    ; 097F _ 89. 45, EC
        mov     eax, dword [ebp-10H]                    ; 0982 _ 8B. 45, F0
        cmp     eax, dword [ebp+0CH]                    ; 0985 _ 3B. 45, 0C
        jge     ?_051                                   ; 0988 _ 7D, 2D
        mov     eax, dword [ebp-0CH]                    ; 098A _ 8B. 45, F4
        imul    edx, eax, 76                            ; 098D _ 6B. D0, 4C
        mov     eax, dword [ebp+8H]                     ; 0990 _ 8B. 45, 08
        add     edx, eax                                ; 0993 _ 01. C2
        mov     eax, dword [ebp-10H]                    ; 0995 _ 8B. 45, F0
        imul    ecx, eax, 76                            ; 0998 _ 6B. C8, 4C
        mov     eax, dword [ebp+8H]                     ; 099B _ 8B. 45, 08
        add     eax, ecx                                ; 099E _ 01. C8
        mov     dword [esp+4H], edx                     ; 09A0 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 09A4 _ 89. 04 24
        call    _compare                                ; 09A7 _ E8, FFFFF6B7
        cmp     eax, -1                                 ; 09AC _ 83. F8, FF
        jnz     ?_051                                   ; 09AF _ 75, 06
        mov     eax, dword [ebp-10H]                    ; 09B1 _ 8B. 45, F0
        mov     dword [ebp-0CH], eax                    ; 09B4 _ 89. 45, F4
?_051:  mov     eax, dword [ebp-14H]                    ; 09B7 _ 8B. 45, EC
        cmp     eax, dword [ebp+0CH]                    ; 09BA _ 3B. 45, 0C
        jge     ?_052                                   ; 09BD _ 7D, 2D
        mov     eax, dword [ebp-0CH]                    ; 09BF _ 8B. 45, F4
        imul    edx, eax, 76                            ; 09C2 _ 6B. D0, 4C
        mov     eax, dword [ebp+8H]                     ; 09C5 _ 8B. 45, 08
        add     edx, eax                                ; 09C8 _ 01. C2
        mov     eax, dword [ebp-14H]                    ; 09CA _ 8B. 45, EC
        imul    ecx, eax, 76                            ; 09CD _ 6B. C8, 4C
        mov     eax, dword [ebp+8H]                     ; 09D0 _ 8B. 45, 08
        add     eax, ecx                                ; 09D3 _ 01. C8
        mov     dword [esp+4H], edx                     ; 09D5 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 09D9 _ 89. 04 24
        call    _compare                                ; 09DC _ E8, FFFFF682
        cmp     eax, -1                                 ; 09E1 _ 83. F8, FF
        jnz     ?_052                                   ; 09E4 _ 75, 06
        mov     eax, dword [ebp-14H]                    ; 09E6 _ 8B. 45, EC
        mov     dword [ebp-0CH], eax                    ; 09E9 _ 89. 45, F4
?_052:  mov     eax, dword [ebp-0CH]                    ; 09EC _ 8B. 45, F4
        cmp     eax, dword [ebp+10H]                    ; 09EF _ 3B. 45, 10
        jz      ?_053                                   ; 09F2 _ 74, 3B
        mov     eax, dword [ebp-0CH]                    ; 09F4 _ 8B. 45, F4
        imul    edx, eax, 76                            ; 09F7 _ 6B. D0, 4C
        mov     eax, dword [ebp+8H]                     ; 09FA _ 8B. 45, 08
        add     edx, eax                                ; 09FD _ 01. C2
        mov     eax, dword [ebp+10H]                    ; 09FF _ 8B. 45, 10
        imul    ecx, eax, 76                            ; 0A02 _ 6B. C8, 4C
        mov     eax, dword [ebp+8H]                     ; 0A05 _ 8B. 45, 08
        add     eax, ecx                                ; 0A08 _ 01. C8
        mov     dword [esp+4H], edx                     ; 0A0A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0A0E _ 89. 04 24
        call    _swap                                   ; 0A11 _ E8, FFFFFF04
        mov     eax, dword [ebp-0CH]                    ; 0A16 _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 0A19 _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0A1D _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A20 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A24 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A27 _ 89. 04 24
        call    _heapify                                ; 0A2A _ E8, FFFFFF31
?_053:  nop                                             ; 0A2F _ 90
        leave                                           ; 0A30 _ C9
        ret                                             ; 0A31 _ C3
; _heapify End of function

_heap_sort_desc:; Function begin
        push    ebp                                     ; 0A32 _ 55
        mov     ebp, esp                                ; 0A33 _ 89. E5
        sub     esp, 40                                 ; 0A35 _ 83. EC, 28
        mov     eax, dword [ebp+0CH]                    ; 0A38 _ 8B. 45, 0C
        mov     edx, eax                                ; 0A3B _ 89. C2
        shr     edx, 31                                 ; 0A3D _ C1. EA, 1F
        add     eax, edx                                ; 0A40 _ 01. D0
        sar     eax, 1                                  ; 0A42 _ D1. F8
        sub     eax, 1                                  ; 0A44 _ 83. E8, 01
        mov     dword [ebp-0CH], eax                    ; 0A47 _ 89. 45, F4
        jmp     ?_055                                   ; 0A4A _ EB, 1D

?_054:  mov     eax, dword [ebp-0CH]                    ; 0A4C _ 8B. 45, F4
        mov     dword [esp+8H], eax                     ; 0A4F _ 89. 44 24, 08
        mov     eax, dword [ebp+0CH]                    ; 0A53 _ 8B. 45, 0C
        mov     dword [esp+4H], eax                     ; 0A56 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A5A _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A5D _ 89. 04 24
        call    _heapify                                ; 0A60 _ E8, FFFFFEFB
        sub     dword [ebp-0CH], 1                      ; 0A65 _ 83. 6D, F4, 01
?_055:  cmp     dword [ebp-0CH], 0                      ; 0A69 _ 83. 7D, F4, 00
        jns     ?_054                                   ; 0A6D _ 79, DD
        mov     eax, dword [ebp+0CH]                    ; 0A6F _ 8B. 45, 0C
        sub     eax, 1                                  ; 0A72 _ 83. E8, 01
        mov     dword [ebp-10H], eax                    ; 0A75 _ 89. 45, F0
        jmp     ?_057                                   ; 0A78 _ EB, 38

?_056:  mov     eax, dword [ebp-10H]                    ; 0A7A _ 8B. 45, F0
        imul    edx, eax, 76                            ; 0A7D _ 6B. D0, 4C
        mov     eax, dword [ebp+8H]                     ; 0A80 _ 8B. 45, 08
        add     eax, edx                                ; 0A83 _ 01. D0
        mov     dword [esp+4H], eax                     ; 0A85 _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0A89 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0A8C _ 89. 04 24
        call    _swap                                   ; 0A8F _ E8, FFFFFE86
        mov     dword [esp+8H], 0                       ; 0A94 _ C7. 44 24, 08, 00000000
        mov     eax, dword [ebp-10H]                    ; 0A9C _ 8B. 45, F0
        mov     dword [esp+4H], eax                     ; 0A9F _ 89. 44 24, 04
        mov     eax, dword [ebp+8H]                     ; 0AA3 _ 8B. 45, 08
        mov     dword [esp], eax                        ; 0AA6 _ 89. 04 24
        call    _heapify                                ; 0AA9 _ E8, FFFFFEB2
        sub     dword [ebp-10H], 1                      ; 0AAE _ 83. 6D, F0, 01
?_057:  cmp     dword [ebp-10H], 0                      ; 0AB2 _ 83. 7D, F0, 00
        jns     ?_056                                   ; 0AB6 _ 79, C2
        nop                                             ; 0AB8 _ 90
        leave                                           ; 0AB9 _ C9
        ret                                             ; 0ABA _ C3
; _heap_sort_desc End of function

_main:  ; Function begin
        push    ebp                                     ; 0ABB _ 55
        mov     ebp, esp                                ; 0ABC _ 89. E5
        and     esp, 0FFFFFFF0H                         ; 0ABE _ 83. E4, F0
        mov     eax, 760032                             ; 0AC1 _ B8, 000B98E0
        call    ___chkstk_ms                            ; 0AC6 _ E8, 00000000(rel)
        sub     esp, eax                                ; 0ACB _ 29. C4
        call    ___main                                 ; 0ACD _ E8, 00000000(rel)
        call    _clock                                  ; 0AD2 _ E8, 00000000(rel)
        mov     dword [esp+0B98D8H], eax                ; 0AD7 _ 89. 84 24, 000B98D8
        cmp     dword [ebp+8H], 4                       ; 0ADE _ 83. 7D, 08, 04
        jz      ?_058                                   ; 0AE2 _ 74, 16
        mov     dword [esp], ?_093                      ; 0AE4 _ C7. 04 24, 000003C4(d)
        call    _puts                                   ; 0AEB _ E8, 00000000(rel)
        mov     eax, 4294967295                         ; 0AF0 _ B8, FFFFFFFF
        jmp     ?_064                                   ; 0AF5 _ E9, 000001E1

?_058:  mov     eax, dword [ebp+0CH]                    ; 0AFA _ 8B. 45, 0C
        add     eax, 4                                  ; 0AFD _ 83. C0, 04
        mov     eax, dword [eax]                        ; 0B00 _ 8B. 00
        mov     dword [esp+4H], ?_094                   ; 0B02 _ C7. 44 24, 04, 00000469(d)
        mov     dword [esp], eax                        ; 0B0A _ 89. 04 24
        call    _strcmp                                 ; 0B0D _ E8, 00000000(rel)
        test    eax, eax                                ; 0B12 _ 85. C0
        jnz     ?_059                                   ; 0B14 _ 75, 14
        mov     dword [esp], 0                          ; 0B16 _ C7. 04 24, 00000000
        call    _time                                   ; 0B1D _ E8, 00000000(rel)
        mov     dword [esp], eax                        ; 0B22 _ 89. 04 24
        call    _srand                                  ; 0B25 _ E8, 00000000(rel)
?_059:  mov     eax, dword [ebp+0CH]                    ; 0B2A _ 8B. 45, 0C
        add     eax, 4                                  ; 0B2D _ 83. C0, 04
        mov     eax, dword [eax]                        ; 0B30 _ 8B. 00
        mov     dword [esp+4H], ?_095                   ; 0B32 _ C7. 44 24, 04, 0000046C(d)
        mov     dword [esp], eax                        ; 0B3A _ 89. 04 24
        call    _strcmp                                 ; 0B3D _ E8, 00000000(rel)
        test    eax, eax                                ; 0B42 _ 85. C0
        jnz     ?_060                                   ; 0B44 _ 75, 2C
        mov     eax, dword [ebp+0CH]                    ; 0B46 _ 8B. 45, 0C
        add     eax, 8                                  ; 0B49 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 0B4C _ 8B. 00
        mov     dword [esp+8H], 10000                   ; 0B4E _ C7. 44 24, 08, 00002710
        lea     edx, [esp+10H]                          ; 0B56 _ 8D. 54 24, 10
        mov     dword [esp+4H], edx                     ; 0B5A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0B5E _ 89. 04 24
        call    _read_data_from_file                    ; 0B61 _ E8, FFFFFA20
        mov     dword [esp+0B98DCH], eax                ; 0B66 _ 89. 84 24, 000B98DC
        jmp     ?_063                                   ; 0B6D _ E9, 0000009D

?_060:  mov     eax, dword [ebp+0CH]                    ; 0B72 _ 8B. 45, 0C
        add     eax, 4                                  ; 0B75 _ 83. C0, 04
        mov     eax, dword [eax]                        ; 0B78 _ 8B. 00
        mov     dword [esp+4H], ?_094                   ; 0B7A _ C7. 44 24, 04, 00000469(d)
        mov     dword [esp], eax                        ; 0B82 _ 89. 04 24
        call    _strcmp                                 ; 0B85 _ E8, 00000000(rel)
        test    eax, eax                                ; 0B8A _ 85. C0
        jnz     ?_062                                   ; 0B8C _ 75, 5F
        mov     eax, dword [ebp+0CH]                    ; 0B8E _ 8B. 45, 0C
        add     eax, 8                                  ; 0B91 _ 83. C0, 08
        mov     eax, dword [eax]                        ; 0B94 _ 8B. 00
        mov     dword [esp], eax                        ; 0B96 _ 89. 04 24
        call    _atoi                                   ; 0B99 _ E8, 00000000(rel)
        mov     dword [esp+0B98D4H], eax                ; 0B9E _ 89. 84 24, 000B98D4
        cmp     dword [esp+0B98D4H], 0                  ; 0BA5 _ 83. BC 24, 000B98D4, 00
        jns     ?_061                                   ; 0BAD _ 79, 16
        mov     dword [esp], ?_096                      ; 0BAF _ C7. 04 24, 00000470(d)
        call    _printf                                 ; 0BB6 _ E8, 00000000(rel)
        mov     eax, 4294967280                         ; 0BBB _ B8, FFFFFFF0
        jmp     ?_064                                   ; 0BC0 _ E9, 00000116

?_061:  mov     dword [esp+8H], 10000                   ; 0BC5 _ C7. 44 24, 08, 00002710
        mov     eax, dword [esp+0B98D4H]                ; 0BCD _ 8B. 84 24, 000B98D4
        mov     dword [esp+4H], eax                     ; 0BD4 _ 89. 44 24, 04
        lea     eax, [esp+10H]                          ; 0BD8 _ 8D. 44 24, 10
        mov     dword [esp], eax                        ; 0BDC _ 89. 04 24
        call    _generate_randomly                      ; 0BDF _ E8, FFFFFBF1
        mov     dword [esp+0B98DCH], eax                ; 0BE4 _ 89. 84 24, 000B98DC
        jmp     ?_063                                   ; 0BEB _ EB, 22

?_062:  mov     eax, dword [ebp+0CH]                    ; 0BED _ 8B. 45, 0C
        add     eax, 4                                  ; 0BF0 _ 83. C0, 04
        mov     eax, dword [eax]                        ; 0BF3 _ 8B. 00
        mov     dword [esp+4H], eax                     ; 0BF5 _ 89. 44 24, 04
        mov     dword [esp], ?_097                      ; 0BF9 _ C7. 04 24, 000004C8(d)
        call    _printf                                 ; 0C00 _ E8, 00000000(rel)
        mov     eax, 4294967294                         ; 0C05 _ B8, FFFFFFFE
        jmp     ?_064                                   ; 0C0A _ E9, 000000CC

?_063:  mov     dword [esp], ?_098                      ; 0C0F _ C7. 04 24, 000004ED(d)
        call    _puts                                   ; 0C16 _ E8, 00000000(rel)
        mov     eax, dword [ebp+0CH]                    ; 0C1B _ 8B. 45, 0C
        add     eax, 12                                 ; 0C1E _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 0C21 _ 8B. 00
        mov     dword [esp+0CH], 0                      ; 0C23 _ C7. 44 24, 0C, 00000000
        mov     edx, dword [esp+0B98DCH]                ; 0C2B _ 8B. 94 24, 000B98DC
        mov     dword [esp+8H], edx                     ; 0C32 _ 89. 54 24, 08
        lea     edx, [esp+10H]                          ; 0C36 _ 8D. 54 24, 10
        mov     dword [esp+4H], edx                     ; 0C3A _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C3E _ 89. 04 24
        call    _write_data_to_file                     ; 0C41 _ E8, FFFFFBF5
        mov     dword [esp], ?_099                      ; 0C46 _ C7. 04 24, 00000508(d)
        call    _puts                                   ; 0C4D _ E8, 00000000(rel)
        mov     eax, dword [esp+0B98DCH]                ; 0C52 _ 8B. 84 24, 000B98DC
        mov     dword [esp+4H], eax                     ; 0C59 _ 89. 44 24, 04
        lea     eax, [esp+10H]                          ; 0C5D _ 8D. 44 24, 10
        mov     dword [esp], eax                        ; 0C61 _ 89. 04 24
        call    _heap_sort_desc                         ; 0C64 _ E8, FFFFFDC9
        mov     dword [esp], ?_100                      ; 0C69 _ C7. 04 24, 0000052B(d)
        call    _puts                                   ; 0C70 _ E8, 00000000(rel)
        mov     eax, dword [ebp+0CH]                    ; 0C75 _ 8B. 45, 0C
        add     eax, 12                                 ; 0C78 _ 83. C0, 0C
        mov     eax, dword [eax]                        ; 0C7B _ 8B. 00
        mov     dword [esp+0CH], 1                      ; 0C7D _ C7. 44 24, 0C, 00000001
        mov     edx, dword [esp+0B98DCH]                ; 0C85 _ 8B. 94 24, 000B98DC
        mov     dword [esp+8H], edx                     ; 0C8C _ 89. 54 24, 08
        lea     edx, [esp+10H]                          ; 0C90 _ 8D. 54 24, 10
        mov     dword [esp+4H], edx                     ; 0C94 _ 89. 54 24, 04
        mov     dword [esp], eax                        ; 0C98 _ 89. 04 24
        call    _write_data_to_file                     ; 0C9B _ E8, FFFFFB9B
        mov     dword [esp], ?_101                      ; 0CA0 _ C7. 04 24, 00000538(d)
        call    _puts                                   ; 0CA7 _ E8, 00000000(rel)
        call    _clock                                  ; 0CAC _ E8, 00000000(rel)
        mov     dword [esp+0B98D0H], eax                ; 0CB1 _ 89. 84 24, 000B98D0
        mov     eax, dword [esp+0B98D0H]                ; 0CB8 _ 8B. 84 24, 000B98D0
        sub     eax, dword [esp+0B98D8H]                ; 0CBF _ 2B. 84 24, 000B98D8
        mov     dword [esp+4H], eax                     ; 0CC6 _ 89. 44 24, 04
        mov     dword [esp], ?_102                      ; 0CCA _ C7. 04 24, 00000559(d)
        call    _printf                                 ; 0CD1 _ E8, 00000000(rel)
        mov     eax, 0                                  ; 0CD6 _ B8, 00000000
?_064:  leave                                           ; 0CDB _ C9
        ret                                             ; 0CDC _ C3
; _main End of function

        nop                                             ; 0CDD _ 90
        nop                                             ; 0CDE _ 90
        nop                                             ; 0CDF _ 90


SECTION .data   align=4 noexecute                       ; section number 2, data


SECTION .bss    align=4 noexecute                       ; section number 3, bss


SECTION .rdata  align=4 noexecute                       ; section number 4, const

?_065:                                                  ; byte
        db 25H, 64H, 00H, 00H                           ; 0000 _ %d..

?_066:                                                  ; byte
        db 41H, 4EH, 49H, 4DH, 41H, 4CH, 20H, 7BH       ; 0004 _ ANIMAL {
        db 20H, 6EH, 61H, 6DH, 65H, 20H, 3DH, 20H       ; 000C _  name = 
        db 22H, 25H, 73H, 22H, 2CH, 20H, 77H, 65H       ; 0014 _ "%s", we
        db 69H, 67H, 68H, 74H, 20H, 3DH, 20H, 25H       ; 001C _ ight = %
        db 64H, 2CH, 20H, 00H                           ; 0024 _ d, .

?_067:                                                  ; byte
        db 66H, 6FH, 6FH, 64H, 5FH, 73H, 6FH, 75H       ; 0028 _ food_sou
        db 72H, 63H, 65H, 20H, 3DH, 20H, 43H, 41H       ; 0030 _ rce = CA
        db 52H, 4EH, 49H, 56H, 4FH, 52H, 45H, 20H       ; 0038 _ RNIVORE 
        db 7DH, 0AH, 00H                                ; 0040 _ }..

?_068:                                                  ; byte
        db 66H, 6FH, 6FH, 64H, 5FH, 73H, 6FH, 75H       ; 0043 _ food_sou
        db 72H, 63H, 65H, 20H, 3DH, 20H, 48H, 45H       ; 004B _ rce = HE
        db 52H, 42H, 49H, 56H, 4FH, 52H, 45H, 20H       ; 0053 _ RBIVORE 
        db 7DH, 0AH, 00H                                ; 005B _ }..

?_069:                                                  ; byte
        db 66H, 6FH, 6FH, 64H, 5FH, 73H, 6FH, 75H       ; 005E _ food_sou
        db 72H, 63H, 65H, 20H, 3DH, 20H, 49H, 4EH       ; 0066 _ rce = IN
        db 53H, 45H, 43H, 54H, 49H, 56H, 4FH, 52H       ; 006E _ SECTIVOR
        db 45H, 20H, 7DH, 0AH, 00H                      ; 0076 _ E }..

?_070:                                                  ; byte
        db 66H, 6FH, 6FH, 64H, 5FH, 73H, 6FH, 75H       ; 007B _ food_sou
        db 72H, 63H, 65H, 20H, 3DH, 20H, 4FH, 4DH       ; 0083 _ rce = OM
        db 4EH, 49H, 56H, 4FH, 52H, 45H, 20H, 7DH       ; 008B _ NIVORE }
        db 0AH, 00H, 00H, 00H, 00H                      ; 0093 _ .....

?_071:                                                  ; byte
        db 55H, 6EH, 6BH, 6EH, 6FH, 77H, 6EH, 20H       ; 0098 _ Unknown 
        db 66H, 6FH, 6FH, 64H, 20H, 73H, 6FH, 75H       ; 00A0 _ food sou
        db 72H, 63H, 65H, 20H, 6FH, 66H, 20H, 61H       ; 00A8 _ rce of a
        db 6EH, 69H, 6DH, 61H, 6CH, 20H, 61H, 74H       ; 00B0 _ nimal at
        db 20H, 69H, 6EH, 64H, 65H, 78H, 20H, 25H       ; 00B8 _  index %
        db 64H, 3AH, 20H, 25H, 64H, 2EH, 0AH, 00H       ; 00C0 _ d: %d...

?_072:                                                  ; byte
        db 42H, 49H, 52H, 44H, 20H, 7BH, 20H, 6EH       ; 00C8 _ BIRD { n
        db 61H, 6DH, 65H, 20H, 3DH, 20H, 22H, 25H       ; 00D0 _ ame = "%
        db 73H, 22H, 2CH, 20H, 77H, 65H, 69H, 67H       ; 00D8 _ s", weig
        db 68H, 74H, 20H, 3DH, 20H, 25H, 64H, 2CH       ; 00E0 _ ht = %d,
        db 20H, 00H                                     ; 00E8 _  .

?_073:                                                  ; byte
        db 64H, 6FH, 65H, 73H, 5FH, 6DH, 69H, 67H       ; 00EA _ does_mig
        db 72H, 61H, 74H, 65H, 20H, 3DH, 20H, 46H       ; 00F2 _ rate = F
        db 41H, 4CH, 53H, 45H, 20H, 7DH, 0AH, 00H       ; 00FA _ ALSE }..

?_074:                                                  ; byte
        db 64H, 6FH, 65H, 73H, 5FH, 6DH, 69H, 67H       ; 0102 _ does_mig
        db 72H, 61H, 74H, 65H, 20H, 3DH, 20H, 54H       ; 010A _ rate = T
        db 52H, 55H, 45H, 20H, 7DH, 0AH, 00H, 00H       ; 0112 _ RUE }...
        db 00H, 00H                                     ; 011A _ ..

?_075:                                                  ; byte
        db 46H, 49H, 53H, 48H, 20H, 7BH, 20H, 6EH       ; 011C _ FISH { n
        db 61H, 6DH, 65H, 20H, 3DH, 20H, 22H, 25H       ; 0124 _ ame = "%
        db 73H, 22H, 2CH, 20H, 77H, 65H, 69H, 67H       ; 012C _ s", weig
        db 68H, 74H, 20H, 3DH, 20H, 25H, 64H, 2CH       ; 0134 _ ht = %d,
        db 20H, 00H                                     ; 013C _  .

?_076:                                                  ; byte
        db 68H, 61H, 62H, 69H, 74H, 61H, 74H, 20H       ; 013E _ habitat 
        db 3DH, 20H, 4CH, 41H, 4BH, 45H, 20H, 7DH       ; 0146 _ = LAKE }
        db 0AH, 00H                                     ; 014E _ ..

?_077:                                                  ; byte
        db 68H, 61H, 62H, 69H, 74H, 61H, 74H, 20H       ; 0150 _ habitat 
        db 3DH, 20H, 52H, 49H, 56H, 45H, 52H, 20H       ; 0158 _ = RIVER 
        db 7DH, 0AH, 00H                                ; 0160 _ }..

?_078:                                                  ; byte
        db 68H, 61H, 62H, 69H, 74H, 61H, 74H, 20H       ; 0163 _ habitat 
        db 3DH, 20H, 53H, 45H, 41H, 20H, 7DH, 0AH       ; 016B _ = SEA }.
        db 00H                                          ; 0173 _ .

?_079:                                                  ; byte
        db 55H, 6EH, 6BH, 6EH, 6FH, 77H, 6EH, 20H       ; 0174 _ Unknown 
        db 68H, 61H, 62H, 69H, 74H, 61H, 74H, 20H       ; 017C _ habitat 
        db 6FH, 66H, 20H, 66H, 69H, 73H, 68H, 20H       ; 0184 _ of fish 
        db 61H, 74H, 20H, 69H, 6EH, 64H, 65H, 78H       ; 018C _ at index
        db 20H, 25H, 64H, 3AH, 20H, 25H, 64H, 2EH       ; 0194 _  %d: %d.
        db 0AH, 00H, 00H, 00H                           ; 019C _ ....

?_080:                                                  ; byte
        db 55H, 6EH, 6BH, 6EH, 6FH, 77H, 6EH, 20H       ; 01A0 _ Unknown 
        db 63H, 72H, 65H, 61H, 74H, 75H, 72H, 65H       ; 01A8 _ creature
        db 20H, 61H, 74H, 20H, 69H, 6EH, 64H, 65H       ; 01B0 _  at inde
        db 78H, 20H, 25H, 64H, 3AH, 20H, 25H, 64H       ; 01B8 _ x %d: %d
        db 2EH, 0AH, 00H                                ; 01C0 _ ...

?_081:                                                  ; byte
        db 72H, 00H                                     ; 01C3 _ r.

?_082:                                                  ; byte
        db 43H, 6FH, 75H, 6CH, 64H, 20H, 6EH, 6FH       ; 01C5 _ Could no
        db 74H, 20H, 6FH, 70H, 65H, 6EH, 20H, 66H       ; 01CD _ t open f
        db 69H, 6CH, 65H, 3AH, 20H, 25H, 73H, 2EH       ; 01D5 _ ile: %s.
        db 0AH, 00H                                     ; 01DD _ ..

?_083:                                                  ; byte
        db 25H, 73H, 20H, 25H, 64H, 20H, 25H, 64H       ; 01DF _ %s %d %d
        db 00H                                          ; 01E7 _ .

?_084:                                                  ; byte
        db 49H, 6EH, 76H, 61H, 6CH, 69H, 64H, 20H       ; 01E8 _ Invalid 
        db 77H, 65H, 69H, 67H, 68H, 74H, 20H, 6FH       ; 01F0 _ weight o
        db 66H, 20H, 63H, 72H, 65H, 61H, 74H, 75H       ; 01F8 _ f creatu
        db 72H, 65H, 20H, 61H, 74H, 20H, 69H, 6EH       ; 0200 _ re at in
        db 64H, 65H, 78H, 20H, 25H, 64H, 3AH, 20H       ; 0208 _ dex %d: 
        db 25H, 64H, 2EH, 20H, 4DH, 75H, 73H, 74H       ; 0210 _ %d. Must
        db 20H, 62H, 65H, 20H, 61H, 6EH, 20H, 69H       ; 0218 _  be an i
        db 6EH, 74H, 65H, 67H, 65H, 72H, 2CH, 20H       ; 0220 _ nteger, 
        db 61H, 74H, 20H, 6CH, 65H, 61H, 73H, 74H       ; 0228 _ at least
        db 20H, 31H, 2EH, 0AH, 00H, 00H, 00H, 00H       ; 0230 _  1......

?_085:                                                  ; byte
        db 55H, 6EH, 6BH, 6EH, 6FH, 77H, 6EH, 20H       ; 0238 _ Unknown 
        db 66H, 6FH, 6FH, 64H, 5FH, 73H, 6FH, 75H       ; 0240 _ food_sou
        db 72H, 63H, 65H, 20H, 76H, 61H, 6CH, 75H       ; 0248 _ rce valu
        db 65H, 20H, 66H, 6FH, 72H, 20H, 61H, 6EH       ; 0250 _ e for an
        db 69H, 6DH, 61H, 6CH, 20H, 61H, 74H, 20H       ; 0258 _ imal at 
        db 69H, 6EH, 64H, 65H, 78H, 20H, 25H, 64H       ; 0260 _ index %d
        db 3AH, 20H, 25H, 64H, 2EH, 20H, 45H, 78H       ; 0268 _ : %d. Ex
        db 70H, 65H, 63H, 74H, 65H, 64H, 20H, 76H       ; 0270 _ pected v
        db 61H, 6CH, 75H, 65H, 20H, 69H, 6EH, 20H       ; 0278 _ alue in 
        db 72H, 61H, 6EH, 67H, 65H, 20H, 66H, 72H       ; 0280 _ range fr
        db 6FH, 6DH, 20H, 31H, 20H, 74H, 6FH, 20H       ; 0288 _ om 1 to 
        db 34H, 2EH, 0AH, 00H                           ; 0290 _ 4...

?_086:                                                  ; byte
        db 55H, 6EH, 6BH, 6EH, 6FH, 77H, 6EH, 20H       ; 0294 _ Unknown 
        db 68H, 61H, 62H, 69H, 74H, 61H, 74H, 20H       ; 029C _ habitat 
        db 76H, 61H, 6CH, 75H, 65H, 20H, 66H, 6FH       ; 02A4 _ value fo
        db 72H, 20H, 66H, 69H, 73H, 68H, 20H, 61H       ; 02AC _ r fish a
        db 74H, 20H, 69H, 6EH, 64H, 65H, 78H, 20H       ; 02B4 _ t index 
        db 25H, 64H, 3AH, 20H, 25H, 64H, 2EH, 20H       ; 02BC _ %d: %d. 
        db 45H, 78H, 70H, 65H, 63H, 74H, 65H, 64H       ; 02C4 _ Expected
        db 20H, 76H, 61H, 6CH, 75H, 65H, 20H, 69H       ; 02CC _  value i
        db 6EH, 20H, 72H, 61H, 6EH, 67H, 65H, 20H       ; 02D4 _ n range 
        db 66H, 72H, 6FH, 6DH, 20H, 31H, 20H, 74H       ; 02DC _ from 1 t
        db 6FH, 20H, 33H, 2EH, 0AH, 00H, 00H, 00H       ; 02E4 _ o 3.....

?_087:                                                  ; byte
        db 49H, 6EH, 76H, 61H, 6CH, 69H, 64H, 20H       ; 02EC _ Invalid 
        db 63H, 72H, 65H, 61H, 74H, 75H, 72H, 65H       ; 02F4 _ creature
        db 20H, 74H, 79H, 70H, 65H, 20H, 66H, 6FH       ; 02FC _  type fo
        db 72H, 20H, 63H, 72H, 65H, 61H, 74H, 75H       ; 0304 _ r creatu
        db 72H, 65H, 20H, 61H, 74H, 20H, 69H, 6EH       ; 030C _ re at in
        db 64H, 65H, 78H, 20H, 25H, 64H, 3AH, 20H       ; 0314 _ dex %d: 
        db 25H, 64H, 2EH, 20H, 4FH, 6EH, 6CH, 79H       ; 031C _ %d. Only
        db 20H, 31H, 20H, 28H, 61H, 6EH, 69H, 6DH       ; 0324 _  1 (anim
        db 61H, 6CH, 29H, 2CH, 20H, 32H, 20H, 28H       ; 032C _ al), 2 (
        db 62H, 69H, 72H, 64H, 29H, 2CH, 20H, 33H       ; 0334 _ bird), 3
        db 20H, 28H, 66H, 69H, 73H, 68H, 29H, 20H       ; 033C _  (fish) 
        db 61H, 72H, 65H, 20H, 61H, 6CH, 6CH, 6FH       ; 0344 _ are allo
        db 77H, 65H, 64H, 2EH, 0AH, 00H                 ; 034C _ wed...

?_088:                                                  ; byte
        db 77H, 00H                                     ; 0352 _ w.

?_089:                                                  ; byte
        db 61H, 00H, 00H, 00H                           ; 0354 _ a...

?_090:                                                  ; byte
        db 53H, 6FH, 6DH, 65H, 74H, 68H, 69H, 6EH       ; 0358 _ Somethin
        db 67H, 20H, 77H, 65H, 6EH, 74H, 20H, 77H       ; 0360 _ g went w
        db 72H, 6FH, 6EH, 67H, 20H, 77H, 68H, 65H       ; 0368 _ rong whe
        db 6EH, 20H, 63H, 72H, 65H, 61H, 74H, 69H       ; 0370 _ n creati
        db 6EH, 67H, 20H, 66H, 69H, 6CH, 65H, 3AH       ; 0378 _ ng file:
        db 20H, 25H, 73H, 2EH, 0AH, 00H                 ; 0380 _  %s...

?_091:                                                  ; byte
        db 44H, 61H, 74H, 61H, 20H, 63H, 6FH, 6EH       ; 0386 _ Data con
        db 74H, 61H, 69H, 6EH, 73H, 20H, 25H, 64H       ; 038E _ tains %d
        db 20H, 63H, 72H, 65H, 61H, 74H, 75H, 72H       ; 0396 _  creatur
        db 65H, 73H, 3AH, 0AH, 00H, 00H                 ; 039E _ es:...

?_092:                                                  ; byte
        db 0AH, 53H, 6FH, 72H, 74H, 65H, 64H, 20H       ; 03A4 _ .Sorted 
        db 64H, 61H, 74H, 61H, 20H, 6FH, 66H, 20H       ; 03AC _ data of 
        db 25H, 64H, 20H, 63H, 72H, 65H, 61H, 74H       ; 03B4 _ %d creat
        db 75H, 72H, 65H, 73H, 3AH, 0AH, 00H, 00H       ; 03BC _ ures:...

?_093:                                                  ; byte
        db 49H, 6EH, 63H, 6FH, 72H, 72H, 65H, 63H       ; 03C4 _ Incorrec
        db 74H, 20H, 6EH, 75H, 6DH, 62H, 65H, 72H       ; 03CC _ t number
        db 20H, 6FH, 66H, 20H, 69H, 6EH, 70H, 75H       ; 03D4 _  of inpu
        db 74H, 20H, 70H, 61H, 72H, 61H, 6DH, 65H       ; 03DC _ t parame
        db 74H, 65H, 72H, 73H, 2EH, 20H, 52H, 75H       ; 03E4 _ ters. Ru
        db 6EH, 20H, 74H, 68H, 65H, 20H, 70H, 72H       ; 03EC _ n the pr
        db 6FH, 67H, 72H, 61H, 6DH, 20H, 6CH, 69H       ; 03F4 _ ogram li
        db 6BH, 65H, 20H, 74H, 68H, 69H, 73H, 3AH       ; 03FC _ ke this:
        db 0AH, 50H, 52H, 4FH, 47H, 52H, 41H, 4DH       ; 0404 _ .PROGRAM
        db 5FH, 4EH, 41H, 4DH, 45H, 20H, 2DH, 66H       ; 040C _ _NAME -f
        db 20H, 49H, 4EH, 50H, 55H, 54H, 5FH, 46H       ; 0414 _  INPUT_F
        db 49H, 4CH, 45H, 20H, 4FH, 55H, 54H, 50H       ; 041C _ ILE OUTP
        db 55H, 54H, 5FH, 46H, 49H, 4CH, 45H, 0AH       ; 0424 _ UT_FILE.
        db 6FH, 72H, 20H, 6CH, 69H, 6BH, 65H, 20H       ; 042C _ or like 
        db 74H, 68H, 69H, 73H, 3AH, 0AH, 50H, 52H       ; 0434 _ this:.PR
        db 4FH, 47H, 52H, 41H, 4DH, 5FH, 4EH, 41H       ; 043C _ OGRAM_NA
        db 4DH, 45H, 20H, 2DH, 72H, 20H, 4EH, 55H       ; 0444 _ ME -r NU
        db 4DH, 42H, 45H, 52H, 5FH, 4FH, 46H, 5FH       ; 044C _ MBER_OF_
        db 45H, 4CH, 45H, 4DH, 45H, 4EH, 54H, 53H       ; 0454 _ ELEMENTS
        db 20H, 4FH, 55H, 54H, 50H, 55H, 54H, 5FH       ; 045C _  OUTPUT_
        db 46H, 49H, 4CH, 45H, 00H                      ; 0464 _ FILE.

?_094:                                                  ; byte
        db 2DH, 72H, 00H                                ; 0469 _ -r.

?_095:                                                  ; byte
        db 2DH, 66H, 00H, 00H                           ; 046C _ -f..

?_096:                                                  ; byte
        db 43H, 61H, 6EH, 6EH, 6FH, 74H, 20H, 67H       ; 0470 _ Cannot g
        db 65H, 6EH, 65H, 72H, 61H, 74H, 65H, 20H       ; 0478 _ enerate 
        db 61H, 20H, 6EH, 65H, 67H, 61H, 74H, 69H       ; 0480 _ a negati
        db 76H, 65H, 20H, 6EH, 75H, 6DH, 62H, 65H       ; 0488 _ ve numbe
        db 72H, 20H, 6FH, 66H, 20H, 65H, 6CH, 65H       ; 0490 _ r of ele
        db 6DH, 65H, 6EH, 74H, 73H, 2EH, 0AH, 50H       ; 0498 _ ments..P
        db 61H, 73H, 73H, 20H, 74H, 68H, 65H, 20H       ; 04A0 _ ass the 
        db 63H, 6FH, 72H, 72H, 65H, 63H, 74H, 20H       ; 04A8 _ correct 
        db 76H, 61H, 6CH, 75H, 65H, 20H, 77H, 68H       ; 04B0 _ value wh
        db 65H, 6EH, 20H, 75H, 73H, 69H, 6EH, 67H       ; 04B8 _ en using
        db 20H, 2DH, 72H, 2EH, 00H, 00H, 00H, 00H       ; 04C0 _  -r.....

?_097:                                                  ; byte
        db 55H, 6EH, 6BH, 6EH, 6FH, 77H, 6EH, 20H       ; 04C8 _ Unknown 
        db 74H, 61H, 67H, 3AH, 20H, 25H, 73H, 2EH       ; 04D0 _ tag: %s.
        db 20H, 45H, 78H, 70H, 65H, 63H, 74H, 65H       ; 04D8 _  Expecte
        db 64H, 20H, 2DH, 66H, 20H, 6FH, 72H, 20H       ; 04E0 _ d -f or 
        db 2DH, 72H, 2EH, 0AH, 00H                      ; 04E8 _ -r...

?_098:                                                  ; byte
        db 52H, 65H, 74H, 72H, 69H, 65H, 76H, 65H       ; 04ED _ Retrieve
        db 64H, 20H, 64H, 61H, 74H, 61H, 20H, 66H       ; 04F5 _ d data f
        db 72H, 6FH, 6DH, 20H, 66H, 69H, 6CH, 65H       ; 04FD _ rom file
        db 2EH, 00H, 00H                                ; 0505 _ ...

?_099:                                                  ; byte
        db 57H, 72H, 69H, 74H, 74H, 65H, 6EH, 20H       ; 0508 _ Written 
        db 74H, 68H, 65H, 20H, 6FH, 72H, 69H, 67H       ; 0510 _ the orig
        db 69H, 6EH, 61H, 6CH, 20H, 64H, 61H, 74H       ; 0518 _ inal dat
        db 61H, 20H, 69H, 6EH, 20H, 66H, 69H, 6CH       ; 0520 _ a in fil
        db 65H, 2EH, 00H                                ; 0528 _ e..

?_100:                                                  ; byte
        db 44H, 61H, 74H, 61H, 20H, 73H, 6FH, 72H       ; 052B _ Data sor
        db 74H, 65H, 64H, 2EH, 00H                      ; 0533 _ ted..

?_101:                                                  ; byte
        db 57H, 72H, 69H, 74H, 74H, 65H, 6EH, 20H       ; 0538 _ Written 
        db 74H, 68H, 65H, 20H, 73H, 6FH, 72H, 74H       ; 0540 _ the sort
        db 65H, 64H, 20H, 64H, 61H, 74H, 61H, 20H       ; 0548 _ ed data 
        db 69H, 6EH, 20H, 66H, 69H, 6CH, 65H, 2EH       ; 0550 _ in file.
        db 00H                                          ; 0558 _ .

?_102:                                                  ; byte
        db 45H, 78H, 65H, 63H, 75H, 74H, 65H, 64H       ; 0559 _ Executed
        db 20H, 69H, 6EH, 20H, 25H, 6CH, 64H, 20H       ; 0561 _  in %ld 
        db 6DH, 73H, 2EH, 00H, 00H, 00H, 00H            ; 0569 _ ms.....


SECTION .rdata$zzz align=4 noexecute                    ; section number 5, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 4DH, 69H       ; 0000 _ GCC: (Mi
        db 6EH, 47H, 57H, 2EH, 6FH, 72H, 67H, 20H       ; 0008 _ nGW.org 
        db 47H, 43H, 43H, 2DH, 36H, 2EH, 33H, 2EH       ; 0010 _ GCC-6.3.
        db 30H, 2DH, 31H, 29H, 20H, 36H, 2EH, 33H       ; 0018 _ 0-1) 6.3
        db 2EH, 30H, 00H, 00H                           ; 0020 _ .0..


