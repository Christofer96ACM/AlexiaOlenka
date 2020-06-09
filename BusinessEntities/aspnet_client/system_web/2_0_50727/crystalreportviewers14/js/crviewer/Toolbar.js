/*
 * set default, depressed and hover behaviours of a widget using classes
 */
bobj.crv.setAllClasses = function (widget, prefix)
{
    if (widget && widget.setClasses) 
    {
        if (prefix)
            widget.setClasses(prefix + '_default', prefix + '_depressed', prefix + '_hover', prefix + '_depressed');
        else
            widget.setClasses(null, null, null, null);
    }
};

/**
 * Toolbar Constructor
 */
bobj.crv.newToolbar = function(kwArgs) {
    var UPDATE = MochiKit.Base.update;
    kwArgs = UPDATE({
        id: bobj.uniqueId(),
        visualStyle : {
            className       : null,
            backgroundColor : null,
            borderWidth     : null,
            borderStyle     : null,
            borderColor     : null,
            fontFamily      : null,
            fontWeight      : null,
            textDecoration  : null,
            color           : null,
            width           : null,
            height          : null,
            fontStyle       : null,
            fontSize        : null
       }
        
   }, kwArgs);
   
    var o = newPaletteContainerWidget(kwArgs.id);

    o.margin = 0;
    bobj.fillIn(o, kwArgs);  
    o._rightZoneWgts = [];
    o.widgetType = 'Toolbar';
    
    // Attach member functions (since we can't use prototypes)
    o.initOld = o.init;
    o.setDisplayOld = o.setDisplay;
    UPDATE(o, bobj.crv.Toolbar);
    
    o.palette = newPaletteWidget(o.id + "_palette");
    o.add(o.palette);
    return o;    
};

