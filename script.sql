USE [Contabilidade]
GO
/****** Object:  Table [dbo].[ContaContabil]    Script Date: 26/10/2023 20:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContaContabil](
	[idContaContabil] [int] NOT NULL,
	[numeroConta] [int] NOT NULL,
	[numeroAgenciaConta] [int] NOT NULL,
	[tipoConta] [text] NOT NULL,
 CONSTRAINT [PK_ContaContabil] PRIMARY KEY CLUSTERED 
(
	[idContaContabil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contato]    Script Date: 26/10/2023 20:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contato](
	[idContatoFaculdade] [int] NOT NULL,
	[contatoFixo] [int] NULL,
	[numeroCelular] [int] NOT NULL,
	[email] [text] NOT NULL,
	[idFaculdade] [int] NOT NULL,
 CONSTRAINT [PK_contato] PRIMARY KEY CLUSTERED 
(
	[idContatoFaculdade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Endereco]    Script Date: 26/10/2023 20:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endereco](
	[idEndereco] [int] NOT NULL,
	[Estado] [text] NOT NULL,
	[Cidade] [text] NOT NULL,
	[Cep] [int] NOT NULL,
	[Bairro] [text] NOT NULL,
	[Rua] [text] NOT NULL,
	[Numero] [int] NOT NULL,
	[idFaculdade] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculdade]    Script Date: 26/10/2023 20:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculdade](
	[idFaculdade] [int] NOT NULL,
	[nomeFaculdade] [varchar](50) NOT NULL,
	[CPNJ] [int] NOT NULL,
 CONSTRAINT [PK_Faculdade] PRIMARY KEY CLUSTERED 
(
	[idFaculdade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lancamento]    Script Date: 26/10/2023 20:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lancamento](
	[idLancamento] [int] NOT NULL,
	[idContaDebitada] [int] NOT NULL,
	[idAgenciaCDebitada] [int] NOT NULL,
	[idContaCreditada] [int] NOT NULL,
	[idAgenciaCCreditada] [int] NOT NULL,
	[valor] [float] NOT NULL,
 CONSTRAINT [PK_lancamento] PRIMARY KEY CLUSTERED 
(
	[idLancamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[relatoriofinanceiro]    Script Date: 26/10/2023 20:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[relatoriofinanceiro](
	[idRelatorioFinanceiro] [int] NOT NULL,
	[nomeEmpresa] [text] NOT NULL,
	[idEmpresa] [int] NOT NULL,
	[dataEmissão] [date] NOT NULL,
	[tipoRelatorio] [text] NOT NULL,
 CONSTRAINT [PK_relatoriofinanceiro] PRIMARY KEY CLUSTERED 
(
	[idRelatorioFinanceiro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransacaoFinanceira]    Script Date: 26/10/2023 20:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransacaoFinanceira](
	[idTransacao] [int] NOT NULL,
	[dataTransacao] [date] NOT NULL,
	[tipoTransacao] [text] NOT NULL,
	[valor] [float] NOT NULL,
 CONSTRAINT [PK_TransacaoFinanceira] PRIMARY KEY CLUSTERED 
(
	[idTransacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 26/10/2023 20:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[idUsuario] [int] NOT NULL,
	[nomeCompletoUsuario] [varchar](50) NOT NULL,
	[senhaUsuario] [int] NOT NULL,
	[nivelAcessoUsuario] [text] NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de identificação da conta contábil (PK)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContaContabil', @level2type=N'COLUMN',@level2name=N'idContaContabil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número da conta sendo 6 digitos.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContaContabil', @level2type=N'COLUMN',@level2name=N'numeroConta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número da agência da conta sendo 4 digitos.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContaContabil', @level2type=N'COLUMN',@level2name=N'numeroAgenciaConta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo da conta podendo ser Ativo, Passivo, Patrimônio Liquido, Receita ou Despesa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ContaContabil', @level2type=N'COLUMN',@level2name=N'tipoConta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero de identificação do contato da faculdade. (PK)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contato', @level2type=N'COLUMN',@level2name=N'idContatoFaculdade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de contato fixo da faculdade com 10 (00 0000-0000).' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contato', @level2type=N'COLUMN',@level2name=N'contatoFixo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de celular da faculdade com 11 digitos (00 00000-0000).' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contato', @level2type=N'COLUMN',@level2name=N'numeroCelular'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Endereço de email da faculdade.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contato', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de identificação da faculdade.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contato', @level2type=N'COLUMN',@level2name=N'idFaculdade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificação da tabela Endereço correlacionada com a tabela Faculdade (PK)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Endereco', @level2type=N'COLUMN',@level2name=N'idEndereco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado onde se localiza a faculdade.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Endereco', @level2type=N'COLUMN',@level2name=N'Estado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cidade onde se localiza a faculdade.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Endereco', @level2type=N'COLUMN',@level2name=N'Cidade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CEP onde se localiza a faculdade (00000-000)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Endereco', @level2type=N'COLUMN',@level2name=N'Cep'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bairro onde se localiza a faculdade.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Endereco', @level2type=N'COLUMN',@level2name=N'Bairro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rua onde se localiza a faculdade.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Endereco', @level2type=N'COLUMN',@level2name=N'Rua'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número onde se localiza a faculdade.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Endereco', @level2type=N'COLUMN',@level2name=N'Numero'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Correlação com a tabela faculdade.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Endereco', @level2type=N'COLUMN',@level2name=N'idFaculdade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero de identificação da faculdade.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Faculdade', @level2type=N'COLUMN',@level2name=N'idFaculdade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome da faculdade.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Faculdade', @level2type=N'COLUMN',@level2name=N'nomeFaculdade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número do CNPJ da faculdade (XX.XXX.XXX/0001-XX)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Faculdade', @level2type=N'COLUMN',@level2name=N'CPNJ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero de identificação do lançamento feito.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lancamento', @level2type=N'COLUMN',@level2name=N'idLancamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero da conta debitada podendo ser 6 digitos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lancamento', @level2type=N'COLUMN',@level2name=N'idContaDebitada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero da agência da conta debitada podendo ser 4 digitos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lancamento', @level2type=N'COLUMN',@level2name=N'idAgenciaCDebitada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero da conta credita podendo ser 6 digitos.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lancamento', @level2type=N'COLUMN',@level2name=N'idContaCreditada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero da agência da conta creditada podendo ser 4 digitos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lancamento', @level2type=N'COLUMN',@level2name=N'idAgenciaCCreditada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor do lançamento feito.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lancamento', @level2type=N'COLUMN',@level2name=N'valor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero de identificação do relatório financeiro. (PK)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'relatoriofinanceiro', @level2type=N'COLUMN',@level2name=N'idRelatorioFinanceiro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome da empresa. ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'relatoriofinanceiro', @level2type=N'COLUMN',@level2name=N'nomeEmpresa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero de identificação da empresa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'relatoriofinanceiro', @level2type=N'COLUMN',@level2name=N'idEmpresa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de emissão do relatório financeiro com formato (AAAA-MM-DD).' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'relatoriofinanceiro', @level2type=N'COLUMN',@level2name=N'dataEmissão'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo do relatório financeiro podendo balanço patrimonial, demonstração de resultados, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'relatoriofinanceiro', @level2type=N'COLUMN',@level2name=N'tipoRelatorio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de identificação da Transação (PK)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransacaoFinanceira', @level2type=N'COLUMN',@level2name=N'idTransacao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data que foi realizada a transação (AAAA/MM/DD)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransacaoFinanceira', @level2type=N'COLUMN',@level2name=N'dataTransacao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo da transação feita podendo ser Recebimento, Pagamento, Transferência, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransacaoFinanceira', @level2type=N'COLUMN',@level2name=N'tipoTransacao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor da transação.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransacaoFinanceira', @level2type=N'COLUMN',@level2name=N'valor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de identificação do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario', @level2type=N'COLUMN',@level2name=N'idUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome completo do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario', @level2type=N'COLUMN',@level2name=N'nomeCompletoUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Senha de acesso do usuário' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario', @level2type=N'COLUMN',@level2name=N'senhaUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Definição de nivel de acesso que usuário terá no sistema financeiro, sendo publico, interno ou privado.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'usuario', @level2type=N'COLUMN',@level2name=N'nivelAcessoUsuario'
GO
