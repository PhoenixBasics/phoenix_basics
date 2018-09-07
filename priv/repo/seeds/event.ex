defmodule Basics.Seeds.Schedule.Event do
  @moduledoc false

  import Ecto.Query
  alias Basics.Repo
  alias Basics.Schedule.Audience
  alias Basics.Schedule.Category
  alias Basics.Schedule.Location
  alias Basics.Schedule.TimeSlot
  alias Basics.Schedule.Speaker
  alias Basics.Schedule.Event

  def perform do
    %{
      audiences: fetch_schemas_by_slug(Audience),
      categories: fetch_schemas_by_slug(Category),
      locations: fetch_all_by_slug(Location),
      slots: fetch_all_by_slug(TimeSlot),
      speakers: fetch_schemas_by_slug(Speaker)
    }
    |> data()
    |> Enum.each(fn attrs ->
      IO.inspect attrs
      %Event{}
      |> Event.changeset(attrs)
      |> Repo.insert!()
    end)
  end

  def data(relations) do
    [
#       %{
#         is_talk: true,
#         slug: "slot_3_jose_valim",
#         title: "Keynote",
#         time_slot_id: relations[:slots]["slot_3"],
#         speakers: [relations[:speakers]["jose_valim"]],
#         categories: [relations[:categories]["keynote"]],
#         audiences: [relations[:audiences]["general"]],
#         location_id: relations[:locations]["grand_ballroom"],
#         description: ""
#       },
#       %{
#         is_talk: true,
#         slug: "slot_5_lance_halvorsen",
#         title: "Elixir at a Walking Pace",
#         time_slot_id: relations[:slots]["slot_5"],
#         speakers: [relations[:speakers]["lance_halvorsen"]],
#         categories: [relations[:categories]["production"]],
#         audiences: [relations[:audiences]["intermediate"]],
#         location_id: relations[:locations]["grand_ballroom"],
#         description:
#           "<p>Many of us are initially attracted to Elixir because of its performance and fault tolerance. Make no mistake, these are stellar, but there are times when they are not the most critical requirements for our applications.</p>\n
#   <p>We’re going to take a look at a warehouse management system, originally written as part of a Rails monolith, for which data consistency and message ordering matter more.</p>\n
#   <p>That original system was deployed with Puma, forking multiple OS level processes on multiple nodes to gain parallel execution. That greatly increased the potential for multiple representations of an item in the system at any given moment. The result was an increase in stale data errors and inconsistent state.</p>\n
#   <p>As we rebuilt the system in Elixir, we turned these problems inside out. Stateful BEAM processes and their mailboxes allowed us to ensure that there would only be a single representation of each item in the system as well as order the messages each process receives. Throughout this talk, we’ll see how we accomplished this. We’ll also see how we handled some issues associated with this approach, like the cold start problem and keeping memory usage in check.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_5_anna_neyzberg",
#         title: "Exchange of Crypto Coins",
#         time_slot_id: relations[:slots]["slot_5"],
#         speakers: [relations[:speakers]["anna_neyzberg"]],
#         categories: [relations[:categories]["blockchain"]],
#         audiences: [relations[:audiences]["beginner"]],
#         location_id: relations[:locations]["evergreen_ab"],
#         description:
#           "<p>We know that OTP is an important part of the elixir ecosystem. But why is it important and how does it work? How do we leverage OTP appropriately to build highly concurrent systems at scale. We will walk through the why and the how by building a crypto-currency exchange, and then adding load to the exchange to see OTP at work.</p>\n
# <p>This talk will also provide context about crypto-currency and how the protocol is implemented - so that the audience has appropriate context for understanding building an exchange.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_5_luke_imhoff",
#         title:
#           "You Can Never Debug the Code You Run, But You Can View the Code the Debugger is Running",
#         time_slot_id: relations[:slots]["slot_5"],
#         speakers: [relations[:speakers]["luke_imhoff"]],
#         categories: [relations[:categories]["elixir"]],
#         audiences: [relations[:audiences]["advanced"]],
#         location_id: relations[:locations]["evergreen_e"],
#         description:
#           "<p>Elixir supports various ways to debug code: printing with `IO.inspect`, prying with `IEx.pry`, or using more advanced OTP tools like `:debugger` and `:int`. Choosing when to use these different tools can be confusing, and understanding how they work can prove downright intimidating.</p>\n
# <p>Throughout this talk we'll peel back the covers on the more advanced debugging techniques and dissect exactly how each debugging tool can be used to examine our compiled code. None of debugging techniques leave your code the same as how it was running in production. Adding `IO` and `IEx.pry` calls obviously changes the code as you edit the source, but using the OTP debugger, either with `:debugger`, IntelliJ Elixir, or Elixir Language Server, or by adding new `break` points from the `IEx.pry` shell changes the module code being run.</p>\n
# <p>Luke Imhoff will show how each type of debugging changes the code by revealing how `IEx.pry` and `:debugger` are implemented. You'll see why sometimes the debuggers can't reproduce bugs because the modifications to make the code debuggable also subtly changes the execution of the code by looking at changes to the bytecode and AST. Although the modified code never exists as source, we can recover the Abstract Syntax Tree (AST) of either the Elixir quoted form or the Erlang Abstract Code from the Dbgi chunk, but the Dbgi chunk ASTs aren't terribly easy to read, so we can use tools to decompile the code and translate it to Elixir or Erlang modules.</p>\n
# <p>When looking at Dgbi code isn't enough, we can drop down to the Code chunk and look at the bytecode. The bytecode is a unique binary format, so once again we reach for for tools to render it, so instead of having to read machine code, we can read assembly. Looking at this bytecode also allows us to check if our high-level optimizations, such as module attribute reuse, compute variables once, and the order of pattern matching, have an impact on the code run by the VM, as unlike Dbgi, the Code chunk is actually loaded by the VM when running code without debugging.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_6_bailey_miller",
#         title: "UX Design Practices for Real Time Apps",
#         time_slot_id: relations[:slots]["slot_6"],
#         speakers: [relations[:speakers]["bailey_miller"], relations[:speakers]["tim_mecklem"]],
#         categories: [relations[:categories]["phoenix"]],
#         audiences: [relations[:audiences]["general"]],
#         location_id: relations[:locations]["grand_ballroom"],
#         description:
#           "<p>Elixir and Phoenix have unlocked a new world of responsiveness in our applications. Gone are the days of mashing the refresh button to see updates to data that frequently changes. You can send near real-time updates to every user on your site about every change that happens, but should you?</p>\n
# <p>We’ll share some of the design questions we’ve learned to consider when deciding how and when to notify users of changes. When the session ends, you’ll have some design tools from real-world examples to ensure your users aren’t drinking from a firehose of updates or making decisions from stale data.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_6_fahad_almusharraf",
#         title: "Beyond Command and Response Chatbot",
#         time_slot_id: relations[:slots]["slot_6"],
#         speakers: [relations[:speakers]["fahad_almusharraf"]],
#         categories: [relations[:categories]["bots"]],
#         audiences: [relations[:audiences]["general"]],
#         location_id: relations[:locations]["evergreen_ab"],
#         description:
#           "<p>Elixir and Phoenix have unlocked a new world of responsiveness in our applications. Gone are the days of mashing the refresh button to see updates to data that frequently changes. You can send near real-time updates to every user on your site about every change that happens, but should you?</p>\n
# <p>We’ll share some of the design questions we’ve learned to consider when deciding how and when to notify users of changes. When the session ends, you’ll have some design tools from real-world examples to ensure your users aren’t drinking from a firehose of updates or making decisions from stale data.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_6_manu_ajith",
#         title: "Building a Distributed, Parallel ETL Pipeline Using GenStage, Flow, Mnesia",
#         time_slot_id: relations[:slots]["slot_6"],
#         speakers: [relations[:speakers]["manu_ajith"]],
#         categories: [relations[:categories]["genstage"]],
#         audiences: [relations[:audiences]["beginner"]],
#         location_id: relations[:locations]["evergreen_e"],
#         description:
#           "<p>The will be about a tale of building a data segregation system built using GenStage, Flow, and Mnesia.</p>\n
# <p>We will explore how we used GenStage for various pipelines to feed the data into the system, and ran some computation on it in parallel using Elixir Flow, and how we leveraged Mnesia's fast and distributed nodes and clustering capabilities to make the data available for each step in the flow, and finally writing the segregated result back to a PostgreSQL database.</p>\n
# <p>We will also cover some of the mistakes made, lessons learned while working with Mnesia, and how we recovered from Mnesia crashes and other pitfalls.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_8_aaron_renner",
#         title: "Growing Applications and Taming Complexity",
#         time_slot_id: relations[:slots]["slot_8"],
#         speakers: [relations[:speakers]["aaron_renner"]],
#         categories: [relations[:categories]["phoenix"]],
#         audiences: [relations[:audiences]["beginner"]],
#         location_id: relations[:locations]["grand_ballroom"],
#         description:
#           "<p>Growing an application is hard. We started our app with the best of intentions and promised ourselves we were going to \"design it right\". However as the app grew, complexity increased, dependencies piled up, and changes that were once small now felt like slogging through mud.</p>\n
# <p>Driven by the need to keep our sanity, we decided to apply ideas from Phoenix’s contexts and Domain Driven Design with the hope that we could put boundaries around the complex parts of our system and keep the code from turning into a tangled rat’s nest. This talk covers many of the lessons we learned along the way, including:</p>\n
# <ul>
#   <li>How to start tackling complexity by teasing apart the app into multiple layers.</li>
#   <li>How to simplify testing and reduce mental burden by defining contracts between these layers.</li>
#   <li>How to verify contracts using tools like dialyzer, automated tests and mocks.</li>
#   <li>How to document these contracts and use them to guide the application design.</li>
# </ul>
# <p>After applying these ideas to our codebase for almost a year, we’re eager to share our experiences and provide strategies you can use to tame complexity in your own applications.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_8_justus_eapen",
#         title: "Meet Virtuoso: The Chatbot Orchestration Framework Built with Elixir",
#         time_slot_id: relations[:slots]["slot_8"],
#         speakers: [relations[:speakers]["justus_eapen"]],
#         categories: [relations[:categories]["bots"]],
#         audiences: [relations[:audiences]["intermediate"]],
#         location_id: relations[:locations]["evergreen_ab"],
#         description:
#           "<p>Chatbots have gotten a lot of hype over the last few years. Now that the hype is dying down, it’s clear that there is a long way to go before chatbots are ubiquitous tools for interacting with our favorite services.</p>\n
# <p>There are many tools to help you develop a bot, but when SmartLogic wanted to develop \"The Incredible Baltimore Bill Bot\", we couldn’t find anything in the Elixir ecosystem that suited our needs.</p>\n
# <p>So we decided to roll our own.</p>\n
# <p>In the process, we learned that a chatbot architecture based on our own cognitive processes was easier to develop for and more efficient in its use of resources.</p>\n
# <p>Out of this attempt, I’ve developed a platform-agnostic framework for developing chatbots using Elixir and Phoenix. The architecture is loosely inspired by modern cognitive psychology and easy to grasp at a glance.</p>\n
# <p>The result of this is a framework called Virtuoso (WIP) which I will describe in this talk. If you follow along you should have a working FB Messenger bot in about 30 minutes.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_8_aish_dahal",
#         title:
#           "Simple is Beautiful: Building an SLA Monitoring Tool Using Elixir/OTP at PagerDuty",
#         time_slot_id: relations[:slots]["slot_8"],
#         speakers: [relations[:speakers]["aish_dahal"]],
#         categories: [relations[:categories]["production"]],
#         audiences: [relations[:audiences]["intermediate"]],
#         location_id: relations[:locations]["evergreen_e"],
#         description:
#           "<p>Starting in 2016, PagerDuty started replacing a lot of its in-house custom monitoring tools and SLA calculators with off the shelf software. However, for one critical piece of monitoring that involved detailed business logic, could not be replaced with anything off the shelf. As a result, PagerDuty built its own highly available Elixir powered monitoring tool that used Kafka not only as a communication layer but also as a storage layer.</p>\n
# <p>This talk is a story of how PagerDuty replaced a complex in-house monitoring tool with a rather simpler and more reliable/scalable one all by using Elixir/OTP.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_9_catherine_zoller",
#         title: "Ticket to Fly: Porting an Application from Rails to Phoenix",
#         time_slot_id: relations[:slots]["slot_9"],
#         speakers: [relations[:speakers]["catherine_zoller"]],
#         categories: [relations[:categories]["phoenix"]],
#         audiences: [relations[:audiences]["beginner"]],
#         location_id: relations[:locations]["grand_ballroom"],
#         description:
#           "<p>While porting a project from Ruby on Rails to Phoenix/React, I’ve realized just how deceiving looks can be. “Ticket to Fly” focuses on finding solutions to unexpected challenges along the way. Specifically, we’ll look into working with images, including svg file parsing, and converting ruby methods to elixir by taking advantage of recursion and function piping.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_9_david_schainker",
#         title: "My first Nerves Project: Bioreactor",
#         time_slot_id: relations[:slots]["slot_9"],
#         speakers: [relations[:speakers]["david_schainker"]],
#         categories: [relations[:categories]["nerves"]],
#         audiences: [relations[:audiences]["beginner"]],
#         location_id: relations[:locations]["evergreen_ab"],
#         description:
#           "<p>Living in a vibrant Asian city can have its downsides, especially with regards to air quality. While buying the Latest and Greatest IoIT air filter can help with particulate matter in the air, there is little help with increased CO2 levels in your home, except installing and taking care of lots and lots of plants - an interesting challenge if you live in a high rise apartment building.</p>\n
# <p>Armed with The Nerves Project and available literature on growing algae to remove CO2 from air, this talk will summarize the process of building and testing a basic \"breeder\" bioreactor that uses algae to create more fresh oxygen in the home. The ultimate goal of this project is to build a reactor that can self-sustain an \"optimzed\" state of maximum CO2 removal for a given reactor vessel size, with the aid of artificial light, and electricity.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_9_maciej_kaszubowski",
#         title: "We're Just Getting Started - Our Three Years with Elixir",
#         time_slot_id: relations[:slots]["slot_9"],
#         speakers: [relations[:speakers]["maciej_kaszubowski"]],
#         categories: [relations[:categories]["production"]],
#         audiences: [relations[:audiences]["beginner"]],
#         location_id: relations[:locations]["evergreen_e"],
#         description:
#           "<p>The story begins on August 12th, 2015, not even one year after the Elixir 1.0 release. Phoenix is on version 0.16.1, Ecto callbacks haven’t been deprecated yet. My current boss pushes our first Elixir commit to Gitlab.</p>\n
# <p>ElixirConf is happening on September 4th, 2018. Three years and 60 thousand lines of code later, the project is still alive, serving one million registered users. We’re now on Elixir 1.6 and Phoenix 1.3. Ecto callbacks are long gone and only few of us can remember them.</p>\n
# <p>A lot has changed. We’ve made a lot of mistakes. This is a success story, though. Running the same project for such a long time gave us a unique opportunity to observe how the language changed and became really mature. This talk will try to share some of the lessons learned during this time and insights on how changes in the ecosystem affected our codebase.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_b_aaron_votre",
#         title: "Making a GraphQL Server with Absinthe & Dataloader",
#         time_slot_id: relations[:slots]["slot_b"],
#         speakers: [relations[:speakers]["aaron_votre"]],
#         categories: [relations[:categories]["phoenix"]],
#         audiences: [relations[:audiences]["intermediate"]],
#         location_id: relations[:locations]["grand_ballroom"],
#         description:
#           "<p>The GraphQL query language has been growing in popularity since it's release by Facebook in 2015. It gives servers more flexibility than REST and Elixir already has an amazing library supporting the GraphQL Spec - Absinthe! If our API adapts, so should the way we access the database, that's where Dataloader makes writing Ecto queries easy and less repetitive.</p>\n
# <p>See how we can make a simple graphQL server with as little code as possible.</p>\n
# <p>- It will be helpful to have a basic understanding of Phoenix, Ecto, and the objective of GraphQL.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_b_frank_kumro",
#         title: "Did You Hear That Wind?",
#         time_slot_id: relations[:slots]["slot_b"],
#         speakers: [relations[:speakers]["frank_kumro"]],
#         categories: [relations[:categories]["nerves"]],
#         audiences: [relations[:audiences]["intermediate"]],
#         location_id: relations[:locations]["evergreen_ab"],
#         description:
#           "<p>I've been fascinated with the weather, unknowingly, for years. When I first met my wife we would watch a movie during storms to pass the time. Then when a gust of wind hit the house, I would turn to her and say \"Did you hear that wind?\".</p>\n
# <p>Fast forward many years, we now live at a higher elevation with lots of wind. Storms would roll in and wind would hit the house. A few seconds later I would receive a message from my wife, \"Did you hear that wind!\". The trolling led me to dive into the hardware space and luckily enough I would be able to use my favorite language, Elixir!</p>\n
# <p>The weather station is comprised of a Raspberry Pi 3, wind speed sensor, weather proof temperature sensor, and a few other bits to make it all work. As this was my first attempt at a hardware hacking project, we can laugh (together I hope) at my mix ups and take a peak at the many components. Elixir is used with Nerves to communicate with the hardware (1 wire Dallas and MCP3008 analog to digital), persist readings to an external API (Phoenix), and display with live updates via Elm.</p>\n
# <p>The talk will cover the entire stack giving a look into a project that many commented that \"they wish they could do\" or \"I have no idea where to start\".</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_b_ben_marx",
#         title: "Take Your Time",
#         time_slot_id: relations[:slots]["slot_b"],
#         speakers: [relations[:speakers]["ben_marx"]],
#         categories: [relations[:categories]["nif"]],
#         audiences: [relations[:audiences]["advanced"]],
#         location_id: relations[:locations]["evergreen_e"],
#         description:
#           "<p>OTP20 officially introduced dirty schedulers. In this talk, we'll cover why they're part of OTP and what function they perform. Using Rust NIFs, we'll compare schedulers and dirty schedulers to illustrate the trade-offs between scheduler types. By the talk's end, it should be apparent why dirty schedulers are part of OTP and how and when you should consider using them.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_c_anil_wadghule",
#         title: "Building Video Chat with Elixir & Phoenix",
#         time_slot_id: relations[:slots]["slot_c"],
#         speakers: [relations[:speakers]["anil_wadghule"]],
#         categories: [relations[:categories]["phoenix"]],
#         audiences: [relations[:audiences]["intermediate"]],
#         location_id: relations[:locations]["grand_ballroom"],
#         description:
#           "<p>In this talk, I will share my experience and learnings about how I built a production-grade video chat system with Elixir and Phoenix.</p>\n
# <p>My video chat app makes use of following features of Elixir and Phoenix.</p>\n
# <ul>
#   <li><strong>Real-time with Phoenix channels</strong><br />How a Video Chat benefits with real-time features of Phoenix framework. In a Video Chat app, there are so many interactions which happen in a group, so you need real-time capabilities on your server.</li>
#   <li><strong>Agents, Tasks, GenSevers</strong><br />How I used Agents to wrap the state, I need to talk to a third party server, how I used Tasks to perform certain operations, how I used GenServers for long-running features like Cache servers and recorded media file uploaders.</li>
#   <li><strong>Supervisors</strong><br />Instead of crashing, how we gracefully stop services. When users close tabs, other users in video chat should be gracefully informed that users have quit. I will cover, how we make use of supervisors and GenServers for the use case.</li>
#   <li><strong>GenStage for events processing with a remote WebRTC media server</strong><br />Third party media server has API and continually sends different events such as network is slow, user's video is unpublished or audio went off etc. We will see how I make use of GenStage's event handling to show user's feedback interactively.</li>
#   <li><strong>Debugging</strong><br />We will see how Erlang's debugging tools come in handy when there is something wrong.</li>
# </ul>"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_c_todd_resudek",
#         title: "A Deep Dive Into Hex",
#         time_slot_id: relations[:slots]["slot_c"],
#         speakers: [relations[:speakers]["todd_resudek"]],
#         categories: [relations[:categories]["hex"]],
#         audiences: [relations[:audiences]["general"]],
#         location_id: relations[:locations]["evergreen_ab"],
#         description:
#           "<p>Hex is one of the few tools that virtually every Elixir and Erlang developer relies on, yet many people never get past deps.get. Hex can do a lot more to make you more productive, and is taking steps to proactively prevent issues (like leftpad) from ever happening.</p>\n
# <p>I want to take you on a journey through this incredible piece of software, including some interesting features, the security measures taking place behind the scenes, and other interesting nuances that live deep in the source code.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_c_mathew_gardner",
#         title: "Interfacing with Machine-Learned Models",
#         time_slot_id: relations[:slots]["slot_c"],
#         speakers: [relations[:speakers]["mathew_gardner"]],
#         categories: [relations[:categories]["nif"]],
#         audiences: [relations[:audiences]["advanced"]],
#         location_id: relations[:locations]["evergreen_e"],
#         description:
#           "<p>Much of today's problems can be solved using machine learning algorithms, even really simple ones. More and more teams are incorporating their use into their product and solution offerings. While these algorithms themselves aren't the focus of this talk, Mathew will show how one may go about working with them in Elixir. From basic black box API calls, to using ports and NIFs, showing how to bring machine learning closer to the Elixir application.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_h_justin_schneck",
#         title: "Keynote",
#         time_slot_id: relations[:slots]["slot_h"],
#         speakers: [relations[:speakers]["justin_schneck"]],
#         categories: [relations[:categories]["keynote"]],
#         audiences: [relations[:audiences]["general"]],
#         location_id: relations[:locations]["grand_ballroom"],
#         description: "Keynote"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_j_renan_ranelli",
#         title: "Understanding Elixir's (Re)compilation",
#         time_slot_id: relations[:slots]["slot_j"],
#         speakers: [relations[:speakers]["renan_ranelli"]],
#         categories: [relations[:categories]["elixir"]],
#         audiences: [relations[:audiences]["general"]],
#         location_id: relations[:locations]["grand_ballroom"],
#         description:
#           "<p>Elixir's code-generation capabilities require a sophisticated compiler with complex dependency tracking. Given such complexity, it is often unclear why sometimes changing a single line in a single file triggers the recompilation of 100 other files. This talk aims to clarify that.</p>\n
# <p>Most of the content presented in this talk was \"discovered\" while struggling with recompilations of 500+ files in a 2000+ .beam file Phoenix app. We learned things the hard way so that you don't have to.</p>\n
# <p>In this talk we are going to take a deep dive into what happens when you type \"mix compile\", why and when modules need to be recompiled, and how compilation behavior interacts with umbrella apps. You will learn how to \"debug\" recompilation problems, which tools to use, and how to avoid common pitfalls.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_j_james_smith",
#         title:
#           "Event Sourcing in Real World Applications: Challenges, Successes and Lessons Learned.",
#         time_slot_id: relations[:slots]["slot_j"],
#         speakers: [relations[:speakers]["james_smith"]],
#         categories: [relations[:categories]["code_quality"]],
#         audiences: [relations[:audiences]["advanced"]],
#         location_id: relations[:locations]["evergreen_ab"],
#         description:
#           "<p>Our client came to us wanting to build a real time auction application for supplying fuel to ships.</p>\n
# <p>This was exciting! We were going to be auctioning upwards of 1000 metric tons of fuel using Elixir and Phoenix! What could go wrong?</p>\n
# <p>From the beginning of the project there was a hard requirement for auditing. Anything that happened in the system needed to be recorded. This lead us to the idea of Event Sourcing.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_j_michael_stalker",
#         title: "Picking Properties to Test in Property-Based Testing",
#         time_slot_id: relations[:slots]["slot_j"],
#         speakers: [relations[:speakers]["michael_stalker"]],
#         categories: [relations[:categories]["testing"]],
#         audiences: [relations[:audiences]["general"]],
#         location_id: relations[:locations]["evergreen_e"],
#         description:
#           "<p>The developer stared at the screen in frustration and grumbled, \"Example-based testing is straightforward. I pick a few inputs, and verify the output. I don't get property-based testing. How can I write a test if I don't know what the inputs are?\"</p>\n
# <p>Maybe you're like this developer. Maybe you're sold on the value of property-based testing. Maybe you're convinced that it will help you write effective specs. But where do you go from here?</p>\n
# <p>Identifying properties to test is your next step toward property-based testing greatness. You'll learn what properties are. You'll gain strategies to identify them in your code. You'll see practical examples using StreamData, a new addition to the Elixir language. You might even start to view code verification in a new light.</p>\n
# <p>You'll get the most out of this presentation if you have used example-based testing in any language. You'll go from \"property-based testing looks awesome\" to \"I can do it!\"</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_k_jeff_schomay",
#         title:
#           "Behavior Trees and Battleship: Tapping into the Power of Advanced Data Structures",
#         time_slot_id: relations[:slots]["slot_k"],
#         speakers: [relations[:speakers]["jeff_schomay"]],
#         categories: [relations[:categories]["elixir"]],
#         audiences: [relations[:audiences]["general"]],
#         location_id: relations[:locations]["grand_ballroom"],
#         description:
#           "<p>I wrote the Elixir Behavior Tree library. This talk explores what a behavior tree is, how it is used in AI and robotics, and how it differs from decision trees and state machines. I describe how it relies on the Zipper Tree, emphasizing the technique of encoding logic into declarative data structures, and I will contrast my design decisions and implementation in Elixir against other mutable, non-functional languages that behavior trees are usually written in. I will pull it all together with a cool demo, iterating on a behavior tree AI that plays Battleship.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_k_zach_porter",
#         title: "Breaking Down the User Monolith",
#         time_slot_id: relations[:slots]["slot_k"],
#         speakers: [relations[:speakers]["zach_porter"]],
#         categories: [relations[:categories]["code_quality"]],
#         audiences: [relations[:audiences]["beginner"]],
#         location_id: relations[:locations]["evergreen_ab"],
#         description:
#           "<p>Coming from Ruby on Rails, the convention is to have a `User` model handle multiple aspects of an account such as login, logout, password reset, and email confirmation. While there is a temptation to bring that convention with us when building an Elixir application, we can do better by leveraging bounded contexts, Ecto's embedded schemas, and `Ecto.Multi` to break these separate pieces of functionality into isolated chunks that are easier to maintain and extend.</p>\n
# <p>Come on a journey with me as I take a large Elixir `User` module and break it down into smaller, focused modules. We'll employ a test-driven development approach and may even end up with a better database design for managing user accounts in an Elixir application.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_k_andrew_bennett",
#         title: "Sustainable Testing",
#         time_slot_id: relations[:slots]["slot_k"],
#         speakers: [relations[:speakers]["andrew_bennett"]],
#         categories: [relations[:categories]["testing"]],
#         audiences: [relations[:audiences]["intermediate"]],
#         location_id: relations[:locations]["evergreen_e"],
#         description:
#           "<p>Sustainable test suites are long lived and effective at revealing bugs. However, the complexity of distributed cloud applications can make it challenging to have much confidence in system correctness. What testing practices are present in other functional languages? How is property-based testing related to model checking and formal verification?</p>\n
# <p>We'll explore test frameworks and practices from other functional languages and academic sources in hopes of improving the way we test software in Elixir. We'll discuss tools as they exist today, as well as future tools being developed at Toyota Connected and among the Elixir community to empower developers to more efficiently test their systems.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_m_eric_oestrich",
#         title: "Going Multi-Node",
#         time_slot_id: relations[:slots]["slot_m"],
#         speakers: [relations[:speakers]["eric_oestrich"]],
#         categories: [relations[:categories]["distributed_systems"]],
#         audiences: [relations[:audiences]["advanced"]],
#         location_id: relations[:locations]["grand_ballroom"],
#         description:
#           "<p>You have an application that works well on a single node, and you’ve heard that Erlang lets you scale out in a cluster. How do you go about doing that?</p>\n
# <p>We’ll walk through the steps I took to turn ExVenture (a multiplayer game server) into a distributed application.</p>\n
# <p>Starting with connecting nodes in development and production, to picking a cluster leader via the Raft protocol, and dealing with process groups to fan calls throughout the cluster.</p>\n
# <p>Finally we’ll see some of the hurdles I encountered when spanning multiple nodes.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_m_daniel_azuma",
#         title: "Docker and OTP: Friends or Foes?",
#         time_slot_id: relations[:slots]["slot_m"],
#         speakers: [relations[:speakers]["daniel_azuma"]],
#         categories: [relations[:categories]["deployment"]],
#         audiences: [relations[:audiences]["advanced"]],
#         location_id: relations[:locations]["evergreen_ab"],
#         description:
#           "<p>Docker is the hot deployment technology across the industry, and many workloads are moving into cloud services. But for Elixir and other BEAM languages, there's some hesitation. Will containers work with stateful processes? What about hot code upgrades?</p>\n
# <p>This talk will survey the sources of friction, real or perceived, between Docker and OTP. You'll discover techniques and tools that let your stateful Elixir applications thrive in a container-based cloud environment.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_m_rafal_studnicki",
#         title:
#           "Empirical Monkeys: A Practitioner’s Take on Breaking Distributed Elixir Systems via Property-Based Testing",
#         time_slot_id: relations[:slots]["slot_m"],
#         speakers: [relations[:speakers]["rafal_studnicki"], relations[:speakers]["simon_zelazny"]],
#         categories: [relations[:categories]["testing"]],
#         audiences: [relations[:audiences]["intermediate"]],
#         location_id: relations[:locations]["evergreen_e"],
#         description:
#           "<p>Suppose you have a distributed system deployed in production and you are on the hook for its uptime metrics. Having been there ourselves, we have come to believe that it’s essential for software developers to understand what guarantees a system provides, and to have a good picture of *how* it will behave under unfavorable conditions.</p>\n
# <p>In this talk, we’ll outline the basic theory of safety and liveness properties; the link between modeling properties in your head and converting them into working PropCheck code; and showcase the results of applying our philosophy to example applications. You’ll see how ETS-based, Mnesia-based, and Phoenix-PubSub-based Elixir apps fare when in dire straits.</p>\n
# <p>We hope to convince you that getting from zero to one in property-based testing in not that hard, and show you how to gain confidence in your Elixir application’s performance in production.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_n_emerson_macedo",
#         title: "Using Elixir GenStage to Track Video Watch Progress",
#         time_slot_id: relations[:slots]["slot_n"],
#         speakers: [relations[:speakers]["emerson_macedo"]],
#         categories: [relations[:categories]["genstage"]],
#         audiences: [relations[:audiences]["intermediate"]],
#         location_id: relations[:locations]["grand_ballroom"],
#         description:
#           "<p>This talk is a history of how GenStage became the perfect fit to a Video Watch Progress software.</p>\n
# <p>In the beginning of 2016, we started to migrate a High Throughput Ruby Web API to Elixir. Starting with a single 1:1 rewrite, we did lots of improvements and in the beginning of 2018, GenStage was a great fit to deliver the best solution we could. We did load-shedding, back-pressure and lots of techniques using this powerful Elixir tool.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_n_jerel_unruh",
#         title: "Handling Success: Development and Deployment Beyond Hello World",
#         time_slot_id: relations[:slots]["slot_n"],
#         speakers: [relations[:speakers]["jerel_unruh"]],
#         categories: [relations[:categories]["deployment"]],
#         audiences: [relations[:audiences]["advanced"]],
#         location_id: relations[:locations]["evergreen_ab"],
#         description:
#           "<p>So your project has gotten popular. More funding, more traffic, more developers contributing code. Just SSH'ing into your production server and running mix phx.server & isn't going to cut it. Now the business requirements need the application to integrate with Service A but possibly run a second, almost identical, deployment that integrates with Service B. And part of the current functionality is a candidate for being shaved off into a separate product in the future.</p>\n
# <p>In this talk I'll give a few ideas for structuring your umbrella project, running lots of tests quickly, and building and deploying flexible releases.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_n_boyd_multerer",
#         title: "Introducing Scenic - A Functional UI Framework",
#         time_slot_id: relations[:slots]["slot_n"],
#         speakers: [relations[:speakers]["boyd_multerer"]],
#         categories: [relations[:categories]["ui"]],
#         audiences: [relations[:audiences]["beginner"]],
#         location_id: relations[:locations]["evergreen_e"],
#         description:
#           "<p>After years of work, I am releasing Scenic, a UI framework you can use to build UI directly in Elixir or Erlang without using a browser. Scenic can create small, fast, and robust interactive applications on Nerves devices, MacOS, Linux and more.</p>\n
# <p>In this talk, I’ll give an overview of the framework, how it works and demonstrate it running in addition to connecting it to a Phoenix service to remote the application across the net.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_p_joao_britto",
#         title: "Erlang/OTP: What's in the Box?",
#         time_slot_id: relations[:slots]["slot_p"],
#         speakers: [relations[:speakers]["joao_britto"]],
#         categories: [relations[:categories]["otp"]],
#         audiences: [relations[:audiences]["beginner"]],
#         location_id: relations[:locations]["grand_ballroom"],
#         description:
#           "<p>20 years ago Erlang/OTP was released as Open Source. And we have a lot to celebrate.</p>\n
# <p>When we are first introduced to Elixir we notice that although it does an excellent job in simplifying and abstracting the thorny parts of the platform, every once in a while we encounter some straight calls to Erlang code. Why do we need them? How do they work? Fear not, for these are in fact the tips of amazing, old, beautiful icebergs.</p>\n
# <p>This talk opens the box of Erlang/OTP and introduces some of the coolest built-in tools and libraries available in a standard Erlang/OTP installation, such as wx, ssh, timer, crypto and digraph. We will go over the most popular ones, without forgetting to stop by the most underground (and often underrated) ones, showing some examples of how they can come in handy in numerous occasions.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_p_jeffrey_gillis",
#         title: "Using Elixir and OTP behaviors to monitor infrastructure",
#         time_slot_id: relations[:slots]["slot_p"],
#         speakers: [relations[:speakers]["jeffrey_gillis"]],
#         categories: [relations[:categories]["monitoring"]],
#         audiences: [relations[:audiences]["beginner"]],
#         location_id: relations[:locations]["evergreen_ab"],
#         description:
#           "<p>Using Elixir and OTP behaviors, infrastructure engineers at Optoro, Inc. monitor and interact with legacy infrastructure. This talk describes how SSHex, GenServers, Supervisors, and a Registry were used to monitor and interact with processes across multiple servers. It will also describe how the main library was created to be used across multiple projects (command line and a Phoenix web application).</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_p_dan_mcguire",
#         title: "Texas: Virtual DOM Library for Server-Side V-DOM.",
#         time_slot_id: relations[:slots]["slot_p"],
#         speakers: [relations[:speakers]["dan_mcguire"]],
#         categories: [relations[:categories]["ui"]],
#         audiences: [relations[:audiences]["intermediate"]],
#         location_id: relations[:locations]["evergreen_e"],
#         description:
#           "<p>Client-side applications are expensive to make, difficult to maintain and practically impossible to account for all edge cases. We've gotten so caught up in the front-end framework fever that we haven’t yet taken the time to consider if there are better ways to achieve the goal of building rich user interactions.</p>\n
# <p>Texas takes the Virtual DOM approach for updating the DOM with lightweight patches, but instead of calculating patches on the client, it does all the heavy lifting on the server-side bringing control back to the developer and keeping your source of truth closer to your business logic. The end result is faster initial page loads, less data over the wire, more flexibility in choosing your transport methods, graceful application degradation, and maybe the most attractive feature is the development speed increase you'll see when you come back to the server and stop struggling with client-side code!</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_q_alex_garibay",
#         title: "Scaling Concurrency Without Getting Burned",
#         time_slot_id: relations[:slots]["slot_q"],
#         speakers: [relations[:speakers]["alex_garibay"]],
#         categories: [relations[:categories]["otp"]],
#         audiences: [relations[:audiences]["intermediate"]],
#         location_id: relations[:locations]["grand_ballroom"],
#         description:
#           "<p>We all know Elixir is fast and scalable, but knowing how to leverage its strengths can be the difference between a fast program and one unrivaled by other platforms. Whether you're reaching for Tasks and GenServers, or wrangling data with Ecto, understanding subtle nuances of each tool is the key to avoiding bottlenecks and writing efficient applications.</p>\n
# <p>Starting from real-world scenarios, we'll explore various OTP tricks and concurrency patterns to drive maximum performance. Along the way, we'll see how features built into Elixir and OTP can apply to applications from small to large. We'll also navigate the unexpected pitfalls that come with cheap concurrency and how to safeguard from each trap.</p>\n
# <p>Whether you're an intermediate or seasoned Elixir developer, you'll leave with some new performance tricks and a mental model for writing highly concurrent applications.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_q_guilherme_de_maio",
#         title: "Down the Memory Lane: a Tale of Memory Leaks",
#         time_slot_id: relations[:slots]["slot_q"],
#         speakers: [relations[:speakers]["guilherme_de_maio"]],
#         categories: [relations[:categories]["elixir"]],
#         audiences: [relations[:audiences]["intermediate"]],
#         location_id: relations[:locations]["evergreen_ab"],
#         description:
#           "<p>Much is said about the BEAM and how it’s GC per process is amazing, but sometimes memory leaks do happen! While developing Elixir apps I encountered such cases more than once, and this talk is about why that happens and what to do when it does.</p>\n
# <p>Understanding how the Erlang runtime is different from other platforms we’re used to is crucial for solving such issues. How can you pinpoint what’s causing the leak? What are common reasons and solutions? These are the questions that will drive this talk.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_q_enio_lopes",
#         title: "Building a Stateful Web Application with Elixir",
#         time_slot_id: relations[:slots]["slot_q"],
#         speakers: [relations[:speakers]["enio_lopes"]],
#         categories: [relations[:categories]["production"]],
#         audiences: [relations[:audiences]["intermediate"]],
#         location_id: relations[:locations]["evergreen_e"],
#         description:
#           "<p>The concurrency primitives provided by Erlang are a perfect match to build stateful web applications.</p>\n
# <p>Nowadays it is common to see stateless applications that depend on databases to keep any kind of state, but that adds some overhead.</p>\n
# <p>Arguably, not using databases will create more problems than solve them. I will try to describe the trade-offs in building a databaseless web application and what are the different scenarios befitting such an approach. A web application that is independent of databases also has its own set of problems, specially when thinking about running that application in a distributed manner.</p>\n
# <p>We've built such an application at uSwitch and I will walk you through the steps and different challenges we've faced while building it.</p>\n
# <p>We hope that after hearing this talk you will be able to identify scenarios where databases won't be needed and thus write a stateless application.</p>\n"
#       },
#       %{
#         is_talk: true,
#         slug: "slot_t_chris_mccord",
#         title: "Keynote",
#         time_slot_id: relations[:slots]["slot_t"],
#         speakers: [relations[:speakers]["chris_mccord"]],
#         categories: [relations[:categories]["keynote"]],
#         audiences: [relations[:audiences]["general"]],
#         location_id: relations[:locations]["evergreen_e"]
#       },
      %{
        is_talk: false,
        speakers: [],
        slug: "day_1_registration",
        title: "Registration",
        time_slot_id: relations[:slots]["slot_1"]
      },
      %{
        is_talk: false,
        speakers: [],
        slug: "day_1_welcome",
        title: "Welcome",
        time_slot_id: relations[:slots]["slot_2"]
      },
      %{
        is_talk: false,
        speakers: [],
        slug: "break_1",
        title: "Break",
        time_slot_id: relations[:slots]["slot_4"]
      },
      %{
        is_talk: false,
        speakers: [],
        slug: "day_1_lunch",
        title: "Lunch",
        time_slot_id: relations[:slots]["slot_7"]
      },
      %{
        is_talk: false,
        speakers: [],
        slug: "break_2",
        title: "Break",
        time_slot_id: relations[:slots]["slot_a"]
      },
      %{
        is_talk: false,
        speakers: [],
        slug: "break_3",
        title: "Break",
        time_slot_id: relations[:slots]["slot_d"]
      },
      %{
        is_talk: false,
        speakers: [],
        slug: "lightning_talks",
        title: "Lightning Talks",
        time_slot_id: relations[:slots]["slot_e"]
      },
      %{
        is_talk: false,
        speakers: [],
        slug: "day_2_registration",
        title: "Registration",
        time_slot_id: relations[:slots]["slot_f"]
      },
      %{
        is_talk: false,
        speakers: [],
        slug: "day_2_welcome",
        title: "Welcome",
        time_slot_id: relations[:slots]["slot_g"]
      },
      %{
        is_talk: false,
        speakers: [],
        slug: "break_4",
        title: "Break",
        time_slot_id: relations[:slots]["slot_i"]
      },
      %{
        is_talk: false,
        speakers: [],
        slug: "day_2_lunch",
        title: "Lunch",
        time_slot_id: relations[:slots]["slot_l"]
      },
      %{
        is_talk: false,
        speakers: [],
        slug: "break_5",
        title: "Break",
        time_slot_id: relations[:slots]["slot_o"]
      },
      %{
        is_talk: false,
        speakers: [],
        slug: "break_6",
        title: "Break",
        time_slot_id: relations[:slots]["slot_r"]
      },
      %{
        is_talk: false,
        speakers: [],
        slug: "closing_remarks",
        title: "Closing Remarks",
        time_slot_id: relations[:slots]["slot_s"]
      }
    ]
  end

  defp fetch_all_by_slug(query) do
    query
    |> select([item], %{slug: item.slug, id: item.id})
    |> Repo.all()
    |> Enum.reduce(%{}, fn %{slug: slug, id: id}, acc ->
      Map.put(acc, slug, id)
    end)
  end

  defp fetch_schemas_by_slug(query) do
    query
    |> Repo.all()
    |> Enum.reduce(%{}, fn %{slug: slug} = item, acc ->
      Map.put(acc, slug, item)
    end)
  end
end