bobj.crv.Toolbar = {
        
    /**
     * Adds a widget to the toolbar and attaches callbacks to known types.
     * 
     * @param widget
     *            [Widget] The control to be displayed in the toolbar.
     */
    addChild : function(widget) {
        if(!widget)
            return;
        
        var SIGNAL = MochiKit.Signal.signal;
        var PARTIAL = MochiKit.Base.partial;
        var BIND = MochiKit.Base.bind;

        /* Connect callbacks that broadcast events as signals */
        switch (widget.widgetType) {
            case 'ToolbarMenu':
                this.menu = widget;
                if (widget.exportMenuItem)
                    widget.exportMenuItem.cb = PARTIAL (SIGNAL, this, 'export');
                if (widget.printMenuItem)
                    widget.printMenuItem.cb = PARTIAL (SIGNAL, this, 'print');
                break;
            case 'ToolbarButtonGroup':
                this.group = widget;
                if (widget.printButton)
                    widget.printButton.clickCB = PARTIAL (SIGNAL, this, 'print', widget.printButton.closeCB);
                if (widget.exportButton)
                    widget.exportButton.clickCB = PARTIAL (SIGNAL, this, 'export', widget.exportButton.closeCB);
                if (widget.refreshButton)
                    widget.refreshButton.clickCB = PARTIAL (SIGNAL, this, 'refresh');
                if (widget.drillUpButton)
                    widget.drillUpButton.clickCB = PARTIAL (SIGNAL, this, 'drillUp');
                break;
            case 'BackNavigationButton':
                this.backNavigationButton = widget;
                widget.clickCB = PARTIAL (SIGNAL, this, 'selectHistory', -1);
                break;
            case 'ForwardNavigationButton':
                this.forwardNavigationButton = widget;
                widget.clickCB = PARTIAL (SIGNAL, this, 'selectHistory', 1);
                break;
            case 'HistoryButton':
                this.historyButton = widget;
                MochiKit.Signal.connect(widget, "selectHistory", PARTIAL (SIGNAL, this, 'selectHistory'));
                MochiKit.Signal.connect(widget, "clearHistory", PARTIAL (SIGNAL, this, 'clearHistory'));
                break;
            case 'PrevPageButton':
                this.prevPageButton = widget;
                widget.clickCB = PARTIAL (SIGNAL, this, 'prevPage');
                break;
            case 'NextPageButton':
                this.nextPageButton = widget;
                widget.clickCB = PARTIAL (SIGNAL, this, 'nextPage');
                break;
            case 'ZoomControl':
                this.zoomControl = widget;
                widget.zoomCB = PARTIAL (SIGNAL, this, 'zoom');
                break;
            case 'SelectPageControl':
                this.selectPageControl = widget;
                widget.selectPageCB = PARTIAL (SIGNAL, this, 'selectPage');
                MochiKit.Signal.connect(widget, "showError", PARTIAL (SIGNAL, this, 'showError'));
                if (widget.firstPage && widget.lastPage) {
                    widget.firstPage.cb = PARTIAL (SIGNAL, this, 'firstPage');
                    widget.lastPage.cb = PARTIAL (SIGNAL, this, 'lastPage');
                }
                break;
            default:
                break;
        }

        /* Delay adding right-aligned widgets due to the semantics of the palette*/
        if (widget.layoutAlign == 'right') {
            this._rightZoneWgts.push (widget);
        } else {
            this.palette.add (widget);
        }
    },
    
    focusFirstChild : function () {
        if(!this.isVisible)
            return false;
        
        var items = this.palette.items;
        for(var i = 0 ; i < items.length; i++) {
            if(items[i].focus) {
                items[i].focus();
                return true;
            }
        }
        
        return false;
    },
    
    delayedAddChild : function(widget, index, needsSeparator) {
        if(!widget)
            return;
        
        var SIGNAL = MochiKit.Signal.signal;
        var PARTIAL = MochiKit.Base.partial;

        /* Connect callbacks that broadcast events as signals */
        switch (widget.widgetType) {
        case 'ToolbarMenu':
            this.menu = widget;
            if (widget.exportMenuItem)
                widget.exportMenuItem.cb = PARTIAL (SIGNAL, this, 'export');
            if (widget.printMenuItem)
                widget.printMenuItem.cb = PARTIAL (SIGNAL, this, 'print');
            break;
        default:
            break;
        }

        if (needsSeparator) {
            var separator = bobj.crv.newToolbarSeparator();
            this.palette.delayedAddChild(separator, index);
        }
        
        this.palette.delayedAddChild(widget, index);
    },
    
    /**
     * Do not Remove, Used by WebElements Public API
     */
    getSearchTextControl : function () {
        return null;
    },
    
    /**
     * Do not Remove, Used by WebElements Public API
     */
    getZoomControl : function () {
        return this.zoomControl;
    },
    
    /**
     * Do not Remove, Used by WebElements Public API
     */
    getSelectPageControl : function () {
        return this.selectPageControl;
    },
    
    /**
     * Do not Remove, Used by WebElements Public API
     */
    getButtonGroup : function () {
        return this.group;
    },
    
    /**
     * Do not Remove, Used by WebElements Public API
     */
    getBackNavigationButton : function () {
        return this.backNavigationButton;
    },
        
    /**
     * Do not Remove, Used by WebElements Public API
     */
    getForwardNavigationButton : function () {
        return this.forwardNavigationButton;
    },
        
    /**
     * Do not Remove, Used by WebElements Public API
     */
    getHistoryButton : function () {
        return this.historyButton;
    },
    
    /**
     * Do not Remove, Used by WebElements Public API
     */
    getNextPageButton : function () {
        return this.nextPageButton;
    },
        
    /**
     * Do not Remove, Used by WebElements Public API
     */
    getPrevPageButton : function () {
        return this.prevPageButton;
    },
    
    init : function() {
        this.initOld ();
        bobj.setVisualStyle (this.layer, this.visualStyle);
        this.palette.init ();
        this._updateNavButtons ();
        this.setDisplay(this.isVisible);
    },
    
    setDisplay : function (isDisplay) {
        this.setDisplayOld(isDisplay);
        MochiKit.Signal.signal(this, 'onSetDisplay', isDisplay);
    },
    
    write : function() {
        this._addRightZone ();
        this.begin ();
        this.palette.write ();
        this.end ();
        document.write (bobj.crv.getInitHTML (this.widx));
    },
    
    /**
     * Overrides parent. Opens the toolbar's tags.
     */
     beginHTML : function() {
        var h = bobj.html;
        return h.openTag ('div', {
            id : this.id,
            role : 'toolbar',
            style : {
                width : '100%',
                height : '28px',
                overflow : 'hidden',
                margin : this.margin + 'px',
                display : this.isVisible ? "block" : "none"
            }})
            + h.DIV ({'class' : 'crtoolbartop'})
            + h.DIV ({'class' : 'crtoolbarbottom'});
    },
    
    getHTML : function() {
        this._addRightZone ();
        return (this.beginHTML () + this.palette.getHTML () + this.endHTML ());
    },
    
    getWidth : function() {
        var itemLayer;
        var width = 0;
        var items = this.palette.items;
        for ( var i = 0, len = items.length; i < len; i++) {
            itemLayer = items[i].layer;
            if (itemLayer.offsetWidth) {
                width += itemLayer.offsetWidth;
            }
            if (itemLayer.offsetLeft) {
                width += (itemLayer.offsetLeft * 2);
            }
        }
        return width;
    },
    
    /**
     * Private. Adds right-aligned widgets to the right zone of the palette 
     */
    _addRightZone : function() {
        this.palette.beginRightZone ();

        var w = null;
        while (w = this._rightZoneWgts.pop ()) {
            this.palette.add (w);
        }

        delete this._rightZoneWgts;
    },
    
    /**
     * Private. Updates the enabled state of navigation buttons based on the current page number and the number of pages.
     */
    _updateNavButtons : function() {
        if (this.selectPageControl) {
            var curPg = this.selectPageControl.getCurrentPage ();
            if (this.selectPageControl.firstPage) {
                this.selectPageControl.firstPage.setDisabled (curPg == 1);
            }
            if (this.prevPageButton) {
                this.prevPageButton.setDisabled (curPg == 1);
            }

            var numPgsStr = this.selectPageControl.getNumPages () + '';
            var lastPgKnown = numPgsStr.indexOf ('+') == -1;
            var numPgs = parseInt (numPgsStr, 10);
            var fwdDisabled = lastPgKnown && numPgs == curPg;

            if (this.nextPageButton) {
                this.nextPageButton.setDisabled (fwdDisabled);
            }
            if (this.selectPageControl.lastPage) {
                this.selectPageControl.lastPage.setDisabled (fwdDisabled);
            }
        }
    },
    
    setPageNumber : function(curPage, numPages) {
        if (this.selectPageControl) {
            if(curPage && numPages) {
                this.selectPageControl.updateState (curPage, numPages);
            }
            else if (curPage)
                this.selectPageControl.setCurrentPage (curPage);
            else if (numPages)
                this.selectPageControl.setNumPages (numPages);

            this._updateNavButtons ();
        }
    },
    
    update : function(update) {
        if (update) {
            for ( var childNum in update.children) {
                var child = update.children[childNum];
                if (child) {
                    switch (child.cons) {
                        case "bobj.crv.newForwardNavigationButton":
                            if (this.forwardNavigationButton) {
                                this.forwardNavigationButton.update(child);
                            }
                            break;
                        case "bobj.crv.newBackNavigationButton":
                            if (this.backNavigationButton) {
                                this.backNavigationButton.update(child);
                            }
                            break;
                        case "bobj.crv.newHistoryButton":
                            if (this.historyButton) {
                                this.historyButton.update(child);
                            }
                            break;
                        case "bobj.crv.newSelectPageControl":
                            if (this.selectPageControl) {
                                this.selectPageControl.update (child);
                                this._updateNavButtons ();
                            }
                            break;
                        case "bobj.crv.newZoomControl":
                            if(this.zoomControl) {
                                this.zoomControl.update(child);
                            }
                            break;
                        case "bobj.crv.newToolbarButtonGroup":
                            if(this.group) {
                                this.group.update(child);
                            }
                            break;
                    }
                }
            }
            
            if(update.args) {
                this.setVisible(update.args.isVisible)
            }
        }
    },
    
    setVisible : function (isVisible) {
        this.isVisible = isVisible;
        this.setDisplay(this.isVisible);
    },
    
    clearHistory : function() {
        // disable the navigation buttons
        this.forwardNavigationButton.setDisabled(true);
        this.backNavigationButton.setDisabled(true);
        this.historyButton.setDisabled(true);
        
        // remove all the menu items
        this.historyButton.menu.removeAll();
    },
    
    doLayout : function() {
        // fix for IE
        if (_ie) {
            this.layer.style.position = "relative";
            this.layer.style.position = "";
        }
    }
};

