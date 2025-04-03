/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.28-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: souhaila_shop
-- ------------------------------------------------------
-- Server version	10.5.28-MariaDB-0+deb11u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `add_product_history`
--

DROP TABLE IF EXISTS `add_product_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `add_product_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `qte` int(11) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_EDEB7BDE4584665A` (`product_id`),
  CONSTRAINT `FK_EDEB7BDE4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_product_history`
--

LOCK TABLES `add_product_history` WRITE;
/*!40000 ALTER TABLE `add_product_history` DISABLE KEYS */;
INSERT INTO `add_product_history` VALUES (1,51,4,'2025-03-14 16:17:56'),(2,28,1,'2025-03-27 12:40:25'),(3,29,12,'2025-03-27 12:40:39'),(4,30,10,'2025-03-27 12:41:48'),(5,31,3,'2025-03-27 12:43:40'),(6,32,18,'2025-03-27 12:45:53'),(7,31,2,'2025-03-27 13:53:49'),(8,31,5,'2025-03-27 13:53:57'),(9,52,2,'2025-03-28 11:42:56');
/*!40000 ALTER TABLE `add_product_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_64C19C15E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (25,'Accessoires'),(22,'Lèvres'),(23,'Visage/Teint'),(24,'Yeux');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `shipping_cost` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20250403114425','2025-04-03 11:44:31',605);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

