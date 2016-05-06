-- ----------------------------
--  Procedure structure for update_product_version
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID('[dbo1].[update_product_version]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE [dbo1].[update_product_version]
GO
CREATE PROCEDURE [dbo1].[update_product_version]  @product_id INT 
	
AS	

DECLARE @VersionID INT,
 @VersionNumber INT
IF NOT EXISTS(
        SELECT
                *
        FROM
                [dbo1].[version]
        WHERE
                product_id = @product_id
)
BEGIN
        RAISERROR(
                'Product does not exist in table, cannot update version.',
                16,
                1
        ) ; RETURN ;
END
ELSE
        SELECT
                @VersionID = MAX(version_id) + 1
        FROM
                [dbo1].[version]
        GROUP BY
                version_id ; 
                SELECT
                        @VersionNumber = MAX(version_number) + 1
                FROM
                        [dbo1].[version]
                GROUP BY
                        product_id ;
                        INSERT INTO [dbo1].[version](
                                [version_id],
                                [product_id],
                                [version_number]
                               
                        )
                VALUES
                        (@VersionID, @product_id, @VersionNumber) ;
GO
