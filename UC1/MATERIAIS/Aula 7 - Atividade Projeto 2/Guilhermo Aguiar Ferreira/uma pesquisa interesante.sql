select cliente.nome, cliente.CNH , carro.modelo, agencia.cidade,aluga.dia, cliente_telefone.numero from aluga
inner join cliente on aluga.CNH = cliente.CNH
inner join carro on aluga.placa = carro.placa
inner join agencia on carro.codigo_agencia = agencia.NumAg
left outer join cliente_telefone on cliente.CNH= cliente_telefone.cnh_cliente;


