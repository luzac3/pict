DROP PROCEDURE IF EXISTS uploadPict;
DELIMITER //
-- ********************************************************************************************
-- uploadPict 暗号化された画像データをアップロードする
--
-- 【処理概要】
--  イベントとユーザーの番号が存在するかチェックする
--
--
-- 【呼び出し元画面】
--   インデックス
--
-- 【引数】
--   _name           ：名称
--   _blob           ：画像データ
--   _key            ：暗号化キー
--
--
-- 【戻り値】
--      exit_cd            : exit_cd
--      正常：0
--      異常：99
-- --------------------------------------------------------------------------------------------
-- 【更新履歴】
--  2018.6.05 大杉　新規作成
-- ********************************************************************************************
CREATE PROCEDURE `uploadPict`(
    IN `_name` VARCHAR(40)
    ,IN `_blob` VARCHAR(500)
    , IN `_key` VARCHAR(16)
    , IN `_ext` VARCHAR(5)
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

    INSERT INTO
        T_PCT
    SELECT
        "00000"
        ,LPAD(CAST(MAX(CAST(PCT_NO AS INTEGER)) + 1 AS CHAR),4,0)         -- 写真番号
        ,"00000"            -- 撮影者連番
        ,_blob              -- 写真データ
        ,_key               -- 複合キー
        ,NOW(3)
        ,NOW(3)
    FROM
        T_PCT
    ;
    
    SET exit_cd = 0;

END
//
DELIMITER ;
