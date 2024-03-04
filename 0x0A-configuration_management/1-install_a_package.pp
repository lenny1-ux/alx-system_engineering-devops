#!/usr/bin/pup
# Install a specific version of flask (2.1.0)
package {'flask':
  ensure   => '3.0.1',
  provider => 'pip3'
}
