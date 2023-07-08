1. cloudfront.tf:

Este arquivo está definindo um módulo chamado "cloudfront" usando o código contido no diretório local "./modules/website-cloudfront". O módulo espera receber várias variáveis que são passadas como argumentos.

As variáveis usadas no módulo incluem:

bucket_name: Nome do bucket usado para o CloudFront.
cloudfront_aliases: Domínios alternativos para o CloudFront.
cdn_comment: Comentário para a distribuição do CloudFront.
certificate: Ambiente de certificado.
profile: Perfil da conta AWS.
region: Região da conta AWS.
default_cache_behavior_cached_methods: Métodos HTTP para os quais o CloudFront armazena em cache as respostas.
tags: Tags aplicadas aos recursos do CloudFront.
bucket_versioning: Ativar ou desativar a versionamento do bucket.
2. vars.tfvars:

Este arquivo define os valores das variáveis usadas no módulo "cloudfront". Aqui estão os valores fornecidos para algumas das variáveis:

bucket_name: Nome do bucket fornecido como "bucket_name".
bucket_versioning: O versionamento do bucket está ativado ("Enabled").
cloudfront_aliases: Um domínio alternativo fornecido como ["alias.com.br"].
certificate: O Amazon Resource Name (ARN) do certificado fornecido como "arn:aws:acm:".
cdn_comment: Um comentário para a distribuição do CloudFront fornecido como "bucket-name".
profile: Nenhum perfil da conta AWS fornecido (valor vazio).
region: Região da conta AWS fornecida como "us-east-1".
default_cache_behavior_cached_methods: Métodos HTTP para armazenamento em cache fornecidos como ["GET", "HEAD"].
tags: Tags fornecidas como um mapa com as chaves "system" e "application" e seus respectivos valores.
3. providers.tf:

Este arquivo define o provedor AWS usado no código Terraform. Ele especifica a região e o perfil da conta AWS, que são obtidos das variáveis correspondentes.

4. variables.tf:

Este arquivo define as variáveis que são usadas no módulo "cloudfront" e têm seus valores definidos em vars.tfvars. Aqui estão algumas das variáveis definidas:

default_cache_behavior_cached_methods: Variável de lista de strings que controla quais métodos HTTP o CloudFront armazena em cache.
tags: Variável de mapa de strings que define as tags aplicadas aos recursos do CloudFront.
cloudfront_aliases: Variável de lista de strings que define os domínios alternativos do CloudFront.
bucket_name: Variável de string que define o nome do bucket usado pelo CloudFront.
certificate: Variável de string que define o ambiente do certificado.
region: Variável de string que define a região da conta AWS.
profile: Variável de string que define o perfil da conta AWS.
bucket_versioning: Variável de string que define se o versionamento do bucket está ativado.
