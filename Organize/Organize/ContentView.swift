//
//  ContentView.swift
//  Organize
//
//  Created by Jai Pannu on 29/01/24.
//

import SwiftUI
import SwiftData
import Foundation
import Cocoa

//Accessing Directory



class FileManagerViewModel: ObservableObject {
    @Published var selectedDirectoryURL: URL?
    @Published var directorySelected = false

    
    let folderName1 = "Images"
    let folderName2 = "Documents"
    let folderName3 = "Videos"
    let folderName4 = "Installers"
    let folderName5 = "Miscellaneous"
    let folderName6 = "Graphics"
    let folderName7 = "Coding"
    let folderName8 = "SystemFiles"
    let folderName9 = "Audio"
    
}



extension ContentView {
    
//to unwrap optional string to provide file name of selected direc to gui
    
    func name() -> String? {
        if selection {
            return(viewModel.selectedDirectoryURL?.lastPathComponent)
        }
        return " "
    }
    
}



extension ContentView {
    
    //launching finder
    
    func openDirectoryPicker() {
        let openPanel = NSOpenPanel()
        openPanel.canChooseDirectories = true
        openPanel.canChooseFiles = false
        openPanel.allowsMultipleSelection = false
     
    //If user successfully select target directory

        if openPanel.runModal() == .OK {
            
                    viewModel.selectedDirectoryURL = openPanel.urls.first
                    viewModel.directorySelected = true
                    selection = true
            
                    print("Directory selected")
            
                
                                        }
        
        //if user fails to select any directory or wants to cancel operation
        
        else        {
                    viewModel.selectedDirectoryURL = nil
                    viewModel.directorySelected = false
                    selection = false
                    print("No directory selected")
                    }
        
                            }
    
                    }



extension ContentView {
    
    //Creating new subdirectories in directory
    
    func createPhotoFolder() {
            if viewModel.directorySelected, let directoryURL = viewModel.selectedDirectoryURL {
            
            //following sub directories will be created
            
            let FolderURL1 = directoryURL.appendingPathComponent(viewModel.folderName1)
            let FolderURL2 = directoryURL.appendingPathComponent(viewModel.folderName2)
            let FolderURL3 = directoryURL.appendingPathComponent(viewModel.folderName3)
            let FolderURL4 = directoryURL.appendingPathComponent(viewModel.folderName4)
            let FolderURL5 = directoryURL.appendingPathComponent(viewModel.folderName5)
            let FolderURL6 = directoryURL.appendingPathComponent(viewModel.folderName6)
            let FolderURL7 = directoryURL.appendingPathComponent(viewModel.folderName7)
            let FolderURL8 = directoryURL.appendingPathComponent(viewModel.folderName8)
            let FolderURL9 = directoryURL.appendingPathComponent(viewModel.folderName9)

            //mkdir
            
            do {
                try FileManager.default.createDirectory(at: FolderURL1, withIntermediateDirectories: true, attributes: nil)
                try FileManager.default.createDirectory(at: FolderURL2, withIntermediateDirectories: true, attributes: nil)
                try FileManager.default.createDirectory(at: FolderURL3, withIntermediateDirectories: true, attributes: nil)
                try FileManager.default.createDirectory(at: FolderURL4, withIntermediateDirectories: true, attributes: nil)
                try FileManager.default.createDirectory(at: FolderURL5, withIntermediateDirectories: true, attributes: nil)
                try FileManager.default.createDirectory(at: FolderURL6, withIntermediateDirectories: true, attributes: nil)
                try FileManager.default.createDirectory(at: FolderURL7, withIntermediateDirectories: true, attributes: nil)
                try FileManager.default.createDirectory(at: FolderURL8, withIntermediateDirectories: true, attributes: nil)
                try FileManager.default.createDirectory(at: FolderURL9, withIntermediateDirectories: true, attributes: nil)
                print("Success")
                
                //Creating Logic to arrange all files in already created
                //subdirectory
                
                //Images
                
                let photoFolderURL = directoryURL.appendingPathComponent("Images")

                guard let files = try? FileManager.default.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil),
                      !files.isEmpty else {
                    print("No files found in the directory.")
                    return
                }

                do {
                    try files.forEach { fileURL in
                        if fileURL.pathExtension.lowercased() == "raw" || fileURL.pathExtension.lowercased() == "psd" || fileURL.pathExtension.lowercased() == "jpeg" || fileURL.pathExtension.lowercased() == "jpg" || fileURL.pathExtension.lowercased() == "png" || fileURL.pathExtension.lowercased() == "heic"{
                            let destinationURL = photoFolderURL.appendingPathComponent(fileURL.lastPathComponent)
                            try FileManager.default.moveItem(at: fileURL, to: destinationURL)
                        }
                    }
                    print("Image files moved successfully.")
                } catch {
                    print("Error moving Image files: \(error.localizedDescription)")
                }
                 
                //Images
                
                //Audio
                
                let audioFolderURL = directoryURL.appendingPathComponent("Audio")

                guard let files = try? FileManager.default.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil),
                      !files.isEmpty else {
                    print("No files found in the directory.")
                    return
                }

                do {
                    try files.forEach { fileURL in
                        if fileURL.pathExtension.lowercased() == "midi" || fileURL.pathExtension.lowercased() == "mid" || fileURL.pathExtension.lowercased() == "mp3" || fileURL.pathExtension.lowercased() == "wma" || fileURL.pathExtension.lowercased() == "wpl" || fileURL.pathExtension.lowercased() == "wav"{
                            let destinationURL = audioFolderURL.appendingPathComponent(fileURL.lastPathComponent)
                            try FileManager.default.moveItem(at: fileURL, to: destinationURL)
                        }
                    }
                    print("Image files moved successfully.")
                } catch {
                    print("Error moving Image files: \(error.localizedDescription)")
                }
                 
                //Audio
                
                //Coding
                
                let codingFolderURL = directoryURL.appendingPathComponent("Coding")

                guard let files = try? FileManager.default.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil),
                      !files.isEmpty else {
                    print("No files found in the directory.")
                    return
                }

