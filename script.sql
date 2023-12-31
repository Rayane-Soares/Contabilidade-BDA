USE [Contabilidade]
GO
/****** Object:  Database [Contabilidade]    Script Date: 23/11/2023 20:56:15 ******/
CREATE DATABASE [Contabilidade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Contabilidade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Contabilidade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Contabilidade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Contabilidade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Contabilidade] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Contabilidade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Contabilidade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Contabilidade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Contabilidade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Contabilidade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Contabilidade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Contabilidade] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Contabilidade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Contabilidade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Contabilidade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Contabilidade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Contabilidade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Contabilidade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Contabilidade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Contabilidade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Contabilidade] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Contabilidade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Contabilidade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Contabilidade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Contabilidade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Contabilidade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Contabilidade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Contabilidade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Contabilidade] SET RECOVERY FULL 
GO
ALTER DATABASE [Contabilidade] SET  MULTI_USER 
GO
ALTER DATABASE [Contabilidade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Contabilidade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Contabilidade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Contabilidade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Contabilidade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Contabilidade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Contabilidade', N'ON'
GO
ALTER DATABASE [Contabilidade] SET QUERY_STORE = ON
GO
ALTER DATABASE [Contabilidade] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Contabilidade]
GO
/****** Object:  User [sql]    Script Date: 23/11/2023 20:56:16 ******/
CREATE USER [sql] FOR LOGIN [sql] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 23/11/2023 20:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] NOT NULL,
	[TipoCliente] [varchar](8) NOT NULL,
	[idEmail] [int] NOT NULL,
	[idTelefone] [int] NOT NULL,
	[idEndereco] [int] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conta]    Script Date: 23/11/2023 20:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conta](
	[idContaBancaria] [int] NOT NULL,
	[NumerodaConta] [varchar](20) NOT NULL,
	[AgenciaConta] [varchar](5) NOT NULL,
	[TipodeConta] [text] NOT NULL,
 CONSTRAINT [PK_Conta] PRIMARY KEY CLUSTERED 
(
	[idContaBancaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contador]    Script Date: 23/11/2023 20:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contador](
	[idContador] [int] NOT NULL,
	[InicioAtividadeContador] [date] NOT NULL,
	[Situacao] [varchar](50) NOT NULL,
	[DuracaoContratoContador] [int] NOT NULL,
	[ForoComarcaContador] [varchar](50) NOT NULL,
	[CPF] [varchar](11) NOT NULL,
	[CRC] [varchar](5) NOT NULL,
	[idTelefone] [int] NOT NULL,
	[idEmail] [int] NOT NULL,
	[idEndereco] [int] NOT NULL,
 CONSTRAINT [PK_Contador] PRIMARY KEY CLUSTERED 
(
	[idContador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Email]    Script Date: 23/11/2023 20:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email](
	[idEmail] [nchar](50) NULL,
	[Nome] [text] NULL,
	[Cargo] [text] NULL,
	[idEmpresa] [int] NULL,
	[idUsuario] [int] NULL,
	[idCliente] [int] NULL,
	[idContador] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 23/11/2023 20:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[idEmpresa] [int] NOT NULL,
	[CNPJ] [varchar](14) NOT NULL,
	[RazaoSocialEmpresa] [varchar](50) NOT NULL,
	[NomeFantasiaEmpresa] [varchar](50) NOT NULL,
	[InscricaoEstadualEmpresa] [int] NULL,
	[InscricaoMunicipalEmpresa] [int] NULL,
	[InscricaoSubstituicaoTributaria] [int] NULL,
	[NaturezaJuridicaEmpresa] [text] NOT NULL,
	[Site] [text] NOT NULL,
	[idEmail] [int] NOT NULL,
	[idTelefone] [int] NOT NULL,
	[idEndereco] [int] NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[idEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Endereco]    Script Date: 23/11/2023 20:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endereco](
	[idEndereco] [nchar](10) NOT NULL,
	[Logradouro] [nchar](10) NOT NULL,
	[Numero] [int] NOT NULL,
	[CEP] [varchar](8) NOT NULL,
	[Complemento] [nchar](10) NOT NULL,
	[Bairro] [text] NOT NULL,
	[Municipio] [text] NOT NULL,
	[UF] [text] NOT NULL,
	[Pais] [text] NOT NULL,
	[CaixaPostal] [varchar](8) NOT NULL,
	[idEmpresa] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[idContador] [int] NOT NULL,
 CONSTRAINT [PK_Endereco] PRIMARY KEY CLUSTERED 
(
	[idEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimentacaoBancaria]    Script Date: 23/11/2023 20:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimentacaoBancaria](
	[idLancamento] [int] NOT NULL,
	[ContaDebitada] [varchar](20) NOT NULL,
	[AgenciaContaDebitada] [varchar](20) NOT NULL,
	[AgenciaContaCreditada] [varchar](20) NOT NULL,
	[ContaCreditada] [varchar](20) NOT NULL,
	[Valor] [int] NOT NULL,
 CONSTRAINT [PK_MovimentacaoBancaria] PRIMARY KEY CLUSTERED 
(
	[idLancamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RelatorioFinanceiro]    Script Date: 23/11/2023 20:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelatorioFinanceiro](
	[idRelatorioFinanceiro] [int] NOT NULL,
	[NomeEmpresa] [varchar](50) NOT NULL,
	[DataEmissão] [date] NOT NULL,
	[TipoRelatorio] [text] NOT NULL,
 CONSTRAINT [PK_RelatorioFinanceiro] PRIMARY KEY CLUSTERED 
(
	[idRelatorioFinanceiro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefone]    Script Date: 23/11/2023 20:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefone](
	[idTelefone] [int] NOT NULL,
	[Fixo] [varchar](10) NOT NULL,
	[Celular] [varchar](11) NOT NULL,
	[idContador] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[idEmpresa] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Telefone] PRIMARY KEY CLUSTERED 
(
	[idTelefone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransacaoFinanceira]    Script Date: 23/11/2023 20:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransacaoFinanceira](
	[idTransacao] [int] NOT NULL,
	[DataTransacao] [date] NOT NULL,
	[TipoTransacao] [text] NOT NULL,
	[Valor] [int] NOT NULL,
 CONSTRAINT [PK_TransacaoFinanceira] PRIMARY KEY CLUSTERED 
(
	[idTransacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/11/2023 20:56:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] NOT NULL,
	[NomeUsuario] [text] NOT NULL,
	[SenhaUsuario] [varchar](10) NOT NULL,
	[NivelAcessoUsuario] [text] NOT NULL,
	[idEndereco] [int] NOT NULL,
	[idEmail] [int] NOT NULL,
	[idTelefone] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Contabilidade] SET  READ_WRITE 
GOXTIMAGE_ON [PRIMARY]
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
