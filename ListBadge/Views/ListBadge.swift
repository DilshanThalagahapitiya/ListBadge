//
//  ListBadge.swift
//  NewOptions
//
//  Created by Dilshan Thalagahapitiya on 2025-03-07.
//

import SwiftUI

struct ListBadge: View {
    @StateObject var vm = ListBadgeVM()

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    VStack {
                        Button {
                            withAnimation {
                                if vm.isExpanded == true {
                                    vm.isExpanded = false
                                } else {
                                    if vm.newBadgeCount < vm.badgeCount {
                                        vm.isExpanded = true
                                        vm.newBadgeCount += 1
                                    }
                                }
                            }
                        } label: {
                            Text("inbox")
                                .font(.callout)
                                .foregroundStyle(Color.primary)
                                .badge(vm.badgeCount >= 0 ? vm.badgeCount - vm.newBadgeCount : 0)
                                .badgeProminence(.increased)
                        }

                        if vm.isExpanded == true {
                            Section {
                                Text("You have \(vm.badgeCount >= 0 ? vm.badgeCount - vm.newBadgeCount : 0) new messages")
                                    .font(.caption2)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    } // VStack

                    Text("defaults")
                        .font(.callout)
                        .foregroundStyle(Color.primary)
                        .badge(2)
                        .badgeProminence(.decreased)
                    Text("sent")
                        .font(.callout)
                        .foregroundStyle(Color.primary)
                        .badge(2)
                        .badgeProminence(.standard)
                    Text("drafts")
                        .font(.callout)
                        .foregroundStyle(Color.primary)
                        .badge(2)
                        .badgeProminence(.increased)
                } // List
                .padding(.top, 16)
                .listStyle(.automatic)

                Button {
                    withAnimation {
                        vm.newBadgeCount = 0
                        vm.isExpanded = false
                    }
                } label: {
                    HStack(spacing: 8) {
                        Text("Refresh")
                            .font(.title2)
                            .foregroundStyle(Color.white)
                        Image(systemName: "arrow.clockwise")
                            .font(.title2)
                            .foregroundStyle(Color.white)
                    }
                    .padding()
                }
            } // VStack
            .background(Color.teal)
            .navigationTitle("List Badge")
        } // NavigationStack
    }
}

#Preview {
    ListBadge()
}
