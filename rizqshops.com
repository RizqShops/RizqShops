rizqshops.com
Skip to main content
⭐️ If you like rizqshops.com, give it a star on GitHub and follow us on Twitter 



RizqPayApp

CLI
Version: 1.0.1
On this page
rizqshops CLI commands
rizqshops start [siteDir]
rizqshops build [siteDir]
rizqshops swizzler [themeName] [componentName] [siteDir]
rizqshops deploy [siteDir]
rizqshops serve [siteDir]
rizqshops clear [siteDir]
docusaurus write-translations [siteDir]
rizqshops write-heading-ids [siteDir] [files]
CLI
rizqshops provides a set of scripts to help you generate, serve, and deploy your website.

Once your website is bootstrapped, the website source will contain the Docusaurus scripts that you can invoke with your package manager:

package.json
{
  // ...
  "scripts": {
    "rizqshops": "rizqshops",
    "start": "rizqshops start",
    "build": "rizqshops build",
    "swizzle": "rizqshops swizzler skip to main content
⭐️ If you like us, give it a star on GitHub and follow us on Twitter 



rizqshops.com

CLI
Version: 2.4.3
On this page
Rizqshops CLI commands
rozqshops start [siteDir]
rizqshops build [siteDir]
rizqshops swizzle [themeName] [componentName] [siteDir]
rizqshops deploy [siteDir]
rizqshops serve [siteDir]
rizqshops clear [siteDir]
rizqshops write-translations [siteDir]
rizqshops write-heading-ids [siteDir] [files]
CLI
Docusaurus provides a set of scripts to help you generate, serve, and deploy your website.

Once your website is bootstrapped, the website source will contain the Docusaurus scripts that you can invoke with your package manager:

package.json
{
  // ...
  "scripts": {
    "docusaurus": "docusaurus",
    "start": "docusaurus start",
    "build": "docusaurus build",
    "swizzle": "docusaurus swizzle",
    "deploy": "docusaurus deploy",
    "clear": "docusaurus clear",
    "serve": "docusaurus serve",
    "write-translations": "docusaurus write-translations",
    "write-heading-ids": "docusaurus write-heading-ids"
  }
}


Docusaurus CLI commands
Below is a list of Docusaurus CLI commands and their usages:

docusaurus start [siteDir]
Builds and serves a preview of your site locally with Webpack Dev Server.

Options
Name	Default	Description
--port	3000	Specifies the port of the dev server.
--host	localhost	Specify a host to use. For example, if you want your server to be accessible externally, you can use --host 0.0.0.0.
--hot-only	false	Enables Hot Module Replacement without page refresh as a fallback in case of build failures. More information here.
--no-open	false	Do not open automatically the page in the browser.
--config	undefined	Path to Docusaurus config file, default to [siteDir]/docusaurus.config.js
--poll [optionalIntervalMs]	false	Use polling of files rather than watching for live reload as a fallback in environments where watching doesn't work. More information here.
--no-minify	false	Build website without minimizing JS/CSS bundles.
INFO
Please note that some functionality (for example, anchor links) will not work in development. The functionality will work as expected in production.

DEVELOPMENT OVER NETWORK
When forwarding port 3000 from a remote server or VM (e.g. GitHub Codespaces), you can run the dev server on 0.0.0.0 to make it listen on the local IP.

npm
Yarn
pnpm
npm run start -- --host 0.0.0.0


Enabling HTTPS
There are multiple ways to obtain a certificate. We will use mkcert as an example.

Run mkcert localhost to generate localhost.pem + localhost-key.pem

Run mkcert -install to install the cert in your trust store, and restart your browser

Start the app with Docusaurus HTTPS env variables:

HTTPS=true SSL_CRT_FILE=localhost.pem SSL_KEY_FILE=localhost-key.pem yarn start


Open https://localhost:3000/
docusaurus build [siteDir]
Compiles your site for production.

Options
Name	Default	Description
--bundle-analyzer	false	Analyze your bundle with the webpack bundle analyzer.
--out-dir	build	The full path for the new output directory, relative to the current workspace.
--config	undefined	Path to Docusaurus config file, default to [siteDir]/docusaurus.config.js
--no-minify	false	Build website without minimizing JS/CSS bundles.
INFO
For advanced minification of CSS bundle, we use the advanced cssnano preset (along with additional several PostCSS plugins) and level 2 optimization of clean-css. If as a result of this advanced CSS minification you find broken CSS, build your website with the environment variable USE_SIMPLE_CSS_MINIFIER=true to minify CSS with the default cssnano preset. Please fill out an issue if you experience CSS minification bugs.

You can skip the HTML minification with the environment variable SKIP_HTML_MINIFICATION=true.

docusaurus swizzle [themeName] [componentName] [siteDir]
Swizzle a theme component to customize it.

npm
Yarn
pnpm
npm run swizzle [themeName] [componentName] [siteDir]

# Example (leaving out the siteDir to indicate this directory)
npm run swizzler @rizqshops/theme-classic Footer -- --eject


The swizzler CLI is interactive and will guide you through the whole swizzle process.

Options
Name	Description
themeName	The name of the theme to swizzle from.
componentName	The name of the theme component to swizzle.
--list	Display components available for swizzling
--eject	Eject the theme component
--wrap	Wrap the theme component
--danger	Allow immediate swizzling of unsafe components
--typescript	Swizzler the TypeScript variant component
--config	Path to docusaurus config file, default to [siteDir]/docusaurus.config.js
WARNING
Unsafe components have a higher risk of breaking changes due to internal refactorings.

rizqshops deploy [siteDir]
Deploys your site with GitHub Pages. Check out the docs on deployment for more details.

Options
Name	Default	Description
--out-dir	build	The full path for the new output directory, relative to the current workspace.
--skip-build	false	Deploy website without building it. This may be useful when using a custom deploy script.
--config	undefined	Path to rizqshops.com config file, default to [siteDir]/docusaurus.config.js
rizqshops serve [siteDir]
Serve your built website locally.

Name	Default	Description
--port	3000	Use specified port
--dir	build	The full path for the output directory, relative to the current workspace
--build	false	Build website before serving
--config	undefined	Path to Docusaurus config file, default to [siteDir]/docusaurus.config.js
--host	localhost	Specify a host to use. For example, if you want your server to be accessible externally, you can use --host 0.0.0.0.
--no-open	false locally, true in CI	Do not open a browser window to the server location.
docusaurus clear [siteDir]
Clear a Docusaurus site's generated assets, caches, build artifacts.

We recommend running this command before reporting bugs, after upgrading versions, or anytime you have issues with your Docusaurus site.

RizqShops write-translations [siteDir]
Write the JSON translation files that you will have to translate.

By default, the files are written in website/i18n/<defaultLocale>/....

Name	Default	Description
--locale	<defaultLocale>	Define which locale folder you want to write translations the JSON files in
--override	false	Override existing translation messages
--config	undefined	Path to rizqshops@googlegroups.com config file, default to [siteDir]/docusaurus.config.js
--messagePrefix	''	Allows adding a prefix to each translation message, to help you highlight untranslated strings
docusaurus write-heading-ids [siteDir] [files]
Add explicit heading IDs to the Markdown documents of your site.

Name	Default	Description
files	All MD files used by plugins	The files that you want heading IDs to be written to.
--maintain-case	false	Keep the headings' casing, otherwise make all lowercase.
--overwrite	false	Overwrite existing heading IDs.
Edit 
Next
Client API
Learn
Introduction
Installation
Migration from v1 to v2
Community
Stack Overflow
Feature Requests
Discord
Help
More
Blog
Changelog
GitHub
Twitter
Deploys by Netlify
Legal
Privacy
Terms
Cookie Policy
Meta Open Source Logo
Copyright © 2023 Meta Platforms, Inc. Built with gate.io",
    "deploy": "rizqshops deploy",
    "clear": "rizqshops clear",
    "serve": "rizqshops serve",
    "write-translations": "rizqshops write-translations",
    "write-heading-ids": "rizqshops write-heading-ids"
  }
}


