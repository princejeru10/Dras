-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2015 at 10:09 AM
-- Server version: 5.6.26
-- PHP Version: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dras`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE IF NOT EXISTS `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_adjustments`
--

INSERT INTO `sma_adjustments` (`id`, `date`, `product_id`, `option_id`, `quantity`, `warehouse_id`, `note`, `created_by`, `updated_by`, `type`) VALUES
(1, '2015-11-09 13:05:00', 1, 0, '50.0000', 1, '&lt;p&gt;test&lt;&sol;p&gt;', 2, NULL, 'addition'),
(2, '2015-11-15 14:40:00', 2, 0, '400.0000', 1, '&lt;p&gt;test&lt;&sol;p&gt;', 2, NULL, 'subtraction'),
(3, '2015-11-15 14:45:00', 2, 0, '390.0000', 1, '&lt;p&gt;test&lt;&sol;p&gt;', 2, NULL, 'addition');

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE IF NOT EXISTS `sma_calendar` (
  `date` date NOT NULL,
  `data` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE IF NOT EXISTS `sma_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE IF NOT EXISTS `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`) VALUES
(1, 'C1', 'Refrigeration Spare Parts', NULL),
(2, 'C2', 'Hardware', NULL),
(3, 'C3', 'Electrical', NULL),
(4, 'C4', 'Wire Trunking', NULL),
(5, 'C0', 'Job Order', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE IF NOT EXISTS `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE IF NOT EXISTS `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) unsigned DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(55) NOT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`) VALUES
(1, 3, 'customer', 1, 'General', 'SM SVI Delgado', 'SM Savemore', '', 'Delgado corner Valeria Sts.,', 'Ilo-ilo', 'Ilo-ilo', '1870', 'Philippines', '0123456789', 'sm@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0),
(2, 4, 'supplier', NULL, NULL, 'Test Supplier', 'Supplier Company Name', '', 'Supplier Address', 'Cavite', '', '1234', 'Philippines', '0123456789', 'supplier@gmail.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0),
(3, NULL, 'biller', NULL, NULL, 'DRAS BILLER', 'DRAS BILLER', '5555', 'Biller adddress', 'City', '', '', 'Country', '012345678', 'drasbiller@gmail.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo1.png', 0),
(4, 3, 'customer', 1, 'General', 'Metro Gaisano Calinan', 'Gaisano', '', 'Calinan', 'Davao', '', '1870', 'Philippines', '012345678', 'gaisano@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0),
(5, 4, 'supplier', NULL, NULL, 'Test Supplier 2', 'Bot Supplier 2', '', '123 sample st Balibago', 'Angeles City', 'Pampanga', '1451', 'Philippines', '1234567890', 'supplier@supplier.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0),
(6, 4, 'supplier', NULL, NULL, 'Anonymous', 'Anonymous', '', '123 sample st', 'Mandaluyong', 'Metro Manila', '', 'Philippines', '1234567890', 'an@ny.mous', '', '', '', '', '', '', NULL, 0, 'logo.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE IF NOT EXISTS `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`) VALUES
(1, '2015-07-26', 1, 1, 1, 1, '3.0000', '100.0000', '100.0000', '150.0000', '150.0000', '77.0000', 1, 0),
(2, '2015-07-26', 1, 2, 1, 1, '3.0000', '100.0000', '100.0000', '150.0000', '150.0000', '77.0000', 1, 0),
(3, '2015-07-26', 2, 3, 1, 3, '2.0000', '154.5000', '154.5000', '170.0000', '170.0000', '21.0000', 1, 0),
(4, '2015-07-26', 5, 4, 2, NULL, '5.0000', '0.0000', '0.0000', '500.0000', '500.0000', NULL, NULL, 0),
(5, '2015-07-26', 2, 5, 2, 3, '1.0000', '154.5000', '154.5000', '170.0000', '170.0000', '14.0000', 1, 0),
(6, '2015-07-28', 1, 6, 3, 19, '2.0000', '120.0000', '120.0000', '150.0000', '150.0000', '92.0000', 1, 0),
(7, '2015-07-28', 5, 7, 3, NULL, '3.0000', '0.0000', '0.0000', '500.0000', '500.0000', '0.0000', NULL, 0),
(8, '2015-11-03', 1, 8, 4, 68, '5.0000', '100.0000', '100.0000', '150.0000', '150.0000', '95.0000', 1, 0),
(9, '2015-11-09', 8, 9, 5, 126, '20.0000', '45000.0000', '45000.0000', '45000.0000', '45000.0000', '0.0000', 1, 0),
(10, '2015-11-10', 1, 10, 6, 108, '8.0000', '100.0000', '100.0000', '150.0000', '150.0000', '38.0000', 1, 0),
(11, '2015-11-10', 2, 11, 6, 109, '8.0000', '154.5000', '154.5000', '170.0000', '170.0000', '38.0000', 1, 0),
(12, '2015-12-10', 8, 23, 18, NULL, '10.0000', '0.0000', '0.0000', '198.0000', '198.0000', NULL, NULL, 0),
(13, '2015-12-10', 9, 27, 19, NULL, '10.0000', '0.0000', '0.0000', '245.0000', '245.0000', NULL, NULL, 0),
(14, '2015-12-10', 9, 28, 20, NULL, '5.0000', '0.0000', '0.0000', '245.0000', '245.0000', '0.0000', NULL, 0),
(15, '2015-12-10', 1075, 29, 21, NULL, '50.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, 0),
(16, '2015-12-14', 1075, 30, 22, NULL, '20.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, 0),
(17, '2015-12-14', 1, 33, 24, 203, '10.0000', '30.0000', '30.0000', '0.0000', '0.0000', '70.0000', 1, 0),
(18, '2015-12-14', 1075, 34, 22, NULL, '20.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, 0),
(19, '2015-12-14', 1, 35, 25, 203, '1.0000', '30.0000', '30.0000', '30.0000', '30.0000', '89.0000', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE IF NOT EXISTS `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`) VALUES
(2, 'PHP', 'PESO', '1.0000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE IF NOT EXISTS `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'Supermarkets', 100);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE IF NOT EXISTS `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE IF NOT EXISTS `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_deliveries`
--

INSERT INTO `sma_deliveries` (`id`, `date`, `sale_id`, `do_reference_no`, `sale_reference_no`, `customer`, `address`, `note`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, '2015-11-09 12:17:00', 5, 'DO/2015/11/0001', 'SVC/2015/11/0004', 'SM SVI Delgado', '<p>Delgado corner Valeria Sts., Ilo-ilo Ilo-ilo 1870 Philippines<br>Tel: 0123456789 Email: sm@gmail.com</p>', '&lt;p&gt;test&lt;&sol;p&gt;', 2, NULL, NULL),
(2, '2015-11-09 12:32:07', 4, 'DO/2015/11/0002', 'SVC/2015/10/0004', 'SM SVI Delgado', '<p>Delgado corner Valeria Sts., Ilo-ilo Ilo-ilo 1870 Philippines<br>Tel: 0123456789 Email: sm@gmail.com</p>', '&lt;p&gt;test&lt;&sol;p&gt;', 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE IF NOT EXISTS `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE IF NOT EXISTS `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE IF NOT EXISTS `sma_groups` (
  `id` mediumint(8) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'warehouse_admin', 'Warehouse Staff'),
(4, 'ts_admin', 'Technical Service / Marketing'),
(5, 'technician', 'Taga-ayos po'),
(9, 'requestor', 'PRF Requestor'),
(10, 'receiver', 'receiver'),
(11, 'issuer', 'Issuer/Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE IF NOT EXISTS `sma_login_attempts` (
  `id` mediumint(8) unsigned NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE IF NOT EXISTS `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(304);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE IF NOT EXISTS `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE IF NOT EXISTS `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `ex`) VALUES