/**
 * ToolbarMenu Constructor
 */

bobj.crv.newToolbarMenu = function(kwArgs) {
    kwArgs = MochiKit.Base.update({
        id: bobj.uniqueId(),
        icon: null,
        text: L_bobj_crv_File,
        tooltip: L_bobj_crv_FileMenu
    }, kwArgs);
    
    var o = newSingleIconMenuWidget(kwArgs.id, kwArgs.icon, null, kwArgs.text, kwArgs.tooltip);
    o.widgetType = 'ToolbarMenu';
    
    o._tbBtnOldInit = o.init;
    
    bobj.crv.setAllClasses(o.icon, null);
    bobj.crv.setAllClasses(o.arrow, null);
    bobj.crv.setAllClasses(o, 'filemenu');
    o.arrow.resize(13, 20);
    
    MochiKit.Base.update(o, bobj.crv.ToolbarMenu);
    return o;    
};

bobj.crv.ToolbarMenu = {
    init : function() {
        this._tbBtnOldInit ();
        bobj.disableTabbingKey (this.icon.layer, true);

        /* If menu does not have any items make it look like a 'label' */
        if (this.getMenu ().items.length == 0) {
            this.arrow.setDisplay (false);
            bobj.crv.setAllClasses (this.icon, null);
            this.icon.clickCB = null;
        }
    },
    
    /**
     * Add toolbar menu items to toolbar
     */
    addChild : function(widget) {
        var menu = this.getMenu ();
        switch (widget.widgetType) {
            case 'ExportMenuItem':
                var icon = bobj.crv.allInOne.uri;
                var dy = bobj.crv.allInOne.toolbarExportDy;
                var disDy = dy;

                this.exportMenuItem = menu.add (widget.id, L_bobj_crv_submitBtnLbl, null, icon, 3, dy, widget.disabled, 25, disDy, null);
                break;
            case 'PrintMenuItem':
                var icon = bobj.crv.allInOne.uri;
                var dy = bobj.crv.allInOne.toolbarPrintDy;
                var disDy = dy;

                this.printMenuItem = menu.add (widget.id, L_bobj_crv_ActiveXPrintDialogTitle, null, icon, 3, dy, widget.disabled, 25, disDy, null);
                break;
            default:
                bobj.crv.ToolbarMenu.commonAddChild (menu, widget);
                break;
        }
    },
    
    commonAddChild : function(menu, widget) {
        switch (widget.widgetType) {
            case 'Separator':
                menu.addSeparator ();
                break;
            case 'ScriptMenuItem':
                var cb = function() {
                    bobj.crv.ToolbarMenuItem.scriptItemCB (widget.callback, widget.args);
                };
                var menuitem = menu.add (widget.id, widget.text, cb, widget.icon, widget.dx, widget.dy, widget.disabled, widget.disDx, widget.disDy, widget.alt);
                if (widget.callback == null)
                    menuitem.setDisabled (true);
                break;
            case 'ToolbarSubMenu':
                var menuitem = menu.add (widget.id, widget.text, null, widget.icon, widget.dx, widget.dy, widget.disabled, widget.disDx, widget.disDy, widget.alt);
                menuitem.attachSubMenu (widget.submenu);
                break;
        }
    }
};


