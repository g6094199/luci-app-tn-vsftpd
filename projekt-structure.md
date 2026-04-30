luci-app-vsftpd-wt/
├── Makefile
├── README.md
├── LICENSE
└── root/
    ├── etc/
    │   ├── config/
    │   │   └── vsftpd                     <-- Deine UCI-Konfiguration
    │   └── init.d/
    │       └── vsftpd                     <-- Das Start-Skript
    └── usr/
        └── share/
            ├── luci/
            │   ├── menu.d/
            │   │   └── luci-app-vsftpd-wt.json  <-- Ersetzt den alten Lua-Controller
            │   └── resources/
            │       └── view/
            │           └── vsftpd-wt/
            │               └── vsftpd.js        <-- Dein JavaScript-Interface
            └── rpcd/
                └── acl.d/
                    └── luci-app-vsftpd-wt.json  <-- Die Zugriffsrechte