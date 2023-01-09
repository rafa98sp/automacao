module Gera_Token
    include HTTParty
    
    #url base de contato
    base_uri CONFIG['url_padrao']
    
    #opcoes do meu service
    format :json
    headers         'X-Company-id': CONFIG['company_id'],
                    'X-Application-Id': CONFIG['aplication_id'],
                    'X-User-Id': CONFIG['cpf_espaco_informatica'],
                    'Content-Type': 'application/json'
    
end