/**
 * ToolbarSubMenu Constructor
 */
bobj.crv.newToolbarSubMenu = function(kwArgs) {
    var o = MochiKit.Base.update({
        id: bobj.uniqueId(),
        text: null,
        icon: null,
        dx: 0,
        dy: 0,
        disabled: false,
        disDx: 0,
        disDy: 0,
        alt : null
    }, kwArgs);
    
    o.submenu = newMenuWidget(o.id);
    o.widgetType = 'ToolbarSubMenu';

    MochiKit.Base.update(o, bobj.crv.ToolbarSubMenu);
    return o;    
};

bobj.crv.ToolbarSubMenu = {
    /**
     * Add toolbar menu items to toolbarsubmenu
     */
    addChild : function(widget) {
        bobj.crv.ToolbarMenu.commonAddChild (this.submenu, widget);
    }
};

 
/**
 * ToolbarMenuItem constructor
 */
bobj.crv.newToolbarMenuItem = function(kwArgs) {
    var o = MochiKit.Base.update({
        id: bobj.uniqueId(), 
        widgetType:null,
        text: null,
        icon: null,
        dx: 0,
        dy: 0,
        disabled: false,
        disDx: 0,
        disDy: 0,
        alt : null
    }, kwArgs); 
    
    MochiKit.Base.update(o, bobj.crv.ToolbarMenuItem);
    return o;
};

bobj.crv.ToolbarMenuItem = {
    scriptItemCB : function(callback, args) {
        if (callback) {
            var f = eval (callback);
            if (typeof f == 'function') {
                if (args)
                    f.call (null, args);
                else
                    f.call (null);
            }
        }
    }
};

/**
 * Constructor. Base class for toolbar buttons. 
 */
bobj.crv.newToolbarButton = function(kwArgs) {
    kwArgs = MochiKit.Base.update({
        id: bobj.uniqueId(), 
        icon: null,
        tooltip: null,
        text: null,
        isDisabled: false,
        isChecked: false,
        clickCB: null,
        width: 16,
        height: 16,
        dx: 3,
        dy: 3,
        disDx: 25,
        disDy: 3,
        isTabEnabled: true
    }, kwArgs);    
    
    var o = newIconWidget( 
        kwArgs.id,        
        kwArgs.icon,      
        kwArgs.clickCB,   
        kwArgs.text,      
        kwArgs.tooltip,
        kwArgs.width,     
        kwArgs.height,    
        kwArgs.dx,        
        kwArgs.dy,        
        kwArgs.disDx,      
        kwArgs.disDy,
        kwArgs.isTabEnabled);    
        
    if (kwArgs.text)
        bobj.crv.setAllClasses(o, null);
    else
        bobj.crv.setAllClasses(o, 'button');
    
    o._tbBtnOldInit = o.init;
    o._tbBtnKwArgs = kwArgs;
    MochiKit.Base.update(o, bobj.crv.ToolbarButton);
    
    return o;    
};

bobj.crv.ToolbarButton = {
    init : function() {
        this._tbBtnOldInit ();
        var kwArgs = this._tbBtnKwArgs;

        this.setDisabled (kwArgs.isDisabled);
    },

    update : function (update) {
        if(update &&  bobj.isBoolean(update.args.isDisabled)) {
            this.setDisabled (update.args.isDisabled);
        }
    }
};

/**
 * BackNavigationButton constructor
 */
bobj.crv.newBackNavigationButton = function(kwArgs) {
    var o = bobj.crv.newToolbarButton(MochiKit.Base.update({
        icon: bobj.crv.allInOne.uri,
        tooltip: L_bobj_crv_Back,
        dx:3, dy:bobj.crv.allInOne.toolbarBackDy, disDx:25, disDy:bobj.crv.allInOne.toolbarBackDy
    }, kwArgs));

    o.widgetType = 'BackNavigationButton';
    return o;
};

/**
 * ForwardNavigationButton constructor
 */
bobj.crv.newForwardNavigationButton = function(kwArgs) {
    var o = bobj.crv.newToolbarButton(MochiKit.Base.update({
        icon: bobj.crv.allInOne.uri,
        tooltip: L_bobj_crv_Forward,
        dx:3, dy:bobj.crv.allInOne.toolbarForwardDy, disDx:25, disDy:bobj.crv.allInOne.toolbarForwardDy
    }, kwArgs));
    
    o.widgetType = 'ForwardNavigationButton';
    return o;
};

/**
 * PrevPageButton constructor
 */
bobj.crv.newPrevPageButton = function(kwArgs) {
    var o = bobj.crv.newToolbarButton(MochiKit.Base.update({
        icon: bobj.crv.allInOne.uri,
        tooltip: L_bobj_crv_PrevPage,
        dx:3, dy:bobj.crv.allInOne.toolbarPrevPageDy + 3, disDx:25, disDy:bobj.crv.allInOne.toolbarPrevPageDy + 3, width:16, height:16
    }, kwArgs));

    o.widgetType = 'PrevPageButton';
    return o;
};

