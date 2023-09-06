import SwiftUI

struct SubDescriptionView: View {
    
    var estrela : Estrela
    @State private var formattedTime: String = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            ZStack{
                VStack{
                    Spacer()
                    VStack(alignment: .center, spacing: 5) {
                        Spacer()
                        VStack(alignment: .center, spacing: 4) {
                            Text(estrela.reflexao.titulo)
                                .cornerRadius(8)
                                .font(
                                    Font.custom("Kodchasan", size: 18)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .padding(0)
                            
                            Text(estrela.reflexao.titulo)
                                .cornerRadius(8)
                                .font(
                                    Font.custom("Kodchasan", size: 18)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .padding(0)
                            Text(formattedTime) // Exiba o tempo formatado
                                .font(Font.custom("Inter", size: 9))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .frame(width: 124, alignment: .top)
                                .onReceive(timer) { _ in // Atualize a cada segundo
                                    formattedTime = estrela.tempoRestanteString
                                }
                        }.padding(5)
                            .padding(.top, 85/2)
                        ScrollView{
                            Text(estrela.reflexao.texto)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 10)
                                .frame(width: 260, alignment: .topLeading)
                                .foregroundColor(.black)
                        }
                        Button(action: {
                            Manager.shared.showSubView = true
                            Manager.shared.showNewView = false
                        }) {
                            Text("Adicionar nova estrela")
                                .padding(10)
                                .background(Color.black)
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        .padding(.bottom, 24)
                        .padding(.top, 10)
                    }
                    
                    .frame(width: 300, height: 445, alignment: .top)
                    .background(.white)
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.black, lineWidth: 1)
                    )
                }
                
                VStack{
                    Circle()
                        .strokeBorder(Color.white,lineWidth: 2)
                        .background(Circle().foregroundColor(Color.black))
                        .frame(width: 85, height: 85)
                    Spacer()
                }
                
            }
            .frame(width: 300, height: 487.5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
    }
}


struct SybDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(estrela: geraEstrela2())
    }
}

func geraEstrela2() -> Estrela {
    let estrela = Estrela(reflexao: Reflexao(titulo: "Tema", texto: "A amizade é uma das joias mais preciosas que podemos encontrar ao longo da vida. Ela é como um jardim que requer cuidado constante, regado com amor, confiança e apoio mútuo. Assim como as flores desabrocham e crescem com o tempo, as verdadeiras amizades também se fortalecem com as experiências compartilhadas e os desafios enfrentados juntos."), x: 0, y: 0)
    estrela.dataInicio = Date()
    return estrela
}