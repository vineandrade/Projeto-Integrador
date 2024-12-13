title Projeto Final - assembly
.model small
.stack 0100h

pula_linha MACRO ;macro para pular linhas
    push ax ;salva dados nos registradores
    push dx
    mov ah, 02h ;executa funçao
    mov dl,10
    int 21h
    pop dx ;retorna dados para os registradores
    pop ax
ENDM

espaco MACRO ;macro para dar espaço entre caracteres
    push ax
    push dx
    mov ah, 02h ;executa funçao
    mov dl,' '
    int 21h
    pop dx ;retorna dados para os registradores
    pop ax
ENDM

string macro s ;macro para impressao de strings
    push ax ;salva dados nos registradores
    push dx
    mov ah, 09h
    lea dx, s
    int 21h
    pop dx
    pop ax
ENDM

numero macro n ;macro para imprimir numeros
    push ax ;salva dados nos registradores
    push dx
    mov ah, 02h
    mov dl, n
    or dl, 30h
    int 21h
    pop dx
    pop ax
ENDM

caracter macro c ;macro para imprimir numeros
    push ax ;salva dados nos registradores
    push dx
    mov ah, 02h
    mov dl, c
    int 21h
    pop dx
    pop ax
ENDM



clearscreen macro ;macro para limpar a tela
    push ax ;salva dados nos registradores
    mov ah, 00h ;executa funçao
    mov al, 03h
    int 10h
    pop ax ;retorna dados para os registradores
endm

