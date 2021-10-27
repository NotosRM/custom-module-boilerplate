﻿CREATE TABLE [mdt].[Warehouse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BoxesAmount] [int] NOT NULL,
	[ItemsPerBox] [int] NOT NULL,
 CONSTRAINT [PK_mdt_Warehouse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

