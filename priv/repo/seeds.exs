alias Rir.Repo

Mix.shell.info "Seeding Application..."

member1 = %Member{
  first_name: "Wolfhard",
  last_name: "Gosewisch",
  email: "gosewisch@rae-cmg.de",
  image_url: "//c2.staticflickr.com/6/5647/21731807740_f0f9e92fe3_h.jpg",
  content: "In kürze werde ich mich hier detailierter Vorstellen." <>
           " Zur Zeit ist das hier allerdings leider noch eine Baustelle"
}

member2 = %Member{
  first_name: "Nikolaus",
  last_name: "Christ",
  email: "christ@rae-cmg.de",
  image_url: "//c2.staticflickr.com/6/5691/21929621351_8dde178d55_h.jpg",
  content: "In kürze werde ich mich hier detailierter Vorstellen." <>
           " Zur Zeit ist das hier allerdings leider noch eine Baustelle"
}

member3 = %Member{
  first_name: "Manfred",
  last_name: "Maleika",
  email: "maleika@rae-cmg.de",
  image_url: "//c2.staticflickr.com/6/5774/21732034798_ca856089b9_h.jpg",
  content: "In kürze werde ich mich hier detailierter Vorstellen." <>
           " Zur Zeit ist das hier allerdings leider noch eine Baustelle"
}

Enum.each([member1, member2, member3], fn(item) ->
  Repo.insert!(item) end
)

changeset = Rir.User.changeset(
  %Rir.User{}, %{ password: "cmgcmgcmg", email: "gosewisch@rae-cmg.de" }
)

Rir.User.create(changeset)

bar_association = %{
    name: "  Rechtsanwaltskammer Köln ",
    street: "Riehler Straße 30",
    postal_code: " 50668",
    town: "Köln ",
    phone: "0221/973010-0",
    fax: "0221/973010-50",
    mail: "kontakt@rak-koeln.de",
    web: "http://www.rak-koeln.de"
  }

liability_insurance = %{
  name: "Allianz Versicherungs-AG",
  postal_code: "10900",
  town: "Berlin",
  phone: "+49 (0)40 6946933735"
}

impressum_changeset = Rir.Impressum.changeset(
  %Rir.Impressum{},
  %{
    guarantor: "  Rechtsanwalt Wolfhard Gosewisch",
    fax: "02205/84065 ",
    phone: "02205/83396 ",
    street: "Hauptstr. 18",
    town: "51503 Rösrath",
    mail: "info@rae-cmg.de",
    web: "www.recht-in-roesrath.de",
    turnover_tax_nr: "204/5054/0698",
    turnover_tax_id: "fehlt",
    lawyer_info: "Die Rechtsanwälte Nikolaus Christ, Manfred Maleika und " <>
                 "Wolfhard Gosewisch sind in der Bundesrepublik Deutschland " <>
                 "als Rechtsanwälte zugelassen und gehören der " <>
                 "Rechtsanwaltskammer Köln an. Die gesetzliche " <>
                 "Berufsbezeichnung \"Rechtsanwalt\" wurde ihnen in der " <>
                 "Bundesrepublik Deutschland verliehen, " <>
                 "(§ 5 Abs. 1 Nr. 5b TMG).",
    additional_information: "Die auf dem Server bereitgestellten Angaben " <>
                            "wurden sorgfältig geprüft. Dessen ungeachtet " <>
                            "kann keine Gewähr für die Korrektheit, " <>
                            "Vollständigkeit, Qualität oder letzte " <>
                            "Aktualität der Angaben bzw. bereitgestellten " <>
                            "Informationen übernommen werden.",
    copyright: "Sämtliche auf dieser Homepage verwendeten Texte, Bilder, " <>
               "Grafiken sowie Layout dieser Seiten unterliegen dem " <>
               "weltweit geltenden Urheberrecht. Die unerlaubte Verwendung, " <>
               "Reproduktion oder Weitergabe einzelner Inhalte oder " <>
               "kompletter Seiten werden sowohl straf- als auch " <>
               "zivilrechtlich verfolgt. So besteht allein auf " <>
               "zivilrechtlicher Grundlage die Möglichkeit die Unterlassung " <>
               "und Schadenersatz, die Überlassung oder die Vernichtung der " <>
               "Vervielfältigungsvorrichtungen zu verlangen. Für den Fall " <>
               "der Zuwiderhandlung können Unterlassungsansprüche durch die " <>
               "zuständigen Gerichte mit Ordnungsgeldern bis zu 250.000,00 " <>
               "Euro oder Ordnungshaft bis zu sechs Monaten geahndet werden.",
    bar_association: bar_association,
    liability_insurance: liability_insurance
  }
)

impressum = Repo.insert!(impressum_changeset)

