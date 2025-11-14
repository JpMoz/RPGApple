//
//  main.swift
//  RPGApple
//
//  Created by JOAO PEDRO BARBOSA MOZ on 14/11/25.
//

import Foundation

var nomeAtual = ""
var classeAtual = ""
var armaduraAtual = ""
var armaAtual = ""
var vida = 100
var xp = 0
var xpFase = 0
var nivel = 1
var inimigoAtual = ""
var ataqueInimigoAtual = "0"
var vidaInimigoAtual = ""
var escudoAtual = ""
var danoAtual = ""

let classeGuarda = [
    "armadura": "Colete Resistente",
    "arma": "Bastão",
    "escudo": "100",
    "dano": "50"
]

let classeManifestante = [
    "armadura": "Jaqueta de Couro",
    "arma": "Coquetel Molotov",
    "escudo": "70",
    "dano": "80"
]

let classeMandrake = [
    "armadura": "Corta Vento",
    "arma": "Barra de Ferro",
    "escudo": "40",
    "dano": "100"
]

let classeCoach = [
    "armadura": "Terno",
    "arma": "Garrafa de Campari",
    "escudo": "60",
    "dano": "60"
]

let inimigoZn = [
    "nome": "Dragao de Santana",
    "forca": "30",
    "vida": "100"
]

let inimigoZl = [
    "nome": "Mago de Itaquera",
    "forca": "50",
    "vida": "150"
]

let inimigoZs = [
    "nome": "Lagarato do Autodromo",
    "forca": "70",
    "vida": "200"
]

let inimigoZo = [
    "nome": "Maestro da Vila Sonia",
    "forca": "90",
    "vida": "250"
]

let inimigoCentro = [
    "nome": "Gigante da Se",
    "forca": "120",
    "vida": "250"
]


func subirNivel(){
    if xp >= nivel * 100{
        nivel += 1
    }
    else{
        print("XP insuficiente para passar de nível")
    }
}

func lerClasse(){
  print("Escolha entre as classes abaixo:")
  print("Guarda")
  print("Manifestante")
  print("Mandrake")
  print("Coach")
  if let escolhaClasse = readLine(){
    if escolhaClasse == "Guarda" || escolhaClasse == "guarda"{
      armaduraAtual = classeGuarda["armadura", default: "Unknown"]
      armaAtual = classeGuarda["arma", default: "Unknown"]
      escudoAtual = classeGuarda["escudo", default: "Unknown"]
      danoAtual = classeGuarda["dano", default: "Unknown"]
    }
    else if escolhaClasse == "Manifestante" || escolhaClasse == "manifestante"{
      armaduraAtual = classeManifestante["armadura", default: "Unknown"]
      armaAtual = classeManifestante["arma", default: "Unknown"]
      escudoAtual = classeManifestante["escudo", default: "Unknown"]
      danoAtual = classeManifestante["dano", default: "Unknown"]
    }
    else if escolhaClasse == "Mandrake" || escolhaClasse == "mandrake"{
      armaduraAtual = classeMandrake["armadura", default: "Unknown"]
      armaAtual = classeMandrake["arma", default: "Unknown"]
      escudoAtual = classeMandrake["escudo", default: "Unknown"]
      danoAtual = classeMandrake["dano", default: "Unknown"]
    }
    else if escolhaClasse == "Coach" || escolhaClasse == "coach"{
      armaduraAtual = classeCoach["armadura", default: "Unknown"]
      armaAtual = classeCoach["arma", default: "Unknown"]
      escudoAtual = classeCoach["escudo", default: "Unknown"]
      danoAtual = classeCoach["dano", default: "Unknown"]
    }
    else{
      print("Erro: Classe não identificada!")
    }
  }
}

func pulaLinha(){
    print(" ")
}

func lerNome(){
    print("Ola bravo guerreiro, como pode perceber, nossa cidade foi tomada por terriveis criaturas que vem assombrando os moradores, precisamos que nos ajude a vencer essa batalha e retomar a cidade, nossa aventura iniciara em breve, porem antes gostaria de saber o seu nome: ")
    if let novoNome = readLine(){
        nomeAtual = novoNome
    }
    else{
        print("Erro: Digite um nome válido!")
    }
}

