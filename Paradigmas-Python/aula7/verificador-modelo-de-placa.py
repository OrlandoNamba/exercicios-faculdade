"""

"""

def main() :
    placa = obtem_placa_usuario()
    modelo_placa = verifica_modelo_placa(placa)
    imprime_modelo(modelo_placa)

def obtem_placa_usuario() :
    """
    Obtem a placa (string) passada pelo usuário
    """
    return input('Digite a placa do carro: ')

def imprime_modelo(modelo_placa) :
    """
    Imprime na tela o modelo da placa
    
    modelo_placa (string ou None)
        o modelo da placa, se for string
        se for None, a placa é inválida
    """
    if modelo_placa is None:
        print('Essa placa é inválida!')
    else:
        print('Essa placa é do modelo', modelo_placa, '.')

def verifica_modelo_placa(placa):
    """
    Verifica o modelo da placa informada

    Retorna:
        Uma string com o modelo da placa, podendo ser:
        "mercosul", "amarelo" ou "antigo"
    """
    if len(placa) not in (6, 7):
        return None
    
    if len(placa) == 6:
        return testa_placa_6c(placa)
    
    return testa_placa_7c(placa)


def testa_placa_6c(placa):
    if not eh_letra_maiuscula(placa[0]): return None
    if not eh_letra_maiuscula(placa[1]): return None
    for i in range(2, 6):
        if not eh_digito(placa[i]): return None
# O for acima é equivalente a:
# if not eh_digito(placa[2]): return None
# if not eh_digito(placa[3]): return None
# if not eh_digito(placa[4]): return None
# if not eh_digito(placa[5]): return None
    return 'antigo'


def testa_placa_7c(placa):
    """
    Faz a verificação da placa no caso de 7 caracteres
    """
    for i in range(3):
        if not eh_letra_maiuscula(placa[i]): return None
    if not eh_digito(placa[3]): return None
    if not eh_digito(placa[5]): return None
    if not eh_digito(placa[6]): return None
    if eh_digito(placa[4]): return 'amarelo'
    if eh_letra_maiuscula(placa[4]): 'mercosul'
    return None

def eh_letra_maiuscula(c):
    """
    Verifica se o caractere passado é uma letra maiúscula
    """
    return (len(c) == 1 and c in 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')


def eh_digito(c):
    """
    Verifica se o caractere passado é um número
    """
    return len(c) == 1 and c in '0123456789'


if __name__ == '__main__':
    main()