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
    ,`_blob` BLOB(500)
    , IN `_key` VARCHAR(16)
    , OUT `exit_cd` INTEGER
)
COMMENT '写真許可判定'

BEGIN

    -- 異常終了ハンドラ
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SET exit_cd = 99;

    INSERT INTO
        T_PCTR_MSTR
    VALUES(
        PCTR_NO + 1
        ,_name
        ,null
        ,_blob
        ,_key
        ,0
        ,0
        ,NOW(3)
    )
    ;

END
//
DELIMITER ;