func level1(){
    inimigoAtual = inimigoZn["nome", default: "Unknown"]
    ataqueInimigoAtual = inimigoZn["forca", default: "0"]
    vidaInimigoAtual = inimigoZn["vida", default: "0"]
    let ataqueInimigoAtualNum = Int(ataqueInimigoAtual)
    let escudoAtualNum = Int(escudoAtual)
    let danoAtualNum = Int(danoAtual)
    var vidaInimigoAtualNum = Int(vidaInimigoAtual)
    xpFase = 100
    vida = vida + escudoAtualNum!
    pulaLinha()
    print("Ola \(nomeAtual), fico feliz de ter voce junto com a gente nessa batalha. nossa primeira missao ocorrera na Zona Norte, onde exploraremos a area tomada pelo \(inimigoAtual), um dragao feroz que vem assombrando a regiao em que habita.")
    pulaLinha()
    print("Voce deve comecar atacando o \(inimigoAtual), mas tome cuidado, ele pode te causar ate \(ataqueInimigoAtualNum ?? 0) de dano, utilize \(armaAtual) para derrota-lo!, lembre a armadura: \(armaduraAtual) aumentou sua vida! agora ela passa a valer \(vida), a vida do \(inimigoAtual) é de \(vidaInimigoAtualNum ?? 0)")
    pulaLinha()
    print("Deseja atacar? digite sim caso queira")
    if var continuarAtaque = readLine(){
        while(continuarAtaque == "Sim" || continuarAtaque == "sim"){
            vidaInimigoAtualNum! = vidaInimigoAtualNum! - danoAtualNum!
            print("Voce comeca dando \(danoAtualNum ?? 0) de dano, a vida dele agora é de: \(vidaInimigoAtualNum ?? 0)")
            pulaLinha()
            vida = vida - Int.random(in: 1...ataqueInimigoAtualNum!)
            print("Ele te devolveu um ataque, sua vida agora é de: \(vida)")
            pulaLinha()
            if vidaInimigoAtualNum! <= 0 && vida > 0{
                xp = xp + xpFase
                print("Parabens voce ganhou, leve \(xpFase) de experiencia e voce tera agora \(xp) no total!")
                break
            }
            if vida <= 0{
                print("Voce foi derrotado!")
                break
            }
            print("Deseja atacar? digite sim caso queira")
            continuarAtaque = readLine()!
        }
    }
}

func level2(){
    inimigoAtual = inimigoZl["nome", default: "Unknown"]
    ataqueInimigoAtual = inimigoZl["forca", default: "0"]
    vidaInimigoAtual = inimigoZl["vida", default: "0"]
    let ataqueInimigoAtualNum = Int(ataqueInimigoAtual)
    let escudoAtualNum = Int(escudoAtual)
    let danoAtualNum = Int(danoAtual)
    var vidaInimigoAtualNum = Int(vidaInimigoAtual)
    xpFase = 100
    vida = vida + escudoAtualNum!
    pulaLinha()
    print("Parabens \(nomeAtual), vencemos nossa primeira batalha. Agora iremos nos aventurar pela Zona Leste, area tomada pelo \(inimigoAtual), um mago que costuma ser certeiro e maldoso com seus feiticos.")
    pulaLinha()
    print("Comece partindo pra cima do \(inimigoAtual), mas evite se aproximar demais, o feitico dele pode te causar ate \(ataqueInimigoAtualNum ?? 0) de dano, utilize da sua arma: \(armaAtual) para derrota-lo!, saiba que a armadura: \(armaduraAtual) aumentou sua vida! agora ela tem o valor de \(vida), a vida do \(inimigoAtual) é de \(vidaInimigoAtualNum ?? 0)")
    pulaLinha()
    print("Deseja atacar? digite sim caso queira")
    if var continuarAtaque = readLine(){
        while(continuarAtaque == "Sim" || continuarAtaque == "sim"){
            vidaInimigoAtualNum! = vidaInimigoAtualNum! - danoAtualNum!
            print("Voce comeca atacando e desviando dele ao mesmo tempo causando \(danoAtualNum ?? 0) dano, a vida dele agora é de: \(vidaInimigoAtualNum ?? 0)")
            pulaLinha()
            vida = vida - Int.random(in: 1...ataqueInimigoAtualNum!)
            print("Ele te devolveu com um feitico cruel, sua vida agora é de: \(vida)")
            pulaLinha()
            if vidaInimigoAtualNum! <= 0 && vida > 0{
                xp = xp + xpFase
                print("Parabens voce ganhou, leve \(xpFase) de experiencia e voce tera agora \(xp) no total!")
                break
            }
            if vida <= 0{
                print("Voce foi derrotado!")
                break
            }
            print("Deseja atacar? digite sim caso queira")
            continuarAtaque = readLine()!
        }
    }
}

