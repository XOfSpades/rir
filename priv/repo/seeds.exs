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

Enum.each([member1, member2, member3], fn(item) -> Rir.Repo.insert!(item) end)

Mix.shell.info "Done"