/**
 * NextPageButton constructor
 */
bobj.crv.newNextPageButton = function(kwArgs) {
    var o = bobj.crv.newToolbarButton(MochiKit.Base.update({
        icon: bobj.crv.allInOne.uri,
        tooltip: L_bobj_crv_NextPage,
        dx:3, dy:bobj.crv.allInOne.toolbarNextPageDy + 3, disDx:25, disDy:bobj.crv.allInOne.toolbarNextPageDy + 3, width:16, height:16
    }, kwArgs));
    
    o.widgetType = 'NextPageButton';
    return o;
};

/**
 * DrillUp constructor
 */
bobj.crv.newDrillUpButton = function(kwArgs) {
    var o = bobj.crv.newToolbarButton(MochiKit.Base.update({
        icon: bobj.crv.allInOne.uri,
        tooltip: L_bobj_crv_DrillUp,
        dx:0, dy:bobj.crv.allInOne.toolbarUpDy, disDx:22, disDy:bobj.crv.allInOne.toolbarUpDy
    }, kwArgs));
    
    o.widgetType = 'DrillUpButton';
    return o;
};

/**
 * RefreshButton constructor
 */
bobj.crv.newRefreshButton = function(kwArgs) {
    var o = bobj.crv.newToolbarButton(MochiKit.Base.update({
        icon: bobj.crv.allInOne.uri,
        tooltip: L_bobj_crv_Refresh,
        dy: bobj.crv.allInOne.toolbarRefreshDy,
        disDy:  bobj.crv.allInOne.toolbarRefreshDy
    }, kwArgs));
    
    o.widgetType = 'RefreshButton';
    return o;
};

/**
 * ExportButton constructor
 */
bobj.crv.newExportButton = function(kwArgs) {
    var o = bobj.crv.newToolbarButton(MochiKit.Base.update({
        icon: bobj.crv.allInOne.uri,
        tooltip: L_bobj_crv_Export,
        dy: bobj.crv.allInOne.toolbarExportDy,
        disDy:  bobj.crv.allInOne.toolbarExportDy
    }, kwArgs));
    
    o.widgetType = 'ExportButton';
    o.closeCB = MochiKit.Base.bind(function() { if (this.focus) this.focus(); }, o);
    return o;
};

/**
 * PrintButton constructor
 */
bobj.crv.newPrintButton = function(kwArgs) {
    var o = bobj.crv.newToolbarButton(MochiKit.Base.update({
        icon: bobj.crv.allInOne.uri,
        tooltip: L_bobj_crv_Print,
        dy: bobj.crv.allInOne.toolbarPrintDy,
        disDy:  bobj.crv.allInOne.toolbarPrintDy
    }, kwArgs));
    
    o.widgetType = 'PrintButton';
    o.closeCB = MochiKit.Base.bind(function() { if (this.focus) this.focus(); }, o);
    return o;
};

/**
 * LogoButton constructor
 */
bobj.crv.newLogoIcon = function(kwArgs) {
    kwArgs = MochiKit.Base.update({
        id: bobj.uniqueId(),
        icon: bobj.crvUri('images/logo.gif'),
        link: 'http://www.businessobjects.com/ipl/default.asp?destination=ViewerLogoLink&product=crystalreports&version=14%2E0',
        toolTip: "SAP Crystal Reports"
    }, kwArgs);
    
    var o = newIconWidget(
        kwArgs.id,
        kwArgs.icon,
        function() {window.open(kwArgs.link);},
        null,
        decodeURIComponent(kwArgs.toolTip),
        120,
        20,
        0,
        0,
        0,
        0,
        true
    );

    bobj.crv.setAllClasses(o, null);
    
    o.layoutAlign = 'right';
    o.widgetType = 'LogoIcon';
    
    o.getHTML = function (){
        var h = bobj.html;
        var o = this;
        var buttonW = _ie && _isQuirksMode ? o.w+o.border : o.w+o.border-2;
        var buttonH = _ie && _isQuirksMode ? o.h+o.border : o.h+o.border-2;
        
        var tempdiv = h.DIV({
            id : o.id,
            'aria-haspopup' : o.ariaHasPopUp,
            style : {
                width : buttonW,
                height : buttonH,
                cursor : (o.clickCB ? (!o.acceptClick() ? 'default' : _hand):'default'),
                overflow : 'hidden',
                role : 'button'
            }
        },h.IMG( {
            'src' : this.src,
            'target' : '_blank',
            'id' : 'IconImg_'+o.id,
            'alt' : o.alt,
            'style' : {
                'float' : 'right',
                'border' : '0',
                'hspace' : '0',
                'vspace' : '0',
                'margin' : '1px 2px 2px 2px'
        }}));

        return tempdiv;
    };
    
    return o;
};

/**
 * Catalyst constructor
 */