func level3(){
    inimigoAtual = inimigoZs["nome", default: "Unknown"]
    ataqueInimigoAtual = inimigoZs["forca", default: "0"]
    vidaInimigoAtual = inimigoZs["vida", default: "0"]
    let ataqueInimigoAtualNum = Int(ataqueInimigoAtual)
    let escudoAtualNum = Int(escudoAtual)
    let danoAtualNum = Int(danoAtual)
    var vidaInimigoAtualNum = Int(vidaInimigoAtual)
    xpFase = 100
    vida = vida + escudoAtualNum!
    pulaLinha()
    print("Estamos muito bem meu bravo guerreiro \(nomeAtual), vencemos mais uma. Agora entraremos na Zona Sul, lugar onde o \(inimigoAtual) costuma nao permitir a presenca de ninguem nos seus dominios.")
    pulaLinha()
    print("Ataque o \(inimigoAtual) sem dar chances para que ele te ataque de volta, as garras fortes de causam até \(ataqueInimigoAtualNum ?? 0) de dano, saiba que ainda possui a sua arma: \(armaAtual) para lutar contra ele! continue sua luta com sua armadura: \(armaduraAtual) que aumenta sua vida! agora ela tem o valor de \(vida), a vida do \(inimigoAtual) é de \(vidaInimigoAtualNum ?? 0)")
    pulaLinha()
    print("Deseja atacar? digite sim caso queira")
    if var continuarAtaque = readLine(){
        while(continuarAtaque == "Sim" || continuarAtaque == "sim"){
            vidaInimigoAtualNum! = vidaInimigoAtualNum! - danoAtualNum!
            print("Voce o atacou de forma certeira causando \(danoAtualNum ?? 0) de dano, a vida dele diminuiu e agora é de: \(vidaInimigoAtualNum ?? 0)")
            pulaLinha()
            vida = vida - Int.random(in: 1...ataqueInimigoAtualNum!)
            print("Ele te devolveu com sua garra feroz, sua vida agora é de: \(vida)")
            pulaLinha()
            if vidaInimigoAtualNum! <= 0 && vida > 0{
                xp = xp + xpFase
                print("Parabens voce ganhou, leve \(xpFase) de experiencia e voce tera agora \(xp) no total!")
                break
            }
            if vida <= 0{
                print("Voce foi derrotado!")
                break
            }
            print("Deseja atacar? digite sim caso queira")
            continuarAtaque = readLine()!
        }
    }
}

func level4(){
    inimigoAtual = inimigoZo["nome", default: "Unknown"]
    ataqueInimigoAtual = inimigoZo["forca", default: "0"]
    vidaInimigoAtual = inimigoZo["vida", default: "0"]
    let ataqueInimigoAtualNum = Int(ataqueInimigoAtual)
    let escudoAtualNum = Int(escudoAtual)
    let danoAtualNum = Int(danoAtual)
    var vidaInimigoAtualNum = Int(vidaInimigoAtual)
    xpFase = 100
    vida = vida + escudoAtualNum!
    pulaLinha()
    print("Estamos nos aproximando da nossa batalha final \(nomeAtual), estamos muito bem. O proximo territorio é um dos mais devastados da cidade, parte que ninguem consegue fazer frente com o \(inimigoAtual), tome muito cuidado, estamos muito proximos de vencer essa guerra!")
    pulaLinha()
    print("Parta pra cima do \(inimigoAtual) enquanto ele estiver desprevinido, busque a melhor estrategia, pois ele pode te dar até \(ataqueInimigoAtualNum ?? 0) de dano, lembre que sua fiel e escudeira arma: \(armaAtual) te ajudara a o enfrentar! continue com sua: \(armaduraAtual) ela permanece aumentando sua vida! agora ela tem o valor de \(vida), a vida do \(inimigoAtual) é de \(vidaInimigoAtualNum ?? 0)")
    pulaLinha()
    print("Deseja atacar? digite sim caso queira")
    if var continuarAtaque = readLine(){
        while(continuarAtaque == "Sim" || continuarAtaque == "sim"){
            vidaInimigoAtualNum! = vidaInimigoAtualNum! - danoAtualNum!
            print("Voce o pegou desprevinido e causou \(danoAtualNum ?? 0) de dano, a vida dele diminuiu e agora é de: \(vidaInimigoAtualNum ?? 0)")
            pulaLinha()
            vida = vida - Int.random(in: 1...ataqueInimigoAtualNum!)
            print("Ele te devolveu com um truque de mestre, sua vida agora é de: \(vida)")
            pulaLinha()
            if vidaInimigoAtualNum! <= 0 && vida > 0{
                xp = xp + xpFase
                print("Parabens voce ganhou, leve \(xpFase) de experiencia e voce tera agora \(xp) no total!")
                break
            }
            if vida <= 0{
                print("Voce foi derrotado!")
                break
            }
            print("Deseja atacar? digite sim caso queira")
            continuarAtaque = readLine()!
        }
    }
}

