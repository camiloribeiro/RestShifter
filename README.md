# RestShifter (rest_shifter)

[![Gem Version](https://badge.fury.io/rb/rest_shifter.png)](https://rubygems.org/gems/rest_shifter)
[![Build Status](https://secure.travis-ci.org/camiloribeiro/RestShifter.png)](http://travis-ci.org/camiloribeiro/RestShifter)
[![endorse](https://api.coderwall.com/camiloribeiro/endorsecount.png)](https://coderwall.com/camiloribeiro)


                                  /
                       __       //      The rest api ShapeShifter!
                       -\= \=\ //       
                     --=_\=---//=--     This is a Sinatra app with no predefined routes. 
                   -_==/  \/ //\/--     This replaces mocks for integration level tests.
                    ==/   /O   O\==--   This can be used also to create tests for new feature
       _ _ _ _     /_/    \  ]  /--      before the dependent services are in place
      /\ ( (- \    /       ] ] ]==-     This can also be used for Rest prototipation
     (\ _\_\_\-\__/     \  (,_,)-- 
    (\_/                 \     \-        
    \/      /       (   ( \  ] /)         Some of the main features are:
    /      (         \   \_ \./ )          - Easy to define rest paths with custom routes
    (       \         \      )  \          - Easy to define rest paths with custom responses
    (       /\_ _ _ _ /---/ /\_  \         - Definition of response times and response codes
     \     / \     / ____/ /   \  \        - Suitable to any kind of tests that use Rest
      (   /   )   / /  /__ )   (  ) 
      (  )   / __/ '---`       / /
      \  /   \ \             _/ /     This is still under development, so do not use it.
      ] ]     )_\_         /__\/       
      /_\     ]___\                     
     (___)                     



The Idea
=======

Are you tired of integrating with services that does not exist yet? Or that are expensive to spin up? Or just want to know what happens whan that service times out or return a ugly error? So you should know RestShifter :)
As simples is always better, I've put here a ridiculously easy to run app with no natural behaviour. You just have to create declarative files and start this app.

ASCII art: http://www.chris.com/ascii/index.php?art=creatures/unicorns


Instructions
==========

Developing
----------
To develop `RestShifter`, you are going to need [Bundler][1] 

    $ git git@github.com:camiloribeiro/RestShifter.git
    $ cd RestShifter
    $ bundle install
    $ rake

The last step is launching the regression tests and all should be green.

If you have any problems, please let me know.

[1]: http://gembundler.com

Using
-----

The focus here is in simplicity.

Install rest_shifter

    $ gem install rest_shifter

Create the service (you can choose any name that have only letters and underline. It is required to start with a letter )

    $ rest_shifter -c hello_world

Start the service

    $ rest_shifter -s

Go to a browser and open the url: [http://localhost:4567/hello_world](http://localhost:4567/hello_world)

You should see the following JSON:

    { \hello_world\ : \Your service is working fine. :D\ }

To edit the service you just created, go to ~/.rest_shifter/flavors/hello_world.flavor 
The name of the file is the name that you used in the command -c (create).

The file looks like this:

    method_used                 = "get"
    path                        = "/hello_world"
    request_accept              = ""
    request_content_type        = ""
    response_sleep              = 0
    response_status             = "200"
    response_body               = "{ \"hello_world\" : \"Your service is working fine. :D\" }"
    response_content_type       = "application/json"

You basically change whatever you need to make it look like the expected or desired service. For example, replacint the path by "/clients", and restart rest_shifter, so you have the desired endpoint working as a rest api.

Whatever you change in the file will change in the service as soon as you restart it.

Enjoy

LICENSE
=======

Copyright 2015 - Camilo Ribeiro camilo@camiloribeiro.com

This file is part of RestShifter.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
