import SwiftUI

struct ShowCard: View {
    let programa: Programa
 
    var body: some View {
        HStack(spacing: 12) {
            // A barra lateral identifica rapidamente a categoria sem depender de texto.
            Rectangle()
                .fill(programa.tipoColor)
                .frame(width: 6)
                .clipShape(Capsule())
            
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(programa.tipoColor.opacity(0.16))
                
                Image(systemName: programa.tipoIcone)
                    .font(.system(size: 28, weight: .semibold))
                    .foregroundStyle(programa.tipoColor)
            }
            .frame(width: 72, height: 72)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(programa.tipo)
                    .font(.caption2.weight(.semibold))
                    .foregroundStyle(programa.tipoColor)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(programa.tipoColor.opacity(0.12))
                    .clipShape(Capsule())
                
                Text(programa.nome)
                    .font(.headline.bold())
                    .foregroundStyle(.primary)
                    .lineLimit(1)
                
                Text(programa.genero)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                
                // Estrelas em SF Symbols deixam a avaliacao com cara de interface nativa.
                HStack(spacing: 6) {
                    HStack(spacing: 1) {
                        ForEach(0..<5, id: \.self) { index in
                            Image(systemName: index < programa.estrelasPreenchidas ? "star.fill" : "star")
                                .font(.caption2)
                                .foregroundStyle(.yellow)
                        }
                    }

                    Text(programa.notaFormatada)
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.headline.weight(.semibold))
                .foregroundStyle(Color(.tertiaryLabel))
        }
        .padding(14)
        .frame(maxWidth: .infinity, minHeight: 116)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
    }
}

extension Programa {
    var tipoColor: Color {
        switch tipo {
        case "Anime":
            return .orange
        case "Desenho":
            return .blue
        case "Serie":
            return .purple
        default:
            return .gray
        }
    }
    
    var tipoIcone: String {
        switch tipo {
        case "Anime":
            return "sparkles"
        case "Desenho":
            return "paintbrush.fill"
        case "Serie":
            return "tv.fill"
        default:
            return "play.rectangle.fill"
        }
    }
    
    var estrelasPreenchidas: Int {
        min(max(Int(avaliacao.rounded()), 0), 5)
    }
    
    var notaFormatada: String {
        String(format: "%.1f", avaliacao)
    }
}

#Preview {
    ShowCard(programa: naruto)
        .padding()
        .background(Color(.secondarySystemBackground))
}
