Use slaythespire
Go

EXEC sp_configure 'show advanced options', 1    -- To allow advanced options to be changed.
RECONFIGURE -- To update the currently configured value for advanced options.
EXEC sp_configure 'xp_cmdshell', 1  -- To enable the feature.
RECONFIGURE -- To update the currently configured value for this feature.

Declare @dir nchar(7) = 'dir /b '
Declare @i tinyint = 1
Declare @path nvarchar(200)
Declare @filepath nvarchar(200)
Declare @ors nvarchar(600)
Declare @mxrn int
Declare @fileName nvarchar(40)
Declare @sqlstring NVARCHAR(MAX)

Declare @allPaths table(idx int identity(1,1), paths nvarchar(200))
Insert into @allPaths(paths)
VALUES('R:\Emry\Documents\Baalor200\WATCHER\'),('R:\Emry\Documents\Baalor200\THE_SILENT\'),('R:\Emry\Documents\Baalor200\IRONCLAD\'),('R:\Emry\Documents\Baalor200\DEFECT\')

WHILE @i < 5
BEGIN

	IF OBJECT_ID('tempdb..#dir') is not null
		DROP TABLE #dir

	Select @path = paths From @allPaths Where idx = @i
	Declare @cmdexc nvarchar(200) = '"'+@dir+@path+'"'

	CREATE TABLE #dir(idx int identity(1,1), jsonFileName NVARCHAR(max));
	INSERT INTO #dir (jsonFileName)
	EXEC xp_cmdshell @cmdexc
	
	Declare @rn int = 1
	Select @mxrn = MAX(idx) FROM #dir

	WHILE @rn <= @mxrn
	Begin

		
		Set @fileName = (Select jsonFileName From #dir Where idx = @rn)
		Set @filepath = @path+@fileName
		Set @ors = 'FROM OPENROWSET(BULK ''' + @filepath + ''', SINGLE_CLOB) AS bk'
		Set @sqlstring =
			'
			Insert Into runs
			SELECT j.*
			'+@ors+'
			CROSS APPLY OPENJSON(BulkColumn)
			WITH(
				neow_bonuses_skipped_log nvarchar(max) AS JSON,
				neow_costs_skipped_log nvarchar(max) AS JSON,
				gold_per_floor nvarchar(max) AS JSON,
				floor_reached int,
				playtime int,
				items_purged nvarchar(max) AS JSON,
				score int,
				play_id nvarchar(72),
				local_time nchar(14),
				falling_options_log nvarchar(max) AS JSON,
				score_breakdown nvarchar(max) AS JSON,
				is_ascension_mode bit,
				campfire_choices nvarchar(max) AS JSON,
				neow_cost nvarchar(200),
				seed_source_timestamp nvarchar(32),
				shop_contents nvarchar(max) AS JSON,
				circlet_count int,
				master_deck nvarchar(max) AS JSON,
				potion_use_per_floor nvarchar(max) AS JSON,
				relics nvarchar(max) AS JSON,
				potions_floor_usage nvarchar(max) AS JSON,
				damage_taken nvarchar(max) AS JSON,
				seed_played nvarchar(max) AS JSON,
				neow_bonus_log nvarchar(max) AS JSON,
				potions_obtained nvarchar(max) AS JSON,
				is_trial bit,
				path_per_floor nvarchar(max) AS JSON,
				character_chosen nvarchar(16),
				items_purchased nvarchar(max) AS JSON,
				campfire_rested smallint,
				item_purchase_floors nvarchar(max) AS JSON,
				current_hp_per_floor nvarchar(max) AS JSON,
				gold int,
				neow_bonus nvarchar(200),
				is_prod bit,
				is_daily bit, 
				rewards_skipped nvarchar(max) AS JSON,
				chose_seed bit,
				campfire_upgraded smallint,
				win_rate smallint,
				floor_exit_playtime nvarchar(max) AS JSON,
				timestamp bigint,
				blue_key_relic_skipped_log nvarchar(max) AS JSON,
				path_taken nvarchar(max) AS JSON,
				build_version date,
				purchased_purges smallint,
				victory bit,
				max_hp_per_floor nvarchar(max) AS JSON,
				relic_stats nvarchar(max) AS JSON,
				card_choices nvarchar(max) AS JSON,
				player_experience int,
				relics_obtained nvarchar(max) AS JSON,
				event_choices nvarchar(max) AS JSON,
				is_beta bit,
				boss_relics nvarchar(max) AS JSON,
				items_purged_floors nvarchar(max) AS JSON,
				is_endless bit,
				potions_floor_spawned nvarchar(max) AS JSON,
				killed_by nvarchar(200),
				ascension_level smallint,
				potion_discard_per_floor nvarchar(max) AS JSON
				) as j
			Where not exists (select play_id From runs where play_id = j.play_id);'
		EXEC sp_executesql @sqlstring

		Set @rn = @rn + 1
	End

	Set @i = @i + 1

End;