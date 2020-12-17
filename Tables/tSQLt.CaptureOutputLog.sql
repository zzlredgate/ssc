CREATE TABLE [tSQLt].[CaptureOutputLog]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[OutputText] [nvarchar] (max) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [tSQLt].[CaptureOutputLog] ADD CONSTRAINT [PK__CaptureO__3214EC0708597B82] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
