CREATE TABLE IF NOT EXISTS `av_dealer_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealership` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `stock` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dealership` (`dealership`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

CREATE TABLE IF NOT EXISTS `av_financing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `dealership` varchar(50) DEFAULT NULL,
  `plates` varchar(50) DEFAULT NULL,
  `customer` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `paid` varchar(50) DEFAULT NULL,
  `totalPrice` varchar(50) DEFAULT NULL,
  `payments` varchar(50) DEFAULT NULL,
  `lastPayment` varchar(50) DEFAULT NULL,
  `seller` varchar(50) DEFAULT NULL,
  `sellerName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`),
  KEY `dealership` (`dealership`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;