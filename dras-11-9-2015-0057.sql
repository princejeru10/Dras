-- phpMyAdmin SQL Dump
-- version 4.4.13.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Nov 09, 2015 at 08:50 AM
-- Server version: 5.6.27
-- PHP Version: 5.5.30

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_adjustments`
--

INSERT INTO `sma_adjustments` (`id`, `date`, `product_id`, `option_id`, `quantity`, `warehouse_id`, `note`, `created_by`, `updated_by`, `type`) VALUES
(1, '2015-11-09 13:05:00', 1, 0, '50.0000', 1, '&lt;p&gt;test&lt;&sol;p&gt;', 2, NULL, 'addition');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`) VALUES
(1, 3, 'customer', 1, 'General', 'SM SVI Delgado', 'SM Savemore', '', 'Delgado corner Valeria Sts.,', 'Ilo-ilo', 'Ilo-ilo', '1870', 'Philippines', '0123456789', 'sm@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0),
(2, 4, 'supplier', NULL, NULL, 'Test Supplier', 'Supplier Company Name', '', 'Supplier Address', 'Cavite', '', '1234', 'Philippines', '0123456789', 'supplier@gmail.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0),
(3, NULL, 'biller', NULL, NULL, 'DRAS BILLER', 'DRAS BILLER', '5555', 'Biller adddress', 'City', '', '', 'Country', '012345678', 'drasbiller@gmail.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo1.png', 0),
(4, 3, 'customer', 1, 'General', 'Metro Gaisano Calinan', 'Gaisano', '', 'Calinan', 'Davao', '', '1870', 'Philippines', '012345678', 'gaisano@gmail.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0),
(5, 4, 'supplier', NULL, NULL, 'Test Supplier 2', 'Bot Supplier 2', '', '123 sample st Balibago', 'Angeles City', 'Pampanga', '1451', 'Philippines', '1234567890', 'supplier@supplier.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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
(9, '2015-11-09', 8, 9, 5, 126, '20.0000', '45000.0000', '45000.0000', '45000.0000', '45000.0000', '0.0000', 1, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_login_attempts`
--

INSERT INTO `sma_login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(1, 0x3a3a31, 'requestor@gmail.com', 1447072364),
(2, 0x3a3a31, 'requestor@gmail.com', 1447072369);

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
(1, '2015-03-01', 5, 1, 7, 3, 1, 3, 6, 5, 1);

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
(2, '2015-08-31 22:25:00', NULL, NULL, 2, 'IPAY/2015/09/0002', NULL, 'cash', '', '', '', '', '', 'Visa', '3100.0000', NULL, 2, NULL, 'sent', '', '0.0000', '0.0000'),
(3, '2015-08-31 23:05:00', 3, 1, NULL, 'IPAY/2015/09/0003', NULL, 'cash', '', '', '', '', '', 'Visa', '1000.0000', NULL, 2, NULL, 'returned', NULL, '0.0000', '0.0000'),
(4, '2015-08-31 23:07:00', 3, NULL, NULL, 'IPAY/2015/09/0003', NULL, 'cash', '', '', '', '', '', 'Visa', '3250.0000', NULL, 2, NULL, 'received', '<p>Paid</p>', '0.0000', '0.0000'),
(5, '2015-08-31 23:08:00', 3, 2, NULL, 'IPAY/2015/09/0004', NULL, 'cash', '', '', '', '', '', 'Visa', '300.0000', NULL, 2, NULL, 'returned', NULL, '0.0000', '0.0000'),
(6, '2015-08-31 23:10:00', 2, 3, NULL, 'IPAY/2015/09/0004', NULL, 'cash', '', '', '', '', '', 'Visa', '2.0000', NULL, 2, NULL, 'returned', NULL, '0.0000', '0.0000'),
(8, '2015-10-21 21:53:00', NULL, NULL, 7, 'IPAY/2015/10/0005', NULL, 'cash', '', '', '', '', '', 'Visa', '254.5000', NULL, 2, NULL, 'sent', '', '0.0000', '0.0000'),
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `brand`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier_id`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`) VALUES
(1, 'DRAS0001', 'Access Valve', 'Generic', 'pcs', '100.0000', '150.0000', '0.0000', 'cab0e72eb07eeeb0a1cda4afcc4a225a.jpg', 1, 0, '', '', '', '', '', '', '40.0000', 1, 1, '', NULL, 'code128', NULL, '<p>6mm (1/4")</p>', 0, 'standard', 0, 0, '0.0000', 2, '100.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000'),
(2, 'DRAS0002', 'Insulation Tape', 'Aerotape/ Armacell', 'length', '154.5000', '170.0000', '0.0000', '72e0078525ea7589058d83be8d9883a8.jpg', 3, 0, '', '', '', '', '', '', '477.0000', NULL, 1, '', NULL, 'code128', NULL, '<p>1/8" x 2" x 30''</p>', NULL, 'standard', 2, 0, '154.5000', 5, '150.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000'),
(3, 'DRAS0003', 'Ball valve', 'Danfoss', 'pcs', '230.0000', '300.0000', '120.0000', '259620d4d7c1497348c8e8ec82b560b0.jpg', 1, 0, '', '', '', '', '', '', '21.0000', NULL, 1, '', NULL, 'code128', NULL, '<p>GBC 6s 6mm Solder</p>', NULL, 'standard', 0, 0, '0.0000', 2, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000'),
(5, 'DRAS0000', 'Installation / Repair', 'Service', 'hours', '0.0000', '500.0000', '0.0000', 'no_image.png', 5, 0, '', '', '', '', '', '', '0.0000', 1, 0, '', NULL, 'code128', NULL, '<p>Job Order</p>', 0, 'service', 0, 0, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000'),
(8, '156489136215', 'iPhone 6s', 'Apple', 'pcs', '45000.0000', '0.0000', '100.0000', '2d8d7e42caece6a97b8358e960b8b089.png', 3, 0, '', '', '', '', '', '', '420.0000', NULL, 1, '', NULL, 'code128', NULL, '', NULL, 'standard', 0, 0, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000'),
(9, 'SGS6E', 'Samsung Galaxy S6 Edge', 'Samsung', 'pcs', '45000.0000', '0.0000', '100.0000', 'd215904629f6f3687579b0f83479fddd.png', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '225.0000', NULL, 1, NULL, NULL, 'code128', NULL, NULL, NULL, 'standard', NULL, 0, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000', NULL, '0.0000');

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
(1, 6, '70fd313426b827c316184362e53e7207.jpg'),
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchases`
--

INSERT INTO `sma_purchases` (`id`, `reference_no`, `po_no`, `invoice_no`, `rr_no`, `mrf_no`, `date`, `supplier_id`, `customer_id`, `customer`, `supplier`, `warehouse_id`, `received_by`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `requested_by`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, 'PO/2015/07/0001', '3131', '4324242', '', '4324242', '2015-07-26 07:27:00', 2, 0, '', 'Supplier Company Name', 1, 'Darwin Aquino', '&lt;p&gt;Ok transcation&lt;&sol;p&gt;', '1400.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '1400.0000', '0.0000', 'received', 'pending', '', 2, 2, '2015-07-26 07:42:09'),
(2, 'PO/2015/07/0002', '898989', '90909', '', '675758', '2015-07-26 08:01:00', 2, 0, '', 'Supplier Company Name', 2, 'Kenneth Hinal', '&lt;p&gt;Great deal&excl;&lt;&sol;p&gt;', '3230.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '3230.0000', '3100.0000', 'received', 'partial', '', 2, 2, '2015-10-22 12:55:26'),
(7, 'PO/2015/10/0006', '123456789', '123456789', '', '1345679', '2015-10-21 21:34:00', 5, 0, '', 'Bot Supplier 2', 1, 'shalom', '', '254.5000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '254.5000', '254.5000', 'received', 'paid', '', 2, 2, '2015-10-22 12:53:25'),
(13, '1213549840', '1234567890', '46554213', '', '1235678909', '2015-10-30 19:31:17', 0, 0, '', '', 1, 'shalom', 'test', '2545.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '2545.0000', '0.0000', 'received', 'pending', '', 5, 6, '2015-11-02 22:48:13'),
(15, '1234566579', '1234567890', '21321', '', '123456790', '2015-11-03 07:38:00', 0, 0, '', '', 1, 'shalom', '&lt;p&gt;test request&lt;&sol;p&gt;', '12725.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '12725.0000', '0.0000', 'received', 'pending', '', 2, 6, '2015-11-05 06:16:18'),
(16, '1234566579', '1235464231', '23132132', '', '465798132', '2015-11-05 20:45:01', 0, 0, '', '', 1, 'shalom', '&lt;p&gt;test&lt;&sol;p&gt;', '12725.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '12725.0000', '0.0000', 'complete', 'pending', '', 5, 2, '2015-11-09 10:55:23'),
(17, '154121', '123455', '', '', '412452', '2015-11-05 10:21:00', 0, 0, '', '', 1, '', '&lt;p&gt;test&lt;&sol;p&gt;', '23175.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '23175.0000', '0.0000', 'pending', 'pending', '', 2, NULL, NULL),
(19, '154121', '', '1234567890', '', '12315464', '2015-11-09 07:18:00', 0, 1, 'SM Savemore', '', 1, 'shalom', '', '13409.5000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '13409.5000', '0.0000', 'partial', 'pending', 'Kenneth', 2, 2, '2015-11-09 10:23:39'),
(20, '154121', '', '1234567890', '', '12315464', '2015-11-09 12:03:00', 0, 1, 'SM Savemore', '', 1, 'shalom', '&lt;p&gt;test&lt;&sol;p&gt;', '1801000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '1801000.0000', '0.0000', 'complete', 'pending', 'Kenneth', 2, 2, '2015-11-09 12:05:14'),
(21, '154121', '', '1234567890', '', '12315464', '2015-11-09 12:37:28', 0, 1, 'SM Savemore', '', 1, 'shalom', '&lt;p&gt;test partial&lt;&sol;p&gt;', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 'complete', 'paid', 'Kenneth', 5, 6, '2015-11-09 12:39:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `product_brand`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `supplier_id`, `received`) VALUES
(13, 1, NULL, 1, 'DRAS0001', 'Access Valve', '', 0, '200.0000', '2.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '400.0000', '2.0000', '2015-07-26', 'received', 0, 0),
(14, 1, NULL, 2, 'DRAS0002', 'Insulation Tape', '', 0, '200.0000', '5.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', NULL, '1000.0000', '5.0000', '2015-07-26', 'received', 0, 0),
(45, 7, NULL, 1, 'DRAS0001', 'Access Valve', '', 0, '100.0000', '1.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '100.0000', '1.0000', '2015-10-22', 'received', 0, 0),
(46, 7, NULL, 2, 'DRAS0002', 'Insulation Tape', '', 0, '154.5000', '1.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '154.5000', '1.0000', '2015-10-22', 'received', 0, 0),
(47, 2, NULL, 1, 'DRAS0001', 'Access Valve', '', 0, '100.0000', '30.0000', 2, '0.0000', 0, '', NULL, '0.0000', NULL, '3000.0000', '30.0000', '2015-10-22', 'received', 0, 0),
(48, 2, NULL, 3, 'DRAS0003', 'Ball valve', '', 0, '230.0000', '1.0000', 2, '0.0000', 0, '', NULL, '0.0000', NULL, '230.0000', '0.0000', '2015-10-22', 'received', 0, 0),
(78, 15, NULL, 1, 'DRAS0001', 'Access Valve', '', 0, '100.0000', '50.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '5000.0000', '50.0000', '2015-11-05', 'received', 0, 0),
(79, 15, NULL, 2, 'DRAS0002', 'Insulation Tape', '', 0, '154.5000', '50.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '7725.0000', '50.0000', '2015-11-05', 'received', 0, 0),
(80, 17, NULL, 2, 'DRAS0002', 'Insulation Tape', '', NULL, '154.5000', '100.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '15450.0000', '100.0000', '2015-11-05', 'pending', 0, 0),
(81, 17, NULL, 2, 'DRAS0002', 'Insulation Tape', '', NULL, '154.5000', '50.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '7725.0000', '50.0000', '2015-11-05', 'pending', 0, 0),
(108, 19, NULL, 1, 'DRAS0001', 'Access Valve', '', 0, '100.0000', '0.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '5000.0000', '50.0000', '2015-11-09', 'partial', 0, 50),
(109, 19, NULL, 2, 'DRAS0002', 'Insulation Tape', '', 0, '154.5000', '0.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '7725.0000', '50.0000', '2015-11-09', 'partial', 0, 50),
(110, 19, NULL, 1, 'DRAS0001', 'Access Valve', '', 0, '100.0000', '0.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '100.0000', '1.0000', '2015-11-09', 'partial', 0, 1),
(111, 19, NULL, 1, 'DRAS0001', 'Access Valve', '', 0, '100.0000', '0.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '100.0000', '1.0000', '2015-11-09', 'partial', 0, 1),
(112, 19, NULL, 1, 'DRAS0001', 'Access Valve', '', 0, '100.0000', '0.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '100.0000', '0.0000', '2015-11-09', 'partial', 0, 1),
(113, 19, NULL, 2, 'DRAS0002', 'Insulation Tape', '', 0, '154.5000', '0.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '154.5000', '0.0000', '2015-11-09', 'partial', 0, 1),
(114, 19, NULL, 3, 'DRAS0003', 'Ball valve', '', 0, '230.0000', '0.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '230.0000', '0.0000', '2015-11-09', 'partial', 0, 1),
(115, 16, NULL, 1, 'DRAS0001', 'Access Valve', '', 0, '100.0000', '0.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '5000.0000', '50.0000', '2015-11-09', 'complete', 5, 50),
(116, 16, NULL, 2, 'DRAS0002', 'Insulation Tape', '', 0, '154.5000', '0.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '7725.0000', '50.0000', '2015-11-09', 'complete', 2, 50),
(117, NULL, NULL, 8, '156489136215', 'iPhone 6s', '', NULL, '45000.0000', '420.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '18900000.0000', '420.0000', '2015-11-09', 'received', 0, 0),
(118, NULL, NULL, 9, 'SGS6E', 'Samsung Galaxy S6 Edge', 'Samsung', NULL, '45000.0000', '100.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '9000000.0000', '100.0000', '2015-11-09', 'received', 0, 0),
(119, NULL, NULL, 9, 'SGS6E', 'Samsung Galaxy S6 Edge', 'Samsung', NULL, '45000.0000', '100.0000', 3, '0.0000', NULL, NULL, NULL, NULL, NULL, '9000000.0000', '100.0000', '2015-11-09', 'received', 0, 0),
(125, 20, NULL, 9, 'SGS6E', 'Samsung Galaxy S6 Edge', '', 0, '45000.0000', '0.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '900000.0000', '20.0000', '2015-11-09', 'complete', 2, 20),
(126, 20, NULL, 8, '156489136215', 'iPhone 6s', '', 0, '45000.0000', '0.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '900000.0000', '0.0000', '2015-11-09', 'complete', 5, 20),
(127, 20, NULL, 1, 'DRAS0001', 'Access Valve', '', 0, '100.0000', '0.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '1000.0000', '0.0000', '2015-11-09', 'complete', 2, 10),
(132, 21, NULL, 9, 'SGS6E', 'Samsung Galaxy S6 Edge', '', 0, '45000.0000', '0.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '0.0000', '10.0000', '2015-11-09', 'complete', 0, 0),
(133, 21, NULL, 8, '156489136215', 'iPhone 6s', '', 0, '45000.0000', '0.0000', 1, '0.0000', 0, '', NULL, '0.0000', NULL, '0.0000', '30.0000', '2015-11-09', 'complete', 0, 0);

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
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_return_items`
--

INSERT INTO `sma_return_items` (`id`, `sale_id`, `return_id`, `sale_item_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`) VALUES
(1, 3, 1, 7, 5, 'DRAS0000', 'Installation / Repair', 'service', 0, '500.0000', '2.0000', 1, '0.0000', 0, '', '0', '0.0000', '1000.0000', ''),
(2, 3, 2, 6, 1, 'DRAS0001', 'Access Valve', 'standard', 0, '150.0000', '2.0000', 1, '0.0000', 0, '', '0', '0.0000', '300.0000', ''),
(3, 2, 3, 5, 2, 'DRAS0002', 'Insulation Tape', 'standard', 0, '170.0000', '2.0000', 1, '0.0000', 0, '', '0', '0.0000', '340.0000', ''),
(4, 3, 4, 6, 1, 'DRAS0001', 'Access Valve', 'standard', 0, '150.0000', '1.0000', 1, '0.0000', 0, '', '0', '0.0000', '150.0000', '');

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_return_sales`
--

INSERT INTO `sma_return_sales` (`id`, `sale_id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `surcharge`, `grand_total`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, 3, '2015-08-31 23:05:00', 'RETURNSL/2015/09/0001', 1, 'SM Savemore', 3, 'DRAS BILLER', 1, '&lt;p&gt;Balik&lt;&sol;p&gt;', '1000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '1000.0000', 2, NULL, NULL),
(2, 3, '2015-08-31 23:08:00', 'RETURNSL/2015/09/0002', 1, 'SM Savemore', 3, 'DRAS BILLER', 1, '', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '300.0000', 2, NULL, NULL),
(3, 2, '2015-08-31 23:10:00', 'RETURNSL/2015/09/0003', 4, 'Gaisano', 3, 'DRAS BILLER', 1, '', '340.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '340.0000', 2, NULL, NULL),
(4, 3, '2015-11-02 18:58:00', 'RETURNSL/2015/11/0004', 1, 'SM Savemore', 3, 'DRAS BILLER', 1, '', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '150.0000', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE IF NOT EXISTS `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
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
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`) VALUES
(1, '2015-07-25 23:24:00', 'SVC/2015/07/0001', 1, 'SM Savemore', 3, 'DRAS BILLER', 1, '', '', '790.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '790.0000', 'completed', 'pending', 0, NULL, 2, 2, '2015-07-26 01:10:17', 5, 0, '0.0000', NULL, '0.0000'),
(2, '2015-07-26 03:53:00', 'SVC/2015/07/0002', 4, 'Gaisano', 3, 'DRAS BILLER', 1, '', '', '2670.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '2670.0000', 'completed', 'paid', 0, NULL, 2, NULL, NULL, 6, 0, '3008.0000', 3, '0.0000'),
(3, '2015-07-28 04:48:00', 'SVC/2015/07/0003', 1, 'SM Savemore', 3, 'DRAS BILLER', 1, '', '', '1800.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '1800.0000', 'completed', 'partial', 0, NULL, 2, NULL, NULL, 5, 0, '1300.0000', 4, '0.0000'),
(4, '2015-11-02 19:03:00', 'SVC/2015/10/0004', 1, 'SM Savemore', 3, 'DRAS BILLER', 1, '&lt;p&gt;testt&lt;&sol;p&gt;', '&lt;p&gt;test&lt;&sol;p&gt;', '750.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '750.0000', 'completed', 'pending', 0, NULL, 2, NULL, NULL, 5, 0, '0.0000', NULL, '0.0000'),
(5, '2015-11-09 12:16:00', 'SVC/2015/11/0004', 1, 'SM Savemore', 3, 'DRAS BILLER', 1, '', '', '900000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '900000.0000', 'completed', 'pending', 0, NULL, 2, NULL, NULL, 20, 0, '0.0000', NULL, '0.0000');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`) VALUES
(2, 1, 1, 'DRAS0001', 'Access Valve', 'standard', 0, '150.0000', '150.0000', '3.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '450.0000', ''),
(3, 1, 2, 'DRAS0002', 'Insulation Tape', 'standard', NULL, '170.0000', '170.0000', '2.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '340.0000', ''),
(4, 2, 5, 'DRAS0000', 'Installation / Repair', 'service', NULL, '500.0000', '500.0000', '5.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '2500.0000', ''),
(5, 2, 2, 'DRAS0002', 'Insulation Tape', 'standard', NULL, '170.0000', '170.0000', '1.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '170.0000', ''),
(6, 3, 1, 'DRAS0001', 'Access Valve', 'standard', NULL, '150.0000', '150.0000', '2.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '300.0000', ''),
(7, 3, 5, 'DRAS0000', 'Installation / Repair', 'service', NULL, '500.0000', '500.0000', '3.0000', 1, '0.0000', 1, '0.0000', '0', '0.0000', '1500.0000', ''),
(8, 4, 1, 'DRAS0001', 'Access Valve', 'standard', NULL, '150.0000', '150.0000', '5.0000', 1, '0.0000', 0, '', NULL, '0.0000', '750.0000', ''),
(9, 5, 8, '156489136215', 'iPhone 6s', 'standard', 0, '45000.0000', '45000.0000', '20.0000', 1, '0.0000', 0, '', NULL, '0.0000', '900000.0000', '123456789');

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
('01e2bd726600996c7e2783178b8a13f3b37e1a75', '224.0.0.0', 1447009034, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373030393033343b),
('05e5525bc87266af6dc88043bdf085cd386c5c1d', '::1', 1447072211, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373037313931373b6964656e746974797c733a31353a2269737375657240647261732e636f6d223b757365726e616d657c733a31313a22746573742d697373756572223b656d61696c7c733a31353a2269737375657240647261732e636f6d223b757365725f69647c733a313a2237223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343436373232353839223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a323a223131223b77617265686f7573655f69647c733a313a2231223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c4e3b73686f775f70726963657c4e3b),
('0927e8387e9a7147dcbb97f8a9c00279e4d9e74a', '::1', 1447066722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373036363435383b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224756666f5130446c3576654946674c7369716370223b),
('0dc6b3d12f1f14920683abb918af2fae29c7dab0', '::1', 1447035583, 0x7265717565737465645f706167657c733a383a2270726f6475637473223b5f5f63695f6c6173745f726567656e65726174657c693a313434373033353134363b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303039393733223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a226c6a6e624337504e647245716844424f66747757223b72656d6f76655f706f6c737c733a313a2231223b),
('0e5cfb4ddb64512168cdb09810c80b39d3f5c954', '::1', 1447034785, 0x7265717565737465645f706167657c733a383a2270726f6475637473223b5f5f63695f6c6173745f726567656e65726174657c693a313434373033343433363b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303039393733223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2278653245614b726b356831586d4f4c7449447a77223b72656d6f76655f706f6c737c733a313a2231223b),
('0f2d1f2a4f54aaf6b0575b067b811722944e47ae', '::1', 1447049188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373034383930363b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('10c334cb4ab71ebb8d8f2dbc20c5ba0c5799f004', '::1', 1447065980, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373036353336333b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2270685a6e5773486f5865444b6d4d49626c727643223b72656d6f76655f706f6c737c733a313a2231223b),
('116ae8e119564fcb095c56643f9d21e19936e296', '::1', 1447009909, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373030393630383b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343436393734303936223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22595a6648644f567379356f414d7765454738396a223b72656d6f76655f706f6c737c733a313a2231223b),
('11f8e62d4f454349938c80775e74b33847b48c43', '::1', 1447072653, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373037323335343b6964656e746974797c733a31383a22726571756573746f7240647261732e636f6d223b757365726e616d657c733a31333a227072662d726571756573746f72223b656d61696c7c733a31383a22726571756573746f7240647261732e636f6d223b757365725f69647c733a313a2235223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343436373138363033223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2239223b77617265686f7573655f69647c733a313a2231223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a225356464850454c76735965664932613947344364223b),
('156cbe404f103d07bbd6b1e833a973c584e51a9f', '::1', 1447038591, 0x7265717565737465645f706167657c733a383a2270726f6475637473223b5f5f63695f6c6173745f726567656e65726174657c693a313434373033383339313b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303039393733223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a227772496e4e34753742695854456a5a6261637a4b223b),
('1b955b995c1fcfcca3d5bc16cc4c2610b009e52d', '::1', 1447064464, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373036343135303b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224933506a4a59477379744f636c6f31397a44784e223b72656d6f76655f706f6c737c733a313a2231223b),
('1f30d6e22b3cad420094ffae4f88ae30a768fcfc', '::1', 1447034129, 0x7265717565737465645f706167657c733a383a2270726f6475637473223b5f5f63695f6c6173745f726567656e65726174657c693a313434373033323636353b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303039393733223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22534648436c74567158363463356a447977506d52223b72656d6f76655f706f6c737c733a313a2231223b),
('2069d98b6619cd2292c28ba074b0066b1b3da4c4', '::1', 1447010320, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373030393931303b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343436393734303936223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22466d54446165415569714f47734e3756674b3930223b72656d6f76655f706f6c737c733a313a2231223b),
('2d1f76439099cbd71b79435613cbd670883a241e', '::1', 1447071766, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373037313335363b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a225578634d714579566f4e4433777a6d4f31536c51223b),
('341623b03abb702d0373a9f64cfd02dd4af48f2d', '::1', 1447039559, 0x7265717565737465645f706167657c733a383a2270726f6475637473223b5f5f63695f6c6173745f726567656e65726174657c693a313434373033393035363b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303039393733223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22475146774241304f6b34583875444574506e6862223b),
('350f97ee8d8e323a832cd9513b2e431a8531747d', '::1', 1447063482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373036333032383b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22317965436d5938534f5a73624e464d6750354b71223b72656d6f76655f706f6c737c733a313a2231223b),
('3a14603de86a1da68f8b9a094d2fe05cd7545eeb', '::1', 1447064150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373036333438343b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22676855646146363035447078547559485658526e223b72656d6f76655f706f6c737c733a313a2231223b),
('3b18f75f73ad0814fc30361607fb927e097678cf', '::1', 1447012764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373031303332323b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343436393734303936223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a226c637361756555534b473359696b464c3072544f223b72656d6f76655f706f6c737c733a313a2231223b),
('3cf320e4cc237687c5b3b1f61ce70caad94b4db1', '::1', 1447071090, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373037303938313b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a225578634d714579566f4e4433777a6d4f31536c51223b),
('4936d9e21173a10934ed8ab812aa2a0c37d4f98d', '::1', 1447070959, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373037303637353b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a225578634d714579566f4e4433777a6d4f31536c51223b),
('4c1ff8afb56ac03d5e5fa60e910cdfece3a01428', '::1', 1447067187, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373036363736373b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224756666f5130446c3576654946674c7369716370223b),
('4d188a838b71977c76e6c2840ada8b878397e7ee', '::1', 1447067753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373036373735323b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224756666f5130446c3576654946674c7369716370223b),
('4ebfa9f45f0c685ac27a30b3f7008b4d72706e89', '127.0.0.1', 1447009161, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373030393133383b7265717565737465645f706167657c733a303a22223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303038343838223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('500a1d515a44483848e37dc210ed6575a0a17869', '::1', 1447067419, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373036373231333b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224756666f5130446c3576654946674c7369716370223b),
('60f66778d5ae3a760e85023f48a02a02a34aabf3', '::1', 1447013803, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373031333739393b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343436393734303936223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2241746e5439624e7049536d73784c4643316b5030223b72656d6f76655f706f6c737c693a313b),
('66141d3cf7c56f85c7a73c0ba73996abfab358d6', '::1', 1447062692, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373036323336313b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a226746305a4c6a4e54427572534f6f365155637a56223b72656d6f76655f706f6c737c733a313a2231223b),
('710367861960e6c5032f105cf9f7390ba432107f', '::1', 1447009323, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373030393033343b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343436393734303936223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224a497238673137647a4d346d59636e4752484435223b),
('728d9c9522194615abd08a06758df3409c2a7165', '::1', 1447038391, 0x7265717565737465645f706167657c733a383a2270726f6475637473223b5f5f63695f6c6173745f726567656e65726174657c693a313434373033363339373b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303039393733223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224e55396e5a5748594d674f466869744351717547223b72656d6f76655f706f6c737c733a313a2231223b),
('750eaac897375a0edaf1c9e6e88ba81d581abb9a', '::1', 1447040141, 0x7265717565737465645f706167657c733a383a2270726f6475637473223b5f5f63695f6c6173745f726567656e65726174657c693a313434373033393837323b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303039393733223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22346338484335424b784f54535a7552664c577244223b),
('7f73accbe86c313667ffff4f370f47fe7f8c1267', '::1', 1447064727, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373036343436353b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a227479724c704f6342684a52695637454e5431656e223b),
('983d0205d247f7b687b0c55506c459a8b01bc1f2', '::1', 1447070661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373037303336363b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2249724c50736d475633516c534365364b30584241223b72656d6f76655f706f6c737c693a313b),
('9b47eb2b777b06df7f80050dd55f3695552bc78b', '::1', 1447013587, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373031333432373b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343436393734303936223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a223964783251636f65564849434a5a777234466769223b72656d6f76655f706f6c737c693a313b),
('9f9736ebf3d0cdb5562c93811e034863cec4e6ff', '::1', 1447010287, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373030393936383b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303039313438223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224b4c44576571774561526c764a6863376f424658223b72656d6f76655f706f6c737c733a313a2231223b),
('a0870aa34a3b17779bd311292787656e7dde5d22', '::1', 1447072799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373037323739353b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303732343635223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('a0cfbb48e041ef8b2a977d501b5565a825241489', '::1', 1447062361, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373035373033383b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a225847495579696c4c67656d7559766b504e466135223b72656d6f76655f706f6c737c733a313a2231223b),
('a5782f1532e98f5c94a1bc8499b525aa37d05acf', '::1', 1447035144, 0x7265717565737465645f706167657c733a383a2270726f6475637473223b5f5f63695f6c6173745f726567656e65726174657c693a313434373033343738353b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303039393733223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2261456943657a4642596e6b77444f683650784b56223b72656d6f76655f706f6c737c733a313a2231223b),
('aa4dbce623e956a9bafcfe1700d0f06774b927dc', '::1', 1447038899, 0x7265717565737465645f706167657c733a383a2270726f6475637473223b5f5f63695f6c6173745f726567656e65726174657c693a313434373033383734363b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303039393733223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a223274644c4534515758434961385936426d677554223b),
('ae100d1107d39691290eccf27e4b249d113ffa61', '::1', 1447008584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373030383438333b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343436393734303936223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224a497238673137647a4d346d59636e4752484435223b),
('b11aed82ba50e0da214ad7c7c53ee254f8bbc278', '::1', 1447057036, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373035363234343b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22547a384b4c364e476b783066716439564a69416e223b72656d6f76655f706f6c737c733a313a2231223b),
('ba3f2dc65edde310b37d926b4e9c4d74e8a7205c', '::1', 1447048257, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373034383230313b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('bace087f1acaf18dc82fdddfce4d413957045774', '::1', 1447056240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373035333830333b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22597150695330446b644f66387965367745724c76223b72656d6f76655f706f6c737c733a313a2231223b),
('bb396972bf456834113e6c9c2266aaf7fb5ee20f', '::1', 1447065363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373036343836363b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a227259744a546c6356426a73655052554f5a473441223b72656d6f76655f706f6c737c733a313a2231223b),
('c39da041903973bb65db12dc5d124296baaa925c', '::1', 1447010309, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373031303238383b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303039313438223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22333973493844326d6f415546665a765379484e78223b),
('c77fe6593ce549b3717a8cc3eb6899f65d22bcec', '224.0.0.0', 1447009034, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373030393033343b),
('cc378be11d15134a2643cad4096c67b53c0ee969', '::1', 1447053682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373035333439333b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2246377535704a3830437a66685a62566e74327345223b),
('cc921d6a212a7492e1e17585ab63be5c4b7b92fa', '::1', 1447012776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373031323736363b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343436393734303936223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22717742785a746a515239557a56626835654a6b37223b),
('d354865f23d0678639e9cebdd0a6d72e068ea285', '::1', 1447035626, 0x7265717565737465645f706167657c733a383a2270726f6475637473223b5f5f63695f6c6173745f726567656e65726174657c693a313434373033353538353b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303039393733223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2278336c777974387057685a6e7a5447316a4b4265223b),
('d71ca72299c8de37b8dae5902f462b4b83f8d6c2', '::1', 1447070313, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373037303031383b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224756666f5130446c3576654946674c7369716370223b),
('d8d2e75ee4d4812163a2374119c61bda83e20501', '::1', 1447063027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373036323639333b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22536e7765426f646756346c4f624759663661765a223b72656d6f76655f706f6c737c733a313a2231223b),
('de6d354562c4505487c5be686825011ff61fb886', '::1', 1447036162, 0x7265717565737465645f706167657c733a383a2270726f6475637473223b5f5f63695f6c6173745f726567656e65726174657c693a313434373033363030373b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303039393733223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a2239664e4d6a7462596555766b61587845304c6d48223b72656d6f76655f706f6c737c693a313b),
('df90fd4bc69184194a4718fe85375f45c8ac8c95', '::1', 1447040453, 0x7265717565737465645f706167657c733a383a2270726f6475637473223b5f5f63695f6c6173745f726567656e65726174657c693a313434373034303138383b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303039393733223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a226d3254453649776c34654c4231306944384a6678223b),
('e5302a81f76bfc5dbf8cc07450b8a9f5127bb3b0', '::1', 1447066458, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373036353938303b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a224e493159506c324b4c46365a3748767964454f34223b72656d6f76655f706f6c737c733a313a2231223b),
('e64fa8efc5b16fa24a2232d4480695d66463f12b', '::1', 1447049311, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373034393236353b7265717565737465645f706167657c733a31323a2270726f64756374732f616464223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303332363730223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('ee7a34bd5e6c4560ba7aa444309ff651be8088bc', '224.0.0.0', 1447008485, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373030383438353b),
('fa73037b750ec8ffd9c33cbe270c291e4a3b0a2d', '::1', 1447034431, 0x7265717565737465645f706167657c733a383a2270726f6475637473223b5f5f63695f6c6173745f726567656e65726174657c693a313434373033343133313b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303039393733223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22546f447755426a573965385a33537a76794a6149223b),
('fdcc597f212f46de8f9d04b497f9e06df10b7d7f', '::1', 1447072485, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434373037323436313b7265717565737465645f706167657c733a393a22707572636861736573223b6964656e746974797c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365726e616d657c733a31303a22737570657261646d696e223b656d61696c7c733a31383a2272656e7a6d61727640676d61696c2e636f6d223b757365725f69647c733a313a2232223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343437303438323537223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a31343a2272656e7a6d61722d69642e6a7067223b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c733a313a2230223b62696c6c65725f69647c733a313a2233223b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b757365725f637372667c733a32303a22326c76486265635943537a6656354f415a723351223b);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_transfers`
--

INSERT INTO `sma_transfers` (`id`, `transfer_no`, `date`, `from_warehouse_id`, `from_warehouse_code`, `from_warehouse_name`, `to_warehouse_id`, `to_warehouse_code`, `to_warehouse_name`, `note`, `total`, `total_tax`, `grand_total`, `created_by`, `status`, `shipping`) VALUES
(1, 'TR/2015/07/0001', '2015-07-26 04:00:00', 2, 'WH2', 'Antipolo Warehouse', 1, 'WH1', 'Boni Warehouse', '', '300.0000', '0.0000', '300.0000', '2', 'completed', '0.0000'),
(2, 'TR/2015/07/0002', '2015-07-28 04:21:00', 2, 'WH2', 'Antipolo Warehouse', 1, 'WH1', 'Boni Warehouse', '&lt;p&gt;NOTE&lt;&sol;p&gt;', '4000.0000', '0.0000', '4000.0000', '2', 'completed', '0.0000');

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
(2, 0x3a3a31, 0x3a3a31, 'superadmin', '76b4427d3eb6db9206fd6daf4ae7868e8e9a90b3', NULL, 'renzmarv@gmail.com', NULL, NULL, NULL, NULL, 1437822241, 1447072799, 1, 'Renz Mar', 'Velasco', 'DRAS', '09267269850', 'renzmar-id.jpg', 'male', 1, 0, 3, NULL, 0, 0, 0),
(3, 0x3a3a31, 0x3a3a31, 'darwinaquino', '337de132604268ac885854034b1205bd44c8a8db', NULL, 'darwin@dras.com', NULL, NULL, NULL, NULL, 1437899862, 1445993372, 1, 'Darwin', 'Aquino', 'DRAS', '09178435698', 'darwin_id.jpg', 'male', 3, 2, 3, NULL, 1, 1, 0),
(4, 0x3a3a31, 0x3a3a31, 'kenneth', '22b4ab08fe53924e96769291bf4070d80f1e4330', NULL, 'kenneth@dras.com', NULL, NULL, NULL, NULL, 1438060041, 1438060057, 1, 'Kenneth', 'Hinal', 'DRAS', '0987654321', NULL, 'male', 5, 1, 3, NULL, 0, 0, 0),
(5, 0x3a3a31, 0x3a3a31, 'prf-requestor', '6bbdb0171d6752f31cd2974d6ded4a40eec941cf', NULL, 'requestor@dras.com', NULL, NULL, NULL, NULL, 1445320581, 1447072384, 1, 'Jerusalem', 'Fonseca', 'DRAS', '+639323331339', NULL, 'male', 9, 1, 3, NULL, 0, 0, 0),
(6, 0x3a3a31, 0x3a3a31, 'test-receiver', 'a9daefdce0d2c8b419aac12364a74af14fa419e0', NULL, 'receiver@dras.com', NULL, NULL, NULL, NULL, 1446230158, 1447072663, 1, 'test', 'test', 'DRAS', '1234567890', NULL, 'female', 10, 1, 3, NULL, NULL, NULL, 0),
(7, 0x3a3a31, 0x3a3a31, 'test-issuer', '25a2ec05fa52454e40e533234d085c9d233036ed', NULL, 'issuer@dras.com', NULL, NULL, NULL, NULL, 1446489728, 1447071925, 1, 'issuer', 'test', 'DRAS', '789565412', NULL, 'male', 11, 1, 3, NULL, NULL, NULL, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

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
(138, 2, NULL, 0x3a3a31, 'renzmarv@gmail.com', '2015-11-09 12:39:59');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`) VALUES
(1, 'WH1', 'Boni Warehouse', '<p>Boni Ave. Mandaluyong City</p>', NULL, '012345678', ''),
(2, 'WH2', 'Antipolo Warehouse', '<p>M.L. Quezon, Brgy. San Roque Antipolo</p>', NULL, '012345678', ''),
(3, 'WH3', 'Cebu', '<p>Cebu City</p>', NULL, '012345678', ''),
(4, 'WH4', 'Davao', '<p>Davao City</p>', NULL, '012345678', ''),
(5, 'WH5', 'Tuguegarao', '<p>Cagayan</p>', NULL, '012345678', ''),
(6, 'WH6', 'Solano', '<p>Nueva Vizcaya</p>', NULL, '012345678', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`) VALUES
(3, 2, 1, '477.0000', NULL),
(4, 3, 1, '20.0000', NULL),
(6, 5, 1, '0.0000', NULL),
(7, 5, 2, '0.0000', NULL),
(8, 5, 3, '0.0000', NULL),
(9, 5, 4, '0.0000', NULL),
(10, 5, 5, '0.0000', NULL),
(11, 5, 6, '0.0000', NULL),
(12, 1, 1, '10.0000', NULL),
(13, 1, 2, '30.0000', NULL),
(14, 3, 2, '1.0000', NULL),
(15, 8, 1, '420.0000', NULL),
(16, 9, 1, '125.0000', NULL),
(17, 9, 3, '100.0000', NULL);

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
(11, 0, 1, 1, '240.0000', NULL),
(12, 0, 3, 2, '1.0000', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=134;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_return_sales`
--
ALTER TABLE `sma_return_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
