CREATE TABLE IF NOT EXISTS customer.clients (
    id SERIAL NOT NULL,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email  VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(15) NOT NULL,
    client_detail_id UUID NOT NULL,
    is_active  BOOLEAN NOT NULL DEFAULT True,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS customer.shipping (
    id SERIAL NOT NULL,
    address VARCHAR(100) NOT NULL,
    address_2 VARCHAR(10),
    city VARCHAR(20) NOT NULL,
    state  VARCHAR(2) NOT NULL,
    zip VARCHAR(20) NOT NULL,
    client_id INT NOT NULL,
    shipping_detail_id UUID NOT NULL,
    is_current BOOLEAN NOT NULL,
    is_active  BOOLEAN NOT NULL DEFAULT True,
    PRIMARY KEY(id),
    CONSTRAINT fk_shipping_client
        FOREIGN KEY(client_id) 
            REFERENCES customer.clients(id)
);

CREATE TABLE IF NOT EXISTS customer.billing (
    id SERIAL NOT NULL,
    address VARCHAR(100) NOT NULL,
    address_2 VARCHAR(10) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state  VARCHAR(2) NOT NULL,
    zip VARCHAR(20) NOT NULL,
    client_id INT NOT NULL,
    billing_detail_id UUID NOT NULL,
    is_current BOOLEAN NOT NULL,
    is_active  BOOLEAN NOT NULL DEFAULT True,
    PRIMARY KEY(id),
    CONSTRAINT fk_billing_client
        FOREIGN KEY(client_id) 
            REFERENCES customer.clients(id)
);


CREATE TABLE IF NOT EXISTS history.purchase_history (
    id SERIAL NOT NULL,
    purchase_detail_id UUID NOT NULL,
    purchase_total DECIMAL(2) NOT NULL,
    purchase_date TIMESTAMP NOT NULL,
    delivery_date TIMESTAMP NOT NULL,
    client_detail_id UUID NOT NULL,
    billing_detail_id UUID NOT NULL,
    shipping_detail_id UUID NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS inventory.products (
    id SERIAL NOT NULL,
    name VARCHAR(20) NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(2) NOT NULL,
    sku_number VARCHAR(20) UNIQUE NOT NULL,
    in_stock BOOLEAN NOT NULL,
    quantity INT NOT NULL,
    is_active  BOOLEAN NOT NULL DEFAULT True,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS inventory.vendor (
    id SERIAL NOT NULL,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    address_2 VARCHAR(10),
    city VARCHAR(20) NOT NULL,
    state  VARCHAR(2) NOT NULL,
    zip VARCHAR(20) NOT NULL,
    is_active  BOOLEAN NOT NULL DEFAULT True,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS inventory.contact (
    id SERIAL NOT NULL,
    title VARCHAR(15) NOT NULL,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    email  VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    vendor_contact_id INT NOT NULL,
    is_active  BOOLEAN NOT NULL DEFAULT True,
    PRIMARY KEY(id),
    CONSTRAINT fk_vender_contact
        FOREIGN KEY(vendor_contact_id) 
            REFERENCES inventory.vendor(id)
);

CREATE TABLE IF NOT EXISTS invoice.purchase (
    id SERIAL NOT NULL,
    product_id INT NOT NULL,
    qantity INT NOT NULL,
    price DECIMAL(2) NOT NULL,
    purchase_total DECIMAL(2) NOT NULL,
    purchase_date TIMESTAMP NOT NULL,
    client_billing_id INT NOT NULL,
    client_shipping_id INT NOT NULL,
    purchase_detail_id UUID NOT NULL,
    is_active  BOOLEAN NOT NULL DEFAULT True,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS shipping.shipper (
    id SERIAL NOT NULL,
    name VARCHAR(30) NOT NULL,
    address VARCHAR(100) NOT NULL,
    address_2 VARCHAR(10),
    city VARCHAR(20) NOT NULL,
    state  VARCHAR(2) NOT NULL,
    zip VARCHAR(20) NOT NULL,
    is_active  BOOLEAN NOT NULL DEFAULT True,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS shipping.shipped (
    id SERIAL NOT NULL,
    shipper_id INT NOT NULL,
    purchase_detail_id UUID NOT NULL,
    shipping_uuid UUID NOT NULL,
    ship_date TIMESTAMP NOT NULL,
    delivered BOOLEAN NOT NULL,
    delivery_date TIMESTAMP NOT NULL,
    is_active  BOOLEAN NOT NULL DEFAULT True,
    PRIMARY KEY(id)
);





    