article1 = %Rir.Article{
  header: "Lorem Ipsum",
  content: "Lorem ipsum Elit amet voluptate Ut ut sint sit nulla irure amet " <>
           "et laboris laboris consequat do proident et mollit magna " <>
           "cupidatat eu in esse sint aute cillum esse sit Duis aliqua qui " <>
           "laboris occaecat Duis velit dolor dolor non nisi dolore ut anim " <>
           "labore in ut dolor ad ex Excepteur dolor in Duis deserunt " <>
           "pariatur officia sint Duis Duis sit non enim ad reprehenderit " <>
           "aute qui adipisicing do do dolore ut sint ut pariatur in aliqua " <>
           "dolor ad ad nisi exercitation consectetur quis occaecat laboris "<>
           "adipisicing Excepteur et nisi dolore dolore nulla pariatur " <>
           "nostrud dolor labore ut eu consequat sed tempor irure deserunt " <>
           "anim ut fugiat labore ea in dolor deserunt est cillum sit sit "<>
           "Duis ut cupidatat non consectetur amet dolore eu exercitation " <>
           "fugiat sunt Excepteur adipisicing labore Duis ullamco dolor " <>
           "quis commodo sit ut reprehenderit id sit id ut Ut nisi cillum "<>
           "est laborum et fugiat in officia elit in.",
  hot_topic: true
}
article2 = %Rir.Article{
  header: "Lorem Ipsum2",
  content: "Lorem ipsum Elit amet voluptate Ut ut sint sit nulla irure amet " <>
           "et laboris laboris consequat do proident et mollit magna " <>
           "cupidatat eu in esse sint aute cillum esse sit Duis aliqua qui " <>
           "laboris occaecat Duis velit dolor dolor non nisi dolore ut anim " <>
           "labore in ut dolor ad ex Excepteur dolor in Duis deserunt " <>
           "pariatur officia sint Duis Duis sit non enim ad reprehenderit " <>
           "aute qui adipisicing do do dolore ut sint ut pariatur in aliqua " <>
           "dolor ad ad nisi exercitation consectetur quis occaecat laboris "<>
           "adipisicing Excepteur et nisi dolore dolore nulla pariatur " <>
           "nostrud dolor labore ut eu consequat sed tempor irure deserunt " <>
           "anim ut fugiat labore ea in dolor deserunt est cillum sit sit "<>
           "Duis ut cupidatat non consectetur amet dolore eu exercitation " <>
           "fugiat sunt Excepteur adipisicing labore Duis ullamco dolor " <>
           "quis commodo sit ut reprehenderit id sit id ut Ut nisi cillum "<>
           "est laborum et fugiat in officia elit in.",
  hot_topic: true
}
article3 = %Rir.Article{
  header: "Lorem Ipsum3",
  content: "Lorem ipsum In et nostrud nostrud dolor do magna et ut ullamco " <>
           "ut ea id ex eu ad ullamco fugiat qui elit aliqua minim deserunt " <>
           "sit voluptate magna officia sed qui velit in ut officia Duis ad " <>
           "ex cupidatat sunt consectetur magna laborum cupidatat tempor " <>
           "veniam esse Duis in in deserunt amet ut dolor pariatur dolore " <>
           "dolore ut deserunt eiusmod amet commodo in cupidatat ex " <>
           "Excepteur veniam deserunt Ut qui mollit in exercitation esse " <>
           "Excepteur eiusmod fugiat irure irure nisi Excepteur veniam " <>
           "voluptate nostrud nulla dolor irure eu nulla occaecat irure " <>
           "dolore minim ullamco laboris nulla ullamco et eiusmod dolore " <>
           "Duis quis dolore in anim voluptate quis dolore ut est Duis est " <>
           "consectetur ullamco amet elit sed ut pariatur labore eiusmod " <>
           "dolore aute labore proident Excepteur nostrud sunt veniam " <>
           "proident occaecat cupidatat Ut enim ullamco dolore id laboris " <>
           "officia in commodo incididunt aliquip cillum voluptate ea et " <>
           "nostrud Excepteur pariatur velit nulla exercitation deserunt " <>
           "minim fugiat minim incididunt non proident labore Ut ea nisi " <>
           "adipisicing deserunt incididunt in sint consequat ullamco velit " <>
           "do id occaecat non irure proident est qui aliquip tempor aliqua " <>
           "in commodo Duis minim. \n" <>
           "Lorem ipsum Elit amet voluptate Ut ut sint sit nulla irure amet " <>
           "et laboris laboris consequat do proident et mollit magna " <>
           "cupidatat eu in esse sint aute cillum esse sit Duis aliqua qui " <>
           "laboris occaecat Duis velit dolor dolor non nisi dolore ut anim " <>
           "labore in ut dolor ad ex Excepteur dolor in Duis deserunt " <>
           "pariatur officia sint Duis Duis sit non enim ad reprehenderit " <>
           "aute qui adipisicing do do dolore ut sint ut pariatur in aliqua " <>
           "dolor ad ad nisi exercitation consectetur quis occaecat laboris "<>
           "adipisicing Excepteur et nisi dolore dolore nulla pariatur " <>
           "nostrud dolor labore ut eu consequat sed tempor irure deserunt " <>
           "anim ut fugiat labore ea in dolor deserunt est cillum sit sit "<>
           "Duis ut cupidatat non consectetur amet dolore eu exercitation " <>
           "fugiat sunt Excepteur adipisicing labore Duis ullamco dolor " <>
           "quis commodo sit ut reprehenderit id sit id ut Ut nisi cillum "<>
           "est laborum et fugiat in officia elit in. \n" <>
           "Lorem ipsum Elit amet voluptate Ut ut sint sit nulla irure amet " <>
           "et laboris laboris consequat do proident et mollit magna " <>
           "cupidatat eu in esse sint aute cillum esse sit Duis aliqua qui " <>
           "laboris occaecat Duis velit dolor dolor non nisi dolore ut anim " <>
           "labore in ut dolor ad ex Excepteur dolor in Duis deserunt " <>
           "pariatur officia sint Duis Duis sit non enim ad reprehenderit " <>
           "aute qui adipisicing do do dolore ut sint ut pariatur in aliqua " <>
           "dolor ad ad nisi exercitation consectetur quis occaecat laboris "<>
           "adipisicing Excepteur et nisi dolore dolore nulla pariatur " <>
           "nostrud dolor labore ut eu consequat sed tempor irure deserunt " <>
           "anim ut fugiat labore ea in dolor deserunt est cillum sit sit "<>
           "Duis ut cupidatat non consectetur amet dolore eu exercitation " <>
           "fugiat sunt Excepteur adipisicing labore Duis ullamco dolor " <>
           "quis commodo sit ut reprehenderit id sit id ut Ut nisi cillum "<>
           "est laborum et fugiat in officia elit in.",
  hot_topic: false
}
article4 = %Rir.Article{
  header: "Lorem Ipsum4",
  content: "Lorem ipsum Elit amet voluptate Ut ut sint sit nulla irure amet " <>
           "et laboris laboris consequat do proident et mollit magna " <>
           "cupidatat eu in esse sint aute cillum esse sit Duis aliqua qui " <>
           "laboris occaecat Duis velit dolor dolor non nisi dolore ut anim " <>
           "labore in ut dolor ad ex Excepteur dolor in Duis deserunt " <>
           "pariatur officia sint Duis Duis sit non enim ad reprehenderit " <>
           "aute qui adipisicing do do dolore ut sint ut pariatur in aliqua " <>
           "dolor ad ad nisi exercitation consectetur quis occaecat laboris "<>
           "adipisicing Excepteur et nisi dolore dolore nulla pariatur " <>
           "nostrud dolor labore ut eu consequat sed tempor irure deserunt " <>
           "anim ut fugiat labore ea in dolor deserunt est cillum sit sit "<>
           "Duis ut cupidatat non consectetur amet dolore eu exercitation " <>
           "fugiat sunt Excepteur adipisicing labore Duis ullamco dolor " <>
           "quis commodo sit ut reprehenderit id sit id ut Ut nisi cillum "<>
           "est laborum et fugiat in officia elit in.",
  hot_topic: true
}

