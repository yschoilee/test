CREATE TABLE `users`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(16) NOT NULL,
    `user_pw` VARCHAR(255) NOT NULL,
    `nickname` VARCHAR(20) NOT NULL,
    `pic_url` VARCHAR(1000),
    `status_msg` VARCHAR(200),
    `is_out` TINYINT(1) NOT NULL DEFAULT 0,
    `signup_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels`(
    `id` INT AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(20) NOT NULL,
    `creator_id` INT NOT NULL,
    `channel_url` VARCHAR(1000) NOT NULL,
    `max_capacity` INT NOT NULL,
    `is_out` TINYINT(1) NOT NULL DEFAULT 0,
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`creator_id`) REFERENCES `users`(`id`) ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `chat_content` TEXT NOT NULL,
    `author_id` INT NOT NULL,
    `channel_id` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`author_id`)
    REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`channel_id`) 
    REFERENCES `channels`(`id`) ON DELETE CASCADE


) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `blocker_id` INT NOT NULL,
    `blocked_id` INT NOT NULL,
    `block_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`blocker_id`)
    REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`blocked_id`)
    REFERENCES `users`(`id`) ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower_id` INT NOT NULL,
    `followee_id` INT NOT NULL,
    `follow_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower_id`)
    REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee_id`)
    REFERENCES `users`(`id`) ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8;