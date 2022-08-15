# CEP
Encontre e salve seus endereços mais importantes. 


[![GitHub issues](https://img.shields.io/github/issues/danieldcastro/cep)](https://github.com/danieldcastro/cep/issues)
[![GitHub forks](https://img.shields.io/github/forks/danieldcastro/cep)](https://github.com/danieldcastro/cep/network)
[![GitHub stars](https://img.shields.io/github/stars/danieldcastro/cep)](https://github.com/danieldcastro/cep/stargazers)
[![Open Source Love svg1](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](#)
<a href="https://www.buymeacoffee.com/danieldcastro" target="_blank">
  <img width="135" src="https://img.shields.io/badge/Buy_Me_A_Toddynho-d83a7c?style=for-the-badge&logo=buy-me-a-coffee&logoColor=white">
</a>

![Cep app banner](https://user-images.githubusercontent.com/51754570/184566810-2aa8b8c3-b426-49fc-be96-bb56cf228d3d.png)
> Status do Projeto: Primeira versão concluída em 24/08/2022 v1.0.0+1 :heavy_check_mark:

---

<p align="center">
 <a href="#descrição-do-projeto-pencil">Descrição do projeto</a> •
 <a href="#tecnologias-utilizadas-paperclip">Tecnologias utilizadas</a> • 
 <a href="#ferramentas">Ferramentas</a> • 
 <a href="#plugins">Plugins</a> • 
 <a href="#o-que-o-app-é-capaz-de-fazer-crystal_ball">O que o app é capaz de fazer</a> • 
 <a href="#bora-dar-uma-clonada-computer">Bora dar uma clonada?</a>
</p>

----

## Descrição do projeto :pencil:

A partir da utilização da API pública da plataforma **[Via Cep](https://viacep.com.br/)**, o aplicativo CEP permite ao usuário pesquisar e salvar como favoritos CEPs de todo o Brasil. Além disso, o número de pesquisas feitas também é salvo.

O principal objetivo da criação do app foi desenvolver uma aplicação simples que:
 - [x] Utilizasse um gerenciador de estados, nesse caso o **[Getx](https://pub.dev/packages/get)**;
 - [x] Fosse capaz de fazer solicitações à uma RESTapi. CEP usa o package **[Dio](https://pub.dev/packages/dio)** para isso.
 - [x] Fizesse o uso de alguma arquitetura, como a **Clean Architecture** que uso aqui.
 - [x] Usasse qualquer package para persistência de dados, mas aqui decidi usar 2 tipos de persistência. O package **[Sqflite](https://pub.dev/packages/sqflite)** para criar um banco de dados local e o **[Get Storage](https://pub.dev/packages/get_storage)** para salvar variáveis simples.
 - [x] Tivesse **testes unitários** em cada camada da arquitetura.

## Tecnologias utilizadas :paperclip:

<a href="https://flutter.dev/" target="_blank"><img height="26" src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"></a>
<a href="https://dart.dev/" target="_blank"><img height="26" src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white"></a>
<a href="https://pub.dev/packages/get" target="_blank"><img height="26" src="https://img.shields.io/badge/Getx-6d12b8?style=for-the-badge"></a>
<a href="https://code.visualstudio.com/" target="_blank"><img height="26" src="https://img.shields.io/badge/VS_Code-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white"></a>

### Ferramentas

- [Via Cep API](https://viacep.com.br/)
- [Extensão Flutter Coverage para VsCode](https://marketplace.visualstudio.com/items?itemName=Flutterando.flutter-coverage)
- [Extensão Coverage Gutters para VsCode](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters)

### Plugins

- [auto_size_text](https://pub.dev/packages/auto_size_text)
- [mocktail](https://pub.dev/packages/mocktail)
- [dio](https://pub.dev/packages/dio)
- [either_dart](https://pub.dev/packages/either_dart)
- [sqflite](https://pub.dev/packages/sqflite)
- [path_provider](https://pub.dev/packages/path_provider)
- [logger](https://pub.dev/packages/logger)
- [mask_text_input_formatter](mask_text_input_formatter)
- [flutter_svg](https://pub.dev/packages/flutter_svg)
- [get_storage](https://pub.dev/packages/get_storage)

## O que o app é capaz de fazer :crystal_ball:

:trophy: Procurar e exibir a informações sobre qualquer logradouro do Brasil.

:trophy: Salvar o endereço pesquisado em um banco de dados offline.

:trophy: Mostrar a lista de endereços salvos.

:trophy: Excluir qualquer endereço salvo.

:trophy: Mostrar se o endereço pesquisado já está salvo no banco de acordo com o CEP.

:trophy: Salvar o número de pesquisas bem sucedidas feitas.

## Bora dar uma clonada? :computer:

Obs.: Certifique-se de ter o Flutter 3.0 ou superior instalado, caso não esteja, execute:

```
flutter upgrade
```

Com Flutter atualizado execute:
```
git clone https://github.com/danieldcastro/cep
cd cep
flutter pub get
flutter run
```

Se precisar, **[baixe aqui](https://github.com/danieldcastro/cep/releases/tag/v1.0.0)** a versão release do projeto.

----
#### Se você gostou deste repositório, por favor apoie dando uma :star: 
#### Feito com ❤️ e <img height="26" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/flutter/flutter.png">lutter por [Daniel Marciano](https://instagram.com/odanielmarciano)!

<a href="https://twitter.com/odanielmarciano" target="_blank"><img height="20" src="https://img.shields.io/badge/-@odanielmarciano-1ca0f1?style=flat-square&amp;labelColor=1ca0f1&amp;logo=twitter&amp;logoColor=white&amp;link=https://twitter.com/odanielmarciano"></a>
<a href="https://www.linkedin.com/in/danieldecastromarciano/" target="_blank"><img height="20" src="https://img.shields.io/badge/-Daniel-blue?style=flat-square&amp;logo=Linkedin&amp;logoColor=white&amp;link=https://www.linkedin.com/in/danieldecastromarciano/"></a>
<a href="mailto:odanielmarciano@gmail.com" target="_blank"><img height="20" src="https://img.shields.io/badge/-odanielmarciano@gmail.com-c14438?style=flat-square&amp;logo=Gmail&amp;logoColor=white&amp;link=mailto:odanielmarciano@gmail.com"></a>

