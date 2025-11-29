USE relacionamento;

-- =========================================================
--   INSERÇÃO DE INGREDIENTES
-- =========================================================

INSERT INTO ingrediente (fornecedor, nome, un_de_medida) VALUES
('Padaria Dois Irmãos', 'Pão de hambúrguer', 'un'),
('Açougue Boi Forte', 'Hambúrguer bovino', 'un'),
('Laticínios Vale Branco', 'Queijo prato', 'g'),
('Hortifruti Primavera', 'Alface', 'g'),
('Hortifruti Primavera', 'Tomate', 'g'),
('Mercado Popular', 'Maionese', 'g'),
('Hortifruti Primavera', 'Cebola', 'g'),
('Padaria Dois Irmãos', 'Pão de forma', 'un'),
('Mercado Popular', 'Presunto', 'g'),
('Laticínios Vale Branco', 'Queijo mussarela', 'g'),
('Laticínios Vale Branco', 'Manteiga', 'g'),
('Padaria Dois Irmãos', 'Tortilla', 'un'),
('Açougue Boi Forte', 'Frango desfiado', 'g'),
('Laticínios Vale Branco', 'Cream cheese', 'g'),
('Mercado Popular', 'Salsicha', 'un'),
('Mercado Popular', 'Batata palha', 'g'),
('Mercado Popular', 'Ketchup', 'g'),
('Mercado Popular', 'Mostarda', 'g'),
('Mercado Popular', 'Molho de tomate', 'g'),
('Mercado Popular', 'Arroz', 'g'),
('Açougue Boi Forte', 'Bife empanado', 'g'),
('Café Estação', 'Café moído', 'g'),
('Hortifruti Primavera', 'Laranja', 'un'),
('Laticínios Vale Branco', 'Leite', 'ml'),
('Hortifruti Primavera', 'Banana', 'un'),
('Hortifruti Primavera', 'Morango', 'g'),
('Laticínios Vale Branco', 'Iogurte natural', 'g'),
('Hortifruti Primavera', 'Mel', 'g'),
('Mercado Popular', 'Ovos', 'un'),
('Laticínios Vale Branco', 'Leite condensado', 'g'),
('Laticínios Vale Branco', 'Creme de leite', 'g'),
('Distribuidora Bebidas Sul', 'Suco de maracujá', 'ml'),
('Mercado Popular', 'Chocolate', 'g'),
('Mercado Popular', 'Farinha', 'g'),
('Hortifruti Primavera', 'Nozes', 'g'),
('Mercado Popular', 'Biscoito triturado', 'g'),
('Hortifruti Primavera', 'Limão', 'un'),
('Padaria Dois Irmãos', 'Pão de hot dog', 'un'),
('Mercado Popular', 'Feijão preto', 'g'),
('Açougue Boi Forte', 'Carne seca', 'g'),
('Açougue Boi Forte', 'Linguiça calabresa', 'g'),
('Açougue Boi Forte', 'Bacon', 'g'),
('Padaria Dois Irmãos', 'Massa de lasanha', 'g'),
('Mercado Popular', 'Água', 'ml'),
('Distribuidora Bebidas Sul', 'Refrigerante cola lata', 'un'),
('Mercado Popular', 'Açúcar', 'g');

-- =========================================================
--   INSERÇÃO DE PRODUTOS
-- =========================================================

INSERT INTO produto (categoria, nome, preco) VALUES
('Lanches', 'X-Burger', 18),
('Lanches', 'X-Salada', 20),
('Lanches', 'Cachorro-quente', 14),
('Lanches', 'Misto quente', 10),
('Lanches', 'Wrap de frango', 22),

('Almoco', 'Strogonoff de frango', 28),
('Almoco', 'Feijoada', 35),
('Almoco', 'Lasanha à bolonhesa', 32),
('Almoco', 'Frango grelhado com arroz', 25),
('Almoco', 'Parmegiana de carne', 30),

('Bebidas', 'Suco de laranja natural', 9),
('Bebidas', 'Refrigerante cola lata', 7),
('Bebidas', 'Vitamina de banana', 12),
('Bebidas', 'Smoothie de morango', 14),
('Bebidas', 'Café expresso', 5),

('Sobremesas', 'Pudim de leite', 10),
('Sobremesas', 'Mousse de maracujá', 12),
('Sobremesas', 'Brownie', 15),
('Sobremesas', 'Sorvete de chocolate', 10),
('Sobremesas', 'Torta de limão', 16);

-- =========================================================
--   RELACIONAMENTOS ingrediente_produto
-- =========================================================

