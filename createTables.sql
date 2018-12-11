CREATE TABLE IF NOT EXISTS Contents (
  id int(11) NOT NULL AUTO_INCREMENT,
  permalink varchar(255),
  title text,
  body text,
  author varchar(255),
  draft tinyint(1),
  featured tinyint(1),
  pubblicationDate timestamp NOT NULL DEFAULT NOW(),
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Categories (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255),
  permalink varchar(255),
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Tags (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255),
  permalink varchar(255),
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Attachments (
  id int(11) NOT NULL AUTO_INCREMENT,
  href varchar(255),
  contentType varchar(255),
  description varchar(255),
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ContentsCategoriesTh (
  id int(11) NOT NULL AUTO_INCREMENT,
  contentId int(11),
  categoryId int(11),
  PRIMARY KEY (id),
  FOREIGN KEY (contentId) REFERENCES Contents(id),
  FOREIGN KEY (categoryId) REFERENCES Categories(id)
);

CREATE TABLE IF NOT EXISTS ContentsTagsTh (
  id int(11) NOT NULL AUTO_INCREMENT,
  contentId int(11),
  tagId int(11),
  PRIMARY KEY (id),
  FOREIGN KEY (contentId) REFERENCES Contents(id),
  FOREIGN KEY (tagId) REFERENCES Tags(id)

);

CREATE TABLE IF NOT EXISTS ContentsAttachmentsTh (
  id int(11) NOT NULL AUTO_INCREMENT,
  contentId int(11),
  attachmentId int(11),
  PRIMARY KEY (id),
  FOREIGN KEY (contentId) REFERENCES Contents(id),
  FOREIGN KEY (attachmentId) REFERENCES Attachments(id)
);