func level5(){
    inimigoAtual = inimigoCentro["nome", default: "Unknown"]
    ataqueInimigoAtual = inimigoCentro["forca", default: "0"]
    vidaInimigoAtual = inimigoCentro["vida", default: "0"]
    let ataqueInimigoAtualNum = Int(ataqueInimigoAtual)
    let escudoAtualNum = Int(escudoAtual)
    let danoAtualNum = Int(danoAtual)
    var vidaInimigoAtualNum = Int(vidaInimigoAtual)
    xpFase = 100
    vida = vida + escudoAtualNum! + 200
    pulaLinha()
    print("Chegou a hora de ganharmos nossa batalha final \(nomeAtual), temos muita chance de finalmente ganharmos essa guerra de anos! Vamos agora para onde tudo comecou, onde nossa cidade comecou a ser tomada e o \(inimigoAtual) passou a comandar tudo, voce consegue derrotar ele, esta mais pronto do que nunca")
    pulaLinha()
    print("Esmague o \(inimigoAtual), pense em todo mal que ele causou, todas as vidas que tirou, apenas tome cuidado com o alto dano que ele causa: \(ataqueInimigoAtualNum ?? 0), use sua arma: \(armaAtual) mais do que nunca, ela nos salvara! sua armadura atual: \(armaduraAtual) recebeu um boost para a batalha final e agora aumentou ainda mais sua vida! agora ela tem o valor de \(vida), a vida do \(inimigoAtual) é de \(vidaInimigoAtualNum ?? 0), nao se preocupe voce ira conseguir!")
    pulaLinha()
    print("Deseja atacar? digite sim caso queira")
    if var continuarAtaque = readLine(){
        while(continuarAtaque == "Sim" || continuarAtaque == "sim"){
            vidaInimigoAtualNum! = vidaInimigoAtualNum! - danoAtualNum!
            print("Uma nova era esta chegando, voce causou \(danoAtualNum ?? 0) de dano, a vida dele diminuiu e agora é de: \(vidaInimigoAtualNum ?? 0), continue nao desista!")
            pulaLinha()
            vida = vida - Int.random(in: 1...ataqueInimigoAtualNum!)
            print("Ele te devolveu com um mega tapa do mal, sua vida agora é de: \(vida)")
            pulaLinha()
            if vidaInimigoAtualNum! <= 0 && vida > 0{
                xp = xp + xpFase
                print("Parabens voce ganhou, leve \(xpFase) de experiencia e voce tera agora \(xp) no total!")
                break
            }
            if vida <= 0{
                print("Voce foi derrotado!")
                break
            }
            print("Deseja atacar? digite sim caso queira")
            continuarAtaque = readLine()!
        }
    }
}

if nivel == 1 {
    lerNome()
    pulaLinha()
    lerClasse()
    pulaLinha()
}

while vida > 0{
    switch nivel {
    case 1:
        level1()
        subirNivel()
    case 2:
        level2()
        subirNivel()
    case 3:
        level3()
        subirNivel()
    case 4:
        level4()
        subirNivel()
    case 5:
        level5()
        subirNivel()
    default:
        print("Parabens, voce acaba de salvar nossa cidade de todas essas terriveis criaturas, muito obrigado \(nomeAtual) por nos salvar!")
        vida = 0
    }
}