bobj.crv.newCatalystIcon = function(kwArgs) {
    var o = newIconWidget(
        kwArgs.id,
        bobj.crvUri('images/catalyst.gif'),
        function() {window.open('http://www.businessobjects.com/ipl/default.asp?destination=DHTMLViewerLandingPage&product=crystalreports&version=14%2E0')},
        null,
        L_bobj_crv_CatalystTip,
        22,
        22,
        0,
        0,
        0,
        0,
        true
    );

    bobj.crv.setAllClasses(o, null);
    
    o.layoutAlign = 'right';
    o.widgetType = 'CatalystIcon';
    return o;
};

/**
 * ToolbarSeparator constructor
 */
bobj.crv.newToolbarSeparator = function() {
    return newPaletteVerticalSepWidget(bobj.uniqueId(), 26);
};

/**
 * ZoomControl Constructor
 */
bobj.crv.newZoomControl = function(kwArgs) {
    var UPDATE = MochiKit.Base.update;
    kwArgs = UPDATE({
        initialZoom: '100%',
        id: bobj.uniqueId()
    }, kwArgs);
    if (bobj.isNumber(kwArgs.initialZoom)) {
        kwArgs.initialZoom = kwArgs.initialZoom + '%';    
    }
    
    var o = newTextComboWidget(
        kwArgs.id,
        5,               // max chars
        L_bobj_crv_Zoom, // tooltip
        60,              // width 
        bobj.crv.ZoomControl._zoomChangeCB, // change CB
        null,            // check CB
        null,            // beforeShow CB
        null             // form name
        );

    o.arrow.resize(13, 20);
    bobj.crv.setAllClasses(o.arrow, 'button');

    o.menu.setAccelEnabled(false);
        
    var zoomList = ['400%','300%','200%','150%','125%','100%','75%','50%','25%'];
    
    for (var i = 0, len = zoomList.length; i < len; ++i) {
        var zoomLevel = zoomList[i];
        o.add(zoomLevel, zoomLevel, (zoomLevel == kwArgs.initialZoom));
    }
    o.text.setValue(kwArgs.initialZoom);
    
    o.zoomCB = null;
    o.widgetType = 'ZoomControl';
    
    o.initOld = o.init;
    o._initZoom = kwArgs.initialZoom;
    
    UPDATE(o, bobj.crv.ZoomControl); 
    
    return o;
};

bobj.crv.ZoomControl = {
    init : function() {
        this.initOld ();
        this.setZoom (this._initZoom);
    },
    
    update : function(update) {
        if(update.cons == "bobj.crv.newZoomControl") {
            this.setZoom(update.args.initialZoom);
        }
    },
    
    setZoom : function(lvl) {
        var zoomVal = parseInt (lvl, 10);
        if (bobj.isNumber (zoomVal)) {
            zoomVal += '%';

            this.valueSelect (zoomVal);

            var si = this.selectedItem;
            if (si && si.val != zoomVal) {
                si.check (false);
                this.selectedItem = null;
            }

            this._lastValue = zoomVal;
            return true;
        }
        return false;
    },
    
    _zoomChangeCB : function() {
        var zoomLvl = parseInt (this.text.getValue (), 10);

        if (bobj.isNumber (zoomLvl)) {
            if (zoomLvl < 10) {
                zoomLvl = 10;
            } else if (zoomLvl > 400) {
                zoomLvl = 400;
            }
        }

        if (!this.setZoom (zoomLvl)) {
            this.setZoom (this._lastValue);
        } else if (this.zoomCB) {
            this.zoomCB (zoomLvl);
        }
    }
};

/**
 * SelectPageControl constructor
 *
 * @param kwArgs.curPage  [String|Int] Current page number
 * @param kwArgs.numPages [String|Int] Number of pages in report
 */
bobj.crv.newSelectPageControl = function(kwArgs) {
    var UPDATE = MochiKit.Base.update;
    kwArgs = UPDATE({
        id: bobj.uniqueId(),
        showMenu: true
        }, kwArgs);
    
    // calculate the text input width on construction time to eliminate resize visual while loading
    var textNWidth = bobj.crv.SelectPageControl.getTextAndWidth(kwArgs.curPage, kwArgs.numPages);
    
    var o = newTextComboWidget(
            kwArgs.id,
            75,              // max chars
            L_bobj_crv_PageNav,       // tooltip
            textNWidth.width + 13,  // calculated width of the input field + what is getting substracted from it this constructor 
            null,            // change CB
            null,            // check CB
            null,            // beforeShow CB
            null,             // form name
            'navigation', L_bobj_crv_Page); //role, aria-title
    
    // Constructor args
    o.curPage = kwArgs.curPage;
    o.numPages = kwArgs.numPages;
    
    if (kwArgs.showMenu) {
        o.addMenuItem(bobj.uniqueId(),L_bobj_crv_FirstPage,null,null,0,0,false,0,0);
        o.addMenuItem(bobj.uniqueId(),L_bobj_crv_LastPage,null,null,0,0,false,0,0);
        
        o.firstPage = o.menu.items[0];
        o.lastPage = o.menu.items[1];
        
        o.arrow.resize(13, 20);
        bobj.crv.setAllClasses(o.arrow, 'button');
        o.menu.setAccelEnabled(false);
    }
    else {
        o.setMenuDisabled(true);
    }
    
    o.text.oldSetValue = o.text.setValue;
    o.text.setValue = function(newText, newWidth) {
        this.oldSetValue(newText);
        if (newWidth && o.text.layer) {            
            this.resize(newWidth, null);
        }
    };    
    o.text.focusCB = function() {
        this.setValue(o.curPage);
        var l = this.inputNode;
        if (l) l.select();
    };
    o.text.blurCB = function() {
        var textNWidth = o.getTextAndWidth(o.curPage, o.numPages);
        this.setValue(textNWidth.text);
    };    
    o.text.enterCB = function() {
        if (o.selectPageCB){
            var value = parseInt(this.getValue());
            if(isNaN(value) || value <= 0)
                MochiKit.Signal.signal(o, 'showError', L_bobj_crv_InvalidPageNumber);
            else
                o.selectPageCB(value);
        }
    };
    
    // Constants
    o.margin = 1;
    o.space = 0;
    o.fieldWidth = 30;
    o.labelWidth = 13 + o.space;
       
    /* Attach member functions */
    o.selectPageCB = null;
    UPDATE(o, bobj.crv.SelectPageControl);
    
    o.updateTextValue();    
    o.widgetType = 'SelectPageControl';
    return o;
};

