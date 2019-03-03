DROP PROCEDURE IF EXISTS getUserList;
DELIMITER //
-- ********************************************************************************************
-- getUserList ユーザー情報を取得
--
-- 【処理概要】
--  ユーザー情報を取得する
--
--
-- 【呼び出し元画面】
--   インデックス
--
-- 【引数】
--   _evnt_num           ：イベント番号
--   _key_word_1         ：キーワード１
--   _key_word_2         ：キーワード２
--   _key_word_3         ：キーワード３
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
CREATE PROCEDURE `getUserList`(
    IN `_evnt_num` VARCHAR(5)
    , IN `_key_word_1` VARCHAR(50)
    , IN `_key_word_2` VARCHAR(50)
    , IN `_key_word_3` VARCHAR(50)
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
        SELECT
    ");

    IF IFNULL(_evnt_num, '') = '' THEN
        SET @query = CONCAT(@query," DISTINCT ");
    END IF;

    SET @query = CONCAT(@query,"
            TU.USR_CD                  -- ユーザーコード
            ,TU.USR_ID                 -- ユーザーID
            ,TU.USR_NAME               -- ユーザー名
            ,TU.RH_FLG                 -- RHフラグ
            ,TU.BLD_TYP_CD             -- 血液型コード
            ,TU.ICN_URL                -- アイコンURL
            ,TJ.EVNT_CD                -- イベントコード
        FROM
            T_USR TU
        LEFT OUTER JOIN
            T_JN_EVNT TJ
        ON
            TU.USR_CD = TJ.USR_CD
    ");

    SET @event_num = "";

    IF IFNULL(_evnt_num, '') != '' THEN
        SET @event_num = CONCAT(" WHEN ");
        SET @event_num = CONCAT(@event_num,"'",_evnt_num,"'");
    END IF;

    SET @query_key = "";

    IF IFNULL(_key_word_1, '') != '' THEN
        IF IFNULL(_evnt_num, '') = '' THEN
            SET @query_key = CONCAT(@query_key," WHEN ");
        END IF;

        SET @query_key = CONCAT(@query_key," USR_NAME = ");
        SET @query_key = CONCAT(@query_key,"'",_key_word_1,"'");
    END IF;

    IF IFNULL(_key_word_2, '') != '' THEN
        SET @query_key = CONCAT(@query_key," OR USR_NAME = ");
        SET @query_key = CONCAT(@query_key,"'",_key_word_2,"'");
    END IF;

    IF IFNULL(_key_word_3, '') != '' THEN
        SET @query_key = CONCAT(@query_key," OR USR_NAME = ");
        SET @query_key = CONCAT(@query_key,"'",_key_word_3,"'");
    END IF;

    SET @group = "";

    IF IFNULL(_evnt_num, '') = '' THEN
        SET @group = CONCAT(@group,"
            GROUP BY
            TU.USR_CD                  -- ユーザーコード
            ,TU.USR_ID                 -- ユーザーID
            ,TU.USR_NAME               -- ユーザー名
            ,TU.RH_FLG                 -- RHフラグ
            ,TU.BLD_TYP_CD             -- 血液型コード
            ,TU.ICN_URL                -- アイコンURL
    ");
    END IF;

    SET @query_text = CONCAT(@query,@event_num,@query_key,@group,";");

    -- 実行
    PREPARE main_query FROM @query_text;
    EXECUTE main_query;
    DEALLOCATE PREPARE main_query;

    SET exit_cd = 0;

END
//
DELIMITER ;
