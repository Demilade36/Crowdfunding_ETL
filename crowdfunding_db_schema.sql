-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Draw CSV tables and establish the relationship
CREATE TABLE "Campaign" (
    "cf_id" INT   NOT NULL,
    "contact_id" INT   NOT NULL,
    "company_name" varchar(255)   NOT NULL,
    "description" varchar(500)   NOT NULL,
    "goal" Float   NOT NULL,
    "pledged" Float   NOT NULL,
    "outcome" varchar(255)   NOT NULL,
    "backers_count" INT   NOT NULL,
    "country" varchar(255)   NOT NULL,
    "currency" varchar(255)   NOT NULL,
    "launched_date" Date   NOT NULL,
    "end_date" Date   NOT NULL,
    "category_id" varchar(255)   NOT NULL,
    "subcategory_id" varchar(255)   NOT NULL,
    CONSTRAINT "pk_Campaign" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "Category" (
    "category_id" varchar(255)   NOT NULL,
    "category" varchar(255)   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "Subcategory" (
    "subcategory_id" varchar(255)   NOT NULL,
    "subcategory" varchar(255)   NOT NULL,
    CONSTRAINT "pk_Subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "Contacts" (
    "contact_id" INT   NOT NULL,
    "first_name" varchar(255)   NOT NULL,
    "last_name" varchar(255)   NOT NULL,
    "email" varchar(255)   NOT NULL
);

ALTER TABLE "Campaign" ADD CONSTRAINT "fk_Campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "Contacts" ("contact_id");

ALTER TABLE "Category" ADD CONSTRAINT "fk_Category_category_id" FOREIGN KEY("category_id")
REFERENCES "Campaign" ("category_id");

ALTER TABLE "Subcategory" ADD CONSTRAINT "fk_Subcategory_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "Campaign" ("subcategory_id");

