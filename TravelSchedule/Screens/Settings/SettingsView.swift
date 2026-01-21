//
//  SettingsView.swift
//  TravelSchedule
//
//  Created by Roman Yaschenkov on 15.12.2025.
//

import SwiftUI

struct SettingsView: View {
    private let themeManager = ThemeManager.shared
    @State var themeSelector = false
    
    init() {
        _themeSelector = .init(initialValue: themeManager.selectedAppearance == .dark)
    }
    
    var body: some View {
        ZStack {
            Color.ypWhiteAD.ignoresSafeArea()
            
            VStack {
                VStack {
                    HStack {
                        Text("DarkTheme")
                        Spacer()
                        Toggle(String.empty, isOn: $themeSelector).onChange(of: themeSelector, {
                            themeManager.selectedAppearance = themeSelector ? .dark : .light
                            themeManager.overrideDisplayMode()
                        })
                        .tint(.ypBlue)
                    }
                    
                    Button {
                        Router.shared.toAgreement()
                    } label: {
                        HStack {
                            Text("UserAgreement")
                                .font(.system(size: 17, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        .frame(height: 60)
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, 16)
                                                                                                
                Spacer()
                
                VStack {
                    Text("LegalInfo")
                        .font(.system(size: 12, weight: .regular))
                        
                    Text("Version")
                        .font(.system(size: 12, weight: .regular))
                        .padding(.top, 4)
                }
                .padding(.bottom, 16)
                                                
                Divider()
                    .overlay(.ypGrayAD)
                    .frame(minHeight: 1)
            }.padding(.top, 16)
        }
    }
}

#Preview {
    SettingsView()
}
