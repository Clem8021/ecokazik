class InstrumentsController < ApplicationController
  def index
    @instruments = [
      {
        name: "Piano",
        emoji: "🎹",
        description: "Idéal pour développer l’oreille, l’harmonie et la coordination."
      },
      {
        name: "Batterie",
        emoji: "🥁",
        description: "Parfait pour travailler le rythme, l’énergie et le jeu en groupe."
      },
      {
        name: "Djembé",
        emoji: "🪘",
        description: "Percussion parfaite pour le sens du groove et le jeu collectif."
      },
      {
        name: "Basse",
        emoji: "🎸",
        description: "La colonne vertébrale du groupe, entre rythme et harmonie."
      },
      {
        name: "Guitare",
        emoji: "🎸",
        description: "Accompagnement, riffs, solos… un instrument ultra polyvalent."
      },
      {
        name: "Ukulélé",
        emoji: "🎸",
        description: "Petit format, grosses vibes – idéal pour débuter tout en douceur."
      },
      {
        name: "Chant",
        emoji: "🎤",
        description: "Confiance en soi, interprétation, respiration et présence scénique."
      },
      {
        name: "Saxophone",
        emoji: "🎷",
        description: "Un son chaud pour le jazz, la pop et les musiques actuelles."
      }
    ]
  end
end
