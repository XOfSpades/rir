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

changeset = Rir.User.changeset(
  %Rir.User{}, %{ password: "cmgcmgcmg", email: "gosewisch@rae-cmg.de" }
)
Rir.User.create(changeset, Repo)

Enum.each([member1, member2, member3], fn(item) ->
  Repo.insert!(item) end
)

bar_association = %{
    name: "  Rechtsanwaltskammer Köln ",
    street: "Riehler Straße 30",
    town: " 50668 Köln ",
    phone: "0221/973010-0",
    fax: "0221/973010-50",
    mail: "kontakt@rak-koeln.de",
    web: "http://www.rak-koeln.de"
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
    bar_association: bar_association,
    liability_insurance: "Allianz Versicherungs-AG, 10900 Berlin, " <>
                         "Telefon: +49 (0)40 6946933735",
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
               "Euro oder Ordnungshaft bis zu sechs Monaten geahndet werden."
  }
)

Repo.insert(impressum_changeset)

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
