-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: second-hand
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `guaner_comment`
--

DROP TABLE IF EXISTS `guaner_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `guaner_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `reply_to` varchar(64) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd01gnchhuj06oumqxrikccc3r` (`goods_id`),
  KEY `FKswirics8hhydki5ff0emtmbii` (`student_id`),
  CONSTRAINT `FKd01gnchhuj06oumqxrikccc3r` FOREIGN KEY (`goods_id`) REFERENCES `guaner_goods` (`id`),
  CONSTRAINT `FKswirics8hhydki5ff0emtmbii` FOREIGN KEY (`student_id`) REFERENCES `guaner_studnet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guaner_comment`
--

LOCK TABLES `guaner_comment` WRITE;
/*!40000 ALTER TABLE `guaner_comment` DISABLE KEYS */;
INSERT INTO `guaner_comment` VALUES (3,'2020-04-12 21:44:43','2020-04-12 21:44:43','现在还能用嘛？',NULL,12,5),(4,'2020-04-12 21:47:00','2020-04-12 21:47:00','应该有的吧？','猿来入此',12,5),(5,'2020-04-12 22:07:22','2020-04-12 22:07:22','回复：“你好，现在还有货嘛？”\n应该没有了，这个很抢手的呀，你要抓紧才行。','猿来入此',12,5),(6,'2020-04-12 22:08:09','2020-04-12 22:08:09','回复：“你好价格还能优惠点嘛？”<br>这个价格已经很公道了呀。','猿来入此',12,5),(7,'2020-04-12 22:08:57','2020-04-12 22:08:57','回复：“现在还能用嘛？”<br>应该没问题的，这个机子很皮实的。','158549530922',12,5),(8,'2020-04-12 22:11:54','2020-04-12 22:11:54','你好，价格能再优惠吗？',NULL,13,5),(9,'2020-04-12 22:12:59','2020-04-12 22:12:59','回复：“你好，价格能再优惠吗？”<br>亲，这个价格已经很优惠了哦，我这个电脑配置很高的，4g内存 320g硬盘，独立集成双显卡，疫情期间给孩子上网课，看看视频，办公学习都不错，双侧立体声音响，15.6寸大屏幕。','起名字真难',13,3),(10,'2020-04-15 22:32:37','2020-04-15 22:32:37','看上去不错哦！',NULL,31,3);
/*!40000 ALTER TABLE `guaner_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guaner_database_bak`
--

DROP TABLE IF EXISTS `guaner_database_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `guaner_database_bak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `filename` varchar(32) NOT NULL,
  `filepath` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guaner_database_bak`
--

