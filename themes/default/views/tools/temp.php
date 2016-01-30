CREATE TABLE `sma_tools` (
`id` int(11) NOT NULL,
`name` varchar(55) NOT NULL,
`description` varchar(255) NOT NULL,
`category_id` int(11) DEFAULT '0',
`date_added` timestamp NULL DEFAULT NULL,
`created_by` int(11) DEFAULT NULL,
`updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

ALTER TABLE `sma_tools`
ADD PRIMARY KEY (`id`),
ADD KEY `id` (`id`);


CREATE TABLE `sma_tools_categories` (
`id` int(11) NOT NULL,
`name` varchar(55) NOT NULL,
`description` varchar(255) NOT NULL,
`date_added` timestamp NULL DEFAULT NULL,
`created_by` int(11) DEFAULT NULL,
`updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

ALTER TABLE `sma_tools_categories`
ADD PRIMARY KEY (`id`),
ADD KEY `id` (`id`);


CREATE TABLE `sma_tools_transcations` (
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
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;


ALTER TABLE `sma_tools_transcations`
ADD PRIMARY KEY (`id`),
ADD KEY `id` (`id`);


