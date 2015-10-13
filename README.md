# MVAcknowledgmentIOS

To create the Acknowledgment file

1) Download script.
2) Change permission to 755 (chmod 755 MVAckGenerator.sh)
3) Place all license files in same folder.
4) Name each file as "PackageName.license"
5) Run the script ./MVAckGenerator.sh
6) Ack.plist will be created.

Adding to IOS Setting bundle
1) Open Settings Bundle in IOS
2) Drag and drop, "Ack.plist" under settings.bundle
3) Right click on Root.plist and open as source.
Paste following code at bottom of file just before inside valid section
 <dict>
            <key>Type</key>
            <string>PSChildPaneSpecifier</string>
            <key>Title</key>
            <string>Acknowledgements</string>
            <key>File</key>
            <string>Ack</string>
            <key>Key</key>
            <string>Acks</string>
        </dict>
4) Build and Run.