                do {
                    try files.forEach { fileURL in
                        if fileURL.pathExtension.lowercased() == "playground" || fileURL.pathExtension.lowercased() == "vb" || fileURL.pathExtension.lowercased() == "PHP" || fileURL.pathExtension.lowercased() == "html" || fileURL.pathExtension.lowercased() == "css" || fileURL.pathExtension.lowercased() == "js" || fileURL.pathExtension.lowercased() == "cpp" || fileURL.pathExtension.lowercased() == "xcodeproj" ||
                            fileURL.pathExtension.lowercased() == "java" || fileURL.pathExtension.lowercased() == "swift"{
                            let destinationURL = codingFolderURL.appendingPathComponent(fileURL.lastPathComponent)
                            try FileManager.default.moveItem(at: fileURL, to: destinationURL)
                        }
                    }
                    print("Code files moved successfully.")
                } catch {
                    print("Error moving Image files: \(error.localizedDescription)")
                }
                 
                //Coding
                
                //sys
                
                let sysFolderURL = directoryURL.appendingPathComponent("SystemFiles")

                guard let files = try? FileManager.default.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil),
                      !files.isEmpty else {
                    print("No files found in the directory.")
                    return
                }

                do {
                    try files.forEach { fileURL in
                        if fileURL.pathExtension.lowercased() == "dll" || fileURL.pathExtension.lowercased() == "ico" || fileURL.pathExtension.lowercased() == "msi" || fileURL.pathExtension.lowercased() == "ini" || fileURL.pathExtension.lowercased() == "sys" || fileURL.pathExtension.lowercased() == "tmp" || fileURL.pathExtension.lowercased() == "icns" || fileURL.pathExtension.lowercased() == "cfg"{
                            let destinationURL = sysFolderURL.appendingPathComponent(fileURL.lastPathComponent)
                            try FileManager.default.moveItem(at: fileURL, to: destinationURL)
                        }
                    }
                    print("Image files moved successfully.")
                } catch {
                    print("Error moving Image files: \(error.localizedDescription)")
                }
                 
                //sys
                
                //docs
                
                let docsFolderURL = directoryURL.appendingPathComponent("Documents")

                guard let files = try? FileManager.default.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil),
                      !files.isEmpty else {
                    print("No files found in the directory.")
                    return
                }

                do {
                    try files.forEach { fileURL in
                        if fileURL.pathExtension.lowercased() == "pdf" || fileURL.pathExtension.lowercased() == "docx" || fileURL.pathExtension.lowercased() == "ppt"  {
                            let destinationURL = docsFolderURL.appendingPathComponent(fileURL.lastPathComponent)
                            try FileManager.default.moveItem(at: fileURL, to: destinationURL)
                        }
                    }
                    print("Doc files moved successfully.")
                } catch {
                    print("Error moving Doc files: \(error.localizedDescription)")
                }
                
                //docs
                
                //Videos
                
                let movieFolderURL = directoryURL.appendingPathComponent("Videos")

                guard let files = try? FileManager.default.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil),
                      !files.isEmpty else {
                    print("No files found in the directory.")
                    return
                }

                do {
                    try files.forEach { fileURL in
                        if fileURL.pathExtension.lowercased() == "3gp" || fileURL.pathExtension.lowercased() == "flv" || fileURL.pathExtension.lowercased() == "vob" || fileURL.pathExtension.lowercased() == "wmv" || fileURL.pathExtension.lowercased() == "mpeg" || fileURL.pathExtension.lowercased() == "mpg" || fileURL.pathExtension.lowercased() == "mov" || fileURL.pathExtension.lowercased() == "avi" || fileURL.pathExtension.lowercased() == "mp4"  {
                            let destinationURL = movieFolderURL.appendingPathComponent(fileURL.lastPathComponent)
                            try FileManager.default.moveItem(at: fileURL, to: destinationURL)
                        }
                    }
                    print("Video files moved successfully.")
                } catch {
                    print("Error moving Video files: \(error.localizedDescription)")
                }
                
                //Videos
                
                //Setups
                
                let setupFolderURL = directoryURL.appendingPathComponent("Installers")

                guard let files = try? FileManager.default.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil),
                      !files.isEmpty else {
                    print("No files found in the directory.")
                    return
                }

                do {
                    try files.forEach { fileURL in
                        if fileURL.pathExtension.lowercased() == "bat" || fileURL.pathExtension.lowercased() == "bin" || fileURL.pathExtension.lowercased() == "wsf" || fileURL.pathExtension.lowercased() == "com" || fileURL.pathExtension.lowercased() == "apk" || fileURL.pathExtension.lowercased() == "dmg" || fileURL.pathExtension.lowercased() == "exe" || fileURL.pathExtension.lowercased() == "iso"  {
                            let destinationURL = setupFolderURL.appendingPathComponent(fileURL.lastPathComponent)
                            try FileManager.default.moveItem(at: fileURL, to: destinationURL)
                        }
                    }
                    print("Setup files moved successfully.")
                } catch {
                    print("Error moving Setup files: \(error.localizedDescription)")
                }
                
                //Setups
                
                
                //gif
                
                let gifFolderURL = directoryURL.appendingPathComponent("Graphics")

                guard let files = try? FileManager.default.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil),
                      !files.isEmpty else {
                    print("No files found in the directory.")
                    return
                }

                do {
                    try files.forEach { fileURL in
                        if fileURL.pathExtension.lowercased() == "gif"  {
                            let destinationURL = gifFolderURL.appendingPathComponent(fileURL.lastPathComponent)
                            try FileManager.default.moveItem(at: fileURL, to: destinationURL)
                        }
                    }
                    print("GIF files moved successfully.")
                } catch {
                    print("Error moving GIF files: \(error.localizedDescription)")
                }
                
                //gif
                
                
                //Missed
                
                let missedFolderURL = directoryURL.appendingPathComponent("Miscellaneous")

                guard let files = try? FileManager.default.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil),
                      !files.isEmpty else {
                    print("No files found in the directory.")
                    return
                }

                do {
                    try files.forEach { fileURL in
                        var isDirectory: ObjCBool = false
                        if FileManager.default.fileExists(atPath: fileURL.path, isDirectory: &isDirectory) {
                            // Skip directories
                            guard !isDirectory.boolValue else {
                                print("Skipping directory: \(fileURL.lastPathComponent)")
                                return
                            }
                        }
                        
                            let destinationURL = missedFolderURL.appendingPathComponent(fileURL.lastPathComponent)
                            try FileManager.default.moveItem(at: fileURL, to: destinationURL)
                        
                    }
                    print("Random files moved successfully.")
                } catch {
                    print("Error moving Random files: \(error.localizedDescription)")
                }
                
                //Missed

                
                success()
                
                
                
                // All files arranged in specified folders
                
            } catch {
                print("Error creating folder: \(error.localizedDescription)")
                errorPer()
            }
        } 
        
    }
}