LOCK TABLES `guaner_database_bak` WRITE;
/*!40000 ALTER TABLE `guaner_database_bak` DISABLE KEYS */;
INSERT INTO `guaner_database_bak` VALUES (23,'2020-03-22 19:44:04','2020-03-22 19:44:04','db_boot_base_20200322194404.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(24,'2020-03-22 19:44:09','2020-03-22 19:44:09','db_boot_base_20200322194409.sql','D:/workspace_devloper/baseproject/base/src/main/resources/backup/'),(32,'2021-03-16 10:56:59','2021-03-16 10:56:59','second-hand_20210316105658.sql','E:/baseProject/src/main/resources/backup/');
/*!40000 ALTER TABLE `guaner_database_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guaner_friend_link`
--

DROP TABLE IF EXISTS `guaner_friend_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `guaner_friend_link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(64) NOT NULL,
  `sort` int(11) NOT NULL,
  `url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guaner_friend_link`
--

LOCK TABLES `guaner_friend_link` WRITE;
/*!40000 ALTER TABLE `guaner_friend_link` DISABLE KEYS */;
INSERT INTO `guaner_friend_link` VALUES (11,'2020-04-18 15:49:20','2021-03-04 16:42:07','【百度】',0,'https://www.baidu.com'),(18,'2021-03-04 16:42:49','2021-03-04 16:42:49','【網易163郵箱】',0,'https://mail.163.com/'),(19,'2021-03-04 16:43:10','2021-03-04 16:43:10','GitHub',0,'https://github.com/');
/*!40000 ALTER TABLE `guaner_friend_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guaner_goods`
--

DROP TABLE IF EXISTS `guaner_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `guaner_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `buy_price` float NOT NULL,
  `content` varchar(1024) NOT NULL,
  `flag` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `photo` varchar(128) NOT NULL,
  `recommend` int(11) NOT NULL,
  `sell_price` float NOT NULL,
  `status` int(11) NOT NULL,
  `goods_category_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `view_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjtyl6pmb9j4aj64sm54xi1hbi` (`goods_category_id`),
  KEY `FKf68a0a9u8u8hqckg0ycnjarv6` (`student_id`),
  CONSTRAINT `FKf68a0a9u8u8hqckg0ycnjarv6` FOREIGN KEY (`student_id`) REFERENCES `guaner_studnet` (`id`),
  CONSTRAINT `FKjtyl6pmb9j4aj64sm54xi1hbi` FOREIGN KEY (`goods_category_id`) REFERENCES `guaner_goods_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guaner_goods`
--

LOCK TABLES `guaner_goods` WRITE;
/*!40000 ALTER TABLE `guaner_goods` DISABLE KEYS */;
INSERT INTO `guaner_goods` VALUES (1,'2020-04-06 21:39:29','2020-04-12 15:24:09',128,'猿来入此1.0版本上线于2018年1月12日，现如今已经度过了652个日夜，当初的定位很简单，就是给大家分享站长在学习工作中积累的一些编程开发经验，使得大家能够在学习的道路上少走弯路。 快速掌握学习的方法，编程开发的思想。\r\n\r\n截止目前，猿来入此发布的实战开发教程累计学习人数已超过5万余人，有人赞赏就有人批评，一路走来，猿来入此赢得了不少好评，当然也有很多人痛骂我们、质疑我们，猿来入此的确有很多缺点，但我们相信生活不会拒绝一个想要变好的人，猿来入此正在不断的完善、改进。\r\n\r\n而今，推出猿来入此Beta版，旨在帮助更多更广层次的人，在猿来入此Beat版，你可以有很多个身份，你可以专心学习教程，做一个好学的小猿。也可以施展自己的技能，录制发布自己的教程资源，帮助别人学习的同时自己获得收入。你还可以推荐别的小猿来这里学习，你也有奖励哦！',0,'猿来入此Java开发教程','20200408/1586344264407.png',0,127,1,39,2,35),(5,'2020-04-06 21:54:28','2021-03-09 14:33:52',5888,'手机是iPhone5s，用了两年多，保养的很好，手机屏幕都没有换过，保存很完整的。有意向的请联系我。',0,'八成新iPhone5s现低出售','20200406/1586181213129.jpg',0,588,1,4,2,27),(6,'2020-04-11 15:13:43','2020-04-15 19:20:15',6999,'华硕平板电脑 超薄的 非常漂亮手感好 8寸左右屏幕​‌‌ 大小合适 携带方便 4Ｇ运行内存 64Ｇ储存的 并且可以插内存卡的 看电影 微信 视频 娱乐 游戏都很流畅 使用舒服。机器没拆没修过 全原装的 质量保证。带数据线充电器\r\nPlay Video \r\n联系我时，请说是在猿来入此二手网看到的，谢谢！',0,'华硕P01MA 超薄平板电脑 4+6','20200411/1586589170711.png',1,1698,1,11,2,1),(7,'2020-04-11 15:15:19','2020-04-12 12:40:34',399,'鞋子太多38码到41码9.5新​‌‌ 鞋子太多38码到41码9.5新​‌‌ 鞋子太多38码到41码9.5新​‌‌ 鞋子太多38码到41码9.5新​‌‌ 鞋子太多38码到41码9.5新​‌‌ 鞋子太多38码到41码9.5新​‌‌ 鞋子太多38码到41码9.5新​‌‌ ',1,'耐克正品高帮鞋子一次都没穿过很新的','20200411/1586589269693.png',0,159,2,35,2,0),(8,'2020-04-11 15:25:38','2020-04-11 15:26:06',59,'播讲： 路遥\r\n【原Ｙ版Ｂ音Ｙ频Ｐ，已完结】\r\n所​‌‌有有声均可以先试听，联系我获取\r\n立即添＋徽信：ｌｉｕ１６８８ｂ\r\n加我备注：猿来入此二手网过来的',0,'平凡的世界小说路遥百度云mp3分享在','20200411/1586589915016.png',0,5,1,17,3,1),(9,'2020-04-11 15:28:52','2020-04-11 21:20:01',9999,'二手卡地亚手表山度士大号表径：38.4×51mm ​‌‌9.99新全套自动机械，现货好价，手微同号l52～l077～663l，欢迎垂询。保真不贵，全国直销，无中间商赚差价，专注高端名表交易。本店承诺所售手表2年内可8折回购。\r\n卡地亚山度士大号表径：38.4×51mm \r\n9.99新全套自动机械，现货好价。',0,'二手卡地亚手表山度士大号表径','20200411/1586590067910.jpg',0,3999,1,54,3,2),(10,'2020-04-11 16:55:10','2020-04-16 19:39:20',25,'黑色两个8新苹果7/8 软手机套5元',0,'黑色两个8新苹果7/8 软手机套5元','20200411/1586595290815.jpg',0,5,1,5,3,8),(11,'2020-04-11 16:56:13','2021-03-04 17:30:24',399,'诺基亚的滑盖手机，买的时候一千多，具体什么型号搞不​‌‌清了。没有拆修过，功能一切正常。塞班系统，充电器电池都有到手即用。80元出售不议价。',0,'诺基亚 滑盖手机 另还有个E71 智','20200411/1586595364409.jpg',0,80,1,6,3,3),(12,'2020-04-11 16:57:12','2020-04-15 22:26:42',690,'夏普翻盖机，有太阳能电板辅助，之前一直是​‌‌女生使用，由于很早就使用智能机故一直闲置（为保持状态，开机充电维持正常频度），弃之可惜；机器保守说8成新，待机3-4天，作为备用机或老人机没问题，无拆无修无进水，可以使用移动，联通2G。',0,'夏普翻盖机，有太阳能电板辅助','20200411/1586595414403.jpeg',0,160,1,7,3,45),(13,'2020-04-11 21:05:32','2021-03-04 16:41:40',8999,'公司员工自用的电脑，功能都正常，正常使用痕迹，配置​‌‌​‌‌是i5处理器，4g内存 320g硬盘，独立集成双显卡，疫情期间给孩子上网课，看看视频，办公学习都不错，双侧立体声音响，15.6寸大屏幕，公司员工自用的电脑，不要电源适配器可以少一百元，低价处理了！',0,'macbook pro15寸笔记本','20200411/1586610285979.jpg',0,1599,1,9,3,10),(14,'2020-04-11 21:08:41','2020-04-15 19:19:08',6999,'转让三台一样华牛苹果款i3一体电脑很新，出售100​‌‌​‌‌0元一台，配置如图；CPU;core i3 M380 @2.53GHz,\r\n主板；英特尔H55,\r\n主硬盘；固态；64G,\r\n内存；2G\r\n显示器；MS-0003\r\n注；以上三台i3出售1000元一台，\r\n二台AMD四核一体电脑很新出售1300元一台\r\n配置如图\r\nCPU;AMD A-5000四核\r\n主板；AMD AT3X2\r\n内存；4G，\r\n硬盘；64G主硬盘，\r\n显示器；AMD0006(25.2英寸）\r\n注；二台AMD四核很新出售1300元一台\r\n机器全好，正常使用中，配件齐全，拿回去就可以使用，公司搬家急需处理，没有质量问题\r\n配置如图，欢迎上门看货试机',0,'华牛苹果款i3 四核一体电脑','20200411/1586610506621.jpg',0,1269,1,10,3,7),(15,'2020-04-11 21:12:41','2020-04-11 21:12:41',299,'1.型号：美图耳机原装 线控入耳式音乐耳机 ; \r\n2 处理原因：设备闲置； \r\n3.成色描述：全新；’ \r\n4.包含配件：包装盒齐全； \r\n5.收到货物外观检测期：1天（网页照片均为实物图，商品都是实物图片 由于每个人对成色的理解不一样 所以发布所有物品均以实物图片为准 如收货后对外观有疑议，收货当日申请退款，当日、最迟次日发回） \r\n6.邮费：往返邮费全部由买家承担； \r\n其他说明：都是良心如实描述非诚勿扰！',0,'美图耳机原装 线控入耳式音乐耳机 美','20200411/1586610735654.jpg',0,29,1,16,3,0),(16,'2020-04-11 21:14:03','2020-04-12 22:12:18',8999,'出只惠普i5四核游戏机笔记本电脑,95新，4G内存！ \r\n\r\n当地的自提或者我送过去，外地的全部走担保交易！！！详细的你可以加我微信详聊！ \r\n\r\n出只i5四核游戏机笔记本电脑，可以小刀，大刀的不要来，那些开口就1000，800的对不起各位大神了。还有发货后电话找不到的人的，对不起了，不要拍！我不是专做电脑的，发货贵的要命！！!还有那些加我V信（V信qq871301232）的或者闲鱼私聊的，说帮你留意笔记本的，不要说等我收来了，然后就再也找不到人了！！！ \r\n\r\n笔记本是广州米光工作室出来的机子，这个配置只有几十台而已，这个配置全新价值多少，请自行百度！别问一些比较低的问题，好货只卖给有缘人，我一直都是相信有缘人！！ \r\n\r\n配置如下： \r\nCPU I5 ，4G DDR3（最新款） \r\n独立显卡512 \r\n250g硬盘（够你存多少嘿嘿嘿嘿了，你懂的） \r\n带键盘灯光，蓝牙，光驱，摄像头！！！样样齐全，办公娱乐家用都非常给力！ \r\n14英寸多高大山，重点是超薄，成色非常非常的爆新！！！ \r\nlol,地下城，都可以玩爆，不多，要的赶紧的！！ ',0,'i5四核游戏机笔记本电脑','20200411/1586610811445.jpg',0,1700,1,18,3,1),(17,'2020-04-11 21:15:52','2020-04-12 15:02:27',599,'SONY 索尼 VGP-WKB5IE 经典无线键盘 收藏级，品相不错，只有一点点使用痕迹。具体成色请看图片，实物拍摄。这个型号是索尼的经典设计款，市场上很少见的！键盘使用四姐5号电池供电，键盘上上电量显示。由于本人没有配套的电脑测试所以不能保证链接功能正常。（这需要索尼的主机配合使用）。 \r\n\r\n东西难得！ ',0,'SONY 索尼 经典无线键盘 收藏级','20200411/1586610934287.jpg',0,200,1,19,3,97),(18,'2020-04-11 21:16:58','2020-04-12 11:43:39',580,'全新原装苹果鼠标没有开封，因为买了重复了，官网价格580元，我出500元。',0,'苹果原装鼠标未开封','20200411/1586610997167.jpg',0,500,1,20,3,1),(19,'2020-04-11 21:21:08','2021-03-04 16:15:47',998,'这款产品需要搭配存储使用；有了移动硬盘的各位，可以将移动硬盘连接魔盒，手机装个APP，就可以通过手机上传和下载所以移动硬盘的资料了，电脑装个客户端，也可以通过电脑上传下载，修改移动硬盘的资料。非常方便，相当于一个网盘。而且想分享的就分享，想加密的就加密，谁都看不到。并且是双重备份，就算硬盘坏了，丢了，也能一键恢复哦',0,'1 2T移动硬盘、U盘秒变网盘','20200411/1586611245599.jpg',0,289,1,22,3,2),(20,'2020-04-11 21:22:10','2020-04-16 19:39:29',1980,'MINOX M3 LEICA 数码相机 功能好 带原厂电池一块，没有充电器，可以通过USB口充电，不带卡。只有机器一台。及其制作精美，适合收藏！关于机器参数请自行百度，本店不负责科普！ \r\n\r\n非常难得一见的数码相机。500万像素，可以拍视频。 \r\n\r\nhttps://item.taobao.com/item.htm?spm=a2126o.11854294.0.0.8ea94831d8VrRw&id=614654560447 \r\n不议价！慢出 ',0,'MINOX M3 LEICA 数码相','20200411/1586611303491.jpg',0,920,1,23,3,4),(21,'2020-04-11 21:23:09','2021-03-04 16:15:33',2980,'1.型号要求：艺卓mx191 \r\n2.到手时间/使用时长：2016年12月产 \r\n3.成色描述：95新 \r\n4.器材情况：带配件公司替换品 \r\n5.包含配件：说明书，cd，电源线，数据线 \r\n6.其他说明：可直接微信：Allenfindu.邮费顺丰到付，可小刀。',0,'艺卓MX191显示器','20200411/1586611370203.jpg',0,1980,1,24,3,3),(22,'2020-04-11 21:25:14','2021-03-09 14:27:55',75,'得力安格耐特F11165号PU篮球青少年小学室内外训练篮球耐磨弹性好',0,'得力安格耐特篮球','20200411/1586611479618.jpg',0,57,1,26,3,3),(23,'2020-04-11 21:27:46','2020-04-11 21:27:46',78,'厂家直销儿童足球机缝足球4号5号足球六色可选耐磨足球体育用品',0,'耐磨足球体育用品','20200411/1586611630115.jpg',0,66,1,27,3,0),(24,'2020-04-11 21:30:06','2020-04-16 19:38:47',24,'广羽2号黑鹅毛羽毛球 批发12个装家庭娱乐型球馆训练超耐打羽毛球\r\n跨境属性\r\n跨境包裹重量0.2 kg 单位重量0.2 kg 产品体积 35.0 cm * 7.0 cm * 7.0 cm\r\n品牌	广羽	产品类别	鹅毛球	球头类别	双拼球头\r\n毛片样式	全圆	货号	羽毛球	产地	安徽\r\n加印LOGO	不可以	加工定制	否	规格	12只装\r\n适用场景	乒羽网球运动	颜色	【2号黑鹅毛】	是否跨境货源	否',0,'球馆训练超耐打羽毛球12个','20200411/1586611756004.jpg',0,22,1,28,2,2),(25,'2020-04-11 21:31:27','2021-03-04 16:03:39',37,'【品名】克洛斯威/crossway \r\n【名称】克洛斯威-乒乓球6星拍\r\n【货号】1122带球带拍套带护边贴\r\n【打法分类】攻防兼备型\r\n【底板材质】椴木5层\r\n【厚度】14.5mm\r\n【包套材料】拍包+6个乒乓球+1个护边贴',0,'克洛斯威六星乒乓球拍','20200411/1586611861285.jpg',1,27,1,29,2,2),(26,'2020-04-11 23:58:05','2021-03-04 16:10:39',35,'产品参数：\r\n品牌: 遇上适用年龄: 25-29周岁尺码: S M L XL 2XL 3XL图案: 字母风格: 通勤通勤: 韩版领型: 圆领流行元素: 印花主要颜色: 浅黄色 浅绿色 白色 黑色 酒红色 mystery白色 mystery姜黄 antique白色 antique黑色 WARNING砖红 WARNING白色 星空白色 火烈鸟白色 仙人掌白色 108白色 108黑色 099白色 101白色 Bike白色 another白色 day白色 night黑色 NY白色 sunny白色 GUCCL白色 california姜黄色 鲸鱼白色 化学白色 柠檬姜黄 牛油果绿茶色 山竹梦紫色 西瓜白色 刺绣款红色 刺绣款白色 yushang白色 猫猫和狗子姜黄色 梦紫色 灰色 大红 藕粉 姜黄 砖红 藏青色 孔雀蓝 烟灰色 橡皮粉袖型: 常规货号: YST086图案文化: 经典年份季节: 2020年夏季袖长: 短袖衣长: 常规款服装版型: 宽松销售渠道类型: 纯电商(只在线上销售)材质成分: 棉96% 聚氨酯弹性纤维(氨纶)4%',0,'纯棉白色T恤女短袖夏装','20200411/1586620659982.jpg',1,25,1,31,4,2),(27,'2020-04-11 23:59:22','2020-04-15 19:13:27',69,'产品参数：\r\n品牌: GW/哥维格面料: 罗马布货号: 52-173037弹力: 微弹基础风格: 青春流行上市年份季节: 2017年秋季厚薄: 常规销售渠道类型: 纯电商(只在线上销售)材质成分: 粘胶纤维(粘纤)66.6% 聚酯纤维29.',0,'裤子男春季宽松九分休闲裤','20200411/1586620738132.jpg',1,39,1,32,4,3),(28,'2020-04-12 00:01:34','2020-04-15 19:13:23',235,'品牌: other/其他质地: 尼龙布闭合方式: 拉链图案: 纯色风格: 日韩形状: 竖款方形成色: 全新性别: 男流行元素: 车缝线颜色分类: 浅灰色中号 黑色中号 黑色大号 浅灰色大号 黑色加大版内部结构: 手机袋 电脑插袋有无夹层: 有货号: 0701251361536适用场景: 休闲里料材质: 腈纶肩带样式: 双根适用对象: 青年提拎部件类型: 软把箱包外袋种类: 内贴袋箱包硬度: 软大小: 中防水程度: 防泼水是否有背部缓冲棉: 是容纳电脑尺寸: 14英寸',0,'防水尼龙布双肩包纯色百搭滑面潮男','20200412/1586620860709.png',1,125,1,33,4,0),(29,'2020-04-12 00:03:39','2020-04-18 17:22:03',65,'产品参数：\r\n品牌: 宝缇妃产地: 中国大陆省份: 浙江省地市: 金华市流行元素: 纯色颜色分类: 雨伞-8骨自动-藏蓝 雨伞8骨自动-黑色 雨伞8骨自动-酒红 两用-10骨自动黑胶-藏青色 两用-10骨自动黑胶-藏蓝 两用-10骨自动黑胶-酒红 普通折叠-宝蓝伞布: 黑胶打开方式: 全自动货号: A-123半径: 48cm(含)-53cm(含)伞面涂层: 黑胶上市年份季节: 2020年夏季伞的种类: 晴雨伞适用对象: 成人性别: 男女通用伞杆材质: 不锈钢款式: 三折伞设计使用年限: 5年',0,'全自动商务伞晴雨两用防晒防紫外线','20200412/1586620999408.jpg',1,25,1,34,4,26),(30,'2020-04-12 00:04:51','2021-03-04 16:40:57',56,'品牌: 红依材质: 混合材质适用性别: 女图案: 植物花卉风格: 民族风是否现货: 现货镶嵌材质: 未镶嵌成色: 全新价格区间: 10-19.99元新奇特: 新鲜出炉颜色分类: 【好事连连】',0,'民族风穗子流苏胸针天然玉石珍珠','20200412/1586621065769.jpg',1,25,1,36,4,7),(31,'2020-04-12 00:07:24','2021-03-09 16:55:29',799,'夏威夷小吉他斯达威SDW-UK268\r\n品牌: STARWAY材质: 其他',0,'夏威夷小吉他斯达威SDW-UK268','20200412/1586621219617.jpg',0,499,1,38,4,40),(32,'2020-04-12 13:02:48','2020-04-15 19:18:33',999,'微信公众号粉丝1万多，不想运营了，有需要的请联系我。',0,'微信公众号粉丝1万多','20200412/1586667722030.png',0,888,3,39,3,3);
/*!40000 ALTER TABLE `guaner_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guaner_goods_category`
--

DROP TABLE IF EXISTS `guaner_goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `guaner_goods_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `name` varchar(18) NOT NULL,
  `sort` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKos35mkmw4k5dvi4fi2govg2pa` (`parent_id`),
  CONSTRAINT `FKos35mkmw4k5dvi4fi2govg2pa` FOREIGN KEY (`parent_id`) REFERENCES `guaner_goods_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guaner_goods_category`
--

LOCK TABLES `guaner_goods_category` WRITE;
/*!40000 ALTER TABLE `guaner_goods_category` DISABLE KEYS */;
INSERT INTO `guaner_goods_category` VALUES (1,'2020-04-02 20:20:05','2020-04-02 21:35:15','20200402/1585834512163.png','手机',0,NULL),(4,'2020-04-02 20:26:45','2020-04-02 21:35:54','20200402/1585834542235.png','智能机',1,1),(5,'2020-04-02 21:13:04','2020-04-02 21:36:24','20200402/1585834572308.png','手机配件',2,1),(6,'2020-04-02 21:37:05','2020-04-02 21:37:05','20200402/1585834607924.png','滑盖机',3,1),(7,'2020-04-02 21:37:23','2020-04-02 21:37:23','20200402/1585834633735.png','翻盖机',4,1),(8,'2020-04-02 21:37:50','2020-04-02 21:37:50','20200402/1585834662625.png','电脑',5,NULL),(9,'2020-04-02 21:38:08','2020-04-02 21:38:08','20200402/1585834679788.png','笔记本',6,8),(10,'2020-04-02 21:38:26','2020-04-02 21:38:26','20200402/1585834694895.png','台式机',7,8),(11,'2020-04-02 21:38:45','2020-04-02 21:38:45','20200402/1585834717184.png','平板',8,8),(15,'2020-04-05 18:46:54','2020-04-05 19:07:07','20200405/1586084764264.png','影音娱乐',9,NULL),(16,'2020-04-05 19:06:56','2020-04-05 19:07:20','20200405/1586084805468.png','耳机',10,15),(17,'2020-04-05 19:07:45','2020-04-05 19:07:45','20200405/1586084854001.png','MP3/MP4',11,15),(18,'2020-04-05 19:08:15','2020-04-05 19:08:15','20200405/1586084878657.png','游戏机',12,15),(19,'2020-04-05 19:08:44','2020-04-05 19:08:44','20200405/1586084911580.png','键盘',13,15),(20,'2020-04-05 19:09:04','2020-04-05 19:09:04','20200405/1586084936056.png','鼠标',14,15),(21,'2020-04-05 19:10:14','2020-04-05 19:10:14','20200405/1586085005899.png','数码配件',15,NULL),(22,'2020-04-05 19:10:45','2020-04-05 19:10:45','20200405/1586085024716.png','移动硬盘',16,21),(23,'2020-04-05 19:11:08','2020-04-05 19:11:08','20200405/1586085052292.png','相机',17,21),(24,'2020-04-05 19:11:25','2020-04-05 19:11:25','20200405/1586085077518.png','显示器',18,21),(25,'2020-04-05 19:11:50','2020-04-05 19:11:50','20200405/1586085102042.png','运动健身',19,NULL),(26,'2020-04-05 19:12:13','2020-04-05 19:12:13','20200405/1586085124703.png','篮球',20,25),(27,'2020-04-05 19:12:34','2020-04-05 19:12:34','20200405/1586085152812.png','足球',21,25),(28,'2020-04-05 19:12:53','2020-04-05 19:12:53','20200405/1586085164372.png','羽毛球',22,25),(29,'2020-04-05 19:13:11','2020-04-05 19:13:11','20200405/1586085182130.png','球拍',23,25),(30,'2020-04-05 19:13:50','2020-04-05 19:13:50','20200405/1586085217886.png','衣物鞋帽',24,NULL),(31,'2020-04-05 19:14:15','2020-04-05 19:14:15','20200405/1586085239138.png','上衣',25,30),(32,'2020-04-05 19:14:30','2020-04-05 19:14:30','20200405/1586085262037.png','裤子',26,30),(33,'2020-04-05 19:14:48','2020-04-05 19:14:48','20200405/1586085278533.png','背包',27,30),(34,'2020-04-05 19:15:12','2020-04-05 19:15:12','20200405/1586085302412.png','雨伞',28,30),(35,'2020-04-05 19:15:29','2020-04-05 19:15:29','20200405/1586085319791.png','鞋子',29,30),(36,'2020-04-05 19:15:55','2020-04-05 19:15:55','20200405/1586085349204.png','配饰',30,30),(37,'2020-04-05 19:16:38','2020-04-05 19:16:38','20200405/1586085388834.png','生活娱乐',31,NULL),(38,'2020-04-05 19:17:05','2020-04-05 19:17:05','20200405/1586085407122.png','乐器',32,37),(39,'2020-04-05 19:17:22','2020-04-05 19:17:22','20200405/1586085433434.png','虚拟账号',33,37),(40,'2020-04-05 19:17:39','2020-04-05 19:17:39','20200405/1586085449303.png','会员卡',34,37),(41,'2020-04-05 19:18:00','2020-04-05 19:18:00','20200405/1586085471766.png','化妆品',35,37),(42,'2020-04-05 19:18:31','2020-04-05 19:18:31','20200405/1586085499095.png','图书教材',36,NULL),(43,'2020-04-05 19:18:49','2020-04-05 19:18:49','20200405/1586085520436.png','教材',37,42),(44,'2020-04-05 19:19:05','2020-04-05 19:19:05','20200405/1586085534371.png','考研材料',38,42),(45,'2020-04-05 19:19:24','2020-04-05 19:19:24','20200405/1586085556673.png','课外书',39,42),(46,'2020-04-05 19:19:54','2020-04-05 19:19:54','20200405/1586085585909.png','交通出行',40,NULL),(47,'2020-04-05 19:20:18','2020-04-05 19:20:18','20200405/1586085604095.png','自行车',41,46),(48,'2020-04-05 19:20:35','2020-04-05 19:20:35','20200405/1586085624951.png','电动车',42,46),(49,'2020-04-05 19:21:01','2020-04-05 19:21:01','20200405/1586085652162.png','交通卡',43,46),(50,'2020-04-05 19:21:29','2020-04-05 19:21:29','20200405/1586085681117.png','个人技能',44,NULL),(51,'2020-04-05 19:21:47','2020-04-05 19:21:47','20200405/1586085696883.png','摄影',45,50),(52,'2020-04-05 19:22:05','2020-04-05 19:22:05','20200405/1586085714915.png','绘画',46,50),(53,'2020-04-05 19:22:29','2020-04-05 19:22:29','20200405/1586085739125.png','其他',46,NULL),(54,'2020-04-11 21:19:25','2020-04-11 21:19:40','20200411/1586611155253.png','手表',47,21),(55,'2020-04-12 22:31:58','2020-04-12 22:32:08','20200412/1586701902327.png','其他小类',48,53);
/*!40000 ALTER TABLE `guaner_goods_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guaner_menu`
--

DROP TABLE IF EXISTS `guaner_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `guaner_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `is_bitton` bit(1) NOT NULL,
  `is_show` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsbtnjocfrq29e8taxdwo21gic` (`parent_id`),
  CONSTRAINT `FKsbtnjocfrq29e8taxdwo21gic` FOREIGN KEY (`parent_id`) REFERENCES `guaner_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guaner_menu`
--

LOCK TABLES `guaner_menu` WRITE;
/*!40000 ALTER TABLE `guaner_menu` DISABLE KEYS */;
INSERT INTO `guaner_menu` VALUES (2,'2020-03-14 14:26:03','2020-03-14 18:24:53','系统设置','','mdi-settings',0,NULL,_binary '\0',_binary ''),(3,'2020-03-14 16:58:55','2020-03-14 18:26:02','菜单管理','/admin/menu/list','mdi-view-list',1,2,_binary '\0',_binary ''),(5,'2020-03-14 17:04:44','2020-03-14 18:27:53','新增','/admin/menu/add','mdi-plus',2,3,_binary '\0',_binary ''),(7,'2020-03-14 17:07:43','2020-03-15 12:11:25','角色管理','/admin/role/list','mdi-account-settings-variant',5,2,_binary '\0',_binary ''),(8,'2020-03-14 18:28:48','2020-03-21 22:04:45','编辑','edit(\'/admin/menu/edit\')','mdi-grease-pencil',3,3,_binary '',_binary ''),(9,'2020-03-14 18:30:00','2020-03-21 22:08:20','删除','del(\'/admin/menu/delete\')','mdi-close',4,3,_binary '',_binary ''),(10,'2020-03-15 12:12:00','2020-03-15 12:12:00','添加','/admin/role/add','mdi-account-plus',6,7,_binary '\0',_binary ''),(11,'2020-03-15 12:12:36','2020-03-21 22:10:45','编辑','edit(\'/admin/role/edit\')','mdi-account-edit',7,7,_binary '',_binary ''),(12,'2020-03-15 12:13:19','2020-03-21 22:15:27','删除','del(\'/admin/role/delete\')','mdi-account-remove',8,7,_binary '',_binary ''),(13,'2020-03-15 12:14:52','2020-03-15 12:17:00','用户管理','/admin/user/list','mdi-account-multiple',9,2,_binary '\0',_binary ''),(14,'2020-03-15 12:15:22','2020-03-15 12:17:27','添加','/admin/user/add','mdi-account-plus',10,13,_binary '\0',_binary ''),(15,'2020-03-16 17:18:14','2020-03-21 22:11:19','编辑','edit(\'/admin/user/edit\')','mdi-account-edit',11,13,_binary '',_binary ''),(16,'2020-03-16 17:19:01','2020-03-21 22:15:36','删除','del(\'/admin/user/delete\')','mdi-account-remove',12,13,_binary '',_binary ''),(19,'2020-03-22 11:24:36','2020-03-22 11:26:00','上传图片','/admin/upload/upload_photo','mdi-arrow-up-bold-circle',0,13,_binary '\0',_binary '\0'),(20,'2020-03-22 14:09:35','2020-03-22 14:09:47','日志管理','/system/operator_log_list','mdi-tag-multiple',13,2,_binary '\0',_binary ''),(21,'2020-03-22 14:11:39','2020-03-22 14:11:39','删除','del(\'/system/delete_operator_log\')','mdi-tag-remove',14,20,_binary '',_binary ''),(22,'2020-03-22 14:12:57','2020-03-22 14:46:55','清空日志','delAll(\'/system/delete_all_operator_log\')','mdi-delete-circle',15,20,_binary '',_binary ''),(23,'2020-03-22 14:46:40','2020-03-22 14:47:09','数据备份','/admin/database_bak/list','mdi-database',16,2,_binary '\0',_binary ''),(24,'2020-03-22 14:48:07','2020-03-22 15:13:41','备份','add(\'/admin/database_bak/add\')','mdi-database-plus',17,23,_binary '',_binary ''),(25,'2020-03-22 14:49:03','2020-03-22 14:49:03','删除','del(\'/admin/database_bak/delete\')','mdi-database-minus',18,23,_binary '',_binary ''),(26,'2020-03-22 19:36:20','2020-03-22 19:36:20','还原','restore(\'/admin/database_bak/restore\')','mdi-database-minus',19,23,_binary '',_binary ''),(27,'2020-04-01 20:35:09','2020-04-01 20:35:09','物品管理','/admin/goods_category/list','mdi-dialpad',0,NULL,_binary '\0',_binary ''),(28,'2020-04-01 20:35:46','2020-04-12 22:28:09','分类管理','/admin/goods_category/list','mdi-apps',0,27,_binary '\0',_binary ''),(29,'2020-04-01 20:36:27','2020-04-12 22:30:39','物品管理','/admin/goods/list','mdi-cart',0,27,_binary '\0',_binary ''),(30,'2020-04-01 20:40:48','2020-04-12 22:28:34','添加','/admin/goods_category/add','mdi-battery-positive',0,28,_binary '\0',_binary ''),(31,'2020-04-01 20:41:33','2020-04-12 22:30:02','编辑','edit(\'/admin/goods_category/edit\')','mdi-border-color',0,28,_binary '',_binary ''),(32,'2020-04-01 20:42:15','2020-04-12 22:30:21','删除','del(\'/admin/goods_category/delete\')','mdi-close',0,28,_binary '',_binary ''),(33,'2020-04-13 18:52:12','2020-04-13 18:52:12','上架','up(\'/admin/goods/up_down\')','mdi-arrow-up-bold-box',0,29,_binary '',_binary ''),(34,'2020-04-13 18:52:55','2020-04-13 18:52:55','下架','down(\'/admin/goods/up_down\')','mdi-arrow-down-bold-box',0,29,_binary '',_binary ''),(35,'2020-04-13 18:54:10','2020-04-15 19:17:48','删除','del(\'/admin/goods/delete\')','mdi-close-box',0,29,_binary '',_binary ''),(36,'2020-04-15 19:06:49','2020-04-15 19:06:49','推荐','recommend(\'/admin/goods/recommend\')','mdi-thumb-up',0,29,_binary '',_binary ''),(37,'2020-04-15 19:07:45','2020-04-15 19:07:45','取消推荐','unrecommend(\'/admin/goods/recommend\')','mdi-thumb-down',0,29,_binary '',_binary ''),(38,'2020-04-15 19:32:16','2020-04-15 19:32:16','求购物品','/admin/wanted_goods/list','mdi-ticket',0,27,_binary '\0',_binary ''),(39,'2020-04-15 19:32:55','2020-04-15 19:59:53','删除','del(\'/admin/wanted_goods/delete\')','mdi-close-box',0,38,_binary '',_binary ''),(40,'2020-04-15 20:02:04','2020-04-15 20:02:04','学生管理','/admin/student/list','mdi-account-multiple',0,NULL,_binary '\0',_binary ''),(41,'2020-04-15 20:02:38','2020-04-15 20:02:38','学生列表','/admin/student/list','mdi-account-multiple',0,40,_binary '\0',_binary ''),(42,'2020-04-15 20:06:28','2020-04-15 20:06:28','冻结','freeze(\'/admin/student/update_status\')','mdi-account-settings-variant',0,41,_binary '',_binary ''),(43,'2020-04-15 20:06:59','2020-04-15 21:45:31','激活','openStudent(\'/admin/student/update_status\')','mdi-account-key',0,41,_binary '',_binary ''),(44,'2020-04-15 20:07:33','2020-04-15 20:07:33','删除','del(\'/admin/student/delete\')','mdi-account-remove',0,41,_binary '',_binary ''),(45,'2020-04-15 21:52:57','2020-04-15 21:52:57','评论管理','/admin/comment/list','mdi-comment-account',0,NULL,_binary '\0',_binary ''),(46,'2020-04-15 21:53:39','2020-04-15 21:53:39','评论列表','/admin/comment/list','mdi-comment-multiple-outline',0,45,_binary '\0',_binary ''),(47,'2020-04-15 21:54:35','2020-04-15 21:54:35','删除','del(\'/admin/comment/delete\')','mdi-message-bulleted-off',0,46,_binary '',_binary ''),(48,'2020-04-16 19:28:48','2020-04-16 19:28:48','举报管理','/admin/report/list','mdi-alert',0,NULL,_binary '\0',_binary ''),(49,'2020-04-16 19:30:31','2020-04-16 19:30:31','举报列表','/admin/report/list','mdi-view-headline',0,48,_binary '\0',_binary ''),(50,'2020-04-16 19:31:09','2020-04-16 19:31:09','删除','del(\'/admin/report/delete\')','mdi-close-box',0,49,_binary '',_binary ''),(51,'2020-04-16 19:46:08','2020-04-16 19:46:08','新闻公告','/admin/news/list','mdi-onenote',0,NULL,_binary '\0',_binary ''),(52,'2020-04-16 19:46:39','2020-04-16 19:46:39','公告列表','/admin/news/list','mdi-book-open',0,51,_binary '\0',_binary ''),(53,'2020-04-16 19:48:01','2020-04-16 19:48:01','添加','/admin/news/add','mdi-plus',0,52,_binary '\0',_binary ''),(54,'2020-04-16 19:48:46','2020-04-16 19:48:46','编辑','edit(\'/admin/news/edit\')','mdi-border-color',0,52,_binary '',_binary ''),(55,'2020-04-16 19:49:37','2020-04-16 19:49:37','删除','del(\'/admin/news/delete\')','mdi-close',0,52,_binary '',_binary ''),(56,'2020-04-18 14:25:58','2020-04-18 14:25:58','网站设置','','mdi-settings',0,NULL,_binary '\0',_binary ''),(57,'2020-04-18 14:27:31','2020-04-18 14:27:31','友情链接','/admin/friend_link/list','mdi-vector-line',0,56,_binary '\0',_binary ''),(58,'2020-04-18 14:28:36','2020-04-18 14:28:36','添加','/admin/friend_link/add','mdi-plus',0,57,_binary '\0',_binary ''),(59,'2020-04-18 14:29:17','2020-04-18 15:38:53','编辑','edit(\'/admin/friend_link/edit\')','mdi-border-color',0,57,_binary '',_binary ''),(60,'2020-04-18 14:29:45','2020-04-18 14:29:45','删除','del(\'/admin/friend_link/delete\')','mdi-close-box',0,57,_binary '',_binary ''),(61,'2020-04-18 16:26:45','2020-04-18 16:26:45','站点设置','/admin/site_setting/setting','mdi-wrench',0,56,_binary '\0',_binary ''),(62,'2020-04-18 16:28:25','2020-04-18 16:28:25','提交修改','/admin/site_setting/save_setting','mdi-marker-check',0,61,_binary '',_binary '\0');
/*!40000 ALTER TABLE `guaner_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guaner_news`
--

DROP TABLE IF EXISTS `guaner_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `guaner_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(10024) NOT NULL,
  `sort` int(11) NOT NULL,
  `title` varchar(1024) NOT NULL,
  `view_number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guaner_news`
--

LOCK TABLES `guaner_news` WRITE;
/*!40000 ALTER TABLE `guaner_news` DISABLE KEYS */;
INSERT INTO `guaner_news` VALUES (1,'2020-04-16 21:29:17','2020-04-16 21:54:38','猿来入此校园二手市场平台，配备了详细的视频开发教程。猿来入此网址：https://www.yuanlrc.com/',2,'关于猿来入此校园二手市场平台',1),(2,'2020-04-16 21:29:49','2020-04-16 21:54:41','1.禁止和限制发布物品管理规则\r\n2.重复铺货商品管理规则\r\n3.支付方式不符商品管理规则\r\n4.商品价格、邮费不符商品管理规则\r\n5.信用炒作商品管理规则',0,'猿来入此校园二手市场发布商品规则',4),(3,'2020-04-16 21:30:22','2020-04-16 21:54:35','注册时请填写详细的注册信息，学号为必填项。',1,'猿来入此校园二手市场账号注册规则',1);
/*!40000 ALTER TABLE `guaner_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guaner_operater_log`
--

DROP TABLE IF EXISTS `guaner_operater_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `guaner_operater_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `operator` varchar(18) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guaner_operater_log`
--

LOCK TABLES `guaner_operater_log` WRITE;
/*!40000 ALTER TABLE `guaner_operater_log` DISABLE KEYS */;
INSERT INTO `guaner_operater_log` VALUES (411,'2021-03-16 10:56:59','2021-03-16 10:56:59','数据库成功备份，备份文件信息：DatabaseBak [filename=second-hand_20210316105658.sql, filepath=E:/baseProject/src/main/resources/backup/]','guaner');
/*!40000 ALTER TABLE `guaner_operater_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guaner_report_goods`
--

DROP TABLE IF EXISTS `guaner_report_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `guaner_report_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6g0s4688rq2bnty1u1ev1rgly` (`goods_id`),
  KEY `FKmr7s3q3jpq824h69f5ip9gleq` (`student_id`),
  CONSTRAINT `FK6g0s4688rq2bnty1u1ev1rgly` FOREIGN KEY (`goods_id`) REFERENCES `guaner_goods` (`id`),
  CONSTRAINT `FKmr7s3q3jpq824h69f5ip9gleq` FOREIGN KEY (`student_id`) REFERENCES `guaner_studnet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guaner_report_goods`
--

LOCK TABLES `guaner_report_goods` WRITE;
/*!40000 ALTER TABLE `guaner_report_goods` DISABLE KEYS */;
INSERT INTO `guaner_report_goods` VALUES (5,'2020-04-12 12:00:49','2020-04-12 12:00:49','涉嫌广告传销！',20,2);
/*!40000 ALTER TABLE `guaner_report_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guaner_role`
--

DROP TABLE IF EXISTS `guaner_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `guaner_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(18) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guaner_role`
--

LOCK TABLES `guaner_role` WRITE;
/*!40000 ALTER TABLE `guaner_role` DISABLE KEYS */;
INSERT INTO `guaner_role` VALUES (1,'2020-03-15 13:16:38','2020-04-18 16:28:37','超级管理员','超级管理员拥有最高权限。',1),(2,'2020-03-15 13:18:57','2020-03-21 22:18:43','普通管理员','普通管理员只有部分权限',1),(4,'2020-03-21 20:11:00','2020-03-23 17:49:00','测试角色','sadsa',0);
/*!40000 ALTER TABLE `guaner_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guaner_role_authorities`
--

DROP TABLE IF EXISTS `guaner_role_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `guaner_role_authorities` (
  `role_id` bigint(20) NOT NULL,
  `authorities_id` bigint(20) NOT NULL,
  KEY `FKhj7ap1o1cjrl7enr9arf5f2qp` (`authorities_id`),
  KEY `FKg3xdaexmr0x1qx8omhvjtk46d` (`role_id`),
  CONSTRAINT `FKg3xdaexmr0x1qx8omhvjtk46d` FOREIGN KEY (`role_id`) REFERENCES `guaner_role` (`id`),
  CONSTRAINT `FKhj7ap1o1cjrl7enr9arf5f2qp` FOREIGN KEY (`authorities_id`) REFERENCES `guaner_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guaner_role_authorities`
--

LOCK TABLES `guaner_role_authorities` WRITE;
/*!40000 ALTER TABLE `guaner_role_authorities` DISABLE KEYS */;
INSERT INTO `guaner_role_authorities` VALUES (2,2),(2,3),(2,5),(2,7),(2,11),(2,13),(2,16),(4,2),(4,13),(4,15),(1,2),(1,3),(1,5),(1,8),(1,9),(1,7),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,30),(1,31),(1,32),(1,29),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62);
/*!40000 ALTER TABLE `guaner_role_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guaner_site_setting`
--

DROP TABLE IF EXISTS `guaner_site_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `guaner_site_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `all_rights` varchar(256) NOT NULL,
  `logo_1` varchar(256) NOT NULL,
  `logo_2` varchar(256) NOT NULL,
  `qrcode` varchar(256) NOT NULL,
  `site_name` varchar(128) NOT NULL,
  `site_url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guaner_site_setting`
--

LOCK TABLES `guaner_site_setting` WRITE;
/*!40000 ALTER TABLE `guaner_site_setting` DISABLE KEYS */;
INSERT INTO `guaner_site_setting` VALUES (1,'2020-04-18 17:02:17','2021-03-04 16:52:32','©2020-2021【GuanEr】 版权所有','20210304/1614847515515.jpg','20210304/1614847949464.png','20210304/1614847531485.png','[SIAS]校园二手市场','www.GuanEr.com');
/*!40000 ALTER TABLE `guaner_site_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guaner_studnet`
--

DROP TABLE IF EXISTS `guaner_studnet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `guaner_studnet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `academy` varchar(18) DEFAULT NULL,
  `grade` varchar(18) DEFAULT NULL,
  `mobile` varchar(18) DEFAULT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `qq` varchar(18) DEFAULT NULL,
  `school` varchar(18) DEFAULT NULL,
  `sn` varchar(18) NOT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `password` varchar(18) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5se32pxcytmbwgepjrjrdmvjr` (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guaner_studnet`
--

LOCK TABLES `guaner_studnet` WRITE;
/*!40000 ALTER TABLE `guaner_studnet` DISABLE KEYS */;
INSERT INTO `guaner_studnet` VALUES (2,'2020-04-06 12:52:02','2020-04-18 18:05:56','计算机科学与技术学院','软件1102','13656565656','猿来入此','11221232132','东华大学','158549530920','20200406/1586162585279.jpg',1,'111111'),(3,'2020-04-11 15:20:12','2020-04-11 15:23:29','计算机与科学技术学院','计算机1103','13946598956','小猪爱佩琪','11956256','清华大学','158549530921','20200411/1586589655027.jpg',1,'111111'),(4,'2020-04-11 23:35:40','2020-04-15 21:48:47','材料学院','材料1104','13656569456','会飞的小乌龟','1658555644','同济大学','158540174522','20200411/1586619722105.png',1,'111111'),(5,'2020-04-12 20:58:29','2020-04-15 21:46:39','材料学院','材料2011级','13656565656','起名字真难','1122123213','上海交通大学','158549530922','20200412/1586700613292.png',1,'111111'),(6,'2021-03-08 15:53:35','2021-03-08 15:53:35',NULL,NULL,NULL,NULL,'123456',NULL,'201932514022',NULL,1,'123456'),(7,'2021-03-08 16:07:56','2021-03-08 16:07:56',NULL,NULL,NULL,NULL,'241594',NULL,'201932514021',NULL,1,'123456'),(9,'2021-03-08 16:12:25','2021-03-08 16:12:25',NULL,NULL,NULL,NULL,'123456',NULL,'201932514020',NULL,1,'123456'),(10,'2021-03-08 16:14:04','2021-03-08 16:14:04',NULL,NULL,NULL,NULL,'123456',NULL,'201932514019',NULL,1,'123456'),(11,'2021-03-08 16:21:54','2021-03-08 16:21:54',NULL,NULL,NULL,NULL,'123456',NULL,'201932514018',NULL,1,'123456');
/*!40000 ALTER TABLE `guaner_studnet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guaner_user`
--

DROP TABLE IF EXISTS `guaner_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `guaner_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `head_pic` varchar(128) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(18) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_btsosjytrl4hu7fnm1intcpo8` (`username`),
  KEY `FKg09b8o67eu61st68rv6nk8npj` (`role_id`),
  CONSTRAINT `FKg09b8o67eu61st68rv6nk8npj` FOREIGN KEY (`role_id`) REFERENCES `guaner_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guaner_user`
--

LOCK TABLES `guaner_user` WRITE;
/*!40000 ALTER TABLE `guaner_user` DISABLE KEYS */;
INSERT INTO `guaner_user` VALUES (1,'2020-03-18 19:18:53','2020-03-22 12:43:54','ylrc@qq.com','20200322/1584850135123.jpg','13356565656','123456',1,1,'1111',1),(2,'2020-03-18 19:20:36','2020-03-21 22:18:55','llq@qq.com','20200318/1584530412075.jpg','13918655656','123456',1,1,'测试账号',2),(5,'2020-03-20 20:42:19','2020-03-23 17:50:19','yw@qq.com','20200323/1584956702094.png','13356565656','123456',1,1,'小刘同志',4),(7,'2020-03-30 22:59:02','2020-03-30 22:59:02','llq@qq.com','20200330/1585580308721.jpg','13656565656','123456',1,1,'张三同志',2),(8,'2021-03-09 16:52:09','2021-03-09 16:52:09','','20210309/1615279909477.jpg','','123456',1,1,'guaner',1);
/*!40000 ALTER TABLE `guaner_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guaner_wanted_goods`
--

DROP TABLE IF EXISTS `guaner_wanted_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `guaner_wanted_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `content` varchar(1024) NOT NULL,
  `name` varchar(32) NOT NULL,
  `sell_price` float NOT NULL,
  `trade_place` varchar(128) NOT NULL,
  `view_number` int(11) NOT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqvrfd43yhp11er38hkfcxi103` (`student_id`),
  CONSTRAINT `FKqvrfd43yhp11er38hkfcxi103` FOREIGN KEY (`student_id`) REFERENCES `guaner_studnet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guaner_wanted_goods`
--

LOCK TABLES `guaner_wanted_goods` WRITE;
/*!40000 ALTER TABLE `guaner_wanted_goods` DISABLE KEYS */;
INSERT INTO `guaner_wanted_goods` VALUES (1,'2020-04-11 18:00:07','2020-04-11 22:57:47','想买iphoneX 256G的，有没有人需要出售的呢？有愿意卖的请联系我。','想买iphoneX 256G的，有吗',899,'男生宿舍楼17号宿舍楼',0,3),(4,'2020-04-11 23:29:32','2020-04-11 23:29:32','本人想买一个mac book pro，有没有人愿意卖的，有的话请联系我的QQ！','想买一个mac book pro',5999,'东华大学北门',0,3),(5,'2020-04-11 23:31:01','2020-04-11 23:31:01','有没有快要毕业的学长想卖掉自己自行车的，本人自行车骑了没两天就被偷了，想买个二手的来骑，有愿意卖的请联系我QQ！','有没有学长想卖自行车？',98,'文汇路300弄',0,2),(6,'2020-04-11 23:34:43','2020-04-11 23:34:43','本人笔记本电脑太卡了，想买一个配置比较高的笔记本电脑，有意者请联系我。','想买一个笔记本电脑',2699,'17号宿舍楼',0,2),(7,'2020-04-11 23:37:18','2020-04-11 23:37:18','有人愿意卖自己的球拍嘛？最好是一副，有的请联系我！','有没有人手上有羽毛球拍要出售的？',55,'同济大学嘉定小区北门',0,4);
/*!40000 ALTER TABLE `guaner_wanted_goods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-16 10:57:05
