/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2017 (14.0.1000)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [MyEshop_DB]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 6/18/2019 5:00:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[FeatureID] [int] IDENTITY(1,1) NOT NULL,
	[FeatureTitle] [nvarchar](150) NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prodct_Selected_Groups]    Script Date: 6/18/2019 5:00:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prodct_Selected_Groups](
	[PG_ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
 CONSTRAINT [PK_Prodct_Selected_Groups] PRIMARY KEY CLUSTERED 
(
	[PG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Comments]    Script Date: 6/18/2019 5:00:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Comments](
	[ProductCommentID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[ProductID] [int] NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](350) NOT NULL,
	[WebSite] [nvarchar](350) NULL,
	[Commnet] [nvarchar](800) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Product_Comments] PRIMARY KEY CLUSTERED 
(
	[ProductCommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Feature]    Script Date: 6/18/2019 5:00:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Feature](
	[PF_ID] [int] IDENTITY(1,1) NOT NULL,
	[FeatureID] [int] NULL,
	[ProductID] [int] NULL,
	[Value] [nvarchar](150) NULL,
 CONSTRAINT [PK_Product_Feature] PRIMARY KEY CLUSTERED 
(
	[PF_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Galleries]    Script Date: 6/18/2019 5:00:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Galleries](
	[GalleryID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ImageName] [varchar](50) NOT NULL,
	[Title] [nvarchar](250) NULL,
 CONSTRAINT [PK_Product_Galleries] PRIMARY KEY CLUSTERED 
(
	[GalleryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Groups]    Script Date: 6/18/2019 5:00:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Groups](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupTitle] [nvarchar](400) NOT NULL,
	[ParentID] [int] NULL,
 CONSTRAINT [PK_Product_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Tags]    Script Date: 6/18/2019 5:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Tags](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Tag] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Product_Tags] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/18/2019 5:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](350) NOT NULL,
	[ShortDescription] [nvarchar](500) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[ImageName] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/18/2019 5:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] NOT NULL,
	[RoleTitle] [nvarchar](250) NOT NULL,
	[RoleName] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/18/2019 5:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[UserName] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Password] [varchar](200) NOT NULL,
	[ActiveCode] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[RegisterDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Features] ON 

INSERT [dbo].[Features] ([FeatureID], [FeatureTitle]) VALUES (1, N'رنگ')
INSERT [dbo].[Features] ([FeatureID], [FeatureTitle]) VALUES (2, N'وزن')
INSERT [dbo].[Features] ([FeatureID], [FeatureTitle]) VALUES (3, N'ابعاد')
INSERT [dbo].[Features] ([FeatureID], [FeatureTitle]) VALUES (4, N'بلوتوث')
SET IDENTITY_INSERT [dbo].[Features] OFF
SET IDENTITY_INSERT [dbo].[Prodct_Selected_Groups] ON 

INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (1, 1, 1)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (2, 1, 3)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (3, 1, 37)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (4, 1, 36)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (5, 2, 1)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (6, 2, 34)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (7, 2, 37)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (8, 1, 1)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (9, 1, 3)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (10, 1, 30)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (11, 1, 34)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (12, 1, 37)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (13, 1, 36)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (14, 1, 1)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (15, 1, 3)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (16, 1, 1)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (17, 3, 34)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (18, 3, 34)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (19, 3, 36)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (20, 3, 34)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (21, 3, 36)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (42, 4, 1)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (43, 4, 3)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (44, 4, 30)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (45, 4, 34)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (46, 4, 37)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (47, 4, 36)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (49, 5, 1)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (50, 6, 30)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (51, 6, 34)
INSERT [dbo].[Prodct_Selected_Groups] ([PG_ID], [ProductID], [GroupID]) VALUES (52, 6, 37)
SET IDENTITY_INSERT [dbo].[Prodct_Selected_Groups] OFF
SET IDENTITY_INSERT [dbo].[Product_Comments] ON 

