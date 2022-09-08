import SwiftUI

struct LoginView: View {
    struct Model {
        let title: String
        let loginTitle: String
        let loginPlaceholder: String
        let passwordTitle: String
        let passwordPlaceholder: String
        let buttonTitle: String
        let link: NSAttributedString
    }
    
    private let viewModel: LoginViewModel
    @State private var email: String?
    @State private var password: String?
    
    private enum Constants {
        static let topPadding: CGFloat = 55
        static let smallSpacing: CGFloat = 8
        static let spacing: CGFloat = 16
        static let bigSpacing: CGFloat = 44
        static let padding: CGFloat = 24
    }
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        viewModel.loadModel()
    }
    
    var body: some View {
        VStack(
            alignment: .leading
        ) {
            Text(viewModel.model?.title ?? "")
                .foregroundColor(Color.textColor)
                .font(.title2)
                .padding([.top], Constants.topPadding)
                        
            Text(viewModel.model?.loginTitle ?? "")
                .font(.callout)
                .foregroundColor(Color.textColor)
                .padding([.top], Constants.topPadding)
            
            InputField(
                placeholder: viewModel.model?.loginPlaceholder,
                rightItem: nil,
                leftItem: nil,
                isSecuredEntry: false,
                handleLeftTap: {},
                delegate: nil,
                text: $email
            )
            .frame(height: .defaultControlHeight, alignment: .leading)
                .background(
                    RoundedRectangle(
                        cornerRadius: .defaultCornerRadius,
                        style: .continuous
                    ).fill(Color.textFieldBackgroundColor)
                )
                .background(
                    RoundedRectangle(
                        cornerRadius: .defaultCornerRadius,
                        style: .continuous
                    )
                    .stroke(
                        viewModel.error != nil ? Color.errorColor : Color.clear, lineWidth: 1
                    )
                )
            
            Text(viewModel.model?.passwordTitle ?? "")
                .font(.callout)
                .foregroundColor(Color.textColor)
                .padding([.top], Constants.spacing)
            
            InputField(
                placeholder: viewModel.model?.passwordPlaceholder,
                rightItem: UIImage(systemName: "eye"),
                leftItem: nil,
                isSecuredEntry: true,
                handleLeftTap: {},
                delegate: nil,
                text: $password
            )
            .frame(height: .defaultControlHeight, alignment: .leading)
            .background(
                RoundedRectangle(
                    cornerRadius: .defaultCornerRadius,
                    style: .continuous
                ).fill(Color.textFieldBackgroundColor)
            )
            .background(
                RoundedRectangle(
                    cornerRadius: .defaultCornerRadius,
                    style: .continuous
                ).stroke(
                    viewModel.error != nil ? Color.errorColor : Color.clear, lineWidth: 1
                )
            )
            
            Button(
                action: {
                    self.viewModel.handleLoginButtonTap()
                },
                label: { Text(viewModel.model?.buttonTitle ?? "")
                        .frame(
                            minWidth: .zero,
                            maxWidth: .infinity,
                            maxHeight: .defaultControlHeight,
                            alignment: .center
                        )
                        .foregroundColor(.buttonTitleColor)
                })
            .font(.callout)
            .background(Color.primaryColor)
            .cornerRadius(.defaultCornerRadius)
            .padding([.top], Constants.bigSpacing)
            Text(viewModel.error ?? "")
                .font(.body)
                .foregroundColor(Color.errorColor)
            Spacer()
            Divider()
            
            HStack(alignment: .center) {
                Spacer()
                AttributedText(viewModel.model?.link ?? NSAttributedString(string: ""))
                    .gesture(TapGesture().onEnded(viewModel.showWebsite))
                Spacer()
            }
            .padding([.bottom], Constants.padding)
        }
        .frame(width: UIScreen.main.bounds.width - 32)
        .padding([.leading, .trailing], Constants.padding)
        .background(Color.backgroundColor)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(
            userAPIManager: UserAPIManagerImpl(apiClient: APIClient(baseURL: "")),
            showWebsite: {},
            showEventList: {}
        ))
    }
}
