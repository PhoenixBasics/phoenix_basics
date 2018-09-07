defmodule Basics.Seeds.Schedule.Speaker do
  @moduledoc false

  alias Basics.Repo
  alias Basics.Schedule.Speaker

  def perform do
    Enum.each(data(), fn attrs ->
      %Speaker{}
      |> Speaker.changeset(attrs)
      |> Repo.insert!()
    end)
  end

  def data do
    [
      %{
        slug: "jose_valim",
        image: image_info("jose-valim.jpg"),
        first: "José",
        last: "Valim",
        company: "Plataformatec",
        github: "josevalim",
        twitter: "josevalim",
        description: "@plataformatec co-founder and creator of @elixirlang."
      },
      %{
        slug: "lance_halvorsen",
        image: image_info("lance-halvorsen.jpg"),
        first: "Lance",
        last: "Halvorsen",
        company: "LeTote",
        github: "lancehalvorsen",
        twitter: "lance_halvorsen",
        description:
          "Lance is a member of the Phoenix core team and author of Functional Web Development with Elixir, OTP, and Phoenix. He is currently a Senior Software Architect at LeTote living in Portland, OR."
      },
      %{
        slug: "anna_neyzberg",
        image: image_info("anna-neyzberg.jpg"),
        first: "Anna ",
        last: "Neyzberg",
        company: "Carbon Five",
        github: "aneyzberg",
        twitter: "aneyzb",
        description:
          "Anna Neyzberg is a San Francisco native who has done a lot of work in the ruby community in SF and currently sits on the board of RailsBridge. She has taken this community organizing experience and 2 years ago co-founded ElixirBridge in SF- an organization that offers free weekend long workshops, with the goal of creating an inclusive welcoming space for under-represented populations in tech to learn elixir. By day she works as a Developer at Carbon Five. When not in front of a keyboard, she is trying to get better at climbing rocks."
      },
      %{
        slug: "luke_imhoff",
        image: image_info("luke-imhoff.jpg"),
        first: "Luke",
        last: "Imhoff",
        company: "DockYard",
        github: "KronicDeth",
        twitter: "KronicDeth",
        description:
          "Luke Imhoff has been writing Elixir since June 2014 and started writing IntelliJ Elixir in July 2014 after he couldn't find pre-existing support for Elixir for JetBrains IDEs he loved like Rubymine. While developing the plugin, he's found bugs in the native Elixir lexer and parser and the OTP debugger. He has 3 hex packages for JSONAPI: Alembic (validate format of JSONAPI), Calcinator (transport neutral JSONAPI, so you can use them for APIs and RPCs), and Retort (JSONAPI over JSONRPC over RabbitMQ for RPC). He hosts the Austin Elixir meetup on the 3rd Monday of each month."
      },
      %{
        slug: "bailey_miller",
        image: image_info("bailey-miller.jpg"),
        first: "Bailey",
        last: "Miller",
        company: "Gaslight",
        github: "baileycmiller",
        description:
          "This session is co-presented by Bailey Miller and Tim Mecklem. Bailey creates amazing things as a designer at Gaslight (teamgaslight.com) and has written about her experience working with Phoenix from a front end developer perspective. Tim is a developer at Gaslight, where he builds exciting software and helps people build themselves. They have presented separately at conferences like Adobe Jam and ElixirConf, and this is their first time teaming up to show how design and development complement each other."
      },
      %{
        slug: "tim_mecklem",
        image: image_info("tim-mecklem.jpg"),
        first: "Tim",
        last: "Mecklem",
        company: "Gaslight",
        github: "tmecklem",
        twitter: "tim_mecklem",
        description:
          "Tim works at Gaslight in Cincinnati, OH building software solutions with Elixir and Ruby and is a member of the Nerves Core team. While he spends part of his time as a lead investigator on crimes against Elixir, he also concurrently perpetrates crimes against Elixir. He has yet to catch himself."
      },
      %{
        slug: "fahad_almusharraf",
        image: image_info("fahad-almusharraf.jpg"),
        first: "Fahad",
        last: "Almusharraf",
        company: "Student",
        github: "falmusha",
        twitter: "ifahad7",
        description:
          "I'm a Computer Engineer and graduate student currently researching ways to automate behavioral change in smoking cessation through the use of artificially intelligent conversational systems."
      },
      %{
        slug: "manu_ajith",
        image: image_info("manu-ajith.jpg"),
        first: "Manu",
        last: "Ajith",
        company: "9Piecesof8 Software Labs",
        github: "manusajith",
        twitter: "manusajith",
        description:
          "Manu is a tech entrepreneur and software engineer with a passion for building scalable web systems. He is a polyglot developer who primarily uses Ruby, Elixir, and Go at work, but also keeps a keen eye on other functional paradigms like Haskell. These days, he is into building systems using Domain Driven Design, CQRS, and Event Sourcing. Manu is also a travel enthusiast, an aspiring nomad, who has roamed 26 countries so far and plans to visit the rest soon."
      },
      %{
        slug: "aaron_renner",
        image: image_info("aaron-renner.jpg"),
        first: "Aaron",
        last: "Renner",
        company: "ActiveProspect",
        github: "aaronrenner",
        twitter: "bayfieldcoder",
        description:
          "Aaron has been developing software professionally for 10+ years and has been writing Elixir full time since 2016. He has been the technical co-founder for multiple startups and can only imagine the money he would have saved on servers if he had found Elixir sooner. Aaron enjoys clean code, refactoring and studying application design. When he’s not in front of the computer, Aaron enjoys cycling, camping and family road trips."
      },
      %{
        slug: "justus_eapen",
        image: image_info("justus-eapen.jpg"),
        first: "Justus",
        last: "Eapen",
        company: "SmartLogic",
        github: "Github: justuseapen",
        twitter: "Twitter: @justuseapen",
        description:
          "Justus is an Elixir Developer and AI Enthusiast from Baltimore. He's best known for his work on the Pavlok shocking wristband and designing single-page calendars. Accepting rap cypher invitations."
      },
      %{
        slug: "aish_dahal",
        image: image_info("aish-dahal.jpg"),
        first: "Aish",
        last: "Dahal",
        company: "PagerDuty",
        github: "aishraj",
        twitter: "aishrajdahal",
        description:
          "Aish works as an Engineer at PagerDuty in San Francisco. He current works in building PagerDuty’s event intelligence platform often dealing with fallacies of distributed computing. His recent focus has been on Elixir/OTP and building event driven microservices using Kafka and Elixir. In the past he has worked as an early stage employee at HackerRank as well as a programmer at Goldman Sachs."
      },
      %{
        slug: "catherine_zoller",
        image: image_info("catherine-zoller.jpg"),
        first: "Catherine",
        last: "Zoller",
        company: "Mojotech",
        github: "cathyzoller",
        twitter: "mojo_cathy",
        description:
          "Catherine Zoller is a software engineer in Boulder at Mojotech. Lately she spends her days working with React and Elixir. On summer weekends you’ll find her in the garden building a habitat for birds, bees & butterflies. When the snow flies (winter is coming) she spins yarn, knits socks, and programs in Elixir."
      },
      %{
        slug: "david_schainker",
        image: image_info("david-schainker.jpg"),
        first: "David",
        last: "Schainker",
        github: "schainker",
        twitter: "schainks",
        description:
          "David is a software developer who has spent the past five years focusing on building pragmatically in the IoT, \"Gig Economy\", and Education industries. After building his first Phoenix project in 2016, he has been hooked on bringing more functional programming into his production environments and tending to his herb garden when he's not out hiking."
      },
      %{
        slug: "maciej_kaszubowski",
        image: image_info("maciej-kaszubowski.jpg"),
        first: "Maciej",
        last: "Kaszubowski",
        company: "AppUnite",
        github: "mkaszubowski",
        twitter: "mkaszubowski94",
        description:
          "Maciej is a developer at AppUnite where he's been using Elixir for about two years now. Interested in software architecture, distributed systems, data synchronisation and consistency guarantees. Currently writing his Master’s Thesis on CRDTs. A frequent speaker and co-organiser of Poznań Elixir Meetup. Started to love speaking even more after giving a talk at ElixirConfEU 2018."
      },
      %{
        slug: "aaron_votre",
        image: image_info("aaron-votre.jpg"),
        first: "Aaron",
        last: "Votre",
        company: "Corvus Insurance",
        github: "shamshirz",
        twitter: "ShamshirzDev",
        description:
          "Aaron is an adventurer of all things software. He came to Elixir from a Java and Node background to fall in love with the community and the functional coding style. Currently working for Corvus Insurance, Aaron writes primarily in Elm and Elixir while experimenting with game development in his spare time. Often found in his natural habitat of soccer fields located near coffee shops."
      },
      %{
        slug: "frank_kumro",
        image: image_info("frank-kumro.jpg"),
        first: "Frank",
        last: "Kumro",
        github: "fkumro",
        twitter: "frigidcode",
        description:
          "Frank Kumro is a software engineer from Buffalo, NY. He loves working with Elixir/Nerves, playing with his kids, and working on his car. Enjoys long walks on the beach, pina coladas and getting caught in the rain."
      },
      %{
        slug: "ben_marx",
        image: image_info("ben-marx.jpg"),
        first: "Ben",
        last: "Marx",
        company: "Bleacher Report",
        github: "bgmarx",
        twitter: "bgmarx",
        description:
          "Ben is the software architect at Bleacher Report, co-author of Adopting Elixir and co-organizer of the Erlang Elixir meet up in San Francisco. In his free time, he's also programming in Rust, playing guitar, and building guitar pedals."
      },
      %{
        slug: "anil_wadghule",
        image: image_info("anil-wadghule.jpg"),
        first: "Anil",
        last: "Wadghule",
        company: "Skatter",
        github: "anildigital",
        twitter: "anildigital",
        description:
          "Anil was a long time Ruby developer, then turned Polyglot developer to do Node.js, Java, and Scala. For last 1.5 years, he is writing an Elixir Phoenix web application to build a team collaboration product. This product involves WebRTC and chat taking full benefit of BEAM's way of concurrency and OTP abstractions. Anil loves to listen to world music. He is an avid reader. Anil is interested in solving problems with better software architectures and learning distributed systems."
      },
      %{
        slug: "todd_resudek",
        image: image_info("todd-resudek.jpg"),
        first: "Todd",
        last: "Resudek",
        company: "Weedmaps",
        github: "supersimple",
        twitter: "sprsmpl",
        description:
          "I am a reformed graphic designer that got my start in web development 15 years ago. I have made a career in front-end development, PHP, Rails, and for the last year or so, in Elixir. I am a contributor to hex and hex.pm and in my spare time I tinker with hardware projects."
      },
      %{
        slug: "mathew_gardner",
        image: image_info("mathew-gardner.jpg"),
        first: "Mathew",
        last: "Gardner",
        company: "Toyota Connected",
        github: "mathewdgardner",
        description:
          "Mathew is a software engineer at Toyota Connected where he helps to power mobility. He graduated with a computer science degree from the University of North Texas and enjoys all things tech. He's always learning new technologies to hone his craft, and lately, it's been all about machine learning."
      },
      %{
        slug: "justin_schneck",
        image: image_info("justin-schneck.jpg"),
        first: "Justin",
        last: "Schneck",
        github: "mobileoverlord",
        twitter: "mobileoverlord",
        description:
          "I’m in a constant state of wanting to make the world around me bend to my imagination. At one time I wondered how hard it would be to start my motorcycle from my phone. Rewiring the motorcycle and writing an interface was easy, but connecting it all together proved to be a challenge. A challenge that would define my career. That invisible, often impenetrable layer in the air between all the hardware in the world has become my stomping ground. Hardware is hard, so I’ve been working on nerves to make it easy."
      },
      %{
        slug: "renan_ranelli",
        image: image_info("renan-ranelli.jpg"),
        first: "Renan",
        last: "Ranelli",
        company: "Telnyx LLC",
        github: "rranelli",
        twitter: "renanranelli",
        description:
          "I'm a Brazilian software developer focused on backend, operations and databases, working with Elixir since 2015. I worked in companies both very large and very small. I'm also a frequent speaker in technology events in Brazil, and have spoken numerous times about elixir, both locally and abroad. Currently, I work remotely for Telnyx LLC, a Chicago based company whose mission is to democratize global comunications. When I'm not talking about software, I like to cook, make cocktails and dance."
      },
      %{
        slug: "james_smith",
        image: image_info("james-smith.jpg"),
        first: "James",
        last: "Smith",
        company: "Gaslight",
        github: "st23am",
        twitter: "st23am",
        description:
          "Event Sourcing is a way of ensuring all changes to an application's state are stored as a sequence of events. Those events can be queried, logged and used to reconstruct past states. In this talk I'll cover the benefits and challenges with Event Sourcing and the solutions we came up with."
      },
      %{
        slug: "michael_stalker",
        image: image_info("michael-stalker.jpg"),
        first: "Michael",
        last: "Stalker",
        company: "RentPath",
        github: "michaelstalker",
        description:
          "Michael is a senior software engineer at RentPath, currently working with Elixir. He got into programming by dabbling in BASIC and writing games for his TI-82 calculator. Michael entered the world of web development in 2007. A few years afterward, he discovered the joy of testing and TDD."
      },
      %{
        slug: "jeff_schomay",
        image: image_info("jeff-schomay.jpg"),
        first: "Jeff",
        last: "Schomay",
        company: "Adobe (Seattle)",
        github: "jschomay",
        twitter: "jschomay",
        description:
          "I am a polyglot and functional programing enthusiast, with a background in screenwriting, and a hobby of making web games. I have lived and worked in Denver, LA, Bristol (UK), and Seattle."
      },
      %{
        slug: "zach_porter",
        image: image_info("zach-porter.jpg"),
        first: "Zach",
        last: "Porter",
        company: "Viget",
        github: "zporter",
        description:
          "For the past decade, Zach has been helping several companies solve problems with software written in a variety of languages and frameworks. Zach is currently a Senior Developer at Viget where he provides custom software solutions for a mix of companies including Dick's Sporting Goods, the Wildlife Conservation Society, and the Privia Health Group."
      },
      %{
        slug: "andrew_bennett",
        image: image_info("andrew-bennett.jpg"),
        first: "Andrew",
        last: "Bennett",
        company: "Toyota Connected",
        github: "potatosalad",
        twitter: "potatosaladx",
        description:
          "Andrew Bennett is a polyglot programming enthusiast who enjoys using Erlang and Elixir to build distributed systems at Toyota Connected. He enjoys systems performance challenges, security and cryptography research, cooking, and robotics. Away from the computer, he loves spending time with his wonderful wife and their two little girls."
      },
      %{
        slug: "eric_oestrich",
        image: image_info("eric-oestrich.jpg"),
        first: "Eric",
        last: "Oestrich",
        company: "SmartLogic, LLC",
        github: "oestrich",
        twitter: "ericoestrich",
        description:
          "Eric Oestrich works at SmartLogic building applications with Elixir. In his spare time he works on ExVenture, a multiplayer text based game server. He also helps run the REST Fest Midwest unconference."
      },
      %{
        slug: "daniel_azuma",
        image: image_info("daniel-azuma.jpg"),
        first: "Daniel",
        last: "Azuma",
        company: "Google",
        github: "dazuma",
        twitter: "danielazuma",
        description:
          "Daniel Azuma is a senior engineer at Google Cloud Platform, where he leads the Ruby and Elixir teams, building libraries and tools for users of his favorite languages. He lives with his wife in the Seattle area, and loves playing the piano, skiing, and having deep conversations with cats."
      },
      %{
        slug: "rafal_studnicki",
        image: image_info("rafal-studnicki.jpg"),
        first: "Rafal",
        last: "Studnicki",
        github: "studzien",
        description:
          "Rafal and Simon have spent the last few years building and running distributed BEAM systems in production, in various professional roles."
      },
      %{
        slug: "simon_zelazny",
        image: image_info("simon-zelazny.jpg"),
        first: "Simon",
        last: "Zelazny",
        github: "pzel",
        description:
          "Rafal and Simon have spent the last few years building and running distributed BEAM systems in production, in various professional roles."
      },
      %{
        slug: "emerson_macedo",
        image: image_info("emerson-macedo.jpg"),
        first: "Emerson",
        last: "Macedo",
        company: "OLX Brazil",
        github: "emerleite",
        twitter: "emerleite",
        description: "Software Engineer professionally for the last 20 years."
      },
      %{
        slug: "jerel_unruh",
        image: image_info("jerel-unruh.jpg"),
        first: "Jerel",
        last: "Unruh",
        company: "Toyota Connected",
        github: "jerel",
        twitter: "jerelunruh",
        description:
          "Jerel worked for a number of years as an independent contractor building software in the public safety, medical research, and agriculture spaces. He now uses his Elixir skills at Toyota Connected building software for car sharing around the world."
      },
      %{
        slug: "boyd_multerer",
        image: image_info("boyd-multerer.jpg"),
        first: "Boyd",
        last: "Multerer",
        company: "Kry10 Industries",
        github: "boydm",
        twitter: "boydmulterer",
        description:
          "After many years at Microsoft, where he founded Xbox Live, XNA and ran engineering for the Xbox One console, Boyd dived into the Elixir/Erlang community and is now focused on next-generation apps across both single-purpose and general devices."
      },
      %{
        slug: "joao_britto",
        image: image_info("joao-britto.jpg"),
        first: "João",
        last: "Britto",
        company: "Plataformatec",
        github: "britto",
        twitter: "noteu",
        description:
          "With about 10 years of experience in the software industry –7 of which as a consultant at Plataformatec– I have worked with a diverse and rich ecosystem of applications: from e-commerces to news portals and mobile APIs, from monoliths to microservices and enterprise integrations. During this long journey I've had the opportunity to learn a lot about evolving and maintaining applications to last."
      },
      %{
        slug: "jeffrey_gillis",
        image: image_info("jeffrey-gillis.jpg"),
        first: "Jeffrey",
        last: "Gillis",
        company: "Optoro, Inc.",
        description:
          "Jeffrey Gillis is an Infrastructure Engineer at Optoro, Inc. He loves to learn new technologies and programming languages to solve difficult problems. He spends his free time with his wife and three children playing outdoors in their home state of West Virginia."
      },
      %{
        slug: "dan_mcguire",
        image: image_info("dan-mcguire.jpg"),
        first: "Dan",
        last: "McGuire",
        company: "Rentpath",
        github: "dgmcguire",
        twitter: "dgmcguire",
        description:
          "Dan McGuire has been a software developer for around 5 years. He's most interested in how different tools can be used to solve people problems. Hailing from Nashville, TN he writes elixir remotely for Rentpath and loves watching instructional youtube videos before confidently breaking everything around him."
      },
      %{
        slug: "alex_garibay",
        image: image_info("alex-garibay.jpg"),
        first: "Alex",
        last: "Garibay",
        company: "DockYard",
        github: "alexgaribay",
        twitter: "_alexgaribay",
        description:
          "Alex Garibay is an Elixir developer at DockYard where he helps others develop exciting applications as well as spread Elixir knowledge. In his free time, he enjoys developing his own applications, spending time with his family, and eating Kansas City barbecue."
      },
      %{
        slug: "guilherme_de_maio",
        image: image_info("guilherme-de-maio.jpg"),
        first: "Guilherme",
        last: "de Maio",
        company: "Telnyx",
        github: "nirev",
        twitter: "nirev",
        description:
          "I’m a software engineer with 10 years of experience, focused on web applications, from ops to backend. Currently working at Telnyx, a Chicago based telecom company with the mission of democratizing universal communications. I’ve been in love with Elixir since I started working with the language in 2015, being an active member of Elixir Meetups in São Paulo, Brazil and spreading Elixir love all around :) I also love science fiction books, movies and tv series."
      },
      %{
        slug: "enio_lopes",
        image: image_info("enio-lopes.jpg"),
        first: "Enio",
        last: "Lopes",
        company: "uSwitch",
        github: "eniolopes",
        twitter: "eniolps",
        description:
          "I love coding, distributed systems and all the different challenges that come with them. I'm a Brazilian living in London trying to work and learn from the best."
      },
      %{
        slug: "chris_mccord",
        image: image_info("chris-mccord.jpg"),
        first: "Chris",
        last: "McCord",
        github: "chrismccord",
        twitter: "chris_mccord",
        description:
          "Chris McCord is a programmer with a passion for science and building things. He spends his time crafting the Phoenix Framework, working with the fine folks at DockYard, writing books like Metaprogramming Elixir, and teaching others the tools of the trade."
      }
    ]
  end

  defp image_info(filename) do
    %Plug.Upload{
      content_type: "image/jpeg",
      filename: filename,
      path: Path.join(:code.priv_dir(:phoenix_basics), "/repo/seeds/images/" <> filename)
    }
  end
end
