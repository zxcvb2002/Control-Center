//
//  ContentView.swift
//  CTProject12
//
//  Created by 드즈 on 2023/01/07.
//

import SwiftUI
// import CoreData

// let Lists/*:Dictionary*/ = ["Accessibility Shortcuts", "Alarm", "Apple Tv Remote", "Calculator", "Camera", "Code Scanner", "Dark Mode", "Flashlight", "Guided Access", "Hearing", "Home", "Lower Power Mode", "Magnifier", "Music Recognition", "Notes", "Quick Notes", "Screen Recording", "Sound Recognition", "Stopwatch", "Text Size", "Timer", "Voice Memos", "Wallet"]

// let Icons = ["figure.wave.circle", "alarm.fill", "appletvremote.gen4.fill", "lanyardcard.fill", "camera.fill", "qrcode.viewfinder", "circle.righthalf.filled", "flashlight.on.flll", "lock.square", "ear", "homekit", "battery.50", "plus.magnifyingglass", "shazam.logo.fill", "note.text.badge.plus", "note.text", "record.circle", "waveform.and.magnifyingglass", "stopwatch.fill", "textformat.size", "timer", "waveform.path", "tray.full.fill"]

struct ContentView: View {
    
    struct TodoItem: Identifiable {
        var id: UUID = UUID()
        var controlName: String
        var iconName: String
        var backColor: Color
    }
    
    @State var listData: [TodoItem] = [
        TodoItem(controlName: "Accessibility Shortcuts", iconName: "figure.wave.circle", backColor: .blue),
        TodoItem(controlName: "Alarm", iconName: "alarm.fill", backColor: .orange),
        TodoItem(controlName: "Apple Tv Remote", iconName: "appletvremote.gen4.fill", backColor: .gray),
        TodoItem(controlName: "Calculator", iconName: "lanyardcard.fill", backColor: .orange),
        TodoItem(controlName: "Camera", iconName: "camera.fill", backColor: .orange),
        TodoItem(controlName: "Code Scanner", iconName: "qrcode.viewfinder", backColor: .gray),
        TodoItem(controlName: "Dark Mode", iconName: "circle.righthalf.filled", backColor: .black),
        TodoItem(controlName: "Flashlight", iconName: "flashlight.on.fill", backColor: .blue),
        TodoItem(controlName: "Guided Access", iconName: "lock.square", backColor: .black),
        TodoItem(controlName: "Hearing", iconName: "ear", backColor: .blue),
        TodoItem(controlName: "Home", iconName: "homekit", backColor: .orange),
        TodoItem(controlName: "Lower Power Mode", iconName: "battery.50", backColor: .orange),
        TodoItem(controlName: "Magnifier", iconName: "plus.magnifyingglass", backColor: .black),
        TodoItem(controlName: "Music Recognition", iconName: "shazam.logo.fill", backColor: .blue),
        TodoItem(controlName: "Notes", iconName: "note.text.badge.plus", backColor: .yellow),
        TodoItem(controlName: "Quick Notes", iconName: "note.text", backColor: .yellow),
        TodoItem(controlName: "Screen Recording", iconName: "record.circle", backColor: .red),
        TodoItem(controlName: "Sound Recording", iconName: "waveform.and.magnifyingglass", backColor: .pink),
        TodoItem(controlName: "Stopwatch", iconName: "stopwatch.fill", backColor: .orange),
        TodoItem(controlName: "Text Size", iconName: "textformat.size", backColor: .blue),
        TodoItem(controlName: "Timer", iconName: "timer", backColor: .orange),
        TodoItem(controlName: "Voice Memos", iconName: "waveform.path", backColor: .red),
        TodoItem(controlName: "Wallet", iconName: "tray.full.fill", backColor: .green),
    ]
    
    @State var accessWithinApps = false
    @State var showHomeControls = false
    
    @ScaledMetric var size: CGFloat = 1
    
    var body: some View {
        
        NavigationView {
            
            List /* Form */ {
                
                /*
                Section {
                    
                }
                */
                
                Section {
                
                } header: {
                    Text("Swipe down from the top-right edge to open Control Center")
                }
                .textCase(nil)
                .padding(-5)
                
                Section {
                    Toggle("Access Within Apps", isOn: $accessWithinApps)
                } footer: {
                    Text("Allow access to Control Center within apps. When disabled, you can still access Control Center from the Home Screen.")
                }
                .padding(15)
                .textCase(nil)
                .listRowInsets(.init(top: -10, leading: 0, bottom: -10, trailing: 0))
                
                Section {
                    Toggle("Show Home Controls", isOn: $showHomeControls)
                } footer: {
                    Text("Include recommended controls for Home accessories and scenes")
                }
                .padding(15)
                .textCase(nil)
                .listRowInsets(.init(top: -10,leading: 0, bottom: -10, trailing: 0))
                
                Section {
                    /*
                    ForEach(Lists, id: \.self) { list in
                        HStack {
                            Label {
                                Text(list)
                            } icon : {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                                // Image(systemName: "")
                            }
                            Spacer()
                            Image(systemName: "line.3.horizontal")
                        }
                    }
                    */
                } header: {
                    Text("INCLUDED CONTROLS")
                }
                .listStyle(InsetGroupedListStyle())
                
                Section {
                    ForEach(listData/*Lists*//*, id: \.self*/) { item in
                        HStack {
                            
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                            
                            Image(systemName: item.iconName)
                                .imageScale(.large)
                                .font(.system(size: 15))
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                                .background(item.backColor)
                                .cornerRadius(7.5)
                            
                            Text(item.controlName)
                            
                            Spacer()
                            
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.gray)
                            
                            /*
                             Label {
                                Image(systemName: item.iconName)
                                Text(item.controlName) //Text(item)
                            } icon : {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                Image(systemName: item.iconName)
                                    .foregroundColor(.white)
                                    .background(item.backColor)
                                    .cornerRadius(5)
                                    .imageScale(.large)
                             }
                             */
                        }
                    }
                    //.onDelete(perform: deleteItem)
                    //.onDelete(perform: todoList.deleteActiveTodos(atOffsets:))
                    //.onMove(perform: moveItem)
                    //.onMove(perform: todoList.moveActiveTodos(fromOffsets:toOffset:))
                } header: {
                    Text("MORE CONTROLS")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    HStack {
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "chevron.left")
                                    .bold()
                                    .padding(-5)
                                Text("Settings")
                            }
                        }
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Control Center")
                        .bold()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



// 사용자 레이블 스타일 생성 - Colorful 아이콘 스타일
struct ColorfulIconLabelStyle: LabelStyle {
    var color: Color
    var size: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        Label {
            configuration.title
        } icon: {
            configuration.icon
                .imageScale(.small)
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 7 * size)
                .frame(width: 28 * size, height: 28 * size)
                .foregroundColor(color))
        }
    }
}
