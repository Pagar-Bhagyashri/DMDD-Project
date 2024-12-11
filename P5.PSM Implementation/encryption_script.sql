use tms;

-- Column Encryption
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'TMS_Strong_Password_123';


CREATE CERTIFICATE TMSCertificate
WITH SUBJECT = 'TMS Customer Data Protection';


CREATE SYMMETRIC KEY TMSSymmetricKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE TMSCertificate;



-- Add encrypted column for customer email
ALTER TABLE Customer
ADD EncryptedEmail VARBINARY(256);



-- Update existing emails to encrypted format
OPEN SYMMETRIC KEY TMSSymmetricKey
DECRYPTION BY CERTIFICATE TMSCertificate;

UPDATE Customer
SET EncryptedEmail = EncryptByKey(Key_GUID('TMSSymmetricKey'), Email);


select * from customer;