INSERT [dbo].[Product_Comments] ([ProductCommentID], [ParentID], [ProductID], [UserName], [Email], [WebSite], [Commnet], [CreateDate]) VALUES (1, NULL, 1, N'hamed', N'hamed_71hh@yahoo.com', NULL, N'salam.chetori?', CAST(N'2019-05-29T11:51:55.000' AS DateTime))
INSERT [dbo].[Product_Comments] ([ProductCommentID], [ParentID], [ProductID], [UserName], [Email], [WebSite], [Commnet], [CreateDate]) VALUES (2, 1, 1, N'ali', N'ali@yahoo.com', N'asdasd', N'khobam.to chetori?', CAST(N'2019-05-29T11:51:55.000' AS DateTime))
INSERT [dbo].[Product_Comments] ([ProductCommentID], [ParentID], [ProductID], [UserName], [Email], [WebSite], [Commnet], [CreateDate]) VALUES (3, NULL, 1, N'nino', N'ninoferer@gmail.com', NULL, N'mahsolkhobi darim!', CAST(N'2019-05-29T11:51:55.000' AS DateTime))
INSERT [dbo].[Product_Comments] ([ProductCommentID], [ParentID], [ProductID], [UserName], [Email], [WebSite], [Commnet], [CreateDate]) VALUES (15, NULL, 1, N'hamedh71', N'hamedhalvaeihh@gmail.com', N'sdfsf', N'sdfsdfdf', CAST(N'2019-06-08T13:21:50.537' AS DateTime))
INSERT [dbo].[Product_Comments] ([ProductCommentID], [ParentID], [ProductID], [UserName], [Email], [WebSite], [Commnet], [CreateDate]) VALUES (16, NULL, 1, N'qweqwe13', N'hamedhalvaeihh@gmail.com', N'ASDASD', N'SADASD', CAST(N'2019-06-08T13:22:15.530' AS DateTime))
INSERT [dbo].[Product_Comments] ([ProductCommentID], [ParentID], [ProductID], [UserName], [Email], [WebSite], [Commnet], [CreateDate]) VALUES (17, 3, 1, N'hhhh', N'hamedhalvaei71hh@gmail.com', NULL, N'salammmmmmmmmmmmm', CAST(N'2019-06-08T15:58:31.240' AS DateTime))
INSERT [dbo].[Product_Comments] ([ProductCommentID], [ParentID], [ProductID], [UserName], [Email], [WebSite], [Commnet], [CreateDate]) VALUES (18, 3, 1, N'hhhh', N'hamedhalvaei71hh@gmail.com', NULL, N'salammmmmmmmmmmmm', CAST(N'2019-06-08T15:59:23.863' AS DateTime))
INSERT [dbo].[Product_Comments] ([ProductCommentID], [ParentID], [ProductID], [UserName], [Email], [WebSite], [Commnet], [CreateDate]) VALUES (19, NULL, 1, N'rtyrtyrtytryrty', N'hamedhalvaeihh@gmail.com', NULL, N'rtyrtyrtyrtyrty', CAST(N'2019-06-08T15:59:55.747' AS DateTime))
INSERT [dbo].[Product_Comments] ([ProductCommentID], [ParentID], [ProductID], [UserName], [Email], [WebSite], [Commnet], [CreateDate]) VALUES (20, NULL, 1, N'hamedh71', N'hamedhalvaei71hh@gmail.com', NULL, N'asassasasssssssssssss', CAST(N'2019-06-08T16:00:42.193' AS DateTime))
INSERT [dbo].[Product_Comments] ([ProductCommentID], [ParentID], [ProductID], [UserName], [Email], [WebSite], [Commnet], [CreateDate]) VALUES (21, NULL, 1, N'hamedh71', N'hamedhalvaei71hh@gmail.com', NULL, N'sdfsdfsdf', CAST(N'2019-06-08T16:01:17.697' AS DateTime))
INSERT [dbo].[Product_Comments] ([ProductCommentID], [ParentID], [ProductID], [UserName], [Email], [WebSite], [Commnet], [CreateDate]) VALUES (22, 21, 1, N' hamedhalvaei71hh@gmail.com', N'hamedhalvaei71hh@gmail.com', NULL, N'asdssssssssssss', CAST(N'2019-06-08T16:01:33.330' AS DateTime))
INSERT [dbo].[Product_Comments] ([ProductCommentID], [ParentID], [ProductID], [UserName], [Email], [WebSite], [Commnet], [CreateDate]) VALUES (23, NULL, 6, N'3', N'dd@s.com', N'sdfsdfsdf', N'asdada', CAST(N'2019-06-09T11:32:41.717' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product_Comments] OFF
SET IDENTITY_INSERT [dbo].[Product_Feature] ON 

INSERT [dbo].[Product_Feature] ([PF_ID], [FeatureID], [ProductID], [Value]) VALUES (9, 1, 1, N'DASD')
SET IDENTITY_INSERT [dbo].[Product_Feature] OFF
SET IDENTITY_INSERT [dbo].[Product_Galleries] ON 

INSERT [dbo].[Product_Galleries] ([GalleryID], [ProductID], [ImageName], [Title]) VALUES (8, 1, N'5b99b3f3-718d-4710-b2a7-0b3d302040d7.jpg', N'xzczxc')
INSERT [dbo].[Product_Galleries] ([GalleryID], [ProductID], [ImageName], [Title]) VALUES (10, 1, N'8ae2a6a9-597a-4521-88d2-bdba5d8ada59.jpg', N'wer')
INSERT [dbo].[Product_Galleries] ([GalleryID], [ProductID], [ImageName], [Title]) VALUES (11, 1, N'365347d2-08c7-4def-ba05-8916bb91734d.jpg', N'sdfsdf')
SET IDENTITY_INSERT [dbo].[Product_Galleries] OFF
SET IDENTITY_INSERT [dbo].[Product_Groups] ON 

INSERT [dbo].[Product_Groups] ([GroupID], [GroupTitle], [ParentID]) VALUES (1, N'الکترونیک', NULL)
INSERT [dbo].[Product_Groups] ([GroupID], [GroupTitle], [ParentID]) VALUES (3, N'تلویزیون', 1)
INSERT [dbo].[Product_Groups] ([GroupID], [GroupTitle], [ParentID]) VALUES (30, N'ورزش o', NULL)
INSERT [dbo].[Product_Groups] ([GroupID], [GroupTitle], [ParentID]) VALUES (34, N'فشفشف', 30)
INSERT [dbo].[Product_Groups] ([GroupID], [GroupTitle], [ParentID]) VALUES (36, N'گروه ماشین', NULL)
INSERT [dbo].[Product_Groups] ([GroupID], [GroupTitle], [ParentID]) VALUES (37, N'زیر گررروه 1', 30)
SET IDENTITY_INSERT [dbo].[Product_Groups] OFF
SET IDENTITY_INSERT [dbo].[Product_Tags] ON 

INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (1, 1, N'تست')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (2, 1, N'اولیه')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (3, 1, N'محصول')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (4, 2, N'پیش فرض')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (5, 2, N'محصول')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (6, 1, N'تست')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (7, 1, N'اولیه')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (8, 1, N'محصول')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (9, 1, N'ویرایش')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (10, 1, N'تست')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (11, 1, N'تست')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (12, 1, N'اولیه')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (13, 1, N'محصول')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (14, 1, N'تست')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (15, 1, N'اولیه')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (16, 1, N'محصول')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (17, 1, N'ویرایش')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (18, 1, N'تست')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (19, 3, N'سلام')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (20, 3, N'سلام')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (21, 3, N'خدافظ')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (22, 3, N'سلام')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (23, 3, N'سلام')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (24, 3, N'خدافظ')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (32, 4, N'اصن')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (33, 4, N'نداریم')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (35, 5, N'dsf')
INSERT [dbo].[Product_Tags] ([TagID], [ProductID], [Tag]) VALUES (36, 6, N'')
SET IDENTITY_INSERT [dbo].[Product_Tags] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Title], [ShortDescription], [Text], [Price], [ImageName], [CreateDate]) VALUES (1, N'محصول تست-ویرای', N'لورم ایپسوم ', N'<p>لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و بو&nbsp;</p>
', 99999, N'03283f33-cca6-449c-a355-b6de79ca07b8.jpg', CAST(N'2019-05-29T11:51:55.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Title], [ShortDescription], [Text], [Price], [ImageName], [CreateDate]) VALUES (2, N'محصول پیش فرض', N'ما به دوره ای تعلق داریم که فرهنگ را این خطر تهدید می کند که با ابزارهای فرهنگی نابودش سازند.', N'<p><span style="color:rgb(0, 0, 0); font-family:iransans; font-size:16px">لورم ایپسوم یا طرح&zwnj;نما (به انگلیسی: Lorem ipsum) به متنی آزمایشی و بی&zwnj;معنی در صنعت چاپ، صفحه&zwnj;آرایی و طراحی گرافیک گفته می&zwnj;شود. طراح گرافیک از این متن به عنوان عنصری از ترکیب بندی برای پر کردن صفحه و ارایه اولیه شکل ظاهری و کلی طرح سفارش گرفته شده استفاده می نماید، تا از نظر گرافیکی نشانگر چگونگی نوع و اندازه فونت و ظاهر متن باشد. معمولا طراحان گرافیک برای صفحه&zwnj;آرایی، نخست از متن&zwnj;های آزمایشی و بی&zwnj;معنی استفاده می&zwnj;کنند تا صرفا به مشتری یا صاحب کار خود نشان دهند که صفحه طراحی یا صفحه بندی شده بعد از اینکه متن در آن قرار گیرد چگونه به نظر می&zwnj;رسد و قلم&zwnj;ها و اندازه&zwnj;بندی&zwnj;ها چگونه در نظر گرفته شده&zwnj;است. از آنجایی که طراحان عموما نویسنده متن نیستند و وظیفه رعایت حق تکثیر متون را ندارند و در همان حال کار آنها به نوعی وابسته به متن می&zwnj;باشد آنها با استفاده از محتویات ساختگی، صفحه گرافیکی خود را صفحه&zwnj;آرایی می&zwnj;کنند تا مرحله طراحی و صفحه&zwnj;بندی را به پایان برند.</span></p>
', 20000, N'index.png', CAST(N'2019-06-01T13:57:14.437' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Title], [ShortDescription], [Text], [Price], [ImageName], [CreateDate]) VALUES (3, N'ویراشی-تازه', N'توئضیح مختصررررررررررررررررر', N'<p>توضیح زیاااااااد-خیلی</p>
', 500, N'8675ceb0-3a00-465d-bbbd-0c9ceac0deac.jpg', CAST(N'2019-06-02T10:35:08.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Title], [ShortDescription], [Text], [Price], [ImageName], [CreateDate]) VALUES (4, N'محصووووول--------داریم', N'مختصر-----------مختصر-----------مختصر-----------', N'<p>زیااااااد--------------زیااااااد--------------زیااااااد--------------زیااااااد--------------زیااااااد--------------زیااااااد--------------زیااااااد--------------زیااااااد--------------زیااااااد--------------زیااااااد--------------زیااااااد--------------</p>
', 123456, N'6143d13d-1a2e-440d-9a6b-fbf25d51ad8c.jpg', CAST(N'2019-06-02T10:41:26.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Title], [ShortDescription], [Text], [Price], [ImageName], [CreateDate]) VALUES (5, N'dssdf', N'sdfsdf', N'<p>sdfsdf</p>
', 234234, N'index.png', CAST(N'2019-06-02T10:54:20.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Title], [ShortDescription], [Text], [Price], [ImageName], [CreateDate]) VALUES (6, N'محصول تستdsfsdf', N'sdfsdfsdf', N'<p>China&#39;s retaliatory tariffs on some $60 billion worth of US exports has just officially gone into effect as of 12 p.m. ET.</p>

<p>Beijing said earlier this month that it would increase t<strong>ariffs on roughly $60 billion worth of US goods on June 1, </strong>including American cotton, machinery, grains and ai<strong>rcraft parts.</strong></p>

<p><strong>More than 4,000 items are affected, most of which will carry tariffs of 25% &mdash; up from 10% when they were first levied last September.&nbsp;</strong></p>

<p><strong>Some background: The move follows&nbsp;<a href="https://edition.cnn.com/2019/05/10/business/china-us-tariffs-trade/index.html" style="box-sizing: border-box; color: rgb(48, 97, 243); text-decoration-line: none;" target="_blank">increase</a>&nbsp;in US tariffs on $200 billion worth of Chinese exports from 10% to 25%, which went into effect </strong>May 10. The Trump administration, which has accused China of backtracking on<strong>&nbsp;</strong>previous trade commitments, sought to turn up the pressure on Beijing after months of talks failed to produce a breakthrough.&nbsp;But so far, the tit-for-tat penalties have not pushed Beijing toward a deal.&nbsp;</p>
', 2131233, N'2f7eec48-b5c2-4677-aa8e-eef9dbf9bf7a.jpg', CAST(N'2019-06-02T13:35:26.243' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[Roles] ([RoleID], [RoleTitle], [RoleName]) VALUES (1, N'کاربر عادی', N'user')
INSERT [dbo].[Roles] ([RoleID], [RoleTitle], [RoleName]) VALUES (2, N'مدیر کل سیستم', N'admin')
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [RoleID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (1, 2, N'iman madaeny', N'iman@madaeny.com', N'202CB962AC59075B964B07152D234B70', N'5ed6db8d-e61b-4955-87be-3f26b1ca8239', 1, CAST(N'2018-04-10T14:56:15.333' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (2, 1, N'toplearn', N'barnamenevisanorg@gmail.com', N'202CB962AC59075B964B07152D234B70', N'6cfd48da-a5ef-4eb9-a8f3-2460a5756367', 1, CAST(N'2018-04-12T11:56:17.507' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (3, 1, N'test', N'test@test.com', N'1745', N'6b02b5dc-a2cb-467e-8595-b227ad8b9344', 1, CAST(N'2018-04-16T13:19:58.737' AS DateTime))
INSERT [dbo].[Users] ([UserID], [RoleID], [UserName], [Email], [Password], [ActiveCode], [IsActive], [RegisterDate]) VALUES (4, 2, N'hamedh71', N'hamedhalvaeihh@gmail.com', N'202CB962AC59075B964B07152D234B70', N'ff271725-6191-4923-acd2-b859f7573ebd', 1, CAST(N'2019-05-25T11:40:11.117' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Prodct_Selected_Groups]  WITH CHECK ADD  CONSTRAINT [FK_Prodct_Selected_Groups_Product_Groups] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Product_Groups] ([GroupID])
GO
ALTER TABLE [dbo].[Prodct_Selected_Groups] CHECK CONSTRAINT [FK_Prodct_Selected_Groups_Product_Groups]
GO
ALTER TABLE [dbo].[Prodct_Selected_Groups]  WITH CHECK ADD  CONSTRAINT [FK_Prodct_Selected_Groups_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Prodct_Selected_Groups] CHECK CONSTRAINT [FK_Prodct_Selected_Groups_Products]
GO
ALTER TABLE [dbo].[Product_Comments]  WITH CHECK ADD  CONSTRAINT [FK_Product_Comments_Product_Comments2] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Product_Comments] ([ProductCommentID])
GO
ALTER TABLE [dbo].[Product_Comments] CHECK CONSTRAINT [FK_Product_Comments_Product_Comments2]
GO
ALTER TABLE [dbo].[Product_Comments]  WITH CHECK ADD  CONSTRAINT [FK_Product_Comments_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Product_Comments] CHECK CONSTRAINT [FK_Product_Comments_Products]
GO
ALTER TABLE [dbo].[Product_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Product_Feature_Features] FOREIGN KEY([FeatureID])
REFERENCES [dbo].[Features] ([FeatureID])
GO
ALTER TABLE [dbo].[Product_Feature] CHECK CONSTRAINT [FK_Product_Feature_Features]
GO
ALTER TABLE [dbo].[Product_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Product_Feature_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Product_Feature] CHECK CONSTRAINT [FK_Product_Feature_Products]
GO
ALTER TABLE [dbo].[Product_Galleries]  WITH CHECK ADD  CONSTRAINT [FK_Product_Galleries_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Product_Galleries] CHECK CONSTRAINT [FK_Product_Galleries_Products]
GO
ALTER TABLE [dbo].[Product_Groups]  WITH CHECK ADD  CONSTRAINT [FK_Product_Groups_Product_Groups] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Product_Groups] ([GroupID])
GO
ALTER TABLE [dbo].[Product_Groups] CHECK CONSTRAINT [FK_Product_Groups_Product_Groups]
GO
ALTER TABLE [dbo].[Product_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Product_Tags_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Product_Tags] CHECK CONSTRAINT [FK_Product_Tags_Products]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
