SELECT dt_aluguel Data_Aluguel,c.nome Nome_Cliente,car.numero_agencia Agencia,m.descricao Modelo_Carro,placa_carro Placa_Carro FROM locadora_carro.aluga_cliente_carro
inner join cliente c on c.cnh=cnh_cliente
inner join carro car on car.placa=placa_carro
inner join modelo m on m.codigo=car.codigo_modelo;