Enum.each([article1, article2, article3, article4], fn(item) ->
  Repo.insert!(item) end
)

Mix.shell.info "Done"


# Rechtsanwaltskammer Köln Riehler Straße 30 50668 Köln Tel.: 0221/973010-0 Fax: 0221/973010-50  E-Mail: kontakt@rak-koeln.de Homepage: http://www.rak-koeln.de  Die Tätigkeit der Rechtsanwälte, die auf dieser Homepage vorgestellt werden, unterliegt den folgenden berufsrechtlichen Regelungen:  Bundesrechtsanwaltsordnung (BRAO), Berufsordnung für Rechtsanwälte (BORA), Fachanwaltsordnung (FAO), Standesregelung der Rechtsanwälte in der Europäischen Gemeinschaft (CCBE-Berufsregeln), Bundesrechtsanwaltsgebührenordnung (BRAGO), Rechtsanwaltsvergütungsgesetz (RVG).  Den Text dieser Vorschriften finden Sie auf der Homepage der Bundesrechtsanwaltskammer (BRAK): www.brak.de.

# Redaktionell verantwortlich:  Rechtsanwalt Wolfhard Gosewisch
# Hauptstr. 18
# 51503 Rösrath  Tel.: 02205/83396 
# Fax: 02205/84065 eMail: info@rae-cmg.de
#  Web: www.recht-in-roesrath.de  
# Umsatzsteuer-Nr.: 204/5054/0698;
# USt-IdNr.: folgt
# Pflichtangaben gem. § 5 TDG (2007)
