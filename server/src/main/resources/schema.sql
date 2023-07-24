
CREATE TABLE posts IF NOT EXISTS (
    post_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    createdAt DATETIME,
    updatedAt DATETIME,
    post_content TEXT,
    post_image TEXT,
    star_rating INT,
    post_title VARCHAR(255),
    cafe_id BIGINT,
    member_id BIGINT,
    CONSTRAINT fk_member
        FOREIGN KEY (member_id) REFERENCES Member (MEMBER_ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT fk_cafe
        FOREIGN KEY (cafe_id) REFERENCES cafes (cafe_id)
        ON UPDATE RESTRICT
        ON DELETE CASCADE
);

CREATE TABLE PostBookmark IF NOT EXISTS (
    postBookmarkId BIGINT AUTO_INCREMENT PRIMARY KEY,
    member_id BIGINT,
    post_id BIGINT,
    CONSTRAINT fk_member
        FOREIGN KEY (member_id) REFERENCES Member (MEMBER_ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT fk_post
        FOREIGN KEY (post_id) REFERENCES posts (post_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

CREATE TABLE post_tag IF NOT EXISTS (
    post_tag_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cafe_id BIGINT,
    post_id BIGINT,
    tag_id BIGINT,
    CONSTRAINT fk_tag
        FOREIGN KEY (tag_id) REFERENCES tag (tag_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT fk_cafe
        FOREIGN KEY (cafe_id) REFERENCES cafes (cafe_id)
        ON UPDATE RESTRICT
        ON DELETE CASCADE,
    CONSTRAINT fk_post
        FOREIGN KEY (post_id) REFERENCES posts (post_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

CREATE TABLE tag IF NOT EXISTS (
    tag_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255)
);

CREATE TABLE comments IF NOT EXISTS (
    comment_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    createdAt DATETIME,
    updatedAt DATETIME,
    content VARCHAR(255),
    member_id BIGINT,
    parent_comment_id BIGINT,
    post_id BIGINT,
    CONSTRAINT fk_parent_comment
        FOREIGN KEY (parent_comment_id) REFERENCES comments (comment_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT fk_post
        FOREIGN KEY (post_id) REFERENCES posts (post_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT fk_member
        FOREIGN KEY (member_id) REFERENCES Member (MEMBER_ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

CREATE TABLE cafes IF NOT EXISTS (
    cafe_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    createdAt DATETIME,
    updatedAt DATETIME,
    address VARCHAR(255),
    close_time VARCHAR(255),
    contact VARCHAR(255),
    has_dessert BIT(1),
    has_parking BIT(1),
    cafe_image TEXT,
    is_charging_available BIT(1),
    is_open_all_time BIT(1),
    is_pet_friendly BIT(1),
    latitude DOUBLE,
    longitude DOUBLE,
    cafe_name VARCHAR(255),
    notice VARCHAR(255),
    open_time VARCHAR(255),
    rating FLOAT,
    short_address VARCHAR(255),
    owner_id BIGINT,
    CONSTRAINT fk_owner
        FOREIGN KEY (owner_id) REFERENCES Owner (OWNER_ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

CREATE TABLE cafe_bookmarks IF NOT EXISTS (
    cafe_bookmark_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cafe_id BIGINT,
    member_id BIGINT,
    CONSTRAINT fk_cafe
        FOREIGN KEY (cafe_id) REFERENCES cafes (cafe_id)
        ON UPDATE RESTRICT
        ON DELETE CASCADE,
    CONSTRAINT fk_member
        FOREIGN KEY (member_id) REFERENCES Member (MEMBER_ID)
        ON UPDATE RESTRICT
        ON DELETE CASCADE
);

CREATE TABLE menus IF NOT EXISTS (
    menu_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    menu_type VARCHAR(255),
    menu_name VARCHAR(255),
    price INT,
    cafe_id BIGINT,
    CONSTRAINT fk_cafes
        FOREIGN KEY (cafe_id) REFERENCES cafes (cafe_id)
        ON UPDATE RESTRICT
        ON DELETE CASCADE
);

CREATE TABLE menu_comments IF NOT EXISTS (
    menu_comment_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    createdAt DATETIME,
    updatedAt DATETIME,
    menu_content VARCHAR(255),
    member_id BIGINT,
    menu_id BIGINT,
    CONSTRAINT fk_menu
        FOREIGN KEY (menu_id) REFERENCES menus (menu_id)
        ON UPDATE RESTRICT
        ON DELETE CASCADE,
    CONSTRAINT fk_member
        FOREIGN KEY (member_id) REFERENCES Member (MEMBER_ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

CREATE TABLE Member IF NOT EXISTS (
    MEMBER_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    createdAt DATETIME,
    updatedAt DATETIME,
    displayName VARCHAR(100),
    MEMBER_EMAIL VARCHAR(100),
    grade VARCHAR(30),
    PROFILE_IMAGE TEXT,
    isPrivacy BIT(1),
    MEMBER_PASSWORD VARCHAR(100),
    MEMBER_STATUS VARCHAR(30)
);

CREATE TABLE Member_roles IF NOT EXISTS (
    Member_MEMBER_ID BIGINT,
    roles VARCHAR(255),
    CONSTRAINT fk_member_roles
        FOREIGN KEY (Member_MEMBER_ID) REFERENCES Member (MEMBER_ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

CREATE TABLE Follow IF NOT EXISTS (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    FOLLOWER_ID BIGINT,
    FOLLOWING_ID BIGINT,
    CONSTRAINT fk_follower
        FOREIGN KEY (FOLLOWER_ID) REFERENCES Member (MEMBER_ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT fk_following
        FOREIGN KEY (FOLLOWING_ID) REFERENCES Member (MEMBER_ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);

CREATE TABLE Owner IF NOT EXISTS (
    OWNER_ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    createdAt DATETIME,
    updatedAt DATETIME,
    OWNER_DISPLAYNAME VARCHAR(255),
    OWNER_EMAIL VARCHAR(255),
    OWNER_STATUS VARCHAR(255),
    OWNER_PASSWORD VARCHAR(255)
);

CREATE TABLE Owner_roles IF NOT EXISTS (
    Owner_OWNER_ID BIGINT,
    roles VARCHAR(255),
    CONSTRAINT fk_owner_roles
        FOREIGN KEY (Owner_OWNER_ID) REFERENCES Owner (OWNER_ID)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
);