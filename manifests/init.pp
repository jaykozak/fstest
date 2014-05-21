class fstest (
  $temp_dir = 'C:/temp',
  $zip_file = 'test.zip',
  $script_file = 'test.bat'
) {

  file { "${temp_dir}" :
    ensure => directory,
  }

  file { "${temp_dir}/${zip_file}" :
    ensure             => file,
    source             => "puppet:///modules/fstest/${zip_file}",
    source_permissions => 'ignore',
  }

  file { "${temp_dir}/${script_file}" :
    ensure             => file,
    source             => "puppet:///modules/fstest/${script_file}",
    source_permissions => 'ignore',
    before             => Exec["${temp_dir}/${script_file}"],
  }

  exec { "${temp_dir}/${script_file}" :
    subscribe   => File["${temp_dir}/${zip_file}"],
    refreshonly => true,
  }
}

