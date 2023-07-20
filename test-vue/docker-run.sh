#!/bin/sh
sed -i  "s|</head>|<script>\
Object.defineProperty(window, 'dockerConfig', {\
    value: {\
        API_PATH: \"$API_PATH\",\
        WORKFLOW_PATH: \"$WORKFLOW_PATH\",\
    },\
    configurable: false,\
    writable: false,\
    enumerable: false\
});\
Object.freeze(window.dockerConfig);\
</script></head>|"  /usr/share/nginx/html/index.html
nginx -g "daemon off;"