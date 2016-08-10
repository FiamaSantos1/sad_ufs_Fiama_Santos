
CREATE SEQUENCE new_tabletipoveiculo_pk_id_tipoveiculo_seq_3;

CREATE TABLE New_TabletipoVeiculo (
                pk_id_TipoVeiculo INTEGER NOT NULL DEFAULT nextval('new_tabletipoveiculo_pk_id_tipoveiculo_seq_3'),
                nomeTipo VARCHAR NOT NULL,
                CONSTRAINT id_tipoveiculo PRIMARY KEY (pk_id_TipoVeiculo)
);


ALTER SEQUENCE new_tabletipoveiculo_pk_id_tipoveiculo_seq_3 OWNED BY New_TabletipoVeiculo.pk_id_TipoVeiculo;

CREATE SEQUENCE veiculo_pk_id_veiculo_seq_2;

CREATE TABLE Veiculo (
                pk_id_veiculo INTEGER NOT NULL DEFAULT nextval('veiculo_pk_id_veiculo_seq_2'),
                pk_id_TipoVeiculo INTEGER NOT NULL,
                placa VARCHAR NOT NULL,
                modelo VARCHAR NOT NULL,
                CONSTRAINT id_veiculo PRIMARY KEY (pk_id_veiculo, pk_id_TipoVeiculo)
);


ALTER SEQUENCE veiculo_pk_id_veiculo_seq_2 OWNED BY Veiculo.pk_id_veiculo;

CREATE TABLE vaga (
                pk_id_vaga INTEGER NOT NULL,
                pk_id_veiculo INTEGER NOT NULL,
                pk_id_TipoVeiculo INTEGER NOT NULL,
                descricao_vaga VARCHAR NOT NULL,
                valor NUMERIC NOT NULL,
                data DATE NOT NULL,
                CONSTRAINT id_vaga PRIMARY KEY (pk_id_vaga, pk_id_veiculo, pk_id_TipoVeiculo)
);


CREATE TABLE Cargo (
                pk_id_cargo INTEGER NOT NULL,
                descricao_cargo VARCHAR NOT NULL,
                CONSTRAINT id_cargo PRIMARY KEY (pk_id_cargo)
);


CREATE SEQUENCE endereco_pk_id_endereco_seq_1;

CREATE TABLE Endereco (
                pk_id_endereco VARCHAR NOT NULL DEFAULT nextval('endereco_pk_id_endereco_seq_1'),
                cidade VARCHAR NOT NULL,
                pais VARCHAR NOT NULL,
                estado VARCHAR NOT NULL,
                logradouro VARCHAR NOT NULL,
                cep INTEGER NOT NULL,
                numero VARCHAR NOT NULL,
                CONSTRAINT id_endereco PRIMARY KEY (pk_id_endereco)
);


ALTER SEQUENCE endereco_pk_id_endereco_seq_1 OWNED BY Endereco.pk_id_endereco;

CREATE TABLE Cliente (
                pk_id_cliente INTEGER NOT NULL,
                pk_id_endereco VARCHAR NOT NULL,
                pk_id_veiculo INTEGER NOT NULL,
                pk_id_vaga INTEGER NOT NULL,
                pk_id_TipoVeiculo INTEGER NOT NULL,
                nomeCliente VARCHAR NOT NULL,
                telefone INTEGER,
                cpf INTEGER NOT NULL,
                dataCadastro DATE NOT NULL,
                CONSTRAINT id_cliente PRIMARY KEY (pk_id_cliente, pk_id_endereco, pk_id_veiculo, pk_id_vaga, pk_id_TipoVeiculo)
);


CREATE SEQUENCE login_pk_id_login_seq;

CREATE TABLE Login (
                pk_id_Login INTEGER NOT NULL DEFAULT nextval('login_pk_id_login_seq'),
                nome_login VARCHAR NOT NULL,
                senha_login VARCHAR NOT NULL,
                CONSTRAINT id_login PRIMARY KEY (pk_id_Login)
);


ALTER SEQUENCE login_pk_id_login_seq OWNED BY Login.pk_id_Login;

CREATE SEQUENCE funcionario_pk_id_funcionario_seq;

CREATE TABLE Funcionario (
                pk_id_Funcionario INTEGER NOT NULL DEFAULT nextval('funcionario_pk_id_funcionario_seq'),
                pk_id_Login INTEGER NOT NULL,
                pk_id_cargo INTEGER NOT NULL,
                pk_id_vaga INTEGER NOT NULL,
                pk_id_endereco VARCHAR NOT NULL,
                cpf VARCHAR NOT NULL,
                nome VARCHAR NOT NULL,
                telefone INTEGER,
                CONSTRAINT id_funcionario PRIMARY KEY (pk_id_Funcionario, pk_id_Login, pk_id_cargo, pk_id_vaga, pk_id_endereco)
);


ALTER SEQUENCE funcionario_pk_id_funcionario_seq OWNED BY Funcionario.pk_id_Funcionario;

ALTER TABLE Veiculo ADD CONSTRAINT new_tabletipoveiculo_veiculo_fk
FOREIGN KEY (pk_id_TipoVeiculo)
REFERENCES New_TabletipoVeiculo (pk_id_TipoVeiculo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Cliente ADD CONSTRAINT veiculo_cliente_fk
FOREIGN KEY (pk_id_veiculo)
REFERENCES Veiculo (pk_id_veiculo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE vaga ADD CONSTRAINT veiculo_vaga_fk
FOREIGN KEY (pk_id_veiculo, pk_id_TipoVeiculo)
REFERENCES Veiculo (pk_id_veiculo, pk_id_TipoVeiculo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Funcionario ADD CONSTRAINT vaga_funcionario_fk
FOREIGN KEY (pk_id_vaga)
REFERENCES vaga (pk_id_vaga)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Cliente ADD CONSTRAINT vaga_cliente_fk
FOREIGN KEY (pk_id_vaga, pk_id_veiculo, pk_id_TipoVeiculo)
REFERENCES vaga (pk_id_vaga, pk_id_veiculo, pk_id_TipoVeiculo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Funcionario ADD CONSTRAINT cargo_funcionario_fk
FOREIGN KEY (pk_id_cargo)
REFERENCES Cargo (pk_id_cargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Funcionario ADD CONSTRAINT endereco_funcionario_fk
FOREIGN KEY (pk_id_endereco)
REFERENCES Endereco (pk_id_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Cliente ADD CONSTRAINT endereco_cliente_fk
FOREIGN KEY (pk_id_endereco)
REFERENCES Endereco (pk_id_endereco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Funcionario ADD CONSTRAINT login_funcionario_fk
FOREIGN KEY (pk_id_Login)
REFERENCES Login (pk_id_Login)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
