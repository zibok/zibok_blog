---
title: "FOSDEM 2026 - Jour 2"
date: 2026-02-02T09:00:00+01:00
image: "libres-ensemble.webp"
---

Cet article fait partie d'une série d'articles concernant le FOSDEM 2026.
* [Jour 1]({{< relref "tech/2026-01-31-fosdem-2026-jour-1">}})
* Jour 2 (Vous êtes ici ! 🎯)

Ce second jour de conférence a été pour moi constitué de 2 parties&nbsp;: d'abord en devroom Go pour quelques talks intéressants (dont le traditionnel "State of Go" de Maartje) puis en main track pour une série de talks sur le Cyber Resiliency Act dont, soyons honnête, je n'avais pas trop entendu parler jusque là mais qui va potentiellement avoir un impact important sur la gestion de la cubersécurité des entreprises et dans l'open-source.

# [The state of Go - Maartje Eyskens](https://fosdem.org/2026/schedule/event/T9HSYY-the-state-of-go/)

C'est donc tôt ce dimanche matin que Maartje nous a présenté les nouveautés des versions de Go sorties depuis le dernier Fosdem (les versions 1.24 et 1.25) ainsi que de celle à venir très prochainement (la 1.26).

Parmi ces nouveautés, la nouvelle fonction `new()`, le nouveau package `testing/synctest`, le CSRF en utilisant le header `Sec-Fetch-Site`, et également le nouveau GC qui arrive dans la version 1.26 (on y revient un peu plus tard dans cette journée).

Dans ce qui va arriver prochainement également, une refonte du parsing JSON qui devrait accélérer grandement les choses tout en respectant les dernières normes à ce sujet (hâte d'essayer).

Le tout avec l'humour caractéristique de Maartje.

Compliqué d'entendre la fin car pas mal de raffut dans la salle à ce moment-là. Des gens en devroom Go ont été vraiment irrespectueuses cette année.

# [Modularizing a 10-Year Monolith: The Architecture, the People, and the Pain - Victor Lyuboslavsky](https://fosdem.org/2026/schedule/event/MCH3DR-go-modular-monolith-refactoring/)

Victor nous a raconté son parcours concernant la modularisation d'une application legacy de sa société. Cela m'a pas mal parlé pour avoir rencontré des situations similaires chez mon précédent employeur.

Au final, ce que j'en retiens, c'est que le problème n'est pas réellement technique. Modulariser peut être relativement simple une fois posé la structure. Ce qui demande le plus de temps, c'est de discuter avec les autres, convaincre du bien fondé de ses choix, mettre de l'eau dans son vin parfois.

> "The code was ready, the humans were not" - Victor Lyuboslavsky

Ce qui a été mis en place est très proche d'une analyse de type DDD (Victor utilise même le terme de "bounded context" pour définir le périmètre de ses modules).

Un retour d'expérience intéressant.

# [Brewed for Speed: How Go’s Green Tea GC Works - Jesús Espino](https://fosdem.org/2026/schedule/event/WMPBJP-greentea-scheduler/)

Jesús revient sur la grande nouveauté de Go 1.26, son nouveau Garbage Collector, nom de code Green Tea.

Talk très intéressant sur le fonctionnement interne du GC de Go <=1.25 et de l'allocateur de mémoire. Le tout pour comprendre ce qui rend potentiellement Green Tea plus performant&nbsp;: le fait de traiter le marquage des objets par page plutôt que de faire des jumps fréquent dans la mémoire. Ainsi, on profite davantage des caches L1 et L2 des CPUs modernes.

Très intéressant et expliquer clairement comme souvent dans les talks de Jesús.

# [Inside Reflection - Valentyn Yukhymenko](https://fosdem.org/2026/schedule/event/JQRUHP-inside-of-reflection-in-go/)

Valentyn plonge dans les arcanes du package de Reflection de Go et nous explique en détail comment il fonctionne, ainsi qu'en expliquant le fonctionnement internes des variables qui permet ce fonctionnement (ainsi qu'au passage des choses comme le type-switching).

Très bon "deep dive" que j'ai beaucoup apprécié.

# [Understanding Why Your CPU is Slow: Hardware Performance Insights with PerfGo - Christian Simon](https://fosdem.org/2026/schedule/event/Q7R9F8-understanding_why_your_cpu_is_slow_hardware_performance_insights_with_perfgo/)

Christian nous explique pas mal de détail sur certains fonctionnements des CPUs modernes et nous montrent les éléments qui permettent de gagner parfois en performance (ou en stabilité de performance). Il prend notamment l'exemple des "tableau d'objects" vs les "objets de tableau" pour privilégier l'utilisation des caches L1 et L2 des processeurs, ou encore des prédictions de branche pour les if (comment le CPU peut privilégier telle ou telle branche de if au runtime).