LOCK TABLES `messenger_messages` WRITE;
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `pay_on_delivery` tinyint(1) NOT NULL,
  `total_price` double NOT NULL,
  `is_completed` tinyint(1) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `is_payment_completed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F52993988BAC62AF` (`city_id`),
  CONSTRAINT `FK_F52993988BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qte` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5242B8EBA35F2858` (`_order_id`),
  KEY `IDX_5242B8EB4584665A` (`product_id`),
  CONSTRAINT `FK_5242B8EB4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK_5242B8EBA35F2858` FOREIGN KEY (`_order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D34A04AD5E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (28,'Easy Bake Loose Baking & Setting Powder - Poudre Libre','Même formule, nouveau look. Vous pouvez recevoir l\'ancien ou le nouvel emballage, les deux contiennent la même poudre iconique. Produit phare d\'Huda Beauty, la poudre libre Easy Bake est le secret d\'un look impeccable. Pour Huda, Easy Bake est l\'étape ultime d\'un maquillage sans faille qui tient jusqu\'à 10 heures. Grâce à des pigments ultra-raffinés, cette poudre libre a une texture légère et soyeuse, non comédogène, qui offre un éclat subtil à la peau. Un soupçon d\'Easy Bake dépose un voile translucide au fini mat sur la peau pour contrôler la brillance, corriger les zones de dépigmentation et mettre en valeur les contours du visage sans se loger dans les ridules ni s\'estomper ! SON ACTION : La texture légère d\'Easy Bake se fond parfaitement avec n\'importe quel produit pour maintenir le maquillage en place sans reflet ; cette poudre libre absorbe la brillance, apporte un fini naturel et tient très longtemps. Parfumée d\'un musc floral et disponible en dix teintes, vous pouvez choisir la nuance assortie à votre fond de teint pour un effet couvrant ou une plus claire pour faire ressortir le contour de l\'œil ! POURQUOI ON L\'ADORE ? - Longue tenue - Fixe le maquillage sur tout le visage - Contrôle la brillance - Corrige le teint - La touche ultime pour un look impeccable INFORMATIONS COMPLÉMENTAIRES : L\'étui astucieux d\'Easy Bake comprend un tamis à poudre unique qui dispense la quantité de produit que vous prélevez avec votre pinceau ou votre éponge. Ainsi, vous avez un contrôle total sur votre look. Huda a créé Easy Bake pour faciliter la touche finale du maquillage. Avec cette poudre libre, fixer le maquillage ne prend que quelques minutes pour en prolonger la tenue toute la journée. Votre routine maquillage est transformée ! POINTS FORTS - 10 heures de couvrance - Non comédogène - Sans parabène - Contient de la vitamine E - Pas de reflet',40,'poudreEasyBake-67d046b63ad94.png',1),(29,'#FAUXFILTER Luminous Matte Liquid Concealer - Anticernes liquide','Un correcteur crémeux et résistant à couvrance modulable moyenne à totale, qui illumine le teint, camoufle les imperfections et épouse la peau pour un fini mat et lumineux toute la journée.\r\n\r\nEnrichi d’huile d’amande douce et de vitamine E pour protéger la peau délicate du dessous de l’œil, ce correcteur polyvalent est doté d’une formule légère et facile à appliquer qui se fond à la peau et offre une tenue et une couvrance irréprochables ! Il dissimule cernes et imperfections, unifie joliment la peau et illumine le dessous de l’œil sans former d’amas ni se loger dans les ridules.\r\n\r\n- Convient à tous les types de peau\r\n- Disponible en 24 teintes pour toutes les carnations et tous les sous-tons\r\n- Pas de reflet\r\n- L’applicateur XL doux épouse le contour de l’œil\r\n- Convient aux personnes véganes, sans parfum, sans alcool, waterproof, résistant à la transpiration et anti-transfert.\r\n- L’étui est composé à 30 % de matériaux PCR et l’emballage extérieur est certifié FSC et recyclable.\r\n\r\n\r\nVegan : Des produits sans ingrédient d’origine animale.',32,'FauxFilterConcealer-67d0471030070.png',12),(30,'Easy Blur Natural Airbrush Foundation - Fond de teint','Mieux qu\'un filtre ! Notre Easy Blur Foundation est un fond de teint filtre léger ultra-fluide et lissant pour un fini naturel et aérien en un geste. Il offre une couvrance moyenne à modulable pour une application facile, imperceptible et sans trace.\r\n\r\nSON ACTION :\r\nCe fond de teint semblable à un sérum est formulé avec 1,5 % de niacinamide pour lisser la peau et de la silice pour atténuer les pores, offrant un fini aérien des plus naturels.\r\n\r\nINFORMATIONS COMPLÉMENTAIRES :\r\nHuda a travaillé sur plus de 100 versions pour créer le fond de teint le plus léger et le plus floutant. La formule d\'Easy Blur est confortable, facile à estomper et à appliquer. Disponible en 29 teintes, pour un teint homogène avec un fini filtré.\r\n\r\nPOURQUOI ON L\'ADORE :\r\n- Infusé avec 1,5 % de niacinamide\r\n- Sans parfum ni alcool\r\n- Non comédogène\r\n- Longue tenu 12 heures\r\n\r\nPOINTS FORTS :\r\n- 95 % des personnes interrogées affirment que ce produit donne à leur peau un fini filtré*.\r\n* Selon un panel de consommateurs indépendants composé de 54 personnes de différents types de peau et carnation.',38,'EasyBlurFoundation-67d0475872df9.png',10),(31,'Blush Filter - Blush liquid','Une touche de couleur avec un fini filtré ! Blush Filter est un blush liquide léger avec des pigments modulables et des microperles fines pour un glow diffus et intense. SON ACTION : L\'obsession d\'Huda ? Un fini impeccable sans filtre ! Grâce à ses pigments qui se fondent harmonieusement à la peau, la formule du Blush Filter est très agréable, longue tenue et offre un fini aérien. INFORMATIONS COMPLÉMENTAIRES : Disponible en 11 teintes qui conviennent à toutes les carnations, Blush Filter est également doté d\'un délicieux parfum de bonbon assorti aux noms des teintes. Notre embout innovant rend l\'application très facile. Il suffit d\'appliquer trois points de blush sur les joues et d\'estomper du bout des doigts pour obtenir un fini multidimensionnel et pigmenté. POURQUOI ON L\'ADORE : • Facile à utiliser • Fini doux et filtré • Modulable et facile à estomper • Léger et fondant sur la peau TEINTES : - Ube Cream - Un lilas électrique rehaussé de doux reflets roses - Cotton Candy – rose pâle - Peach Sorbet - pêche mandarine - Strawberry Cream – rose poudré - Watermelon Pop – brique chaude - Black Cherry - baie brune - Latte: brun rosé - Coco Loco: brun roux - Bubble Gum - Rose tendre coquelicot - Sunset Lychee - Rose corail Intense Guava - Rose électrique',29,'blushFilter-67d0479bc615a.png',10),(32,'Faux Filler - Gloss haute brilliance','Un gloss si brillant qu\'il fait tourner les têtes – vos lèvres attireront toute l\'attention !\r\n\r\nUn gloss nourrissant, pour des lèvres plus brillantes et plus pulpeuses – il lisse et atténue les ridules en comblant les lèvres, sans créer de sensation de picotement, pour qu\'elles apparaissent intensément brillantes et pulpeuses.\r\n\r\nUne formule hydratante qui fond sur les lèvres avec une finition non collante qui réfléchit la lumière comme le verre.\r\n\r\nSON ACTION:\r\n\r\nIl contient des ingrédients qui prennent soin des lèvres comme la vitamine E, et est enrichi de collagène vegan à la couvrance confortable qui hydrate les lèvres. De plus, des cires fondues d\'origine végétale composent une formule riche, qui apporte au gloss une texture onctueuse et une brillance multi-dimensionnelle.\r\n\r\nINFORMATIONS COMPLÉMENTAIRES:\r\n\r\nUn grand applicateur biseauté avec un réservoir innovant retient la quantité optimale de produit pour des lèvres instantanément brillantes. Il s\'accompagne d\'un embout de précision qui permet de dessiner facilement l\'arc de Cupidon pour des lèvres plus charnues.\r\n\r\nIl est disponible en sept teintes universelles, parmi lesquelles une couleur transparente et six teintes épurées faciles à porter allant du nude au rose, pour s\'adapter à tous les goûts et toutes les carnations.\r\n\r\nTEINTES :\r\n\r\n- Glassy\r\n- Bombshell\r\n- Foxy\r\n- Coco\r\n- Honey\r\n- Posh\r\n- Sugar baby\r\n- UUU-Baby\r\n- She Fire\r\n- She Glitzy\r\n- She Flirty\r\n\r\nPOINTS FORTS:\r\n\r\n- Hydratant\r\n- Sensation confortable\r\n- Lèvres plus intenses et pulpeuses',24,'glossFauxFiller-67d047e3ed02b.png',18),(33,'Easy Blur Base de teint lissante sans silicone','Une base de teint ultra-floutante sans silicone, enrichie d\'ingrédients bons pour la peau et facile à utiliser ! Notre Easy Blur Primer contient des polymères floutants qui aident à contrôler instantanément l\'excès de sébum, à lisser le grain de peau et à estomper les pores.\r\n\r\nSON ACTION :\r\nCette base de teint translucide à la texture en gelée rose devient transparente à l\'application et offre un effet rafraîchissant pour une peau éclatante de fraîcheur, prête pour le maquillage.\r\n\r\nPortée seule ou en complément d\'un soin, la base Easy Blur Primer crée un fini vaporeux et doux pour prolonger la tenue du maquillage !\r\n\r\nINFORMATIONS COMPLÉMENTAIRES :\r\nUne formule 100 % sans silicone, enrichie d\'un complexe de glycérine et d\'extrait de chardon-Marie, riche en antioxydants et d\'origine végétale, aide à contrôler le sébum.\r\n\r\nNotre mélange de polymères estompe instantanément les pores et lisse le grain de peau pour une application optimale du maquillage.\r\n\r\nPOURQUOI ON L\'ADORE :\r\n- Effet floutant\r\n- Texture rafraîchissante\r\n- Ingrédients innovants bons pour la peau\r\n- Formule légère\r\n- Longue tenue\r\n\r\nPOINTS FORTS :\r\n- 100% des personnes interrogées affirment que la routine atténue les pores*.\r\n- 100 % déclarent que la base améliore le maquillage*.\r\n- 98 % estiment que la base préserve la fraîcheur de leur maquillage*.\r\n- 90 % affirment que la routine donne à leur peau un fini aérien*.\r\n* D\'après une étude indépendante menée auprès de 48 personnes de tous les sexes, de tous les types de peau et de toutes les carnations, ayant utilisé la base et le fond de teint Easy Blur.',36,'baseEasyBlur-67d0482cb5a49.png',0),(34,'TANTOUR - Crème Effet Poudre Soleil & Contouring','Découvrez la crème bronzante Tantour de Huda Beauty dans une luxueuse formule 2 en 1, une crème contouring au fini poudré.\r\nParticularités :\r\nLa crème teintée Tantour allie ombre et chaleur et vous offre un visage lumineux et un teint mat qui ne ternit pas. Cette formule aux pigments intenses vous permet d\'opter pour un bronzage naturel ou des contours plus prononcés selon l\'effet désiré. Facile à appliquer, sa formule révolutionnaire longue durée résiste aussi bien à l\'eau qu\'à la transpiration.\r\n\r\nDescriptions des teintes :\r\nEssayez les différentes teintes pour obtenir l\'effet désiré ! Pour un éclat et des contours subtils, optez pour une teinte légère. Pour un effet plus saisissant, choisissez une teinte plus intense.\r\n- Fair : une teinte miel neutre, recommandée pour les types de peaux claires.\r\n- Light : une teinte caramel douce, recommandée pour les carnations claires à moyennes.\r\n- Medium : une teinte moka neutre, recommandée pour les carnations moyennes à hâlées.\r\n- Tan : une teinte cacao intense, recommandée pour les peaux hâlées à foncées.\r\n- Rich : une nuance acajou intense, recommandée pour les peaux les plus foncées.',33,'ContouringTantour-67d0486a7382d.png',0),(35,'#FAUXFILTER Luminous Matte - Fond de Teint Liquide Haute Couvrance','Appliquez le nouveau fond de teint Huda Beauty, en version améliorée ! Il offre la même couvrance totale et les mêmes propriétés longue tenue que la formule que vous adorez déjà. Un fond de teint longue tenue avec une application modulable, et un fini mat lumineux, sans parfum !\r\n\r\nPour unifier son teint et son grain de peau, l\'effet filtre naturel offre une couvrance homogène, tout en floutant la texture pour apporter un fini éclatant. Sa formule sans effet matière résiste à toute épreuve et permet au fond de teint d\'être waterproof, anti-transferts, super longue tenue 24 h. De plus il ne fane pas, résiste à la sueur et à l\'humidité, votre nouvel allié make-up ! Quelle que soit la météo, l\'occasion ou la situation, le Faux Filter Huda Beauty Luminous Matte ne vous laissera jamais tomber.\r\n\r\nAvec sa formule inédite et améliorée, c\'est le fond de teint couvrant ultime de la marque Huda !\r\n\r\nCaractéristiques :\r\n- Fond de teint longue tenue 24 h\r\n- Waterproof\r\n- Ne fane pas\r\n- Résiste à la sueur\r\n- Résiste à l\'humidité\r\n- Anti-transferts\r\n- Sans effet masque\r\n- IDÉAL À DUBAI(1) : résiste à l\'humidité et à la sueur, super longue tenue (12 h)\r\n- IDÉAL AU BORD DE LA PISCINE : waterproof, résiste à la sueur, longue tenue (6 h)\r\n- Sans parfum\r\n- Non comédogène\r\n- Non asséchant\r\n- Confortable\r\n- Formule adaptée à tous types de peau\r\n\r\n\r\nVegan : Des produits sans ingrédient d’origine animale.',46,'FondDeTeintMatte-67d048af781b9.png',0),(36,'Matte Power Bullet - Rouge à Lèvres Mat','Le rouge à lèvres mat ultra-pigmenté Power Bullet de Huda Beauty offre une couleur saturée inégalée et un confort absolu.\r\n\r\nLa particularité de ce rouge à lèvres sans transfert est qu\'il est élaboré pour sublimer tous les types de peaux, pour une pigmentation hors pair et un confort absolu. Chaque teinte hyper-pigmentée a été mise au point grâce à une formule sur mesure pour permettre une application intégrale et uniforme. Sa luxueuse texture mate est enrichie à l\'huile d\'amande douce nourrissante pour faciliter l\'application, sans bavure, et procurer hydratation et douceur pour des lèvres plus pulpeuses.\r\n\r\nDescription des teintes :\r\nThe Roses :\r\n- Masquerade : une nuance aubergine saisissante (ton froid)\r\n- Ladies Night : un rouge bordeaux audacieux et percutant (ton chaud)\r\n- Pool Party : un coloris fruits rouges original et singulier (ton froid)\r\n- Graduation Day : un ton rose vintage sublime (ton chaud)\r\n- Pay Day : un rose mauve dynamique (ton froid)\r\n- Third Date : une teinte rose de bois ardente (ton chaud)\r\n- Joyride : un rose poudré captivant (ton froid)\r\n- Interview : un nude pêche majestueux (ton chaud)\r\n\r\nThe Icons :\r\n- Promotion Day : Un rouge cerise flamboyant (ton froid)\r\n- El Cinco De Mayo : Un rouge vif ensoleillé (ton chaud)\r\n- Bachelorette :Un rose magenta intense (ton froid)\r\n- Spring Break :Un rose dynamique séduisant (ton chaud)\r\n- Honeymoon :Un rose audacieux (ton froid)\r\n- Rendez-Vous :Un rose brique profond (ton chaud)\r\n- Staycation :Un nude brun sexy (ton froid)\r\n- Anniversary :Un nude rose pâle élégant (ton chaud)\r\n\r\nThe Throwbacks\r\n- Wedding day: Un rose caramélisé très doux (ton froid)\r\n- First Kiss: Un beau rose brique (ton chaud)\r\n- Dirty Thirty: Un brun pourpre insolent (ton froid)\r\n- Game Night: Un marron chaleureux (ton chaud)\r\n- Girls Trip: Un rose frais naturel (ton froid)\r\n- Prom Night: Un joli rose biscuit (ton chaud)\r\n- Last Night: Un marron chocolaté(ton froid)\r\n- Board Meeting: Une nuance moka épicée (ton chaud)',27,'rougelevrematte-67d048f74d3ee.png',0),(37,'LEGIT LASHES - Mascara Double-embout Volumisant et Allongeant','Le mascara noir mat Legit Lashes de Huda Beauty 2 en 1 agit à double extrémité pour un volume extrême, un galbe spectaculaire et une longueur remarquable sans alourdir les cils. 2 BROSSES. 2 FORMULES. 1 LEGIT MASCARA.\r\n\r\nParticularités :\r\nMascara 2 en 1 à double extrémité : ses formules ultra-noires ont été développées pour apporter de la longueur, lifter et galber vos cils. Le mascara apporte du volume, glisse en douceur sur les cils pour une application uniforme, modulable et sans paquets.\r\n\r\nConçu pour dessiner des cils parfaits, le mascara est doté de 2 brosses et formules sur mesure.\r\nPersonnalisez votre look selon votre humeur : portez chaque formule seule ou associez les deux !\r\n- Un côté Volume : cette formule est dotée de fibres volumatrices légères pour un volume incroyable, sans effet de lourdeur ou de rigidité.\r\n- Un côté Curl & Length (Galbe et Longueur) : la formule contient des cires et fibres adhérentes pour un effet allongeant immédiat avec une brosse incurvée inédite pour booster la longueur, définir et recourber pour des cils plus fins.\r\n\r\nTests consommateurs et en clinique du mascara Huda Beauty :\r\n- Testé ophtalmologiquement\r\n- Convient aux personnes portant des lentilles de contact\r\n- Convient aux yeux sensibles',32,'LEGITLASHES-MascaraDouble-emboutVolumisantetAllongeant-67d0493de3528.png',0),(38,'Duo de houppettes Easy Bake','LE PRODUIT :\r\nParfaites pour l\'application d\'une poudre fixante, nos houppettes numéro 1 sur Internet sont désormais disponibles par paires et forment des duos parfaits ! Ces houppettes de poche sont disponibles en format moyen pour une utilisation rapide et facile partout et en format mini pour plus de précision sur les petites zones !\r\n\r\nSON ACTION :\r\nCes houppettes permettent une application précise de la poudre pour sublimer et fixer le maquillage sur le contour de l\'œil, du nez et des pommettes. La mini houppette est parfaite pour atteindre les zones autour du nez et le coin de l\'œil afin de ne négliger aucun recoin ! Les fibres courtes de ces houppettes permettent de prélever la quantité parfaite de poudre et de faciliter son application.\r\nINFOS COMPLÉMENTAIRES :\r\nMignonnes et pratiques : elles sont munies d\'un ruban permettant de les enfiler au bout des doigts pour apporter la touche finale au maquillage facilement. Les bords astucieusement pointus des houppettes ont des extrémités incurvées, pour atteindre même le coin l\'œil et les coins du nez.\r\nLE COFFRET COMPREND\r\n- 1 houppette triangulaire moyenne\r\n- 1 mini houppette triangulaire',13,'DuodehouppettesEasyBake-67d049889e2a1.png',0),(39,'Life Liner - Eyeliner Waterproof','Un eyeliner ultime avec son embout crayon et liquide 2 en 1. Longue tenue, sans bavure et waterproof, il ne file pas et ne se fane pas. Un eye-liner digne de confiance qui tient, au fini noir mat des plus intenses.\r\n\r\nCaractéristiques :\r\nOffrant une tenue jusqu’à 48 heures, la texture liquide glisse en douceur et sèche rapidement pour révéler un fini noir mat des plus intenses. L’extrémité pointue du pinceau assure une répartition parfaite de la formule et une précision extrême.\r\n\r\nLa formule unique du crayon reste en place jusqu’à 8 heures et garantit un équilibre parfait entre une texture crémeuse qui glisse et une tenue structurée. Vous pouvez ainsi le travailler avec précision et en toute facilité pour un look impeccable.\r\n\r\nD’une ligne fine et discrète à un trait audacieux et spectaculaire, vous pouvez désormais créer une multitude de looks pour tous les regards.\r\n\r\nConseils d’utilisation :\r\nL’eye-liner liquide :\r\n1. Ouvrez l’embout de l’eye-liner liquide et essuyez l’excédent de produit sur le pinceau.\r\n2. Commencez par tracer votre trait du coin externe de l’œil jusqu’à la moitié de la paupière.\r\n3. Poursuivez le trait du coin intérieur de l’œil vers l’extérieur et reliez les deux tracés au milieu de la paupière, en veillant à remplir tout espace.\r\n4. Laisser sécher pendant environ 60 secondes, selon l’épaisseur de la ligne. Plus le tracé est épais, plus il faut de temps pour le faire sécher.\r\n\r\nL’eye-liner crayon :\r\n1. Peaufinez votre maquillage, ou appliquez au ras des cils ou le long de la paupière pour un effet encore plus spectaculaire.\r\n2. Sa formule vous permet de le travailler jusqu’au résultat désiré avant qu’elle ne sèche.',26,'LifeLiner-EyelinerWaterproof-67d049c6de119.png',0),(40,'Lip Contour 2.0 - Crayon à lèvres automatique mat','Le crayon à lèvres Lip Contour 2.0 d\'Huda Beauty au fini velouté et mat, s\'applique sans effort grâce à sa formule ultra-lisse pour définir vos lèvres. Disponible en 12 teintes universelles, ce crayon à lèvres longue tenue permet de dessiner facilement et repulper vos lèvres, sans silicone, tout en offrant un confort optimal !\r\nParticularités :\r\nLe Lip Contour 2.0 tient aussi toute la journée - 9 heures exactement ! Sa formule ultra-pigmentée au fini mat et velouté est waterproof (même à la piscine) et ne bouge pas.\r\n\r\nVotre nouveau crayon à lèvres est également rétractable, ce qui le rend très facile à utiliser, même en déplacement. Et pour les adeptes de précision, il est doté d\'un mini taille-crayon à sa base... parce qu\'il rien de pire que de travailler le contour des lèvres avec un crayon émoussé !\r\n\r\nLa formule\r\nLe crayon est enrichi d\'un complexe nourrissant à base de soja et de réglisse pour gonfler vos lèvres naturellement tout en les gardant souples et confortables.',24,'Lip-Contour-Crayonlevresautomatiquemat-67d04a04e8902.png',0),(41,'Sticky Tack - Colle à faux-cils sans latex','Une colle à cils transparente waterproof et sans latex. Elle sèche rapidement, est recallable et tient toute la journée. L\'applicateur précis en forme de brosse vous permet de déposer une couche fine et uniforme de produit sur la rangée de cils, pour une pose de cils facile, tant pour les novices que pour les pros.\r\n\r\n- Longue tenue\r\n- Testé par des dermatologues\r\n- Testé par des ophtalmologistes\r\n- Sans latex\r\nVegan : Des produits sans ingrédient d’origine animale.',18,'StickyTack-Collefaux-cilssanslatex-67d04a4d5fbf4.png',0),(42,'Classic - Faux Cils Giselle #1','Confectionnés à partir de fibres synthétiques, les faux-cils classiques sont légers à porter, idéaux pour la vie de tous les jours, que vous soyez à la recherche d\'un style subtil et naturel, ou d\'un style plus séducteur.\r\n\r\nGiselle #1 : Créés en hommage à sa fille, les Giselle #1 proposent un style très naturel et léger en volume qui conviendra aussi bien aux débutants qu\'aux utilisateurs réguliers cherchant à définir leur frange de cils de manière subtile. A porter seul ou en superposition avec d\'autres modèles.\r\n\r\nLongueur des cils : 0,5 mm à 1.2 cm (varie légèrement en fonction des lots, car tous les cils sont fabriqués à la main)\r\nLongueur de la bande : 3 cm\r\nEpaisseur de la bande : 0.3 mm',22,'fauxcilsgiselle-67d04aa5c0d74.png',0),(43,'Icy Nude Eyeshadow Palette - Palette de fards à paupières','Adoptez l\'effet glacé avec notre toute dernière collection !\r\n\r\nDevenez adepte des looks glacials et suivez la tendance du regard de glace grâce à notre palette de fards à paupières Icy Nude. N\'hésitez pas à casser les codes en associant des teintes argentées glaciales à des bordeaux froids.\r\n\r\nCette palette contient 18 teintes d\'ombres à paupières ultra-pigmentées et des textures innovantes pour créer des regards affirmés, pleins de confiance.\r\n\r\nEFFET :\r\nNotre palette Icy Nude se compose de fards à paupières innovants, lisses, crémeux et intensément pigmentés dans diverses textures allant du mat bio au scintillement étincelant onctueux. Avec des teintes argentées, grises, platines, nudes, bordeaux, roses et blanches pour un effet totalement glacé.\r\n\r\nINFORMATIONS COMPLÉMENTAIRES :\r\nNotre collection Icy Nude apporte un effet glacé assumé qui cache une confiance explosive. Découvrez notre palette de fards à paupières ainsi que nos teintes ‘blonzer\' crémeuses pour créer votre look glacé. Terminez avec notre gloss à lèvres FAUXFILLER pour des lèvres scintillantes et intensément brillantes.\r\n\r\nPOURQUOI ON L\'ADORE :\r\n• Pigmentation intense\r\n• Textures variées\r\n• Application homogène\r\n• Facile à appliquer et à travailler\r\n\r\nLES TEINTES :\r\n- 1 duochrome métallique - une teinte métallique étincelante pour un éclat multicolore puissant\r\n- 1 teinte pailletée biodégradable - des paillettes biodégradables à base de plante pour un rayonnement instantané.\r\n- 2 trios chromés - de luxueuses paillettes pilées pour un scintillement maximal.\r\n- 3 fards aluminium scintillants - un délicat mélange de fines perles pour un effet aluminium.\r\n- 11 ombres mates onctueuses - des pigments intenses et une douce texture onctueuse pour un fini tamisé tout doux.',72,'IcyNudeEyeshadowPalette-Palettedefardspaupieres-67d04af55315b.png',0),(44,'Huda Beauty Base Brush - Pinceau base de teint','Un pinceau bombé, dense et facile à utiliser, doté de poils synthétiques de pointe, qui permet d\'appliquer le produit de façon homogène pour un fini flouté et sans traces.\r\n\r\nConçu pour fonctionner parfaitement avec les formules soyeuses de notre base et de notre fond de teint Easy Blur, le pinceau Base Brush dépose et diffuse le produit uniformément, pour un teint aérien, doux et naturel.\r\n\r\nCe pinceau est l\'outil idéal pour rendre votre routine encore plus facile.\r\n\r\nSON ACTION :\r\nLa tête bombée du pinceau est dotée de poils de densité moyenne qui facilitent le prélèvement et l\'application du produit. Base Brush est disponible en deux formats pratiques, une version standard pour une utilisation quotidienne et une version mini pour les voyages.\r\n\r\nPOURQUOI ON L\'ADORE :\r\n• Tête de pinceau bombée pour une application uniforme et diffuse\r\n• Application modulable\r\n• Fibres synthétiques imitant les performances de poils naturels\r\nFonctionne avec de nombreux formats de formules, des crèmes jusqu\'aux poudres',33,'HudaBeautyBaseBrush-Pinceaubasedeteint-67d04b48ccd5d.png',0),(45,'produit 000','test test',145,'IcyNudeEyeshadowPalette-Palettedefardspaupieres-67d400140e6ca.png',15),(46,'test','testtestest',40,'blushFilter-67d4385c98ea9.png',3),(51,'mascara','hdgdhdd',44,'LEGITLASHES-MascaraDouble-emboutVolumisantetAllongeant-67d456b4a9ae7.png',4),(52,'je teste','vsbghjkojhnbdxnhjsklokcjnbnsjkl',5,'perrot-67e68b4048a6d.png',2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sub_category`
--

DROP TABLE IF EXISTS `product_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sub_category` (
  `product_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`sub_category_id`),
  KEY `IDX_3147D5F34584665A` (`product_id`),
  KEY `IDX_3147D5F3F7BFE87C` (`sub_category_id`),
  CONSTRAINT `FK_3147D5F34584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3147D5F3F7BFE87C` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sub_category`
--

LOCK TABLES `product_sub_category` WRITE;
/*!40000 ALTER TABLE `product_sub_category` DISABLE KEYS */;
INSERT INTO `product_sub_category` VALUES (28,10),(29,7),(30,6),(31,9),(32,5),(33,13),(34,8),(35,6),(36,4),(37,1),(38,15),(39,3),(40,14),(41,17),(42,17),(43,2),(44,15),(45,2),(46,1),(51,1),(52,1);
/*!40000 ALTER TABLE `product_sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category`
--

DROP TABLE IF EXISTS `sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BCE3F79812469DE2` (`category_id`),
  CONSTRAINT `FK_BCE3F79812469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category`
--

LOCK TABLES `sub_category` WRITE;
/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
INSERT INTO `sub_category` VALUES (1,24,'Mascaras'),(2,24,'Fards à paupières'),(3,25,'Eye Liners'),(4,22,'Rouges à lèvres'),(5,22,'Gloss/Brillants à lèvres'),(6,23,'Fonds de teint'),(7,23,'Anti-cernes/Correcteurs'),(8,23,'Bronzeurs'),(9,23,'Fards à joues'),(10,23,'Poudres matifiantes/fixatrices'),(11,25,'Recourbes cils'),(13,23,'Base de teint'),(14,22,'Crayons à lèvres'),(15,25,'Eponges/Houppettes/Pinceaux'),(16,24,'Crayons pour les yeux'),(17,25,'Faux cils/Colle'),(18,23,'Enlumineurs'),(19,24,'Sourcils');
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-03 13:50:06
