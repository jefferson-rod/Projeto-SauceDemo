#language: pt

Funcionalidade: teste login saucedemo

  Esquema do Cenario: deve testar diversas formas de login com sucesso
    Dado que o usuário está na tela de login
    Quando preenche o campo username com <usuario> e o campo password com <senha>
    E clica no botão de login
    Então deve ter acesso

    Exemplos:
      | usuario                   | senha          |
      | "standard_user"           | "secret_sauce" |
      | "problem_user"            | "secret_sauce" |
      | "performance_glitch_user" | "secret_sauce" |

  Esquema do Cenario: testando login com falha
    Dado que o usuário está na tela de login
    Quando preenche o campo username com <usuario> e o campo password com <senha>
    E clica no botão de login
    Então deve visualizar uma mensagem na tela <mensagem>

    Exemplos:
      | usuario           | senha          | mensagem                                                                    |
      | ""                | "secret_sauce" | "Epic sadface: Username is required"                                        |
      | "standard_user"   | ""             | "Epic sadface: Password is required"                                        |
      | "standard_user"   | "ffff"         | "Epic sadface: Username and password do not match any user in this service" |
      | "ffff"            | "secret_sauce" | "Epic sadface: Username and password do not match any user in this service" |
      | "STANDARD_USER"   | "secret_sauce" | "Epic sadface: Username and password do not match any user in this service" |
      | ";][-];"          | "secret_sauce" | "Epic sadface: Username and password do not match any user in this service" |
      | "standard_user"   | "123456"       | "Epic sadface: Username and password do not match any user in this service" |
      | ""                | ""             | "Epic sadface: Username is required"                                        |
      | "standard_user"   | "SECRET_SAUCE" | "Epic sadface: Username and password do not match any user in this service" |
      | "locked_out_user" | "secret_sauce" | "Epic sadface: Sorry, this user has been locked out."                       |
      | "       "         | "secret_sauce" | "Epic sadface: Username and password do not match any user in this service" |

