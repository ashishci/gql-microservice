CREATE DATABASE gqlms;

CREATE SCHEMA IF NOT EXISTS devops
    CREATE TABLE IF NOT EXISTS users (
        id SERIAL NOT NULL,
        first_name VARCHAR(10) NOT NULL,
        last_name VARCHAR(20) NOT NULL,
        email  VARCHAR(50) UNIQUE NOT NULL,
        password VARCHAR(15) NOT NULL,
        is_active  BOOLEAN NOT NULL DEFAULT True,
        PRIMARY KEY(id)
    );

CREATE SCHEMA IF NOT EXISTS customer
    CREATE TABLE IF NOT EXISTS clients (
        id SERIAL NOT NULL,
        first_name VARCHAR(10) NOT NULL,
        last_name VARCHAR(20) NOT NULL,
        email  VARCHAR(50) UNIQUE NOT NULL,
        password VARCHAR(15) NOT NULL,
        client_detail_id UUID NOT NULL,
        is_active  BOOLEAN NOT NULL DEFAULT True,
        PRIMARY KEY(id)
    )

    CREATE TABLE IF NOT EXISTS shipping (
        id SERIAL NOT NULL,
        address VARCHAR(100) NOT NULL,
        address_2 VARCHAR(10),
        city VARCHAR(20) NOT NULL
        state  VARCHAR(2) NOT NULL,
        zip VARCHAR(20) NOT NULL,
        client_id INT NOT NULL,
        shipping_detail_id UUID NOT NULL,
        is_current BOOLEAN NOT NULL
        is_active  BOOLEAN NOT NULL DEFAULT True,
        PRIMARY KEY(id),
        CONSTRAINT fk_shipping_client
            FOREIGN KEY(client_id) 
                REFERENCES client(id)
    )

    CREATE TABLE IF NOT EXISTS billing (
        id SERIAL NOT NULL,
        address VARCHAR(100) NOT NULL,
        address_2 VARCHAR(10) NOT NULL,
        city VARCHAR(20) NOT NULL
        state  VARCHAR(2) NOT NULL,
        zip VARCHAR(20) NOT NULL,
        client_id INT NOT NULL,
        billing_detail_id UUID NOT NULL,
        is_current BOOLEAN NOT NULL 
        is_active  BOOLEAN NOT NULL DEFAULT True,
        PRIMARY KEY(id),
        CONSTRAINT fk_billing_client
            FOREIGN KEY(client_id) 
                REFERENCES client(id)
    );

CREATE SCHEMA IF NOT EXISTS history
    CREATE TABLE IF NOT EXISTS purchase_history (
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

CREATE SCHEMA IF NOT EXISTS inventory
    CREATE TABLE IF NOT EXISTS products (
        id SERIAL NOT NULL,
        name VARCHAR(20) NOT NULL,
        description TEXT NOT NULL,
        price DECIMAL(2) NOT NULL,
        sku_number VARCHAR(20) UNIQUE NOT NULL,
        in_stock BOOLEAN NOT NULL 
        quantity INT NOT NULL,
        is_active  BOOLEAN NOT NULL DEFAULT True,
        PRIMARY KEY(id)
    )

    CREATE TABLE IF NOT EXISTS vendor (
        id SERIAL NOT NULL,
        name VARCHAR(50) NOT NULL,
        address VARCHAR(100) NOT NULL,
        address_2 VARCHAR(10),
        city VARCHAR(20) NOT NULL
        state  VARCHAR(2) NOT NULL,
        zip VARCHAR(20) NOT NULL,
        is_active  BOOLEAN NOT NULL DEFAULT True,
        PRIMARY KEY(id)
    )

    CREATE TABLE IF NOT EXISTS contact (
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
                REFERENCES vendor(id),
    );

CREATE SCHEMA IF NOT EXISTS invoice
    CREATE TABLE IF NOT EXISTS purchase (
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

CREATE SCHEMA IF NOT EXISTS shipping
    CREATE TABLE IF NOT EXISTS shipper (
        id SERIAL NOT NULL,
        name VARCHAR(30) NOT NULL,
        address VARCHAR(100) NOT NULL,
        address_2 VARCHAR(10),
        city VARCHAR(20) NOT NULL
        state  VARCHAR(2) NOT NULL,
        zip VARCHAR(20) NOT NULL,
        is_active  BOOLEAN NOT NULL DEFAULT True,
        PRIMARY KEY(id)
    )

    CREATE TABLE IF NOT EXISTS shipped (
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





    



