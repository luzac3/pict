DROP PROCEDURE IF EXISTS downloadPict;
DELIMITER //
-- ********************************************************************************************
-- downloadPict 暗号化された画像データをアップロードする
--
-- 【処理概要】
--  イベントとユーザーの番号が存在するかチェックする
--
--
-- 【呼び出し元画面】
--   インデックス
--
-- 【引数】
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
CREATE PROCEDURE `downloadPict`(
    `exit_cd` INTEGER
)
COMMENT '写真取得処理'

BEGIN

    -- 異常終了ハンドラ
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SET exit_cd = 99;

    SELECT
        LPAD(hex(cast(REVERSE(LPAD((MAX(CAST(PCTR_NO AS SIGNED)) + 1),5,"0")) as signed)),5,"0") AS PCTR_CD
        ,NAME
        ,PCTR
        ,EC_KEY
        ,FAV_NUMBER
        ,DL_NUMBER
        ,TRK_DATE
    FROM
        T_PCTR_MSTR
    ;

END
//
DELIMITER ;
