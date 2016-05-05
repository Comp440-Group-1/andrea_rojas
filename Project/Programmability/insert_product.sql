-- ----------------------------
--  Procedure structure for insert_product
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[insert_product]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo1].[insert_product]
GO
CREATE PROCEDURE [dbo1].[insert_product] 
	-- Add the parameters for the stored procedure here
	@product_id int,
	@name varchar(64),
	@description varchar(255),
	@platform varchar(16)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

BEGIN TRANSACTION
BEGIN TRY
   
   INSERT INTO product
   VALUES (@product_id, @name, @description, @platform)

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
