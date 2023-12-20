CREATE TABLE `delegation_email_category` (
	`id` serial AUTO_INCREMENT NOT NULL,
	`title` varchar(256) NOT NULL,
	CONSTRAINT `delegation_email_category_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `email_delegation_groups` (
	`id` serial AUTO_INCREMENT NOT NULL,
	`category_id` int NOT NULL,
	`count` int NOT NULL DEFAULT 0,
	`title` varchar(256) NOT NULL,
	`color` varchar(256) NOT NULL DEFAULT 'blue',
	`split_on_account` boolean NOT NULL DEFAULT false,
	`claimable` boolean NOT NULL DEFAULT false,
	CONSTRAINT `email_delegation_groups_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `email_delegation_email_meta_data` (
	`email_id` varchar(256) NOT NULL,
	`in_group` int,
	`in_category` int,
	`handled_by` varchar(256),
	`assigned_to` varchar(256),
	CONSTRAINT `email_delegation_email_meta_data_email_id` PRIMARY KEY(`email_id`)
);
--> statement-breakpoint
CREATE TABLE `email_delegation_routing_rules_by_email` (
	`from_email` varchar(256) NOT NULL,
	`group_id` int NOT NULL,
	`assigned_to` varchar(256),
	CONSTRAINT `email_delegation_routing_rules_by_email_from_email` PRIMARY KEY(`from_email`)
);
--> statement-breakpoint
CREATE TABLE `email_delegation_emails` (
	`id` varchar(256) NOT NULL,
	`message_id` varchar(256),
	`references` text,
	`thread_id` varchar(256),
	`from_email` varchar(256),
	`from_name` varchar(256),
	`account` varchar(256) NOT NULL,
	`subject` text,
	`snippet` text,
	`date` datetime,
	CONSTRAINT `email_delegation_emails_id` PRIMARY KEY(`id`)
);
--> statement-breakpoint
CREATE TABLE `delegation_user_in_email_group` (
	`group_id` int NOT NULL,
	`user_id` varchar(256) NOT NULL,
	`name` varchar(256) NOT NULL,
	`count` int NOT NULL DEFAULT 0,
	CONSTRAINT `delegation_user_in_email_group_group_id_user_id_pk` PRIMARY KEY(`group_id`,`user_id`)
);
--> statement-breakpoint
CREATE TABLE `users` (
	`user_id` varchar(64) NOT NULL,
	`post` text,
	CONSTRAINT `users_user_id` PRIMARY KEY(`user_id`)
);
--> statement-breakpoint
CREATE INDEX `category_idx` ON `email_delegation_groups` (`category_id`);--> statement-breakpoint
CREATE INDEX `account_idx` ON `email_delegation_emails` (`account`);--> statement-breakpoint
CREATE INDEX `from_email_idx` ON `email_delegation_emails` (`from_email`);--> statement-breakpoint
CREATE INDEX `received_at_idx` ON `email_delegation_emails` (`date`);