import mysql.connector

banco = mysql.connector.connect(
    host='localhost',
    user='root',
    password='123456',
    database='Desafiofinal'
)

meucursor = banco.cursor()
pesquisa = 'select * from alunos;'
meucursor.execute(pesquisa)
# fetchall recebe tudo da pesquisa e retorna através de uma tupla
resultado = meucursor.fetchall()
for x in resultado:
    print(x)

nome1 = 'Neymar'
telefone1 = '11111111'
cursor = banco.cursor()
sql = 'insert into Alunos (nome, telefone) values (%s, %s)'
data = (nome1, telefone1)
cursor.execute(sql, data)
banco.commit()
#userid = cursor.lastrowid
#print(userid)
#cursor.close()
#banco.close()


print()



while True:

    print('1 - MOSTRAR ALUNO')
    print('2 - INSERIR ALUNO')
    print('3 - SAIR')

    #meucursor = banco.cursor()
    escolha = int(input('Digite sua escolha: '))

    if escolha == 1:
        meucursor = banco.cursor()
        pesquisa = 'select * from alunos;'
        meucursor.execute(pesquisa)
        # fetchall recebe tudo da pesquisa e retorna através de uma tupla
        resultado = meucursor.fetchall()

        for x in resultado:
            print(x)

    elif escolha == 2:
        nome1 = input('Digite o nome do aluno')
        telefone1 = input('Digite o número do aluno: ')
        cursor = banco.cursor()
        sql = 'insert into Alunos (nome, telefone) values (%s, %s)'
        data = (nome1, telefone1)
        cursor.execute(sql, data)
        banco.commit()
    elif escolha == 3:
        break
    else:
        print('Obrigado!')