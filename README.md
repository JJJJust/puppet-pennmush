#pennmush

####Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup - The basics of getting started with pennmush](#setup)
    * [What pennmush affects](#what-pennmush-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with pennmush](#beginning-with-[Modulename])
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations-andsurprises)
6. [Development](#development)

##Overview

The pennmush module manages PennMUSH configuration and/or installation.

##Module Description

PennMUSH is a platform for creating a text-based online environment. This module provides the ability to control the configuration files for the server platform and, on certain operating systems, manage the server platform installation package.

####What pennmush affects

#####pennmush

* May assume control over PennMUSH packages.

#####pennmush::game

* Will replace the mush.cnf in `gamedir`.
* Will assume control of the GAMEDIR directive in the game restart script in `gamedir`.

###Setup requirements

`pennmush::game` depends on the Puppet `puppetlabs-stdlib` module version 4.2.0 or higher.

##Usage

##Reference

###Classes

* [`pennmush`](#pennmush-class): Controls PennMUSH installation.

###pennmush

####Parameters

#####`config_only`
If 'true', the module will maintain configuration files without attempting to ensure PennMUSH is installed. 'False' is only supported on Debian and throws a warning in other environments. Valid options: 'true', 'false'. Default: 'true'.

#####`mysql_support`
Controls whether the module will seek additional packages necessary for mysql support. Valid options: 'true', 'false'. Default: 'true'.

###Types

*[`pennmush::game`](#pennmushgame): Handles each MUSH's game configuration files.

####Parameters

You need only define variables which are listed below as "required or are different than the PennMUSH internal default values. For any variable not defined but expected in mush.cnf, the game server will throw a warning and use the internal default value.

#####`gamedir`
**Required.** Identifies the game directory for a particular MUSH instance. Valid options: An absolute path. Default: undefined.

#####`access_file`
Identifies the @sitelock file name. Corresponds with the mush.cnf 'access_file' directive. Default: undefined.

#####`active_queue_chunk`
Identifies the number of commands run from the queue when there is net activity. Corresponds with the mush.cnf 'active_queue_chunk' directive. Default: undefined.

#####`adestroy`
Toggles the adestroy attribute. If enabled, it is triggered when an object is nuked. Corresponds with the mush.cnf 'adestroy' directive. Expected value: 'yes' or 'no'. Default: undefined.

#####`ahelp_commands`
Identifies additional admin help commands and corresponding file locations. Corresponds with the mush.cnf 'ahelp_command' directive. Expected values: A hash - key: command; value: path relative to gamedir.
```puppet
	ahelp_commands => {'<command>' => '<path to file>'}
```

Default: undefined.

#####`amail`
Toggles the amail attribute. If enabled, it is triggered when an admin receives @mail. wheCorresponds with the mush.cnf 'amail' directive. Expected value: 'yes' or 'no'. Default: undefined.

#####`ancestor_exit`
Identifies the dbref which serves as the 'ultimate parent' to all exits not set ORPHAN. Corresponds with the mush.cnf 'ancestor_exit' directive. Valid options: An integer greater than or equal to -1. Default: undefined.

#####`ancestor_player`
Identifies the dbref which serves as the 'ultimate parent' to all players not set ORPHAN. Corresponds with the mush.cnf 'ancestor_player' directive. Valid options: An integer greater than or equal to -1. Default: undefined.

#####`ancestor_room`
Identifies the dbref which serves as the 'ultimate parent' to all rooms not set ORPHAN. Corresponds with the mush.cnf 'ancestor_room' directive. Valid options: An integer greater than or equal to -1. Default: undefined.

#####`ancestor_thing`
Identifies the dbref which serves as the 'ultimate parent' to all objects not set ORPHAN. Corresponds with the mush.cnf 'ancestor_thing' directive. Valid options: An integer greater than or equal to -1. Default: undefined.

#####`announce_connects`
Toggles whether player connections and disconnections are displayed in rooms and on channels. Corresponds with the mush.cnf 'announce_connects' directive. Expected value: 'yes' or 'no'. Default: undefined.

#####`ansi_names`
Toggles whether room, object, and player names are shown in bold to players set ANSI. Corresponds with the mush.cnf 'ansi_names' directive. Expected value: 'yes' or 'no'. Default: undefined.

#####`attribute_aliases`
Corresponds with the alias.cnf 'attribute_alias' directive. Expected values: A hash - key: attribute name; value: corresponding alias.
```puppet
	attribute_aliases => {'<attribute>' => '<alias>'}
```

Default: undefined.

#####`base_room`
Identifies the dbref of the base room. Any room that can reach the base room through exits is considered connected. Corresponds with the mush.cnf 'base_room' directive. Valid options: An integer greater than or equal to 0. Default: undefined.

#####`blind_page`
Toggles whether the page command uses page/blind (if yes) or page/list (if no) functionality. Corresponds with the mush.cnf 'blind_page' directive. Expected value: 'yes' or 'no'. Default: undefined.

#####`call_limit`
Identifies the maximum depth the parser will recurse for a single expression. Corresponds with the mush.cnf 'call_limit' directive. Valid options: Any integer. Default: undefined.

#####`chan_cost`
Identifies how much it costs a mortal to create a channel. Corresponds with the mush.cnf 'chan_cost' directive. Valid options: Any integer. Default: undefined.

#####`channel_flags`
Identifies the default flags for newly created channels. Corresponds with the mush.cnf 'channel_flags' directive. Expected values: An array of strings.
```puppet
	channel_flags => ['<flag 1>', '<flag 2>']
```

Default: undefined.

#####`chat_database`
Identifies the location of the chat database. Corresponds with the mush.cnf 'chat_database' directive. Expected value: A path relative to `gamedir`. Default: undefined.

#####`chat_strip_quote`
Toggles whether the initial quotation mark of certain chat commands is stripped. Corresponds with the mush.cnf 'chat_strip_quote' directive. Expected value: 'yes' or 'no'. Default: undefined.

#####`checkpt_log`
Identifies the file to which dump checkpoint messages are output. Corresponds with the mush.cnf 'checkpt_log' directive. Expected value: A path relative to `gamedir`. Default: undefined.

#####`chunk_cache_memory`
Corresponds with the mush.cnf 'chunk_cache_memory' directive. Default: undefined.

#####`chunk_migrate`
Corresponds with the mush.cnf 'chunk_migrate' directive. Default: undefined.

#####`chunk_swap_file`
Corresponds with the mush.cnf 'chunk_swap_file' directive. Default: undefined.

#####`comma_exit_list`
Corresponds with the mush.cnf 'comma_exit_list' directive. Default: undefined.

#####`command_aliases`
Corresponds with the alias.cnf 'command_alias' directive. Expected values: A hash - key: command name; value: corresponding command alias.
```puppet
	command_aliases => {'<command>' => '<alias>'}
```

Default: undefined.

#####`command_log`
Corresponds with the mush.cnf 'command_log' directive. Default: undefined.

#####`compress_program`
Corresponds with the mush.cnf 'compress_program' directive. Default: undefined.

#####`compress_suffix`
Corresponds with the mush.cnf 'compress_suffix' directive. Default: undefined.

#####`connect_file`
Corresponds with the mush.cnf 'connect_file' directive. Default: undefined.

#####`connect_html_file`
Corresponds with the mush.cnf 'connect_html_file' directive. Default: undefined.

#####`connect_log`
Corresponds with the mush.cnf 'connect_log' directive. Default: undefined.

#####`count_all`
Corresponds with the mush.cnf 'count_all' directive. Default: undefined.

#####`crash_database`
Corresponds with the mush.cnf 'crash_database' directive. Default: undefined.

#####`dbck_interval`
Corresponds with the mush.cnf 'dbck_interval' directive. Default: undefined.

#####`default_home`
Corresponds with the mush.cnf 'default_home' directive. Default: undefined.

#####`destroy_possessions`
Corresponds with the mush.cnf 'destroy_possessions' directive. Default: undefined.

#####`down_file`
Corresponds with the mush.cnf 'down_file' directive. Default: undefined.

#####`down_html_file`
Corresponds with the mush.cnf 'down_html_file' directive. Default: undefined.

#####`dump_complete`
Corresponds with the mush.cnf 'dump_complete' directive. Default: undefined.

#####`dump_interval`
Corresponds with the mush.cnf 'dump_interval' directive. Default: undefined.

#####`dump_message`
Corresponds with the mush.cnf 'dump_message' directive. Default: undefined.

#####`dump_warning_1min`
Corresponds with the mush.cnf 'dump_warning_1min' directive. Default: undefined.

#####`dump_warning_5min`
Corresponds with the mush.cnf 'dump_warning_5min' directive. Default: undefined.

#####`empty_attrs`
Corresponds with the mush.cnf 'empty_attrs' directive. Default: undefined.

#####`error_log`
Corresponds with the mush.cnf 'error_log' directive. Default: undefined.

#####`ex_public_attribs`
Corresponds with the mush.cnf 'ex_public_attribs' directive. Default: undefined.

#####`exit_cost`
Corresponds with the mush.cnf 'exit_cost' directive. Default: undefined.

#####`exit_flags`
Identifies the default flags for newly created exits. Corresponds with the mush.cnf 'exit_flags' directive. Expected values: An array of strings.
```puppet
	exit_flags => ['<flag 1>', '<flag 2>']
```

Default: undefined.

#####`exits_connect_rooms`
Corresponds with the mush.cnf 'exits_connect_rooms' directive. Default: undefined.

#####`find_cost`
Corresponds with the mush.cnf 'find_cost' directive. Default: undefined.

#####`flags_on_examine`
Corresponds with the mush.cnf 'flags_on_examine' directive. Default: undefined.

#####`float_precision`
Corresponds with the mush.cnf 'float_precision' directive. Default: undefined.

#####`forking_dump`
Corresponds with the mush.cnf 'forking_dump' directive. Default: undefined.

#####`full_file`
Corresponds with the mush.cnf 'full_file' directive. Default: undefined.

#####`full_html_file`
Corresponds with the mush.cnf 'full_html_file' directive. Default: undefined.

#####`full_invis`
Corresponds with the mush.cnf 'full_invis' directive. Default: undefined.

#####`function_aliases`
Corresponds with the alias.cnf 'function_aliases' directive. Expected values: A hash - key: function name; value: function alias.
```puppet
	function_aliases => {'<function>' => '<alias>'}
```

Default: undefined.

#####`function_invocation_limit`
Corresponds with the mush.cnf 'function_invocation_limit' directive. Default: undefined.

#####`function_recursion_limit`
Corresponds with the mush.cnf 'function_recursion_limit' directive. Default: undefined.

#####`function_side_effects`
Corresponds with the mush.cnf 'function_side_effects' directive. Default: undefined.

#####`guest_file`
Corresponds with the mush.cnf 'guest_file' directive. Default: undefined.

#####`guest_html_file`
Corresponds with the mush.cnf 'guest_html_file' directive. Default: undefined.

#####`guest_paycheck`
Corresponds with the mush.cnf 'guest_paycheck' directive. Default: undefined.

#####`guests`
Corresponds with the mush.cnf 'guests' directive. Default: undefined.

#####`help_commands`
Identifies additional help commands and corresponding file locations. Corresponds with the mush.cnf 'help_command' directive. Expected values: A hash - key: command; value: path relative to gamedir.
```puppet
	help_commands => {'<command>' => '<path to file>'}
```

Default: undefined.
#####`ident_timeout`
Corresponds with the mush.cnf 'ident_timeout' directive. Default: undefined.

#####`idle_timeout`
Corresponds with the mush.cnf 'idle_timeout' directive. Default: undefined.

#####`input_database`
Corresponds with the mush.cnf 'input_database' directive. Default: undefined.

#####`ip_addr`
Corresponds with the mush.cnf 'ip_addr' directive. Default: undefined.

#####`keepalive_timeout`
Corresponds with the mush.cnf 'keepalive_timeout' directive. Default: undefined.

#####`kill_bonus`
Corresponds with the mush.cnf 'kill_bonus' directive. Default: undefined.

#####`kill_default_cost`
Corresponds with the mush.cnf 'kill_default_cost' directive. Default: undefined.

#####`kill_min_cost`
Corresponds with the mush.cnf 'kill_min_cost' directive. Default: undefined.

#####`link_cost`
Corresponds with the mush.cnf 'link_cost' directive. Default: undefined.

#####`link_to_object`
Corresponds with the mush.cnf 'link_to_object' directive. Default: undefined.

#####`log_commands`
Corresponds with the mush.cnf 'log_commands' directive. Default: undefined.

#####`log_forces`
Corresponds with the mush.cnf 'log_forces' directive. Default: undefined.

#####`log_wipe_passwd`
Corresponds with the mush.cnf 'log_wipe_passwd' directive. Default: undefined.

#####`logins`
Corresponds with the mush.cnf 'logins' directive. Default: undefined.

#####`mail_database`
Corresponds with the mush.cnf 'mail_database' directive. Default: undefined.

#####`mail_limit`
Corresponds with the mush.cnf 'mail_limit' directive. Default: undefined.

#####`master_room`
Corresponds with the mush.cnf 'master_room' directive. Default: undefined.

#####`max_aliases`
Corresponds with the mush.cnf 'max_aliases' directive. Default: undefined.

#####`max_attrs_per_obj`
Corresponds with the mush.cnf 'max_attrs_per_obj' directive. Default: undefined.

#####`max_channels`
Corresponds with the mush.cnf 'max_channels' directive. Default: undefined.

#####`max_dbref`
Corresponds with the mush.cnf 'max_dbref' directive. Default: undefined.

#####`max_depth`
Corresponds with the mush.cnf 'max_depth' directive. Default: undefined.

#####`max_global_fns`
Corresponds with the mush.cnf 'max_global_fns' directive. Default: undefined.

#####`max_guest_pennies`
Corresponds with the mush.cnf 'max_guest_pennies' directive. Default: undefined.

#####`max_guests`
Corresponds with the mush.cnf 'max_guests' directive. Default: undefined.

#####`max_logins`
Corresponds with the mush.cnf 'max_logins' directive. Default: undefined.

#####`max_parents`
Corresponds with the mush.cnf 'max_parents' directive. Default: undefined.

#####`max_pennies`
Corresponds with the mush.cnf 'max_pennies' directive. Default: undefined.

#####`max_player_chans`
Corresponds with the mush.cnf 'max_player_chans' directive. Default: undefined.

#####`mem_check`
Corresponds with the mush.cnf 'mem_check' directive. Default: undefined.

#####`money_plural`
Corresponds with the mush.cnf 'money_plural' directive. Default: undefined.

#####`money_singular`
Corresponds with the mush.cnf 'money_singular' directive. Default: undefined.

#####`motd_file`
Corresponds with the mush.cnf 'motd_file' directive. Default: undefined.

#####`motd_html_file`
Corresponds with the mush.cnf 'motd_html_file' directive. Default: undefined.

#####`mud_name`
Corresponds with the mush.cnf 'mud_name' directive. Default: undefined.

#####`names_file`
Corresponds with the mush.cnf 'names_file' directive. Default: undefined.

#####`newline_one_char`
Corresponds with the mush.cnf 'newline_one_char' directive. Default: undefined.

#####`newuser_file`
Corresponds with the mush.cnf 'newuser_file' directive. Default: undefined.

#####`newuser_html_file`
Corresponds with the mush.cnf 'newuser_html_file' directive. Default: undefined.

#####`noisy_whisper`
Corresponds with the mush.cnf 'noisy_whisper' directive. Default: undefined.

#####`null_eq_zero`
Corresponds with the mush.cnf 'null_eq_zero' directive. Default: undefined.

#####`object_cost`
Corresponds with the mush.cnf 'object_cost' directive. Default: undefined.

#####`only_ascii_in_names`
Corresponds with the mush.cnf 'only_ascii_in_names' directive. Default: undefined.

#####`output_database`
Corresponds with the mush.cnf 'output_database' directive. Default: undefined.

#####`owner_queues`
Corresponds with the mush.cnf 'owner_queues' directive. Default: undefined.

#####`page_aliases`
Corresponds with the mush.cnf 'page_aliases' directive. Default: undefined.

#####`page_cost`
Corresponds with the mush.cnf 'page_cost' directive. Default: undefined.

#####`paycheck`
Corresponds with the mush.cnf 'paycheck' directive. Default: undefined.

#####`player_ahear`
Corresponds with the mush.cnf 'player_ahear' directive. Default: undefined.

#####`player_creation`
Corresponds with the mush.cnf 'player_creation' directive. Default: undefined.

#####`player_flags`
Identifies the default flags for newly created players. Corresponds with the mush.cnf 'player_flags' directive. Expected values: An array of strings.
```puppet
	player_flags => ['<flag 1>', '<flag 2>']
```

Default: undefined.

#####`player_listen`
Corresponds with the mush.cnf 'player_listen' directive. Default: undefined.

#####`player_name_len`
Corresponds with the mush.cnf 'player_name_len' directive. Default: undefined.

#####`player_name_spaces`
Corresponds with the mush.cnf 'player_name_spaces' directive. Default: undefined.

#####`player_queue_limit`
Corresponds with the mush.cnf 'player_queue_limit' directive. Default: undefined.

#####`player_start`
Corresponds with the mush.cnf 'player_start' directive. Default: undefined.

#####`port`
Corresponds with the mush.cnf 'port' directive. Default: undefined.

#####`possessive_get`
Corresponds with the mush.cnf 'possessive_get' directive. Default: undefined.

#####`possessive_get_d`
Corresponds with the mush.cnf 'possessive_get_d' directive. Default: undefined.

#####`pueblo`
Corresponds with the mush.cnf 'pueblo' directive. Default: undefined.

#####`purge_interval`
Corresponds with the mush.cnf 'purge_interval' directive. Default: undefined.

#####`queue_chunk`
Corresponds with the mush.cnf 'queue_chunk' directive. Default: undefined.

#####`queue_cost`
Corresponds with the mush.cnf 'queue_cost' directive. Default: undefined.

#####`queue_entry_cpu_time`
Corresponds with the mush.cnf 'queue_entry_cpu_time' directive. Default: undefined.

#####`queue_loss`
Corresponds with the mush.cnf 'queue_loss' directive. Default: undefined.

#####`quick_compress`
Corresponds with the mush.cnf 'quick_compress' directive. Default: undefined.

#####`quit_file`
Corresponds with the mush.cnf 'quit_file' directive. Default: undefined.

#####`quit_html_file`
Corresponds with the mush.cnf 'quit_html_file' directive. Default: undefined.

#####`quota_cost`
Corresponds with the mush.cnf 'quota_cost' directive. Default: undefined.

#####`read_remote_desc`
Corresponds with the mush.cnf 'read_remote_desc' directive. Default: undefined.

#####`really_safe`
Corresponds with the mush.cnf 'really_safe' directive. Default: undefined.

#####`register_create_file`
Corresponds with the mush.cnf 'register_create_file' directive. Default: undefined.

#####`register_create_html_file`
Corresponds with the mush.cnf 'register_create_html_file' directive. Default: undefined.

#####`reserve_aliases`
Corresponds with the alias.cnf 'reserve_alias' directive. Expected values: An array of strings.
```puppet
	reserve_aliases => ['<alias 1>', '<alias 1>']
```

Default: undefined.

#####`reverse_shs`
Corresponds with the mush.cnf 'reverse_shs' directive. Default: undefined.

#####`room_connects`
Corresponds with the mush.cnf 'room_connects' directive. Default: undefined.

#####`room_cost`
Corresponds with the mush.cnf 'room_cost' directive. Default: undefined.

#####`room_flags`
Identifies the default flags for newly created rooms. Corresponds with the mush.cnf 'room_flags' directive. Expected values: An array of strings.
```puppet
	room_flags => ['<flag 1>', '<flag 2>']
```

Default: undefined.

#####`rwall_prefix`
Corresponds with the mush.cnf 'rwall_prefix' directive. Default: undefined.

#####`safer_ufun`
Corresponds with the mush.cnf 'safer_ufun' directive. Default: undefined.

#####`silent_pemit`
Corresponds with the mush.cnf 'silent_pemit' directive. Default: undefined.

#####`sql_database`
Corresponds with the mush.cnf 'sql_database' directive. Default: undefined.

#####`sql_host`
Corresponds with the mush.cnf 'sql_host' directive. Default: undefined.

#####`sql_password`
Corresponds with the mush.cnf 'sql_password' directive. Default: undefined.

#####`sql_platform`
Corresponds with the mush.cnf 'sql_platform' directive. Default: undefined.

#####`sql_username`
Corresponds with the mush.cnf 'sql_username' directive. Default: undefined.

#####`ssl_ca_file`
Corresponds with the mush.cnf 'ssl_ca_file' directive. Default: undefined.

#####`ssl_ip_addr`
Corresponds with the mush.cnf 'ssl_ip_addr' directive. Default: undefined.

#####`ssl_port`
Corresponds with the mush.cnf 'ssl_port' directive. Default: undefined.

#####`ssl_private_key_file`
Corresponds with the mush.cnf 'ssl_private_key_file' directive. Default: undefined.

#####`ssl_require_client_cert`
Corresponds with the mush.cnf 'ssl_require_client_cert' directive. Default: undefined.

#####`starting_money`
Corresponds with the mush.cnf 'starting_money' directive. Default: undefined.

#####`starting_quota`
Corresponds with the mush.cnf 'starting_quota' directive. Default: undefined.

#####`startups`
Corresponds with the mush.cnf 'startups' directive. Default: undefined.

#####`thing_flags`
Identifies the default flags for newly created objects. Corresponds with the mush.cnf 'thing_flags' directive. Expected values: An array of strings.
```puppet
	thing_flags => ['<flag 1>', '<flag 2>']
```

Default: undefined.

#####`tiny_booleans`
Corresponds with the mush.cnf 'tiny_booleans' directive. Default: undefined.

#####`tiny_math`
Corresponds with the mush.cnf 'tiny_math' directive. Default: undefined.

#####`tiny_trim_fun`
Corresponds with the mush.cnf 'tiny_trim_fun' directive. Default: undefined.

#####`trace_log`
Corresponds with the mush.cnf 'trace_log' directive. Default: undefined.

#####`uncompress_program`
Corresponds with the mush.cnf 'uncompress_program' directive. Default: undefined.

#####`unconnected_idle_timeout`
Corresponds with the mush.cnf 'unconnected_idle_timeout' directive. Default: undefined.

#####`use_dns`
Corresponds with the mush.cnf 'use_dns' directive. Default: undefined.

#####`use_ident`
Corresponds with the mush.cnf 'use_ident' directive. Default: undefined.

#####`use_quota`
Corresponds with the mush.cnf 'use_quota' directive. Default: undefined.

#####`wall_prefix`
Corresponds with the mush.cnf 'wall_prefix' directive. Default: undefined.

#####`warn_interval`
Corresponds with the mush.cnf 'warn_interval' directive. Default: undefined.

#####`whisper_loudness`
Corresponds with the mush.cnf 'whisper_loudness' directive. Default: undefined.

#####`who_file`
Corresponds with the mush.cnf 'who_file' directive. Default: undefined.

#####`who_html_file`
Corresponds with the mush.cnf 'who_html_file' directive. Default: undefined.

#####`wiz_noaenter`
Corresponds with the mush.cnf 'wiz_noaenter' directive. Default: undefined.

#####`wizard_log`
Corresponds with the mush.cnf 'wizard_log' directive. Default: undefined.

#####`wizmotd_file`
Corresponds with the mush.cnf 'wizmotd_file' directive. Default: undefined.

#####`wizmotd_html_file`
Corresponds with the mush.cnf 'wizmotd_html_file' directive. Default: undefined.

#####`wizwall_prefix`
Corresponds with the mush.cnf 'wizwall_prefix' directive. Default: undefined.



##Limitations and Surprises

* Package installation is only supported on Debian.
* Puppet-controllable configuration directives are those valid in PennMUSH 1.8.2p8. Universal support through an additional configuration file is forthcoming.
* While pennmush can maintain configuration files, it can not currently restart a running MUSH to apply changes.
* While this module does perform sanity checking of some entries, it may not stop you from entering invalid or blank data. An invalid or blank entry can cause PennMUSH to silently fail.

##Development

Development for this module is coordinated on GitHub at https://github.com/JJJJust/puppet-pennmush.
