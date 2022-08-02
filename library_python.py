import requests as req
import json
import random
import string


def Get_Endpoint_Usuarios_Tantas_Vezes(vezes):
    lista = []
    for vez in range(vezes):
        r = req.get("http://localhost:3000/usuarios")
        para_json = r.json()
        lista.append(para_json)
    return lista

def Pegar_Quantidade_De_Usuarios_Cadastrados():
    r = req.get("http://localhost:3000/usuarios")
    request_json = r.json()
    return request_json["quantidade"]

def Pegar_Quantidade_De_Produtos_Cadastrados():
    r = req.get("http://localhost:3000/produtos")
    request_json = r.json()
    return request_json["quantidade"]

def Resetar_Massa_De_Usuarios(users):
    lista_ids = []
    i = 0
    for i in range(users):
        r = req.get(f"http://localhost:3000/usuarios")
        request_json = r.json()
        lista_ids.append(request_json["usuarios"][i]["_id"])
        i += 1
    value = 0
    for value in lista_ids:
        req.delete(f"http://localhost:3000/usuarios/{value}")

def Resetar_Massa_De_Produtos():
    ids_produtos = []
    i = 0
    for i in range(15):
        r = req.get(f"http://localhost:3000/produtos")
        request_json = r.json()
        ids_produtos.append(request_json["produtos"][i]["_id"])
        i += 1
    value = 0
    for value in ids_produtos:
        req.delete(f"http://localhost:3000/produtos/{value}")

def Gerar_Dados_Aleatorios(tamanho):
    senha = string.ascii_lowercase
    return ''.join(random.choice(senha) for i in range(tamanho))