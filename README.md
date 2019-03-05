### Curso de terraform

#### Algumas considerações sobre multi providers:
* multi providers: Podemos especificar mais de um provider no terraform, e quando for referenciar um resource group, colocar o provider desejado. Um provider também pode ser uma outra região no mesmo cloud provider, por exemplo: AWS com provider para a região de Virginia, e outra para Ohio. [Providers](Providers/providers.tf)

#### Variáveis:
Variáveis servem como parametro para os módulos do terraform. Ajuda a organizar em um único ponto todas as variáveis e também por questões de segurança, dados sensíveis não serem versionados com o código. [Variables](Variables/variables.tf)

Parametros para configuração de variáveis:
* Valores válidos para type: string, list e map;
* Valores válidos para default: configura um valor para a variável;
* Valores válidos para description: Cria uma descrição para quando o módulo é publicado, ou seja, no momento de solicitar a o valor da variável, aparecerá uma descrição.

```
    variable "key" { #key é o nome da variável
        type    = "string"
        default = "value"
    }   
```
```
    variable "users" {
        type    = "list"
        default = ["admin", "ubuntu"]
    }
```

Também é possível configurar variável de ambiente através da variável TF_VAR:
* TF_VAR_image=foo terraform apply
ou por variable files:
* terraform apply -var-file=foo.tfvars -var-file=bar.tfvars
ou por variável apenas:
* terraform apply -var 'zones=["us-east-1a", "us-east-1b"]'