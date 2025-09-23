import mysql.connector

class BancodeDados:
    def __init__(self, host, user,password):
        self.conexao = mysql.connector.connect(
            host=host,
            user=user,
            password=password
        )
        self.cursor= self.conexao.cursor()
    
    def criar_database(self, nome_db):
        try:
            self.cursor.execute(f'CREATE DATABASE IF NOTE EXISTS{nome_db}')
            print(f"Banco de dados'{nome_db}' criado ou já existente")
            
        except mysql.connector.Error as err:
            print('Erro ao criar o banco: ', err)
            
    def usar_database(self, nome_db):
        try:
            self.conexao.database= nome_db
            print(f"Conectado ao banco '{nome_db}'")
            
        except mysql.connector.Error as err:
            print('Erro ao usar o banco de dados: ', err)
            
    def criar_tabela_alunos(self):
        sql="""
            CREATE TABLE IF NOT EXISTS alunos(
                id INT AUTO_INCREMENT PRIMARY KEY,
                nome VARCHAR(100),
                idade INT
            )
            """
        self.cursor.execute(sql)
    
    def criar_aluno(self,nome,idade):
        sql= "INSERT INTO alunos (nome,idade) VALUES (%s, %s)"
        self.cursor.execute(sql,(nome, idade))
        return self.conexao.commit()
    
    def listar_alunos(self):
        self.cursor.execute("SELECT*FROM alunos")
        return self.cursor.fetchall() #recupera a lista
    
    def atualizar_alunos(self, id_aluno, nome, idade):
        sql= "UPDATE alunos SET nome= %s, idade= %s WHERE id= %s"
        self.cursor.execute(sql,(nome, idade, id_aluno))
        self.conexao.commit()
    
    def deletar_aluno(self, id_aluno):
        sql= "DELETE FROM alunos WHERE id= %s"
        self.cursor.execute(sql, (id_aluno))
        self.conexao.commit()
        
    def fechar(self):
        self.cursor.close()
        self.conexao.close()
        
if __name__ == "__main__":
    bd = BancodeDados(host="localhost", user= "root", password="alunolab")
    bd.criar_database("escola")
    bd.usar_database("escola")
    bd.criar_tabela_alunos()
        
    bd.criar_aluno("Alice",21)
    bd.criar_aluno("Maria Clara", 22)
    alunos= bd.listar_alunos()
    print("Lista de alunos após a inserção", alunos)
        
if alunos:
    bd.atualizar_alunos([0][0], "Alice Silva", 22)
    print('Após a atualização: ', bd.listar_alunos())
        
    bd.deletar_aluno(alunos[1][0])
    print('Após exclusão: ', bd.listar_alunos())
        
    bd.fechar()
        