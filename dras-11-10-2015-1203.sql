-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2015 at 07:29 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

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
-- Table structure for table `sma_return_sales`
--

CREATE TABLE IF NOT EXISTS `sma_return_sales` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `dr_no` int(11) NOT NULL,
  `returned_by` varchar(55) NOT NULL,
  `received_by` varchar(55) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_return_sales`
--

INSERT INTO `sma_return_sales` (`id`, `sale_id`, `date`, `reference_no`, `dr_no`, `returned_by`, `received_by`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `surcharge`, `grand_total`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, 3, '2015-08-31 23:05:00', 'RETURNSL/2015/09/0001', 0, 'shalom', 'renz', 1, 'SM Savemore', 3, 'DRAS BILLER', 1, '&lt;p&gt;Balik&lt;&sol;p&gt;', '1000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '1000.0000', 2, NULL, NULL),
(2, 3, '2015-08-31 23:08:00', 'RETURNSL/2015/09/0002', 0, 'renz', 'shalom', 1, 'SM Savemore', 3, 'DRAS BILLER', 1, '', '300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '300.0000', 2, NULL, NULL),
(3, 2, '2015-08-31 23:10:00', 'RETURNSL/2015/09/0003', 0, 'renz', 'shalom', 4, 'Gaisano', 3, 'DRAS BILLER', 1, '', '340.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '340.0000', 2, NULL, NULL),
(4, 3, '2015-11-02 18:58:00', 'RETURNSL/2015/11/0004', 0, 'shalom', 'renz', 1, 'SM Savemore', 3, 'DRAS BILLER', 1, '', '150.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '150.0000', 2, NULL, NULL),
(5, 11, '2015-11-10 06:12:00', 'RETURNSL/2015/11/0005', 0, 'shalom', 'renz', 1, 'SM Savemore', 0, '', 1, '&lt;p&gt;test&lt;&sol;p&gt;', '600000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '600000.0000', 2, NULL, NULL),
(6, 11, '2015-11-10 06:27:00', 'RETURNSL/2015/11/0006', 12315464, 'shalom', 'shalom', 1, 'SM Savemore', 0, '', 1, '&lt;p&gt;test&lt;&sol;p&gt;', '60000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 0, '0.0000', '0.0000', '0.0000', '60000.0000', 2, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_return_sales`
--
ALTER TABLE `sma_return_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_return_sales`
--
ALTER TABLE `sma_return_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
