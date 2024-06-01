# Happy Creek

## Overview

This repo contains source code for [Happy Creek](http://happy-creek.com).

Feel free to use it as a scaffold/boilerplate for a Flutter web site.

## Contribute

Contributions are appreciated. Contributors will be
listed on [this page](https://happy-creek.com/#/team).
Pick and assign to yourself one of the [not assigned issues](https://github.com/polina-c/hc/issues?q=is%3Aissue+is%3Aopen+no%3Aassignee+) to start.

## Web Site

### Hosting

To deploy code to https://happycreekweb.web.app/ (aka http://happycreek.com):

```
firebase deploy --only hosting:preview
```

To deploy code to https://happycreekweb-preview.web.app/:

```
firebase deploy --only hosting:preview
```

Firebase project: https://console.firebase.google.com/u/2/project/happycreekweb/hosting/sites/happycreekweb
About deployment targets: https://firebase.google.com/docs/cli/targets

### Generate icon

Run:

```
dart run flutter_launcher_icons
```

Read more at: https://pub.dev/packages/flutter_launcher_icons
