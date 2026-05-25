import SwiftUI

struct ListaView: View {
    // Mantemos a fonte da lista em um unico lugar para crescer sem duplicar navegacao.
    private let programas = [naruto, avatar, strangerThings]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(Array(programas.enumerated()), id: \.offset) { _, programa in
                        NavigationLink {
                            ProgramaDetailView(programa: programa)
                        } label: {
                            ShowCard(programa: programa)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Programas")
        }
    }
}

#Preview {
    ListaView()
}
