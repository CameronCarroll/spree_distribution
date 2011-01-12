Spree Wholesale
---------------


Currently still under development! Check back soon for more details..

To get SpreeWholesale up and running on your spree store:

    cd your/spree/project
    git clone git://github.com/citrus/spree_wholesale.git
    echo "gem 'spree_wholesale', :path => './spree_wholesale'" >> Gemfile
    rake spree_wholesale:install
    rake db:migrate
    rake spree_wholesale:create_role

If you want to generate sample wholesale prices:

    rake spree_wholesale:assume_wholesale_prices

This will assume 66% wholesale mark off.


If you'd like run tests: (TO DO: Write some more tests)

    cd your/spree/project/spree_wholesale
    rake



License
-------

Copyright (c) 2011 Spencer Steffen, released under the New BSD License
All rights reserved.

>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

> Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

> Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation - and/or other materials provided with the distribution.

> Neither the name of the <ORGANIZATION> nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.