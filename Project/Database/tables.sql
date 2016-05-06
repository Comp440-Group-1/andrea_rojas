/*
 Source Server         : COMP440
 Source Server Version : 11005058
 Source Host           : 130.166.41.222\CSDB440
 Source Database       : s16guest24
 Source Schema         : dbo1

 Target Server Version : 11005058
 File Encoding         : utf-8
*/

-- ----------------------------
--  Table structure for address
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[address]') AND type IN ('U'))
	DROP TABLE [dbo1].[address]
GO
CREATE TABLE [dbo1].[address] (
	[address_id] int NOT NULL,
	[address_string] varchar(64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[city] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[zipcode] varchar(5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[state] varchar(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for branch
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[branch]') AND type IN ('U'))
	DROP TABLE [dbo1].[branch]
GO
CREATE TABLE [dbo1].[branch] (
	[branch_id] int NOT NULL,
	[name] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[location] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for company
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[company]') AND type IN ('U'))
	DROP TABLE [dbo1].[company]
GO
CREATE TABLE [dbo1].[company] (
	[company_id] int NOT NULL,
	[address_id] int NULL,
	[name] varchar(64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for customer
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[customer]') AND type IN ('U'))
	DROP TABLE [dbo1].[customer]
GO
CREATE TABLE [dbo1].[customer] (
	[customer_id] int NOT NULL,
	[company_id] int NULL,
	[phone_id] int NULL,
	[first_name] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[last_name] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[email] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for download
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[download]') AND type IN ('U'))
	DROP TABLE [dbo1].[download]
GO
CREATE TABLE [dbo1].[download] (
	[download_id] int NOT NULL,
	[release_id] int NULL,
	[download_link] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for download_log
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[download_log]') AND type IN ('U'))
	DROP TABLE [dbo1].[download_log]
GO
CREATE TABLE [dbo1].[download_log] (
	[download_id] int NOT NULL,
	[customer_id] int NULL,
	[date] datetime2(0) NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for feature
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[feature]') AND type IN ('U'))
	DROP TABLE [dbo1].[feature]
GO
CREATE TABLE [dbo1].[feature] (
	[feature_id] int NOT NULL,
	[description] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for iteration
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[iteration]') AND type IN ('U'))
	DROP TABLE [dbo1].[iteration]
GO
CREATE TABLE [dbo1].[iteration] (
	[iteration_id] int NOT NULL,
	[product_id] int NULL,
	[label] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[commit_tag] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for phone
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[phone]') AND type IN ('U'))
	DROP TABLE [dbo1].[phone]
GO
CREATE TABLE [dbo1].[phone] (
	[phone_id] int NOT NULL,
	[type] varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[number] int NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for product
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[product]') AND type IN ('U'))
	DROP TABLE [dbo1].[product]
GO
CREATE TABLE [dbo1].[product] (
	[product_id] int NOT NULL,
	[name] varchar(64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[platform] varchar(16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for release
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[release]') AND type IN ('U'))
	DROP TABLE [dbo1].[release]
GO
CREATE TABLE [dbo1].[release] (
	[release_id] int NOT NULL,
	[release_date] datetime2(0) NULL,
	[type] varchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[comments] varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[version_id] int NULL,
	[iteration_id] int NULL,
	[branch_id] int NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for version
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[version]') AND type IN ('U'))
	DROP TABLE [dbo1].[version]
GO
CREATE TABLE [dbo1].[version] (
	[version_id] int NOT NULL,
	[product_id] int NULL,
	[version_number] int NULL
)
ON [PRIMARY]
GO

-- ----------------------------
--  Table structure for version_feature
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[version_feature]') AND type IN ('U'))
	DROP TABLE [dbo1].[version_feature]
GO
CREATE TABLE [dbo1].[version_feature] (
	[version_id] int NOT NULL,
	[feature_id] int NOT NULL
)
ON [PRIMARY]
GO



-- ----------------------------
--  Primary key structure for table address
-- ----------------------------
ALTER TABLE [dbo1].[address] ADD
	CONSTRAINT [PK__address__CAA247C9C98100D5] PRIMARY KEY NONCLUSTERED ([address_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Uniques structure for table address
-- ----------------------------
ALTER TABLE [dbo1].[address] ADD
	CONSTRAINT [address_id] UNIQUE CLUSTERED ([address_id] ASC) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [PRIMARY]
GO

-- ----------------------------
--  Primary key structure for table branch
-- ----------------------------
ALTER TABLE [dbo1].[branch] ADD
	CONSTRAINT [PK__branch__E55E37DF0D4F6EED] PRIMARY KEY NONCLUSTERED ([branch_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Uniques structure for table branch
-- ----------------------------
ALTER TABLE [dbo1].[branch] ADD
	CONSTRAINT [branch_id] UNIQUE CLUSTERED ([branch_id] ASC) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [PRIMARY]
GO

-- ----------------------------
--  Primary key structure for table company
-- ----------------------------
ALTER TABLE [dbo1].[company] ADD
	CONSTRAINT [PK__company__3E2672348C5563E6] PRIMARY KEY NONCLUSTERED ([company_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Uniques structure for table company
-- ----------------------------
ALTER TABLE [dbo1].[company] ADD
	CONSTRAINT [company_id] UNIQUE CLUSTERED ([company_id] ASC) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [PRIMARY]
GO

-- ----------------------------
--  Primary key structure for table customer
-- ----------------------------
ALTER TABLE [dbo1].[customer] ADD
	CONSTRAINT [PK__customer__CD65CB849E6ADFE9] PRIMARY KEY NONCLUSTERED ([customer_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Uniques structure for table customer
-- ----------------------------
ALTER TABLE [dbo1].[customer] ADD
	CONSTRAINT [customer_id] UNIQUE CLUSTERED ([customer_id] ASC) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [PRIMARY]
GO

-- ----------------------------
--  Primary key structure for table download
-- ----------------------------
ALTER TABLE [dbo1].[download] ADD
	CONSTRAINT [PK__download__2EDDE1CC4FBDC482] PRIMARY KEY NONCLUSTERED ([download_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Uniques structure for table download
-- ----------------------------
ALTER TABLE [dbo1].[download] ADD
	CONSTRAINT [download_id] UNIQUE CLUSTERED ([download_id] ASC) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [PRIMARY]
GO

-- ----------------------------
--  Primary key structure for table feature
-- ----------------------------
ALTER TABLE [dbo1].[feature] ADD
	CONSTRAINT [PK__feature__7906CBD61B5AEED2] PRIMARY KEY NONCLUSTERED ([feature_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Uniques structure for table feature
-- ----------------------------
ALTER TABLE [dbo1].[feature] ADD
	CONSTRAINT [feature_id] UNIQUE CLUSTERED ([feature_id] ASC) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [PRIMARY]
GO

-- ----------------------------
--  Primary key structure for table iteration
-- ----------------------------
ALTER TABLE [dbo1].[iteration] ADD
	CONSTRAINT [PK__iteratio__52124FC2131552E0] PRIMARY KEY NONCLUSTERED ([iteration_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Uniques structure for table iteration
-- ----------------------------
ALTER TABLE [dbo1].[iteration] ADD
	CONSTRAINT [iteration_id] UNIQUE CLUSTERED ([iteration_id] ASC) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [PRIMARY]
GO

-- ----------------------------
--  Primary key structure for table phone
-- ----------------------------
ALTER TABLE [dbo1].[phone] ADD
	CONSTRAINT [PK__phone__E6BD6DD68FBA52CE] PRIMARY KEY NONCLUSTERED ([phone_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Uniques structure for table phone
-- ----------------------------
ALTER TABLE [dbo1].[phone] ADD
	CONSTRAINT [phone_id] UNIQUE CLUSTERED ([phone_id] ASC) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [PRIMARY]
GO

-- ----------------------------
--  Primary key structure for table product
-- ----------------------------
ALTER TABLE [dbo1].[product] ADD
	CONSTRAINT [PK__product__47027DF449921081] PRIMARY KEY NONCLUSTERED ([product_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Uniques structure for table product
-- ----------------------------
ALTER TABLE [dbo1].[product] ADD
	CONSTRAINT [productId] UNIQUE CLUSTERED ([product_id] ASC) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [PRIMARY]
GO

-- ----------------------------
--  Primary key structure for table release
-- ----------------------------
ALTER TABLE [dbo1].[release] ADD
	CONSTRAINT [PK__release__7F5F1D778BC3B630] PRIMARY KEY NONCLUSTERED ([release_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Uniques structure for table release
-- ----------------------------
ALTER TABLE [dbo1].[release] ADD
	CONSTRAINT [release_id] UNIQUE CLUSTERED ([release_id] ASC) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [PRIMARY]
GO

-- ----------------------------
--  Primary key structure for table version
-- ----------------------------
ALTER TABLE [dbo1].[version] ADD
	CONSTRAINT [PK__version__07A58868FDCF24D0] PRIMARY KEY NONCLUSTERED ([version_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Uniques structure for table version
-- ----------------------------
ALTER TABLE [dbo1].[version] ADD
	CONSTRAINT [version_id] UNIQUE CLUSTERED ([version_id] ASC) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [PRIMARY]
GO

-- ----------------------------
--  Primary key structure for table version_feature
-- ----------------------------
ALTER TABLE [dbo1].[version_feature] ADD
	CONSTRAINT [PK__version___6035E4D4EBBE0A67] PRIMARY KEY CLUSTERED ([version_id],[feature_id]) 
	WITH (PAD_INDEX = OFF,
		IGNORE_DUP_KEY = OFF,
		ALLOW_ROW_LOCKS = ON,
		ALLOW_PAGE_LOCKS = ON)
	ON [default]
GO

-- ----------------------------
--  Foreign keys structure for table company
-- ----------------------------
ALTER TABLE [dbo1].[company] ADD
	CONSTRAINT [fk_company_address_1] FOREIGN KEY ([address_id]) REFERENCES [dbo1].[address] ([address_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table customer
-- ----------------------------
ALTER TABLE [dbo1].[customer] ADD
	CONSTRAINT [fk_customer_phone_1] FOREIGN KEY ([phone_id]) REFERENCES [dbo1].[phone] ([phone_id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [fk_customer_company_1] FOREIGN KEY ([company_id]) REFERENCES [dbo1].[company] ([company_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table download
-- ----------------------------
ALTER TABLE [dbo1].[download] ADD
	CONSTRAINT [fk_download_release_1] FOREIGN KEY ([release_id]) REFERENCES [dbo1].[release] ([release_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table download_log
-- ----------------------------
ALTER TABLE [dbo1].[download_log] ADD
	CONSTRAINT [fk_download_log_download_1] FOREIGN KEY ([download_id]) REFERENCES [dbo1].[download] ([download_id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [fk_download_log_customer_1] FOREIGN KEY ([customer_id]) REFERENCES [dbo1].[customer] ([customer_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table iteration
-- ----------------------------
ALTER TABLE [dbo1].[iteration] ADD
	CONSTRAINT [fk_iteration_product_1] FOREIGN KEY ([product_id]) REFERENCES [dbo1].[product] ([product_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table release
-- ----------------------------
ALTER TABLE [dbo1].[release] ADD
	CONSTRAINT [fk_release_version_1] FOREIGN KEY ([version_id]) REFERENCES [dbo1].[version] ([version_id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [fk_release_iteration_1] FOREIGN KEY ([iteration_id]) REFERENCES [dbo1].[iteration] ([iteration_id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [fk_release_branch_1] FOREIGN KEY ([branch_id]) REFERENCES [dbo1].[branch] ([branch_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table version
-- ----------------------------
ALTER TABLE [dbo1].[version] ADD
	CONSTRAINT [fk_version_product_1] FOREIGN KEY ([product_id]) REFERENCES [dbo1].[product] ([product_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Foreign keys structure for table version_feature
-- ----------------------------
ALTER TABLE [dbo1].[version_feature] ADD
	CONSTRAINT [fk_version_feature_version_1] FOREIGN KEY ([version_id]) REFERENCES [dbo1].[version] ([version_id]) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT [fk_version_feature_feature_1] FOREIGN KEY ([feature_id]) REFERENCES [dbo1].[feature] ([feature_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
--  Options for table address
-- ----------------------------
ALTER TABLE [dbo1].[address] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table branch
-- ----------------------------
ALTER TABLE [dbo1].[branch] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table company
-- ----------------------------
ALTER TABLE [dbo1].[company] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table customer
-- ----------------------------
ALTER TABLE [dbo1].[customer] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table download
-- ----------------------------
ALTER TABLE [dbo1].[download] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table download_log
-- ----------------------------
ALTER TABLE [dbo1].[download_log] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table feature
-- ----------------------------
ALTER TABLE [dbo1].[feature] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table iteration
-- ----------------------------
ALTER TABLE [dbo1].[iteration] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table phone
-- ----------------------------
ALTER TABLE [dbo1].[phone] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table product
-- ----------------------------
ALTER TABLE [dbo1].[product] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table release
-- ----------------------------
ALTER TABLE [dbo1].[release] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table version
-- ----------------------------
ALTER TABLE [dbo1].[version] SET (LOCK_ESCALATION = TABLE)
GO

-- ----------------------------
--  Options for table version_feature
-- ----------------------------
ALTER TABLE [dbo1].[version_feature] SET (LOCK_ESCALATION = TABLE)
GO


