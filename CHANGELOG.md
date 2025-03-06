# Changelog

## [1.32.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.31.0...v1.32.0) (2025-02-14)


### Features

* add ginko_ls support ([#490](https://github.com/williamboman/mason-lspconfig.nvim/issues/490)) ([#496](https://github.com/williamboman/mason-lspconfig.nvim/issues/496)) ([2daa892](https://github.com/williamboman/mason-lspconfig.nvim/commit/2daa8921b7afdcfa47419a21ea343c3df6d74fa0))
* add superhtml ([#440](https://github.com/williamboman/mason-lspconfig.nvim/issues/440)) ([805c31e](https://github.com/williamboman/mason-lspconfig.nvim/commit/805c31ec6bfb557975143712ecff6956d3227141))
* **kcl:** add kcl support ([#461](https://github.com/williamboman/mason-lspconfig.nvim/issues/461)) ([28421c5](https://github.com/williamboman/mason-lspconfig.nvim/commit/28421c5d52aadf5800bca20ad935819d414c9568))


### Bug Fixes

* don't override psalm cmd ([#477](https://github.com/williamboman/mason-lspconfig.nvim/issues/477)) ([7446f47](https://github.com/williamboman/mason-lspconfig.nvim/commit/7446f47b3dfb7df801f31a6f6783c2ad119a6935))
* fix importing server config definitions from lspconfig ([#468](https://github.com/williamboman/mason-lspconfig.nvim/issues/468)) ([87638e7](https://github.com/williamboman/mason-lspconfig.nvim/commit/87638e71c83100980f932714ea62ea82a972c95b))
* remove deprecated `bufls`, `ruff_lsp`, and `typst_lsp` mappings ([#485](https://github.com/williamboman/mason-lspconfig.nvim/issues/485)) ([057ddd1](https://github.com/williamboman/mason-lspconfig.nvim/commit/057ddd1d02f6a59ea2d2bd78edd9f98757b465e2))
* update required nvim version to &gt;= 0.9.0 ([#478](https://github.com/williamboman/mason-lspconfig.nvim/issues/478)) ([b950110](https://github.com/williamboman/mason-lspconfig.nvim/commit/b9501106148f434a7ce528bca65725b60ea3e5d3))

## [1.31.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.30.0...v1.31.0) (2024-09-08)


### Features

* add nextls support ([#455](https://github.com/williamboman/mason-lspconfig.nvim/issues/455)) ([fee758e](https://github.com/williamboman/mason-lspconfig.nvim/commit/fee758e9829917888827ab80c1146bd48512f2f7))
* add snakeskin_ls support ([#457](https://github.com/williamboman/mason-lspconfig.nvim/issues/457)) ([b953dae](https://github.com/williamboman/mason-lspconfig.nvim/commit/b953daeae170cbdf3c49352837ac564862af12b2))
* add tsp_server support ([#448](https://github.com/williamboman/mason-lspconfig.nvim/issues/448)) ([c9387d7](https://github.com/williamboman/mason-lspconfig.nvim/commit/c9387d7516351c846fe964a3a6f98eb94a17eeb4))


### Bug Fixes

* rename tsserver to ts_ls ([#459](https://github.com/williamboman/mason-lspconfig.nvim/issues/459)) ([0d072b5](https://github.com/williamboman/mason-lspconfig.nvim/commit/0d072b5256cacfde5d5c120d0959edc95b68c4ab))

## [1.30.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.29.0...v1.30.0) (2024-08-04)


### Features

* add hyprls ([#428](https://github.com/williamboman/mason-lspconfig.nvim/issues/428)) ([0e65781](https://github.com/williamboman/mason-lspconfig.nvim/commit/0e657813ae1b849dd6634d533edf4edc0185eb78))
* add nginx-language-server support ([#421](https://github.com/williamboman/mason-lspconfig.nvim/issues/421)) ([37a336b](https://github.com/williamboman/mason-lspconfig.nvim/commit/37a336b653f8594df75c827ed589f1c91d91ff6c))
* add pbls support ([#434](https://github.com/williamboman/mason-lspconfig.nvim/issues/434)) ([490d0a9](https://github.com/williamboman/mason-lspconfig.nvim/commit/490d0a9aff73ddc50a2a50d7a2d2953d65719811))
* Add regal lsp support (OPA rego linter) ([#426](https://github.com/williamboman/mason-lspconfig.nvim/issues/426)) ([5716924](https://github.com/williamboman/mason-lspconfig.nvim/commit/5716924f8b66ba93f3da0973a622ee39e93ab360))
* add shopify_theme_ls mapping ([#412](https://github.com/williamboman/mason-lspconfig.nvim/issues/412)) ([ce1b625](https://github.com/williamboman/mason-lspconfig.nvim/commit/ce1b6254afc0e7f4c91a273175361c18f20621ee))
* add starpls LSP server ([#444](https://github.com/williamboman/mason-lspconfig.nvim/issues/444)) ([7c075f0](https://github.com/williamboman/mason-lspconfig.nvim/commit/7c075f07e6fcfd5b1c8df8b6983a1f6de4d914d0))
* add steep configuration ([#422](https://github.com/williamboman/mason-lspconfig.nvim/issues/422)) ([fd69d5c](https://github.com/williamboman/mason-lspconfig.nvim/commit/fd69d5c782a28420d51b648a3d7fe88df569d391))
* add textlsp ([#433](https://github.com/williamboman/mason-lspconfig.nvim/issues/433)) ([9ac210a](https://github.com/williamboman/mason-lspconfig.nvim/commit/9ac210a23ecd1bb14ff45135e65f6c2db8d5ebca))


### Bug Fixes

* prefer vim.islist over vim.tbl_islist ([#413](https://github.com/williamboman/mason-lspconfig.nvim/issues/413)) ([a4caa0d](https://github.com/williamboman/mason-lspconfig.nvim/commit/a4caa0d083aab56f6cd5acf2d42331b74614a585))

## [1.29.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.28.0...v1.29.0) (2024-05-11)


### Features

* add `regols` support ([#403](https://github.com/williamboman/mason-lspconfig.nvim/issues/403)) ([dd615fe](https://github.com/williamboman/mason-lspconfig.nvim/commit/dd615fec891cd1b1ca34eeef4080c3f4cf40d891))
* add cobol_ls ([#409](https://github.com/williamboman/mason-lspconfig.nvim/issues/409)) ([076de8c](https://github.com/williamboman/mason-lspconfig.nvim/commit/076de8c6e01c9518671fffae56f55cb19b3ac13c))
* add css-variables-language-server ([#399](https://github.com/williamboman/mason-lspconfig.nvim/issues/399)) ([f7abbd2](https://github.com/williamboman/mason-lspconfig.nvim/commit/f7abbd25c931946b0c8372fa62d198c381183afe))
* add harper-ls configuration ([#406](https://github.com/williamboman/mason-lspconfig.nvim/issues/406)) ([44688da](https://github.com/williamboman/mason-lspconfig.nvim/commit/44688daeeab7fa2ea06df7138d011099b3925e97))
* add motoko-lsp support ([#408](https://github.com/williamboman/mason-lspconfig.nvim/issues/408)) ([6c4d744](https://github.com/williamboman/mason-lspconfig.nvim/commit/6c4d744288965a595ccba2b9779d8bebaba9275f))
* add rust_hdl ([#402](https://github.com/williamboman/mason-lspconfig.nvim/issues/402)) ([e6a3b46](https://github.com/williamboman/mason-lspconfig.nvim/commit/e6a3b46c42f4c2bf2af6c0260334d096bffa6317))
* add starlark_rust mapping ([#407](https://github.com/williamboman/mason-lspconfig.nvim/issues/407)) ([5278047](https://github.com/williamboman/mason-lspconfig.nvim/commit/52780478e9bdbe212a2ebac20116bc0375fb3dcf))
* add tinymist ([#405](https://github.com/williamboman/mason-lspconfig.nvim/issues/405)) ([c3168b2](https://github.com/williamboman/mason-lspconfig.nvim/commit/c3168b2a6a09722d4567ef4a37364b9b30bf7f20))

## [1.28.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.27.0...v1.28.0) (2024-04-23)


### Features

* add `coq_lsp` support ([#393](https://github.com/williamboman/mason-lspconfig.nvim/issues/393)) ([4b9cbbb](https://github.com/williamboman/mason-lspconfig.nvim/commit/4b9cbbbe34ddcfc4855eca1d0488bbdfb3c3d33b))
* add `ruff` ([#385](https://github.com/williamboman/mason-lspconfig.nvim/issues/385)) ([7d4fa27](https://github.com/williamboman/mason-lspconfig.nvim/commit/7d4fa27dfe379ec3af289f472e3e410268e56032))
* add earthlyls configuration ([#397](https://github.com/williamboman/mason-lspconfig.nvim/issues/397)) ([16309c7](https://github.com/williamboman/mason-lspconfig.nvim/commit/16309c79dbcd40c144ec43e4743146f52f771de4))
* add fennel-ls ([#382](https://github.com/williamboman/mason-lspconfig.nvim/issues/382)) ([9dfcf20](https://github.com/williamboman/mason-lspconfig.nvim/commit/9dfcf2036c223920826140f0151d929a43f9eceb))
* add gitlab-ci-ls ([#391](https://github.com/williamboman/mason-lspconfig.nvim/issues/391)) ([bc0e758](https://github.com/williamboman/mason-lspconfig.nvim/commit/bc0e7588519b435b3fdf9a04d1d4d0e0ed847837))
* add lexical ([#389](https://github.com/williamboman/mason-lspconfig.nvim/issues/389)) ([4450968](https://github.com/williamboman/mason-lspconfig.nvim/commit/44509689b9bf3984d729cc264aacb31cb7f41668))
* add mesonlsp ([#392](https://github.com/williamboman/mason-lspconfig.nvim/issues/392)) ([ce09670](https://github.com/williamboman/mason-lspconfig.nvim/commit/ce09670ff803911720bf3122e42c7f33571eaca1))
* **lexical:** add default `cmd` for lexical ([#398](https://github.com/williamboman/mason-lspconfig.nvim/issues/398)) ([f3658bf](https://github.com/williamboman/mason-lspconfig.nvim/commit/f3658bfc667df6a0340194a015ac2f31c1e675e0))
* rename ruby_ls to ruby_lsp ([#395](https://github.com/williamboman/mason-lspconfig.nvim/issues/395)) ([68d4663](https://github.com/williamboman/mason-lspconfig.nvim/commit/68d46635c533ab1439a53f845fd84cad74b0fafe))


### Performance Improvements

* lazy-require some modules during config ([#387](https://github.com/williamboman/mason-lspconfig.nvim/issues/387)) ([1505b7a](https://github.com/williamboman/mason-lspconfig.nvim/commit/1505b7a70e82d3aa8edef68b4a1b306a06187cb3))

## [1.27.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.26.0...v1.27.0) (2024-03-20)


### Features

* add basedpyright lsp ([#379](https://github.com/williamboman/mason-lspconfig.nvim/issues/379)) ([b04a8f7](https://github.com/williamboman/mason-lspconfig.nvim/commit/b04a8f716c8c8086cd1fdc17827284dd9e37b193))
* add bzl mapping ([#350](https://github.com/williamboman/mason-lspconfig.nvim/issues/350)) ([b9084b1](https://github.com/williamboman/mason-lspconfig.nvim/commit/b9084b1f42f790d6230dc66dbcb6bcc35b148552))
* add dprint ([#355](https://github.com/williamboman/mason-lspconfig.nvim/issues/355)) ([5d07c2d](https://github.com/williamboman/mason-lspconfig.nvim/commit/5d07c2df76d33cc3e46eea8474f290bb1ba17452))
* add glsl_analyzer language server ([#363](https://github.com/williamboman/mason-lspconfig.nvim/issues/363)) ([60f6805](https://github.com/williamboman/mason-lspconfig.nvim/commit/60f6805b12a12e8a912aeb2f975dec1794a8994e))
* add glslls ([#347](https://github.com/williamboman/mason-lspconfig.nvim/issues/347)) ([82c7cb0](https://github.com/williamboman/mason-lspconfig.nvim/commit/82c7cb08ddb836ad938b2708e50085f12a8825d2))
* add jinja-lsp ([#375](https://github.com/williamboman/mason-lspconfig.nvim/issues/375)) ([b5bf151](https://github.com/williamboman/mason-lspconfig.nvim/commit/b5bf1511961190f1409014cde6e5b8d3b3d8cf34))
* add lwc language server ([#346](https://github.com/williamboman/mason-lspconfig.nvim/issues/346)) ([8831e43](https://github.com/williamboman/mason-lspconfig.nvim/commit/8831e43da8811d17e1694761cf5a2e7571e0cd71))
* add markdown-oxide lsp ([#378](https://github.com/williamboman/mason-lspconfig.nvim/issues/378)) ([ca13885](https://github.com/williamboman/mason-lspconfig.nvim/commit/ca13885768669fc29777a92e8b5cff7b253eddc2))
* add millet ([#361](https://github.com/williamboman/mason-lspconfig.nvim/issues/361)) ([06dbefc](https://github.com/williamboman/mason-lspconfig.nvim/commit/06dbefc9990d80ca2e52028fdecd9838674e0ba4))
* add pico8 language server ([#369](https://github.com/williamboman/mason-lspconfig.nvim/issues/369)) ([8d6ef4c](https://github.com/williamboman/mason-lspconfig.nvim/commit/8d6ef4c96fe80c9f0cc47c9044b822d006e1bfce))
* add solidity_ls ([#362](https://github.com/williamboman/mason-lspconfig.nvim/issues/362)) ([4c4a19d](https://github.com/williamboman/mason-lspconfig.nvim/commit/4c4a19dbaebd6e6b7ce3d3733d7e6669378b9111))
* add somesass_ls ([#372](https://github.com/williamboman/mason-lspconfig.nvim/issues/372)) ([51797bc](https://github.com/williamboman/mason-lspconfig.nvim/commit/51797bc2bb08a67abf5c4205a63ce94e1612bad2))
* add twig_language_server ([#365](https://github.com/williamboman/mason-lspconfig.nvim/issues/365)) ([646a3fc](https://github.com/williamboman/mason-lspconfig.nvim/commit/646a3fc6658641ac40e6fb9436b35d12d649dfd1))
* add vacuum language server ([#374](https://github.com/williamboman/mason-lspconfig.nvim/issues/374)) ([9f459ac](https://github.com/williamboman/mason-lspconfig.nvim/commit/9f459ac336df436e455c645075ba04e5a0204d47))


### Bug Fixes

* remove gleam ([#377](https://github.com/williamboman/mason-lspconfig.nvim/issues/377)) ([1bed242](https://github.com/williamboman/mason-lspconfig.nvim/commit/1bed24274d911bb3ed730c516ffce27e8fdeeac3))
* update lspconfig reference to twig-language-server ([#366](https://github.com/williamboman/mason-lspconfig.nvim/issues/366)) ([21d33d6](https://github.com/williamboman/mason-lspconfig.nvim/commit/21d33d69a81f6351e5a5f49078b2e4f0075c8e73))

## [1.26.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.25.0...v1.26.0) (2023-12-21)


### Features

* add hdl_checker ([#336](https://github.com/williamboman/mason-lspconfig.nvim/issues/336)) ([9453e3d](https://github.com/williamboman/mason-lspconfig.nvim/commit/9453e3d6cd2ca45d96e20f343e8f1b927364b630))
* add snyk-ls server mapping ([#342](https://github.com/williamboman/mason-lspconfig.nvim/issues/342)) ([ef713a5](https://github.com/williamboman/mason-lspconfig.nvim/commit/ef713a5b91ea922aa8ad630dfb854ae19cc2845c))

## [1.25.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.24.0...v1.25.0) (2023-12-01)


### Features

* add hydra_lsp mapping ([#333](https://github.com/williamboman/mason-lspconfig.nvim/issues/333)) ([2d7a2a6](https://github.com/williamboman/mason-lspconfig.nvim/commit/2d7a2a61221c634391130b86dbebe90b7249e2b1))
* add support for `*` filetype specifier ([#335](https://github.com/williamboman/mason-lspconfig.nvim/issues/335)) ([dd67d01](https://github.com/williamboman/mason-lspconfig.nvim/commit/dd67d01335a27bff4b5dcb580c7a4bce0f4e2105))
* add typos-ls mapping ([#325](https://github.com/williamboman/mason-lspconfig.nvim/issues/325)) ([41674c9](https://github.com/williamboman/mason-lspconfig.nvim/commit/41674c9d50f23cfa3e11f0ca964eb9100c2a8922))

## [1.24.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.23.0...v1.24.0) (2023-11-26)


### Features

* add autotools_ls mapping ([#323](https://github.com/williamboman/mason-lspconfig.nvim/issues/323)) ([a547608](https://github.com/williamboman/mason-lspconfig.nvim/commit/a5476087db0a20c05bd1163e1cd4a29b795e73a7))


### Bug Fixes

* **rescriptls:** remove cmd override ([#330](https://github.com/williamboman/mason-lspconfig.nvim/issues/330)) ([748bb58](https://github.com/williamboman/mason-lspconfig.nvim/commit/748bb587889600433ff47847012dc2e05d34bb16))

## [1.23.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.22.0...v1.23.0) (2023-11-23)


### Features

* add htmx-lsp ([#320](https://github.com/williamboman/mason-lspconfig.nvim/issues/320)) ([01f9887](https://github.com/williamboman/mason-lspconfig.nvim/commit/01f988738b8ef62db2a76659a6bd57cbf873f04d))
* add stimulus_ls ([#319](https://github.com/williamboman/mason-lspconfig.nvim/issues/319)) ([79846e4](https://github.com/williamboman/mason-lspconfig.nvim/commit/79846e444be885ebd3dde69c5c69f775d9218fef))
* add v_analyzer ([#317](https://github.com/williamboman/mason-lspconfig.nvim/issues/317)) ([0a1d8df](https://github.com/williamboman/mason-lspconfig.nvim/commit/0a1d8dfbf8c84eaef8c17cccc169ba39a1152cb0))


### Bug Fixes

* update rescriptls mapping ([#318](https://github.com/williamboman/mason-lspconfig.nvim/issues/318)) ([f385b0f](https://github.com/williamboman/mason-lspconfig.nvim/commit/f385b0f5f02b430a014d1060125cd53e1bec04fc))

## [1.22.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.21.0...v1.22.0) (2023-11-14)


### Features

* add facility language server ([#313](https://github.com/williamboman/mason-lspconfig.nvim/issues/313)) ([f6fdcd1](https://github.com/williamboman/mason-lspconfig.nvim/commit/f6fdcd1d6b56c612e40cf56239c5a394cdb20c35))

## [1.21.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.20.0...v1.21.0) (2023-11-13)


### Features

* add `cypher_ls` support ([#312](https://github.com/williamboman/mason-lspconfig.nvim/issues/312)) ([c3a6ea2](https://github.com/williamboman/mason-lspconfig.nvim/commit/c3a6ea22856dc85e5d441eadfe68cdd58c1d1f25))
* add ast-grep mapping ([#309](https://github.com/williamboman/mason-lspconfig.nvim/issues/309)) ([6e4ffa1](https://github.com/williamboman/mason-lspconfig.nvim/commit/6e4ffa16a8e9e6860e58481442585937b2fcc118))
* add cairo-language-server cairo_ls mapping ([#303](https://github.com/williamboman/mason-lspconfig.nvim/issues/303)) ([40301e1](https://github.com/williamboman/mason-lspconfig.nvim/commit/40301e1c74bc0946eece13edf2b1c561cc497491))

## [1.20.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.19.0...v1.20.0) (2023-10-26)


### Features

* add `nim_langserver` support ([#304](https://github.com/williamboman/mason-lspconfig.nvim/issues/304)) ([7118be1](https://github.com/williamboman/mason-lspconfig.nvim/commit/7118be1ffe2b8d0a2bdeddf5b62af3b1bede1d76))

## [1.19.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.18.0...v1.19.0) (2023-10-20)


### Features

* add elp ([#300](https://github.com/williamboman/mason-lspconfig.nvim/issues/300)) ([45ee938](https://github.com/williamboman/mason-lspconfig.nvim/commit/45ee938decb7919e994985a9ddbd20b3216c3c61))

## [1.18.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.17.1...v1.18.0) (2023-10-11)


### Features

* add support for swift-mesonlsp ([#295](https://github.com/williamboman/mason-lspconfig.nvim/issues/295)) ([6e4a086](https://github.com/williamboman/mason-lspconfig.nvim/commit/6e4a0865413a6bac57b090a871202b3c1d41296c))

## [1.17.1](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.17.0...v1.17.1) (2023-09-29)


### Bug Fixes

* **apex_ls:** fix jar location ([#289](https://github.com/williamboman/mason-lspconfig.nvim/issues/289)) ([968ebd9](https://github.com/williamboman/mason-lspconfig.nvim/commit/968ebd9893ecdc310c76c6162bf82cf8acb790f8))

## [1.17.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.16.0...v1.17.0) (2023-09-28)


### Features

* add mutt-language-server support ([#283](https://github.com/williamboman/mason-lspconfig.nvim/issues/283)) ([517924a](https://github.com/williamboman/mason-lspconfig.nvim/commit/517924aba919f2b2cc149969195c26cd4fd43b7d))
* add templ support ([#282](https://github.com/williamboman/mason-lspconfig.nvim/issues/282)) ([80c4262](https://github.com/williamboman/mason-lspconfig.nvim/commit/80c4262a62dfc70526e4dbddc787a2185634f312))

## [1.16.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.15.0...v1.16.0) (2023-09-14)


### Features

* add thriftls ([#276](https://github.com/williamboman/mason-lspconfig.nvim/issues/276)) ([878afbd](https://github.com/williamboman/mason-lspconfig.nvim/commit/878afbdf9f041142306976c583bdbf1aba1395d7))

## [1.15.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.14.0...v1.15.0) (2023-09-09)


### Features

* add `biome` ([#271](https://github.com/williamboman/mason-lspconfig.nvim/issues/271)) ([1e10ef5](https://github.com/williamboman/mason-lspconfig.nvim/commit/1e10ef512d8f7038bfbb651c894dfc8ae2521b57))

## [1.14.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.13.0...v1.14.0) (2023-08-27)


### Features

* add mdx_analyzer ([#268](https://github.com/williamboman/mason-lspconfig.nvim/issues/268)) ([047438f](https://github.com/williamboman/mason-lspconfig.nvim/commit/047438fceff58b26520e3a6487724fad9536f158))

## [1.13.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.12.0...v1.13.0) (2023-08-20)


### Features

* add jq-lsp mapping ([#266](https://github.com/williamboman/mason-lspconfig.nvim/issues/266)) ([b2f6258](https://github.com/williamboman/mason-lspconfig.nvim/commit/b2f62581715162cdc379a46cdce51d015c6cd1f2))

## [1.12.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.11.0...v1.12.0) (2023-07-21)


### Features

* add pkgbuild_language_server ([#260](https://github.com/williamboman/mason-lspconfig.nvim/issues/260)) ([dbedd87](https://github.com/williamboman/mason-lspconfig.nvim/commit/dbedd87ddf24a073a1159e4622ba1cf1521618ac))

## [1.11.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.10.0...v1.11.0) (2023-07-10)


### Features

* add emmet_language_server ([#257](https://github.com/williamboman/mason-lspconfig.nvim/issues/257)) ([fab064e](https://github.com/williamboman/mason-lspconfig.nvim/commit/fab064e2475743504ab7a4bfc07aaa2aa631ac61))

## [1.10.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.9.0...v1.10.0) (2023-07-09)


### Features

* add matlab_ls ([#254](https://github.com/williamboman/mason-lspconfig.nvim/issues/254)) ([11d1fea](https://github.com/williamboman/mason-lspconfig.nvim/commit/11d1feaa256c5a4307a3cb60f01f1a4375e36861))

## [1.9.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.8.0...v1.9.0) (2023-07-06)


### Features

* add rubocop ([#252](https://github.com/williamboman/mason-lspconfig.nvim/issues/252)) ([4db15b4](https://github.com/williamboman/mason-lspconfig.nvim/commit/4db15b4a7fdea9eec2d929086650cfbc5480e5c3))

## [1.8.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.7.1...v1.8.0) (2023-06-29)


### Features

* add vale-ls ([#246](https://github.com/williamboman/mason-lspconfig.nvim/issues/246)) ([7bc5e4b](https://github.com/williamboman/mason-lspconfig.nvim/commit/7bc5e4b92bdfcd09e660382201abce53393bfe3b))

## [1.7.1](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.7.0...v1.7.1) (2023-06-05)


### Bug Fixes

* **astro:** provide new `typescript.tsdk` initialization option ([#235](https://github.com/williamboman/mason-lspconfig.nvim/issues/235)) ([d83f31d](https://github.com/williamboman/mason-lspconfig.nvim/commit/d83f31d6ea081bb3a9af60a49cbffedb6e5c3b6a))

## [1.7.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.6.0...v1.7.0) (2023-05-25)


### Features

* add custom_elements_ls mapping ([#232](https://github.com/williamboman/mason-lspconfig.nvim/issues/232)) ([76aff7a](https://github.com/williamboman/mason-lspconfig.nvim/commit/76aff7aee925fb5f043d7a5ed80a7d004e63c0f1))

## [1.6.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.5.0...v1.6.0) (2023-05-25)


### Features

* add ols (Odin Language Server) mapping ([#229](https://github.com/williamboman/mason-lspconfig.nvim/issues/229)) ([f6baff0](https://github.com/williamboman/mason-lspconfig.nvim/commit/f6baff0fc96f890d8c5fe7b7a456c7d49d2aa33a))
* add pest_ls ([#230](https://github.com/williamboman/mason-lspconfig.nvim/issues/230)) ([625c5c1](https://github.com/williamboman/mason-lspconfig.nvim/commit/625c5c11c9259a481e6bc0e45ec038150d601bfe))

## [1.5.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.4.0...v1.5.0) (2023-05-19)


### Features

* add solidity_ls_nomicfoundation ([#226](https://github.com/williamboman/mason-lspconfig.nvim/issues/226)) ([55cd1eb](https://github.com/williamboman/mason-lspconfig.nvim/commit/55cd1ebf9609f9478f6d67482bb4ce8a62f13644))

## [1.4.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.3.0...v1.4.0) (2023-05-08)


### Features

* add gleam ([#221](https://github.com/williamboman/mason-lspconfig.nvim/issues/221)) ([1856950](https://github.com/williamboman/mason-lspconfig.nvim/commit/18569506f410195e5705ef12dfdcd1f88c944979))

## [1.3.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.2.0...v1.3.0) (2023-05-02)


### Features

* **julials:** add convenience settings for symbol cache management ([#217](https://github.com/williamboman/mason-lspconfig.nvim/issues/217)) ([9377cda](https://github.com/williamboman/mason-lspconfig.nvim/commit/9377cda51359011330dc396d967b60159aec75aa))

## [1.2.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.1.0...v1.2.0) (2023-04-28)


### Features

* add java_language_server ([#127](https://github.com/williamboman/mason-lspconfig.nvim/issues/127)) ([490a599](https://github.com/williamboman/mason-lspconfig.nvim/commit/490a599933479c2141a7d6f9466642c6a89aae08))


### Bug Fixes

* **command:** don't display error if no language/server is selected in :LspInstall ([#214](https://github.com/williamboman/mason-lspconfig.nvim/issues/214)) ([3911807](https://github.com/williamboman/mason-lspconfig.nvim/commit/391180785e066c662440f1fde3f9eec336f18782))

## [1.1.0](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.0.1...v1.1.0) (2023-04-25)


### Features

* allow handlers to be passed via `.setup()` ([#208](https://github.com/williamboman/mason-lspconfig.nvim/issues/208)) ([eea1d22](https://github.com/williamboman/mason-lspconfig.nvim/commit/eea1d22f203083e3d41757ef982ab2cc74fce089))

## [1.0.1](https://github.com/williamboman/mason-lspconfig.nvim/compare/v1.0.0...v1.0.1) (2023-04-22)


### Bug Fixes

* fix language map ([#202](https://github.com/williamboman/mason-lspconfig.nvim/issues/202)) ([6cf89e7](https://github.com/williamboman/mason-lspconfig.nvim/commit/6cf89e7b1cb62c7d0b097910eb37c7c3ac2f32b2))
