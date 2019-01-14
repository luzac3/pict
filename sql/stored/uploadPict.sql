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
    IN `_evnt_num` VARCHAR(5)
    , IN `_ttl` VARCHAR(50)
    , IN `_sht` VARCHAR(5)
    , IN `_blob` VARCHAR(500)
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

    SET @date = NOW(3);

    INSERT INTO
        T_PCT
    SELECT
        _evnt_num           -- イベント通番
        ,LPAD(CAST(MAX(CAST(PCT_NO AS INTEGER)) + 1 AS CHAR),4,0)         -- 写真番号
        ,_ttl               -- タイトル
        ,_sht               -- 撮影者ユーザー番号
        ,_blob              -- 写真データ
        ,_key               -- 復号キー
        ,@date
        ,@date
    FROM
        T_PCT
    ;

    SELECT
        PCT_NO
    FROM
        T_PCT
    WHERE
        EVNT_NUM = _evnt_num
    AND
        TRK_NTJ = @date
    ;

    SET exit_cd = 0;

END
//
DELIMITER ;