(1, '2015-03-01', 25, 1, 7, 5, 1, 3, 6, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE IF NOT EXISTS `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`) VALUES
(1, '2015-07-26 03:53:00', 2, NULL, NULL, 'IPAY/2015/07/0001', NULL, 'cash', '', '', '', '', '', 'Visa', '3010.0000', NULL, 2, NULL, 'received', '<p>Was paid on time</p>', '0.0000', '0.0000'),
(3, '2015-08-31 23:05:00', 3, 1, NULL, 'IPAY/2015/09/0003', NULL, 'cash', '', '', '', '', '', 'Visa', '1000.0000', NULL, 2, NULL, 'returned', NULL, '0.0000', '0.0000'),
(4, '2015-08-31 23:07:00', 3, NULL, NULL, 'IPAY/2015/09/0003', NULL, 'cash', '', '', '', '', '', 'Visa', '3250.0000', NULL, 2, NULL, 'received', '<p>Paid</p>', '0.0000', '0.0000'),
(5, '2015-08-31 23:08:00', 3, 2, NULL, 'IPAY/2015/09/0004', NULL, 'cash', '', '', '', '', '', 'Visa', '300.0000', NULL, 2, NULL, 'returned', NULL, '0.0000', '0.0000'),
(6, '2015-08-31 23:10:00', 2, 3, NULL, 'IPAY/2015/09/0004', NULL, 'cash', '', '', '', '', '', 'Visa', '2.0000', NULL, 2, NULL, 'returned', NULL, '0.0000', '0.0000'),
(9, '2015-11-02 18:58:00', 3, 4, NULL, 'IPAY/2015/11/0006', NULL, 'cash', '', '', '', '', '', 'Visa', '650.0000', NULL, 2, NULL, 'returned', NULL, '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE IF NOT EXISTS `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE IF NOT EXISTS `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `purchases-receive` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `purchases-receive`) VALUES
(1, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, 0),
(2, 2, 1, 1, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(3, 3, 1, 1, 1, NULL, 1, 1, 1, 1, 1, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, 1, 1, NULL, NULL, 1, NULL, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, NULL, 1, 1, 0),
(4, 4, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, 0),
(6, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, 0),
(7, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, 1),
(8, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE IF NOT EXISTS `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) NOT NULL,
  `total_cheques_submitted` int(11) NOT NULL,
  `total_cc_slips_submitted` int(11) NOT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE IF NOT EXISTS `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`) VALUES
(1, 22, 20, 1, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 0, 42, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE IF NOT EXISTS `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `brand` char(255) NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` int(11) DEFAULT '0',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1478 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `brand`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier_id`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`) VALUES
(1, 'dras0001', 'Access Valve', '', 'piece(s)', '30.0000', '0.0000', 100, 'cab0e72eb07eeeb0a1cda4afcc4a225a.jpg', 0, 0, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '<p>6mm (1/4"),</p>', NULL, 'standard', NULL, 0, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000'),
(2, 'dras0002', 'Insulation tape', 'Aerotape/ Armacell', 'roll(s)', '180.0000', '0.0000', 0, '72e0078525ea7589058d83be8d9883a8.jpg', 0, 0, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '<p>1/8" x 2" x 30'' Insulation tape *,</p>', NULL, 'standard', NULL, 0, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000'),
(3, 'dras0003', 'Aluminum angular bar', '', 'length(s)', '594.0000', '0.0000', 0, '3be3c0c9b1abdcd292eb9cb19a4bab71.jpg', 0, 0, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '<p>1?" x 1?" x 1/8"x 16'',</p>', NULL, 'standard', 0, 0, '0.0000', 2, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000'),
(4, 'dras0004', 'Aluminum angular bar', '', 'length(s)', '1079.0000', '0.0000', 15, '3be3c0c9b1abdcd292eb9cb19a4bab71.jpg', 0, 0, '', '', '', '', '', '', '0.0000', 1, 0, '', NULL, 'code128', NULL, '<p>1?" x 1?" x 3/16" x 16'',</p>', 0, 'service', 0, 0, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000'),
(5, 'dras0005', 'Aluminum angular bar', '', 'length(s)', '726.0000', '0.0000', 0, '3be3c0c9b1abdcd292eb9cb19a4bab71.jpg', 0, 0, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '<p>2" x 2" x 1/8" x 16'',</p>', NULL, 'standard', NULL, 0, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000'),
(6, 'dras0006', 'Aluminum angular bar', '', 'length(s)', '1040.0000', '0.0000', 15, '3be3c0c9b1abdcd292eb9cb19a4bab71.jpg', 0, 0, '', '', '', '', '', '', '0.0000', NULL, 1, '', NULL, 'code128', NULL, '<p>2" x 2" x 3/16" x 16'',</p>', NULL, 'standard', NULL, 0, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000'),
(7, 'dras0007', 'Aluminum flat bar', '', 'length(s)', '198.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1" x 1/8" x 16'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(8, 'dras0008', 'Aluminum flat bar', '', 'length(s)', '198.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" x 1/8",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(9, 'dras0009', 'Angular bar', '', 'length(s)', '245.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1" x 1" x 3/16 x 20'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(10, 'dras0010', 'Angular bar', '', 'length(s)', '495.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" x 1?" x 3/16" x 20'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(11, 'dras0011', 'Angular bar', '', 'length(s)', '764.0000', '0.0000', 15, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2" x 2" x 5mmThk" x 20'' Standard thk = 3/16"(4.7mm),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(12, 'dras0012', 'Angular bar', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/16" x 1/2" x 4.5mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(13, 'dras0013', 'Asbestos cloth', '', 'roll(s)', '450.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/8" x 2" x 30m,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(14, 'dras0014', 'Auxillary contact', 'Siemens', 'piece(s)', '300.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1NC 3RH1921-1CA01,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(15, 'dras0015', 'Auxillary contact', 'Siemens', 'piece(s)', '300.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1NO 3RH1921-1CA10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(16, 'dras0016', 'Auxillary contact', 'Telemecanique', 'piece(s)', '560.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>GVAN11,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(17, 'dras0017', 'Auxillary contact', 'Siemens', 'piece(s)', '337.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3TX40 01-2A/NC,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(18, 'dras0018', 'Auxillary contact', 'Siemens', 'piece(s)', '337.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3TX40 10-2A/NO,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(19, 'dras0019', 'Auxillary contact', 'Siemens', 'piece(s)', '2900.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3RP1513-1AP30,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(20, 'dras0020', 'Auxillary contact', 'Siemens', 'piece(s)', '480.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3RV1901-1E 1NC + 1NO,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(21, 'dras0021', 'Auxillary contact', 'Siemens', 'piece(s)', '750.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3RV1901-1A,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(22, 'dras0022', 'Axial Fan', '', 'piece(s)', '190.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4" x 4",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(23, 'dras0023', 'Axial Fan', '', 'piece(s)', '235.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3" x 3",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(24, 'dras0024', 'Axial Fan', '', 'piece(s)', '500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>160mm x 160mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(25, 'dras0025', 'Axial Fan', '', 'piece(s)', '500.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5"x5",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(26, 'dras0026', 'Axial Fan', '', 'piece(s)', '500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5.5" x 5.5",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(27, 'dras0027', 'Ball valve', 'Danfoss', 'piece(s)', '850.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6mm GBC 6s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(28, 'dras0028', 'Ball valve', 'Danfoss', 'piece(s)', '1050.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") GBC 10s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(29, 'dras0029', 'Ball valve', 'Henry', 'piece(s)', '1100.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") GBC 10s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(30, 'dras0030', 'Ball valve', 'Castel', 'piece(s)', '1100.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") GBC 10s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(31, 'dras0031', 'Ball valve', 'Danfoss', 'piece(s)', '1200.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm (?") GBC 12s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(32, 'dras0032', 'Ball valve', 'Castel', 'piece(s)', '1200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm (?") GBC 12s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(33, 'dras0033', 'Ball valve', 'Danfoss', 'piece(s)', '1100.0000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") GBC 16s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(34, 'dras0034', 'Ball valve', 'Danfoss', 'piece(s)', '1600.0000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18mm (?") GBC 18s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(35, 'dras0035', 'Ball valve', 'Henry', 'piece(s)', '1600.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18mm (?") GBC 18s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(36, 'dras0036', 'Ball valve', 'Danfoss', 'piece(s)', '1500.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm (7/8") GBC 22s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(37, 'dras0037', 'Ball valve', 'Danfoss', 'piece(s)', '2100.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm (1?") GBC 28s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(38, 'dras0038', 'Ball valve', 'Danfoss', 'piece(s)', '3600.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm (1-3/8") GBC 35s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(39, 'dras0039', 'Ball valve', 'Henry', 'piece(s)', '3700.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm (1-3/8") GBC 35s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(40, 'dras0040', 'Ball valve', 'Danfoss', 'piece(s)', '4800.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm (1-5/8") GBC 42s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(41, 'dras0041', 'Ball valve', 'Danfoss', 'piece(s)', '8000.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm (2-?") GBC 54s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(42, 'dras0042', 'Ball valve', 'Danfoss', 'piece(s)', '11000.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>64mm (2-5/8") GBC 67s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(43, 'dras0043', 'Bearing', 'NTN', 'piece(s)', '20.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6001Z,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(44, 'dras0044', 'Bearing', '', 'piece(s)', '370.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6306Z,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(45, 'dras0045', 'Bearing', 'NSK', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6301D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(46, 'dras0046', 'Bearing', 'FAG', 'piece(s)', '948.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3203ZZ VTH NVR,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(47, 'dras0047', 'Blind rivet', '', 'box(es)', '0.2000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/8" x 1/2" 853pcs/box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(48, 'dras0048', 'Blind rivet', '', 'box(es)', '0.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/16" x 1" 853pcs/box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(49, 'dras0049', 'Blind rivet', '', 'box(es)', '0.3500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/16" x 1/2" 726pcs/box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(50, 'dras0050', 'Bootlace ferrule', '', 'piece(s)', '0.9000', '0.0000', 100, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1.25mm?,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(51, 'dras0051', 'Bootlace ferrule', '', 'piece(s)', '1.5000', '0.0000', 100, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3.5mm?,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(52, 'dras0052', 'Bootlace ferrule', '', 'piece(s)', '0.0000', '0.0000', 50, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5.5mm?,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(53, 'dras0053', 'Built in motor for S6G-25.2-40P', '', 'unit(s)', '125000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(54, 'dras0054', 'Busbar', '', 'length(s)', '760.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/4" x 1" x 12",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(55, 'dras0055', 'Busbar', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/2" x 2" x 1,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(56, 'dras0056', 'Busbar insulator', 'ABB', 'piece(s)', '1259.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2P PS/2/58/16,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(57, 'dras0057', 'Busbar insulator', 'ABB', 'piece(s)', '1765.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3P PS/3/60/16,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(58, 'dras0058', 'Busbar insulator', '', 'piece(s)', '60.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>SM-51,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(59, 'dras0059', 'Busbar insulator', '', 'piece(s)', '40.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>SM-35,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(60, 'dras0060', 'Busbar insulator', '', 'piece(s)', '146.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>SM-76,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(61, 'dras0061', 'Bushing', 'Bitzer', 'piece(s)', '3500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>311 100-04,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(62, 'dras0062', 'Bushing', 'Bitzer', 'piece(s)', '3500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>311-100-05,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(63, 'dras0063', 'Bushing', 'Bitzer', 'piece(s)', '2500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>311-112-07,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(64, 'dras0064', 'Bushing', 'Bitzer', 'piece(s)', '2500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>311 100-15,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(65, 'dras0065', 'Bushing', 'Bitzer', 'piece(s)', '2500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>311 100-08,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(66, 'dras0066', 'Bushing', 'Bock', 'piece(s)', '3192.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Big,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(67, 'dras0067', 'Bushing', 'Bock', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Silver,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(68, 'dras0068', 'Cable tie', '', 'piece(s)', '0.2000', '0.0000', 500, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4" 100pcs/pack,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(69, 'dras0069', 'Cable tie', '', 'piece(s)', '0.5000', '0.0000', 500, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6" 100pcs/pack,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(70, 'dras0070', 'Cable tie', '', 'piece(s)', '0.4000', '0.0000', 500, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8" 100pcs/pack,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(71, 'dras0071', 'Cable tray', '', 'length(s)', '0.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2" x 4" x 2" x 8'' GI #22 w/ cover,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(72, 'dras0072', 'Cable tray', '', 'length(s)', '504.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3" x 4" x 3" x 8'' GI #22 w/ cover,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(73, 'dras0073', 'Cable tray', '', 'length(s)', '368.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3" x 4" x 3" x 8'' GI #22 w/o cover not stock,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(74, 'dras0074', 'Cable tray', '', 'length(s)', '579.0000', '0.0000', 15, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4" x 4" x 4" x 8'' GI #22 w/ cover,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(75, 'dras0075', 'Cable tray', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4" x 4" x 4" x 8'' GI #22 w/o cover not stock,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(76, 'dras0076', 'Cable tray', '', 'length(s)', '630.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4" x 6" x 4" x 8'' GI #22 w/ cover,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(77, 'dras0077', 'Cable tray', '', 'length(s)', '682.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4" x 6" x 4" x 8'' GI #22 w/o cover not stock,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(78, 'dras0078', 'Cable tray', '', 'length(s)', '480.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4" x 3" x 4" x 8'' GI #22 w/ cover,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(79, 'dras0079', 'Cable tray', '', 'length(s)', '790.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4" x 8" x 4" x 8'' GI #22 w/ cover,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(80, 'dras0080', 'Cable tray', '', 'length(s)', '682.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6" x 4" x 6" x 8'' GI #22 w/ cover,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(81, 'dras0081', 'Capacitor', '', 'piece(s)', '180.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5u?/450v/50-60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(82, 'dras0082', 'Capacitor', '', 'piece(s)', '220.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6u?/450v/50-60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(83, 'dras0083', 'Capacitor', '', 'piece(s)', '300.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35u?/450v/50-60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(84, 'dras0084', 'Capacitor', '', 'piece(s)', '350.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>40u?/450v/50-60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(85, 'dras0085', 'Capacitor', '', 'piece(s)', '190.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12u?/450v/50-60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(86, 'dras0086', 'Capacitor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15u?/450v/50-60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(87, 'dras0087', 'Capacity controller', '', 'piece(s)', '14000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>EKC 331T (084B7105),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(88, 'dras0088', 'Capacity controller', '', 'piece(s)', '15680.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>EKC 331,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(89, 'dras0089', 'Caster Roller', '', 'piece(s)', '250.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(90, 'dras0090', 'Caster wheels', '', 'piece(s)', '65.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5.7" fabrication,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(91, 'dras0091', 'Caster wheels', '', 'piece(s)', '95.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5/13" fabrication,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(92, 'dras0092', 'C-Channel', '', 'length(s)', '1188.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" x 3" x 1 ?" x 5mm(thk) x 20'' Standard thk = 3/16"(4.7mm),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(93, 'dras0093', 'C-Channel', '', 'length(s)', '1380.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2" x 3" x 2" x 3/16" x 20'' Standard thk = 3/16"(4.7mm),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(94, 'dras0094', 'C-Channel', '', 'length(s)', '1850.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2" x 3" x 2" x 5mm(thk),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(95, 'dras0095', 'Check Valve', 'Castel', 'piece(s)', '1360.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") Flare,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(96, 'dras0096', 'Ceramic fuse', '', 'piece(s)', '125.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>100A,NH00, D02,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(97, 'dras0097', 'Ceramic fuse', '', 'piece(s)', '125.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>125A, NH00,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(98, 'dras0098', 'Ceramic fuse', '', 'piece(s)', '131.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>80Ag,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(99, 'dras0099', 'Ceramic fuse', '', 'piece(s)', '207.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>63A/NH00C,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(100, 'dras0100', 'Ceramic fuse', '', 'piece(s)', '31.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>50A, D02,Gl/gG,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(101, 'dras0101', 'Ceramic fuse', '', 'piece(s)', '35.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6A (for STI-32),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(102, 'dras0102', 'Ceramic fuse', '', 'piece(s)', '210.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>50A, 500V, NH00C,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(103, 'dras0103', 'Check Valve', 'Danfoss', 'piece(s)', '1600.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(104, 'dras0104', 'Check Valve', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm (7/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(105, 'dras0105', 'Circuit breaker', 'T&B', 'piece(s)', '1822.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3 phase 25KAIC 600vac 80AT,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(106, 'dras0106', 'Circuit breaker', 'T&B', 'piece(s)', '1822.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3 phase 25KAIC 600vac 100AT,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(107, 'dras0107', 'Circuit breaker', 'G.E', 'piece(s)', '18460.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>400A/3 pole FG400,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(108, 'dras0108', 'Circuit breaker', 'G.E', 'piece(s)', '3293.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>160A/3 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(109, 'dras0109', 'Circuit breaker', 'G.E', 'piece(s)', '2720.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>100A/2 pole TCD124100WL,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(110, 'dras0110', 'Circuit breaker', 'G.E', 'piece(s)', '3830.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>100A/ 3 pole TCD134100WL,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(111, 'dras0111', 'Circuit breaker', 'Siemens', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3VT1710-2DA36-0AA0,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(112, 'dras0112', 'Circuit breaker', 'G.E', 'piece(s)', '3123.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>50A/3 pole TCD134050,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(113, 'dras0113', 'Circuit breaker', 'G.E', 'piece(s)', '3352.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>60A/3 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(114, 'dras0114', 'Circuit breaker', 'T&B', 'piece(s)', '1656.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>60A/3 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(115, 'dras0115', 'Circuit breaker', 'G.E', 'piece(s)', '3351.2500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>75A/ 3 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(116, 'dras0116', 'Circuit breaker', 'G.E', 'piece(s)', '320.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>20A/3 pole TCD134020,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(117, 'dras0117', 'Circuit breaker', 'G.E', 'piece(s)', '2873.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>150A/2 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(118, 'dras0118', 'Circuit breaker', ' G.E', 'piece(s)', '27770.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>600A/3 pole,,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(119, 'dras0119', 'Circuit breaker', ' G.E', 'piece(s)', '6370.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>125A/3 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(120, 'dras0120', 'Circuit breaker', ' G.E', 'piece(s)', '18460.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>250A/3pole, 400v FE250,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(121, 'dras0121', 'Circuit breaker', 'Molden', 'piece(s)', '2940.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>50A/600V TCD 134050,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(122, 'dras0122', 'Coldroom light fixture', 'Velux', 'piece(s)', '280.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>BHWP/E 27 white,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(123, 'dras0123', 'Coldroom light switch', 'B-Ticino', 'piece(s)', '52.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>M9001,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(124, 'dras0124', 'Compressor', 'Bitzer', 'unit(s)', '98000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4FC-3.2-20D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(125, 'dras0125', 'Compressor', 'Bitzer', 'unit(s)', '255000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4H-15.2Y-20D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(126, 'dras0126', 'Compressor', 'Bitzer', 'unit(s)', '263000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4H-15.2Y-40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(127, 'dras0127', 'Compressor', 'Bitzer', 'unit(s)', '355000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6G-30.2-40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(128, 'dras0128', 'Compressor', 'Bitzer', 'unit(s)', '285000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6J-22.2-40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(129, 'dras0129', 'Compressor', 'Bitzer', 'unit(s)', '360000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S4G-12.2-20D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(130, 'dras0130', 'Compressor', 'Bitzer', 'unit(s)', '295000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S4G-12.2-40P S4G-12.2Y-40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(131, 'dras0131', 'Compressor', 'Bitzer', 'unit(s)', '398000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S6G-25.2-2NU,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(132, 'dras0132', 'Compressor', 'Bitzer', 'unit(s)', '398000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S6H.20.2-20D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(133, 'dras0133', 'Compressor', 'Bitzer', 'unit(s)', '410000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S6H-20.2-40P S6H-20.2Y-40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(134, 'dras0134', 'Compressor', 'Bitzer', 'unit(s)', '450000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S6F-30.2-40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(135, 'dras0135', 'Compressor', 'Bitzer', 'unit(s)', '398000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S6J-16.2-20D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(136, 'dras0136', 'Compressor', 'Bitzer', 'unit(s)', '399640.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S6J-16.2-2NU,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(137, 'dras0137', 'Compressor', 'Danfoss', 'unit(s)', '9100.0000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>SC18CLX.2 (104L2195) w/ starting kit,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(138, 'dras0138', 'Compressor', 'Hitachi', 'unit(s)', '40000.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>L300DH-56A1,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(139, 'dras0139', 'Compressor', 'Hitachi', 'unit(s)', '38000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FL300DH-56A1,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(140, 'dras0140', 'Compressor', 'Hitachi', 'unit(s)', '44500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FL500DH-90A1,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(141, 'dras0141', 'Compressor', 'Hitachi', 'unit(s)', '37000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FM300-47A1,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(142, 'dras0142', 'Compressor', 'Hitachi', 'unit(s)', '34000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>M300DH47A1,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(143, 'dras0143', 'Compressor', 'Hitachi', 'unit(s)', '37000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>M500 DH-80AI-76,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(144, 'dras0144', 'Compressor', 'Matsushita', 'unit(s)', '4100.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2P14S3R236A Panasonic,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(145, 'dras0145', 'Compressor', 'Tecumseh', 'unit(s)', '25000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FH2480Z,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(146, 'dras0146', 'Compressor', '', 'unit(s)', '65000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZX30K CE-TF5-524,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(147, 'dras0147', 'Compressor', 'Danfoss', 'unit(s)', '10500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>60Hz/1Ph/230V SC21G,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(148, 'dras0148', 'Compressor', 'Maneurop', 'unit(s)', '35000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>440v/3Ph/60Hz MT80HP4AVE,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(149, 'dras0149', 'Compressor', 'Embraco', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>NJ9226K,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(150, 'dras0150', 'Compressor', 'Emerson', 'unit(s)', '98000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3SCH.100E 13E00024Y,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(151, 'dras0151', 'Compressor', 'Emerson', 'unit(s)', '150000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4SLW.150E 13I01016Y,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(152, 'dras0152', 'Compressor', 'Bitzer', 'unit(s)', '205000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4NCS-12.2Y-2NU 1680804195,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(153, 'dras0153', 'Compressor', 'Bitzer', 'unit(s)', '1300.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4NES-14Y-20D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(154, 'dras0154', 'Compressor', 'Boyard', 'unit(s)', '17000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>QHL-30E,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(155, 'dras0155', 'Compressor', 'Tecumseh', 'unit(s)', '19500.0000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>CAJ9513T R22,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(156, 'dras0156', 'Compressor', 'Tecumseh', 'unit(s)', '0.0000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>CAJ9513Z R404,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(157, 'dras0157', 'Compressor', 'Bock', 'unit(s)', '28000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8870 Fixing Parts,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(158, 'dras0158', 'Head Fan', 'Zehl-Abegg', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FE031-4DZ.OC.A7 Zeh-Abegg type,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(159, 'dras0159', 'Condensing unit', 'Copeland', 'unit(s)', '135000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>XJAL-020Z-TFC,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(160, 'dras0160', 'Condensing unit', 'Copeland', 'unit(s)', '144000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>XJAL-030Z-TFC,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(161, 'dras0161', 'Condensing unit', 'Copeland', 'unit(s)', '190000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>XJAL-040Z-TFC,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(162, 'dras0162', 'Condensing unit', 'Copeland', 'unit(s)', '175000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>XJAL-050Z-TFC,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(163, 'dras0163', 'Condensing unit', 'Copeland', 'unit(s)', '110000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>XJAL-060Z-TFC,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(164, 'dras0164', 'Condensing unit', 'Copeland', 'unit(s)', '115000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>XJAM-020Z -TFC,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(165, 'dras0165', 'Condensing unit', 'Copeland', 'unit(s)', '117000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>XJAM-030Z -TFC,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(166, 'dras0166', 'Condensing unit', 'Copeland', 'unit(s)', '135000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>XJAM-040Z -TFC,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(167, 'dras0167', 'Condensing unit', 'Copeland', 'unit(s)', '160000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>XJAM-050Z -TFC,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(168, 'dras0168', 'Condensing unit', 'Copeland', 'unit(s)', '110000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>XJAM-060Z -TFC,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(169, 'dras0169', 'Condensing unit', 'Copeland', 'unit(s)', '117000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZX020E-TF5-401,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(170, 'dras0170', 'Condensing unit', 'Copeland', 'unit(s)', '135000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZX040E-TF5-401,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(171, 'dras0171', 'Condensing unit', 'Copeland', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZX050E-TF5-401,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(172, 'dras0172', 'Condensing unit', 'Copeland', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZXL 050Z,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(173, 'dras0173', 'Condensing unit', 'Copeland', 'unit(s)', '99200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZXL050E-TF5-451,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(174, 'dras0174', 'Condensing unit', 'Hitachi', 'unit(s)', '55000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>KX-R31AM,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(175, 'dras0175', 'Control box', '', 'piece(s)', '74280.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>300mmD x 1800mmW x 1700mmH,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(176, 'dras0176', 'Control box', '', 'piece(s)', '2480.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>300mm x 2700mm x 1700mm w/ 100mm base (3 doors),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(177, 'dras0177', 'Control box', '', 'piece(s)', '18469.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Metal, 200mmD x 300mmW x 400mmH Nema-4,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(178, 'dras0178', 'Control box', '', 'piece(s)', '75000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>300mmD x 800mmW x 1200mmH Nema-4 Single Door w/ Metal Base plate,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(179, 'dras0179', 'Controlled Injection Cooling (CIC)', 'Bitzer', 'piece(s)', '12.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>with Pulsating Liquid Injection,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(180, 'dras0180', 'Copper coupling', '', 'piece(s)', '15.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm (?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(181, 'dras0181', 'Copper coupling', '', 'piece(s)', '25.0000', '0.0000', 20, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(182, 'dras0182', 'Copper coupling', '', 'piece(s)', '27.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18mm (?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(183, 'dras0183', 'Copper coupling', '', 'piece(s)', '55.0000', '0.0000', 20, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm (7/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(184, 'dras0184', 'Copper coupling', '', 'piece(s)', '70.0000', '0.0000', 30, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm (1?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(185, 'dras0185', 'Copper coupling', '', 'piece(s)', '90.0000', '0.0000', 20, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm (1-3/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(186, 'dras0186', 'Copper coupling', '', 'piece(s)', '180.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm (1-5/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(187, 'dras0187', 'Copper coupling', '', 'piece(s)', '334.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm (2-?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(188, 'dras0188', 'Copper coupling', '', 'piece(s)', '700.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>64mm (2-5/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(189, 'dras0189', 'Copper coupling', '', 'piece(s)', '40.5000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>76mm (3?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(190, 'dras0190', 'Copper elbow', '', 'piece(s)', '40.5000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>45? 10mm (3/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(191, 'dras0191', 'Copper elbow', '', 'piece(s)', '35.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>45? 12mm (?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(192, 'dras0192', 'Copper elbow', '', 'piece(s)', '65.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>45? 15mm (5/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(193, 'dras0193', 'Copper elbow', '', 'piece(s)', '70.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>45? 18mm (?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000');
INSERT INTO `sma_products` (`id`, `code`, `name`, `brand`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier_id`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`) VALUES
(194, 'dras0194', 'Copper elbow', '', 'piece(s)', '110.0000', '0.0000', 30, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>45? 22mm (7/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(195, 'dras0195', 'Copper elbow', '', 'piece(s)', '205.0000', '0.0000', 30, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>45? 28mm (1?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(196, 'dras0196', 'Copper elbow', '', 'piece(s)', '280.0000', '0.0000', 30, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>45? 35mm (1-3/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(197, 'dras0197', 'Copper elbow', '', 'piece(s)', '430.0000', '0.0000', 20, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>45? 42mm (1-5/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(198, 'dras0198', 'Copper elbow', '', 'piece(s)', '850.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>45? 54mm (2-?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(199, 'dras0199', 'Copper elbow', '', 'piece(s)', '1300.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>45? 64mm (2-5/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(200, 'dras0200', 'Copper elbow', '', 'piece(s)', '8.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>45? 76mm (3?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(201, 'dras0201', 'Copper elbow', '', 'piece(s)', '15.0000', '0.0000', 30, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 6mm (?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(202, 'dras0202', 'Copper elbow', '', 'piece(s)', '16.0000', '0.0000', 30, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 10mm (3/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(203, 'dras0203', 'Copper elbow', '', 'piece(s)', '19.0000', '0.0000', 30, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 12mm (?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(204, 'dras0204', 'Copper elbow', '', 'piece(s)', '45.0000', '0.0000', 30, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 15mm (5/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(205, 'dras0205', 'Copper elbow', '', 'piece(s)', '40.0000', '0.0000', 30, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 18mm (?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(206, 'dras0206', 'Copper elbow', '', 'piece(s)', '80.0000', '0.0000', 30, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 22mm (7/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(207, 'dras0207', 'Copper elbow', '', 'piece(s)', '125.0000', '0.0000', 30, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 28mm (1?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(208, 'dras0208', 'Copper elbow', '', 'piece(s)', '160.0000', '0.0000', 30, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 35mm (1-3/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(209, 'dras0209', 'Copper elbow', '', 'piece(s)', '330.0000', '0.0000', 20, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 42mm (1-5/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(210, 'dras0210', 'Copper elbow', '', 'piece(s)', '600.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 54mm (2-?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(211, 'dras0211', 'Copper elbow', '', 'piece(s)', '1302.3000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 64mm (2-5/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(212, 'dras0212', 'Copper elbow', '', 'piece(s)', '2944.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 76mm (3?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(213, 'dras0213', 'Copper elbow', '', 'piece(s)', '1336.1300', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 89mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(214, 'dras0214', 'Copper pipe "L"', '', 'length(s)', '570.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6mm (?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(215, 'dras0215', 'Copper pipe "L"', '', 'length(s)', '830.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(216, 'dras0216', 'Copper pipe "L"', '', 'length(s)', '1270.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm (?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(217, 'dras0217', 'Copper pipe "L"', '', 'length(s)', '1900.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(218, 'dras0218', 'Copper pipe "L"', '', 'length(s)', '2050.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18mm (?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(219, 'dras0219', 'Copper pipe "L"', '', 'length(s)', '2800.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm (7/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(220, 'dras0220', 'Copper pipe "L"', '', 'length(s)', '4150.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm (1?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(221, 'dras0221', 'Copper pipe "L"', '', 'length(s)', '5400.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm (1-3/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(222, 'dras0222', 'Copper pipe "L"', '', 'length(s)', '7450.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm (1-5/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(223, 'dras0223', 'Copper pipe "L"', '', 'length(s)', '9550.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm (2-?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(224, 'dras0224', 'Copper pipe "L"', '', 'length(s)', '12870.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>64mm (2-5/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(225, 'dras0225', 'Copper pipe "L"', '', 'length(s)', '25000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>76mm (3?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(226, 'dras0226', 'Copper pipe "L"', '', 'length(s)', '1350.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>105mm (4-1/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(227, 'dras0227', 'Copper pipe Soft Drawn', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(228, 'dras0228', 'Copper pipe Soft Drawn', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm (7/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(229, 'dras0229', 'Copper pipe Soft Drawn', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm (1?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(230, 'dras0230', 'Copper pipe Soft Drawn', '', 'length(s)', '2205.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm (1-3/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(231, 'dras0231', 'Copper pipe w/ P.U', '', 'length(s)', '2475.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(232, 'dras0232', 'Copper pipe w/ P.U', '', 'length(s)', '2781.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18mm (?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(233, 'dras0233', 'Copper pipe w/ P.U', '', 'length(s)', '3780.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm (7/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(234, 'dras0234', 'Copper pipe w/ P.U', '', 'length(s)', '4950.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm (1?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(235, 'dras0235', 'Copper pipe w/ P.U', '', 'length(s)', '5265.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm (1-3/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(236, 'dras0236', 'Copper pipe w/ P.U', '', 'length(s)', '7515.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm (1-5/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(237, 'dras0237', 'Copper pipe w/ P.U', '', 'length(s)', '9607.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm (2-?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(238, 'dras0238', 'Copper pipe w/ P.U', '', 'length(s)', '13131.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>64mm (2-5/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(239, 'dras0239', 'Copper pipe w/ P.U', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>76mm (3?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(240, 'dras0240', 'Copper reducer', '', 'piece(s)', '0.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm x 6mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(241, 'dras0241', 'Copper reducer', '', 'piece(s)', '25.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm x 6mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(242, 'dras0242', 'Copper reducer', '', 'piece(s)', '0.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm x 12mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(243, 'dras0243', 'Copper reducer', '', 'piece(s)', '49.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm x 10mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(244, 'dras0244', 'Copper reducer', '', 'piece(s)', '0.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm x 12mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(245, 'dras0245', 'Copper reducer', '', 'piece(s)', '47.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18mm x 10mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(246, 'dras0246', 'Copper reducer', '', 'piece(s)', '47.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18mm x 12mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(247, 'dras0247', 'Copper reducer', '', 'piece(s)', '49.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18mm x 15mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(248, 'dras0248', 'Copper reducer', '', 'piece(s)', '49.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm x 10mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(249, 'dras0249', 'Copper reducer', '', 'piece(s)', '50.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm x 15mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(250, 'dras0250', 'Copper reducer', '', 'piece(s)', '81.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm x 18mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(251, 'dras0251', 'Copper reducer', '', 'piece(s)', '76.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm x 10mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(252, 'dras0252', 'Copper reducer', '', 'piece(s)', '81.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm x 12mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(253, 'dras0253', 'Copper reducer', '', 'piece(s)', '81.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm x 15mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(254, 'dras0254', 'Copper reducer', '', 'piece(s)', '81.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm x 18mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(255, 'dras0255', 'Copper reducer', '', 'piece(s)', '130.0000', '0.0000', 15, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm x 22mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(256, 'dras0256', 'Copper reducer', '', 'piece(s)', '130.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm x 12mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(257, 'dras0257', 'Copper reducer', '', 'piece(s)', '130.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm x 15mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(258, 'dras0258', 'Copper reducer', '', 'piece(s)', '110.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm x 18mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(259, 'dras0259', 'Copper reducer', '', 'piece(s)', '120.0000', '0.0000', 15, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm x 22mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(260, 'dras0260', 'Copper reducer', '', 'piece(s)', '136.8000', '0.0000', 15, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm x 28mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(261, 'dras0261', 'Copper reducer', '', 'piece(s)', '150.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm x 18mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(262, 'dras0262', 'Copper reducer', '', 'piece(s)', '140.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm x 22mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(263, 'dras0263', 'Copper reducer', '', 'piece(s)', '220.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm x 28mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(264, 'dras0264', 'Copper reducer', '', 'piece(s)', '198.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm x 35mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(265, 'dras0265', 'Copper reducer', '', 'piece(s)', '290.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm x 15mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(266, 'dras0266', 'Copper reducer', '', 'piece(s)', '198.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm x 18mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(267, 'dras0267', 'Copper reducer', '', 'piece(s)', '198.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm x 22mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(268, 'dras0268', 'Copper reducer', '', 'piece(s)', '290.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm x 28mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(269, 'dras0269', 'Copper reducer', '', 'piece(s)', '350.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm x 35mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(270, 'dras0270', 'Copper reducer', '', 'piece(s)', '500.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm x 42mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(271, 'dras0271', 'Copper reducer', '', 'piece(s)', '500.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>64mm x 22mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(272, 'dras0272', 'Copper reducer', '', 'piece(s)', '440.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>64mm x 28mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(273, 'dras0273', 'Copper reducer', '', 'piece(s)', '700.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>64mm x 35mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(274, 'dras0274', 'Copper reducer', '', 'piece(s)', '500.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>64mm x 42mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(275, 'dras0275', 'Copper reducer', '', 'piece(s)', '840.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>64mm x 54mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(276, 'dras0276', 'Copper reducer', '', 'piece(s)', '840.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>76mm x 28mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(277, 'dras0277', 'Copper reducer', '', 'piece(s)', '1690.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>76mm x 35mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(278, 'dras0278', 'Copper reducer', '', 'piece(s)', '799.4300', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>76mm x 54mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(279, 'dras0279', 'Copper reducer', '', 'piece(s)', '40.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>76mm x 64mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(280, 'dras0280', 'Copper tee', '', 'piece(s)', '40.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6mm (?") Type "L",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(281, 'dras0281', 'Copper tee', '', 'piece(s)', '50.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") Type "L",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(282, 'dras0282', 'Copper tee', '', 'piece(s)', '51.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm (?") Type "L",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(283, 'dras0283', 'Copper tee', '', 'piece(s)', '72.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") Type "L",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(284, 'dras0284', 'Copper tee', '', 'piece(s)', '75.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18mm (?") Type "L",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(285, 'dras0285', 'Copper tee', '', 'piece(s)', '164.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm (7/8") Type "L",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(286, 'dras0286', 'Copper tee', '', 'piece(s)', '246.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm (1?") Type "L",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(287, 'dras0287', 'Copper tee', '', 'piece(s)', '385.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm (1-3/8") Type "L",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(288, 'dras0288', 'Copper tee', '', 'piece(s)', '550.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm (1-5/8") Type "L",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(289, 'dras0289', 'Copper tee', '', 'piece(s)', '850.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm (2-?") Type "L",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(290, 'dras0290', 'Copper tee', '', 'piece(s)', '3159.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>64mm (2-5/8") Type "L",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(291, 'dras0291', 'Copper tee', '', 'piece(s)', '1070.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>76mm (3?") Type "L",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(292, 'dras0292', 'Copper tube', '', 'roll(s)', '1685.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6mm (?") x 0.022"thk 15mtrs/roll,,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(293, 'dras0293', 'Copper tube', '', 'roll(s)', '2300.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") x 0.022"thk 15mtrs/roll,,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(294, 'dras0294', 'Copper tube', '', 'roll(s)', '2715.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm (?") x 0.022"thk 15mtrs/roll,,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(295, 'dras0295', 'Copper tube', '', 'roll(s)', '960.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") x 0.022"thk 15mtrs/roll,,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(296, 'dras0296', 'Copper tube', '', 'roll(s)', '1685.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6mm (?") x 0.032"thk 15mtrs/roll,,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(297, 'dras0297', 'Copper tube', '', 'roll(s)', '2400.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") x 0.032"thk 15mtrs/roll,,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(298, 'dras0298', 'Copper tube', '', 'roll(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm (?") x 0.032"thk 15mtrs/roll,,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(299, 'dras0299', 'Cutting Disk', '', 'piece(s)', '58.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>14" for Circular saw,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(300, 'dras0300', 'Cutting Disk', '', 'piece(s)', '22000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4" for grinder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(301, 'dras0301', 'Cylinder Head', '', 'piece(s)', '30.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>302-360-14,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(302, 'dras0302', 'Cylinder Hinge', '', 'piece(s)', '145.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>41641,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(303, 'dras0303', 'Deformed bar', '', 'length(s)', '126.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/2" x 20'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(304, 'dras0304', 'Deformed bar', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8" x 20'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(305, 'dras0305', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 10mm?, 4'' (123cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(306, 'dras0306', 'Defrost heater', '', 'piece(s)', '2500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8" ? x 127cmL (400wx230v),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(307, 'dras0307', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>7mm x 218 cml x 10cml (230v x 800w x 60Hz x 1Ph) 500mm wire L (Both Side) rubber to rubber,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(308, 'dras0308', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 10mm?, 5'' (152cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(309, 'dras0309', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 10mm?, 6'' (183cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(310, 'dras0310', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 10mm?, 8'' (244cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(311, 'dras0311', 'Defrost heater', '', 'piece(s)', '1850.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(600w x 220v) 8mm? U bend,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(312, 'dras0312', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>U type 4",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(313, 'dras0313', 'Defrost heater', '', 'piece(s)', '1900.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>L-type, 10mm?, 4''(122cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(314, 'dras0314', 'Defrost heater', '', 'piece(s)', '2800.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>L-type, 10mm?, 8''(244cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(315, 'dras0315', 'Defrost heater', '', 'piece(s)', '1500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>L-type, 10mm?, 12'' (366cm), 220v/800w(600w)/60hz 3/8? 12",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(316, 'dras0316', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>L-type, 10mm?, 6'' (183cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(317, 'dras0317', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>800w x 220v 4'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(318, 'dras0318', 'Defrost heater', '', 'piece(s)', '1000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>for 3 glass door freezer,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(319, 'dras0319', 'Defrost heater', '', 'piece(s)', '1350.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 7mm?, 3'' (92cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(320, 'dras0320', 'Defrost heater', '', 'piece(s)', '705.6000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 7mm?, 4'' (122cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(321, 'dras0321', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 7mm?, 4.5'' (137cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(322, 'dras0322', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(L-straight)7mm?x18cmLx10cmL,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(323, 'dras0323', 'Digital solar thermometer', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DST-12,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(324, 'dras0324', 'Digital solar thermometer', 'Nakano', 'piece(s)', '1155.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>CC1-17B,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(325, 'dras0325', 'Digital thermometer', 'DEI', 'piece(s)', '2000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DEI-121,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(326, 'dras0326', 'Digital thermometer', 'Sirui', 'piece(s)', '108.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>SR-2001,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(327, 'dras0327', 'Din Rail', '', 'length(s)', '1062.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(328, 'dras0328', 'Drain heater', '', 'piece(s)', '0.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(cartridge-type)80w/230v/1.5m,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(329, 'dras0329', 'Drill bit', '', 'piece(s)', '95.0000', '0.0000', 20, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/8",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(330, 'dras0330', 'Drill bit', '', 'piece(s)', '358.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/4",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(331, 'dras0331', 'Drill bit', '', 'piece(s)', '195.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(332, 'dras0332', 'Drill bit', '', 'piece(s)', '62.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(333, 'dras0333', 'Drill bit', '', 'piece(s)', '1850.0000', '0.0000', 20, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/16",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(334, 'dras0334', 'Dual pressure control', 'Danfoss', 'piece(s)', '25.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>KP15 (060-124366),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(335, 'dras0335', 'Dyna Bolt', '', 'piece(s)', '94.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8" x 70mm 60pcs/box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(336, 'dras0336', 'Elastoseal', '', 'pack(s)', '17.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>250g,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(337, 'dras0337', 'Electrical tape', '', 'roll(s)', '85500.0000', '0.0000', 30, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(338, 'dras0338', 'Evaporator', 'Eden', 'unit(s)', '75000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FEME 0290,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(339, 'dras0339', 'Evaporator', 'Eden', 'unit(s)', '78000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FEME 0378,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(340, 'dras0340', 'Evaporator', 'Eden', 'unit(s)', '93000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FEME 0413,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(341, 'dras0341', 'Evaporator', 'Eden', 'unit(s)', '118000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FEME 0500,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(342, 'dras0342', 'Evaporator', 'Eden', 'unit(s)', '53000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FEME 0512,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(343, 'dras0343', 'Evaporator', 'Eden', 'unit(s)', '39000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FEME 0262 LT6,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(344, 'dras0344', 'Evaporator', 'Eden', 'unit(s)', '67000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FEME 0303,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(345, 'dras0345', 'Evaporator', 'Eden', 'unit(s)', '93000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FEME 0317,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(346, 'dras0346', 'Evaporator', 'Eden', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FEME 0500 LT6,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(347, 'dras0347', 'Evaporator', 'Eden', 'unit(s)', '155000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FEME 0700,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(348, 'dras0348', 'Evaporator', 'Eden', 'unit(s)', '36000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FEME 0795,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(349, 'dras0349', 'Evaporator', 'LU.VE', 'unit(s)', '34000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>7.0mm Fins SHA28-E80,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(350, 'dras0350', 'Evaporator', 'LU.VE', 'unit(s)', '32000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4.5mm Fins SHA27-E50,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(351, 'dras0351', 'Evaporator', 'LU.VE', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3.0mm Fins SHA60-N32,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(352, 'dras0352', 'Expansion shield', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8" Grip Anchor,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(353, 'dras0353', 'Fabrication', '', 'piece(s)', '700.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Island Freezer Joint,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(354, 'dras0354', 'Fan motor', 'Elco', 'piece(s)', '1500.0000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>VN 10-20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(355, 'dras0355', 'Fan motor', 'Elco', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>VN 18-30,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(356, 'dras0356', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18" (450mm)? 1 Phase, 50/60hz YWF4E-450,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(357, 'dras0357', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>M16055-BD 87-25 w/ fan blade and housing,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(358, 'dras0358', 'Fan motor', 'Guntner', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>VT0119611 FC091-6DS.7Q,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(359, 'dras0359', 'Fan motor', '', 'piece(s)', '15000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(KV-81A) 3NA17241-C,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(360, 'dras0360', 'Fan motor', 'Ebmpapst', 'piece(s)', '17000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S4E315-AA07 38LE,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(361, 'dras0361', 'Fan motor', 'Ebmpapst', 'piece(s)', '520.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>16" (400mm)? 1 Phase, 50/60hz S4E 400-AR11-64LE,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(362, 'dras0362', 'Filter core', 'Danfoss', 'piece(s)', '1098.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>48DM / 48DC Stone,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(363, 'dras0363', 'Filter core', 'Emerson', 'piece(s)', '4800.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>F-48 felt,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(364, 'dras0364', 'Filter core housing', 'Danfoss', 'piece(s)', '5500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm (7/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(365, 'dras0365', 'Filter core housing', 'Danfoss', 'piece(s)', '8000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm (1?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(366, 'dras0366', 'Filter core housing', 'Danfoss', 'piece(s)', '8000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm (2-?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(367, 'dras0367', 'Filter core housing', 'Danfoss', 'piece(s)', '420.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>64mm (2-5/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(368, 'dras0368', 'Filter drier', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 12, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") DML 163 (023Z5008) (023Z5043) Flare 12pcs/box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(369, 'dras0369', 'Filter drier', 'Danfoss', 'piece(s)', '420.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") DCL 163s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(370, 'dras0370', 'Filter drier', 'Danfoss', 'piece(s)', '450.0000', '0.0000', 12, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm (?") DML 164 (02375044) Flare 12pcs/box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(371, 'dras0371', 'Filter drier', 'Danfoss', 'piece(s)', '930.0000', '0.0000', 12, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") DML 165 (02375045) Flare 12pcs/box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(372, 'dras0372', 'Filter drier', 'Danfoss', 'piece(s)', '11.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm (7/8") DCL 307s Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(373, 'dras0373', 'Flare nut', '', 'piece(s)', '25.0000', '0.0000', 15, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6mm (?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(374, 'dras0374', 'Flare nut', '', 'piece(s)', '45.0000', '0.0000', 15, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(375, 'dras0375', 'Flare nut', '', 'piece(s)', '52.0000', '0.0000', 15, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm (?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(376, 'dras0376', 'Flare nut', '', 'piece(s)', '9.1700', '0.0000', 15, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(377, 'dras0377', 'Flare nut', '', 'piece(s)', '271.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(378, 'dras0378', 'Flat bar', '', 'length(s)', '445.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" x 3/16",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(379, 'dras0379', 'Flat bar', '', 'length(s)', '271.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" x ?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(380, 'dras0380', 'Flat bar', '', 'length(s)', '380.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" x 1/8",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(381, 'dras0381', 'Flexible conduit', '', 'roll(s)', '580.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?" 100mtrs/roll,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(382, 'dras0382', 'Flexible conduit', '', 'roll(s)', '420.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?" 100mtrs/roll,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(383, 'dras0383', 'Flexible conduit', '', 'roll(s)', '1380.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1" 100mtrs/roll,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(384, 'dras0384', 'Flexible conduit', '', 'roll(s)', '1740.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" 100mtrs/roll,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(385, 'dras0385', 'Flexible conduit', '', 'roll(s)', '80.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2" 100mtrs/roll,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(386, 'dras0386', 'Flexible conduit', '', 'roll(s)', '17.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/2" liquid-tight gray 100mtrs/roll,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(387, 'dras0387', 'Flexible conduit / PVC Adaptor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/4" W/ Lock,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(388, 'dras0388', 'Fluorescent ballast', '', 'piece(s)', '349.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>36w (40w)220v,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000');
INSERT INTO `sma_products` (`id`, `code`, `name`, `brand`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier_id`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`) VALUES
(389, 'dras0389', 'Fluorescent ballast', '', 'piece(s)', '98.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>40w,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(390, 'dras0390', 'Fluorescent ballast', 'Palawite', 'piece(s)', '275.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>32w 220v,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(391, 'dras0391', 'Fluorescent ballast', 'Philips/Firefly', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>58w 220v,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(392, 'dras0392', 'Fluorescent holder', '', 'piece(s)', '185.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>for Nakano cabinet,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(393, 'dras0393', 'Fluorescent holder', '', 'piece(s)', '125.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>for Upright cabinet,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(394, 'dras0394', 'Fluorescent holder', '', 'piece(s)', '70.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>for ABT cabinet,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(395, 'dras0395', 'Fluorescent starter', 'Philips', 'piece(s)', '70.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4-45w,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(396, 'dras0396', 'Fluorescent starter', 'GE', 'piece(s)', '6.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4-48w,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(397, 'dras0397', 'Fluorescent starter', 'Firefly', 'piece(s)', '7.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4-65w,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(398, 'dras0398', 'Fluorescent starter', '', 'piece(s)', '65.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4-80w,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(399, 'dras0399', 'Fluorescent tube', '', 'piece(s)', '265.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>25w,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(400, 'dras0400', 'Fluorescent tube', 'Philips', 'set(s)', '48.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>40w,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(401, 'dras0401', 'Fluorescent tube', 'GE', 'piece(s)', '300.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>36W, Warm white,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(402, 'dras0402', 'Fluorescent tube', 'Osram', 'piece(s)', '300.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>30w, Natura 30w/76 26L 895:Part # 11.14 10Pc/Box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(403, 'dras0403', 'Fluorescent tube', 'Osram', 'piece(s)', '50.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>36w, Natura L36w/76 1200:Part # 10.36 25Pc/Box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(404, 'dras0404', 'Fluorescent tube', 'Osram', 'piece(s)', '68.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>58w, Natura L58w/76 1500:Part # 19.42 10Pc/Box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(405, 'dras0405', 'Fluorescent tube', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>36w, Daylight,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(406, 'dras0406', 'Fluorescent tube', '', 'piece(s)', '359.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>58w, Warm white,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(407, 'dras0407', 'Fluorescent tube assembly', '', 'set(s)', '1608.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>40w,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(408, 'dras0408', 'Frame heater', '', 'piece(s)', '281.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>11m/275w/220v,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(409, 'dras0409', 'G.I. pipe', '', 'length(s)', '513.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1" x .4,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(410, 'dras0410', 'G.I. pipe', '', 'length(s)', '280.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1" ? x 20''L,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(411, 'dras0411', 'G.I. pipe', '', 'length(s)', '400.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/2" ? x 20''L SCH.40,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(412, 'dras0412', 'Galvanized iron (G.I.) sheet', '', 'piece(s)', '6.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4'' x 8'' x .035mmthk,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(413, 'dras0413', 'Glass Fuse', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2.5A,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(414, 'dras0414', 'Glass Fuse', '', 'piece(s)', '6.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5x20mm10A,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(415, 'dras0415', 'Glass Fuse', '', 'piece(s)', '7792.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6x30mm 3AMP,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(416, 'dras0416', 'Globe valve', 'Danfoss', 'piece(s)', '4144.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm (7/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(417, 'dras0417', 'Globe valve', 'Castel', 'piece(s)', '4800.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm (1-3/8") 6512/11,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(418, 'dras0418', 'Globe valve', 'Castel', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm (1-5/8") 6512/13,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(419, 'dras0419', 'Grinding Disk', '', 'piece(s)', '27.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(420, 'dras0420', 'Hacksaw blade', 'Sandcut', 'piece(s)', '360.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(421, 'dras0421', 'Hacksaw frame', '', 'piece(s)', '225.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(422, 'dras0422', 'Hand Tap', '', 'piece(s)', '1050.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>M4X-0.7,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(423, 'dras0423', 'Hand valve', 'Castel', 'piece(s)', '1456.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6mm 6210/2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(424, 'dras0424', 'Hand valve', 'Castel', 'piece(s)', '23500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") 6210/5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(425, 'dras0425', 'Head Fan', '', 'piece(s)', '14000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>343-022-127 for Bitzer 6J-22.2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(426, 'dras0426', 'Head Fan', '', 'piece(s)', '26000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>For Copeland Compressor 4S Series,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(427, 'dras0427', 'Head Fan', '', 'piece(s)', '3.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>for Bitzer 4H-15.2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(428, 'dras0428', 'Hexagonal screw (bolt)', '', 'piece(s)', '10.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8" x 1?" Fine thread,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(429, 'dras0429', 'Hexagonal screw (bolt)', '', 'piece(s)', '4.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/4 x 2?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(430, 'dras0430', 'Hexagonal screw (bolt)', '', 'piece(s)', '1.5500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8" x 2",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(431, 'dras0431', 'Hexagonal screw (bolt)', '', 'piece(s)', '2.3000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8" x 1",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(432, 'dras0432', 'Hexagonal screw (bolt)', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8" x 1?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(433, 'dras0433', 'Hexagonal screw (bolt)', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/16" x 1",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(434, 'dras0434', 'Hexagonal screw (bolt)', '', 'piece(s)', '19.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8" x ?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(435, 'dras0435', 'Hexagonal screw (bolt)', '', 'piece(s)', '0.6500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5/16" x 3/4" w/ Nut and Washer,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(436, 'dras0436', 'Hexagonal screw (bolt)', '', 'piece(s)', '1200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/4" x 1",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(437, 'dras0437', 'High pressure control', 'Danfoss', 'piece(s)', '1200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Auto KP5 (060-117191) High Pressure switch,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(438, 'dras0438', 'High pressure control', 'Danfoss', 'piece(s)', '1200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Manual KP5 (060-117366) High Pressure switch,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(439, 'dras0439', 'High pressure control', 'ALCO', 'piece(s)', '650.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>range: 6-30bar,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(440, 'dras0440', 'High pressure gauge', 'REFCO', 'piece(s)', '0.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/8 NPT, 1-30 bar (1-400psi), R22/R404 MR302-DS R22 (7413020) W/ Glycerine,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(441, 'dras0441', 'Idro Box', 'B-TICINO', 'piece(s)', '35.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>25501,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(442, 'dras0442', 'Incandescent bulb', '', 'piece(s)', '0.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>60w,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(443, 'dras0443', 'Jackwrap Stretch Film', '', 'roll(s)', '17.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#15HC,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(444, 'dras0444', 'Junction Box', '', 'piece(s)', '38.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4" x 4" Orange, w/ cover and screw 4x4,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(445, 'dras0445', 'Lacquer thinner', '', 'bottle(s)', '300.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(446, 'dras0446', 'Link module', 'Siemens', 'piece(s)', '560.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3RA1921-1A,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(447, 'dras0447', 'Link module', 'Siemens', 'piece(s)', '98000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3RA1931-1A,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(448, 'dras0448', 'Liquid receiver', '', 'unit(s)', '23500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1200mmLx450mmD W/ Relief Valve,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(449, 'dras0449', 'Liquid receiver', '', 'unit(s)', '98000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>30L Capacity W/ Relief Valve,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(450, 'dras0450', 'Liquid receiver', '', 'unit(s)', '1200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>60L Capacity W/ Relief Valve,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(451, 'dras0451', 'Low pressure control', 'Danfoss', 'piece(s)', '650.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>KP1 (060-110166) Low Pressure switch,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(452, 'dras0452', 'Low pressure gauge', 'REFCO', 'piece(s)', '0.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/8 NPT , 1-10bar (1-140psi), R22/R404 MR202-DS R22 (7413012) W/ Glycerine,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(453, 'dras0453', 'Magnetic contactor', 'Siemens', 'piece(s)', '2368.7500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3RT1024-1AL20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(454, 'dras0454', 'Magnetic contactor', 'Siemens', 'piece(s)', '3237.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>230v 3RT1025-1AL20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(455, 'dras0455', 'Magnetic contactor', 'Siemens', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3RT1026-1AL20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(456, 'dras0456', 'Magnetic contactor', 'Siemens', 'piece(s)', '839.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3RT1034-1AL20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(457, 'dras0457', 'Magnetic contactor', 'Siemens', 'piece(s)', '995.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3TF 30,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(458, 'dras0458', 'Magnetic contactor', 'Siemens', 'piece(s)', '1162.5000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3TF 31,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(459, 'dras0459', 'Magnetic contactor', 'Siemens', 'piece(s)', '1425.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3TF 32,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(460, 'dras0460', 'Magnetic contactor', 'Siemens', 'piece(s)', '1655.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3TF 33,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(461, 'dras0461', 'Magnetic contactor', 'Siemens', 'piece(s)', '2097.5000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3TF 34,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(462, 'dras0462', 'Magnetic contactor', 'Siemens', 'piece(s)', '2718.7500', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3TF 35,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(463, 'dras0463', 'Magnetic contactor', 'Siemens', 'piece(s)', '4000.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3TF 46,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(464, 'dras0464', 'Magnetic contactor', 'Siemens', 'piece(s)', '4500.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3TF 47,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(465, 'dras0465', 'Magnetic contactor', 'Siemens', 'piece(s)', '9500.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3TF 48,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(466, 'dras0466', 'Magnetic contactor', 'Siemens', 'piece(s)', '296.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3TF 51,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(467, 'dras0467', 'Magnetic contactor', 'Vecas', 'piece(s)', '442.0000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>LC1-D1210,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(468, 'dras0468', 'Magnetic contactor', 'Vecas', 'piece(s)', '492.8000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>LC1-D1810,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(469, 'dras0469', 'Magnetic contactor', 'Vecas', 'piece(s)', '716.8000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>LC1-D2510,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(470, 'dras0470', 'Magnetic contactor', 'Vecas', 'piece(s)', '0.0000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>LC1-D3210,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(471, 'dras0471', 'Magnetic contactor', 'Schneider', 'piece(s)', '3250.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>LC1-D06 N w/ Overload,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(472, 'dras0472', 'Magnetic contactor', 'Telemecanique', 'piece(s)', '823.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>LC1-D40M7 LC1-D40AM7,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(473, 'dras0473', 'Magnetic contactor', 'Schneider', 'piece(s)', '1344.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>LC1-D12M7,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(474, 'dras0474', 'Magnetic contactor', 'Federal', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FC-32D10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(475, 'dras0475', 'Magnetic contactor', 'Federal', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FC-115D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(476, 'dras0476', 'Magnetic contactor', 'Taian', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>CN-6-36,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(477, 'dras0477', 'Magnetic contactor', 'CJX2', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>CHINT,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(478, 'dras0478', 'Magnetic contactor', 'Coter', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35D10 35A/400v,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(479, 'dras0479', 'Magnetic contactor', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>CI 32,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(480, 'dras0480', 'Magnetic contactor', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>CI 37,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(481, 'dras0481', 'Magnetic contactor', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>CI 50,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(482, 'dras0482', 'Magnetic contactor', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>CI 60,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(483, 'dras0483', 'Magnetic contactor', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>CI 72,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(484, 'dras0484', 'Magnetic contactor', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>CI 86,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(485, 'dras0485', 'Magnetic contactor', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DP 60-3,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(486, 'dras0486', 'Magnetic contactor', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DP 75-3,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(487, 'dras0487', 'Magnetic contactor', 'Federal', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FC115D w/ Auxillary contact,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(488, 'dras0488', 'Manual night blind curtain', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3" (Single roll),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(489, 'dras0489', 'Manual night blind curtain', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4" (Single roll),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(490, 'dras0490', 'Manual night blind curtain', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3" (Double roll),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(491, 'dras0491', 'Manual night blind curtain', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4" (Double roll),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(492, 'dras0492', 'Manual night blind curtain', '', 'piece(s)', '25.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4" (Aluminum curtain) (Double roll),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(493, 'dras0493', 'Masking tape', '', 'roll(s)', '0.6500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(494, 'dras0494', 'Metal screw', '', 'piece(s)', '0.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/8" x 3/4",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(495, 'dras0495', 'Metal screw', '', 'piece(s)', '125.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/8" x 1",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(496, 'dras0496', 'Miniature circuit breaker (MCB)', 'Fael', 'piece(s)', '465.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6A/1 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(497, 'dras0497', 'Miniature circuit breaker (MCB)', 'Fael', 'piece(s)', '221.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6A/3 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(498, 'dras0498', 'Miniature circuit breaker (MCB)', 'Fael', 'piece(s)', '331.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10A/2 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(499, 'dras0499', 'Miniature circuit breaker (MCB)', 'Fael', 'piece(s)', '331.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10A/3 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(500, 'dras0500', 'Miniature circuit breaker (MCB)', 'Fael', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>16A/3 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(501, 'dras0501', 'Miniature circuit breaker (MCB)', 'Federal', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10A/1 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(502, 'dras0502', 'Miniature circuit breaker (MCB)', 'Wixin', 'piece(s)', '355.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10A/3 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(503, 'dras0503', 'Miniature circuit breaker (MCB)', 'ABB', 'piece(s)', '295.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6A/2 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(504, 'dras0504', 'Miniature circuit breaker (MCB)', 'ABB', 'piece(s)', '355.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6A/1 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(505, 'dras0505', 'Miniature circuit breaker (MCB)', 'ABB', 'piece(s)', '553.7500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10A/2 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(506, 'dras0506', 'Miniature circuit breaker (MCB)', 'ABB', 'piece(s)', '537.6500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10A/3 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(507, 'dras0507', 'Miniature circuit breaker (MCB)', 'ABB', 'piece(s)', '533.7500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>16A/2 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(508, 'dras0508', 'Miniature circuit breaker (MCB)', 'ABB', 'piece(s)', '537.6500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>16A/3 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(509, 'dras0509', 'Miniature circuit breaker (MCB)', 'ABB', 'piece(s)', '550.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>25A/2 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(510, 'dras0510', 'Miniature circuit breaker (MCB)', 'ABB', 'piece(s)', '537.6500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>25A/3 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(511, 'dras0511', 'Miniature circuit breaker (MCB)', 'ABB', 'piece(s)', '1002.3500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>32A/2 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(512, 'dras0512', 'Miniature circuit breaker (MCB)', 'ABB', 'piece(s)', '1267.9300', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>32A/3 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(513, 'dras0513', 'Miniature circuit breaker (MCB)', 'ETIMAT', 'piece(s)', '2140.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>50A/3 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(514, 'dras0514', 'Miniature circuit breaker (MCB)', 'ABB', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>50A/3 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(515, 'dras0515', 'Miniature circuit breaker (MCB)', 'ABB', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>63A/3 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(516, 'dras0516', 'Motor Protection module', 'Bitzer', 'piece(s)', '1590.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>SE-B2 art#34702701 230/340v, 50/60hz,10%, 3VA,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(517, 'dras0517', 'Motor Protection module', 'Bock', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>MP10 art#06913 230/250v, 50/60hz,10% 750VA,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(518, 'dras0518', 'Motor starter(Capacitor)', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>CIM 6,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(519, 'dras0519', 'Motor starter(Capacitor)', 'Danfoss', 'piece(s)', '975.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>CIM 15,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(520, 'dras0520', 'MS Steel plate', '', 'piece(s)', '62.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4" x 8" x 1.5mm thk,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(521, 'dras0521', 'Nail', '', 'piece(s)', '60.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1 1/2",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(522, 'dras0522', 'Nail', '', 'piece(s)', '15.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(523, 'dras0523', 'Name plate', '', 'piece(s)', '0.3000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(524, 'dras0524', 'Nut', '', 'piece(s)', '0.0000', '0.0000', 50, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/4",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(525, 'dras0525', 'Nut', '', 'piece(s)', '4700.0000', '0.0000', 50, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(526, 'dras0526', 'Oil Differential pressure control', 'Danfoss', 'piece(s)', '44000.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>MP55 MP55(160B017266) Oil Pressure switch,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(527, 'dras0527', 'Oil Pump', 'Bitzer', 'piece(s)', '19000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>305 125-03,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(528, 'dras0528', 'Oil Reservoir', '', 'unit(s)', '17000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>F-6617CSG400,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(529, 'dras0529', 'Oil Reservoir', 'Henry', 'piece(s)', '200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S-9108,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(530, 'dras0530', 'Oil Seal', '', 'piece(s)', '11000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mmx27mmx7mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(531, 'dras0531', 'Oil Seal', '', 'piece(s)', '11000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm (1-5/8") A-W569213,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(532, 'dras0532', 'Oil separator', 'Emerson', 'piece(s)', '11000.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm (1-5/8") AF5792-13,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(533, 'dras0533', 'Oil separator', 'Emerson', 'piece(s)', '11000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm (1-5/8") AFS892-13,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(534, 'dras0534', 'Oil separator', 'Henry', 'piece(s)', '1722.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm (1-5/8") A-W569213,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(535, 'dras0535', 'Oil separator', '', 'piece(s)', '2800.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FOR-8,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(536, 'dras0536', 'Oil strainer', 'Henry', 'piece(s)', '420.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") S-9105 Flare,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(537, 'dras0537', 'Orifice', 'Danfoss', 'piece(s)', '450.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#00 (068-2003) For TEX-2/TES-2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(538, 'dras0538', 'Orifice', 'Danfoss', 'piece(s)', '420.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#01 (068-2010) For TEX-2/TES-2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(539, 'dras0539', 'Orifice', 'Danfoss', 'piece(s)', '450.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#02 (068-2015) For TEX-2/TES-2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(540, 'dras0540', 'Orifice', 'Danfoss', 'piece(s)', '450.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#03 (068-2006) For TEX-2/TES-2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(541, 'dras0541', 'Orifice', 'Danfoss', 'piece(s)', '450.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#04 (068-2007) For TEX-2/TES-2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(542, 'dras0542', 'Orifice', 'Danfoss', 'piece(s)', '450.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#05 (068-2008) For TEX-2/TES-2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(543, 'dras0543', 'Orifice', 'Danfoss', 'piece(s)', '17500.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#06 (068-2009) For TEX-2/TES-2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(544, 'dras0544', 'Overhauling gasket', 'Bitzer', 'set(s)', '17500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>372-811-07,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(545, 'dras0545', 'Overhauling gasket', 'Bitzer', 'set(s)', '14500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>372-811-08,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(546, 'dras0546', 'Overhauling gasket', 'Bitzer', 'set(s)', '25800.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>372-816-01,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(547, 'dras0547', 'Overhauling gasket', 'Bitzer', 'set(s)', '19000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>372-816-02,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(548, 'dras0548', 'Overhauling gasket', 'Bitzer', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>372-818-01 S4G-12.2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(549, 'dras0549', 'Overhauling gasket', 'Bitzer', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>372-841-01,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(550, 'dras0550', 'Overhauling gasket', 'Bitzer', 'set(s)', '18500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>372-807-01,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(551, 'dras0551', 'Overhauling gasket', 'Bitzer', 'set(s)', '21500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>372-811-03 4H-15.2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(552, 'dras0552', 'Overhauling gasket', 'Bitzer', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>372-811-05,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(553, 'dras0553', 'Overhauling gasket', 'Bitzer', 'set(s)', '19000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>372-816-04,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(554, 'dras0554', 'Overhauling gasket', 'Bitzer', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>372-816-03,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(555, 'dras0555', 'Overhauling gasket', 'Copeland', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>998-0669-04,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(556, 'dras0556', 'Overhauling gasket', 'Bock', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8961,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(557, 'dras0557', 'Overhauling gasket', 'Bitzer', 'set(s)', '155.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>372-811-02,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(558, 'dras0558', 'Overhauling gasket', '', 'set(s)', '3950.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6H,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(559, 'dras0559', 'Overload breaker', 'Siemens', 'piece(s)', '5606.2500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>14 - 20A 3RV1021-4BA10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(560, 'dras0560', 'Overload breaker', 'Siemens', 'piece(s)', '7800.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>20 - 25A 3RV1021-4DA10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(561, 'dras0561', 'Overload breaker', 'Siemens', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22 - 32A 3RV1031-4EA10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(562, 'dras0562', 'Overload breaker', 'Siemens', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>36-45A 3RV1031-4GA10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(563, 'dras0563', 'Overload breaker', 'Siemens', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>7-10A 3RV1011-1JA10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(564, 'dras0564', 'Overload breaker', 'T&B', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4-6.3A GV2-M10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(565, 'dras0565', 'Overload breaker', 'T&B', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>GV2 M20-C,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(566, 'dras0566', 'Overload breaker', 'T&B', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>GV2 M22,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(567, 'dras0567', 'Overload breaker', 'Telemecanique', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>56-80A GV3ME80,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(568, 'dras0568', 'Overload breaker', 'Siemens', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>? 3RV1021-BA15,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(569, 'dras0569', 'Overload protector/relay', 'Siemens', 'piece(s)', '720.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>0.63 - 1A 3UA50 40-0J,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(570, 'dras0570', 'Overload protector/relay', 'Siemens', 'piece(s)', '750.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2.5 - 4A 3UA50 40-1E,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(571, 'dras0571', 'Overload protector/relay', 'Siemens', 'piece(s)', '712.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4 - 6.3A 3UA50 40-1G,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(572, 'dras0572', 'Overload protector/relay', 'Siemens', 'piece(s)', '712.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5 - 8A 3UA50 40-1H,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(573, 'dras0573', 'Overload protector/relay', 'Siemens', 'piece(s)', '712.0000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6.3 - 10A 3UA50 40-1J,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(574, 'dras0574', 'Overload protector/relay', 'Siemens', 'piece(s)', '800.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8 - 12.5A 3UA50 40-1K,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(575, 'dras0575', 'Overload protector/relay', 'Siemens', 'piece(s)', '950.0000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>16 -25A 3UA52 40-2C,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(576, 'dras0576', 'Overload protector/relay', 'Siemens', 'piece(s)', '1015.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10-16A 3UA55 40-2A,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(577, 'dras0577', 'Overload protector/relay', 'Siemens', 'piece(s)', '1376.0000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12.5-20A 3UA55 40-2B,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(578, 'dras0578', 'Overload protector/relay', 'Siemens', 'piece(s)', '1300.0000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>20-32A 3UA55 40-2D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(579, 'dras0579', 'Overload protector/relay', 'Siemens', 'piece(s)', '909.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>25-36A 3UA55 40-2Q,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(580, 'dras0580', 'Overload protector/relay', 'Siemens', 'piece(s)', '1162.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>32-40 3UA55 40-2R,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000');
INSERT INTO `sma_products` (`id`, `code`, `name`, `brand`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier_id`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`) VALUES
(581, 'dras0581', 'Overload protector/relay', 'Siemens', 'piece(s)', '2750.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>36-45A 3UA55 40-8M,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(582, 'dras0582', 'Overload protector/relay', 'Siemens', 'piece(s)', '1450.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12.5-20A 3UA58 40-2B,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(583, 'dras0583', 'Overload protector/relay', 'Siemens', 'piece(s)', '1400.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>16-25A 3UA58 40-2C,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(584, 'dras0584', 'Overload protector/relay', 'Siemens', 'piece(s)', '1141.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22-32A 3UA58 40-2D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(585, 'dras0585', 'Overload protector/relay', 'Siemens', 'piece(s)', '1486.0000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>25-40A 3UA58 40-2E,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(586, 'dras0586', 'Overload protector/relay', 'Siemens', 'piece(s)', '1800.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>32-50A 3UA58 40-2F,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(587, 'dras0587', 'Overload protector/relay', 'Siemens', 'piece(s)', '1515.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>50-63A 3UA58 40-2P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(588, 'dras0588', 'Overload protector/relay', 'Siemens', 'piece(s)', '1750.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>57-70A 3UA58 40-2V,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(589, 'dras0589', 'Overload protector/relay', 'Siemens', 'piece(s)', '2187.5000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>63-80A 3UA58 40-2U,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(590, 'dras0590', 'Overload protector/relay', 'Siemens', 'piece(s)', '750.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>55-80A 3UA60 40-2H,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(591, 'dras0591', 'Overload protector/relay', 'Siemens', 'piece(s)', '0.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10-14.5A 3UA50 40-2S,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(592, 'dras0592', 'Overload protector/relay', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DOL: 6-9A, Y/D: 10-16A 047H307000 (TI 9C),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(593, 'dras0593', 'Overload protector/relay', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DOL: 8-12A, Y/D: 13-20.8A 047H0111 (TI 16),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(594, 'dras0594', 'Overload protector/relay', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DOL:1.8-2.8A,Y/D:3.2-4.8A 047H0207 (TI 16C),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(595, 'dras0595', 'Overload protector/relay', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DOL: 2.7-4.2A, Y/D: 4.7-7.3A 047H4208 (TI 16C),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(596, 'dras0596', 'Overload protector/relay', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DOL: 4-6.2A, Y/D: 6.9-10.7A 074H0209 (TI 16C),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(597, 'dras0597', 'Overload protector/relay', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DOL: 6-9.2A, Y/D: 10-16A 047H0210 (TI16C),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(598, 'dras0598', 'Overload protector/relay', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DOL: 8-12A, Y/D: 13-20.8A 047H0211 (TI 16C),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(599, 'dras0599', 'Overload protector/relay', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DOL: 15-20A, Y/D: 26-35A 047H0133 (TI 25S),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(600, 'dras0600', 'Overload protector/relay', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DOL: 19-25A, Y/D: 33-43A 047H0134 (TI 25S),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(601, 'dras0601', 'Overload protector/relay', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DOL: 15-20A, Y/D: 26-35A 074H4213 (TI 25C),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(602, 'dras0602', 'Overload protector/relay', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DOL: 24-32A, Y/D: 42-55A 047H0215 (TI 30C),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(603, 'dras0603', 'Overload protector/relay', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DOL: 15.20A, Y?D: 26-35A 047H0113 (TI25),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(604, 'dras0604', 'Overload protector/relay', 'Telemecanique', 'piece(s)', '825.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>.63-1A,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(605, 'dras0605', 'Overload protector/relay', 'Telemecanique', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12-18A LRD21,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(606, 'dras0606', 'Overload protector/relay', 'Vecas', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4-6A LR2D1310,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(607, 'dras0607', 'Overload protector/relay', 'Vecas', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>23-32A L2-L2353,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(608, 'dras0608', 'Overload protector/relay', 'Vecas', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>17-25A LR2-D1322,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(609, 'dras0609', 'Overload protector/relay', 'Vecas', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18-25A LR1-D25322,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(610, 'dras0610', 'Overload protector/relay', 'Vecas', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>38-50A,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(611, 'dras0611', 'Overload protector/relay', 'Vecas', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1.6-2.5A LR2-D1307,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(612, 'dras0612', 'Overload protector/relay', 'IDEA', 'piece(s)', '22.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>LR2-D33,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(613, 'dras0613', 'Packaging tape', '', 'roll(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(614, 'dras0614', 'Paint brush', '', 'piece(s)', '9.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(615, 'dras0615', 'Paint brush', '', 'piece(s)', '23.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(616, 'dras0616', 'Paint brush', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(617, 'dras0617', 'Paint brush roller', '', 'piece(s)', '38.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(618, 'dras0618', 'Paint thinner', '', 'bottle(s)', '260.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>350 ML / Bottle,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(619, 'dras0619', 'Paint thinner', '', 'gallon(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1 gallon,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(620, 'dras0620', 'Panel Circuit Board (PCB)', 'Hitachi', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3FB42678-V2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(621, 'dras0621', 'Panel Circuit Board (PCB)', 'Hitachi', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3FB42678-V1,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(622, 'dras0622', 'Panel Circuit Board (PCB)', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>For Humidifier,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(623, 'dras0623', 'Phase watcher', 'Carlo Gavazzi', 'piece(s)', '8012.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DPB71CM28 220v,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(624, 'dras0624', 'Phase watcher', 'Carlo Gavazzi', 'piece(s)', '8012.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>220-230v DPB71CM23,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(625, 'dras0625', 'Phase watcher', 'Carlo Gavazzi', 'piece(s)', '105.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>440-480v DPB71CM48,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(626, 'dras0626', 'Pilot lamp (neon)', 'TEND', 'piece(s)', '105.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm? led, Blue T2NR 10pcs/box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(627, 'dras0627', 'Pilot lamp (neon)', 'TEND', 'piece(s)', '105.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm? led, Green T2NR 10pcs/box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(628, 'dras0628', 'Pilot lamp (neon)', 'TEND', 'piece(s)', '105.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm? led, Red T2NR 10pcs/box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(629, 'dras0629', 'Pilot lamp (neon)', 'TEND', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm? led, yellow T2NR 10pcs/box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(630, 'dras0630', 'Pilot lamp (neon)', 'TEND', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm? led, White T2NR 10pcs/box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(631, 'dras0631', 'Piston connecting rod assembly', 'Bock', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8827,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(632, 'dras0632', 'Piston connecting rod assembly', 'Bock', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>80304,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(633, 'dras0633', 'Piston connecting rod assembly', 'Bock', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8899,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(634, 'dras0634', 'Piston connecting rod assembly', 'Bock', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8826,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(635, 'dras0635', 'Piston connecting rod assembly', 'Bock', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8828,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(636, 'dras0636', 'Piston connecting rod assembly', 'Cortex', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>502-115-00,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(637, 'dras0637', 'Piston connecting rod assembly', '', 'set(s)', '22000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>904 6900-01,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(638, 'dras0638', 'Piston connecting rod assembly', 'Bitzer', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>302 297-46,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(639, 'dras0639', 'Piston connecting rod assembly', 'Bitzer', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>302-297-43,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(640, 'dras0640', 'Piston connecting rod assembly', 'Bitzer', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>302-297-12,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(641, 'dras0641', 'Piston connecting rod assembly', 'Bitzer', 'set(s)', '8000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>302-297-31,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(642, 'dras0642', 'Piston connecting rod assembly', 'Bitzer', 'set(s)', '22500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>302-297-97,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(643, 'dras0643', 'Piston connecting rod assembly', 'Bitzer', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>307 297-40,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(644, 'dras0644', 'Piston connecting rod assembly', '', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(645, 'dras0645', 'Piston Ring', '', 'piece(s)', '400.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>For Bitzer 4NCS-12.2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(646, 'dras0646', 'Plastic Door wheel', '', 'piece(s)', '400.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm? x 16mm (bigger) fabrication,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(647, 'dras0647', 'Plastic Door wheel', '', 'piece(s)', '350.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>44mm? x 17mm (big) fabrication,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(648, 'dras0648', 'Plastic Door wheel', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>45mm? x 12mm (small),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(649, 'dras0649', 'Plastic Door wheel', '', 'piece(s)', '113.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>--,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(650, 'dras0650', 'Plastic Film (Vapor barrier)', '', 'roll(s)', '240.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#.003 x 40" tubular 7.5ntr/kg, 14.5kgs/roll,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(651, 'dras0651', 'Plug DIN', 'Danfoss', 'piece(s)', '90.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>060G1034,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(652, 'dras0652', 'Polythelene tape', '', 'roll(s)', '8500.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4" x 45yds (White),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(653, 'dras0653', 'Pressure transmitter', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1-12bar 060G1036(AKS-32R),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(654, 'dras0654', 'Pressure transmitter', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1-34bar 060G0090(AKS-32R),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(655, 'dras0655', 'Price tag rail', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Clear,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(656, 'dras0656', 'Price tag rail', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(657, 'dras0657', 'Price tag rail', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4'' (for multideck chiller),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(658, 'dras0658', 'Price tag rail', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3'' (For Island freezer),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(659, 'dras0659', 'Price tag rail', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>for 2 & 3 door cabinets,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(660, 'dras0660', 'Price tag rail', '', 'piece(s)', '1300.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Bracket,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(661, 'dras0661', 'Protection Sensor', '', 'piece(s)', '197.6000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>UT-7520K UT12-7520K 8Y2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(662, 'dras0662', 'Push Button', '', 'piece(s)', '65.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(on/off),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(663, 'dras0663', 'PVC Cement', '', 'can(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>100cc,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(664, 'dras0664', 'PVC Cement', '', 'can(s)', '10.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>400cc,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(665, 'dras0665', 'PVC elbow', '', 'piece(s)', '20.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 1" blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(666, 'dras0666', 'PVC elbow', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 1?" blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(667, 'dras0667', 'PVC elbow', '', 'piece(s)', '65.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 1?" gray,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(668, 'dras0668', 'PVC elbow', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 2" gray,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(669, 'dras0669', 'PVC elbow', '', 'piece(s)', '10.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>45? 2" Gray,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(670, 'dras0670', 'PVC elbow', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 1/2" Blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(671, 'dras0671', 'PVC elbow', '', 'piece(s)', '85.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 3/4" Blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(672, 'dras0672', 'PVC pipe', '', 'length(s)', '42.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1" Blue 10ft/length,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(673, 'dras0673', 'PVC pipe', '', 'length(s)', '58.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?" blue 10ft/length,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(674, 'dras0674', 'PVC pipe', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?" orange 10ft/length,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(675, 'dras0675', 'PVC pipe', '', 'length(s)', '675.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/4" orange 10ft/length,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(676, 'dras0676', 'PVC pipe', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" blue 10ft/length,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(677, 'dras0677', 'PVC pipe', '', 'length(s)', '158.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" gray 10ft/length,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(678, 'dras0678', 'PVC pipe', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" Orange 10ft/length,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(679, 'dras0679', 'PVC pipe', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2" Orange 10ft/length,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(680, 'dras0680', 'PVC pipe', '', 'length(s)', '130.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2" gray 10ft/length,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(681, 'dras0681', 'PVC pipe', '', 'length(s)', '1311.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3" gray 10ft/length,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(682, 'dras0682', 'PVC pipe', '', 'length(s)', '6000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8" gray 10ft/length,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(683, 'dras0683', 'PVC strip curtain', '', 'roll(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(SGF)-40 Grade 200mmx2.0mmx50mtrs 50mtrs/roll,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(684, 'dras0684', 'PVC switch Box', '', 'piece(s)', '16.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(685, 'dras0685', 'PVC tee', '', 'piece(s)', '33.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" gray,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(686, 'dras0686', 'PVC tee', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(687, 'dras0687', 'PVC tee', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1" gray,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(688, 'dras0688', 'PVC tee', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?" blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(689, 'dras0689', 'PVC tee', '', 'piece(s)', '150.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/4" Blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(690, 'dras0690', 'QDE paint', '', 'can(s)', '143.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Silver gray 1ltr,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(691, 'dras0691', 'QDE paint', '', 'can(s)', '155.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Royal blue 1ltr,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(692, 'dras0692', 'QDE paint', '', 'can(s)', '180.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>International red 1ltr,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(693, 'dras0693', 'QDE paint', '', 'can(s)', '167.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Lemon yellow 1ltr,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(694, 'dras0694', 'QDE paint', '', 'can(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>White 1ltr,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(695, 'dras0695', 'Oxide primer', '', 'can(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>epoxy white 1ltr,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(696, 'dras0696', 'QDE paint', '', 'can(s)', '132.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>*,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(697, 'dras0697', 'QDE paint', '', 'liter(s)', '510.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Black ?ltr,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(698, 'dras0698', 'QDE paint', '', 'gallon(s)', '60.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>*,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(699, 'dras0699', 'Rags', '', 'kilogram(s)', '106.0000', '0.0000', 60, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>white/round/thin,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(700, 'dras0700', 'Oxide Primer', 'Boysen', 'can(s)', '223.3300', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>epoxy red 1ltr,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(701, 'dras0701', 'Refrigerant', '', 'can(s)', '500.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>R141B 30kgs/can,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(702, 'dras0702', 'Refrigerant', '', 'cylinder(s)', '4994.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>R134A,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(703, 'dras0703', 'Refrigerant freon', '', 'cylinder(s)', '2670.0000', '0.0000', 15, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>R22, 22.7kgs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(704, 'dras0704', 'Refrigerant freon', '', 'cylinder(s)', '2856.0000', '0.0000', 15, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>R404A 10.9kgs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(705, 'dras0705', 'Refrigerant freon', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>R22,13.6kgs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(706, 'dras0706', 'Refrigerant freon', '', '', '450.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>R507. 11.6kgs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(707, 'dras0707', 'Refrigeration oil', 'Emkarate', '', '3000.0000', '0.0000', 36, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>RL68RH (1ltr/can),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(708, 'dras0708', 'Refrigeration controller', 'Danfoss', '', '0.0000', '0.0000', 6, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>EKC 202c with sensor (EKS 211),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(709, 'dras0709', 'Refrigeration controller', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>EKC 202D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(710, 'dras0710', 'Refrigeration controller', 'LAE', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>LD1-15B2E-G,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(711, 'dras0711', 'Refrigeration controller', 'DEI', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DEI-107FE,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(712, 'dras0712', 'Relay', 'Omron', '', '180.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12v MY4-J w/ Socket,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(713, 'dras0713', 'Relay', 'Omron', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>220v MY4N-J w/ Socket,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(714, 'dras0714', 'Relay', 'Carlo Gavazzi', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>220v RMIA 45,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(715, 'dras0715', 'Relay', '', '', '15000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2 Pins PTC,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(716, 'dras0716', 'Rewind', '', '', '35.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(717, 'dras0717', 'Rubber insulation', '', 'length(s)', '103.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm x ?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(718, 'dras0718', 'Rubber insulation', '', 'length(s)', '46.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm x 1" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(719, 'dras0719', 'Rubber insulation', '', 'length(s)', '116.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm x ?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(720, 'dras0720', 'Rubber insulation', '', 'length(s)', '151.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm x 1" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(721, 'dras0721', 'Rubber insulation', '', 'length(s)', '70.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm x 1" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(722, 'dras0722', 'Rubber insulation', '', 'length(s)', '350.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm x ?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(723, 'dras0723', 'Rubber insulation', '', 'length(s)', '165.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm x 1?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(724, 'dras0724', 'Rubber insulation', '', 'length(s)', '54.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18mm x 1" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(725, 'dras0725', 'Rubber insulation', '', 'length(s)', '400.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18mm x ?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(726, 'dras0726', 'Rubber insulation', '', 'length(s)', '185.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18mm x 1?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(727, 'dras0727', 'Rubber insulation', '', 'length(s)', '65.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm x 1" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(728, 'dras0728', 'Rubber insulation', '', 'length(s)', '456.3000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm x ?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(729, 'dras0729', 'Rubber insulation', '', 'length(s)', '900.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm x 1?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(730, 'dras0730', 'Rubber insulation', '', 'length(s)', '200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm x 2" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(731, 'dras0731', 'Rubber insulation', '', 'length(s)', '74.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm x 1" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(732, 'dras0732', 'Rubber insulation', '', 'length(s)', '518.0500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm x ?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(733, 'dras0733', 'Rubber insulation', '', 'length(s)', '950.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm x 1?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(734, 'dras0734', 'Rubber insulation', '', 'length(s)', '210.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm x 2" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(735, 'dras0735', 'Rubber insulation', '', 'length(s)', '615.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm x 1" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(736, 'dras0736', 'Rubber insulation', '', 'length(s)', '1200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm x 1?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(737, 'dras0737', 'Rubber insulation', '', 'length(s)', '250.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm x 2" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(738, 'dras0738', 'Rubber insulation', '', 'length(s)', '136.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm x 1" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(739, 'dras0739', 'Rubber insulation', '', 'length(s)', '629.8500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm x ?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(740, 'dras0740', 'Rubber insulation', '', 'length(s)', '1200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm x 1?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(741, 'dras0741', 'Rubber insulation', '', 'length(s)', '330.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm x 2" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(742, 'dras0742', 'Rubber insulation', '', 'length(s)', '140.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm x 1" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(743, 'dras0743', 'Rubber insulation', '', 'length(s)', '770.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm x ?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(744, 'dras0744', 'Rubber insulation', '', 'length(s)', '1365.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm x 1?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(745, 'dras0745', 'Rubber insulation', '', 'length(s)', '530.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm x 2" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(746, 'dras0746', 'Rubber insulation', '', 'length(s)', '859.9500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>64mm x 1" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(747, 'dras0747', 'Rubber insulation', '', 'length(s)', '1550.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>64mm x 1?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(748, 'dras0748', 'Rubber insulation', '', 'length(s)', '427.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>64mm x 2" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(749, 'dras0749', 'Rubber insulation', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>76mm x 1" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(750, 'dras0750', 'Rubber insulation', '', 'length(s)', '1900.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>76mm x 1?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(751, 'dras0751', 'Rubber insulation', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>76mm x 2" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(752, 'dras0752', 'Rubber insulation', '', 'length(s)', '1589.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>89mm x 1" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(753, 'dras0753', 'Rubber insulation', '', 'length(s)', '25.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>115mm x 1?x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(754, 'dras0754', 'Rubberized Hand Gloves', '', 'pair(s)', '65.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(755, 'dras0755', 'Rugby', '', 'bottle(s)', '540.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>350ml/bottle,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(756, 'dras0756', 'Rugby', '', 'can(s)', '50.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4ltrs/gallon,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(757, 'dras0757', 'Running thread', '', 'length(s)', '75.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/4" x 10'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(758, 'dras0758', 'Running thread', '', 'length(s)', '7.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8" x 10'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(759, 'dras0759', 'Sandpaper', '', 'piece(s)', '7.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#220,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(760, 'dras0760', 'Sandpaper', '', 'piece(s)', '7.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#1000,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(761, 'dras0761', 'Sandpaper', '', '', '312.8000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#280,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(762, 'dras0762', 'Selector switch', 'Tend', 'piece(s)', '312.8000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Manual-Off-Auto T2SSR,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(763, 'dras0763', 'Selector switch', 'Tend', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>On-Off TN2SS,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(764, 'dras0764', 'Selector switch', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>WIXIM,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(765, 'dras0765', 'Self Tapping screw', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12x25,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(766, 'dras0766', 'Sensor, Condensation Temperature', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(767, 'dras0767', 'Sensor, Evaporation Temperature', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(768, 'dras0768', 'Sensor, Ice Level Control assembly', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(769, 'dras0769', 'Sensor, Rotate Speed', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(770, 'dras0770', 'Shaft Seal', '', '', '447.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>374 027-01 for Bitzer S6J-16.2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(771, 'dras0771', 'Shell Oil', '', 'liter(s)', '550.0000', '0.0000', 100, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S4 FR-V 32 R22,20ltrs/pail,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(772, 'dras0772', 'Sight glass', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") SGN 105,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(773, 'dras0773', 'Sight glass', 'Danfoss', '', '60.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm (7/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(774, 'dras0774', 'Silfos rod', '', 'piece(s)', '120.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>0.02,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000');
INSERT INTO `sma_products` (`id`, `code`, `name`, `brand`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier_id`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`) VALUES
(775, 'dras0775', 'Silicone sealant', 'Prosil', 'tube(s)', '390.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Neutral white,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(776, 'dras0776', 'Silver rod', '', 'piece(s)', '700.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>0.35 Coated w/ Blue Flux,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(777, 'dras0777', 'Solenoid coil', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 15, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10w 018F6264,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(778, 'dras0778', 'Solenoid coil (for AKV)', 'Danfoss', '', '1285.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18w 018F6781,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(779, 'dras0779', 'Solenoid valve', 'Danfoss', 'piece(s)', '1900.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") EVR 6 (032F1212),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(780, 'dras0780', 'Solenoid valve', 'Danfoss', 'piece(s)', '2400.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") EVR 6 (032F1212) w/ coil,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(781, 'dras0781', 'Solenoid valve', 'Danfoss', 'piece(s)', '2000.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm (?") EVR 10 (032F1217),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(782, 'dras0782', 'Solenoid valve', 'Danfoss', 'piece(s)', '2241.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm (?") EVR 6 (032F1209),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(783, 'dras0783', 'Solenoid valve', 'Danfoss', 'piece(s)', '6500.0000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") EVR 10 (032F1214),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(784, 'dras0784', 'Solenoid valve', 'Danfoss', 'piece(s)', '2241.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm (1?") EVR 20 (032F1244),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(785, 'dras0785', 'Solenoid valve', 'Danfoss', 'piece(s)', '2800.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") EVR 15 (032F1228),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(786, 'dras0786', 'Solenoid valve', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm (7/8") EVR15 (032F1225) solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(787, 'dras0787', 'Solenoid valve', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm (7/8") EVR 20 (032F1240) solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(788, 'dras0788', 'Spray Paint', '', 'can(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>black,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(789, 'dras0789', 'Steel wheel - Heavy Duty', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(790, 'dras0790', 'Straight Connector', '', '', '1460.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/4",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(791, 'dras0791', 'Stranded wire', '', 'roll(s)', '1400.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1.25mm? Scrap,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(792, 'dras0792', 'Stranded wire', '', 'roll(s)', '1596.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1.25mm? black,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(793, 'dras0793', 'Stranded wire', '', 'roll(s)', '1459.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1.25mm? blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(794, 'dras0794', 'Stranded wire', '', 'roll(s)', '1460.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1.25mm? green,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(795, 'dras0795', 'Stranded wire', '', 'roll(s)', '1459.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1.25mm? red,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(796, 'dras0796', 'Stranded wire', '', 'roll(s)', '1460.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1.25mm? yellow,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(797, 'dras0797', 'Stranded wire', '', 'roll(s)', '2100.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1.25mm? white,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(798, 'dras0798', 'Stranded wire', '', 'roll(s)', '2100.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2mm? Scrap,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(799, 'dras0799', 'Stranded wire', '', 'roll(s)', '2100.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2mm? black,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(800, 'dras0800', 'Stranded wire', '', 'roll(s)', '2100.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2mm? blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(801, 'dras0801', 'Stranded wire', '', 'roll(s)', '2100.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2mm? green,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(802, 'dras0802', 'Stranded wire', '', 'roll(s)', '2100.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2mm? red,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(803, 'dras0803', 'Stranded wire', '', 'roll(s)', '2100.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2mm? yellow,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(804, 'dras0804', 'Stranded wire', '', 'roll(s)', '3243.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2mm? white,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(805, 'dras0805', 'Stranded wire', '', 'roll(s)', '3243.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3.5mm? Scrap,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(806, 'dras0806', 'Stranded wire', '', 'roll(s)', '3243.0000', '0.0000', 4, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3.5mm? black,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(807, 'dras0807', 'Stranded wire', '', 'roll(s)', '3243.0000', '0.0000', 4, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3.5mm? blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(808, 'dras0808', 'Stranded wire', '', 'roll(s)', '3243.0000', '0.0000', 4, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3.5mm? green,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(809, 'dras0809', 'Stranded wire', '', 'roll(s)', '3243.0000', '0.0000', 4, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3.5mm? red,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(810, 'dras0810', 'Stranded wire', '', 'roll(s)', '3243.0000', '0.0000', 4, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3.5mm? yellow,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(811, 'dras0811', 'Stranded wire', '', 'roll(s)', '4658.0000', '0.0000', 4, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3.5mm? white,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(812, 'dras0812', 'Stranded wire', '', 'roll(s)', '4658.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5.5mm?,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(813, 'dras0813', 'Stranded wire', '', 'roll(s)', '4678.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5.5mm? black,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(814, 'dras0814', 'Stranded wire', '', 'roll(s)', '4658.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5.5mm? blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(815, 'dras0815', 'Stranded wire', '', 'roll(s)', '4678.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5.5mm? green,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(816, 'dras0816', 'Stranded wire', '', 'roll(s)', '4678.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5.5mm? red,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(817, 'dras0817', 'Stranded wire', '', 'roll(s)', '4658.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5.5mm? yellow,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(818, 'dras0818', 'Stranded wire', '', 'roll(s)', '7584.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5.5mm? white,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(819, 'dras0819', 'Stranded wire', '', 'roll(s)', '7584.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8mm? Scrap,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(820, 'dras0820', 'Stranded wire', '', 'roll(s)', '7584.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8mm? black,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(821, 'dras0821', 'Stranded wire', '', 'roll(s)', '7584.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8mm? blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(822, 'dras0822', 'Stranded wire', '', 'roll(s)', '7584.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8mm? green,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(823, 'dras0823', 'Stranded wire', '', 'roll(s)', '7584.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8mm? red,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(824, 'dras0824', 'Stranded wire', '', 'roll(s)', '7584.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8mm? white,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(825, 'dras0825', 'Stranded wire', '', 'roll(s)', '12355.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8mm? yellow,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(826, 'dras0826', 'Stranded wire', '', 'roll(s)', '0.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>14mm? Black,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(827, 'dras0827', 'Super Single switch', '', '', '8.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>w/ plate,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(828, 'dras0828', 'Teflon tape', '', 'roll(s)', '4.5000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(829, 'dras0829', 'Teflon tape', '', 'roll(s)', '32.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(830, 'dras0830', 'Terminal block', '', 'piece(s)', '45.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>16A(15A)/12 pairs pvc white,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(831, 'dras0831', 'Terminal block', '', 'piece(s)', '15.2000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>32A/ 12 pairs pvc black,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(832, 'dras0832', 'Terminal block', '', 'piece(s)', '16.8000', '0.0000', 50, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>TBR 10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(833, 'dras0833', 'Terminal block', '', 'piece(s)', '20.5000', '0.0000', 50, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>TBR 20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(834, 'dras0834', 'Terminal block', '', 'piece(s)', '1.9000', '0.0000', 50, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>TBR 30,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(835, 'dras0835', 'Terminal lug', '', 'piece(s)', '0.0000', '0.0000', 100, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1.25mm?, "O",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(836, 'dras0836', 'Terminal lug', '', 'piece(s)', '0.0000', '0.0000', 100, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3.5mm?, "O",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(837, 'dras0837', 'Terminal lug', '', 'piece(s)', '13.4500', '0.0000', 100, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5.5mm?, "O",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(838, 'dras0838', 'Terminal lug', '', 'piece(s)', '18.0000', '0.0000', 50, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8mm?, "O",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(839, 'dras0839', 'Terminal lug', '', 'piece(s)', '1.9000', '0.0000', 20, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>14mm?, "O",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(840, 'dras0840', 'Terminal lug', '', 'piece(s)', '3.6000', '0.0000', 100, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1.25mm?, "Y" insulated,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(841, 'dras0841', 'Terminal lug', '', 'piece(s)', '0.0000', '0.0000', 100, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3.5mm?, "Y" insulated,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(842, 'dras0842', 'Terminal lug', '', 'piece(s)', '9.6000', '0.0000', 100, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5.5mm?, "Y" insulated,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(843, 'dras0843', 'Terminal lug', '', 'piece(s)', '100.0000', '0.0000', 50, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8mm?, "Y" insulated,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(844, 'dras0844', 'Terminal lug', '', 'piece(s)', '0.0000', '0.0000', 20, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>14mm?, "Y" insulated,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(845, 'dras0845', 'Terminal lug', '', 'piece(s)', '25.0000', '0.0000', 20, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm?, "Y",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(846, 'dras0846', 'Terminal lug', '', 'piece(s)', '1750.0000', '0.0000', 20, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm?, "O",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(847, 'dras0847', 'Thermostatic expansion valve', 'Danfoss', 'piece(s)', '1700.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>TEX-2 R22,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(848, 'dras0848', 'Thermostatic expansion valve', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>TES-2 R404,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(849, 'dras0849', 'Thermostatic expansion valve', 'Danfoss', 'piece(s)', '4400.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>TN-2 R134A,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(850, 'dras0850', 'Thermostatic expansion valve', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>TES-5 (067B3342) R404,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(851, 'dras0851', 'Three Glass Door Display Chiller', '', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(852, 'dras0852', 'Three Glass Door Display Freezer', '', 'unit(s)', '4500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(853, 'dras0853', 'Thrust Washer', 'Bitzer', 'piece(s)', '3500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>320 500-06,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(854, 'dras0854', 'Thrust Washer', 'Bitzer', 'piece(s)', '1500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>320 500-10 for 4NCS-12.2 Bitzer,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(855, 'dras0855', 'Thrust Washer', 'Bitzer', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>320 500-07,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(856, 'dras0856', 'Thrust Washer', 'Bitzer', 'piece(s)', '2500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>310 500-01,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(857, 'dras0857', 'Thrust Washer', 'Bitzer', 'piece(s)', '560.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>320 510-06,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(858, 'dras0858', 'Timedelay', 'GKK', 'piece(s)', '560.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>AH3-NB w/ socket,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(859, 'dras0859', 'Timedelay', 'GKK', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>AH3-NA w/ socket,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(860, 'dras0860', 'Timedelay', 'Wixim', 'piece(s)', '2461.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>220v,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(861, 'dras0861', 'Timedelay', 'Carlo Gavazzi', 'piece(s)', '275.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DAA51CM24B,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(862, 'dras0862', 'Top Coat Paint', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1ltr,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(863, 'dras0863', 'Transducer', '', 'piece(s)', '385.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>For Humidifier,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(864, 'dras0864', 'Transformer', '', 'piece(s)', '450.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12v/3A (Coldroom alarm),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(865, 'dras0865', 'Transformer', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>24V/12A (for traxoil),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(866, 'dras0866', 'Transformer', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>230-380v current,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(867, 'dras0867', 'Transformer', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>for EKC 201c,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(868, 'dras0868', 'Transformer', 'Sirui', 'piece(s)', '180.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>for Sirui 2001,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(869, 'dras0869', 'Transformer', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12v/1A,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(870, 'dras0870', 'Transformer', 'Vecas', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>400-200v;440-220-input;220-110-vac output 1 Phase;1 KVA Step Down,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(871, 'dras0871', 'Trax Oil', 'Bitzer', 'piece(s)', '12000.0000', '0.0000', 12, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>TR3-201,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(872, 'dras0872', 'Trax Oil', 'Emerson', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>OMB-JBI for copeland compressor 2S-series 2SCW-055,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(873, 'dras0873', 'Two Glass Door Display Freezer', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(1265mmLx760mmWx2020mmH),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(874, 'dras0874', 'U-Bolt', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(875, 'dras0875', 'U-Bolt', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(876, 'dras0876', 'U-Bolt', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(877, 'dras0877', 'Valve Body', 'Danfoss', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?" x 5/8" 067B4009(TE-5),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(878, 'dras0878', 'Valve plate', 'Bock', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(879, 'dras0879', 'Valve plate', 'Bock', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(880, 'dras0880', 'Valve plate', 'Bock', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8851,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(881, 'dras0881', 'Valve plate', 'Bitzer', 'set(s)', '0.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>304-016-01,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(882, 'dras0882', 'Valve plate', 'Bitzer', 'set(s)', '34800.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>304-016 12,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(883, 'dras0883', 'Valve plate', 'Bitzer', 'set(s)', '34500.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>304-051-01,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(884, 'dras0884', 'Valve plate', 'Bitzer', 'set(s)', '0.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>304-051-02,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(885, 'dras0885', 'Valve plate', 'Bitzer', 'set(s)', '0.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>304-051-03,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(886, 'dras0886', 'Valve plate', 'Bitzer', 'set(s)', '0.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>304-057-01,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(887, 'dras0887', 'Valve plate', 'Bitzer', 'set(s)', '0.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>304-063-08,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(888, 'dras0888', 'Valve plate', 'Bitzer', 'set(s)', '0.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>304-016-05,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(889, 'dras0889', 'Valve plate', 'Bitzer', 'set(s)', '0.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>304-016-07,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(890, 'dras0890', 'Valve plate', 'Bitzer', 'set(s)', '0.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>304 016-09,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(891, 'dras0891', 'Valve plate', 'Bitzer', 'set(s)', '0.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>304-018-01,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(892, 'dras0892', 'Valve plate', '', 'set(s)', '0.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>065/70-0;6,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(893, 'dras0893', 'Vibration eliminator', '', 'piece(s)', '850.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(894, 'dras0894', 'Vibration eliminator', '', 'piece(s)', '1300.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18mm (?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(895, 'dras0895', 'Vibration eliminator', '', 'piece(s)', '1550.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm (7/8"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(896, 'dras0896', 'Vibration eliminator', '', 'piece(s)', '1550.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm (1-1/8mm) Anaconda,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(897, 'dras0897', 'Vibration eliminator', '', 'piece(s)', '2200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm (1?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(898, 'dras0898', 'Vibration eliminator', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm (1-3/8") Anaconda,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(899, 'dras0899', 'Vibration eliminator', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm (1-5/8") Anaconda,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(900, 'dras0900', 'Vibration eliminator', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>48mm VAF9,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(901, 'dras0901', 'Voltage Relay', 'Broyce Control', 'piece(s)', '400.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>M3PRC Over/Under Voltage Relay,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(902, 'dras0902', 'Vulcaseal', '', 'can(s)', '125.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1 ltr 1ltr/can,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(903, 'dras0903', 'Vulcaseal', '', '', '216.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/4ltr,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(904, 'dras0904', 'Vulcaseal', '', '', '0.7500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/2ltr,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(905, 'dras0905', 'Washer', '', 'piece(s)', '0.0000', '0.0000', 100, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/4",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(906, 'dras0906', 'Washer', '', 'piece(s)', '2.5500', '0.0000', 100, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(907, 'dras0907', 'Welding rod', '', 'kilogram(s)', '890.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6013 33pcs/kilgram,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(908, 'dras0908', 'Wire duct', '', 'length(s)', '650.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>40mmW x 80mmH x 2mL,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(909, 'dras0909', 'Wire duct', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" x 2",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(910, 'dras0910', 'Wire duct', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3" x ?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(911, 'dras0911', 'Wire duct', '', 'length(s)', '20.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?" x ?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(912, 'dras0912', 'Nylon Rope', '', 'meter(s)', '100.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>11mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(913, 'dras0913', 'Air Lock', '', 'pc(s)', '45.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>For Pressure Washer,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(914, 'dras0914', 'Jigsaw blade', 'Makita', 'piece(s)', '200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#1 For Metal,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(915, 'dras0915', 'Overload protector/relay', '', 'piece(s)', '140.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>For Matsushita,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(916, 'dras0916', 'Rubber sheet', '', 'length(s)', '350.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(917, 'dras0917', 'Low pressure gauge', '', 'pc(s)', '370.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2 1/2, 0-400 PSI, P-A thread, 1/4" NPT,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(918, 'dras0918', 'High pressure gauge', '', 'pc(s)', '3120.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2 1/2, 0-4000 PSI, P-A thread, 1/4" NPT,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(919, 'dras0919', 'Garlock Gasket', '', 'Roll', '4500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/32 T x 1m x 3.2mm [3'' x 5'' (15pcs/sheet)],</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(920, 'dras0920', 'Busbar', '', 'length(s)', '1141.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/4" x 1-1/4",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(921, 'dras0921', 'Axial Fan', '', 'pc(s)', '3000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>G16062HA2B|220 For 1 Door Main Panel,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(922, 'dras0922', 'Crankase heater', '', 'piece(s)', '24760.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>018-0095-04 For XJAM Condensing unit,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(923, 'dras0923', 'Control box', '', 'set(s)', '630.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>900mmL x 300mmD x 1700mmH w/ 100mm Base Nema-12 1-Door,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(924, 'dras0924', 'Acetylene Gas', '', 'cylinder(s)', '300.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>250psi/cylinder, standard,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(925, 'dras0925', 'Oxygen Gas', '', 'cylinder(s)', '320.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2000psi/cylinder, standard,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(926, 'dras0926', 'Nitrogen Gas', '', 'cylinder(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2000psi/cylinder, standard,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(927, 'dras0927', 'Foam', '', 'pc(s)', '705.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(928, 'dras0928', 'Overload protector/relay', 'Siemens', 'piece(s)', '0.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1.6-2.5A 3UA50 40-1C,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(929, 'dras0929', 'Terminal lug', '', 'piece(s)', '8500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>80mm?, "O",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(930, 'dras0930', 'Overhauling gasket', 'Copeland', 'set(s)', '8500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>380550,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(931, 'dras0931', 'Overhauling gasket', 'Copeland', 'set(s)', '9000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>380550,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(932, 'dras0932', 'Solenoid valve', 'Danfoss', 'piece(s)', '1142.4000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm (1?") EVR 25 (032F2200),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(933, 'dras0933', 'Wire duct', '', 'length(s)', '889.6000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>100mmH x 60mmW,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(934, 'dras0934', 'Wire duct', '', 'length(s)', '100.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>80mmH x 60mmW,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(935, 'dras0935', 'Brass Fittings', '', 'pc(s)', '23000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>For Pressure Washer Repair,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(936, 'dras0936', 'Compressor', 'Maneurop', 'unit(s)', '100.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>220v MTZ28JE3MVE BA10060047243,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(937, 'dras0937', 'Spray Paint', '', 'can(s)', '12.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Silver,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(938, 'dras0938', 'PVC elbow', '', 'piece(s)', '230.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 1?" blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(939, 'dras0939', 'Oxygen Gas', '', 'cylinder(s)', '25.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2000psi/cylinder, flask,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(940, 'dras0940', 'Half Union', '', 'pc(s)', '2500.0000', '0.0000', 4, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/4 x 1/8,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(941, 'dras0941', 'Defrost heater', '', 'piece(s)', '46.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 7mm?, 7.5'' (229cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(942, 'dras0942', 'Defrost heater', '', 'piece(s)', '52.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>20 A|12 White,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(943, 'dras0943', 'Terminal block', '', 'piece(s)', '155.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>30A/12 pairs White,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(944, 'dras0944', 'Fan blade', '', 'piece(s)', '98.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10"? For VN 10-20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(945, 'dras0945', 'Fan blade', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8"? For VN 10-20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(946, 'dras0946', 'Evaporator', 'Promax', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DD 8.0/40,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(947, 'dras0947', 'Evaporator', 'Promax', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DD12.0/60,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(948, 'dras0948', 'Evaporator', 'Promax', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DD6.0/30,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(949, 'dras0949', 'Evaporator', 'Promax', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DD8.0/40,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(950, 'dras0950', 'Evaporator', 'Promax', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DJ 5.1/30,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(951, 'dras0951', 'Evaporator', 'Promax', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DJ7.8/40,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(952, 'dras0952', 'Evaporator', 'Promax', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DJ9.8/55,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(953, 'dras0953', 'Evaporator', 'Promax', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DL4.2/20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(954, 'dras0954', 'Evaporator', 'Promax', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>DL5.2/25,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(955, 'dras0955', 'Evaporator', 'Promax', 'unit(s)', '39000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>EKA 040-16-E,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(956, 'dras0956', 'Evaporator', 'Eden', 'unit(s)', '67000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FEM 0303,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(957, 'dras0957', 'Evaporator', 'Eden', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FEM 0317,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(958, 'dras0958', 'Vice Crimper', 'Rubicon', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Tools,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(959, 'dras0959', 'Pipe Cutter', 'Rubicon', 'piece(s)', '20.5200', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Tools,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(960, 'dras0960', 'Pressure Thermo Plastic Hose', 'Refworld', 'roll(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>RW-TPH 02,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(961, 'dras0961', 'Hydraulic Fittings', 'Refworld', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(962, 'dras0962', 'Hydraulic Flare nut Lock', 'Refworld', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(963, 'dras0963', 'Hydraulic Flare nut Adapter', 'Refworld', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(964, 'dras0964', 'Hydro tee', 'Refworld', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Silver,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(965, 'dras0965', 'Hydro tee W/ Flare nut', 'Refworld', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Silver,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(966, 'dras0966', 'Hydraulic Hose', 'Refworld', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(967, 'dras0967', 'Hydraulic elbow', 'Refworld', '', '220.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(968, 'dras0968', 'Hawaii Display Shelf', '', 'unit(s)', '310.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3750mm 2 Layer w/ Light,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(969, 'dras0969', 'Hawaii Display Shelf', '', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2500mm 3 Layer w/ Light,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(970, 'dras0970', 'Freight', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(971, 'dras0971', 'Admin Charges', '', '', '300.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(972, 'dras0972', 'Glass Endwall', '', '', '40.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(973, 'dras0973', 'Fan motor', '', 'piece(s)', '17.2800', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>YSF-60-6P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000');
INSERT INTO `sma_products` (`id`, `code`, `name`, `brand`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier_id`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`) VALUES
(974, 'dras0974', 'Hose fittings', 'Refworld', 'piece(s)', '25.5150', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>s#02040201 RW.TPHS02,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(975, 'dras0975', 'Hose fittings', 'Refworld', 'piece(s)', '36.9900', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>s#02040202 RW.TPHE02,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(976, 'dras0976', 'Hose fittings', 'Refworld', 'piece(s)', '37.8000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>s#02040203 RW.TPHT02,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(977, 'dras0977', 'Hose fittings', 'Refworld', 'piece(s)', '37.9350', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>s#02040204 RW.TPHT02 MB,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(978, 'dras0978', 'Hose fittings', '', 'piece(s)', '892.6200', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>s#02040205 RW.PH02,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(979, 'dras0979', 'Hose tools', '', 'piece(s)', '82.4850', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>s#02040209 RW.PH02,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(980, 'dras0980', 'Hose tools', '', 'piece(s)', '2470.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>s#02040208 RW.PH01,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(981, 'dras0981', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12"(300mm)? 1 Phase, 50/60hz Elescom,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(982, 'dras0982', 'Fan motor', '', 'piece(s)', '4138.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12" (300mm)? 3 Phase, 50/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(983, 'dras0983', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>14" (350mm)? 1 Phase, 50/60hz Elescom,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(984, 'dras0984', 'Fan motor', '', 'piece(s)', '4540.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>14" (350mm)? 3 Phase, 50/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(985, 'dras0985', 'Fan motor', '', 'piece(s)', '11000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>16" (400mm)? 1 Phase, 50/60hz Elescom,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(986, 'dras0986', 'Fan motor', '', 'piece(s)', '5130.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>16" (400mm)? 3 Phase, 50/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(987, 'dras0987', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18" (450mm)? 1 Phase, 50/60hz Elescom,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(988, 'dras0988', 'Fan motor', '', 'piece(s)', '12000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18" (450mm)? 3 Phase, 50/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(989, 'dras0989', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>20" (500mm)? 1 Phase, 50/60hz YWF4E-500 Elescom,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(990, 'dras0990', 'Fan motor', '', 'piece(s)', '4792.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>20" (500mm)? 3 Phase, 50/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(991, 'dras0991', 'Rack', '', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(992, 'dras0992', 'Overload protector/relay', 'Siemens', 'piece(s)', '30000.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10-16A 3UA52 40-2A,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(993, 'dras0993', 'Compressor', 'Maneurop', 'unit(s)', '95.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>440v MT64HMCVE,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(994, 'dras0994', 'Fan blade', '', 'piece(s)', '296.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6"? For VN 10-20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(995, 'dras0995', 'Spiral Wrap', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(996, 'dras0996', 'Overload protector/relay', 'Siemens', 'piece(s)', '0.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3UA50 40-1S,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(997, 'dras0997', 'Overload protector/relay', '', 'pc(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>BII30-120 FOR QHL-30E,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(998, 'dras0998', 'P.U. Chemical A', '', 'liter(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(999, 'dras0999', 'P.U. Chemical B', '', 'liter(s)', '230.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1000, 'dras1', 'Acetylene Gas', '', 'cylinder(s)', '180.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>250psi/cylinder, flask,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1001, 'dras1001', 'Multi Purpose Grease', '', '', '385.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1002, 'dras1002', 'Bearing', '', 'piece(s)', '400.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>TM 32006,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1003, 'dras1003', 'Oil Seal', 'NST TB', '', '4.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>38.58.8,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1004, 'dras1004', 'Hexagonal screw (bolt)', '', 'piece(s)', '260.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/4 x 2",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1005, 'dras1005', 'Float switch', '', 'piece(s)', '295000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1006, 'dras1006', 'Compressor', 'Bitzer', 'unit(s)', '132000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6J-22.2 20D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1007, 'dras1007', 'Compressor', 'Bitzer', 'unit(s)', '490.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4DES-7Y-20D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1008, 'dras1008', 'Marine Epoxy', '', 'set(s)', '437.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>A&B 1ltr/set,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1009, 'dras1009', 'Duct tape', '', 'roll(s)', '38.2050', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1010, 'dras1010', 'Filter drier', 'Refworld', 'piece(s)', '38.2050', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") RW-EK163S Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1011, 'dras1011', 'Filter drier', 'Refworld', 'piece(s)', '38.2050', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm (?") RW-EK164S Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1012, 'dras1012', 'Filter drier', 'Refworld', 'piece(s)', '61.1550', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") RW-EK165S Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1013, 'dras1013', 'Filter core', 'Refworld', 'piece(s)', '175.7700', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>48ZU/ZM RW-HD48,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1014, 'dras1014', 'Solenoid valve', 'Refworld', 'piece(s)', '206.0100', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") RW-EV3 (ODF) Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1015, 'dras1015', 'Solenoid valve', 'Refworld', 'piece(s)', '246.1050', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm (?") RW-EV6 (ODF) Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1016, 'dras1016', 'Solenoid valve', 'Refworld', 'piece(s)', '38.2050', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") RW-EV10 (ODF) Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1017, 'dras1017', 'Oil strainer', 'Refworld', 'piece(s)', '41.3100', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") RW-AOF 053S Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1018, 'dras1018', 'Sight glass', 'Refworld', 'piece(s)', '44.5500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") RW-DSC 10mm Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1019, 'dras1019', 'Sight glass', 'Refworld', 'piece(s)', '50.4900', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm (?") RW-DSC 12mm Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1020, 'dras1020', 'Sight glass', 'Refworld', 'piece(s)', '61.9650', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") RW-DSC 15mm Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1021, 'dras1021', 'Sight glass', 'Refworld', 'piece(s)', '81.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18mm (?") RW-DSC 18mm Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1022, 'dras1022', 'Sight glass', 'Refworld', 'piece(s)', '600.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm (7/8") RW-DSC 22mm Solder,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1023, 'dras1023', 'Solenoid coil', 'Refworld', 'piece(s)', '275.5350', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10w 018F6701,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1024, 'dras1024', 'Filter core housing', 'Refworld', 'piece(s)', '275.5350', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm (1?") RW-CS-489T,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1025, 'dras1025', 'Filter core housing', 'Refworld', 'piece(s)', '280.3950', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm (1-3/8") RW-CS-4811T,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1026, 'dras1026', 'Filter core housing', 'Refworld', 'piece(s)', '285.2550', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm (1-5/8") RW-CS-4813T,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1027, 'dras1027', 'Filter core housing', 'Refworld', 'piece(s)', '1200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm (2-?") RW-CS-4817,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1028, 'dras1028', 'High pressure control', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Manual KP5 (060-117391) High Pressure switch,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1029, 'dras1029', 'Condensing unit', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>XDFHCA 10HP (package type),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1030, 'dras1030', 'Condensing unit', '', 'piece(s)', '720.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>XDFHCA 5HP (package type),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1031, 'dras1031', 'Spiral Wrap', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?" ?,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1032, 'dras1032', 'Railing', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Coldroom Accessories,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1033, 'dras1033', 'G.I. C-Channel', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Coldroom Accessories,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1034, 'dras1034', 'G.I. Angular', '', '', '219.7500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Coldroom Accessories,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1035, 'dras1035', 'Silicone Gun', '', 'tool(s)', '75.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Coldroom Accessories,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1036, 'dras1036', 'Emergency Button', '', 'piece(s)', '300.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>HO-01 (Coldroom alarm),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1037, 'dras1037', 'Siren', '', 'piece(s)', '21000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>HC-102 (Coldroom alarm),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1038, 'dras1038', 'Compressor', 'Embraco', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>T2168GK,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1039, 'dras1039', 'Defrost heater', '', 'piece(s)', '297.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 10mm?, 5.5'' (168cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1040, 'dras1040', 'Aluminum flat bar', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" x 2mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1041, 'dras1041', 'Head Fan', 'Bitzer', 'unit(s)', '8000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4NES-14Y-20D 4002834968 s# 1684717515,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1042, 'dras1042', 'Panel Circuit Board (PCB)', 'Emerson', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>300-0043-06 XJAM V1.4,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1043, 'dras1043', 'Crankshaft', 'For S6G 25.2 Bitzer', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>301.007.10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1044, 'dras1044', 'PVC pipe', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1 1/4" Blue 10ft/length,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1045, 'dras1045', 'Sandpaper', '', 'piece(s)', '99.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#150,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1046, 'dras1046', 'Stainless Metric Bolt', '', 'piece(s)', '10.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10 x 55 x 1.5 w/ nut,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1047, 'dras1047', 'Plastic Bag', 'Ultra', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Large 100/pack,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1048, 'dras1048', 'Plastic Bag', 'Ultra', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Medium 100/pack,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1049, 'dras1049', 'Empty Can', '', '', '75500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Quart Size for Paint,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1050, 'dras1050', 'PVC Coupling', '', 'piece(s)', '208000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1 1/4" Blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1051, 'dras1051', 'Rubber insulation', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm x ?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1052, 'dras1052', 'PVC Coupling', '', 'length(s)', '13.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1" Blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1053, 'dras1053', 'Control box', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>430mmD x150mmW x 100mmH,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1054, 'dras1054', 'PVC tee', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1" Blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1055, 'dras1055', 'Capacitor', '', 'piece(s)', '0.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>50u?/450v/50-60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1056, 'dras1056', 'Overload protector/relay', '', 'piece(s)', '0.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>H2AB MRA98776 For Matsushita,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1057, 'dras1057', 'Coldroom Panel', '*', '*', '0.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>* * *,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1058, 'dras1058', 'Marine Epoxy', '', 'set(s)', '260.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>A&B ?ltr/set,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1059, 'dras1059', 'Compressor', 'Hitachi', 'unit(s)', '42000.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>L500DH-90A1,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1060, 'dras1060', 'Silfos rod', '', 'piece(s)', '110.0000', '0.0000', 200, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>0.05,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1061, 'dras1061', 'Fan motor', 'Ebmpapst', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>M1G055-BD87-58,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1062, 'dras1062', 'Drill bit, Masonry', '', 'piece(s)', '166.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8" for Hilti,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1063, 'dras1063', 'Drill bit, Masonry', '', 'piece(s)', '166.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?" for Hilti,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1064, 'dras1064', 'Orifice', 'Danfoss', 'piece(s)', '980.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#01 (067B2789) TES-5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1065, 'dras1065', 'Valve Body', 'Danfoss', 'piece(s)', '722.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5/8" x 7/8" 067B4011 for TES-5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1066, 'dras1066', 'Condensing unit', 'Edac', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZR36K3E-TF5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1067, 'dras1067', 'Condensing unit', 'Edac', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZR61K3E-TF5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1068, 'dras1068', 'Condensing unit', 'Edac', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZR72K3E-TF5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1069, 'dras1069', 'Pulsating Liquid Injection', 'Danfoss', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") EVRP 2 (032F4013) part of CIC,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1070, 'dras1070', 'Ventilator', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>200v/36w 632 part of coldroom panels,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1071, 'dras1071', 'Panel Circuit Board (PCB)', 'Emerson', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>300-0043-05 XJAM V1.4,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1072, 'dras1072', 'Rubber Grommet', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#3,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1073, 'dras1073', 'Paint brush roller', '', 'piece(s)', '60.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1074, 'dras1074', 'Padlock', '', '', '250.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Brass,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1075, 'dras1075', 'Angular bar', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/4" x 1-1/2",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1076, 'dras1076', 'Flat bar', '', 'length(s)', '487.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2" x 3/16",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1077, 'dras1077', 'G.I. pipe', '', 'length(s)', '512.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1-1/4" x .4,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1078, 'dras1078', 'Oxide Primer', 'Epoxy', 'can(s)', '160.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>epoxy gray 1ltr,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1079, 'dras1079', 'Dyna Bolt', '', 'piece(s)', '30.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/8",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1080, 'dras1080', 'Cylinder Hinge', '', 'piece(s)', '15.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1081, 'dras1081', 'Compressor', 'Bitzer', 'unit(s)', '55655.8333', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4H-15.2Y-B,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1082, 'dras1082', 'Compressor', 'Bitzer', 'unit(s)', '44963.8333', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4NES-14Y-40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1083, 'dras1083', 'Multiset', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1084, 'dras1084', 'High Temperature Paint', '', '', '680.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Red,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1085, 'dras1085', 'Fan motor', 'Emerson', 'piece(s)', '8000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>YSLB-70-6-0001,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1086, 'dras1086', 'Fan motor', 'Ebmpapst', 'piece(s)', '17000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18" (450mm)? 1 Phase, 50/60hz S4E 450 18"?,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1087, 'dras1087', 'Liquid receiver', '', '', '70000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>50L Capacity W/ Relief Valve,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1088, 'dras1088', 'Liquid receiver', '', '', '85000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>75L Capacity W/ Relief Valve,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1089, 'dras1089', 'Mapp Gas', '', '', '390.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1090, 'dras1090', 'Fan motor', 'Ebmpapst', 'piece(s)', '15000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12"(300mm)? 1 Phase, 50/60hz S4E 300 12"?,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1091, 'dras1091', 'Compressor', 'Danfoss', 'unit(s)', '14500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>SC21CLX R404,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1092, 'dras1092', 'Bearing', '', '', '120.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6900Z,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1093, 'dras1093', 'Plastic Container', '', '', '25.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1 Gallon,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1094, 'dras1094', 'Overload breaker', 'Siemens', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>17-22A 3RV1021-4CA10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1095, 'dras1095', 'Overload breaker', 'Siemens', 'piece(s)', '9987.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28-40A 3RV1031-4FA10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1096, 'dras1096', 'Overload breaker', 'Siemens', 'piece(s)', '4468.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4.5-6.3A 3RV1011-1GA10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1097, 'dras1097', 'Magnetic contactor', 'Siemens', 'piece(s)', '4250.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3RT1036-1AL20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1098, 'dras1098', 'Starter', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>36W,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1099, 'dras1099', 'Rocker switch', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10A/230V,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1100, 'dras1100', 'Circlip', '', 'piece(s)', '12.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#18,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1101, 'dras1101', 'Circlip', '', 'piece(s)', '14.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#23,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1102, 'dras1102', 'Compressor', 'Embraco', 'unit(s)', '21000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>T2178GK,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1103, 'dras1103', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>14" (350mm)? 3 Phase, 50/60hz FDA-350 4D/GV-350S,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1104, 'dras1104', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>16" (400mm)? 3 Phase, 50/60hz FDA-350 4D/GV-400S,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1105, 'dras1105', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18" (450mm)? 3 Phase, 50/60hz FDA-350 4D/GV-450S,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1106, 'dras1106', 'Solenoid coil', 'Refworld', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10w / 60Hz 018F6714,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1107, 'dras1107', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 50, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>YZ 10-20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1108, 'dras1108', 'Gasket for Hose Fitting', '', '', '20.5200', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>RW-TPH S02 100m/roll,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1109, 'dras1109', 'Solenoid valve', 'Refworld', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") EVR 10 Flare,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1110, 'dras1110', 'Solenoid valve', 'Refworld', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") EVR 3 Flare,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1111, 'dras1111', 'Light with Buzzer', '', 'piece(s)', '300.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>HC-102 (Coldroom alarm),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1112, 'dras1112', 'PU Foam', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1113, 'dras1113', 'Plastic Button', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Coldroom Accessories,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1114, 'dras1114', 'Union Adaptor', '', '', '25.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/4",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1115, 'dras1115', 'Wire duct', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>80mmH x 40mmW,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1116, 'dras1116', 'Coldroom door handle', '', '', '3696.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Stainless (fabrication),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1117, 'dras1117', 'Copper tube', '', '', '2550.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (?") x 0.032"thk 15mtrs/roll,,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1118, 'dras1118', 'Paint thinner', '', 'can(s)', '140.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1 Liter,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1119, 'dras1119', 'Rotary Fan Blower', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1120, 'dras1120', 'Crankase heater', 'Bitzer', 'piece(s)', '6000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>343-219-01,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1121, 'dras1121', 'Piston connecting rod assembly', 'Bitzer', 'set(s)', '6500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>302-297-96,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1122, 'dras1122', 'Overhauling gasket', 'Bitzer', 'set(s)', '8500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>372-835-01,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1123, 'dras1123', 'Overload breaker', 'Siemens', 'piece(s)', '9780.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>45-63A 3RV1041-1JA10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1124, 'dras1124', 'Compressor', 'Bitzer', 'unit(s)', '290000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6H-25.2-40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1125, 'dras1125', 'Compressor', 'Danfoss', 'unit(s)', '8000.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>SC12 MLX 220v 60Hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1126, 'dras1126', 'Overload breaker', 'Telemecanique', 'piece(s)', '3305.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>24-32A GV2 ME32,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1127, 'dras1127', 'Magnetic contactor', 'Telemecanique', 'piece(s)', '2590.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>LC1-D38M7,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1128, 'dras1128', 'Overload protector/relay', 'Telemecanique', 'piece(s)', '770.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>16-24A LRD22,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1129, 'dras1129', 'Silver Flux', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1130, 'dras1130', 'Compressor', 'Bitzer', 'unit(s)', '106650.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4H-25.2 40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1131, 'dras1131', 'Compressor', 'Bitzer', 'unit(s)', '161550.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S6G-25.2-40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1132, 'dras1132', 'Compressor', 'Bitzer', 'unit(s)', '377500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S6J-16.2-40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1133, 'dras1133', 'Cement', '', '', '8.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1134, 'dras1134', 'PVC pipe', '', 'length(s)', '190.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6" gray 10ft/length,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1135, 'dras1135', 'Sand', '', '', '25.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Binistay (white),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1136, 'dras1136', 'Magnetic contactor', 'Siemens', 'piece(s)', '10993.7500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3RT1044-1AL20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1137, 'dras1137', 'Overload breaker', 'Siemens', '', '3500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>14-20A 3VU1340-IMN00,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1138, 'dras1138', 'Refrigeration controller', '', '', '1800.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>080G3180 ERC 101A (080G3180) Kit w/ Sensor,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1139, 'dras1139', 'Rotary Fan Blower', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>300mmDIA(12"?),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1140, 'dras1140', 'Rotary Fan Blower', '', '', '4540.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>350mmDIA(14"?),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1141, 'dras1141', 'Spray Paint', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1142, 'dras1142', 'Sensor Wire', 'Danfoss', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>EKS 111 for EKC 202c,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1143, 'dras1143', 'Plastic thread', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1144, 'dras1144', 'Control box', 'Tibox', 'piece(s)', '1969.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Plastic enclosure, ABS 200mmW x 300mmH x 180mmD TJ-MG 2030 Cabinet Control box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1145, 'dras1145', 'Control box', 'Tibox', 'piece(s)', '2315.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Plastic enclosure, ABS 300mmW x 300mmH x 180mmD TJ-MG 3030 Cabinet Control box,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1146, 'dras1146', 'Control box', 'Tibox', 'piece(s)', '3650.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Metal enclosure, Nema 4 500mmW x 600mmH x 200mmD ST5-620,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1147, 'dras1147', 'Compressor', 'Bitzer', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4DES-5Y-20D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1148, 'dras1148', 'Drain heater', '', 'piece(s)', '3200.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(wire type) 80w/230v/2m KDL2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1149, 'dras1149', 'Fluorescent tube Clip', '', 'piece(s)', '19.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Stainless,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1150, 'dras1150', 'Phase watcher', 'Carlo Gavazzi', 'piece(s)', '8012.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>220-230v DPB01CM23,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1151, 'dras1151', 'Phase watcher', 'Carlo Gavazzi', 'piece(s)', '8012.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>440-480v DPB01CM48,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1152, 'dras1152', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 10mm?, 11'' (335cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1153, 'dras1153', 'Magnetic contactor', 'Siemens', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3RT1015-1AP02,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1154, 'dras1154', 'Overload breaker', 'Siemens', 'piece(s)', '2900.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5.5-8A 3RV1011-1HA10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1155, 'dras1155', 'Cylinder Head', 'Bitzer', '', '27000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>302-320-02 S4G-12.2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1156, 'dras1156', 'Piston connecting rod assembly', 'Bitzer', 'set(s)', '26000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>302-297-37 4H-15.2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1157, 'dras1157', 'Rubber insulation', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm x 1?" x 6'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1158, 'dras1158', 'Terminal block', '', 'piece(s)', '46.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12 A|12 Pairs White,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1159, 'dras1159', 'PVC tee', '', 'piece(s)', '38.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1 ?" Blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1160, 'dras1160', 'Terminal block', '', 'piece(s)', '46.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>20 A|12 Pairs White,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1161, 'dras1161', 'Control box', '', 'piece(s)', '2480.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Metal, 200mmD x 400mmW x 300mmH Nema 4,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1162, 'dras1162', 'Overload breaker', 'Siemens', 'piece(s)', '4000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>11-16A 3RV1021-4AA10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1163, 'dras1163', 'Overhauling gasket', 'Bitzer', 'set(s)', '3500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>372-835-06,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1164, 'dras1164', 'Valve plate', 'Bitzer', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>304-059-03,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1165, 'dras1165', 'Defrost heater', '', 'piece(s)', '705.6000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 7mm?, 5.5'' (168cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1166, 'dras1166', 'Defrost heater', '', 'piece(s)', '1332.8000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 7mm?, 12'' (366cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1167, 'dras1167', 'Compressor', 'Copeland', 'unit(s)', '70000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZXI18KCE-TF5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000');
INSERT INTO `sma_products` (`id`, `code`, `name`, `brand`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier_id`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`) VALUES
(1168, 'dras1168', 'Compressor', 'Copeland', 'unit(s)', '39000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZXI45KCE-TF5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1169, 'dras1169', 'Compressor', 'Copeland', 'unit(s)', '31000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZR36KCE-TF5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1170, 'dras1170', 'Crankase heater', 'Bitzer', 'piece(s)', '14900.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>343-213-04,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1171, 'dras1171', 'Overload protector/relay', 'Siemens', 'piece(s)', '1520.0000', '0.0000', 6, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>40-57A 3UA58 40-2T,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1172, 'dras1172', 'Overload protector/relay', 'Siemens', 'piece(s)', '0.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>16-25A 3UA54 40-2C,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1173, 'dras1173', 'Thermopane Glass', '', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>375cmW x 375cmL x 39.5cmH Aurora EC11-5HG,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1174, 'dras1174', 'Piston connecting rod assembly', 'Bitzer', 'set(s)', '22500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>302-297-40 6GE-34Y-40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1175, 'dras1175', 'Overload protector/relay', 'Siemens', 'piece(s)', '1350.0000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>16-25A 3UA55 40-2C,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1176, 'dras1176', 'Trowel', '', 'piece(s)', '50.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1177, 'dras1177', 'Super Glue', 'Mighty Glue', 'piece(s)', '12.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1178, 'dras1178', 'Rectangular switch', '', 'piece(s)', '75.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1179, 'dras1179', 'O-ring', '', 'piece(s)', '255.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1180, 'dras1180', 'Overload protector/relay', '', 'piece(s)', '200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>B130-120 For QHL 30E,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1181, 'dras1181', 'Defrost heater', '', 'piece(s)', '831.0400', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 7mm?, 6'' (183cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1182, 'dras1182', 'Defrost heater', '', 'piece(s)', '2500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 7mm?, 7.5'' (229cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1183, 'dras1183', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 10mm?, 7.5'' (229cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1184, 'dras1184', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 7mm?, 10'' (305cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1185, 'dras1185', 'Defrost heater', '', 'piece(s)', '2300.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 7mm?, 7'' (213cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1186, 'dras1186', 'Defrost heater', '', 'piece(s)', '1500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>L-type, 7mm?, 4''(122cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1187, 'dras1187', 'Head fan bracket', '', 'piece(s)', '280.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(fabrication),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1188, 'dras1188', 'Cylindrical Hinge', '', 'piece(s)', '25.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1189, 'dras1189', 'Channel bar', '', 'length(s)', '1250.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1190, 'dras1190', 'Defrost heater', '', 'piece(s)', '548.8000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 7mm?, 3.5'' (107cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1191, 'dras1191', 'Compressor', 'Bitzer', 'unit(s)', '265000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4H-25.2-NU,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1192, 'dras1192', 'Compressor', 'Bitzer', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S6G-25.2-4H,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1193, 'dras1193', 'Compressor', 'Bitzer', 'unit(s)', '375250.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6GE-34Y-40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1194, 'dras1194', 'Compressor', 'Bitzer', 'unit(s)', '329000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>220-230v 6H-25.2-20D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1195, 'dras1195', 'Compressor', 'Copeland', 'unit(s)', '45000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZXI15KCE-TF5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1196, 'dras1196', 'Overload protector/relay', 'Telemecanique', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>23-32A LRD32,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1197, 'dras1197', 'Defrost heater', '', 'piece(s)', '1700.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>L-type, 10mm?, 5.5'' (168cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1198, 'dras1198', 'Drill bit, Masonry', '', 'piece(s)', '200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8" Concrete,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1199, 'dras1199', 'Capillary tube', '', 'roll(s)', '10.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>.055" x .079 x 200,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1200, 'dras1200', 'Defrost heater', '', 'piece(s)', '705.6000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 7mm?, 5'' (152cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1201, 'dras1201', 'Fluorescent tube', 'Philips', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Daylight 21w/T5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1202, 'dras1202', 'Orifice', 'Danfoss', 'piece(s)', '1200.0000', '0.0000', 3, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#02 (067B2790) TES-5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1203, 'dras1203', 'Overload breaker', 'T&B', 'piece(s)', '3470.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>40-63A GV3-M63,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1204, 'dras1204', 'Overload breaker', 'T&B', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>GV2M14C/AN11,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1205, 'dras1205', 'Overload breaker', 'T&B', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>GV2M16C/AN11,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1206, 'dras1206', 'Plywood', '', 'piece(s)', '400.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4"x8"x1/4",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1207, 'dras1207', 'Bushing', 'Copeland', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>CE-1W 4540,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1208, 'dras1208', 'Bushing', 'Copeland', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>CE-1X 5050,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1209, 'dras1209', 'Magnetic contactor', 'Krause & Naimer', 'piece(s)', '9860.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>with auxillary K9B-H (1NO+1NC) 9BK3-62A11 98K3-62A00,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1210, 'dras1210', 'Fluorescent tube', '', 'piece(s)', '50.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>30w Daylight,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1211, 'dras1211', 'Fluorescent tube', '', 'piece(s)', '209.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>58w Daylight,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1212, 'dras1212', 'Fluorescent tube', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>30w Warm white,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1213, 'dras1213', 'Defrost heater', '', 'piece(s)', '1400.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 10mm?, 6'' (183cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1214, 'dras1214', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>L-type, 10mm?, 8''(244cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1215, 'dras1215', 'Defrost heater', '', 'piece(S)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 10mm?, 8.5'' (259cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1216, 'dras1216', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 7mm?, 11'' (335cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1217, 'dras1217', 'Control box', 'Tibox', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Plastic enclosure, ABS 200mmW x 300mmH x 150mmD TJ-MG 2030-S,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1218, 'dras1218', 'Wire duct', '', 'length(s)', '289.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>45mmW x 65mmH,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1219, 'dras1219', 'Aluminum angular bar', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" x 1?" x 4.7mmThk x 16'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1220, 'dras1220', 'Aluminum angular bar', '', 'length(s)', '0.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2" x 2" x 5mmThk" x 16'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1221, 'dras1221', 'Angular bar', '', 'length(s)', '625.0000', '0.0000', 15, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" x 1?" x 5mmThk" x 20'',</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1222, 'dras1222', 'Compressor', 'Copeland', 'unit(s)', '55000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZX38KCE-TF5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1223, 'dras1223', 'Protective film', '', 'roll(s)', '4500.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>48" x 100mm blue,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1224, 'dras1224', 'Aluminum flat bar', '', 'length(s)', '435.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" x 3/16",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1225, 'dras1225', 'C-Channel', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2" x 4" x 2" x 5mm(thk),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1226, 'dras1226', 'Cylinder Hinge', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1227, 'dras1227', 'Overload breaker', 'Siemens', 'piece(s)', '2550.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3.5-5A 3RV1011-1FA10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1228, 'dras1228', 'Magnetic contactor', 'Siemens', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3RT1016-1AP01,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1229, 'dras1229', 'Copper pipe "M"', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6mm (?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1230, 'dras1230', 'Copper pipe "M"', '', 'length(s)', '470.0000', '0.0000', 15, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1231, 'dras1231', 'Copper pipe "M"', '', 'length(s)', '600.0000', '0.0000', 15, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12mm (?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1232, 'dras1232', 'Copper pipe "M"', '', 'length(s)', '850.0000', '0.0000', 15, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1233, 'dras1233', 'Copper pipe "M"', '', 'length(s)', '1165.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18mm (?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1234, 'dras1234', 'Copper pipe "M"', '', 'length(s)', '1300.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>22mm (7/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1235, 'dras1235', 'Copper pipe "M"', '', 'length(s)', '1935.0000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm (1?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1236, 'dras1236', 'Copper pipe "M"', '', 'length(s)', '2850.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm (1-3/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1237, 'dras1237', 'Copper pipe "M"', '', 'length(s)', '4085.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm (1-5/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1238, 'dras1238', 'Copper pipe "M"', '', 'length(s)', '6150.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm (2-?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1239, 'dras1239', 'Copper pipe "M"', '', 'length(s)', '9550.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>64mm (2-5/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1240, 'dras1240', 'Copper pipe "M"', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>76mm (3?") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1241, 'dras1241', 'Copper pipe "M"', '', 'length(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>105mm (4-1/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1242, 'dras1242', 'Silicone sealant', '', 'tube(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Neutral white,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1243, 'dras1243', 'Fan motor', 'Guntner', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>VTO1224U FC080-6DS.6N.V5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1244, 'dras1244', 'Pressure regulator', '', 'piece(s)', '10836.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>KVC 12,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1245, 'dras1245', 'Fluorescent tube', '', 'set(s)', '350.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Warm white 21w/T5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1246, 'dras1246', 'Overload protector/relay', 'Siemens', 'piece(s)', '1250.0000', '0.0000', 8, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6.3-10A 3UA52 40-1J,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1247, 'dras1247', 'Overload protector/relay', 'Siemens', 'piece(s)', '1250.0000', '0.0000', 6, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10-16A 3UA52 40-1A,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1248, 'dras1248', 'Royal cord', '', 'roll(s)', '24500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>8mm?/4 core,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1249, 'dras1249', 'Fan motor', 'Hitachi', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3NA26249,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1250, 'dras1250', 'Compressor', 'Bitzer', 'unit(s)', '455500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S6G-25.2Y-20D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1251, 'dras1251', 'Compressor', 'Bitzer', 'unit(s)', '302640.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6HE-28Y-40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1252, 'dras1252', 'Overload protector/relay', 'Siemens', 'piece(s)', '0.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12.5-20A 3UA54 40-2B,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1253, 'dras1253', 'Compressor', 'Bitzer', 'unit(s)', '462000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S6F-30.2-2NU,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1254, 'dras1254', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>w/ guard YZ 10-20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1255, 'dras1255', 'Fan blade', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>9.5"?,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1256, 'dras1256', 'Overload protector/relay', 'Siemens', 'piece(s)', '1450.0000', '0.0000', 2, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>20-32A 3UA54 40-2D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1257, 'dras1257', 'Wire duct', '', 'length(s)', '720.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>38mmW x 75mmH,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1258, 'dras1258', 'Overhauling gasket', 'Bitzer', 'set(s)', '16500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>372-811-04,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1259, 'dras1259', 'Auxillary contact', 'Telemecanique', 'piece(s)', '670.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>LADN22,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1260, 'dras1260', 'Ceramic Fuse', '', 'piece(s)', '2.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>25A, E27,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1261, 'dras1261', 'Transformer', '', 'unit(s)', '21450.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Dry-type, 7kva,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1262, 'dras1262', 'Ice Bin', '', 'unit(s)', '68400.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1.30mLx1.30MWx0.95mH for Grant FFIAR,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1263, 'dras1263', 'Compressor', 'Copeland', 'unit(s)', '220000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>9RJI-0765 TF5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1264, 'dras1264', 'EMT Pipe', '', 'length(s)', '118.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1265, 'dras1265', 'EMT Elbow', '', 'piece(s)', '22.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? ?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1266, 'dras1266', 'EMT Coupling', '', 'piece(s)', '8.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1267, 'dras1267', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>L-type, 7mm?, 12'' (366cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1268, 'dras1268', 'Defrost heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>L-type, 7mm?, 8'' (244cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1269, 'dras1269', 'Defrost heater', '', 'piece(s)', '2600.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 7mm?, 8.5'' (259cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1270, 'dras1270', 'Defrost heater', '', 'piece(s)', '2200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 7mm?, 6.5'' (198cm), 220v/800w(600w)/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1271, 'dras1271', 'Capacitor', '', 'piece(s)', '250.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3u?/450v/50-60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1272, 'dras1272', 'EMT Pipe', '', 'length(s)', '295.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1273, 'dras1273', 'EMT Pipe', '', 'length(s)', '560.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1274, 'dras1274', 'EMT Elbow', '', 'piece(s)', '62.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 1",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1275, 'dras1275', 'EMT Elbow', '', 'piece(s)', '160.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>90? 1?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1276, 'dras1276', 'EMT Coupling', '', 'piece(s)', '16.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1277, 'dras1277', 'EMT Coupling', '', 'piece(s)', '65.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1278, 'dras1278', 'EMT Connector', '', 'piece(s)', '10.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1279, 'dras1279', 'EMT Connector', '', 'piece(s)', '16.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1280, 'dras1280', 'EMT Connector', '', 'piece(s)', '65.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1281, 'dras1281', 'Compressor', 'Bitzer', 'unit(s)', '232000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4HE-18Y-2NU,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1282, 'dras1282', 'Compressor', 'Bitzer', 'unit(s)', '182000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4TES-9Y-2NU,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1283, 'dras1283', 'Compressor', 'Bitzer', 'unit(s)', '275000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6J-22.2Y-2NU,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1284, 'dras1284', 'U-Bolt', '', 'piece(s)', '4.8000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1" w/ ?" nut,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1285, 'dras1285', 'U-Bolt', '', 'piece(s)', '3.9000', '0.0000', 10, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?" w/ ?" nut,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1286, 'dras1286', 'Acetylene Gas', '', 'cylinder(s)', '550.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>250psi/cylinder, medium,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1287, 'dras1287', 'Oxygen gas', '', 'cylinder(s)', '250.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2000psi/cylinder, medium,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1288, 'dras1288', 'Low pressure control', 'Danfoss', 'piece(s)', '1200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>KP1 (060-110191),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1289, 'dras1289', 'Fluorescent tube', 'GE', 'piece(s)', '66.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>36w, Cool white,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1290, 'dras1290', 'Overload breaker', 'Telemecanique', 'piece(s)', '1100.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>GV2ME20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1291, 'dras1291', 'Coldroom light fixture', 'Velux', 'piece(s)', '280.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>BHWP/E 27 black,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1292, 'dras1292', 'Head Fan', 'Bitzer', 'piece(s)', '26000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>343-021-27,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1293, 'dras1293', 'UTP Cable', '', 'roll(s)', '950.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>305mtrs/roll,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1294, 'dras1294', 'Shielded wire', '', 'roll(s)', '1350.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3+1 100mtr/roll,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1295, 'dras1295', 'Rubber sheet', '', 'piece(s)', '383.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3'' x 4'' x 1?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1296, 'dras1296', 'Compressor', 'Copeland', 'unit(s)', '42000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZXI14KCE-TF5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1297, 'dras1297', 'Terminal lug', '', 'piece(s)', '35.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>30mm? "Y", insulated,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1298, 'dras1298', 'Plastic Film (Vapor barrier)', '', 'roll(s)', '6500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#.003 x 60" tubular 3mtrs/kg, 50kg/roll,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1299, 'dras1299', 'Control box', '', 'piece(s)', '59000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Metal, 8" x 23" x 35",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1300, 'dras1300', 'Control box', '', 'piece(s)', '59834.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Metal, 8" 26" x 44",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1301, 'dras1301', 'Angular bar', '', 'length(s)', '280.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Slotted, 1?" x 1?" x 2mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1302, 'dras1302', 'Silicone sealant', '', 'tube(s)', '150.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Gray,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1303, 'dras1303', 'Head Fan', 'Bitzer', 'piece(s)', '29000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>for 4GE-30Y-20D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1304, 'dras1304', 'G.I Wire', '', 'kilogram(s)', '100.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1305, 'dras1305', 'G.I. Pipe', '', 'length(s)', '310.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1306, 'dras1306', 'Mirror glass', '', 'piece(s)', '2800.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>166cm x 101.5cm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1307, 'dras1307', 'Paint brush', '', 'piece(s)', '55.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1308, 'dras1308', 'Strobe Light', '', 'piece(s)', '400.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>HC-05E (Coldroom alarm),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1309, 'dras1309', 'Siren', '', 'piece(s)', '250.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>HC-626B (Coldroom alarm),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1310, 'dras1310', 'Doorbell', '', 'piece(s)', '65.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(Coldroom alarm),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1311, 'dras1311', 'Stainless Curtain Hook', '', 'piece(s)', '30.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>for manual night blind,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1312, 'dras1312', 'EMT Junction box', '', 'piece(s)', '25.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4" x 4",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1313, 'dras1313', 'Black screw', '', 'piece(s)', '2.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/8"?,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1314, 'dras1314', 'Flexible connector', '', 'piece(s)', '35.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>?"? for liquid tight,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1315, 'dras1315', 'Shielded wire', '', 'meter(s)', '30.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>5+1,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1316, 'dras1316', 'Filter drier', 'Emerson', 'piece(s)', '420.0000', '0.0000', 5, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") EK 163 Flare,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1317, 'dras1317', 'Magnetic contactor', 'Siemens', 'piece(s)', '2368.7500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>220v 3RT1025-1AN20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1318, 'dras1318', 'Magnetic contactor', 'Siemens', 'piece(s)', '2368.7500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>440v 3RT1025-1AR60,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1319, 'dras1319', 'Liquid receiver', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(horizontal, 150ltrs) HLR-10A-F/F-150x1,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1320, 'dras1320', 'Liquid receiver', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(vertical, 150ltrs) VLR-10A-F/F-150x1,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1321, 'dras1321', 'Piston connecting rod assembly', 'Bitzer', 'set(s)', '14250.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>302-298-49,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1322, 'dras1322', 'Valve plate', 'Bitzer', 'set(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>302-360-14,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1323, 'dras1323', 'Crankase heater', 'Bitzer', 'piece(s)', '5200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>343-219-02,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1324, 'dras1324', 'Bushing', 'Bitzer', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>311-100-06,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1325, 'dras1325', 'Bearing', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6206Z,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1326, 'dras1326', 'Bearing', '', 'piece(s)', '320.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6007z,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1327, 'dras1327', 'Auxillary contact', 'T&B', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>GVAN11,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1328, 'dras1328', 'Overload breaker', 'T&B', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2.5-4A GV2-M08,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1329, 'dras1329', 'Overload breaker', 'T&B', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>25-40A GV2-M40,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1330, 'dras1330', 'RSC pipe', '', 'piece(s)', '840.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1331, 'dras1331', 'RSC elbow', '', 'piece(s)', '310.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1332, 'dras1332', 'Solenoid coil', 'Bitzer', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>7w 042N4203 (for traxoil),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1333, 'dras1333', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>14" (350mm)? 1 Phase, 50/60hz YWF4E-350,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1334, 'dras1334', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>16" (400mm)? 1 Phase, 50/60hz YWF4E-400,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1335, 'dras1335', 'Oil separator', 'Emerson', 'piece(s)', '6800.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>35mm (1-3/8") AF5890-11,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1336, 'dras1336', 'Detergent powdered soap', '', 'kilogram(s)', '89.9000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1kg,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1337, 'dras1337', 'Auxillary contact', 'Telemecanique', 'piece(s)', '516.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(top mounted) LAD8N11/NC,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1338, 'dras1338', 'Auxillary contact', 'Telemecanique', 'piece(s)', '420.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(side mounted) LAD8N11/NO,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1339, 'dras1339', 'Auxillary contact', 'Telemecanique', 'piece(s)', '420.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(side mounted) LAD8N11/NC,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1340, 'dras1340', 'Auxillary contact', 'Telemecanique', 'piece(s)', '516.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(top mounted) LAD8N11/NO,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1341, 'dras1341', 'Compressor', 'Bitzer', 'unit(s)', '377500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>S4G-12.2Y-2NU,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1342, 'dras1342', 'Compressor', 'Copeland', 'unit(s)', '36000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZX21KCE-TF7,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1343, 'dras1343', 'Overload protector/relay', 'Siemens', 'piece(s)', '855.0000', '0.0000', 1, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6.3-10A 3UA55-40-1J,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1344, 'dras1344', 'Bolt threading', '', 'piece(s)', '750.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>for coldroom door wheel (fabrication),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1345, 'dras1345', 'Piston connecting rod assembly', 'Bitzer', 'set(s)', '26500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>302-297-46,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1346, 'dras1346', 'Aluminum checkered plate', '', 'length(s)', '10100.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4'' x 8'' x 3/16",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1347, 'dras1347', 'Transformer', '', 'piece(s)', '650.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>12v/3.2A (for LED) (for LED),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1348, 'dras1348', 'Nut', '', 'piece(s)', '6.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>13mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1349, 'dras1349', 'Washer', '', 'piece(s)', '1.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>13mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1350, 'dras1350', 'Hexagonal screw (bolt) w/ washer', '', 'piece(s)', '10.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>13mm x 2",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1351, 'dras1351', 'Caster wheel', '', 'piece(s)', '85.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#2 (Meat cabinet accessories),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1352, 'dras1352', 'Capacitor bank', '', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1x10kvar/7x20kvar capacitor,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1353, 'dras1353', 'Capacitor bank', '', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1x15kvar/7x30kvar capacitor,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1354, 'dras1354', 'Terminal clip (capacitor clip)', '', 'piece(s)', '5.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1355, 'dras1355', 'O-ring', '', 'piece(s)', '43.4000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4mm x 90mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1356, 'dras1356', 'Bearing', '', 'piece(s)', '250.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6203,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1357, 'dras1357', 'Bearing', '', 'piece(s)', '180.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6202,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1358, 'dras1358', 'QDE paint', '', 'can(s)', '615.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>white 1gal,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1359, 'dras1359', 'Fan blade', '', 'piece(s)', '8000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>for Hitachi KX-R51A,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1360, 'dras1360', 'Liquid receiver', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(horizontal, 100ltrs) BLR/HLR-F-F-100,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000');
INSERT INTO `sma_products` (`id`, `code`, `name`, `brand`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier_id`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`) VALUES
(1361, 'dras1361', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>YWF6D-800S-180/75G,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1362, 'dras1362', 'Fan motor', '', 'piece(s)', '20500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>YWF4D-630,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1363, 'dras1363', 'Compressor', 'Bitzer', 'unit(s)', '280000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4GE-23-40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1364, 'dras1364', 'Condenser', '', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>SGVH080.2B/3-N(U).1,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1365, 'dras1365', 'Condenser', '', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>SGVH090.2C/3-N(U).1,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1366, 'dras1366', 'Compressor', 'Tecumseh', 'unit(s)', '18500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>CAJ2464Z R404,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1367, 'dras1367', 'Compressor', 'Bitzer', 'unit(s)', '310000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6JE-25Y-20D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1368, 'dras1368', 'Compressor', 'Embraco', 'unit(s)', '15500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>NJ2212GK,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1369, 'dras1369', 'Refrigeration oil', 'Suniso', 'gallon(s)', '820.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3GS viscosity 1gal,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1370, 'dras1370', 'Compressor', 'Bitzer', 'unit(s)', '280000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4GE-23Y-40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1371, 'dras1371', 'Compressor', 'Bitzer', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4HE-18Y-40P,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1372, 'dras1372', 'Oil separator', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>42mm (1-5/8") OS/HF-2158,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1373, 'dras1373', 'Oil separator', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>54mm (2-?") OS/HF-3218,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1374, 'dras1374', 'Ball valve', 'Danfoss', 'piece(s)', '12500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>76mm (3?") GBC 79s,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1375, 'dras1375', 'Condenser', '', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FNV-478.8/1260,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1376, 'dras1376', 'Condenser', '', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>FNV-250.0/700,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1377, 'dras1377', 'Filter core housing', 'Emerson', 'piece(s)', '5200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>64mm (2-5/8") x 6mtrs,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1378, 'dras1378', 'Filter core housing', 'Emerson', 'piece(s)', '5200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>76mm (3?"),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1379, 'dras1379', 'Overhauling gasket', 'Bitzer', 'set(s)', '9800.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>372-841-03,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1380, 'dras1380', 'Control box', '', 'piece(s)', '13780.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Metal, 1200mmL x 800mmH x 250mmD,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1381, 'dras1381', 'PVC strip curtain', '', 'roll(s)', '5350.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>yellow anti insect 200mmx2.0mmx50mtrs 50mtrs/roll,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1382, 'dras1382', 'Axial fan', '', 'piece(s)', '1741.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>180mm x 180mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1383, 'dras1383', 'Acrylic thinner', '', 'can(s)', '290.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1 galllon,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1384, 'dras1384', 'Refrigeration oil', 'Suniso', 'can(s)', '420.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3GS viscosity 1ltr 1 liter,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1385, 'dras1385', 'Oxide Primer', '', 'can(s)', '650.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>epoxy white 1gal,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1386, 'dras1386', 'Flat bar', '', 'length(s)', '150.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1" x 3/16",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1387, 'dras1387', 'Head fan', 'Bitzer', 'piece(s)', '22500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>343-021-23,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1388, 'dras1388', 'Condensing unit', 'Danfoss', 'unit(s)', '87889.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(003-114N328400) OP-HJZ050D40Q,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1389, 'dras1389', 'Condensing unit', 'Danfoss', 'unit(s)', '146720.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(003-114N336000) OP-LGZ215D40Q,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1390, 'dras1390', 'Condensing unit', 'Danfoss', 'unit(s)', '153784.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(003-114N336300) OP-LGZ271D40Q,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1391, 'dras1391', 'Royal cord', '', 'roll(s)', '2820.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1.25mm?/3 core 75m/roll,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1392, 'dras1392', 'Thermostatic expansion valve', 'Danfoss', 'piece(s)', '2927.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>TE5-1,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1393, 'dras1393', 'Thermostatic expansion valve', 'Danfoss', 'piece(s)', '2927.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>TE5-2,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1394, 'dras1394', 'Control box', '', 'piece(s)', '35694.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4 Metal ,Tibox 400mmD x 2163mmW x 800mmH,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1395, 'dras1395', 'Condensing unit', 'Danfoss', 'unit(s)', '120497.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(003-114N329900) OP-HGZ064D40Q,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1396, 'dras1396', 'C-Channel', '', 'length(s)', '4200.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2" x 3" x 2" x 5.8mmthk,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1397, 'dras1397', 'Control box', '', 'piece(s)', '39463.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4 Metal Tibox 400mmD x 2378mmW x 800mmH,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1398, 'dras1398', 'Circuit breaker', 'GE', 'piece(s)', '18460.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>250A/3pole THJK4362250WLX,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1399, 'dras1399', 'Link module', 'Siemens', 'piece(s)', '195.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3RA1911-1A,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1400, 'dras1400', 'Clear glass', '', 'piece(s)', '327.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>w/ polished 10" x 49" x 6mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1401, 'dras1401', 'Clear glass', '', 'piece(s)', '490.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>w/ polished 10cmW x 184.5cmL x 6mm,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1402, 'dras1402', 'Fluorescent tube', 'Philips', 'piece(s)', '322.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Warm white 36w/T5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1403, 'dras1403', 'Control box', '', 'piece(s)', '18700.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Metal, 700mmW x 1000mmH x 200mmD,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1404, 'dras1404', 'Circuit breaker', 'T&B', 'piece(s)', '1656.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>50A/3pole HNE100N,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1405, 'dras1405', 'Circuit breaker', 'T&B', 'piece(s)', '1656.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>40A/3pole HNE100N,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1406, 'dras1406', 'Overload protector/relay', 'Siemens', 'piece(s)', '2830.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>63 - 90A 3UA60 40-2W,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1407, 'dras1407', 'G.I. Pipe', '', 'length(s)', '713.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1408, 'dras1408', 'G.I. elbow', '', 'piece(s)', '75.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1409, 'dras1409', 'G.I. coupling', '', 'piece(s)', '49.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1410, 'dras1410', 'Transformer', '', 'piece(s)', '470.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>KY-36W-12-L,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1411, 'dras1411', 'QDE paint', '', 'can(s)', '585.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>silver 1gallon,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1412, 'dras1412', 'Stainless hinge', '', 'piece(s)', '60.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1413, 'dras1413', 'Stainless bolt, nut w/ washer', '', 'set(s)', '3.1200', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/16" x ?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1414, 'dras1414', 'Overload protector/relay', 'Siemens', 'piece(s)', '1653.7500', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>6.3 - 10A 3UA59 40-1J,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1415, 'dras1415', 'Cable tray', '', 'length(s)', '395.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>2" x 3" x 2" x 8'' GI #22 w/ cover,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1416, 'dras1416', 'Vegetable rack', '', 'piece(s)', '7125.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>gray,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1417, 'dras1417', 'Sugar cart', '', 'piece(s)', '9800.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1418, 'dras1418', 'Fluorescent bulb', '', 'piece(s)', '73.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>9w/220v/E27,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1419, 'dras1419', 'Fluorescent bulb', '', 'piece(s)', '70.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>7w/220v/E27,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1420, 'dras1420', 'Miniature circuit breaker (MCB)', 'ABB', 'piece(s)', '330.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>20A/2 pole,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1421, 'dras1421', 'Led light', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18w/120cm /daylight (combi),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1422, 'dras1422', 'Led light', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18w/120cm /warm white (combi),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1423, 'dras1423', 'Led light', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18w/120cm /natura (combi),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1424, 'dras1424', 'Led light', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>180cm (8p),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1425, 'dras1425', 'Led light', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>210cm (9p),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1426, 'dras1426', 'Led light', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>13w/90cm/daylight (combi),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1427, 'dras1427', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>50hz YZF 10-20,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1428, 'dras1428', 'Flexible conduit', '', 'roll(s)', '54.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1/2" liquid-tight black 100mtrs/roll,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1429, 'dras1429', 'Led light', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>120cm (7d),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1430, 'dras1430', 'Solenoid valve', 'Danfoss', 'piece(s)', '1900.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>10mm (3/8") EVR 6 (032F8072) w/ coil,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1431, 'dras1431', 'Solenoid valve', 'Danfoss', 'piece(s)', '2500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") EVR 10 (032F8101) w/ coil,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1432, 'dras1432', 'Filter core housing', 'Emerson', 'piece(s)', '5000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>28mm (1?") STAS 048 9 T,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1433, 'dras1433', 'Coldroom light switch', 'Matex', 'piece(s)', '59.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>AM50019,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1434, 'dras1434', 'Solenoid valve', 'Danfoss', 'piece(s)', '2600.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>15mm (5/8") EVR10 (032F8098) w/ coil,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1435, 'dras1435', 'Acrylic glass', '', 'piece(s)', '1100.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>33cm x 92.5cm x 3/16"T,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1436, 'dras1436', 'Acrylic glass', '', 'piece(s)', '4880.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4'' x 8'' x 3/16",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1437, 'dras1437', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>18" (450mm)? 1 Phase, 50/60hz YDWF 74L 60P4-522N-450,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1438, 'dras1438', 'Screw', '', 'set(s)', '2.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>1?" w/ tox #6,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1439, 'dras1439', 'Fluorescent fixture', 'Eurolux', 'set(s)', '1620.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>moisture proof (2x36w),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1440, 'dras1440', 'Coldroom door gasket', '', 'meter(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>U-type,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1441, 'dras1441', 'Selector switch', '', 'piece(s)', '55.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>on-off (combi) 8w,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1442, 'dras1442', 'Fan motor', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(for combi),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1443, 'dras1443', 'Compressor', 'Invotech', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>YM158E7G-100,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1444, 'dras1444', 'Compressor', 'Invotech', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>YSF60E7G-V100,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1445, 'dras1445', 'Digital solar thermometer', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>SD-10,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1446, 'dras1446', 'Fan guard', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(YZF 10-20),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1447, 'dras1447', 'Compressor', 'Bitzer', 'unit(s)', '106000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4FES-5Y-20D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1448, 'dras1448', 'Communication cable', '', 'meter(s)', '68.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3+1,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1449, 'dras1449', 'Base foot (metal stand)', '', 'piece(s)', '5000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>for self-service counter,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1450, 'dras1450', 'Electronic ballast', 'Velux', 'piece(s)', '670.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(220v/2x36w/.33A/60hz) SH02-236/D,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1451, 'dras1451', 'Stainless screw', '', 'piece(s)', '8.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#10 x 1?" x 3/16",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1452, 'dras1452', 'Stainless screw', '', 'set(s)', '80.5000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/8" x 5" (w/ nut & washer),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1453, 'dras1453', 'Filter core', 'Danfoss', 'piece(s)', '600.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>48-F Felt,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1454, 'dras1454', 'Compressor', 'Copeland', 'unit(s)', '80000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZXI21KCE-TF5 557,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1455, 'dras1455', 'Defrost heater', '', 'piece(s)', '850.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Straight-type, 7mm?, 2'' (61cm), 220v/300w/60hz,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1456, 'dras1456', 'Marine plywood', '', 'piece(s)', '1190.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>4'' x 8'' x ?",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1457, 'dras1457', 'Mirror glass', '', 'piece(s)', '800.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>124.5cmL x 36cmW,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1458, 'dras1458', 'Fan guard', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(YZ 10-20),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1459, 'dras1459', 'Silicone sealant', 'GE', 'tube(s)', '105.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>Neutral white (Silglaze),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1460, 'dras1460', 'Frame heater', '', 'piece(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>13mtrs/220v,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1461, 'dras1461', 'Metal screw', '', 'piece(s)', '1.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>3/16" x 1",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1462, 'dras1462', 'Coldroom door handle', '', 'set(s)', '15000.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>W38,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1463, 'dras1463', 'Circlip', '', 'piece(s)', '19.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>internal lock #29,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1464, 'dras1464', 'Stainless screw', '', 'piece(s)', '7.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#10 x 1" x 3/16",</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1465, 'dras1465', 'Communication cable', 'Belden', 'roll(s)', '17820.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(8+3) #8772,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1466, 'dras1466', 'Canopy', '', 'piece(s)', '4500.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(for 3-glass door),</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1467, 'dras1467', 'Jigsaw blade', 'Makita', 'piece(s)', '45.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>#2 For wood,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1468, 'dras1468', 'Compressor', 'Invotech', 'unit(s)', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>YM86E7G-100,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1469, 'dras1469', 'Condensing unit', 'Edac', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZF25K3E-TF5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1470, 'dras1470', 'Condensing unit', 'Edac', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZF34K3E-TF5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1471, 'dras1471', 'Condensing unit', 'Edac', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>ZR68K3E-TF5,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1472, 'dras1472', 'Condensing unit', 'Invotech', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(3hp) YF17E7G-Q100,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1473, 'dras1473', 'Condensing unit', 'Invotech', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(3hp) YF20E7G-Q100,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1474, 'dras1474', 'Condensing unit', 'Invotech', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(4hp) YF29E7G-Q100,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1475, 'dras1475', 'Condensing unit', 'Invotech', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>(5hp) YF35E7G-Q100,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1476, 'dras1476', 'Condensing unit', 'Invotech', '', '0.0000', '0.0000', 0, '', 0, 0, '', '', '', '', '', '', '0.0000', 0, 0, '', 0, 'code128', '', '<p>YSF75E7G-V100,</p>', 0, '', 0, 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000', 0, '0.0000'),
(1477, 'dras2001', 'Access Valve', '', 'piece(s)', '40.0000', '0.0000', 100, 'no_image.png', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, NULL, 'standard', 0, 0, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_products_cl`
--

CREATE TABLE IF NOT EXISTS `sma_products_cl` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `brand` char(255) NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products_cl`
--

INSERT INTO `sma_products_cl` (`id`, `code`, `name`, `brand`, `unit`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `tax_rate`, `track_quantity`, `details`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier_id`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`) VALUES
(1, 'DRAS0001', 'Access Valve', 'Generic', 'pcs', '0.0000', 'cab0e72eb07eeeb0a1cda4afcc4a225a.jpg', 1, 0, '', '', '', '', '', '', 1, 1, '', 'code128', NULL, '<p>6mm (1/4")</p>', 0, 'standard', 0, 0, '0.0000', 2, '100.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000'),
(2, 'DRAS0002', 'Insulation Tape', 'Aerotape/ Armacell', 'length', '0.0000', '72e0078525ea7589058d83be8d9883a8.jpg', 3, 0, '', '', '', '', '', '', NULL, 1, '', 'code128', NULL, '<p>1/8" x 2" x 30''</p>', NULL, 'standard', 2, 0, '154.5000', 5, '150.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000'),
(3, 'DRAS0003', 'Ball valve', 'Danfoss', 'pcs', '120.0000', '259620d4d7c1497348c8e8ec82b560b0.jpg', 1, 0, '', '', '', '', '', '', NULL, 1, '', 'code128', NULL, '<p>GBC 6s 6mm Solder</p>', NULL, 'standard', 0, 0, '0.0000', 2, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000'),
(5, 'DRAS0000', 'Installation / Repair', 'Service', 'hours', '0.0000', 'no_image.png', 5, 0, '', '', '', '', '', '', 1, 0, '', 'code128', NULL, '<p>Job Order</p>', 0, 'service', 0, 0, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_inventory`
--

CREATE TABLE IF NOT EXISTS `sma_product_inventory` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE IF NOT EXISTS `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_product_photos`
--

INSERT INTO `sma_product_photos` (`id`, `product_id`, `photo`) VALUES
(2, 6, '3be3c0c9b1abdcd292eb9cb19a4bab71.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE IF NOT EXISTS `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_product_variants`
--

INSERT INTO `sma_product_variants` (`id`, `product_id`, `name`, `cost`, `price`, `quantity`) VALUES
(3, 4, 'Aluminum angular bar 1½ x 1½ x 1/8 x 16', '200.0000', '300.0000', '100.0000'),
(4, 4, 'Aluminum angular bar 1½ x 1½ x 3/16 x 16', '300.0000', '400.0000', '100.0000'),
(5, 4, 'Aluminum angular bar 2 x 2 x 1/8 x 16', '400.0000', '500.0000', '100.0000'),
(6, 6, 'Aluminum angular bar 1½ x 1½ x 1/8 x 16', '100.0000', '200.0000', '5.0000'),
(7, 6, 'Aluminum angular bar 1½ x 1½ x 3/16 x 16', '150.0000', '300.0000', '50.0000'),
(8, 6, 'Aluminum angular bar 2 x 2 x 1/8 x 16', '200.0000', '400.0000', '4.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE IF NOT EXISTS `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `po_no` varchar(55) NOT NULL,
  `supplier_po` varchar(45) NOT NULL,
  `customer_po` varchar(45) NOT NULL,
  `invoice_no` varchar(55) NOT NULL,
  `rr_no` varchar(55) NOT NULL,
  `mrf_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `received_by` varchar(255) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `requested_by` varchar(55) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `po_no`, `supplier_po`, `customer_po`, `invoice_no`, `rr_no`, `mrf_no`, `date`, `supplier_id`, `customer_id`, `customer`, `supplier`, `warehouse_id`, `received_by`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `requested_by`, `created_by`, `updated_by`, `updated_at`) VALUES
(33, '13213546514', '', '', '', '124356', '1234', '1234567890', '2015-12-01 13:16:00', 0, 4, 'Gaisano', '', 1, 'kenneth', '&lt;p&gt;test&lt;&sol;p&gt;', '3000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '3000.0000', '0.0000', 'complete', 'pending', 'migs', 2, 2, '2015-12-10 02:23:07'),
(34, '154121', '', '', '', '124356', '1234', '1234567890', '2015-12-10 01:26:00', 0, 4, 'Gaisano', '', 2, 'kenneth', '&lt;p&gt;test&lt;&sol;p&gt;', '59400.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '59400.0000', '0.0000', 'partial', 'pending', 'migs', 2, 2, '2015-12-10 02:23:44'),
(35, '154121', '', '', '', '1324567', '5461321321', '1234567890', '2015-12-10 01:34:00', 0, 4, 'Gaisano', '', 3, 'kenneth', '&lt;p&gt;test&lt;&sol;p&gt;', '49500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '49500.0000', '0.0000', 'complete', 'pending', 'shalom', 2, 2, '2015-12-10 02:24:22'),
(36, '154121', '', '', '', '', '', '1234567890', '2015-12-10 01:46:00', 0, 1, 'SM Savemore', '', 1, '', '&lt;p&gt;test&lt;&sol;p&gt;', '3100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '3100.0000', '0.0000', 'pending', 'pending', 'migs', 2, NULL, NULL),
(37, '1234567', '', '', '', '1234567890', '1234', '1234567890', '2015-12-10 04:19:00', 0, 4, 'Gaisano', '', 1, 'kenneth', '', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'complete', 'paid', 'migs', 2, 2, '2015-12-10 04:20:39'),
(38, '1234567', '', '56461321', '12313465', '12315489', '1321546', '1234567890', '2015-12-14 02:05:00', 0, 4, 'Gaisano', '', 1, 'ken', '&lt;p&gt;test&lt;&sol;p&gt;', '3000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '3000.0000', '0.0000', 'partial', 'pending', 'migs', 2, 2, '2015-12-14 08:42:56');

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE IF NOT EXISTS `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_brand` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `received` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `product_brand`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `supplier_id`, `received`) VALUES
(194, 36, NULL, 100, 'dras0100', 'Ceramic fuse', '', NULL, '31.0000', '100.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '3100.0000', '100.0000', '2015-12-10', 'pending', 0, 0),
(198, 33, NULL, 1, 'dras0001', 'Access Valve', '', 0, '30.0000', '100.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '3000.0000', '0.0000', '2015-12-10', 'complete', 0, 100),
(199, 34, NULL, 3, 'dras0003', 'Aluminum angular bar', '', 0, '594.0000', '100.0000', 2, '0.0000', 0, '', NULL, '0.0000', NULL, '59400.0000', '0.0000', '2015-12-10', 'partial', 0, 50),
(200, 35, NULL, 10, 'dras0010', 'Angular bar', '', 0, '495.0000', '100.0000', 3, '0.0000', 0, '', NULL, '0.0000', NULL, '49500.0000', '0.0000', '2015-12-10', 'complete', 0, 100),
(202, 37, NULL, 1075, 'dras1075', 'Angular bar', '', 0, '0.0000', '100.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '0.0000', '0.0000', '2015-12-10', 'complete', 0, 100),
(206, 38, NULL, 1, 'dras0001', 'Access Valve', '', 0, '30.0000', '100.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '3000.0000', '0.0000', '2015-12-14', 'partial', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE IF NOT EXISTS `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE IF NOT EXISTS `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_items`
--

CREATE TABLE IF NOT EXISTS `sma_return_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) unsigned NOT NULL,
  `return_id` int(11) unsigned NOT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `quantity` int(11) DEFAULT '0',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_return_items`
--

INSERT INTO `sma_return_items` (`id`, `sale_id`, `return_id`, `sale_item_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`) VALUES
(19, 20, 18, 28, 9, 'dras0009', 'Angular bar', '', 0, '245.0000', 5, 2, '0.0000', 0, '', '0', '0.0000', '1225.0000', ''),
(20, 24, 19, 33, 1, 'dras0001', 'Access Valve', 'standard', 0, '0.0000', 10, 7, '0.0000', 0, '', '0', '0.0000', '0.0000', '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_sales`
--

CREATE TABLE IF NOT EXISTS `sma_return_sales` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `surcharge` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dr_no` int(11) NOT NULL,
  `returned_by` varchar(55) NOT NULL,
  `received_by` varchar(55) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_return_sales`
--

INSERT INTO `sma_return_sales` (`id`, `sale_id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `surcharge`, `grand_total`, `created_by`, `updated_by`, `updated_at`, `dr_no`, `returned_by`, `received_by`) VALUES
(18, 20, '2015-12-10 04:27:00', 'RETURNSL/2015/12/0018', 4, 'Gaisano', 0, '', 2, '', '1225.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '1225.0000', 2, NULL, NULL, 12315464, 'migs', 'kenneth'),
(19, 24, '2015-12-14 02:57:00', 'RETURNSL/2015/12/0019', 1, 'SM Savemore', 0, '', 7, '&lt;p&gt;test&lt;&sol;p&gt;', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '0.0000', 2, NULL, NULL, 12345678, 'migs', 'ken');

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE IF NOT EXISTS `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `jo_no` int(11) NOT NULL,
  `customer_po` varchar(45) NOT NULL,
  `mrf_no` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` tinyint(4) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `prepared_by` varchar(55) NOT NULL,
  `issued_to` varchar(55) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `jo_no`, `customer_po`, `mrf_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `prepared_by`, `issued_to`) VALUES
(16, '2015-12-10 03:02:00', 'SVC/2015/12/0015', 1325467890, '', 1345679, 1, 'SM Savemore', 0, '', 1, '', '', '1500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '1500.0000', 'completed', NULL, NULL, NULL, 2, NULL, NULL, 50, 0, '0.0000', NULL, '0.0000', 'migs', 'kenneth'),
(18, '2015-12-10 03:15:00', 'SVC/2015/12/0017', 1325467890, '', 1345679, 1, 'SM Savemore', 0, '', 1, '', '', '1980.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '1980.0000', 'completed', NULL, NULL, NULL, 2, NULL, NULL, 10, 0, '0.0000', NULL, '0.0000', 'migs', 'kenneth'),
(19, '2015-12-10 03:20:00', 'SVC/2015/12/0018', 123456, '', 1345679, 4, 'Gaisano', 0, '', 1, '', '', '2450.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '2450.0000', 'completed', NULL, NULL, NULL, 2, NULL, NULL, 10, 0, '0.0000', NULL, '0.0000', 'migs', 'kenneth'),
(20, '2015-12-10 04:19:00', 'SVC/2015/12/0019', 1325467890, '', 1345679, 4, 'Gaisano', 0, '', 1, '', '', '1225.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '1225.0000', 'completed', NULL, NULL, NULL, 2, NULL, NULL, 5, 0, '0.0000', 18, '0.0000', 'migs', 'kenneth'),
(21, '2015-12-10 04:20:00', 'SVC/2015/12/0020', 1325467890, '', 1345679, 4, 'Gaisano', 0, '', 1, '', '', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 'completed', NULL, NULL, NULL, 2, NULL, NULL, 50, 0, '0.0000', NULL, '0.0000', 'migs', 'kenneth'),
(22, '2015-12-13 17:35:00', 'SVC/2015/12/0021', 123456, '', 1345679, 4, 'Gaisano', 0, '', 1, '&lt;p&gt;Customer Po&colon; 1587&lt;&sol;p&gt;', '', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', 'completed', 'pending', 0, NULL, 2, 2, '2015-12-14 02:54:24', 20, 0, '0.0000', NULL, '0.0000', 'migs', 'kenneth'),
(24, '2015-12-14 00:56:00', 'SVC/2015/12/0022', 1325467890, '', 1345679, 1, 'SM Savemore', 0, '', 1, '&lt;p&gt;test&lt;&sol;p&gt;', '', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '300.0000', 'completed', 'pending', 0, NULL, 2, 2, '2015-12-14 02:35:28', 10, 0, '0.0000', 19, '0.0000', 'migs', 'kenneth'),
(25, '2015-12-14 03:13:00', 'SVC/2015/12/0023', 123456, '', 1345679, 4, 'Gaisano', 0, '', 1, '&lt;p&gt;test&lt;&sol;p&gt;', '', '30.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '30.0000', 'completed', NULL, NULL, NULL, 2, NULL, NULL, 1, 0, '0.0000', NULL, '0.0000', 'migs', 'kenneth'),
(26, '2015-12-14 07:45:00', 'SVC/2015/12/0024', 231215452, '12345648', 213213545, 4, 'Gaisano', 0, '', 1, '', '', '60.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '60.0000', 'completed', 'pending', 0, NULL, 2, 2, '2015-12-14 08:00:17', 1, 0, '0.0000', NULL, '0.0000', 'migs', 'ken');

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE IF NOT EXISTS `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`) VALUES
(21, 16, 1, 'dras0001', 'Access Valve', 'standard', NULL, '30.0000', '30.0000', '50.0000', 1, '0.0000', 0, '', NULL, '0.0000', '1500.0000', ''),
(23, 18, 8, 'dras0008', 'Aluminum flat bar', '', NULL, '198.0000', '198.0000', '10.0000', 1, '0.0000', 0, '', NULL, '0.0000', '1980.0000', ''),
(27, 19, 9, 'dras0009', 'Angular bar', '', NULL, '245.0000', '245.0000', '10.0000', 1, '0.0000', 0, '', NULL, '0.0000', '2450.0000', ''),
(28, 20, 9, 'dras0009', 'Angular bar', '', NULL, '245.0000', '245.0000', '5.0000', 1, '0.0000', 0, '', NULL, '0.0000', '1225.0000', ''),
(29, 21, 1075, 'dras1075', 'Angular bar', '', NULL, '0.0000', '0.0000', '50.0000', 1, '0.0000', 0, '', NULL, '0.0000', '0.0000', ''),
(33, 24, 1, 'dras0001', 'Access Valve', 'standard', 0, '30.0000', '30.0000', '10.0000', 1, '0.0000', 0, '', NULL, '0.0000', '300.0000', ''),
(34, 22, 1075, 'dras1075', 'Angular bar', '', 0, '0.0000', '0.0000', '20.0000', 1, '0.0000', 0, '', NULL, '0.0000', '0.0000', ''),
(35, 25, 1, 'dras0001', 'Access Valve', 'standard', NULL, '30.0000', '30.0000', '1.0000', 1, '0.0000', 0, '', NULL, '0.0000', '30.0000', ''),
(37, 26, 1, 'dras0001', 'Access Valve', 'standard', 0, '60.0000', '60.0000', '1.0000', 1, '0.0000', 0, '', NULL, '0.0000', '60.0000', '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE IF NOT EXISTS `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('00162f3c79cd53be4d8618aa84e149a8f82fa2b8', '::1', 1450054685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303035343536383b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('027e37cf5b1cdcd1ea8cdf29b58ee0c69e3ea96d', '::1', 1450081283, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303038313130373b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303534303837223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22674a485157646247464f4d433433397771426a69223b),
('038515a77d4616b9b49a831bd6fea485d45a201d', '::1', 1450083739, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303038333733303b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303832323539223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('103c71113490f9584105b2cfd38f291b4d2cac2b', '::1', 1450077656, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303037373336393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303534303837223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2241486f4532353478575672753837336643586a69223b),
('222dad54642b2df9ed601445c790b96529cac23b', '::1', 1450060988, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303036303936363b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2266455638366e62616b6c73354667657557557139223b),
('2a63cfd9850a8c857ac3321ff3aa8b45c1ba0bc3', '::1', 1450061812, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303036313532343b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2266455638366e62616b6c73354667657557557139223b),
('364a1835a69caeb98177e55c5f41170f01e49c4a', '::1', 1450082468, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303038323235363b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303831393837223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b6d69665136787665304a754843617146325a74223b72656d6f76655f706f6c737c693a313b),
('3b47f3d03aca4c67ab33dd07bcaec21c8f3fd1af', '::1', 1450062129, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303036313834343b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2266455638366e62616b6c73354667657557557139223b),
('3c8b5ad6adc6f5a7ae6b89261cbbea930e8c934e', '::1', 1450062827, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303036323637393b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2266455638366e62616b6c73354667657557557139223b),
('4280b6cbd8f8d3bd070ca214759b612ccf9da009', '::1', 1450063517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303036333531363b7265717565737465645f706167657c733a383a2270726f6475637473223b),
('51778cb2af129a40451de2d228a0655f5c8ad4c8', '::1', 1450059043, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303035383839383b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2253555a78567936546a4a514464387558394d314b223b),
('51bb41403a4c7b89606270718319058e52ea7193', '::1', 1450079321, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303037393032363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303534303837223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a226b6668584f4c617541364b736978646c72706d43223b),
('56359843f6a3ffb8b3929a3e5b953fa469c44346', '::1', 1450057831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303035373832363b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2268396b6d58774448664b534d5a41713843497970223b72656d6f76655f706f6c737c733a313a2231223b),
('6d19c88811f1b815051106808f906d094a938606', '::1', 1450062452, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303036323137343b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2266455638366e62616b6c73354667657557557139223b),
('6d2b5c50491550042b4b48fda98c50319e9c6981', '::1', 1450057825, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303035373338323b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2268396b6d58774448664b534d5a41713843497970223b72656d6f76655f706f6c737c733a313a2231223b),
('7bd15018f292193eb0147d9617374f03adf3a4ae', '::1', 1450055156, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303035343931383b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('83c1bb479fc4d963170525fff33e13ef232116dd', '::1', 1450063791, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303036333539373b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2266455638366e62616b6c73354667657557557139223b),
('857a0e1e0cbfec0d79b2b7a864746f73d82e42ca', '::1', 1450059688, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303035393430333b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2253555a78567936546a4a514464387558394d314b223b),
('92fd3d342ed6dbab6cbeba25a435dde3c5ff7988', '::1', 1450078329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303037383033393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303534303837223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2241734a375854567043347176774d426b38755a6e223b),
('95bbba611bd2a6c4b6f62d2c9fec6b142f9ed537', '::1', 1450081531, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303038313532393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303534303837223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22674a485157646247464f4d433433397771426a69223b),
('96f4ed7693d616fa65b3c656dd521f0e9b4e59a9', '::1', 1450076666, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303037363430393b7265717565737465645f706167657c733a303a22223b),
('9f52cef1374954ad893846499273bfe12cc7f1a5', '::1', 1450056710, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303035363439343b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('9f7b92ce15c891495f051ab104d92e120563908a', '::1', 1450078025, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303037373732393b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303534303837223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22716d597a31307670386e6b73794c56664e35774b223b),
('a7d6e34db305c06ca7510574c7901a32957df275', '::1', 1450054106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303035333838313b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('a988b4cbaa33d8f06b040084eb8c3661874bbf31', '::1', 1450080361, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303038303232333b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303534303837223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22674a485157646247464f4d433433397771426a69223b),
('aed8d4f1654cd042148aef1e4c46974f7c4bbf2c', '::1', 1450082766, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303038323630373b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303832323539223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('b1b6e9cead4b8776e111f47abd8ee591a9775dd6', '::1', 1450078904, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303037383638383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303534303837223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a226b6668584f4c617541364b736978646c72706d43223b),
('b470bc9f769b73e99caa6777e53380c07e937181', '::1', 1450081025, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303038303830363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303534303837223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22674a485157646247464f4d433433397771426a69223b),
('b8a7c587fd74467037596b1bcf6d8c52fed31bc6', '::1', 1450060541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303036303235333b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2266455638366e62616b6c73354667657557557139223b),
('c35db05a98b004c7c1a9d98d41c03809db382315', '::1', 1450054491, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303035343233323b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d73826dd8b80793b75a6928596827ad2002e2549', '::1', 1450079716, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303037393532343b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303534303837223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a226b6668584f4c617541364b736978646c72706d43223b),
('da2d41f0f13fa7f8cc12dcdbea714a1e9772e34e', '::1', 1450058811, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303035383535373b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2253555a78567936546a4a514464387558394d314b223b),
('daaf4b202d89eaea3fc52c7cb7ab17c3b926dd2d', '::1', 1450057380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303035373036343b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22513136376c4f6b483832536f784e724d454c3442223b72656d6f76655f706f6c737c733a313a2231223b),
('e098bd3f93af4670e9d0e2c2108049668cb226c4', '::1', 1450077016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303037363732303b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303534303837223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('e7c130eb736f71ad1ede39085f41d0491fac5727', '::1', 1450080059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303037393836363b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303534303837223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a226b6668584f4c617541364b736978646c72706d43223b),
('f0b41a15e80f62a708f35aa65231ac7205aedf04', '::1', 1450077022, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303037373032313b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303534303837223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('f55d0033697e504da8f1dd672d6523e6710e4e43', '::1', 1450063488, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303036333234333b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2266455638366e62616b6c73354667657557557139223b),
('f64827de2c4526a8efd6c293f02daf5d5a59e2be', '::1', 1450065842, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303036353736333b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2266455638366e62616b6c73354667657557557139223b),
('ff3a938b7d58613389d64ff5e8fab8f6168fa3b1', '::1', 1450060214, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303035393932323b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303230343939223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2266455638366e62616b6c73354667657557557139223b),
('ff7af63e65a671facf842c21a2fa7de9524eaff9', '::1', 1450078645, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435303037383334383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343530303534303837223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2241734a375854567043347176774d426b38755a6e223b);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE IF NOT EXISTS `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`) VALUES
(1, 'logo2.png', 'dras-logo-icon-banner.jpg', 'DRAS', 'english', 1, 0, 'PHP', 0, 10, '3.0.1.6', 1, 5, 'SVC', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'RETURNSL', '', 0, 'default', 1, 1, 0, 1, 0, 1, 0, 1, 0, 'Asia/Manila', 800, 800, 60, 60, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@tecdiary.com', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 0, 'renzmarv@gmail.com', 0, 4, 1, 0, 2, 1, 0, 0, 2, '.', ',', 0, 3, 'renzmar', '63e65092-6da4-491b-8633-577635c87213', 0, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE IF NOT EXISTS `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_subcategories`
--

CREATE TABLE IF NOT EXISTS `sma_subcategories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suppliers`
--

CREATE TABLE IF NOT EXISTS `sma_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE IF NOT EXISTS `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE IF NOT EXISTS `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE IF NOT EXISTS `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', '0.0000', '2'),
(2, 'VAT @10%', 'VAT10', '10.0000', '1'),
(3, 'GST @6%', 'GST', '6.0000', '1'),
(4, 'VAT @20%', 'VT20', '20.0000', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_tools`
--

CREATE TABLE IF NOT EXISTS `sma_tools` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'no_image.png',
  `category_id` int(11) DEFAULT '0',
  `date_added` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tools`
--

INSERT INTO `sma_tools` (`id`, `name`, `description`, `image`, `category_id`, `date_added`, `created_by`, `updated_by`) VALUES
(1, 'Thor Hammer', 'Mjolnir', 'no_image.png', 1, '2015-09-15 16:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_tools_categories`
--

CREATE TABLE IF NOT EXISTS `sma_tools_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tools_categories`
--

INSERT INTO `sma_tools_categories` (`id`, `name`, `description`, `date_added`, `created_by`, `updated_by`) VALUES
(1, 'Hammer', 'All Hammer', '2015-09-15 16:00:00', 1, 1),
(2, 'Ladder', 'All Ladders', '2015-09-15 16:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_tools_transcations`
--

CREATE TABLE IF NOT EXISTS `sma_tools_transcations` (
  `id` int(11) NOT NULL,
  `transcation_id` int(11) NOT NULL,
  `tool_id` varchar(55) NOT NULL,
  `tool_serialno` varchar(55) DEFAULT NULL,
  `transaction_type` varchar(55) NOT NULL,
  `date_added` timestamp NULL DEFAULT NULL,
  `assigned_to` varchar(120) DEFAULT NULL,
  `projects` varchar(120) DEFAULT NULL,
  `notes` varchar(120) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE IF NOT EXISTS `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE IF NOT EXISTS `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE IF NOT EXISTS `sma_users` (
  `id` int(11) unsigned NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `warehouse_id` int(10) unsigned DEFAULT NULL,
  `biller_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`) VALUES
(2, 0x3a3a31, 0x3a3a31, 'superadmin', '76b4427d3eb6db9206fd6daf4ae7868e8e9a90b3', NULL, 'renzmarv@gmail.com', NULL, NULL, NULL, NULL, 1437822241, 1450082682, 1, 'Renz Mar', 'Velasco', 'DRAS', '09267269850', 'renzmar-id.jpg', 'male', 1, 0, 3, NULL, 0, 0, 0),
(3, 0x3a3a31, 0x3a3a31, 'darwinaquino', '337de132604268ac885854034b1205bd44c8a8db', NULL, 'darwin@dras.com', NULL, NULL, NULL, NULL, 1437899862, 1445993372, 1, 'Darwin', 'Aquino', 'DRAS', '09178435698', 'darwin_id.jpg', 'male', 3, 2, 3, NULL, 1, 1, 0),
(4, 0x3a3a31, 0x3a3a31, 'kenneth', '22b4ab08fe53924e96769291bf4070d80f1e4330', NULL, 'kenneth@dras.com', NULL, NULL, NULL, NULL, 1438060041, 1438060057, 1, 'Kenneth', 'Hinal', 'DRAS', '0987654321', NULL, 'male', 5, 1, 3, NULL, 0, 0, 0),
(5, 0x3a3a31, 0x3a3a31, 'prf-requestor', '6bbdb0171d6752f31cd2974d6ded4a40eec941cf', NULL, 'requestor@dras.com', NULL, NULL, NULL, NULL, 1445320581, 1450082048, 1, 'Jerusalem', 'Fonseca', 'DRAS', '+639323331339', NULL, 'male', 9, 1, 3, NULL, 0, 0, 0),
(6, 0x3a3a31, 0x3a3a31, 'test-receiver', 'a9daefdce0d2c8b419aac12364a74af14fa419e0', NULL, 'receiver@dras.com', NULL, NULL, NULL, NULL, 1446230158, 1447072663, 1, 'test', 'test', 'DRAS', '1234567890', NULL, 'female', 10, 1, 3, NULL, NULL, NULL, 0),
(7, 0x3a3a31, 0x3a3a31, 'test-issuer', '25a2ec05fa52454e40e533234d085c9d233036ed', NULL, 'issuer@dras.com', NULL, NULL, NULL, NULL, 1446489728, 1447146059, 1, 'issuer', 'test', 'DRAS', '789565412', NULL, 'male', 11, 1, 3, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE IF NOT EXISTS `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2015-07-25 10:25:35'),
(2, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2015-07-25 10:37:48'),
(3, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2015-07-25 10:38:23'),
(4, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2015-07-25 10:52:59'),
(5, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-25 11:09:07'),
(6, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-25 21:46:19'),
(7, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-25 21:59:25'),
(8, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-25 22:06:45'),
(9, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-25 22:07:12'),
(10, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-25 23:38:18'),
(11, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-26 01:36:10'),
(12, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-26 04:23:58'),
(13, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-26 08:39:41'),
(14, 3, NULL, 0x3a3a31, 'darwin@dras.com', '2015-07-26 08:39:57'),
(15, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-26 08:40:18'),
(16, 3, NULL, 0x3a3a31, 'darwin@dras.com', '2015-07-27 08:37:38'),
(17, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-27 08:38:02'),
(18, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-27 23:51:41'),
(19, 3, NULL, 0x3a3a31, 'darwin@dras.com', '2015-07-28 00:09:18'),
(20, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-28 00:11:07'),
(21, 3, NULL, 0x3a3a31, 'darwin@dras.com', '2015-07-28 00:11:26'),
(22, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-28 00:12:27'),
(23, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-28 01:51:16'),
(24, 3, NULL, 0x3a3a31, 'darwin@dras.com', '2015-07-28 02:02:17'),
(25, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-28 03:36:29'),
(26, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-28 03:50:41'),
(27, 3, NULL, 0x3a3a31, 'darwin@dras.com', '2015-07-28 05:02:51'),
(28, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-28 05:03:22'),
(29, 4, NULL, 0x3a3a31, 'kenneth@dras.com', '2015-07-28 05:07:37'),
(30, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-07-28 05:23:47'),
(31, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-08-17 09:18:32'),
(32, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-08-17 09:43:48'),
(33, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-08-20 01:39:00'),
(34, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-08-20 01:46:47'),
(35, 3, NULL, 0x3a3a31, 'darwin@dras.com', '2015-08-20 01:47:41'),
(36, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-08-20 01:48:12'),
(37, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-08-20 03:47:57'),
(38, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-08-20 03:48:47'),
(39, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-08-29 12:14:55'),
(40, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-08-30 05:23:50'),
(41, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-08-30 15:15:30'),
(42, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-08-31 05:04:19'),
(43, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-08-31 11:03:17'),
(44, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-08-31 20:50:57'),
(45, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-09-01 01:25:02'),
(46, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-09-01 01:25:30'),
(47, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-09-01 01:28:45'),
(48, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-09-01 03:08:58'),
(49, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-09-01 14:08:54'),
(50, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-09-16 08:40:15'),
(51, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-07 06:35:51'),
(52, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-11 22:28:12'),
(53, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-12 15:28:10'),
(54, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-17 23:39:32'),
(55, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-18 03:13:06'),
(56, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-19 17:12:06'),
(57, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-20 01:36:42'),
(58, 5, NULL, 0x3a3a31, 'princejeru10@gmail.com', '2015-10-20 05:57:26'),
(59, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-20 05:58:01'),
(60, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-20 15:05:36'),
(61, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-20 17:37:07'),
(62, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-20 17:48:28'),
(63, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-20 23:10:49'),
(64, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-21 03:32:31'),
(65, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-21 09:55:01'),
(66, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-21 21:25:38'),
(67, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-22 00:05:50'),
(68, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-28 00:35:40'),
(69, 3, NULL, 0x3a3a31, 'darwin@dras.com', '2015-10-28 00:49:32'),
(70, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-28 00:50:17'),
(71, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-29 23:12:27'),
(72, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-30 00:33:44'),
(73, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-30 00:34:42'),
(74, 5, NULL, 0x3a3a31, 'requestor@dras.com', '2015-10-30 00:36:18'),
(75, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-30 00:41:56'),
(76, 5, NULL, 0x3a3a31, 'requestor@dras.com', '2015-10-30 00:44:23'),
(77, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-30 00:53:57'),
(78, 5, NULL, 0x3a3a31, 'requestor@dras.com', '2015-10-30 00:56:43'),
(79, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-30 01:03:21'),
(80, 5, NULL, 0x3a3a31, 'requestor@dras.com', '2015-10-30 01:04:09'),
(81, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-30 01:04:49'),
(82, 5, NULL, 0x3a3a31, 'requestor@dras.com', '2015-10-30 02:38:12'),
(83, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-10-30 18:22:18'),
(84, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-10-30 18:37:42'),
(85, 5, NULL, 0x3a3a31, 'requestor@dras.com', '2015-10-30 18:48:53'),
(86, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-10-30 18:50:28'),
(87, 5, NULL, 0x3a3a31, 'requestor@dras.com', '2015-11-01 20:57:58'),
(88, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-01 20:58:39'),
(89, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-01 22:03:22'),
(90, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-01 22:04:53'),
(91, 5, NULL, 0x3a3a31, 'requestor@dras.com', '2015-11-01 22:05:19'),
(92, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-01 22:08:25'),
(93, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-02 01:37:48'),
(94, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-02 03:38:55'),
(95, 5, NULL, 0x3a3a31, 'requestor@dras.com', '2015-11-02 03:41:07'),
(96, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-02 03:50:38'),
(97, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-02 03:53:41'),
(98, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-02 15:24:17'),
(99, 5, NULL, 0x3a3a31, 'requestor@dras.com', '2015-11-02 15:24:51'),
(100, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-02 15:26:56'),
(101, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-02 15:27:06'),
(102, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-02 15:36:19'),
(103, 5, NULL, 0x3a3a31, 'requestor@dras.com', '2015-11-02 15:37:22'),
(104, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-02 15:49:38'),
(105, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-02 17:13:45'),
(106, 7, NULL, 0x3a3a31, 'issuer@dras.com', '2015-11-02 18:48:14'),
(107, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-04 10:53:24'),
(108, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-04 11:27:40'),
(109, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-05 04:42:27'),
(110, 5, NULL, 0x3a3a31, 'requestor@dras.com', '2015-11-05 04:43:18'),
(111, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-05 04:44:34'),
(112, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-05 04:45:51'),
(113, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-05 05:01:19'),
(114, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-05 05:19:54'),
(115, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-05 05:20:48'),
(116, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-05 05:24:32'),
(117, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-05 05:26:47'),
(118, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-05 05:28:18'),
(119, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-05 05:29:18'),
(120, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-05 06:21:26'),
(121, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-05 06:22:30'),
(122, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-05 06:31:35'),
(123, 5, NULL, 0x3a3a31, 'requestor@dras.com', '2015-11-05 10:16:43'),
(124, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-05 11:04:23'),
(125, 7, NULL, 0x3a3a31, 'issuer@dras.com', '2015-11-05 11:23:09'),
(126, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-08 02:28:32'),
(127, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-08 06:11:36'),
(128, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-08 09:14:56'),
(129, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-08 18:48:08'),
(130, 2, NULL, 0x3132372e302e302e31, 'renzmarv@gmail.com', '2015-11-08 18:59:09'),
(131, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-08 19:12:53'),
(132, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-09 01:31:10'),
(133, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-09 05:50:57'),
(134, 7, NULL, 0x3a3a31, 'issuer@dras.com', '2015-11-09 12:25:25'),
(135, 5, NULL, 0x3a3a31, 'requestor@dras.com', '2015-11-09 12:33:04'),
(136, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-09 12:34:25'),
(137, 6, NULL, 0x3a3a31, 'receiver@dras.com', '2015-11-09 12:37:43'),
(138, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-09 12:39:59'),
(139, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-10 08:48:52'),
(140, 7, NULL, 0x3a3a31, 'issuer@dras.com', '2015-11-10 09:00:59'),
(141, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-10 09:03:40'),
(142, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-15 09:09:13'),
(143, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-16 07:14:11'),
(144, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-16 10:32:26'),
(145, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-17 10:30:23'),
(146, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-30 00:47:17'),
(147, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-12-05 05:50:03'),
(148, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-12-06 00:55:20'),
(149, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-12-06 08:26:36'),
(150, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-12-06 08:26:39'),
(151, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-12-07 06:01:49'),
(152, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-12-08 15:42:13'),
(153, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-12-09 16:56:36'),
(154, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-12-10 00:36:11'),
(155, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-12-13 15:28:20'),
(156, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-12-14 00:48:07'),
(157, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-12-14 07:07:10'),
(158, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-12-14 08:33:07'),
(159, 5, NULL, 0x3a3a31, 'requestor@dras.com', '2015-12-14 08:34:08'),
(160, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-12-14 08:37:39'),
(161, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-12-14 08:44:42');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE IF NOT EXISTS `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE IF NOT EXISTS `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`) VALUES
(1, 'WH1', 'Boni Warehouse', '<p>Boni Ave. Mandaluyong City</p>', NULL, '012345678', ''),
(2, 'WH2', 'Antipolo Warehouse', '<p>M.L. Quezon, Brgy. San Roque Antipolo</p>', NULL, '012345678', ''),
(3, 'WH3', 'Cebu', '<p>Cebu City</p>', NULL, '012345678', ''),
(4, 'WH4', 'Davao', '<p>Davao City</p>', NULL, '012345678', ''),
(5, 'WH5', 'Tuguegarao', '<p>Cagayan</p>', NULL, '012345678', ''),
(6, 'WH6', 'Solano', '<p>Nueva Vizcaya</p>', NULL, '012345678', ''),
(7, 'scra001', 'Scrap', '<p>test</p>', NULL, '', ''),
(8, 'WH7', 'Service Warehouse', '<p>test</p>', NULL, '1234567890', ''),
(9, 'WH8', 'Refurbish Warehouse', '<p>test</p>', NULL, '1234567890', ''),
(10, 'WH9', 'Reusable Warehouse', '<p>test</p>', NULL, '1234567890', '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE IF NOT EXISTS `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`) VALUES
(19, 8, 1, '2500.0000', NULL),
(20, 9, 1, '1500.0000', NULL),
(22, 8, 7, '100.0000', NULL),
(23, 1, 1, '128.0000', NULL),
(24, 3, 2, '50.0000', NULL),
(25, 10, 3, '100.0000', NULL),
(26, 1075, 1, '100.0000', NULL),
(27, 1, 7, '10.0000', NULL),
(28, 1477, 1, '29.0000', NULL),
(29, 1477, 7, '10.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE IF NOT EXISTS `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products_variants`
--

INSERT INTO `sma_warehouses_products_variants` (`id`, `option_id`, `product_id`, `warehouse_id`, `quantity`, `rack`) VALUES
(10, 6, 6, 1, '5.0000', NULL),
(11, 0, 1, 1, '1417.0000', NULL),
(12, 0, 3, 2, '-9.0000', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`date`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `code_2` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`);

--
-- Indexes for table `sma_products_cl`
--
ALTER TABLE `sma_products_cl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `code_2` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`);

--
-- Indexes for table `sma_product_inventory`
--
ALTER TABLE `sma_product_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_return_sales`
--
ALTER TABLE `sma_return_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reference_no` (`reference_no`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_subcategories`
--
ALTER TABLE `sma_subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suppliers`
--
ALTER TABLE `sma_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_tools`
--
ALTER TABLE `sma_tools`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_tools_categories`
--
ALTER TABLE `sma_tools_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_tools_transcations`
--
ALTER TABLE `sma_tools_transcations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1478;
--
-- AUTO_INCREMENT for table `sma_products_cl`
--
ALTER TABLE `sma_products_cl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_product_inventory`
--
ALTER TABLE `sma_product_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=207;
--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `sma_return_sales`
--
ALTER TABLE `sma_return_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `sma_subcategories`
--
ALTER TABLE `sma_subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_suppliers`
--
ALTER TABLE `sma_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_tools`
--
ALTER TABLE `sma_tools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sma_tools_categories`
--
ALTER TABLE `sma_tools_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_tools_transcations`
--
ALTER TABLE `sma_tools_transcations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=162;
--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
