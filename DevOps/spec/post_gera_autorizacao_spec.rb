describe 'Autenticação' do
    it 'Gerar Autorização' do 
        @bodyAutoriza = {
            "clientId": CONFIG['clientId'],
            "clientSecret": CONFIG['clientSecret'],
            "grantType": CONFIG['grantType']
        }.to_json

        @requestAutoriza = Gera_Autorizacao.post("/corporate/security/v1/authorize?key=#{CONFIG['key']}", body: @bodyAutoriza)
        
        $code = @requestAutoriza['code']
        expect(@requestAutoriza.code).to eq 200
    end

    it 'Gerar Token' do
        @bodyToken = {
            "code": "#{$code}"
        }.to_json

        @requestToken = Gera_Token.post("/corporate/security/v1/token?key=#{CONFIG['key']}", body: @bodyToken)
        $token = @requestToken['token']
        expect(@requestToken.code).to eq 200
    end
end