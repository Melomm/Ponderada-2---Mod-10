import SwiftUI

struct ProgramaDetailView: View {
    @Environment(\.dismiss) private var dismiss

    let programa: Programa
    
    var body: some View {
        ScrollView {
            // Cada secao e pequena para deixar a tela facil de ajustar visualmente.
            VStack(alignment: .leading, spacing: 16) {
                hero
                
                sinopse
                
                informacoes
                
                personagens
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
    
    private var hero: some View {
        ZStack {
            LinearGradient(
                colors: [
                    programa.tipoColor.opacity(0.95),
                    programa.tipoColor.opacity(0.62)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            Image(systemName: programa.tipoIcone)
                .font(.system(size: 96, weight: .semibold))
                .foregroundStyle(.white.opacity(0.28))
            
            // O gradiente melhora a leitura do titulo sobre qualquer cor de fundo.
            LinearGradient(
                colors: [.black.opacity(0.0), .black.opacity(0.72)],
                startPoint: .center,
                endPoint: .bottom
            )
            
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                
                Text(programa.tipo)
                    .font(.caption.weight(.bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(.white.opacity(0.22))
                    .clipShape(Capsule())
                
                Text(programa.nome)
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.bottom, 24)

            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.headline.weight(.semibold))
                            .foregroundStyle(.white)
                            .frame(width: 40, height: 40)
                            .background(.black.opacity(0.28))
                            .clipShape(Circle())
                    }
                    .accessibilityLabel("Voltar")

                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top, 56)

                Spacer()
            }
        }
        .frame(height: 260)
    }
    
    private var sinopse: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Sinopse")
                .font(.title3.bold())
            
            Text(programa.sinopse)
                .font(.body)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.horizontal)
    }
    
    private var informacoes: some View {
        HStack(spacing: 10) {
            InfoBadge(
                icone: "play.rectangle.fill",
                valor: "\(programa.episodios)",
                rotulo: "Episodios",
                cor: .orange
            )
            
            InfoBadge(
                icone: "rectangle.stack.fill",
                valor: "\(programa.temporadas)",
                rotulo: "Temporadas",
                cor: .green
            )
            
            InfoBadge(
                icone: "checkmark.seal.fill",
                valor: programa.status,
                rotulo: "Status",
                cor: .blue
            )
        }
        .padding(.horizontal)
    }
    
    private var personagens: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Personagens Principais")
                .font(.title3.bold())
            
            ForEach(Array(programa.personagens.enumerated()), id: \.offset) { _, personagem in
                CharacterRow(
                    nome: personagem.nome,
                    papel: personagem.papel,
                    emoji: personagem.emoji
                )
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}

#Preview {
    NavigationStack {
        ProgramaDetailView(programa: naruto)
    }
}
