sylvain = Teacher.create!(
  first_name: "Sly",
  instrument: "Batterie 🥁",
  superpower: "Rythme foudroyant ⚡️",
  background: "...",
  catchphrase: "...",
)

sylvain.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/seeds/sylvain.png")),
  filename: "sylvain.png",
  content_type: "image/png"
)

clémence = Teacher.create!(
  first_name: "Clémence",
  instrument: "Piano 🎹",
  superpower: "Arpèges cosmiques 🌌",
  background: "Évadée vaillante du <strong>conservatoire classique </strong>, elle a étudié le <strong> jazz & l'électroacoustique </strong> et donne des cours depuis <strong> plus de 15 ans </strong>.",
  catchphrase: "On ne nait pas musicien, on le devient !",
  photo_url: "..."
)

clémence.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/seeds/clémence.jpg")),
  filename: "clémence.jpg",
  content_type: "image/jpeg"
)

bastien = Teacher.create!(
  first_name: "Bastien",
  instrument: "Basse 🎸",
  superpower: "... ✨",
  background: "...",
  catchphrase: "...",
  photo_url: "..."
)

bastien.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/seeds/Bastien.jpg")),
  filename: "Bastien.jpg",
  content_type: "image/jpeg"
)

Teacher.create!(
  first_name: "Vinz'",
  instrument: "Guitare 🎸",
  superpower: "... ✨",
  background: "...",
  catchphrase: "...",
  photo_url: "..."
)


Teacher.create!(
  first_name: "Vincent",
  instrument: "Guitare 🎸",
  superpower: "... ✨",
  background: "...",
  catchphrase: "...",
  photo_url: "..."
)

Teacher.create!(
  first_name: "Charlotte",
  instrument: "Chant 🎤",
  superpower: "... ✨",
  background: "...",
  catchphrase: "...",
  photo_url: "..."
)

puts "Création des témoignages..."

Testimonial.create!([
  { content: "Je prends des cours de chant depuis plus d'un an à l'Ecolazik avec Charlotte, et j'en suis très satisfait.
L'école est facile d'accès et les salles sont bien équipées.
L'approche et la pédagogie de Charlotte correspondent tout à fait à ce que je recherche, des exercices et du chant. Ce qui me permet de chanter les chansons que j'aime tout en développant ma technique.
L'ambiance est détendue et très sympathique. J'ai un grand plaisir à me rendre à mes cours.

Je vous recommande sincèrement l'école et les cours de chant.", author: "Christophe, élève en chant" },
  { content: "J'ai intégré l'école de musique grâce à la batterie en novembre 2019, j'ai découvert une super équipe, dirigé par Sylvain. La pédagogie, la passion, l'envie de transmettre sont les maitres mots de cette bande. Je me sens si bien avec eux, que depuis 2022, je suis également des cours de guitare avec Vincent.
Si vous êtes débutant ou averti je vous conseille fortement cette école", author: "Olivier, élève en batterie et guitare"},
  { content: "Super école de musique ! Mes enfants prennent des cours de batterie et de piano.
Les profs sont bienveillants et les enfants progressent vite dans la bonne humeur. Les leçons associent solfège et apprentissage de morceaux de musique. Très bonne école !", author: "Caroline, mère d'élèves" },
  { content: "Deuxième année de batterie avec Sylvain pour notre fils et déjà quelques mois de cours de chant avec Charlotte pour moi. On prévoit même de prendre des cours pour mon mari. Un accompagnement personnalisé et qui s adapte à nos besoins. Une ambiance conviviale, une équipe très pro et bienveillante. Nous conseillons en toute confiance même côté boutique en conseil, location ou achat de matériel. Le petit plus qu'on apprécie vraiment c est qu on se sent soutenu pour nous dépasser et prendre confiance en nous. Belle expérience. Merci l équipe 👍", author: "Caroline, mère d'élève" },
  { content: "Découverte d'Ecolazik par le biais de l'atelier adultes. Atelier qui m'a permis de renouer avec la musique mais surtout avec le plaisir de jouer en groupe.
Venant d'horizons et de niveaux différents, chaque professeur anime ce temps musical dans une ambiance conviviale et bienveillante avec le désir de nous faire progresser, de nous permettre de découvrir des morceaux au goût de chacun et bien sûr de les interpréter!
Belle aventure musicale que je recommande à tout âge🎶😎
Merci à toute l'équipe.", author: "Géraldine, élève en atelier" }
])

puts "Témoignages créés ✅"
