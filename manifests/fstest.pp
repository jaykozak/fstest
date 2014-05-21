class fstest {
  $temp_dir = 'C:\temp'
  $zip_file = 'cns.5.7.2.0-B2.win.zip'
  $script_file = 'test.bat'

  file { "${temp_dir}\${zip_file}" :
    ensure             => file,
    source             => "puppet:///modules/fstest/${zip_file}",
    source_permissions => 'ignore',
  }

  file { "${temp_dir}\${script_file}" :
    ensure             => file,
    source             => "puppet:///modules/fstest/${script_file}",
    source_permissions => 'ignore',
  }

  exec { "${temp_dir}\${script_file}" :
    subscribe   => File["${temp_dir}\${zip_file}"],
    refreshonly => true,
  }
}

