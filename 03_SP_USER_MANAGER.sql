---------------- STORED PROCEDURES  -- PersonME --------------------

-- NOTA: Copie, pegue y ejecute este script en su gestor de bases de datos (preferiblemente SQL Server). 
-- Asegúrese de ajustar la sintaxis según sea necesario, sin modificar los valores de las columnas.

-------------- CREATION INFORMATION -------------------

-- CREATED BY: JHONATTAN HALCON CASALLAS FELIPE
-- PROJECT: USER_MANAGER
-- CREATION-DATE: 20/06/2025
-- DESCRPTION: Procedimientos almacenados responsables de gestionar el proceso CRUD para el control de usuarios básicos, brindando soporte a la ejecución del proyecto desarrollado en .NET 8.

------------------------------------------------------

CREATE PROCEDURE [UMA].[SP_GET_USERS]
AS
BEGIN
SELECT 
		USU.ID_USER AS IdUser,
		USU.NAME_USER AS NameUser,
		USU.BIRTH_DATE AS BirthDate,
		GEN.GENDER AS Gender,
		USU.ID_GENDER AS IdGender 
	FROM [UMA].[USERS] USU
	LEFT JOIN [UMA].[GENDER] GEN ON USU.ID_GENDER = GEN.ID_GENDER;
END
GO



CREATE PROCEDURE [UMA].[SP_GET_USER_BY_ID]
    @ID_USER INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM [UMA].[USERS] WHERE ID_USER = @ID_USER)
    BEGIN
        RAISERROR('No user was found with the specified User Id.', 16, 1);
        RETURN;
    END

    SELECT 
		USU.ID_USER AS IdUser,
        USU.NAME_USER AS NameUser,
		USU.BIRTH_DATE AS BirthDate,
        USU.ID_GENDER AS IdGender,
        GEN.GENDER AS Gender
    FROM [UMA].[USERS] USU
    LEFT JOIN [UMA].[GENDER] GEN ON USU.ID_GENDER = GEN.ID_GENDER
    WHERE USU.ID_USER = @ID_USER
END;



CREATE PROCEDURE [UMA].[SP_INSERT_USER]
	@NameUser NVARCHAR(100),
    @BirthDate DATE,
    @IdGender INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        IF @NameUser IS NULL OR LTRIM(RTRIM(@NameUser)) = ''
            OR @BirthDate IS NULL
			OR @IdGender IS NULL
        BEGIN
            RAISERROR('All required fields must be provided and cannot be empty.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

		IF NOT EXISTS (SELECT 1 FROM [UMA].[GENDER] WHERE ID_GENDER = @IdGender)
		BEGIN
			RAISERROR('Invalid gender selected.', 16, 1);
			ROLLBACK TRANSACTION;
			RETURN;
		END

        IF @BirthDate NOT BETWEEN DATEADD(YEAR, -95, CAST(GETDATE() AS DATE)) AND DATEADD(YEAR, -2, CAST(GETDATE() AS DATE))
        BEGIN
            RAISERROR('User must be between 2 and 95 years old.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        INSERT INTO [UMA].[USERS] (
            NAME_USER,
            BIRTH_DATE,
            ID_GENDER
        )
        VALUES (
            @NameUser,
            @BirthDate,
            @IdGender
        );


        DECLARE @NewUserId INT = SCOPE_IDENTITY();

        COMMIT TRANSACTION;

        SELECT @NewUserId AS ID_USER;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO


CREATE PROCEDURE [UMA].[SP_UPDATE_USER]
	@UserId INT,
	@NameUser NVARCHAR(100),
    @DateOfBirth DATE,
    @IdGender INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        IF @NameUser IS NULL OR LTRIM(RTRIM(@NameUser)) = ''
            OR @DateOfBirth IS NULL
			OR @IdGender IS NULL
        BEGIN
            RAISERROR('All required fields must be provided and cannot be empty.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        IF @DateOfBirth NOT BETWEEN DATEADD(YEAR, -95, CAST(GETDATE() AS DATE)) AND DATEADD(YEAR, -2, CAST(GETDATE() AS DATE))
        BEGIN
            RAISERROR('User must be between 2 and 95 years old.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

		UPDATE [UMA].[USERS]
		SET
			NAME_USER = @NameUser,
			BIRTH_DATE = @DateOfBirth,
			ID_GENDER = @IdGender
		WHERE ID_USER = @UserId;

        COMMIT TRANSACTION;

        SELECT @UserId AS ID_USER;

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO



CREATE PROCEDURE [UMA].[SP_DELETE_USER]
    @IdUser INT 
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;

    BEGIN TRY

        IF NOT EXISTS (SELECT 1 FROM [UMA].[USERS] WHERE ID_USER = @IdUser)
        BEGIN
            RAISERROR('No user found with the specified StudentId.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        DELETE FROM [UMA].[USERS] WHERE ID_USER = @IdUser;

        IF @@ROWCOUNT = 0
        BEGIN
            RAISERROR('Failed to delete the user. No records were removed.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        COMMIT TRANSACTION;
        
        SELECT 1 AS Status;

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
