luci-app-vsftpd-wt/
├── Makefile
├── README.md
├── LICENSE
└── root/
    ├── etc/
    │   └── config/
    │       └── vsftpd                     <-- Deine WT-Konfiguration (wird im Makefile zu vsftpd.wt)
    ├── usr/
    │   └── share/
    │       ├── luci/
    │       │   └── menu.d/
    │       │       └── luci-app-vsftpd-wt.json
    │       └── rpcd/
    │           └── acl.d/
    │               └── luci-app-vsftpd-wt.json
    └── www/
        └── luci-static/
            └── resources/
                └── view/
                    └── vsftpd-wt/
                        └── vsftpd.js        <-- Verschoben von /usr/share/... nach /www/...
