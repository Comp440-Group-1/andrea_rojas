-- ----------------------------
--  Procedure structure for insert_customer
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[insert_customer]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo1].[insert_customer]
GO
CREATE PROCEDURE [dbo1].[insert_customer] 
	-- Add the parameters for the stored procedure here
	@customer_id int,
	@first_name varchar(32),
	@last_name varchar(32),
	@email varchar(255)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

BEGIN TRANSACTION
BEGIN TRY
   
   INSERT INTO product
   VALUES (@customer_id, @first_name, @last_name, @email)

 COMMIT TRANSACTION
END TRY
BEGIN CATCH
    SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage
   
    ROLLBACK TRANSACTION
END CATCH
END

GO