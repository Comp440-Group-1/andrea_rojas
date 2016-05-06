-- ----------------------------
--  Procedure structure for number_of_downloads
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[number_of_downloads]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo1].[number_of_downloads]
GO
CREATE PROCEDURE [dbo1].[number_of_downloads] 
	-- Add the parameters for the stored procedure here
	@release_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

BEGIN TRANSACTION
BEGIN TRY
    
	SELECT COUNT(release_id) AS number_of_downloads, release_id FROM download
	WHERE release_id = @release_id  
	GROUP BY release_id

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