bobj.crv.SelectPageControl = {
    getTextAndWidth : function(curPage, numPages) {
        if (bobj.crv.config.isRTL && bobj.isString(numPages) && numPages.indexOf('+') > 0) {
           numPages = '+' + numPages.replace('+', '');
        }
        var text = L_bobj_crv_of.replace ("%1", curPage).replace ("%2", numPages);
        var fontFamily = MochiKit.Style.computedStyle (this.layer, 'fontFamily');
        var stringWidth = bobj.getStringWidth(text, fontFamily, '11px');
        var width = Math.max(stringWidth + 20, 60);
        return {
            'text' : text,
            'width' : width
        };
    },
    
    update : function(update) {
        if (update && update.cons == "bobj.crv.newSelectPageControl") {
            this.updateState(update.args.curPage, update.args.numPages)
        }
    },
    
    updateState : function(currentPage, numPages) {
        if(currentPage != this.curPage || this.numPages != numPages) {
            this.curPage = currentPage;
            this.numPages = numPages;
            this.updateTextValue ();
        }
    },
    
    updateTextValue : function() {
        var textNWidth = this.getTextAndWidth(this.curPage, this.numPages);
        this.text.setValue(textNWidth.text, textNWidth.width);
        /* lets not leave the cursor inside this edit box as user could start editing the formatted text, "n of N" */
        var l = this.text.layer;
        if (l && document.activeElement == l) l.blur();
    },

    /**
     * @return [Int] Returns the current page number
     */
    getCurrentPage : function() {
        return this.curPage;
    },
    
    setCurrentPage : function(val) {
        this.curPage = val;
        this.updateTextValue();
    },
    
    /**
     * @return [String] Returns the number of pages label
     */
    getNumPages : function() {
        return this.numPages;
    },
    
    setNumPages : function(val) {
        this.numPages = val;
        this.updateTextValue();
    },
    
    /**
     * Do not Remove, Used by WebElements Public API
     */
    getFirstPageButton : function () {
        return this.firstPage;
    },
    
    /**
     * Do not Remove, Used by WebElements Public API
     */
    getLastPageButton : function () {
        return this.lastPage;
    }
};

bobj.crv.newToolbarButtonGroup = function(kwArgs) {
    var UPDATE = MochiKit.Base.update;
    kwArgs = UPDATE({
        id: bobj.uniqueId(),
        visualStyle : {
            className       : null,
            backgroundColor : null,
            borderWidth     : null,
            borderStyle     : null,
            borderColor     : null,
            fontFamily      : null,
            fontWeight      : null,
            textDecoration  : null,
            color           : null,
            width           : null,
            height          : null,
            fontStyle       : null,
            fontSize        : null
       }
        
   }, kwArgs);
   
    var o = newPaletteContainerWidget(kwArgs.id);

    o.margin = 2;
    bobj.fillIn(o, kwArgs);  
    o.widgetType = 'ToolbarButtonGroup';
    
    // Attach member functions (since we can't use prototypes)
    o.initOld = o.init;
    UPDATE(o, bobj.crv.ToolbarButtonGroup);
    
    o.palette = newPaletteWidget(o.id + "_palette");
    o.add(o.palette);
    return o;
};

