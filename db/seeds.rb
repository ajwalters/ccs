# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


Content.create([
        {:name => "Call for <b>Speakers</b>!", :value => 'May 1st is rapidly approaching, don\'t miss your chance to be heard! <a href="/submissions/new">Submit your talk here!</a>', :category => "home", :sequence => 1},
        {:display => true, :sequence => 1, :name => "<b>.NET Rocks!</b> is coming to Chicago Code Camp!",
         :value => "<p>
We're honored to have the guys from the <b>.NET Rocks!</b> internet audio
talk show join us for a great day of fun and learning for developers
of all platforms.
</p>
<p>The <b>.NET Rocks!</b> crew is on a roadtrip throughout the nation and
will be stopping in Chicago, along with a mystery guest rockstar from
the Microsoft platform. We can't wait to learn who for ourselves!</p>
<p><a href='http://www.dotnetrocks.com/roadtrip.aspx'>The <b>.NET Rocks!</b> Visual Studio 2010 Road Trip</a></p>", :category => "home"},
        {:display => true, :name => "Call for <b>Volunteers</b>!", :value => 'Want to participate in the Chicago Code Camp 2 but without the pressure of presenting? We have plenty that needs to be done and need YOUR help. Sign up to volunteer <a href="/volunteers/new">here</a>', :category => "home", :sequence => 1},

        {:display => true, :name => 'What is a "Code Camp" anyway?', :value => '"<a href="http://www.thedevcommunity.org/codecamps/manifesto.aspx">The Code Camp Manifesto</a>" declares a simple idea to bring developers from disparate platforms and languages together into one software community.
<br />
<br />
<ul>
<li>By and For the Developer Community</li>
<li>Always Free</li>
<li>Community Developed Material</li>
<li>No Fluff only Code</li>
<li>Never occur during work hours</li>
</ul>', :category => "home", :sequence => 3},
        {:display => true, :name => "A grab-bag of technologies", :value => "Last year's event covered a broad spectrum of languages and technologies, from Python in the Cloud to Objective-C on the iPhone from AOP on .NET to Scala on the JVM, there was a session for every interest.", :category => "home", :sequence=> 4},
])


Configuration.create([
        {:key => "open_call_for_speakers", :value=>false},
        {:key => "open_call_for_volunteers", :value=>true},
])