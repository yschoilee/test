CREATE TABLE `students` (
    `name` VARCHAR(16),
    `admission_year` YEAR,
    `major_code` CHAR(5),
    `serial_num` CHAR(5),
    `phone_num` VARCHAR(20),
    `address` VARCHAR(100),
    `total_credits` INT DEFAULT 0,
    `gpa` DECIMAL(2,1) DEFAULT 0.0,
    `is_enrolled` TINYINT(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
