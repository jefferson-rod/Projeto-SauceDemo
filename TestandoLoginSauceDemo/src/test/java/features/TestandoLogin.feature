#language: pt

Funcionalidade: teste login saucedemo


  Cenário: testando login sauce demo


  Esquema do Cenario: deve testar diversas formas de login
    Dado que o usuário está na tela de login
    Quando preenche o username com <username>
    E preencher password com <password>
    E clica no botão de login
    Então deve ter acesso

    Exemplos: login com sucesso
      | username                  | password       |
      | "standard_user"           | "secret_sauce" |
      | "problem_user"            | "secret_sauce" |
      | "performance_glitch_user" | "secret_sauce" |

  Esquema do Cenario: deve testar login com falha
    Dado que o usuário está na tela de login
    Quando preenche o username com <username>
    E preencher password com <password>
    E clica no botão de login
    Então deve aparecer uma mensagem <mensagem>

    Exemplos: login com falha
      | username        | password       | mensagem                                                                    |
      | ""              | "secret_sauce" | "Epic sadface: Username is required"                                        |
      | "standard_user" | ""             | "Epic sadface: Password is required"                                        |
      | "standard_user" | "ffff"         | "Epic sadface: Username and password do not match any user in this service" |
      | "ffff"          | "secret_sauce" | "Epic sadface: Username and password do not match any user in this service" |
      | "STANDARD_USER" | "secret_sauce" | "Epic sadface: Username and password do not match any user in this service" |
      | ";][-];"        | "secret_sauce" | "Epic sadface: Username and password do not match any user in this service" |
      | "standard_user" | "123456"       | "Epic sadface: Username and password do not match any user in this service" |
      | ""              | ""             | "Epic sadface: Username is required"                                        |
      | "standard_user" | "SECRET_SAUCE" | "Epic sadface: Username and password do not match any user in this service" |

    Exemplos: usuario bloqueado
      | username          | password       | mensagem                                              |
      | "locked_out_user" | "secret_sauce" | "Epic sadface: Sorry, this user has been locked out." |