-- X-Burger
INSERT INTO ingrediente_produto VALUES
(1, (SELECT id FROM ingrediente WHERE nome='Pão de hambúrguer'), (SELECT produto_id FROM produto WHERE nome='X-Burger')),
(1, (SELECT id FROM ingrediente WHERE nome='Hambúrguer bovino'), (SELECT produto_id FROM produto WHERE nome='X-Burger')),
(30, (SELECT id FROM ingrediente WHERE nome='Queijo prato'), (SELECT produto_id FROM produto WHERE nome='X-Burger')),
(15, (SELECT id FROM ingrediente WHERE nome='Maionese'), (SELECT produto_id FROM produto WHERE nome='X-Burger')),
(20, (SELECT id FROM ingrediente WHERE nome='Alface'), (SELECT produto_id FROM produto WHERE nome='X-Burger')),
(20, (SELECT id FROM ingrediente WHERE nome='Tomate'), (SELECT produto_id FROM produto WHERE nome='X-Burger'));

-- X-Salada
INSERT INTO ingrediente_produto VALUES
(1, (SELECT id FROM ingrediente WHERE nome='Pão de hambúrguer'), (SELECT produto_id FROM produto WHERE nome='X-Salada')),
(1, (SELECT id FROM ingrediente WHERE nome='Hambúrguer bovino'), (SELECT produto_id FROM produto WHERE nome='X-Salada')),
(30, (SELECT id FROM ingrediente WHERE nome='Queijo prato'), (SELECT produto_id FROM produto WHERE nome='X-Salada')),
(20, (SELECT id FROM ingrediente WHERE nome='Alface'), (SELECT produto_id FROM produto WHERE nome='X-Salada')),
(20, (SELECT id FROM ingrediente WHERE nome='Tomate'), (SELECT produto_id FROM produto WHERE nome='X-Salada')),
(15, (SELECT id FROM ingrediente WHERE nome='Maionese'), (SELECT produto_id FROM produto WHERE nome='X-Salada')),
(15, (SELECT id FROM ingrediente WHERE nome='Cebola'), (SELECT produto_id FROM produto WHERE nome='X-Salada'));

-- Cachorro-quente
INSERT INTO ingrediente_produto VALUES
(1, (SELECT id FROM ingrediente WHERE nome='Pão de hot dog'), (SELECT produto_id FROM produto WHERE nome='Cachorro-quente')),
(1, (SELECT id FROM ingrediente WHERE nome='Salsicha'), (SELECT produto_id FROM produto WHERE nome='Cachorro-quente')),
(20, (SELECT id FROM ingrediente WHERE nome='Batata palha'), (SELECT produto_id FROM produto WHERE nome='Cachorro-quente')),
(15, (SELECT id FROM ingrediente WHERE nome='Ketchup'), (SELECT produto_id FROM produto WHERE nome='Cachorro-quente')),
(15, (SELECT id FROM ingrediente WHERE nome='Mostarda'), (SELECT produto_id FROM produto WHERE nome='Cachorro-quente')),
(15, (SELECT id FROM ingrediente WHERE nome='Maionese'), (SELECT produto_id FROM produto WHERE nome='Cachorro-quente'));

-- Misto quente
INSERT INTO ingrediente_produto VALUES
(2, (SELECT id FROM ingrediente WHERE nome='Pão de forma'), (SELECT produto_id FROM produto WHERE nome='Misto quente')),
(40, (SELECT id FROM ingrediente WHERE nome='Presunto'), (SELECT produto_id FROM produto WHERE nome='Misto quente')),
(40, (SELECT id FROM ingrediente WHERE nome='Queijo mussarela'), (SELECT produto_id FROM produto WHERE nome='Misto quente')),
(10, (SELECT id FROM ingrediente WHERE nome='Manteiga'), (SELECT produto_id FROM produto WHERE nome='Misto quente'));

-- Wrap de frango
INSERT INTO ingrediente_produto VALUES
(1, (SELECT id FROM ingrediente WHERE nome='Tortilla'), (SELECT produto_id FROM produto WHERE nome='Wrap de frango')),
(100, (SELECT id FROM ingrediente WHERE nome='Frango desfiado'), (SELECT produto_id FROM produto WHERE nome='Wrap de frango')),
(30, (SELECT id FROM ingrediente WHERE nome='Cream cheese'), (SELECT produto_id FROM produto WHERE nome='Wrap de frango')),
(20, (SELECT id FROM ingrediente WHERE nome='Alface'), (SELECT produto_id FROM produto WHERE nome='Wrap de frango')),
(20, (SELECT id FROM ingrediente WHERE nome='Tomate'), (SELECT produto_id FROM produto WHERE nome='Wrap de frango'));