struct ContentView: View {
    
    @StateObject var viewModel = FileManagerViewModel()
    
    @State var selection = false //to manage timeline/phase of program
    
    
    var body: some View {
        
        
ZStack{
            
//Z1
            Color(.white)                            //background
 
//Z2
            Image("Appleinc")                        //frame
                .resizable()
                .frame(width: 600,height: 400)       //to constaint app such that
                .padding(.all, 40.0)                 //it takes least screen space
                                                     //for user friendly ecosystem
                                                     //and high productivity
    
//Z3
    
    
VStack{
                
            Spacer(minLength: 150)                  //ValigningSpacer1
                
/*******************************************************************V1* ****************************************************************************************/
    
            HStack(spacing:40){
                    
//H1
                    //INPUT GUI
                
                    VStack{
                        
                        //folder icon
                        
                            Image(systemName: selection ? "folder.fill" : "folder.fill.badge.plus")
                                .foregroundColor(Color(red: 0.15, green: 0.441, blue: 0.814))
                                .font(.system(size: 80))
                                .contentTransition(.symbolEffect(.replace)) //animate

                        //finder opening button (Select Target)
                        
                        
                        Button(
                                        action: {
                                            explorefinder()
                                            openDirectoryPicker()
                                                },
                                        
                                label: {
                                
                                if selection{
    
                                    Text("Change")
                                        .font(.body)
                                        .fontWeight(.medium)
                                        .foregroundColor(Color(red: 0.15, green: 0.441, blue: 0.814))
                                            }
                                else {
                                    Text("Select Target")
                                        .font(.body)
                                        .fontWeight(.medium)
                                        .foregroundColor(Color(red: 0.15, green: 0.441, blue: 0.814))
                                    }
                                        }
                                        
                        )
                            .controlSize(.extraLarge) //buttonsize
                    
                        
                        }
                    
                    //INPUT GUI
                
//H2
                
                    //DESIGNING
                
                        Image(systemName: selection ? "arrow.right" :"slider.horizontal.3")
                            .foregroundColor(Color(red: 0.15, green: 0.441, blue: 0.814))
                            .font(.system(size: 80))
                            .contentTransition(.symbolEffect(.replace))
                  
                    //DESIGNING
                
//H3
                    
                    //OUTPUT GUI
                
                    VStack{
                        
                        //folder icon

                            Image(systemName: selection ? "folder.fill.badge.gearshape" : "folder.badge.gearshape")
                                .foregroundColor(Color(red: 0.15, green: 0.441, blue: 0.814))
                                .font(.system(size: 80))
                                .contentTransition(.symbolEffect(.replace))
                        
                        //Initiating Organizing

                        Button(
                                    action: {
                                        organize()
                                        createPhotoFolder()
                                            },
                                    
                            label: {
                                
                                Text("Organize")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color(red: 0.15, green: 0.441, blue: 0.814))
                                
                                    }
                                
                                ).controlSize(.extraLarge).disabled(!selection)             //controlling button accessibility
                                                                                            //button clickable only after file selection
     
                        }
                    
                            }
                
                
//HStacking Complete
    
/*******************************************************************V2* ****************************************************************************************/
    
                //Previewing Selected Directory
                
                if selection == true {
                    
                    
                    HStack
                    {
                        
                        Image(systemName: "folder.circle")
                            .foregroundColor(Color(red: 0.15, green: 0.441, blue: 0.814))
                            .font(.system(size: 20))
                        
                        Text(name() ?? " ")                             //DirectoryName
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 0.15, green: 0.441, blue: 0.814))
                        
                    }
                    
                    
                                    }
                else
                            {
                                Text(" ")                   //voidspacingadjustments
                            }
             
                  
                Spacer()                        //ValigningSpacer2
    
/*******************************************************************V3* ****************************************************************************************/
    
    
//StatusBar
        HStack{
                                           Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    
                    Text("STATUS : ")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 0.268, green: 0.667, blue: 0.912))
                    
                    
                    if selection{
                        
                        Text ("FILES READY TO BE ORGANIZED").font(.footnote)
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 0.206, green: 0.584, blue: 0.87))
                        Spacer(minLength: 400)
                        
                    }
                    else {
                        Text ("WAITING FOR TAGET DIRECTORY ")
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 0.206, green: 0.584, blue: 0.87))
                        Spacer(minLength: 393)
                    }
                    
            
            }
                
                Spacer(minLength:87)        //ValigningSpacer3
                
}       //VStacking Completed
           
}       //ZStacking Completed
        
        
                                            }               //body closed
                                      
    
    
    
//functions
    
func success(){
        
        let alert = NSAlert()
                alert.messageText = "Task Completed"
                alert.informativeText = "Status: All files in specified directory are organized into sub-directories based on .filetype"
                alert.addButton(withTitle: "OK")
                _ = alert.runModal()

        
                }
           
            
        
    
func errorPer(){
        
        let alert = NSAlert()
                alert.messageText = "Permission Required"
                alert.informativeText = "You need permission to edit the directory."
                alert.addButton(withTitle: "OK")
                _ = alert.runModal()

        
                }
 
    
    

func explorefinder(){
        
        print("finder")
        
                    }
    
    
    
    
func organize(){
        
        print("organizing")
        selection = false
        
                }
    
//functions ended
    
    
}       //content view end






#Preview {
            ContentView()
                .modelContainer(for: Item.self, inMemory: true)
}