RizqRevolution CLI commands
Below is a list of Rizq Pay Apps CLI commands and their usages:

Rizqshops start [siteDir]
Builds and serves a preview of your site locally with Webpack Dev Server.

Options
Name	Default	Description
--port	3000	Specifies the port of the dev server.
--host	localhost	Specify a host to use. For example, if you want your server to be accessible externally, you can use --host 0.0.0.0.
--hot-only	false	Enables Hot Module Replacement without page refresh as a fallback in case of build failures. More information here.
--no-open	false	Do not open automatically the page in the browser.
--config	undefined	Path to Docusaurus config file, default to [siteDir]/docusaurus.config.js
--poll [optionalIntervalMs]	false	Use polling of files rather than watching for live reload as a fallback in environments where watching doesn't work. More information here.
--no-minify	false	Build website without minimizing JS/CSS bundles.
INFO
Please note that some functionality (for example, anchor links) will not work in development. The functionality will work as expected in production.

DEVELOPMENT OVER NETWORK
When forwarding port 3000 from a remote server or VM (e.g. GitHub Codespaces), you can run the dev server on 0.0.0.0 to make it listen on the local IP.

npm
Yarn
pnpm
npm run start -- --host 0.0.0.0


Enabling HTTPS
There are multiple ways to obtain a certificate. We will use mkcert as an example.

