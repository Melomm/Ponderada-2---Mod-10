import SwiftUI

struct CharacterRow: View {
    let nome: String
    let papel: String
    let emoji: String
    
    var body: some View {
        HStack(spacing: 12) {
            // Iniciais reduzem a poluicao visual e ainda mantem cada personagem distinto.
            Text(iniciais)
                .font(.subheadline.weight(.bold))
                .foregroundStyle(.primary)
                .frame(width: 44, height: 44)
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .accessibilityLabel("\(nome), \(papel)")
            
            VStack(alignment: .leading, spacing: 4) {
                Text(nome)
                    .font(.headline)
                    .foregroundStyle(.primary)
                
                Text(papel)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
    }
    
    private var iniciais: String {
        let partes = nome.split(separator: " ")
        let letras = partes.prefix(2).compactMap { $0.first }
        return letras.map(String.init).joined()
    }
}

#Preview {
    CharacterRow(nome: "Naruto Uzumaki", papel: "Protagonista", emoji: "\u{1F9C6}")
        .padding()
}
