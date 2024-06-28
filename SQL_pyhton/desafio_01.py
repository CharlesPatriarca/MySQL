import requests

import mysql.connector



banco = mysql.connector.connect(
    host='localhost',
    user='root',
    password='123456',
    database='Desafiofinal'
)



while True:

    print('1 - MOSTRAR CLIENTE')
    print('2 - INSERIR CLIENTE')
    print('3 - SAIR')

    #meucursor = banco.cursor()
    escolha = int(input('Digite sua escolha: '))

    if escolha == 1:
        meucursor = banco.cursor()
        pesquisa = 'select * from Clientes;'
        meucursor.execute(pesquisa)
        # fetchall recebe tudo da pesquisa e retorna através de uma tupla
        resultado = meucursor.fetchall()

        for x in resultado:
            print(x)

    elif escolha == 2:
        nome_cliente1 = input('Digite o nome do cliente: ')
        cep_cliente1 = input('Digite seu cep: ')
        requisicao = requests.get(f'https://viacep.com.br/ws/{cep_cliente1}/json/')
        endereco = requisicao.json()
        cep_cliente1 = endereco['cep']
        logradouro_cliente1 = endereco['logradouro']
        complemento_cliente1 = endereco['complemento']
        bairro_cliente1 = endereco['bairro']
        localidade_cliente1 = endereco['localidade']
        UF_cliente1 = endereco['uf']
        cursor = banco.cursor()
        sql = 'insert into Clientes (nome, cep, logradouro, complemento, bairro, localidade, uf) values (%s, %s, %s, %s, %s, %s, %s)'
        data = (nome_cliente1, cep_cliente1, logradouro_cliente1, complemento_cliente1, bairro_cliente1, localidade_cliente1, UF_cliente1)
        cursor.execute(sql, data)
        banco.commit()
    elif escolha == 3:
        break
    else:
        print('Digite Novamente')