.data

    l2 db '=======BATALHA NAVAL=========$' ;abertura do jogo

     m_embarcacoes db 20 DUP (0) ;matriz auxiliar
                   db 20 DUP (0) 
                   db 20 DUP (0)
                   db 20 DUP (0)
                   db 20 DUP (0)
                   db 20 DUP (0)
                   db 20 DUP (0)
                   db 20 DUP (0)
                   db 20 DUP (0)  
                   db 20 DUP (0)
                   db 20 DUP (0) 
                   db 20 DUP (0)
                   db 20 DUP (0)  
                   db 20 DUP (0)
                   db 20 DUP (0)
                   db 20 DUP (0)
                   db 20 DUP (0)
                   db 20 DUP (0)
                   db 20 DUP (0)
                   db 20 DUP (0)

    m_embarcacoes1 db  20 DUP (0)                                                   ;a
                   db  20 DUP (0)                                                   ;b
                   db  0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0   ;c
                   db  0, 0, 0, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;d
                   db  0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;e
                   db  20 DUP (0)                                                   ;f
                   db  20 DUP (0)                                                   ;g
                   db  20 DUP (0)                                                   ;h
                   db  0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;i
                   db  0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;j
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0   ;k
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 0, 0, 0   ;l
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0   ;m
                   db  20 DUP (0)                                                   ;n
                   db  20 DUP (0)                                                   ;o
                   db  20 DUP (0)                                                   ;p
                   db  0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;q
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1   ;r
                   db  20 DUP (0)                                                   ;s
                   db  20 DUP (0)                                                   ;t

    m_embarcacoes2 db  20 DUP (0)                                                   ;a
                   db  20 DUP (0)                                                   ;b
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0   ;c
                   db  0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;d
                   db  0, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;e
                   db  0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;f
                   db  0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;g
                   db  0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;h
                   db  20 DUP (0)                                                   ;i
                   db  20 DUP (0)                                                   ;j
                   db  0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;k
                   db  0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;l
                   db  0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;m
                   db  20 DUP (0)                                                   ;n
                   db  20 DUP (0)                                                   ;o
                   db  20 DUP (0)                                                   ;p
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 6, 0, 0, 0, 0   ;q
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0   ;r
                   db  0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;s
                   db  20 DUP (0)                                                   ;t

    m_embarcacoes3 db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0   ;a
                   db  20 DUP (0)                                                   ;b
                   db  20 DUP (0)                                                   ;c
                   db  20 DUP (0)                                                   ;d
                   db  20 DUP (0)                                                   ;e
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0   ;f
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 0   ;g
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0   ;h
                   db  2, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;i
                   db  2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;j
                   db  2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;k
                   db  20 DUP (0)                                                   ;l
                   db  20 DUP (0)                                                   ;m
                   db  20 DUP (0)                                                   ;n
                   db  0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;o
                   db  0, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;p
                   db  0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;q
                   db  20 DUP (0)                                                   ;r
                   db  20 DUP (0)                                                   ;s
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0   ;t

    m_embarcacoes4 db  20 DUP (0)                                                   ;a
                   db  0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;b
                   db  20 DUP (0)                                                   ;c
                   db  20 DUP (0)                                                   ;d
                   db  20 DUP (0)                                                   ;e
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0   ;f
                   db  20 DUP (0)                                                   ;g
                   db  20 DUP (0)                                                   ;h
                   db  0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;i
                   db  20 DUP (0)                                                   ;j
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 0   ;k
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;l
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;m
                   db  0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;n
                   db  20 DUP (0)                                                   ;o
                   db  20 DUP (0)                                                   ;p
                   db  6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;q
                   db  6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;r
                   db  6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0   ;s
                   db  20 DUP (0)                                                   ;t

           m_tiros db  20 DUP ('~') ;matriz de impressão
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')
                   db  20 DUP ('~')

    s_escolha_tabuleiro     db 10, 13, 'COM QUAL TABULEIRO VOCE DESEJA JOGAR? [1 - 4]: $'
    s_indisponivel          db 10, 13, 'ESTE TABULEIRO ESTA INDISPONIVEL, ESCOLHA OUTRO: $'

    s_digite_linha          db 10, 13, 'ESCOLHA UMA LINHA PARA ATIRAR [a - t]: $'
    s_digite_coluna         db 10, 13, 'ESCOLHA UMA COLUNA PARA ATIRAR [1 - 20]: $'
    s_digite_novamente      db 10, 13, 'ESSA POSICAO NAO ESTA NO INTERVALO, DIGITE OUTRA: $'

    s_arcertou_encouracado  db 10, 13, '    VOCE ACERTOU O ENCOURACADO!$'
    s_arcertou_fragata      db 10, 13, '    VOCE ACERTOU A FRAGATA!$'
    s_arcertou_subma        db 10, 13, '    VOCE ACERTOU UM SUBMARINO!$'
    s_arcertou_hidroaviao   db 10, 13, '    VOCE ACERTOU UM HIDROAVIAO!$'
    s_errou                 db 10, 13, '    VOCE NAO ACERTOU NENHUMA EMBARCACAO :($'

    s_afundou_encouracado   db 10, 13, '    VOCE AFUNDOU O ENCOURACADO!!!$'
    s_afundou_fragata       db 10, 13, '    VOCE AFUNDOU A FRAGATA!!!$'
    s_afundou_submarino     db 10, 13, '    VOCE AFUNDOU UM SUBMARINO!!!$'
    s_afundou_hidroaviao    db 10, 13, '    VOCE AFUNDOU UM HIDROAVIAO!!!$'
    s_outra_posicao         db 10, 13, 'VOCE JA ATIROU NESSA POSICAO, TENTE OUTRA. DIGITE QUALQUER TECLA PARA PROSSEGUIR  $'

    s_continua              db 10, 13, 'ATIRAR NOVAMENTE? [s|n]$'
    s_ver_acertos           db 10, 13, 'DESEJA VER SUA QUANTIDADE DE ACERTOS? [s|n]: $'

    s_menu                  db 10, 13, '  ----- MENU -----  $'
    s_menu_encouracado      db 10, 13, '|  ENCOURACADO:    $'
    s_menu_fragata          db 10, 13, '|  FRAGATA:        $'
    s_menu_submarino_1      db 10, 13, '|  SUBMARINO 1:    $'
    s_menu_submarino_2      db 10, 13, '|  SUBMARINO 2:    $'
    s_menu_hidroaviao_1     db 10, 13, '|  HIDROAVIAO 1:   $'
    s_menu_hidroaviao_2     db 10, 13, '|  HIDROAVIAO 2:   $'
    s_menu_total            db 10, 13, '|  TOTAL:          $'

    s_venceu                db 10, 13, 'FIM DE JOGO! VOCE AFUNDOU TODAS AS EMBARCACOES :D$'
    s_perdeu                db 10, 13, 'FIM DE JOGO! INFELIZMENTE NAO FOI DESSA VEZ... $'

    v_acertos               db 6 dup (0)
    v_contagem              db 0


