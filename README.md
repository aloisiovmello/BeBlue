# BeBlue

Este projeto foi desenvolvido utilizando:

XCode: 10.1
Cocoapods: 1.6.0 beta 2

Para iniciar o projeto, clone o repositorio conforme citado a baixo:

git clone https://github.com/aloisiovmello/BeBlue.git

Após finalizado o download, vá até a pasta "BeBlue", no terminal, e digite: pod install;
Após finalizado, abra o workspace do projeto chamado: BeBlueChallenge.xcworkspace;

Para desenvolver este projeto precisei gerar algumas chaves diferentes pois devido a quantidade de
requests o servidor estava retornando que o limite de uso chegou ao fim.

Para trocar a chave, abra o arquivo PhotoListRequestHelper.swift e altere o valor da variável apiKey
para a nova chave.