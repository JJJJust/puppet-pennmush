define pennmush::game (
  $gamedir                   = undef,
  $mud_name                  = undef,
  $port                      = undef,
  $ip_addr                   = undef,
  $use_dns                   = undef,
  $input_database            = undef,
  $output_database           = undef,
  $crash_database            = undef,
  $mail_database             = undef,
  $chat_database             = undef,
  $quick_compress            = undef,
  $compress_program          = undef,
  $uncompress_program        = undef,
  $compress_suffix           = undef,
  $player_start              = undef,
  $master_room               = undef,
  $base_room                 = undef,
  $ancestor_room             = undef,
  $ancestor_exit             = undef,
  $ancestor_thing            = undef,
  $ancestor_player           = undef,
  $default_home              = undef,
  $access_file               = undef,
  $names_file                = undef,
  $chunk_swap_file           = undef,
  $chunk_cache_memory        = undef,
  $chunk_migrate             = undef,
  $ssl_port                  = undef,
  $ssl_ip_addr               = undef,
  $ssl_private_key_file      = undef,
  $ssl_ca_file               = undef,
  $ssl_require_client_cert   = undef,
  $money_singular            = undef,
  $money_plural              = undef,
  $idle_timeout              = undef,
  $unconnected_idle_timeout  = undef,
  $keepalive_timeout         = undef,
  $max_logins                = undef,
  $max_guests                = undef,
  $starting_money            = undef,
  $paycheck                  = undef,
  $guest_paycheck            = undef,
  $max_pennies               = undef,
  $max_guest_pennies         = undef,
  $starting_quota            = undef,
  $player_queue_limit        = undef,
  $queue_chunk               = undef,
  $active_queue_chunk        = undef,
  $function_recursion_limit  = undef,
  $function_invocation_limit = undef,
  $call_limit                = undef,
  $queue_entry_cpu_time      = undef,
  $max_channels              = undef,
  $max_player_chans          = undef,
  $max_parents               = undef,
  $max_depth                 = undef,
  $max_global_fns            = undef,
  $chan_cost                 = undef,
  $whisper_loudness          = undef,
  $max_dbref                 = undef,
  $max_attrs_per_obj         = undef,
  $mail_limit                = undef,
  $kill_min_cost             = undef,
  $kill_default_cost         = undef,
  $kill_bonus                = undef,
  $find_cost                 = undef,
  $page_cost                 = undef,
  $quota_cost                = undef,
  $queue_cost                = undef,
  $queue_loss                = undef,
  $room_cost                 = undef,
  $object_cost               = undef,
  $link_cost                 = undef,
  $exit_cost                 = undef,
  $purge_interval            = undef,
  $dbck_interval             = undef,
  $warn_interval             = undef,
  $float_precision           = undef,
  $log_wipe_passwd           = undef,
  $player_name_len           = undef,
  $max_aliases               = undef,
  $use_quota                 = undef,
  $dump_interval             = undef,
  $forking_dump              = undef,
  $dump_warning_5min         = undef,
  $dump_warning_1min         = undef,
  $dump_message              = undef,
  $dump_complete             = undef,
  $connect_file              = undef,
  $motd_file                 = undef,
  $wizmotd_file              = undef,
  $quit_file                 = undef,
  $newuser_file              = undef,
  $down_file                 = undef,
  $register_create_file      = undef,
  $guest_file                = undef,
  $full_file                 = undef,
  $who_file                  = undef,
  $connect_html_file         = undef,
  $motd_html_file            = undef,
  $wizmotd_html_file         = undef,
  $quit_html_file            = undef,
  $newuser_html_file         = undef,
  $down_html_file            = undef,
  $register_create_html_file = undef,
  $guest_html_file           = undef,
  $full_html_file            = undef,
  $help_commands             = undef,
  $ahelp_commands            = undef,
  $who_html_file             = undef,
  $use_ident                 = undef,
  $ident_timeout             = undef,
  $error_log                 = undef,
  $connect_log               = undef,
  $wizard_log                = undef,
  $checkpt_log               = undef,
  $trace_log                 = undef,
  $command_log               = undef,
  $log_commands              = undef,
  $log_forces                = undef,
  $mem_check                 = undef,
  $pueblo                    = undef,
  $logins                    = undef,
  $guests                    = undef,
  $player_creation           = undef,
  $reverse_shs               = undef,
  $room_connects             = undef,
  $sql_platform              = undef,
  $sql_host                  = undef,
  $sql_database              = undef,
  $sql_username              = undef,
  $sql_password              = undef,
  $safer_ufun                = undef,
  $function_side_effects     = undef,
  $noisy_whisper             = undef,
  $possessive_get            = undef,
  $possessive_get_d          = undef,
  $really_safe               = undef,
  $zone_control_zmp_only     = undef,
  $destroy_possessions       = undef,
  $link_to_object            = undef,
  $owner_queues              = undef,
  $wiz_noaenter              = undef,
  $full_invis                = undef,
  $empty_attrs               = undef,
  $null_eq_zero              = undef,
  $tiny_booleans             = undef,
  $tiny_trim_fun             = undef,
  $tiny_math                 = undef,
  $silent_pemit              = undef,
  $adestroy                  = undef,
  $amail                     = undef,
  $player_listen             = undef,
  $player_ahear              = undef,
  $startups                  = undef,
  $read_remote_desc          = undef,
  $ansi_names                = undef,
  $comma_exit_list           = undef,
  $count_all                 = undef,
  $exits_connect_rooms       = undef,
  $wizwall_prefix            = undef,
  $rwall_prefix              = undef,
  $wall_prefix               = undef,
  $announce_connects         = undef,
  $player_name_spaces        = undef,
  $flags_on_examine          = undef,
  $ex_public_attribs         = undef,
  $blind_page                = undef,
  $page_aliases              = undef,
  $chat_strip_quote          = undef,
  $newline_one_char          = undef,
  $only_ascii_in_names       = undef,
  $exit_flags                = undef,
  $room_flags                = undef,
  $player_flags              = undef,
  $thing_flags               = undef,
  $channel_flags             = undef,
  $reserve_aliases           = undef,
  $command_aliases           = undef,
  $function_aliases          = undef,
  $attribute_aliases         = undef) {
  case $gamedir {
    undef   : { fail("pennmush::game[${title}]: \'gamedir\' must be set.") }
    default : { validate_absolute_path($gamedir) }
  }

  if $port {
    validate_integer($port, 65535, 1)
  }

  if $player_start {
    validate_integer($player_start, undef, 0)
  }

  if $base_room {
    validate_integer($base_room, undef, 0)
  }

  if $ancestor_room {
    validate_integer($ancestor_room, undef, -1)
  }

  if $ancestor_thing {
    validate_integer($ancestor_thing, undef, -1)
  }

  if $ancestor_player {
    validate_integer($ancestor_player, undef, -1)
  }

  if $default_home {
    validate_integer($default_home, undef, 0)
  }

  if $chunk_cache_memory {
    validate_integer($chunk_cache_memory, undef, 0)
  }

  if $ssl_port {
    validate_integer($ssl_port, 65535, 0)
  }

  if $max_logins {
    validate_integer($max_logins, undef, 0)
  }

  if $max_guests {
    validate_integer($max_guests, undef, -1)
  }

  if $starting_money {
    validate_integer($starting_money)
  }

  if $paycheck {
    validate_integer($paycheck)
  }

  if $guest_paycheck {
    validate_integer($guest_paycheck)
  }

  if $max_pennies {
    validate_integer($max_pennies)
  }

  if $max_guest_pennies {
    validate_integer($max_guest_pennies)
  }

  if $starting_quota {
    validate_integer($starting_quota)
  }

  if $player_queue_limit {
    validate_integer($player_queue_limit)
  }

  if $queue_chunk {
    validate_integer($queue_chunk)
  }

  if $active_queue_chunk {
    validate_integer($active_queue_chunk)
  }

  if $function_recursion_limit {
    validate_integer($function_recursion_limit)
  }

  if $function_invocation_limit {
    validate_integer($function_invocation_limit)
  }

  if $call_limit {
    validate_integer($call_limit)
  }

  if $queue_entry_cpu_time {
    validate_integer($queue_entry_cpu_time)
  }

  if $max_channels {
    validate_integer($max_channels)
  }

  if $max_player_chans {
    validate_integer($max_player_chans)
  }

  if $max_parents {
    validate_integer($max_parents)
  }

  if $max_depth {
    validate_integer($max_depth)
  }

  if $max_global_fns {
    validate_integer($max_global_fns)
  }

  if $chan_cost {
    validate_integer($chan_cost)
  }

  if $whisper_loudness {
    validate_integer($whisper_loudness, 100, 0)
  }

  if $max_dbref {
    validate_integer($max_dbref, undef, 0)
  }

  if $max_attrs_per_obj {
    validate_integer($max_attrs_per_obj)
  }

  if $mail_limit {
    validate_integer($mail_limit)
  }

  if $kill_min_cost {
    validate_integer($kill_min_cost)
  }

  if $kill_default_cost {
    validate_integer($kill_default_cost)
  }

  if $kill_bonus {
    validate_integer($kill_bonus)
  }

  if $find_cost {
    validate_integer($find_cost)
  }

  if $page_cost {
    validate_integer($page_cost)
  }

  if $quota_cost {
    validate_integer($quota_cost)
  }

  if $queue_cost {
    validate_integer($queue_cost)
  }

  if $queue_loss {
    validate_integer($queue_loss)
  }

  if $room_cost {
    validate_integer($room_cost)
  }

  if $object_cost {
    validate_integer($object_cost)
  }

  if $link_cost {
    validate_integer($link_cost)
  }

  if $float_precision {
    validate_integer($float_precision)
  }

  if $player_name_len {
    validate_integer($player_name_len)
  }

  if $max_aliases {
    validate_integer($max_aliases)
  }

  if ($port) and ($ssl_port) and ($port == $ssl_port) {
    fail("pennmush::game[${title}]: \'port\' and \'ssl_port\' must be different.")
  }

  if ($port == undef) and ($ssl_port == 4201) {
    fail("pennmush::game[${title}]: \'ssl_port\' can not be 4201 when \'port\' is undefined.")
  }

  file_line { 'restart_gamedir':
    path  => "${gamedir}/restart",
    match => '^GAMEDIR=',
    line  => "GAMEDIR=${gamedir}",
  }

  file { 'mush.cnf':
    path    => "${gamedir}/mush.cnf",
    ensure  => file,
    content => template('pennmush/mush.cnf.erb')
  }

  if $reserve_aliases or $command_aliases or $function_aliases or $attribute_aliases {
    file { 'alias_puppet.cnf':
      path    => "${gamedir}/alias_puppet.cnf",
      ensure  => file,
      content => template('pennmush/alias_puppet.cnf.erb')
    }
  } else {
    file { 'alias_puppet.cnf':
      path   => "${gamedir}/alias_puppet.cnf",
      ensure => absent
    }
  }
}