.code
    main proc ;inicio da main

        mov ax, @data ;chamada de variaveis
        mov ds, ax

        clearscreen
        pula_linha
        pula_linha
        pula_linha 
        
        mov cx, 24 ;imprime espaços para centralizar o titulo
        r_imprime_espaco:
        espaco
        loop r_imprime_espaco

        string l2 ;titulo

        pula_linha
        pula_linha
        pula_linha
        pula_linha

        call p_selecao_tabuleiros ;chama procedimento de selecao dos tabuleiros

        r_chamadas_jogo:
            call p_leitura_posicoes ;chama procedimento de leitura e conferencia das posições
            call p_impressao_matriz ;chama procedimento de impressão da matriz atualizada

    r_continua: 
        string s_ver_acertos ;pergunta se o usuario deseja ver seus acertos
        mov ah, 01h ;leitura da resposta
        int 21h
        cmp al, 's' 
        je r_imprime_menu
        cmp al, 'S'
        jne r_continuar_jogo ;se a resposta for diferente de 's', pula a impressão do menu

    r_imprime_menu:
        call p_menu ;se o usuario digitar 's' ou 'S' (sim), sera impresso o menu de acertos

    r_continuar_jogo:
        cmp v_acertos[6], 19 ;compara com a quantidade maxima possivel de acertos
        je r_vitoria ;se for igual, o jogador venceu
        string s_continua ;pergunta se o usuário deseja continuar o jogo
        mov ah, 01h 
        int 21h
        cmp al, 's'
        je r_chamadas_jogo
        cmp al, 'S'
        je r_chamadas_jogo ;se for digitado 's' ou 'S', volta para as chamadas anteriores

    r_fim_de_jogo: ;se for digitada outra tecla, finaliza o jogo
        clearscreen
        string s_perdeu ;se não, perdeu :(
        jmp r_fim

        r_vitoria: ;impressão da vitória
            clearscreen
            string s_venceu
            

        r_fim:
            mov ah, 4ch
            int 21h

    main endp

    p_selecao_tabuleiros proc

            xor bx, bx
            mov di, 20
            jmp r_selecao ;pula direto para a seeção do tabuleiro
            
        r_tabuleiros: ;caso o tabuleiro (que sera selecionado posteriormente) seja invalido
            string s_indisponivel
            pula_linha

            r_selecao: ;seleçao do tabuleiro
                string s_escolha_tabuleiro
                mov ah, 01h
                int 21h
                and al, 0Fh
                cmp al, 1 ;confere se o tabuleiro pe válido
                jb r_tabuleiros
                cmp al, 4
                ja r_tabuleiros

                cmp al, 1 ;verifica qual foi o tabuleiro selecionado
                je r_tabuleiro_1
                cmp al, 2
                je r_tabuleiro_2
                cmp al, 3 
                je r_tabuleiro_3
                cmp al, 4
                je r_tabuleiro_4
            
        r_tabuleiro_1:  ;passa o tabuleiro selecionado para a matriz auxiliar
            mov cx, 20
            xor si, si
            r_tranforma_tab_1: 
                mov al, m_embarcacoes1[bx][si]
                mov m_embarcacoes[bx][si], al
                inc si
            loop r_tranforma_tab_1
            add bx, 20
            dec di
            jnz r_tabuleiro_1
            jmp r_fim_tabuleiros

        r_tabuleiro_2:
            mov cx, 20
            xor si, si
            r_tranforma_tab_2:
                mov al, m_embarcacoes2[bx][si]
                mov m_embarcacoes[bx][si], al
                inc si
            loop r_tranforma_tab_2
                add bx, 20
                dec di
                jnz r_tabuleiro_2
                jmp r_fim_tabuleiros

        r_tabuleiro_3:
            mov cx, 20
            xor si, si
            r_tranforma_tab_3:
                mov al, m_embarcacoes3[bx][si]
                mov m_embarcacoes[bx][si], al
                inc si
            loop r_tranforma_tab_3
                add bx, 20
                dec di
                jnz r_tabuleiro_3
                jmp r_fim_tabuleiros

        r_tabuleiro_4:
            mov cx, 20
            xor si, si
            r_tranforma_tab_4:
                mov al, m_embarcacoes4[bx][si]
                mov m_embarcacoes[bx][si], al
                inc si
            loop r_tranforma_tab_4
                add bx, 20
                dec di
                jnz r_tabuleiro_4

        r_fim_tabuleiros: 
            ret ;volta para a main

    p_selecao_tabuleiros endp

    p_leitura_posicoes proc

        jmp r_jogo ;pula para a leitura de posições
        clearscreen

        r_outra_posicao: ;caso a posição ja esteja marcada (sera lida posteriormente)
            string s_outra_posicao
            mov ah, 01h ;leitura de caracter qualquer para que a mensagem possa ser impressa antes de limpar a tela
            int 21h

        r_jogo: ;inicio do jogo
            clearscreen
            string s_digite_linha

            r_linha_leitura: ;leitura de linha
                xor bx, bx
                mov ah, 01h
                int 21h
                sub al, 60h ;tranforma em numero
                xor ah, ah
                mov bx, ax
        
            r_confere_linha: ;confere se a linha digitada está dentro do intervalo 
                sub bx, 01h ;subtrai um para encaixar no tamanho do vetor
                cmp bx, 19 ;compara com o tamanho max de linhas
                jbe r_linha_leitura_fim ;sendo menor, segue a leitura
                string s_digite_novamente ;caso seja maior, repete a leitura
                jmp r_linha_leitura
        
            r_linha_leitura_fim: ;inicialização de valor para leitura da coluna
                mov ax, 20
                mul bx
                mov bx, ax
                push bx                        
                string s_digite_coluna
                xor bx,bx

            r_coluna_leitura: ;leitura decimal de coluna
                mov ah, 01h
                int 21h
                cmp al, 0Dh ;compara com CR
                je r_confere_coluna ;se for igual, termina a leitura
                and al, 0Fh 
                xor ah,ah
                push ax
                mov ax, 10
                mul bx
                pop bx
                add bx,ax
                jmp r_coluna_leitura
        
            r_confere_coluna: ;confere se a coluna digitada está dentro do intervalo 
                sub bx, 01h ;subtrai um para encaixar no tamanho do vetor
                cmp bx, 19 ;compara com o tamanho max de colunas
                jbe r_confere_se_ja 
                string s_digite_novamente ;se sim, repete a leitura
                xor bx, bx
                jmp r_coluna_leitura

            r_confere_se_ja: ;confere se a posição ja foi marcada
                mov si, bx                 
                pop bx  
                cmp m_tiros[bx][si], '~' ;se for diferente de '~' quer dizer que ja foi marcada
                jne r_posicao_marcada 
                jmp r_coluna_leitura_fim
        
            r_posicao_marcada: ;volta para a leitura de posições
                jmp r_outra_posicao        

            r_coluna_leitura_fim: ;confere se a posição digitada contém uma embarcação
                mov ch, m_embarcacoes[bx][si]               
                cmp ch, 1                      
                je r_afundou_encouracado
                cmp ch, 2
                je r_afundou_fragata
                cmp ch, 3
                je r_afundou_submarino_1
                cmp ch, 4
                je r_afundou_submarino_2
                cmp ch, 5
                je r_afundou_hidroaviao_1
                cmp ch, 6
                je r_afundou_hidroaviao_2
                pula_linha
                call p_erro ;chama procedimento indicando que não acertou
                jmp r_fim_leitura

            r_afundou_encouracado: ;caso tenha acertado um encouracado
                call p_encouracado ;chama procedimento indicando que acertou a embarcação
                cmp cl, 4 ;confere se ja foi atingida a quantidade max de acertos nesta embarcação
                jne r_fim_leitura ;se não, finaliza leitura
                string s_afundou_encouracado ;se sim, informa que a embarcação afundou
                jmp r_fim_leitura ;termina leitura

            r_afundou_fragata: ;caso tenha acertado um fragata
                call p_fragata
                cmp cl, 3
                jne r_fim_leitura
                string s_afundou_fragata
                jmp r_fim_leitura

            r_afundou_submarino_1: ;caso tenha acertado um dos submarinos
                call p_submarino_1
                cmp cl, 2
                jne r_fim_leitura
                string s_afundou_submarino
                jmp r_fim_leitura

            r_afundou_submarino_2: ;caso tenha acertado um dos submarinos
                call p_submarino_2
                cmp cl, 2
                jne r_fim_leitura
                string s_afundou_submarino
                jmp r_fim_leitura

            r_afundou_hidroaviao_1: ;caso tenha acertado um dos hidroaviões
                call p_hidroaviao_1
                cmp cl, 4
                jne r_fim_leitura
                string s_afundou_hidroaviao
                jmp r_fim_leitura

            r_afundou_hidroaviao_2: ;caso tenha acertado um dos hidroaviões
                call p_hidroaviao_2
                cmp cl, 4
                jne r_fim_leitura
                string s_afundou_hidroaviao
            
        r_fim_leitura:
            ret ;volta para o main

    p_leitura_posicoes endp

    p_impressao_matriz proc

        r_impressao_matriz: ;impressão da matriz atualizada, com os tiros dados
                pula_linha
                xor al, al
                mov di, 15 
                espaco
                espaco
                espaco

            r_numero_unico: ;impressao do indice de colunas do 1 a 15
                xor ah, ah
                inc ax
                and al, 0fh 
                cmp ax, 10 ;confere se é menor que 10 (para espaçamento)
                jae r_indice_1
                espaco

                r_indice_1:
                    mov bx, 10
                    xor cx, cx
                    push ax

                r_indice_2:
                    xor dx, dx
                    div bx
                    push dx
                    inc cx
                    cmp ax, 0
                    je r_imprime_indice_1
                    jmp r_indice_2

                    r_imprime_indice_1:
                        mov ah, 2
                        pop dx
                        or dl, 30h
                        int 21h
                        loop r_imprime_indice_1

                    espaco
                    dec di
                    pop ax
                    jnz r_numero_unico

                mov di, 5 ;imprime indice de colunas do 16 a 20
                r_indice_3:
                    xor ah, ah
                    inc ax
                    mov bx, 10
                    xor cx, cx
                    push ax

                r_indice_4:
                    xor dx, dx
                    div bx
                    push dx
                    inc cx
                    cmp ax, 0
                    je r_imprime_indice_2
                    jmp r_indice_4

                    r_imprime_indice_2:
                        mov ah, 2
                        pop dx
                        or dl, 30h
                        int 21h
                        loop r_imprime_indice_2

                    espaco
                    dec di
                    pop ax
                    jnz r_indice_3

                xor bx, bx
                mov di, 20
                pula_linha
                pula_linha

                xor bx, bx
                mov di, 20
                mov al, 97

            r_linha_impressao: ;impressão das linhas da matriz
                xor si, si
                mov cx, 20
                mov ah, 02h
                mov dl, al
                int 21h
                push ax

                espaco
                espaco
                espaco

            r_coluna_impressao: ;impressao das colunas da matriz
                mov ah, 02h
                mov dl, m_tiros[bx][si]
                ;or dl, 30h
                int 21h
                espaco
                espaco
                inc si
                loop r_coluna_impressao

            pula_linha
            add bx, 20
            pop ax
            inc al
            dec di
            jnz r_linha_impressao 

            cmp v_acertos[6], 19 
            je r_fim_impressao
            jmp r_continua

            r_fim_impressao: ;volta para o main
            ret
    p_impressao_matriz endp

    p_menu proc ;procedimento para impressão do menu de acertos
        clearscreen
        string s_menu 

        string s_menu_encouracado 
        mov ah, 02h
        numero v_acertos[0] ;imprime a quandidade de acertos do encouracado
        or dl, 30h
        caracter '/'
        caracter '4'

        string s_menu_fragata ;imprime a quandidade de acertos da fragata
        mov ah, 02h
        mov dl, v_acertos[1]
        or dl, 30h
        int 21h
        caracter '/'
        caracter '3'

        string s_menu_submarino_1 ;imprime a quandidade de acertos do submarino 1
        mov ah, 02h
        mov dl, v_acertos[2]
        or dl, 30h
        int 21h
        caracter '/'
        caracter '2'

        string s_menu_submarino_2 ;imprime a quandidade de acertos do submarino 2
        mov ah, 02h
        mov dl, v_acertos[3]
        or dl, 30h
        int 21h
        caracter '/'
        caracter '2'

        string s_menu_hidroaviao_1 ;imprime a quandidade de acertos do hidroaviao 1
        mov ah, 02h
        mov dl, v_acertos[4]
        or dl, 30h
        int 21h
        caracter '/'
        caracter '4'

        string s_menu_hidroaviao_2 ;imprime a quandidade de acertos do hidroaviao 2
        mov ah, 02h
        mov dl, v_acertos[5]
        or dl, 30h
        int 21h
        caracter '/'
        caracter '4'

        string s_menu_total ;imprime a quantidade de acertos geral
        xor cx, cx
        mov bx, 10
        cmp v_acertos[6], 10
        jae r__acertos_geral
        mov ah, 02h
        mov dl, v_acertos[6]
        or dl, 30h
        int 21h
        jmp r_fim_menu

        mov al, v_acertos[6]
        r__acertos_geral:
            xor dx, dx
            div bx
            push dx 
            inc cx
            cmp ax, 00h
            jne r_imprime_acertos_geral
            jmp r__acertos_geral

        r_imprime_acertos_geral:
            mov ah, 02h
            pop dx 
            or dx, 30h
            int 21h
            loop r_imprime_acertos_geral
        r_fim_menu:
        caracter '/'
        caracter '1'
        caracter '9'

        pula_linha
        pula_linha
        
        ret ;volta para o main
    p_menu endp

    p_encouracado proc ;incrementa a quantidade de acertos do encouracado e geral
        mov m_tiros[bx][si], 1
        string s_arcertou_encouracado
        xor di, di
        inc v_acertos[di]
        mov cl, v_acertos[di]
        inc v_acertos[6]           
        ret
    p_encouracado endp

    p_fragata proc ;incrementa a quantidade de acertos da fragata e geral
        mov m_tiros[bx][si], 2
        string s_arcertou_fragata
        mov di, 1
        inc v_acertos[di]
        mov cl, v_acertos[di]
        inc v_acertos[6]
        ret
    p_fragata  endp

    p_submarino_1 proc ;incrementa a quantidade de acertos do submarino 1 e geral
        mov m_tiros[bx][si], 3
        string s_arcertou_subma
        mov di, 2
        inc v_acertos[di]
        mov cl, v_acertos[di]
        inc v_acertos[6]
        ret
    p_submarino_1 endp

    p_submarino_2 proc ;incrementa a quantidade de acertos do submarino 2 e geral
        mov m_tiros[bx][si], 4
        string s_arcertou_subma
        mov di, 3
        inc v_acertos[di]
        mov cl, v_acertos[di]
        inc v_acertos[6]
        ret
    p_submarino_2 endp

    p_hidroaviao_1 proc ;incrementa a quantidade de acertos do hidroaviao 1 e geral
        mov m_tiros[bx][si], 5
        string s_arcertou_hidroaviao
        mov di, 4
        inc v_acertos[di]
        mov cl, v_acertos[di]
        inc v_acertos[6]
        ret
    p_hidroaviao_1 endp

    p_hidroaviao_2 proc ;incrementa a quantidade de acertos do hidroaviao 2 e geral
        mov m_tiros[bx][si], 6
        string s_arcertou_hidroaviao
        mov di, 5
        inc v_acertos[di]
        mov cl, v_acertos[di]
        inc v_acertos[6]
        ret 
    p_hidroaviao_2 endp

    p_erro proc ;imprime um 'X' caso o tiro não tenha acertado nenhuma embarcação
        string s_errou
        mov m_tiros[bx][si], 'x'
        ret
    p_erro endp

end main