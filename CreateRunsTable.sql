USE [slaythespire]
GO

/****** Object:  Table [dbo].[runs]    Script Date: 10/9/2022 9:53:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[runs](
	[neow_bonuses_skipped_log] [nvarchar](max) NULL,
	[neow_costs_skipped_log] [nvarchar](max) NULL,
	[gold_per_floor] [nvarchar](max) NULL,
	[floor_reached] [int] NULL,
	[playtime] [int] NULL,
	[items_purged] [nvarchar](max) NULL,
	[score] [int] NULL,
	[play_id] [nvarchar](72) NOT NULL,
	[local_time] [nchar](14) NULL,
	[falling_options_log] [nvarchar](max) NULL,
	[score_breakdown] [nvarchar](max) NULL,
	[is_ascension_mode] [bit] NULL,
	[campfire_choices] [nvarchar](max) NULL,
	[neow_cost] [nvarchar](200) NULL,
	[seed_source_timestamp] [nvarchar](32) NULL,
	[shop_contents] [nvarchar](max) NULL,
	[circlet_count] [int] NULL,
	[master_deck] [nvarchar](max) NULL,
	[potion_use_per_floor] [nvarchar](max) NULL,
	[relics] [nvarchar](max) NULL,
	[potions_floor_usage] [nvarchar](max) NULL,
	[damage_taken] [nvarchar](max) NULL,
	[seed_played] [nvarchar](max) NULL,
	[neow_bonus_log] [nvarchar](max) NULL,
	[potions_obtained] [nvarchar](max) NULL,
	[is_trial] [bit] NULL,
	[path_per_floor] [nvarchar](max) NULL,
	[character_chosen] [nvarchar](16) NULL,
	[items_purchased] [nvarchar](max) NULL,
	[campfire_rested] [smallint] NULL,
	[item_purchase_floors] [nvarchar](max) NULL,
	[current_hp_per_floor] [nvarchar](max) NULL,
	[gold] [int] NULL,
	[neow_bonus] [nvarchar](200) NULL,
	[is_prod] [bit] NULL,
	[is_daily] [bit] NULL,
	[rewards_skipped] [nvarchar](max) NULL,
	[chose_seed] [bit] NULL,
	[campfire_upgraded] [smallint] NULL,
	[win_rate] [smallint] NULL,
	[floor_exit_playtime] [nvarchar](max) NULL,
	[timestamp] [bigint] NULL,
	[blue_key_relic_skipped_log] [nvarchar](max) NULL,
	[path_taken] [nvarchar](max) NULL,
	[build_version] [date] NULL,
	[purchased_purges] [smallint] NULL,
	[victory] [bit] NULL,
	[max_hp_per_floor] [nvarchar](max) NULL,
	[relic_stats] [nvarchar](max) NULL,
	[card_choices] [nvarchar](max) NULL,
	[player_experience] [int] NULL,
	[relics_obtained] [nvarchar](max) NULL,
	[event_choices] [nvarchar](max) NULL,
	[is_beta] [bit] NULL,
	[boss_relics] [nvarchar](max) NULL,
	[items_purged_floors] [nvarchar](max) NULL,
	[is_endless] [bit] NULL,
	[potions_floor_spawned] [nvarchar](max) NULL,
	[killed_by] [nvarchar](200) NULL,
	[ascension_level] [smallint] NULL,
	[potion_discard_per_floor] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[play_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


