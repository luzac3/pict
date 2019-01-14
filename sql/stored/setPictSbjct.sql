DROP PROCEDURE IF EXISTS setPictSbjct;
DELIMITER //
-- ********************************************************************************************
-- setPictSbjct 写真の被写体を登録する
--
-- 【処理概要】
--  写真の被写体を登録する
--
--
-- 【呼び出し元画面】
--   インデックス
--
-- 【引数】
--   str           ：VALUES構文
--
--
-- 【戻り値】
--      exit_cd            : exit_cd
--      正常：0
--      異常：99
-- --------------------------------------------------------------------------------------------
-- 【更新履歴】
--  2019.1.14 大杉　新規作成
-- ********************************************************************************************
CREATE PROCEDURE `setPictSbjct`(
    IN `_str` VARCHAR(1000)
    , OUT `exit_cd` INTEGER
)
COMMENT '写真アップロード'

BEGIN

    -- 異常終了ハンドラ
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
        SELECT @sqlstate, @errno, @text;
        ROLLBACK;
        SET exit_cd = 99;
    END;

    SET @query = CONCAT("
        INSERT INTO T_SHTD_USR
        VALUES ",_str,";
    ")
    ;

    SET @query_text = @query;

    -- 実行
    PREPARE main_query FROM @query_text;
    EXECUTE main_query;
    DEALLOCATE PREPARE main_query;

    SET exit_cd = 0;

END
//
DELIMITER ;