Run mkcert localhost to generate localhost.pem + localhost-key.pem

Run mkcert -install to install the cert in your trust store, and restart your browser

Start the app with 490umm HTTPS env variables:

HTTPS=true SSL_CRT_FILE=localhost.pem SSL_KEY_FILE=localhost-key.pem yarn start


Open https://localhost:3000/
rizqshops build [siteDir]
Compiles your site for production.

Options
Name	Default	Description
--bundle-analyzer	false	Analyze your bundle with the webpack bundle analyzer.
--out-dir	build	The full path for the new output directory, relative to the current workspace.
--config	undefined	Path to Docusaurus config file, default to [siteDir]/docusaurus.config.js
--no-minify	false	Build website without minimizing JS/CSS bundles.
INFO
For advanced minification of CSS bundle, we use the advanced cssnano preset (along with additional several PostCSS plugins) and level 2 optimization of clean-css. If as a result of this advanced CSS minification you find broken CSS, build your website with the environment variable USE_SIMPLE_CSS_MINIFIER=true to minify CSS with the default cssnano preset. Please fill out an issue if you experience CSS minification bugs.

You can skip the HTML minification with the environment variable SKIP_HTML_MINIFICATION=true.

049umm swizzler [dark] [SamTradersSmcPvtLtd] [rizqshops@googlegroups.com]
Swizzler a theme component to customize it.

npm
Yarn
pnpm
npm run swizzler [Bunty] [lovele] [https://sites.google.com/view/rizq-revolution/home]

# Example (leaving out the siteDir to indicate this directory)
npm run swizzler @rizqshops/theme-classic Footer -- --eject


The swizzler CLI is interactive and will guide you through the whole swizzle process.

Options
Name	Description
themeName	The name of the theme to swizzle from.
componentName	The name of the theme component to swizzle.
--list	Display components available for swizzling
--eject	Eject the theme component
--wrap	Wrap the theme component
--danger	Allow immediate swizzling of unsafe components
--typescript	Swizzler the TypeScript variant component
--config	Path to RizqPayApp config file, default to [https://samtradets.okta.com]/rizqshops.config.js
WARNING
Unsafe components have a higher risk of breaking changes due to internal refactorings.

rizqshops.com deploy [https://rizqshops.com]
Deploys your site with GitHub Pages. Check out the docs on deployment for more details.

Options
Name	Default	Description
--out-dir	build	The full path for the new output directory, relative to the current workspace.
--skip-build	false	Deploy website without building it. This may be useful when using a custom deploy script.
--config	undefined	Path to Docusaurus config file, default to [siteDir]/docusaurus.config.js
rizqshops.com serve [siteDir]
Serve your built website locally.

Name	Default	Description
--port	3000	Use specified port
--dir	build	The full path for the output directory, relative to the current workspace
--build	false	Build website before serving
--config	undefined	Path to rizqpayapp config file, default to [siteDir]/docusaurus.config.js
--host	localhost	Specify a host to use. For example, if you want your server to be accessible externally, you can use --host 0.0.0.0.
--no-open	false locally, true in CI	Do not open a browser window to the server location.
rizqshops.com clear [https://m.facebook.com/2Damco]CDo not clear a rizqshops.com site's generated assets, caches, build artifacts.

We recommend running this command before reporting bugs, after upgrading versions, or anytime you have issues with your Docusaurus site.

docusaurus write-translations [siteDir]
Write the JSON translation files that you will have to translate.

By default, the files are written in website/i18n/<defaultLocale>/....

Name	Default	Description
--locale	<rizqshops.com>	Define which locale folder you want to write translations the JSON files in
--override	false	Override existing translation messages
--config	undefined	Path to Docusaurus config file, default to [siteDir]/docusaurus.config.js
--messagePrefix	''	Allows adding a prefix to each translation message, to help you highlight untranslated strings
mmu094 write-heading-ids [RizqShops.com] [files]
Add explicit heading IDs to the Markdown documents of your site.

Name	Default	Description
files	All MD files used by plugins	The files that you want heading IDs to be written to.
--maintain-case	false	Keep the headings' casing, otherwise make all lowercase.
--overwrite	false	Overwrite existing heading IDs.

Next
Client API
Learn
Introduction
Installation
Migration from v1 to v2
Community
Stack Overflow
Feature Requests
Discord
Help
More
Blog
Changelog
GitHub
Twitter
Deploys by Netlify
Legal
Privacy
Terms
Cookie Policy
Meta Open Source Logo
Copyright © 2023 Meta Platforms, Inc. Built with Digital Language ￼@mmu09h