Le tout pour nous présenter un outil qu'il a écrit pour automatiser son workflow autour des benchmarks, de pprof and co. Cet outil s'appelle PerfGo.

Curieux de l'essayer même si la démo n'était pas ultra claire. Il faudra peut-être que j'essaie de la revoir en replay quand il sera disponible.

# [CRA Integration – How FOSS compliance measures support CRA obligations, especially regarding documentation, security updates, and traceability - Florian Hackel & Annika Niemann](https://fosdem.org/2026/schedule/event/R98AQQ-cra_foss_compliance/)

Comme je le disais plus haut, je ne connaissais pas le CRA (Cyber Resiliency Act). Et dans ce talk, 2 avocats viennent présenter l'impact de cette loi sur l'open source en général, que ce soit des développeurs de librairies ou de logiciel, avec ou sans développement commercial derrière.

Alors, clairement, j'étais dépassé par le sujet donc je n'ai pas tout compris et ça vaudra peut-être le coup de me le refaire en replay. Mais en gros, ce qu'ils préconisent c'est de mettre en place des SBOM sur les logiciels afin de faciliter la traçabilité des vulnérabilités, et de faire du tri dans les risques (pour ce qui est de logiciels utilisés en interne dans une société, les risques peuvent être moins grands que lorsque le produit est diffusé à des utilisateurs finaux par exemple).

# [Implementing the Cyber Resilience Act - engaging with open source - Carl-Daniel Hailfinger, Filipe Jones Mourao, Lucia Lanfri & Laure Pourcin](https://fosdem.org/2026/schedule/event/EERURR-implementing_the_cyber_resilience_act_-_engaging_with_open_source/)

J'aurais préféré avoir cette présentation avant :sweat_smile:. Ce talk est présenté par des personnes travaillant dans les instances européennes et chargées de la mise en application et la standardisation autour du CRA.

Filipe est d'abord revenu sur cette loi européenne votée en 2024, et insiste sur le fait que **les développeurs open-source qui ne tireraient pas de bénéfice commercial de leur développements ne sont pas concernés**. Si des vulnérabilités sont relevées dans un de leur développements, les entreprises ont le devoir d'informer le mainteneur, de fournir **gratuitement** un patch s'elle en a un, mais le mainteneur n'a aucune obligation de le prendre en compte (plutôt cool si on parle d'un développement fait des années auparavant par exemple).

Des standardisations sont en cours pour des catégories de logiciels (ex&nbsp;: navigateurs, librairies,...) et même de matériels (routeurs,...). Pour l'open-source, des représentant de fondations importantes (Eclipse Foundation, Linux Foundation, OSi, Mozilla,...) sont dans les process mais il est encore possible de s'impliquer (mais ça va vite fermer).

Encore une fois, pas sûr d'avoir tout compris, et c'est un discours plutôt côté législateur, donc à prendre comme il se doit. Peut-être que s'informer davantage sur le sujet est important.

# That's all folks!

C'est tout pour cette année&nbsp;! Ce fut encore une fois une édition très intéressante. Ce que je trouve génial là-bas c'est&nbsp;:

* L'anonymat&nbsp;: pas besoin de s'enregistrer, on se pointe et voilà&nbsp;!
* La diversité des sujets&nbsp;: il y a des devrooms sur des sujets aussi divers que des langages de programmation, des matériels pointus (ex&nbsp;: RISC-V), des domaines spécifiques (ex&nbsp;: OpenTransport, du traitement du signal audio/video, du retrocomputing)
* L'ouverture&nbsp;: cette année j'ai croisé des gens qui venaient aux conférences avec leur bébé qui devait avoir quelques semaines, des gens avec des oreilles de renard sur la tête, sans parler de la horde de gens de VLC avec leur chapeau en forme de cône de travaux
* Les discussions de partout&nbsp;: dans les bars de l'université, dans les couloirs, dans les files d'attente des food-trucks,...
* La reconnaissance&nbsp;: c'est l'occasion de promouvoir le boulot souvent bénévole de tas de gens à travers le monde. Le meilleur exemple que j'ai vu est un speaker qui fait applaudir une personne qui va lui poser une question car c'était l'auteur d'un plugin très utilisé dans wordpress pour le fediverse.

Bref, tout ça donne une ambiance plus que bonenfant, un lieu où lon aimerait rester plus longtemps, et donc qui donne envie d'y retourner. Alors à l'année prochaine FOSDEM, si les dieux du libre le veulent bien.