bobj.crv.ToolbarButtonGroup = {
    addChild : function(widget) {
        switch (widget.widgetType) {
            case 'ExportButton':
                this.exportButton = widget;
                break;
            case 'PrintButton':
                this.printButton = widget;
                break;
            case 'RefreshButton':
                this.refreshButton = widget;
                break;
            case 'DrillUpButton':
                this.drillUpButton = widget;
        }
        this.palette.add (widget);
    },
    
    update : function (update) {
        if(update != null && update.cons == "bobj.crv.newToolbarButtonGroup") {
            for (var childNum in update.children) {
                var child = update.children[childNum];
                if (child) {
                    switch(child.cons) {
                        case "bobj.crv.newPrintButton":
                            if(this.printButton) {
                                this.printButton.update(child);
                            }
                            break;
                        case "bobj.crv.newExportButton":
                            if(this.exportButton) {
                                this.exportButton.update(child);
                            }
                            break;
                        case "bobj.crv.newRefreshButton":
                            if(this.refreshButton) {
                                this.refreshButton.update(child);
                            }
                            break;
                        case "bobj.crv.newDrillUpButton":
                            if(this.drillUpButton) {
                                this.drillUpButton.update(child);
                            }
                            break;
                    }
                }
            }
        }
    },
    
    isAnyButtonDisplayed : function () {
        return (this.printButton != null && this.printButton.isDisplayed()) ||
                    (this.exportButton != null && this.exportButton.isDisplayed()) ||
                        (this.refreshButton != null && this.refreshButton.isDisplayed()) ||
                            (this.drillUpButton != null && this.drillUpButton.isDisplayed());
    },
    
    autoDisplay : function () {
        if(this.isAnyButtonDisplayed()) 
            this.setDisplay (true);
        else
            this.setDisplay(false);
    },
    
    /**
     * Do not Remove, Used by WebElements Public API
     */
    getExportButton : function () {
        return this.exportButton;
    },
    
    /**
     * Do not Remove, Used by WebElements Public API
     */
    getRefreshButton : function () {
        return this.refreshButton;
    },
    
    /**
     * Do not Remove, Used by WebElements Public API
     */
    getDrillUpButton : function () {
        return this.drillUpButton;
    },
    
    /**
     * Do not Remove, Used by WebElements Public API
     */
    getPrintButton : function () {
        return this.printButton;
    },

    init : function() {
        this.initOld ();
        bobj.setVisualStyle (this.layer, this.visualStyle);
        this.palette.init ();
    },

    /**
     * Overrider parent
     */
    beginHTML : function() {
        var h = bobj.html;
        var groupHeight = bobj.isBorderBoxModel() ? 24 : 22;
        return h.openTag('div', {
            id: this.id,
            'class': 'toolbar_buttongroup',
            style: {
                margin: this.margin + 'px',
                height: groupHeight + 'px'
            }
        }) + h.openTag('div', null);
    },

    /**
     * Overrider parent
     */
    endHTML : function() {
        var h = bobj.html;
        return h.closeTag ('div') + h.closeTag ('div');
    },

    getHTML : function() {
        return this.beginHTML () + this.palette.getHTML () + this.endHTML ();
    }
};

bobj.crv.newToolbarButtonGroupSeparator = function() {
    return newPaletteVerticalSepWidget(bobj.uniqueId(), 14);
};

/**
 * HistoryButton constructor
 */
bobj.crv.newHistoryButton = function(kwArgs) {
    var UPDATE = MochiKit.Base.update;
    
    var o = newIconMenuWidget(
        kwArgs.id,          // id
        null,               // src
        null,               // clickCB
        null,               // text
        L_bobj_crv_History  // alt,w,h,dx,dy,disDx,disDy,isColor,beforeShowCB,menuType
        );
    
    bobj.crv.setAllClasses(o.arrow, 'button');
    
    o.widgetType = 'HistoryButton';
    o.initOld = o.init;
    
    // do not display the icon, we only need the arrow button
    o.icon.disp = false;
    
    o.setDisabled(kwArgs.isDisabled);
    
    UPDATE(o, bobj.crv.HistoryButton);
    
    o._updateMenu(kwArgs);
    
    return o;
};

bobj.crv.HistoryButton = {
    init : function() {
        this.initOld ();
    },
    
    update : function(update) {
        if(update.cons == "bobj.crv.newHistoryButton") {
            if(update && update.args) {
            	this._updateMenu(update.args);
            }
        }
    },
    
    _updateMenu : function(args) {
        if (bobj.isBoolean(args.isDisabled)) {
            this.setDisabled (args.isDisabled);
        }
        
        if (args.history) {
            // remove all menu items
            this.menu.removeAll();
            
            // add the history
            for (var i = 0; i < args.history.length; ++i) {
                var historyItem = args.history[i];
                var historyItemLabel = decodeURIComponent(historyItem.label);
                if (bobj.crv.config.isRTL) {
                	var txtList = historyItemLabel.split("-");
                	for ( var j = 0; j < txtList.length; j++) {
                		var tempStr = txtList[j];
                		if (j == 0)
                			historyItemLabel = tempStr;
                		else
                			historyItemLabel +=  " - " + tempStr;
                		
                		if (hasNoRTLCharacters(tempStr))
                			historyItemLabel += "&lrm;"; 
                	}
                }
                var menuItem = this.menu.addCheck("" + historyItem.id, historyItemLabel, this._onSelectHistory);
                menuItem.menu = this;
                if (historyItem.id == 0)
                    menuItem.check(true, true);
            }
            
            // add a separator
            this.menu.addSeparator();
            
            // add clear history
            var onClearHistoryCB = bobj.bindFunctionToObject(this._onClearHistory, this);
            this.menu.addCheck("clear", L_bobj_crv_ClearHistory, onClearHistoryCB);
        }
    },
    
    _onSelectHistory : function() {
        var direction = parseInt(this.id);
        if (direction != 0)
            MochiKit.Signal.signal(this.menu, 'selectHistory', direction);
        else
            this.check(true, true);
    },
    
    _onClearHistory : function() {
        MochiKit.Signal.signal(this, 'clearHistory');
    }
};
