import SwiftUI

struct InfoBadge: View {
    let icone: String
    let valor: String
    let rotulo: String
    let cor: Color
    
    var body: some View {
        // Badge compacto para comparar informacoes sem transformar a tela em tabela.
        VStack(spacing: 6) {
            Image(systemName: icone)
                .font(.title3)
                .foregroundStyle(cor)
            
            Text(valor)
                .font(.subheadline.bold())
                .foregroundStyle(.primary)
                .lineLimit(1)
                .minimumScaleFactor(0.72)
            
            Text(rotulo)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity)
        .background(cor.opacity(0.12))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(cor.opacity(0.28), lineWidth: 1)
        }
        .cornerRadius(12)
    }
}

#Preview {
    HStack {
        InfoBadge(icone: "play.rectangle.fill", valor: "720", rotulo: "Episodios", cor: .orange)
        InfoBadge(icone: "rectangle.stack.fill", valor: "5", rotulo: "Temporadas", cor: .green)
        InfoBadge(icone: "checkmark.seal.fill", valor: "Concluido", rotulo: "Status", cor: .blue)
    }
    .padding()
}