-- =========================================================
-- ALMOÇO
-- =========================================================

-- Strogonoff de frango
INSERT INTO ingrediente_produto VALUES
(150, (SELECT id FROM ingrediente WHERE nome='Frango desfiado'), (SELECT produto_id FROM produto WHERE nome='Strogonoff de frango')),
(200, (SELECT id FROM ingrediente WHERE nome='Creme de leite'), (SELECT produto_id FROM produto WHERE nome='Strogonoff de frango')),
(80, (SELECT id FROM ingrediente WHERE nome='Molho de tomate'), (SELECT produto_id FROM produto WHERE nome='Strogonoff de frango')),
(120, (SELECT id FROM ingrediente WHERE nome='Arroz'), (SELECT produto_id FROM produto WHERE nome='Strogonoff de frango'));

-- Feijoada
INSERT INTO ingrediente_produto VALUES
(200, (SELECT id FROM ingrediente WHERE nome='Feijão preto'), (SELECT produto_id FROM produto WHERE nome='Feijoada')),
(100, (SELECT id FROM ingrediente WHERE nome='Carne seca'), (SELECT produto_id FROM produto WHERE nome='Feijoada')),
(80, (SELECT id FROM ingrediente WHERE nome='Linguiça calabresa'), (SELECT produto_id FROM produto WHERE nome='Feijoada')),
(60, (SELECT id FROM ingrediente WHERE nome='Bacon'), (SELECT produto_id FROM produto WHERE nome='Feijoada')),
(30, (SELECT id FROM ingrediente WHERE nome='Cebola'), (SELECT produto_id FROM produto WHERE nome='Feijoada'));

-- Lasanha
INSERT INTO ingrediente_produto VALUES
(200, (SELECT id FROM ingrediente WHERE nome='Massa de lasanha'), (SELECT produto_id FROM produto WHERE nome='Lasanha à bolonhesa')),
(150, (SELECT id FROM ingrediente WHERE nome='Molho de tomate'), (SELECT produto_id FROM produto WHERE nome='Lasanha à bolonhesa')),
(120, (SELECT id FROM ingrediente WHERE nome='Queijo mussarela'), (SELECT produto_id FROM produto WHERE nome='Lasanha à bolonhesa')),
(80, (SELECT id FROM ingrediente WHERE nome='Presunto'), (SELECT produto_id FROM produto WHERE nome='Lasanha à bolonhesa'));

-- Frango grelhado
INSERT INTO ingrediente_produto VALUES
(150, (SELECT id FROM ingrediente WHERE nome='Frango desfiado'), (SELECT produto_id FROM produto WHERE nome='Frango grelhado com arroz')),
(120, (SELECT id FROM ingrediente WHERE nome='Arroz'), (SELECT produto_id FROM produto WHERE nome='Frango grelhado com arroz')),
(20, (SELECT id FROM ingrediente WHERE nome='Alface'), (SELECT produto_id FROM produto WHERE nome='Frango grelhado com arroz')),
(20, (SELECT id FROM ingrediente WHERE nome='Tomate'), (SELECT produto_id FROM produto WHERE nome='Frango grelhado com arroz'));

-- Parmegiana
INSERT INTO ingrediente_produto VALUES
(180, (SELECT id FROM ingrediente WHERE nome='Bife empanado'), (SELECT produto_id FROM produto WHERE nome='Parmegiana de carne')),
(120, (SELECT id FROM ingrediente WHERE nome='Molho de tomate'), (SELECT produto_id FROM produto WHERE nome='Parmegiana de carne')),
(100, (SELECT id FROM ingrediente WHERE nome='Queijo mussarela'), (SELECT produto_id FROM produto WHERE nome='Parmegiana de carne')),
(120, (SELECT id FROM ingrediente WHERE nome='Arroz'), (SELECT produto_id FROM produto WHERE nome='Parmegiana de carne'));

-- =========================================================
-- BEBIDAS
-- =========================================================

-- Suco de laranja natural
INSERT INTO ingrediente_produto VALUES
(3, (SELECT id FROM ingrediente WHERE nome='Laranja'), (SELECT produto_id FROM produto WHERE nome='Suco de laranja natural')),
(200, (SELECT id FROM ingrediente WHERE nome='Água'), (SELECT produto_id FROM produto WHERE nome='Suco de laranja natural'));

-- Refrigerante
INSERT INTO ingrediente_produto VALUES
(1, (SELECT id FROM ingrediente WHERE nome='Refrigerante cola lata'), (SELECT produto_id FROM produto WHERE nome='Refrigerante cola lata'));

