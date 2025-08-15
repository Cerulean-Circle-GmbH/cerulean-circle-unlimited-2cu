# CI and Theme

Current Hello Mirror Theme:

[https://test.wo-da.de/EAMD.ucp/Components/com/hellomirrors/HellomirrorsTheme/1.0.0/HellomirrorsTheme.component.xml](https://test.wo-da.de/EAMD.ucp/Components/com/hellomirrors/HellomirrorsTheme/1.0.0/HellomirrorsTheme.component.xml) just drag and drop it into the WODA Heading “WODA IDE" to test it.

```
            const themeModel = {
                name: "HelloMirror Theme",
                description: "css variables for Web 4.0 components",
                badge: "Theme",

                gutter: '20px',
                shortTransition: '.4s',
                mediumTransition: '.8',
                longTransition: '1.2',

                primaryColor: 'black',
                secondaryColor: "lightgrey",   //not the grey in the logog
                accentColor: "#2167D7",    //some blue

                // uncustomized ...
                successColor: "rgb(131, 184, 25)",    
                dangerColor: "red",
                warningColor: "rgb(244, 158, 0)",
                infoColor: "#1A9DD9",

                fontSizeBase: '1rem',

                headlineFont: 'Arial',
                sublineFont: 'Montserrat',
                textFont: 'Montserrat',
                sourceFont: "Source Code Pro",

                headlineFontWeight: 700,
                sublineFontWeight: 700,
                textFontWeight: 600,
                sourceFontWeight: 400,

                "@googleFonts": 'https://fonts.googleapis.com/css?family=Roboto:400,500,700',

                schema: "/EAMD.ucp/Components/org/lesscss/Less/3.8.1/dist/standardSchema.less"
             }
```