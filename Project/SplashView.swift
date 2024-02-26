import SwiftUI

struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        VStack {
            if isActive {
                HomeView() // Navigate to your app's home screen
            } else {
                ZStack {
                    Color.white.edgesIgnoringSafeArea(.all)

                    VStack(spacing: 20) {
                        Image(systemName: "bag.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .foregroundColor(.blue)
                        Text("Shopping List")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary) 
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
        .transition(.asymmetric(insertion: .opacity, removal: .scale)) // Smooth transition
    }
}