-- Vitamina de banana
INSERT INTO ingrediente_produto VALUES
(2, (SELECT id FROM ingrediente WHERE nome='Banana'), (SELECT produto_id FROM produto WHERE nome='Vitamina de banana')),
(250, (SELECT id FROM ingrediente WHERE nome='Leite'), (SELECT produto_id FROM produto WHERE nome='Vitamina de banana')),
(20, (SELECT id FROM ingrediente WHERE nome='Açúcar'), (SELECT produto_id FROM produto WHERE nome='Vitamina de banana'));

-- Smoothie de morango
INSERT INTO ingrediente_produto VALUES
(120, (SELECT id FROM ingrediente WHERE nome='Morango'), (SELECT produto_id FROM produto WHERE nome='Smoothie de morango')),
(120, (SELECT id FROM ingrediente WHERE nome='Iogurte natural'), (SELECT produto_id FROM produto WHERE nome='Smoothie de morango')),
(15, (SELECT id FROM ingrediente WHERE nome='Mel'), (SELECT produto_id FROM produto WHERE nome='Smoothie de morango'));

-- Café expresso
INSERT INTO ingrediente_produto VALUES
(7, (SELECT id FROM ingrediente WHERE nome='Café moído'), (SELECT produto_id FROM produto WHERE nome='Café expresso'));

-- =========================================================
-- SOBREMESAS
-- =========================================================

-- Pudim
INSERT INTO ingrediente_produto VALUES
(395, (SELECT id FROM ingrediente WHERE nome='Leite condensado'), (SELECT produto_id FROM produto WHERE nome='Pudim de leite')),
(300, (SELECT id FROM ingrediente WHERE nome='Leite'), (SELECT produto_id FROM produto WHERE nome='Pudim de leite')),
(3, (SELECT id FROM ingrediente WHERE nome='Ovos'), (SELECT produto_id FROM produto WHERE nome='Pudim de leite'));

-- Mousse
INSERT INTO ingrediente_produto VALUES
(200, (SELECT id FROM ingrediente WHERE nome='Creme de leite'), (SELECT produto_id FROM produto WHERE nome='Mousse de maracujá')),
(395, (SELECT id FROM ingrediente WHERE nome='Leite condensado'), (SELECT produto_id FROM produto WHERE nome='Mousse de maracujá')),
(150, (SELECT id FROM ingrediente WHERE nome='Suco de maracujá'), (SELECT produto_id FROM produto WHERE nome='Mousse de maracujá'));

-- Brownie
INSERT INTO ingrediente_produto VALUES
(150, (SELECT id FROM ingrediente WHERE nome='Chocolate'), (SELECT produto_id FROM produto WHERE nome='Brownie')),
(80, (SELECT id FROM ingrediente WHERE nome='Manteiga'), (SELECT produto_id FROM produto WHERE nome='Brownie')),
(100, (SELECT id FROM ingrediente WHERE nome='Açúcar'), (SELECT produto_id FROM produto WHERE nome='Brownie')),
(120, (SELECT id FROM ingrediente WHERE nome='Farinha'), (SELECT produto_id FROM produto WHERE nome='Brownie')),
(3, (SELECT id FROM ingrediente WHERE nome='Ovos'), (SELECT produto_id FROM produto WHERE nome='Brownie'));

-- Sorvete
INSERT INTO ingrediente_produto VALUES
(300, (SELECT id FROM ingrediente WHERE nome='Leite'), (SELECT produto_id FROM produto WHERE nome='Sorvete de chocolate')),
(150, (SELECT id FROM ingrediente WHERE nome='Creme de leite'), (SELECT produto_id FROM produto WHERE nome='Sorvete de chocolate')),
(80, (SELECT id FROM ingrediente WHERE nome='Chocolate'), (SELECT produto_id FROM produto WHERE nome='Sorvete de chocolate'));

-- Torta de limão
INSERT INTO ingrediente_produto VALUES
(200, (SELECT id FROM ingrediente WHERE nome='Biscoito triturado'), (SELECT produto_id FROM produto WHERE nome='Torta de limão')),
(80, (SELECT id FROM ingrediente WHERE nome='Manteiga'), (SELECT produto_id FROM produto WHERE nome='Torta de limão')),
(395, (SELECT id FROM ingrediente WHERE nome='Leite condensado'), (SELECT produto_id FROM produto WHERE nome='Torta de limão')),
(3, (SELECT id FROM ingrediente WHERE nome='Limão'), (SELECT produto_id FROM produto WHERE nome='Torta de limão'));