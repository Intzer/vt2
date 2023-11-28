CREATE TABLE colors (
  id SERIAL PRIMARY KEY,
  code VARCHAR(50) UNIQUE
);
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  login VARCHAR(50) UNIQUE,
  role VARCHAR(50),
  password VARCHAR(128)
);
CREATE TABLE phones (
  id SERIAL PRIMARY KEY,
  brand VARCHAR(50) NOT NULL,
  model VARCHAR(254) NOT NULL,
  price REAL,
  displaySizeInches REAL,
  weightGr SMALLINT,
  lengthMm REAL,
  widthMm REAL,
  heightMm REAL,
  announced TIMESTAMPTZ,
  deviceType VARCHAR(50),
  os VARCHAR(100),
  displayResolution VARCHAR(50),
  pixelDensity SMALLINT,
  displayTechnology VARCHAR(50),
  backCameraMegapixels REAL,
  frontCameraMegapixels REAL,
  ramGb REAL,
  internalStorageGb REAL,
  batteryCapacityMah SMALLINT,
  talkTimeHours REAL,
  standByTimeHours REAL,
  bluetooth VARCHAR(50),
  positioning VARCHAR(100),
  imageUrl VARCHAR(254),
  description VARCHAR(4096),
  CONSTRAINT UC_phone UNIQUE (brand, model)
);

CREATE TABLE phone2color (
  phoneId BIGINT,
  colorId BIGINT,
  CONSTRAINT FK_phone2color_phoneId FOREIGN KEY (phoneId) REFERENCES phones (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_phone2color_colorId FOREIGN KEY (colorId) REFERENCES colors (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE stocks (
  phoneId BIGINT NOT NULL,
  stock SMALLINT NOT NULL,
  reserved SMALLINT NOT NULL,
  UNIQUE (phoneId),
  CONSTRAINT FK_stocks_phoneId FOREIGN KEY (phoneId) REFERENCES phones (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  secureID VARCHAR(300),
  subtotal REAL,
  deliveryPrice REAL,
  totalPrice REAL,
  firstName VARCHAR(100),
  lastName VARCHAR(100),
  deliveryAddress VARCHAR(100),
  contactPhoneNo VARCHAR(100),
  additionalInformation VARCHAR(4096),
  status VARCHAR(50),
  login VARCHAR(50),
  date DATE,
  time TIME
);

CREATE TABLE order2item (
  orderId BIGINT,
  phoneId BIGINT,
  quantity BIGINT
);