var h = void 0, l=!0, n = null, p=!1, q, s = this;
function aa() {}
function ba(a) {
    var b = typeof a;
    if ("object" == b)
        if (a) {
            if (a instanceof Array)
                return "array";
                if (a instanceof Object)
                    return b;
                    var c = Object.prototype.toString.call(a);
                    if ("[object Window]" == c)
                        return "object";
                        if ("[object Array]" == c || "number" == typeof a.length && "undefined" != typeof a.splice && "undefined" != typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable("splice"))
                            return "array";
                            if ("[object Function]" == c || "undefined" != typeof a.call && "undefined" != typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable("call"))
                                return "function"
        } else 
            return "null";
            else if ("function" == b && "undefined" == typeof a.call)
                return "object";
return b
}
function t(a) {
    return a !== h
}
function w(a) {
    return "array" == ba(a)
}
function ca(a) {
    var b = ba(a);
    return "array" == b || "object" == b && "number" == typeof a.length
}
function x(a) {
    return "string" == typeof a
}
function y(a) {
    return "number" == typeof a
}
function da(a) {
    return "function" == ba(a)
}
function ea(a) {
    var b = typeof a;
    return "object" == b && a != n || "function" == b
}
function fa(a) {
    return a[ga] || (a[ga]=++ha)
}
var ga = "closure_uid_" + (1E9 * Math.random()>>>0), ha = 0;
function ia(a, b, c) {
    return a.call.apply(a.bind, arguments)
}
function ja(a, b, c) {
    if (!a)
        throw Error();
    if (2 < arguments.length) {
        var d = Array.prototype.slice.call(arguments, 2);
        return function() {
            var c = Array.prototype.slice.call(arguments);
            Array.prototype.unshift.apply(c, d);
            return a.apply(b, c)
        }
    }
    return function() {
        return a.apply(b, arguments)
    }
}
function ka(a, b, c) {
    ka = Function.prototype.bind&&-1 != Function.prototype.bind.toString().indexOf("native code") ? ia : ja;
    return ka.apply(n, arguments)
}
function la(a, b) {
    var c = Array.prototype.slice.call(arguments, 1);
    return function() {
        var b = c.slice();
        b.push.apply(b, arguments);
        return a.apply(this, b)
    }
}
var ma = Date.now || function() {
    return + new Date
};
function z(a, b) {
    function c() {}
    c.prototype = b.prototype;
    a.Bd = b.prototype;
    a.prototype = new c;
    a.ac = function(a, c, f) {
        var g = Array.prototype.slice.call(arguments, 2);
        return b.prototype[c].apply(a, g)
    }
};
var na = {}, oa, pa, qa;
var ra;
function sa(a) {
    return a.replace(/^[\s\xa0]+|[\s\xa0]+$/g, "")
}
function ta(a) {
    if (!ua.test(a))
        return a;
    -1 != a.indexOf("&") && (a = a.replace(va, "&amp;"));
    -1 != a.indexOf("<") && (a = a.replace(wa, "&lt;"));
    -1 != a.indexOf(">") && (a = a.replace(xa, "&gt;"));
    -1 != a.indexOf('"') && (a = a.replace(ya, "&quot;"));
    -1 != a.indexOf("'") && (a = a.replace(za, "&#39;"));
    return a
}
var va = /&/g, wa = /</g, xa = />/g, ya = /"/g, za = /'/g, ua = /[&<>"']/;
function Aa(a) {
    return String(a).replace(/\-([a-z])/g, function(a, c) {
        return c.toUpperCase()
    })
}
function Ba(a) {
    var b = x(h) ? "undefined".replace(/([-()\[\]{}+?*.$\^|,:#<!\\])/g, "\\$1").replace(/\x08/g, "\\x08"): "\\s";
    return a.replace(RegExp("(^" + (b ? "|[" + b + "]+" : "") + ")([a-z])", "g"), function(a, b, e) {
        return b + e.toUpperCase()
    })
};
var A = Array.prototype, Ca = A.indexOf ? function(a, b, c) {
    return A.indexOf.call(a, b, c)
}
: function(a, b, c) {
    c = c == n ? 0 : 0 > c ? Math.max(0, a.length + c) : c;
    if (x(a))
        return !x(b) || 1 != b.length?-1 : a.indexOf(b, c);
    for (; c < a.length; c++)
        if (c in a && a[c] === b)
            return c;
    return -1
}, Da = A.forEach ? function(a, b, c) {
    A.forEach.call(a, b, c)
}
: function(a, b, c) {
    for (var d = a.length, e = x(a) ? a.split("") : a, f = 0; f < d; f++)
        f in e && b.call(c, e[f], f, a)
}, Ea = A.filter ? function(a, b, c) {
    return A.filter.call(a, b, c)
}
: function(a, b, c) {
    for (var d = a.length, e = [], f = 0, g = x(a) ?
    a.split("") : a, k = 0; k < d; k++)
        if (k in g) {
            var m = g[k];
            b.call(c, m, k, a) && (e[f++] = m)
        }
    return e
}, Fa = A.map ? function(a, b, c) {
    return A.map.call(a, b, c)
}
: function(a, b, c) {
    for (var d = a.length, e = Array(d), f = x(a) ? a.split("") : a, g = 0; g < d; g++)
        g in f && (e[g] = b.call(c, f[g], g, a));
    return e
};
function Ga(a, b) {
    0 <= Ca(a, b) || a.push(b)
}
function Ha(a, b) {
    var c = Ca(a, b), d;
    (d = 0 <= c) && A.splice.call(a, c, 1);
    return d
}
function B(a) {
    var b = a.length;
    if (0 < b) {
        for (var c = Array(b), d = 0; d < b; d++)
            c[d] = a[d];
        return c
    }
    return []
}
function Ia(a, b, c, d) {
    A.splice.apply(a, Ja(arguments, 1))
}
function Ja(a, b, c) {
    return 2 >= arguments.length ? A.slice.call(a, b) : A.slice.call(a, b, c)
};
function D(a, b) {
    this.x = t(a) ? a : 0;
    this.y = t(b) ? b : 0
}
q = D.prototype;
q.d = function() {
    return new D(this.x, this.y)
};
function Ka(a) {
    var b = new D(0, 0), c = a.x - b.x;
    a = a.y - b.y;
    return Math.sqrt(c * c + a * a)
}
q.ceil = function() {
    this.x = Math.ceil(this.x);
    this.y = Math.ceil(this.y);
    return this
};
q.floor = function() {
    this.x = Math.floor(this.x);
    this.y = Math.floor(this.y);
    return this
};
q.round = function() {
    this.x = Math.round(this.x);
    this.y = Math.round(this.y);
    return this
};
q.translate = function(a, b) {
    a instanceof D ? (this.x += a.x, this.y += a.y) : (this.x += a, y(b) && (this.y += b));
    return this
};
q.scale = function(a, b) {
    var c = y(b) ? b: a;
    this.x*=a;
    this.y*=c;
    return this
};
function La(a, b, c, d) {
    this.top = a;
    this.right = b;
    this.bottom = c;
    this.left = d
}
q = La.prototype;
q.d = function() {
    return new La(this.top, this.right, this.bottom, this.left)
};
q.contains = function(a) {
    return !this ||!a ? p : a instanceof La ? a.left >= this.left && a.right <= this.right && a.top >= this.top && a.bottom <= this.bottom : a.x >= this.left && a.x <= this.right && a.y >= this.top && a.y <= this.bottom
};
q.expand = function(a, b, c, d) {
    ea(a) ? (this.top -= a.top, this.right += a.right, this.bottom += a.bottom, this.left -= a.left) : (this.top -= a, this.right += b, this.bottom += c, this.left -= d);
    return this
};
q.ceil = function() {
    this.top = Math.ceil(this.top);
    this.right = Math.ceil(this.right);
    this.bottom = Math.ceil(this.bottom);
    this.left = Math.ceil(this.left);
    return this
};
q.floor = function() {
    this.top = Math.floor(this.top);
    this.right = Math.floor(this.right);
    this.bottom = Math.floor(this.bottom);
    this.left = Math.floor(this.left);
    return this
};
q.round = function() {
    this.top = Math.round(this.top);
    this.right = Math.round(this.right);
    this.bottom = Math.round(this.bottom);
    this.left = Math.round(this.left);
    return this
};
q.translate = function(a, b) {
    a instanceof D ? (this.left += a.x, this.right += a.x, this.top += a.y, this.bottom += a.y) : (this.left += a, this.right += a, y(b) && (this.top += b, this.bottom += b));
    return this
};
q.scale = function(a, b) {
    var c = y(b) ? b: a;
    this.left*=a;
    this.right*=a;
    this.top*=c;
    this.bottom*=c;
    return this
};
function E(a, b) {
    this.width = a;
    this.height = b
}
q = E.prototype;
q.d = function() {
    return new E(this.width, this.height)
};
function Ma(a) {
    return a.width * a.height
}
q.ceil = function() {
    this.width = Math.ceil(this.width);
    this.height = Math.ceil(this.height);
    return this
};
q.floor = function() {
    this.width = Math.floor(this.width);
    this.height = Math.floor(this.height);
    return this
};
q.round = function() {
    this.width = Math.round(this.width);
    this.height = Math.round(this.height);
    return this
};
q.scale = function(a, b) {
    var c = y(b) ? b: a;
    this.width*=a;
    this.height*=c;
    return this
};
La.prototype.size = function() {
    return new E(this.right - this.left, this.bottom - this.top)
};
function Na() {}
Na.prototype.t = aa;
function F(a) {
    return a.ac ? a.ac : a
}
function Oa(a, b) {
    Pa(b, a);
    b.ac = F(a);
    return b
};
var G = new Na;
G.Pa = function() {};
G.Pd = function() {
    var a = this.Ib(), b;
    if (this.b) {
        this.xb && this.xb.contains(a) && (b = Ma(this.xb.size()) / Ma(a.size())) && 1.6 > b && 0.5 < b ? a = this.xb : 1 != this.Re && 0 != this.h.length && (this instanceof H || a.expand(12, 12, 12, 12));
        this.xb = a;
        var c = a.size();
        b = c.d().ceil();
        if (this.b.width != b.width || this.b.height != b.height)
            this.b.width = b.width, this.b.height = b.height, this.Nb = 1;
        var d = this.H.d();
        this.n[Qa] && (d = this.n[Qa]);
        0 != b.width && d.scale(c.width / b.width);
        c = I(this);
        this.Zb = c.left - a.left;
        this.$b = c.top - a.top;
        a = this.f().d();
        c =
        this.ha;
        a.width*=c.x;
        a.height*=c.y;
        c = this.e.d();
        this.n[J] && (c = this.n[J]);
        c.x -= a.width + this.Zb;
        c.y -= a.height + this.$b;
        Ra(this.b, 100 * ((this.Zb + a.width) / b.width), 100 * ((this.$b + a.height) / b.height), l);
        !this.W[J] && (!this.W[Qa]&&!this.W[Sa]) && (a =- (this.O%=360), t(this.n[Sa]) && (a =- this.n[Sa]), Ta(this.b, Ua(new Va, 0.1).translate(c.x, c.y).scale(d.x, d.y).rotate(a)));
        this.Nb && (d = this.b.getContext("2d"), d.clearRect(0, 0, b.width, b.height), d.save(), d.translate(this.Zb, this.$b), b = this.f(), a = this.ha, d.translate(b.width *
        a.x, b.height * a.y), this.r.fd.call(this, d), d.restore(), this.Nb = 0)
    }
};
G.update = function() {};
G.fd = function(a) {
    if (this.u && (this.j != this.na && (this.na && K.xd.call(this), this.j && K.Rc.call(this)), !this.Ja&&!this.Fb&&!(0 == this.F || 1 == this.mc)
        )) {
        1 != this.F && (a.globalAlpha*=this.F);
        if (this.j) {
            K.Xc.call(this.j);
            var b = this.na, c = this.H;
            a.save();
            a.save();
            a.translate(b.qd.x, b.qd.y);
            a.rotate( - b.rd);
            this.pb && a.rotate((this.O%=360) * Math.PI / 180);
            a.beginPath();
            a.moveTo(0, 0);
            a.lineTo(b.tc / c.x, 0);
            a.lineTo(b.tc / c.x, b.sc / c.y);
            a.lineTo(0, b.sc / c.y);
            a.closePath();
            a.restore();
            a.clip()
        }
        this.r.t.call(this, a);
        for (var b =
        new D(0, 0), d = 0, e; e = this.h[d]; d++) {
            var f = Wa(e, b).d(), g = e.O%=360, c = e.H;
            a.save();
            a.translate(f.x, f.y);
            a.scale(c.x, c.y);
            0 != g && a.rotate( - g * Math.PI / 180);
            this.r.fd.call(e, a);
            a.restore()
        }
        1 != this.F && (a.globalAlpha/=this.F);
        this.na && a.restore()
    }
};
function L(a, b) {
    this.x = a;
    this.y = b
}
z(L, D);
q = L.prototype;
q.d = function() {
    return new L(this.x, this.y)
};
q.scale = D.prototype.scale;
function Xa(a) {
    a.x =- a.x;
    a.y =- a.y
}
q.normalize = function() {
    return this.scale(1 / Math.sqrt(this.x * this.x + this.y * this.y))
};
q.add = function(a) {
    this.x += a.x;
    this.y += a.y;
    return this
};
q.rotate = function(a) {
    var b = Math.cos(a);
    a = Math.sin(a);
    var c = this.y * b + this.x * a;
    this.x = this.x * b - this.y * a;
    this.y = c;
    return this
};
function Ya() {
    0 != Za && (this.Ee = Error().stack, fa(this))
}
var Za = 0;
var $a = "closure_listenable_" + (1E6 * Math.random() | 0);
function bb(a) {
    try {
        return !(!a ||!a[$a])
    } catch (b) {
        return p
    }
}
var cb = 0;
function db(a, b, c, d, e) {
    this.Ha = a;
    this.Mb = n;
    this.src = b;
    this.type = c;
    this.capture=!!d;
    this.Eb = e;
    this.key=++cb;
    this.Ya = this.yb = p
}
function eb(a) {
    a.Ya = l;
    a.Ha = n;
    a.Mb = n;
    a.src = n;
    a.Eb = n
};
function fb(a, b) {
    for (var c in a)
        b.call(h, a[c], c, a)
}
var gb = "constructor hasOwnProperty isPrototypeOf propertyIsEnumerable toLocaleString toString valueOf".split(" ");
function Pa(a, b) {
    for (var c, d, e = 1; e < arguments.length; e++) {
        d = arguments[e];
        for (c in d)
            a[c] = d[c];
        for (var f = 0; f < gb.length; f++)
            c = gb[f], Object.prototype.hasOwnProperty.call(d, c) && (a[c] = d[c])
    }
};
function hb(a) {
    this.src = a;
    this.S = {};
    this.Ub = 0
}
hb.prototype.add = function(a, b, c, d, e) {
    var f = this.S[a];
    f || (f = this.S[a] = [], this.Ub++);
    var g = ib(f, b, d, e);
    -1 < g ? (a = f[g], c || (a.yb = p)) : (a = new db(b, this.src, a, !!d, e), a.yb = c, f.push(a));
    return a
};
hb.prototype.remove = function(a, b, c, d) {
    if (!(a in this.S))
        return p;
    var e = this.S[a];
    b = ib(e, b, c, d);
    return -1 < b ? (eb(e[b]), A.splice.call(e, b, 1), 0 == e.length && (delete this.S[a], this.Ub--), l) : p
};
function kb(a, b) {
    var c = b.type;
    c in a.S && Ha(a.S[c], b) && (eb(b), 0 == a.S[c].length && (delete a.S[c], a.Ub--))
}
hb.prototype.hc = function(a, b, c, d) {
    a = this.S[a];
    var e =- 1;
    a && (e = ib(a, b, c, d));
    return -1 < e ? a[e] : n
};
function ib(a, b, c, d) {
    for (var e = 0; e < a.length; ++e) {
        var f = a[e];
        if (!f.Ya && f.Ha == b && f.capture==!!c && f.Eb == d)
            return e
    }
    return -1
};
var lb = {}, mb, nb, ob, pb, qb;
function rb() {
    return s.navigator ? s.navigator.userAgent : n
}
qb = pb = ob = nb = mb = p;
var sb;
if (sb = rb()) {
    var tb = s.navigator;
    mb = 0 == sb.lastIndexOf("Opera", 0);
    nb=!mb && (-1 != sb.indexOf("MSIE")||-1 != sb.indexOf("Trident"));
    pb = (ob=!mb&&-1 != sb.indexOf("WebKit"))&&-1 != sb.indexOf("Mobile");
    qb=!mb&&!ob&&!nb && "Gecko" == tb.product
}
var ub = mb, M = nb, vb = qb, N = ob, wb = pb, xb = s.navigator, yb =- 1 != (xb && xb.platform || "").indexOf("Mac");
function zb() {
    var a = s.document;
    return a ? a.documentMode : h
}
var Ab;
a: {
    var Bb = "", Cb;
    if (ub && s.opera)
        var Db = s.opera.version, Bb = "function" == typeof Db ? Db(): Db;
    else if (vb ? Cb = /rv\:([^\);]+)(\)|;)/ : M ? Cb = /\b(?:MSIE|rv)[: ]([^\);]+)(\)|;)/ : N && (Cb = /WebKit\/(\S+)/), Cb)
        var Eb = Cb.exec(rb()), Bb = Eb ? Eb[1]: "";
    if (M) {
        var Fb = zb();
        if (Fb > parseFloat(Bb)) {
            Ab = String(Fb);
            break a
        }
    }
    Ab = Bb
}
var Gb = {};
function O(a) {
    var b;
    if (!(b = Gb[a])) {
        b = 0;
        for (var c = sa(String(Ab)).split("."), d = sa(String(a)).split("."), e = Math.max(c.length, d.length), f = 0; 0 == b && f < e; f++) {
            var g = c[f] || "", k = d[f] || "", m = RegExp("(\\d*)(\\D*)", "g"), v = RegExp("(\\d*)(\\D*)", "g");
            do {
                var u = m.exec(g) || ["", "", ""], C = v.exec(k) || ["", "", ""];
                if (0 == u[0].length && 0 == C[0].length)
                    break;
                b = ((0 == u[1].length ? 0 : parseInt(u[1], 10)) < (0 == C[1].length ? 0 : parseInt(C[1], 10))?-1 : (0 == u[1].length ? 0 : parseInt(u[1], 10)) > (0 == C[1].length ? 0 : parseInt(C[1], 10)) ? 1 : 0) || ((0 == u[2].length) <
                (0 == C[2].length)?-1 : (0 == u[2].length) > (0 == C[2].length) ? 1 : 0) || (u[2] < C[2]?-1 : u[2] > C[2] ? 1 : 0)
            }
            while (0 == b)
            }
        b = Gb[a] = 0 <= b
    }
    return b
}
var Hb = s.document, Ib=!Hb ||!M ? h : zb() || ("CSS1Compat" == Hb.compatMode ? parseInt(Ab, 10) : 5);
var Jb=!M || M && 9 <= Ib, Kb = M&&!O("9");
!N || O("528");
vb && O("1.9b") || M && O("8") || ub && O("9.5") || N && O("528");
vb&&!O("8") || M && O("9");
function Lb(a, b) {
    this.type = a;
    this.currentTarget = this.target = b;
    this.defaultPrevented = this.ra = p;
    this.yd = l
}
Lb.prototype.stopPropagation = function() {
    this.ra = l
};
Lb.prototype.preventDefault = function() {
    this.defaultPrevented = l;
    this.yd = p
};
function Mb(a) {
    Mb[" "](a);
    return a
}
Mb[" "] = aa;
function Nb(a, b) {
    Lb.call(this, a ? a.type : "");
    this.relatedTarget = this.currentTarget = this.target = n;
    this.charCode = this.keyCode = this.button = this.screenY = this.screenX = this.clientY = this.clientX = this.offsetY = this.offsetX = 0;
    this.metaKey = this.shiftKey = this.altKey = this.ctrlKey = p;
    this.state = n;
    this.ke = p;
    this.Ca = n;
    if (a) {
        var c = this.type = a.type;
        this.target = a.target || a.srcElement;
        this.currentTarget = b;
        var d = a.relatedTarget;
        if (d) {
            if (vb) {
                var e;
                a:
                {
                    try {
                        Mb(d.nodeName);
                        e = l;
                        break a
                    } catch (f) {}
                    e = p
                }
                e || (d = n)
            }
        } else 
            "mouseover" ==
            c ? d = a.fromElement : "mouseout" == c && (d = a.toElement);
        this.relatedTarget = d;
        this.offsetX = N || a.offsetX !== h ? a.offsetX : a.layerX;
        this.offsetY = N || a.offsetY !== h ? a.offsetY : a.layerY;
        this.clientX = a.clientX !== h ? a.clientX : a.pageX;
        this.clientY = a.clientY !== h ? a.clientY : a.pageY;
        this.screenX = a.screenX || 0;
        this.screenY = a.screenY || 0;
        this.button = a.button;
        this.keyCode = a.keyCode || 0;
        this.charCode = a.charCode || ("keypress" == c ? a.keyCode : 0);
        this.ctrlKey = a.ctrlKey;
        this.altKey = a.altKey;
        this.shiftKey = a.shiftKey;
        this.metaKey = a.metaKey;
        this.ke = yb ? a.metaKey : a.ctrlKey;
        this.state = a.state;
        this.Ca = a;
        a.defaultPrevented && this.preventDefault()
    }
}
z(Nb, Lb);
Nb.prototype.stopPropagation = function() {
    Nb.Bd.stopPropagation.call(this);
    this.Ca.stopPropagation ? this.Ca.stopPropagation() : this.Ca.cancelBubble = l
};
Nb.prototype.preventDefault = function() {
    Nb.Bd.preventDefault.call(this);
    var a = this.Ca;
    if (a.preventDefault)
        a.preventDefault();
    else if (a.returnValue = p, Kb)
        try {
            if (a.ctrlKey || 112 <= a.keyCode && 123 >= a.keyCode)
                a.keyCode =- 1
    } catch (b) {}
};
var Ob = "closure_lm_" + (1E6 * Math.random() | 0), Pb = {}, Qb = 0;
function P(a, b, c, d, e) {
    if (w(b)) {
        for (var f = 0; f < b.length; f++)
            P(a, b[f], c, d, e);
        return n
    }
    c = Rb(c);
    return bb(a) ? a.rc(b, c, d, e) : Sb(a, b, c, p, d, e)
}
function Sb(a, b, c, d, e, f) {
    if (!b)
        throw Error("Invalid event type");
    var g=!!e, k = Tb(a);
    k || (a[Ob] = k = new hb(a));
    c = k.add(b, c, d, e, f);
    if (c.Mb)
        return c;
    d = Ub();
    c.Mb = d;
    d.src = a;
    d.Ha = c;
    a.addEventListener ? a.addEventListener(b, d, g) : a.attachEvent(b in Pb ? Pb[b] : Pb[b] = "on" + b, d);
    Qb++;
    return c
}
function Ub() {
    var a = Vb, b = Jb ? function(c) {
        return a.call(b.src, b.Ha, c)
    }
    : function(c) {
        c = a.call(b.src, b.Ha, c);
        if (!c)
            return c
    };
    return b
}
function Wb(a, b, c, d, e) {
    if (w(b))
        for (var f = 0; f < b.length; f++)
            Wb(a, b[f], c, d, e);
    else 
        c = Rb(c), bb(a) ? a.Ba.add(String(b), c, l, d, e) : Sb(a, b, c, l, d, e)
}
function Xb(a, b, c, d, e) {
    if (w(b))
        for (var f = 0; f < b.length; f++)
            Xb(a, b[f], c, d, e);
    else if (c = Rb(c), bb(a)
        )a.Ic(b, c, d, e);
    else if (a && (a = Tb(a)))(b = a.hc(b, c, !!d, e)) && Yb(b)
    }
function Yb(a) {
    if (!y(a) && a&&!a.Ya) {
        var b = a.src;
        if (bb(b))
            kb(b.Ba, a);
        else {
            var c = a.type, d = a.Mb;
            b.removeEventListener ? b.removeEventListener(c, d, a.capture) : b.detachEvent && b.detachEvent(c in Pb ? Pb[c] : Pb[c] = "on" + c, d);
            Qb--;
            (c = Tb(b)) ? (kb(c, a), 0 == c.Ub && (c.src = n, b[Ob] = n)) : eb(a)
        }
    }
}
function Zb(a, b, c, d) {
    var e = 1;
    if (a = Tb(a))
        if (b = a.S[b]) {
            b = B(b);
            for (a = 0; a < b.length; a++) {
                var f = b[a];
                f && (f.capture == c&&!f.Ya) && (e&=$b(f, d) !== p)
            }
        }
    return Boolean(e)
}
function $b(a, b) {
    var c = a.Ha, d = a.Eb || a.src;
    a.yb && Yb(a);
    return c.call(d, b)
}
function Vb(a, b) {
    if (a.Ya)
        return l;
    if (!Jb) {
        var c;
        if (!(c = b))
            a: {
            c = ["window", "event"];
            for (var d = s, e; e = c.shift();)
                if (d[e] != n)
                    d = d[e];
                else {
                    c = n;
                    break a
                }
                c = d
        }
        e = c;
        c = new Nb(e, this);
        d = l;
        if (!(0 > e.keyCode || e.returnValue != h)) {
            a:
            {
                var f = p;
                if (0 == e.keyCode)
                    try {
                        e.keyCode =- 1;
                        break a
                } catch (g) {
                    f = l
                }
                if (f || e.returnValue == h)
                    e.returnValue = l
            }
            e = [];
            for (f = c.currentTarget; f; f = f.parentNode)
                e.push(f);
            for (var f = a.type, k = e.length-1; !c.ra && 0 <= k; k--)
                c.currentTarget = e[k], d&=Zb(e[k], f, l, c);
            for (k = 0; !c.ra && k < e.length; k++)
                c.currentTarget = e[k],
            d&=Zb(e[k], f, p, c)
        }
        return d
    }
    return $b(a, new Nb(b, this))
}
function Tb(a) {
    a = a[Ob];
    return a instanceof hb ? a : n
}
var ac = "__closure_events_fn_" + (1E9 * Math.random()>>>0);
function Rb(a) {
    return da(a) ? a : a[ac] || (a[ac] = function(b) {
        return a.handleEvent(b)
    })
};
function Q() {
    Ya.call(this);
    this.Ba = new hb(this);
    this.Hd = this
}
z(Q, Ya);
Q.prototype[$a] = l;
q = Q.prototype;
q.vd = n;
q.addEventListener = function(a, b, c, d) {
    P(this, a, b, c, d)
};
q.removeEventListener = function(a, b, c, d) {
    Xb(this, a, b, c, d)
};
q.dispatchEvent = function(a) {
    var b, c = this.vd;
    if (c)
        for (b = [];
        c;
        c = c.vd)b.push(c);
        var c = this.Hd, d = a.type || a;
        if (x(a))a = new Lb(a, c);
    else if (a instanceof Lb)a.target = a.target || c;
    else {
        var e = a;
        a = new Lb(d, c);
        Pa(a, e)
    }
    var e = l, f;
    if (b)for (var g = b.length-1;
    !a.ra && 0 <= g;
    g--)f = a.currentTarget = b[g], e = bc(f, d, l, a) && e; a.ra || (f = a.currentTarget = c, e = bc(f, d, l, a) 
        && e, a.ra || (e = bc(f, d, p, a) && e));
    if (b)
        for (g = 0; !a.ra && g < b.length; g++)
            f = a.currentTarget = b[g], e = bc(f, d, p, a) && e;
    return e
};
q.rc = function(a, b, c, d) {
    return this.Ba.add(String(a), b, p, c, d)
};
q.Ic = function(a, b, c, d) {
    return this.Ba.remove(String(a), b, c, d)
};
function bc(a, b, c, d) {
    b = a.Ba.S[String(b)];
    if (!b)
        return l;
    b = B(b);
    for (var e = l, f = 0; f < b.length; ++f) {
        var g = b[f];
        if (g&&!g.Ya && g.capture == c) {
            var k = g.Ha, m = g.Eb || g.src;
            g.yb && kb(a.Ba, g);
            e = k.call(m, d) !== p && e
        }
    }
    return e && d.yd != p
}
q.hc = function(a, b, c, d) {
    return this.Ba.hc(String(a), b, c, d)
};
var cc, dc, ec, fc, gc = rb();
(cc = N && wb && /(ipod|iphone|ipad)/i.test(gc)) && da(Object.freeze);
dc = N && /playbook/i.test(gc);
ec = N && /Chrome\//i.test(gc);
fc = t(document.ontouchmove);
function hc(a, b) {
    var c;
    c = a.className;
    c = x(c) && c.match(/\S+/g) || [];
    for (var d = Ja(arguments, 1), e = c.length + d.length, f = c, g = 0; g < d.length; g++)
        0 <= Ca(f, d[g]) || f.push(d[g]);
    a.className = c.join(" ");
    return c.length == e
};
var ic=!M || M && 9 <= Ib;
!vb&&!M || M && M && 9 <= Ib || vb && O("1.9.1");
M && O("9");
function jc(a) {
    return a ? new kc(lc(a)) : ra || (ra = new kc)
}
function mc(a, b) {
    fb(b, function(b, d) {
        "style" == d ? a.style.cssText = b : "class" == d ? a.className = b : "for" == d ? a.htmlFor = b : d in nc ? a.setAttribute(nc[d], b) : 0 == d.lastIndexOf("aria-", 0) || 0 == d.lastIndexOf("data-", 0) ? a.setAttribute(d, b) : a[d] = b
    })
}
var nc = {
    cellpadding: "cellPadding",
    cellspacing: "cellSpacing",
    colspan: "colSpan",
    frameborder: "frameBorder",
    height: "height",
    maxlength: "maxLength",
    role: "role",
    rowspan: "rowSpan",
    type: "type",
    usemap: "useMap",
    valign: "vAlign",
    width: "width"
};
function oc(a) {
    a = a.document;
    a = "CSS1Compat" == a.compatMode ? a.documentElement : a.body;
    return new E(a.clientWidth, a.clientHeight)
}
function pc(a, b, c) {
    return qc(document, arguments)
}
function qc(a, b) {
    var c = b[0], d = b[1];
    if (!ic && d && (d.name || d.type)) {
        c = ["<", c];
        d.name && c.push(' name="', ta(d.name), '"');
        if (d.type) {
            c.push(' type="', ta(d.type), '"');
            var e = {};
            Pa(e, d);
            delete e.type;
            d = e
        }
        c.push(">");
        c = c.join("")
    }
    c = a.createElement(c);
    d && (x(d) ? c.className = d : w(d) ? hc.apply(n, [c].concat(d)) : mc(c, d));
    2 < b.length && rc(a, c, b);
    return c
}
function rc(a, b, c) {
    function d(c) {
        c && b.appendChild(x(c) ? a.createTextNode(c) : c)
    }
    for (var e = 2; e < c.length; e++) {
        var f = c[e];
        ca(f)&&!(ea(f) && 0 < f.nodeType) ? Da(sc(f) ? B(f) : f, d) : d(f)
    }
}
function tc(a, b) {
    b.parentNode && b.parentNode.insertBefore(a, b)
}
function uc(a, b) {
    b.parentNode && b.parentNode.insertBefore(a, b.nextSibling)
}
function vc(a) {
    a && a.parentNode && a.parentNode.removeChild(a)
}
function wc(a, b) {
    if (a.contains && 1 == b.nodeType)
        return a == b || a.contains(b);
    if ("undefined" != typeof a.compareDocumentPosition)
        return a == b || Boolean(a.compareDocumentPosition(b) & 16);
    for (; b && a != b;)
        b = b.parentNode;
    return b == a
}
function lc(a) {
    return 9 == a.nodeType ? a : a.ownerDocument || a.document
}
function xc(a, b) {
    if ("textContent"in a)
        a.textContent = b;
    else if (3 == a.nodeType)
        a.data = b;
    else if (a.firstChild && 3 == a.firstChild.nodeType) {
        for (; a.lastChild != a.firstChild;)
            a.removeChild(a.lastChild);
            a.firstChild.data = b
    } else {
        for (var c; c = a.firstChild;)
            a.removeChild(c);
            a.appendChild(lc(a).createTextNode(String(b)))
    }
}
function sc(a) {
    if (a && "number" == typeof a.length) {
        if (ea(a))
            return "function" == typeof a.item || "string" == typeof a.item;
        if (da(a))
            return "function" == typeof a.item
    }
    return p
}
function kc(a) {
    this.Aa = a || s.document || document
}
function yc(a, b) {
    var c;
    c = a.Aa;
    var d = b && "*" != b ? b.toUpperCase(): "";
    c = c.querySelectorAll && c.querySelector && d ? c.querySelectorAll(d + "") : c.getElementsByTagName(d || "*");
    return c
}
q = kc.prototype;
q.bd = function(a, b, c) {
    return qc(this.Aa, arguments)
};
q.createElement = function(a) {
    return this.Aa.createElement(a)
};
q.createTextNode = function(a) {
    return this.Aa.createTextNode(String(a))
};
q.appendChild = function(a, b) {
    a.appendChild(b)
};
q.contains = wc;
function zc(a, b, c) {
    var d;
    a: if (d = Aa(c), a.style[d] === h && (c = (N ? "Webkit" : vb ? "Moz" : M ? "ms" : ub ? "O" : n) + Ba(c)
        , a.style[c] !== h)) {
        d = c;
        break a
    }
    d && (a.style[d] = b)
}
function Ac(a, b) {
    var c;
    a: {
        c = lc(a);
        if (c.defaultView && c.defaultView.getComputedStyle && (c = c.defaultView.getComputedStyle(a, n))) {
            c = c[b] || c.getPropertyValue(b) || "";
            break a
        }
        c = ""
    }
    return c || (a.currentStyle ? a.currentStyle[b] : n) || a.style && a.style[b]
}
function Bc(a) {
    var b;
    try {
        b = a.getBoundingClientRect()
    } catch (c) {
        return {
            left: 0,
            top: 0,
            right: 0,
            bottom: 0
        }
    }
    M && a.ownerDocument.body && (a = a.ownerDocument, b.left -= a.documentElement.clientLeft + a.body.clientLeft, b.top -= a.documentElement.clientTop + a.body.clientTop);
    return b
}
function Cc(a) {
    if (M&&!(M && 8 <= Ib))
        return a.offsetParent;
    var b = lc(a), c = Ac(a, "position"), d = "fixed" == c || "absolute" == c;
    for (a = a.parentNode; a && a != b; a = a.parentNode)
        if (c = Ac(a, "position"), d = d && "static" == c && a != b.documentElement && a != b.body, !d && (a.scrollWidth > a.clientWidth || a.scrollHeight > a.clientHeight || "fixed" == c || "absolute" == c || "relative" == c)
            )return a;
    return n
}
function Dc(a, b, c) {
    if (b instanceof E)
        c = b.height, b = b.width;
    else if (c == h)
        throw Error("missing height argument");
    a.style.width = Ec(b);
    a.style.height = Ec(c)
}
function Ec(a) {
    "number" == typeof a && (a = Math.round(a) + "px");
    return a
}
function Fc(a) {
    var b = Gc;
    if ("none" != Ac(a, "display"))
        return b(a);
    var c = a.style, d = c.display, e = c.visibility, f = c.position;
    c.visibility = "hidden";
    c.position = "absolute";
    c.display = "inline";
    a = b(a);
    c.display = d;
    c.position = f;
    c.visibility = e;
    return a
}
function Gc(a) {
    var b = a.offsetWidth, c = a.offsetHeight, d = N&&!b&&!c;
    return (!t(b) || d) && a.getBoundingClientRect ? (a = Bc(a), new E(a.right - a.left, a.bottom - a.top)) : new E(b, c)
}
function Hc(a) {
    var b = jc(h), c = n, c = b.Aa;
    if (M && c.createStyleSheet)
        b = c = c.createStyleSheet(), M && t(b.cssText) ? b.cssText = a : b.innerHTML = a;
    else {
        var d = yc(b, "head")[0];
        d || (c = yc(b, "body")[0], d = b.bd("head"), c.parentNode.insertBefore(d, c));
        var e = c = b.bd("style");
        M && t(e.cssText) ? e.cssText = a : e.innerHTML = a;
        b.appendChild(d, c)
    }
    return c
};
var Ic, Jc, Kc, Lc, Mc, Nc, Oc;
(function() {
    var a = N ? "Webkit": vb ? "Moz": ub ? "O": M ? "ms": "", b = pc("div").style;
    Ic = "-" + a.toLowerCase() + "-transform";
    Jc = function(a) {
        return b[a] !== h ? a : p
    };
    Kc = function(b) {
        var d = b.charAt(0).toLowerCase() + b.substr(1), e = a + b;
        return Jc(b) ? b : Jc(d) ? d : Jc(e) ? e : h
    }
})();
var Pc = function() {
    var a = Kc("BorderRadius");
    return function(b, c, d, e) {
        e = e ? "%" : "px";
        d = t(d) ? d : c;
        c = (w(c) ? c.join(e + " ") : c) + e + "/" + ((w(d) ? d.join(e + " ") : d) + e);
        c != b.Ld && (b.style[a] = b.Ld = c)
    }
}();
function Va(a) {
    this.Vb = [];
    this.precision = 1;
    this.Bb = l;
    this.Le && Ua(this, a)
}
function Qc(a, b) {
    a.Bb = b;
    return a
}
Va.prototype.scale = function(a, b) {
    this.Vb.push("scale(" + a + "," + b + ")");
    return this
};
Va.prototype.rotate = function(a, b) {
    var c;
    c = this.Bb && (cc || dc) ? "rotate3d(0, 0, 1, " + a + (b ? b : "deg") + ")" : "rotate(" + a + (b ? b : "deg") + ")";
    0 != a && this.Vb.push(c);
    return this
};
Va.prototype.translate = function(a, b, c) {
    var d = 1 / this.precision, e = "translate";
    if (this.Bb && (ec || cc || dc))
        e += "3d";
    e += "(" + a * d + "px," + b * d + "px";
    if (this.Bb && (ec || cc || dc))
        e += "," + (c ? c : 0) * d + "px";
    this.Vb.push(e + ")");
    return this
};
function Ua(a, b) {
    if (1 != a.precision) {
        var c = 1 / a.precision;
        a.scale(c, c);
        a.precision = 1
    }
    1 != b && (a.scale(b, b), a.precision = b);
    return a
}
Va.prototype.toString = function() {
    1 != this.precision && Ua(this, 1);
    return this.Vb.join(" ")
};
var Ta = function() {
    var a = Kc("Transform");
    return function(b, c) {
        var d = c.toString();
        d != b.we && (b.style[a] = b.we = d);
        oa = 1
    }
}(), Ra = function() {
    var a = Kc("TransformOrigin");
    return function(b, c, d, e) {
        e = e ? "%" : "px";
        c = c + e + " " + d + e;
        c != b.xe && (b.style[a] = b.xe = c)
    }
}();
(function() {
    function a(a, b) {
        if (!a.length)
            return a;
        for (var e = a.split("),"), f = 0; f < e.length-1; f++)
            e[f] += ")";
        e = Ea(e, function(a) {
            return -1 == a.indexOf(b)
        });
        return e.join(",")
    }
    var b = Kc("Transition");
    Lc=!!b&&!ub;
    Mc = function(c, d, e, f) {
        if (b) {
            var g = a(c.style[b], d);
            g.length && (g += ", ");
            g += d + " " + e + "s cubic-bezier(" + f[1] + "," + f[2] + "," + f[3] + "," + f[4] + ")";
            c.style[b] = g
        }
    };
    Nc = function(c, d) {
        b && c && (c.style[b] = a(c.style[b], d))
    };
    Oc = function(a, b, e) {
        if (a.Ae != b || a.Xd != e)
            a.Ae = b, a.Xd = e, Dc(a, b, e)
    }
})();
var K = new Na;
K.Pa = function() {
    for (var a = 0, b, c = 0; b = this.h[c]; c++)
        b = b instanceof R ? b.G : b, b == this.b.childNodes[a] ? a++ : (wc(this.Q, b) && vc(b), K.Jd(this.Q, b, a++))
};
K.Qd = function() {
    var a = this.f(), b = this.e, c = this.H, d = this.Tc;
    this.n[J] && (b = this.n[J]);
    var e = a.width, a = a.height, c = c.d();
    this.n[Qa] && (c = this.n[Qa].d());
    Oc(this.b, e, a);
    Ra(this.b, 100 * this.ha.x, 100 * this.ha.y, l);
    var e = this.ha.x * e, f = this.ha.y * a, a = b.x - e, b = b.y - f, g = this.B ? this.B.C: 0;
    (0 != e - g || 0 != f - g) && (this.b == this.Q && this.h.length) && K.fe.call(this);
    this.b != this.Q&&!this.W[J] && (!this.W[Qa]&&!this.W[Sa]) && Ta(this.Q, Qc(new Va, d).translate(e - g, f - g));
    this.j != this.na && (this.na && K.xd.call(this), this.j && K.Rc.call(this));
    d = Qc(Ua(new Va, 0.1), d);
    this.j && (K.Xc.call(this.j), Ua(Ua(d, 0.1).translate( - this.j.de - e, - this.j.ee - f).rotate(this.j.rd, "rad").translate(e, f), 1));
    e =- (this.O%=360);
    t(this.n[Sa]) && (e =- this.n[Sa]);
    d.translate(a, b).scale(c.x, c.y).rotate(e);
    !this.W[J] && (!this.W[Qa]&&!this.W[Sa]) && Ta(this.b, d)
};
K.update = function() {
    if (this.b) {
        K.Qd.call(this);
        if (!this.W[Rc]) {
            var a = this.F;
            t(this.n[Rc]) && (a = this.n[Rc]);
            if (this.p & Sc) {
                var b = this.b.style;
                "opacity"in b ? b.opacity = a : "MozOpacity"in b ? b.MozOpacity = a : "filter"in b && (b.filter = "" === a ? "" : "alpha(opacity=" + 100 * a + ")")
            }
        }
        this.p & Tc && (this.b.style.display = this.Fb ? "none" : "block");
        this.Ja || this.r.t.call(this, this.b)
    }
};
K.Xc = function() {
    if (t(this.Gc) && this.Gc.u) {
        var a = this.Gc, b = I(this), c = new D(b.left, b.top), d = new D(b.right, b.top), e = new D(b.right, b.bottom), b = a.getParent(), c=!this.u ? c : b.ka(this.ob(c)), d=!this.u ? d : b.ka(this.ob(d)), e=!this.u ? e : b.ka(this.ob(e)), b = Math.atan2(c.y - d.y, d.x - c.x), f = d.x - c.x, g = c.y - d.y, k = e.x - d.x, m = e.y - d.y, d = Math.cos(b), e = Math.sin(b);
        this.tc = Math.round(Math.sqrt(f * f + g * g));
        this.sc = Math.round(Math.sqrt(k * k + m * m));
        F(a.r) == K && (f = a.G, Dc(f, this.tc, this.sc), Ta(f, Qc(Ua(new Va, 0.1), this.Tc).translate(c.x,
        c.y).rotate( - b, "rad")));
        F(this.r) == K && (this.b.style.display = "none");
        this.qd = Uc(a, c.d());
        this.ce = l;
        this.de = d * c.x - e * c.y;
        this.ee = d * c.y + e * c.x;
        this.rd = b
    }
};
K.Jd = function(a, b, c) {
    c == h || a.childNodes.length <= c ? a.appendChild(b) : a.insertBefore(b, a.childNodes[c])
};
K.fe = function() {
    this.Q = pc("div");
    for (var a = document.createDocumentFragment(), b; b = this.b.firstChild;)
        this.b.removeChild(b), a.appendChild(b);
    this.Q.appendChild(a);
    this.b.appendChild(this.Q)
};
K.xd = function() {
    if (this.b != this.G) {
        if (F(this.r) == K) {
            vc(this.b);
            var a = this.G, b = a.parentNode;
            b && b.replaceChild(this.b, a);
            this.G = this.b
        }
        this.na.mc = 0;
        this.na = n
    }
};
K.Rc = function() {
    if (F(this.r) == K) {
        this.G = pc("div");
        this.G.style.cssText = "position:absolute;overflow:hidden;";
        Ra(this.G, 0, 0);
        var a = this.b, b = a.parentNode;
        b && b.replaceChild(this.G, a);
        this.G.appendChild(this.b)
    }
    this.j.mc = 1;
    this.j.Gc = this;
    this.na = this.j;
    S(this.j, Vc)
};
M && O(8);
(function() {
    var a = [[], []], b = [[], []];
    pa = function(c, d, e) {
        Ga((e ? b : a)[d || 0], c)
    };
    qa = function() {
        for (var c, d = 0; 2 > d; d++) {
            for (; a[d].length;)
                c = a[d][0], c.update(d), c.p = 0, c == a[d][0] && a[d].shift();
            a[d] = []
        }
        b = [[], []]
    }
})();
var Vc = 1, Sc = 16, Tc = 32, J = 1, Qa = 2, Sa = 4, Rc = 5;
Hc(".lime-director {position:absolute; -webkit-transform-origin: 0 0; -moz-transform-origin: 0 0; -o-transform-origin: 0 0; image-rendering:  optimizeSpeed; overflow: hidden;}.lime-director div, .lime-director img, .lime-director canvas {-webkit-transform-origin: 0 0; -moz-transform-origin: 0 0; -o-transform-origin: 0 0; position: absolute; -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box; -moz-user-select: none; -webkit-user-select: none; -webkit-user-drag: none;}.lime-scene {position:absolute; width:100%; height:100%; left: 0px; top: 0px; overflow: hidden; -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box;}.lime-fps {float: left; background: #333; color: #fff; position: absolute; top:0px; left: 0px; padding:2px 4px;}div.lime-layer {position: absolute; left: 0px; top: 0px; width:0px; height:0px; border: none !important;}.lime-cover {position: absolute; left: 0px; top: 0px;}.lime-button {cursor: pointer;}");
function R() {
    Q.call(this);
    this.h = [];
    this.q = n;
    this.ma = {};
    this.n = {};
    this.W = {};
    this.Hc = {};
    this.Tc = l;
    this.u = p;
    this.Cc = this.bc = n;
    this.L = {};
    this.Ma(1);
    this.a(0, 0);
    this.c(0, 0);
    this.I(0.5, 0.5);
    this.O = 0;
    this.n[Sa] || S(this, Vc);
    this.Vc = 0;
    S(this, 7);
    this.F = 1;
    Wc(this, n);
    Xc(this, F(this.ta[0]));
    S(this, 64)
}
z(R, Q);
q = R.prototype;
q.ta = [K, G];
function Xc(a, b) {
    if (!a.r || F(a.r) != b) {
        for (var c =- 1, d = 0; d < a.ta.length; d++)
            if (F(a.ta[d]) == b) {
                c = d;
                break
            }
        if (-1 != c) {
            a.r = a.ta[d];
            S(a, 64);
            for (d = 0; c = a.h[d]; d++)
                Xc(c, b)
            }
    }
}
q.pb = function() {
    return !(this.q && F(this.q.r) == G)
};
function Yc(a) {
    return a.pb() ? (a.pb() ? Zc(a) : $c(a), a) : a.q ? Yc(a.q) : n
}
function ad(a) {
    if (!a.q || a instanceof H)
        return [];
    var b = a.q.h.indexOf(a);
    a = ad(a.q);
    a.push(b);
    return a
}
function bd(a, b) {
    if (a == b)
        return 0;
    for (var c = ad(a), d = ad(b), e = 0; ;) {
        if (c.length <= e)
            return 1;
        if (d.length <= e)
            return -1;
        if (c[e] == d[e])
            e++;
        else 
            return c[e] > d[e]?-1 : 1
    }
}
function S(a, b, c, d) {
    b&&!a.p && pa(a, c, d);
    c = a.p;
    a.p|=b;
    if (64 == b&&!(c & 64))
        for (c = 0; d = a.h[c]; c++)
            d instanceof R && S(d, 64);
    if (!t(a.p) ||!b)
        a.p = 0;
    b && a.Ja && (a.ce = p, S(a.Ja, -1));
    return a
}
q.Ma = function(a, b) {
    this.H = 1 == arguments.length && y(a) ? new L(a, a) : 2 == arguments.length ? new L(arguments[0], arguments[1]) : a;
    return this.n[Qa] ? this : S(this, 2)
};
q.a = function(a, b) {
    this.e = 2 == arguments.length ? new D(arguments[0], arguments[1]) : a;
    return this.n[J] ? this : S(this, Vc)
};
function Wc(a, b) {
    if (b != a.j) {
        if (a.j) {
            var c = a.j;
            delete c.zb;
            cd(c, c.getParent());
            delete a.j.Ja
        }
        a.j = b;
        a.j && (c = a.j, c.zb = l, c.u && dd(c, c.getParent()), a.j.Ja = a);
        S(a, 4)
    }
}
q.I = function(a, b) {
    this.ha = 2 == arguments.length ? new L(arguments[0], arguments[1]) : a;
    return S(this, Vc)
};
function ed(a, b) {
    a.Fb = b;
    S(a, Tc);
    a.Uc = 0
}
q.f = function() {
    return this.A
};
q.c = function(a, b) {
    var c = this.A, d, e;
    d = 2 == arguments.length ? new E(arguments[0], arguments[1]) : a;
    var f = this.ha;
    if (c && this.h.length)
        for (var g = 0; g < this.h.length; g++) {
            var k = this.h[g];
            if (k.Vd) {
                var m = k.Vc;
                if (0 != m) {
                    var v = fd(k);
                    e = c.width;
                    var u = v.left + f.x * c.width, C = v.right - v.left, ab = e - v.right - f.x * c.width;
                    m & 1 && (e -= u);
                    m & 2 && (e -= C);
                    m & 4 && (e -= ab);
                    e != c.width && (e = (d.width - e) / (c.width - e), m & 1 && (u*=e), m & 2 && (C*=e));
                    e = c.height;
                    var ab = v.top + f.y * c.height, jb = v.bottom - v.top, v = e - v.bottom - f.y * c.height;
                    m & 8 && (e -= ab);
                    m & 16 && (e -= jb);
                    m & 32 && (e -= v);
                    e != c.height && (e = (d.height - e) / (c.height - e), m & 8 && (ab*=e), m & 16 && (jb*=e));
                    m = k.ha;
                    k.c(C, jb);
                    k.a(u + m.x * C - f.x * d.width, ab + m.y * jb - f.y * d.height)
                }
            }
        }
    this.A = d;
    return S(this, 2)
};
q.Vd = function() {
    return this.Vc
};
q.ka = function(a) {
    if (!this.u)
        return a;
    a = this.getParent().ka(a);
    return Uc(this, a)
};
function Uc(a, b) {
    if (!a.getParent())
        return n;
    b.x -= a.e.x;
    b.y -= a.e.y;
    b.x/=a.H.x;
    b.y/=a.H.y;
    if (0 != a.O) {
        var c = b.d(), d = a.O * Math.PI / 180, e = Math.cos(d), d = Math.sin(d);
        b.x = e * c.x - d * c.y;
        b.y = e * c.y + d * c.x
    }
    return b
}
q.ob = function(a) {
    return !this.u ? a : this.getParent().ob(Wa(this, a))
};
function Wa(a, b) {
    if (!a.getParent())
        return b;
    var c = b.d();
    if (0 != a.O) {
        var d =- a.O * Math.PI / 180, e = Math.cos(d), d = Math.sin(d);
        c.x = e * b.x - d * b.y;
        c.y = e * b.y + d * b.x
    }
    c.x*=a.H.x;
    c.y*=a.H.y;
    c.x += a.e.x;
    c.y += a.e.y;
    return c
}
function gd(a, b) {
    a.F = b;
    var c = a.Fb;
    0 == a.F&&!c ? (ed(a, l), a.Uc = 1) : 0 != a.F && (c && a.Uc) && ed(a, p);
    if (t(a.n[Rc]))
        return a;
    S(a, Sc);
    return a
}
function Zc(a) {
    function b() {
        this.b = this.G = this.Q = pc(c);
        this.lb && hc(this.b, this.lb);
        this.p|=-1
    }
    var c = F(a.r) == G ? "canvas": "div";
    if (a.b) {
        if (a.b.tagName.toLowerCase() != c) {
            var d = a.G;
            b.call(a);
            d.parentNode && d.parentNode.replaceChild(a.G, d)
        }
    } else 
        b.call(a)
}
function $c(a) {
    a.G && (vc(a.G), delete a.b, delete a.G, delete a.Q)
}
q.Pa = function() {
    this.p&=-65;
    this.pb() ? Zc(this) : $c(this);
    if (this.q && this.q.p & 64)
        this.q.Pa();
    else if (this.pb()) {
        for (var a = 0, b; b = this.h[a]; a++)
            b instanceof R && b.Pa();
            this.r.Pa.call(this)
    }
};
q.update = function(a) {
    var b, c;
    a = a || 0;
    fa(this);
    this.p & 64 && this.Pa();
    var d = F(this.r) == K || a;
    if (d) {
        for (var e in this.Hc)
            delete this.n[e], delete this.W[e], b = parseInt(e, 10) == Rc ? "opacity" : Ic, Nc(this.b, b), this.b != this.Q && Nc(this.De, b);
        b = 0;
        for (e in this.ma)
            c = this.ma[e], c[3] || (c[3] = 1, e == J && this.le != this.e && (S(this, Vc, 0, l), b = 1), e == Qa && this.oe != this.H && (S(this, 2, 0, l), b = 1), e == Rc && this.ie != this.F && (S(this, Sc, 0, l), b = 1), e == Sa && this.ne != this.O && (S(this, 128, 0, l), b = 1));
        if (!b)
            for (e in this.ma) {
                c = this.ma[e];
                b = parseInt(e,
                10) == Rc ? "opacity" : Ic;
                if (F(this.r) == K || "opacity" != b)
                    this.n[e] = c[0], Mc(this.b, b, c[1], c[2]), this.b != this.Q && b == Ic && Mc(this.Q, b, c[1], c[2]);
                    delete this.ma[e]
            }
        this.le = this.e;
        this.oe = this.H;
        this.ie = this.F;
        this.ne = this.O;
        this.Hc = {}
    }
    a ? this.r.Pd.call(this) : (F(this.r) == G && (c = Yc(this), c.Nb = 1, c == this && (this.p == Vc&&!this.j) && (c.Nb = 0), pa(Yc(this), 1)), this.r.update.call(this));
    if (d)
        for (e in this.n)
            this.n[e] && (this.W[e] = l);
    if (this.ya)
        for (e = 0; e < this.ya.length; e++)
            S(this.ya[e], 7);
    S(this, 0, a)
};
q.getParent = function() {
    return this.q ? this.q : n
};
q.appendChild = function(a, b) {
    a instanceof R && a.getParent() ? a.getParent().removeChild(a) : a.parentNode && vc(a);
    a.q = this;
    b == h ? this.h.push(a) : Ia(this.h, b, 0, a);
    F(this.r) != K && Xc(a, F(this.r));
    a instanceof R && (this.u && hd(a), S(a, 64));
    return S(this, 64)
};
q.removeChild = function(a) {
    a = this.h.indexOf(a);
    if (0 <= a && this.h.length > a) {
        var b = 0 <= a && this.h.length > a ? this.h[a]: n;
        b.Ja && Wc(b.Ja, n);
        b instanceof R ? (this.u && id(b), $c(b), b.q = n) : vc(b);
        this.h.splice(a, 1);
        a = S(this, 64)
    } else 
        a = this;
    return a
};
q.rc = function(a, b, c, d) {
    Q.prototype.rc.apply(this, arguments);
    fc && "mouse" == a.substring(0, 5) || (t(this.L[a]) || (this.L[a] = [0, 0]), this.u && 0 == this.L[a][0] && (this.L[a][0] = 1, this.P().Ta.Ob(this, a)), this.L[a][1]++)
};
q.Ic = function(a, b, c, d) {
    Q.prototype.Ic.apply(this, arguments);
    fc && "mouse" == a.substring(0, 5) || (this.u && 1 == this.L[a][1] && (this.L[a][0] = 0, this.P().Ta.qb(this, a)), this.L[a][1]--, this.L[a][1] || delete this.L[a])
};
q.P = function() {
    return !this.u ? n : this.bc
};
q.Db = function() {
    return !this.u ? n : this.Cc
};
function id(a) {
    var b;
    a.zb || cd(a, a.getParent());
    for (var c = 0; b = a.h[c]; c++)
        b instanceof R && id(b);
    for (var d in a.L) {
        a.L[d][0] = 0;
        if (!a.P())
            debugger;
        a.P().Ta.qb(a, d)
    }
    jd(a.P().Ta, a);
    a.u = p;
    a.bc = n;
    a.Cc = n
}
function hd(a) {
    a.u = l;
    a.bc = a.q.P();
    a.Cc = a.q.Db();
    for (var b = 0, c; c = a.h[b]; b++)
        c instanceof R && hd(c);
    for (var d in a.L)
        a.L[d][0] = 1, a.P().Ta.Ob(a, d);
    a.zb && (a.zb = l, a.u && dd(a, a.getParent()));
    jd(a.P().Ta, a)
}
function dd(a, b) {
    b.ya || (b.ya = []);
    Ga(b.ya, a);
    !b&&!(b.getParent()instanceof H) && dd(a, b.getParent())
}
function cd(a, b) {
    b && b.ya && (Ha(b.ya, a), cd(a, b.getParent()))
}
function I(a) {
    var b = a.f();
    a = a.ha;
    return new La( - b.height * a.y, b.width * (1 - a.x), b.height * (1 - a.y), - b.width * a.x)
}
function fd(a, b) {
    var c = b || I(a), d = new D(c.left, c.top), e = new D(c.right, c.top), f = new D(c.left, c.bottom), c = new D(c.right, c.bottom), d = Wa(a, d), e = Wa(a, e), f = Wa(a, f), c = Wa(a, c);
    return new La(Math.floor(Math.min(d.y, e.y, f.y, c.y)), Math.ceil(Math.max(d.x, e.x, f.x, c.x)), Math.ceil(Math.max(d.y, e.y, f.y, c.y)), Math.floor(Math.min(d.x, e.x, f.x, c.x)))
}
q.Ib = function() {
    var a = I(this);
    a.left == a.right && this.h.length && (a = fd(this.h[0], this.h[0].Ib()));
    for (var b = 0, c; c = this.h[b]; b++)
        if (1 != c.mc) {
            var d = a;
            c = fd(c, c.Ib());
            d.left = Math.min(d.left, c.left);
            d.top = Math.min(d.top, c.top);
            d.right = Math.max(d.right, c.right);
            d.bottom = Math.max(d.bottom, c.bottom)
        }
    return a
};
q.aa = function(a) {
    this.Hc[a] = 1
};
q.Ea = function(a) {
    var b = this.ka(a.Za);
    return I(this).contains(b) ? (a.position = b, l) : p
};
function T(a, b) {
    Ga(b.ga, a);
    b.play()
};
function kd() {
    R.call(this);
    this.lb = "lime-layer"
}
z(kd, R);
kd.prototype.Ea = function(a) {
    for (var b = 0, c; c = this.h[b]; b++)
        if (c.Ea(a))
            return a.position = this.ka(a.Za), l;
    return p
};
var U = new function() {
    this.$ = [];
    this.Ad = this.Qa = p;
    this.md = 0;
    this.dc = 1E3 / 30;
    this.Fa = 0
};
function ld(a, b, c) {
    this.Cb = a;
    this.xa = b;
    this.paused = p;
    this.m = c
}
function md(a, b) {
    this.vc = a;
    this.pc = t(b) ? b : -1;
    this.qa = []
}
md.prototype.cb = function(a) {
    if (this.qa.length)
        for (var b, c = this.qa.length; 0<=--c;)
            if ((b = this.qa[c])&&!b.paused && da(b.Cb))
                if (b.m > a)
                    b.m -= a;
                else {
                    var d = this.vc + a - b.m;
                    b.m = this.vc - (a - b.m);
                    0 > b.m && (b.m = 0);
                    b.Cb.call(b.xa, d);
                    -1 !== this.pc && (this.pc--, 0 == this.pc && U.vb(b.Cb, b.xa))
                }
};
U.$.push(new md(0));
for (var nd = ["webkit", "moz"], od = 0; od < nd.length&&!s.requestAnimationFrame; ++od)
    s.requestAnimationFrame = window[nd[od] + "RequestAnimationFrame"], s.cancelAnimationFrame = s[nd[od] + "CancelAnimationFrame"] || s[nd[od] + "CancelRequestAnimationFrame"];
U.Oc=!!s.requestAnimationFrame;
U.He = function() {
    return this.dc
};
U.Qe = function(a) {
    this.dc = a;
    this.Qa && (U.cd(), U.Pc())
};
U.Qb = function(a, b, c) {
    c = t(c) ? c : this.$[0];
    Ga(c.qa, new ld(a, b, c.vc));
    Ga(this.$, c);
    this.Qa || U.Pc()
};
U.vb = function(a, b) {
    for (var c = this.$.length; 0<=--c;) {
        for (var d = this.$[c], e = d.qa, f, g = e.length; 0<=--g;)
            f = e[g], f.Cb == a && f.xa == b && Ha(e, f);
        0 == e.length && 0 != c && Ha(this.$, d)
    }
    1 == this.$.length && 0 == this.$[0].qa.length && U.cd()
};
U.Pc = function() {
    this.Qa || (this.Ad ? this.Qc() : setTimeout(ka(this.Qc, this)), this.Qa = this.Ad = l)
};
U.Qc = function() {
    this.Fa = this.now();
    U.Oc && s.requestAnimationFrame ? s.mozRequestAnimationFrame && 11 > Ab ? (s.mozRequestAnimationFrame(), this.Wc = ka(U.Kd, this), s.addEventListener("MozBeforePaint", this.Wc, p)) : (this.Yb = ka(U.Id, this), s.requestAnimationFrame(this.Yb)) : this.md = setInterval(ka(U.ue, this), U.dc)
};
(function() {
    var a = s.performance, b = a && (a.now || a.webkitNow);
    U.now = function() {
        return b ? b.call(a) : ma()
    }
})();
U.cd = function() {
    this.Qa && (U.Oc && s.requestAnimationFrame ? s.mozRequestAnimationFrame && 11 > Ab ? s.removeEventListener("MozBeforePaint", this.Wc, p) : s.cancelAnimationFrame(this.Yb) : clearInterval(this.md), this.Qa = p)
};
U.Id = function() {
    time = this.now();
    var a = time - this.Fa;
    0 > a && (a = 1);
    U.cc(a);
    this.Fa = time;
    s.requestAnimationFrame(this.Yb)
};
U.Kd = function(a) {
    U.cc(a.timeStamp - this.Fa);
    this.Fa = a.timeStamp;
    s.mozRequestAnimationFrame()
};
U.ue = function() {
    var a = this.now(), b = a - this.Fa;
    0 > b && (b = 1);
    U.cc(b);
    this.Fa = a
};
U.cc = function(a) {
    for (var b = this.$.slice(), c = b.length; 0<=--c;)
        b[c].cb(a);
    1 == oa && (/Firefox\/18./.test(rb())&&!na.Ce) && (U.td ? (document.body.style.MozTransform = "", U.td = 0) : (document.body.style.MozTransform = "scale(1,1)", U.td = 1), oa = 0)
};
U.Nd = function(a) {
    for (var b, c, d, e, f = this.$.length; 0<=--f;) {
        b = this.$[f];
        for (e = b.qa.length; 0<=--e;)
            d = b.qa[e], c = d.xa, da(c.P) && (c = c.P(), c == a && (d.paused = p))
    }
};
U.Md = function(a, b) {
    U.Dc(a, b, 100, 1)
};
U.Dc = function(a, b, c, d) {
    U.Qb(a, b, new md(c, d))
};
var pd;
function V() {
    Q.call(this);
    this.ga = [];
    this.lc = [];
    this.Tb = {};
    this.Je = p;
    this.v = 1;
    this.Sa = qd;
    this.J = 0
}
z(V, Q);
q = V.prototype;
q.scope = "";
q.s = function(a) {
    this.v = a;
    return this
};
q.play = function() {
    this.Ac = 0;
    this.jd = this.J = 1;
    U.Qb(this.cb, this);
    this.dispatchEvent({
        type: "start"
    })
};
q.stop = function() {
    if (0 != this.J) {
        var a = this.lc;
        if (rd(this) && this.aa)
            for (var b = a.length; 0<=--b;)
                this.aa(a[b]);
        this.lc = [];
        this.Tb = {};
        this.J = 0;
        U.vb(this.cb, this);
        this.dispatchEvent({
            type: "stop"
        })
    }
};
q.Va = function() {
    return {}
};
function sd(a, b) {
    var c = fa(b);
    t(a.Tb[c]) || (a.mb(b), a.Tb[c] = a.Va(b));
    return a.Tb[c]
}
q.mb = function(a) {
    td.Ob(this, a);
    this.J = 1;
    Ga(this.lc, a);
    this.sb && (!this.Ec && this.hb) && this.hb()
};
q.P = function() {
    return this.ga[0] ? this.ga[0].P() : n
};
q.cb = function(a) {
    this.sb && (!this.Ec && this.hb) && this.hb();
    this.jd && (delete this.jd, a = 1);
    this.Ac += a;
    this.Ge = a;
    a = this.Ac / (1E3 * this.v);
    if (isNaN(a) || 1 <= a)
        a = 1;
    a = this.va(a, this.ga);
    1 == a && this.stop()
};
q.va = function(a, b) {
    a = this.Sa[0](a);
    isNaN(a) && (a = 1);
    for (var c = b.length; 0<=--c;)
        this.update(a, b[c]);
    return a
};
function rd(a) {
    return cc && 0 < a.v && Lc && a.je
}
function ud(a) {
    a.je = t(h) ? h : l;
    return a
}
var td = new function() {
    this.g = {}
};
td.Ob = function(a, b) {
    if (a.scope.length) {
        var c = fa(b);
        t(this.g[c]) || (this.g[c] = {});
        t(this.g[c][a.scope]) && this.g[c][a.scope].stop();
        this.g[c][a.scope] = a
    }
};
td.ve = function(a) {
    a = fa(a);
    if (t(this.g[a])) {
        for (var b in this.g[a])
            this.g[a][b].stop(), delete this.g[a][b];
        delete this.g[a]
    }
};
(function() {
    function a(a) {
        var e, f, g, C;
        g = a;
        for (f = 0; 8 > f; f++) {
            C = ((b * g + c) * g + d) * g - a;
            if (5E-5 > (0 <= C ? C : 0 - C))
                return g;
            e = (3 * b * g + 2 * c) * g + d;
            if (1E-6 > (0 <= e ? e : 0 - e))
                break;
            g -= C / e
        }
        e = 0;
        f = 1;
        g = a;
        if (g < e)
            return e;
        if (g > f)
            return f;
        for (; e < f;) {
            C = ((b * g + c) * g + d) * g;
            if (5E-5 > (0 <= C - a ? C - a : 0 - (C - a)))
                break;
            a > C ? e = g : f = g;
            g = 0.5 * (f - e) + e
        }
        return g
    }
    var b = 0, c = 0, d = 0, e = 0, f = 0, g = 0;
    pd = function(k, m, v, u) {
        return [function(C) {
            d = 3 * k;
            c = 3 * (v - k) - d;
            b = 1 - d - c;
            g = 3 * m;
            f = 3 * (u - m) - g;
            e = 1 - g - f;
            return ((e * a(C) + f) * a(C) + g) * a(C)
        }, k, m, v, u]
    }
})();
var vd = [function(a) {
    return a
}, 0, 0, 1, 1], qd = pd(0.42, 0, 0.58, 1);
var wd = {
    aliceblue: "#f0f8ff",
    antiquewhite: "#faebd7",
    aqua: "#00ffff",
    aquamarine: "#7fffd4",
    azure: "#f0ffff",
    beige: "#f5f5dc",
    bisque: "#ffe4c4",
    black: "#000000",
    blanchedalmond: "#ffebcd",
    blue: "#0000ff",
    blueviolet: "#8a2be2",
    brown: "#a52a2a",
    burlywood: "#deb887",
    cadetblue: "#5f9ea0",
    chartreuse: "#7fff00",
    chocolate: "#d2691e",
    coral: "#ff7f50",
    cornflowerblue: "#6495ed",
    cornsilk: "#fff8dc",
    crimson: "#dc143c",
    cyan: "#00ffff",
    darkblue: "#00008b",
    darkcyan: "#008b8b",
    darkgoldenrod: "#b8860b",
    darkgray: "#a9a9a9",
    darkgreen: "#006400",
    darkgrey: "#a9a9a9",
    darkkhaki: "#bdb76b",
    darkmagenta: "#8b008b",
    darkolivegreen: "#556b2f",
    darkorange: "#ff8c00",
    darkorchid: "#9932cc",
    darkred: "#8b0000",
    darksalmon: "#e9967a",
    darkseagreen: "#8fbc8f",
    darkslateblue: "#483d8b",
    darkslategray: "#2f4f4f",
    darkslategrey: "#2f4f4f",
    darkturquoise: "#00ced1",
    darkviolet: "#9400d3",
    deeppink: "#ff1493",
    deepskyblue: "#00bfff",
    dimgray: "#696969",
    dimgrey: "#696969",
    dodgerblue: "#1e90ff",
    firebrick: "#b22222",
    floralwhite: "#fffaf0",
    forestgreen: "#228b22",
    fuchsia: "#ff00ff",
    gainsboro: "#dcdcdc",
    ghostwhite: "#f8f8ff",
    gold: "#ffd700",
    goldenrod: "#daa520",
    gray: "#808080",
    green: "#008000",
    greenyellow: "#adff2f",
    grey: "#808080",
    honeydew: "#f0fff0",
    hotpink: "#ff69b4",
    indianred: "#cd5c5c",
    indigo: "#4b0082",
    ivory: "#fffff0",
    khaki: "#f0e68c",
    lavender: "#e6e6fa",
    lavenderblush: "#fff0f5",
    lawngreen: "#7cfc00",
    lemonchiffon: "#fffacd",
    lightblue: "#add8e6",
    lightcoral: "#f08080",
    lightcyan: "#e0ffff",
    lightgoldenrodyellow: "#fafad2",
    lightgray: "#d3d3d3",
    lightgreen: "#90ee90",
    lightgrey: "#d3d3d3",
    lightpink: "#ffb6c1",
    lightsalmon: "#ffa07a",
    lightseagreen: "#20b2aa",
    lightskyblue: "#87cefa",
    lightslategray: "#778899",
    lightslategrey: "#778899",
    lightsteelblue: "#b0c4de",
    lightyellow: "#ffffe0",
    lime: "#00ff00",
    limegreen: "#32cd32",
    linen: "#faf0e6",
    magenta: "#ff00ff",
    maroon: "#800000",
    mediumaquamarine: "#66cdaa",
    mediumblue: "#0000cd",
    mediumorchid: "#ba55d3",
    mediumpurple: "#9370db",
    mediumseagreen: "#3cb371",
    mediumslateblue: "#7b68ee",
    mediumspringgreen: "#00fa9a",
    mediumturquoise: "#48d1cc",
    mediumvioletred: "#c71585",
    midnightblue: "#191970",
    mintcream: "#f5fffa",
    mistyrose: "#ffe4e1",
    moccasin: "#ffe4b5",
    navajowhite: "#ffdead",
    navy: "#000080",
    oldlace: "#fdf5e6",
    olive: "#808000",
    olivedrab: "#6b8e23",
    orange: "#ffa500",
    orangered: "#ff4500",
    orchid: "#da70d6",
    palegoldenrod: "#eee8aa",
    palegreen: "#98fb98",
    paleturquoise: "#afeeee",
    palevioletred: "#db7093",
    papayawhip: "#ffefd5",
    peachpuff: "#ffdab9",
    peru: "#cd853f",
    pink: "#ffc0cb",
    plum: "#dda0dd",
    powderblue: "#b0e0e6",
    purple: "#800080",
    red: "#ff0000",
    rosybrown: "#bc8f8f",
    royalblue: "#4169e1",
    saddlebrown: "#8b4513",
    salmon: "#fa8072",
    sandybrown: "#f4a460",
    seagreen: "#2e8b57",
    seashell: "#fff5ee",
    sienna: "#a0522d",
    silver: "#c0c0c0",
    skyblue: "#87ceeb",
    slateblue: "#6a5acd",
    slategray: "#708090",
    slategrey: "#708090",
    snow: "#fffafa",
    springgreen: "#00ff7f",
    steelblue: "#4682b4",
    tan: "#d2b48c",
    teal: "#008080",
    thistle: "#d8bfd8",
    tomato: "#ff6347",
    turquoise: "#40e0d0",
    violet: "#ee82ee",
    wheat: "#f5deb3",
    white: "#ffffff",
    whitesmoke: "#f5f5f5",
    yellow: "#ffff00",
    yellowgreen: "#9acd32"
};
function xd(a) {
    var b = {};
    a = String(a);
    var c = "#" == a.charAt(0) ? a: "#" + a;
    if (yd.test(c))
        return b.jc = zd(c), b.type = "hex", b;
    a: {
        var d = a.match(Ad);
        if (d) {
            var c = Number(d[1]), e = Number(d[2]), d = Number(d[3]);
            if (0 <= c && 255 >= c && 0 <= e && 255 >= e && 0 <= d && 255 >= d) {
                c = [c, e, d];
                break a
            }
        }
        c = []
    }
    if (c.length)
        return b.jc = Bd(c[0], c[1], c[2]), b.type = "rgb", b;
    if (wd && (c = wd[a.toLowerCase()]))
        return b.jc = c, b.type = "named", b;
    throw Error(a + " is not a valid color string");
}
var Cd = /#(.)(.)(.)/;
function zd(a) {
    if (!yd.test(a))
        throw Error("'" + a + "' is not a valid hex color");
    4 == a.length && (a = a.replace(Cd, "#$1$1$2$2$3$3"));
    return a.toLowerCase()
}
function Dd(a) {
    a = zd(a);
    return [parseInt(a.substr(1, 2), 16), parseInt(a.substr(3, 2), 16), parseInt(a.substr(5, 2), 16)]
}
function Bd(a, b, c) {
    a = Number(a);
    b = Number(b);
    c = Number(c);
    if (isNaN(a) || 0 > a || 255 < a || isNaN(b) || 0 > b || 255 < b || isNaN(c) || 0 > c || 255 < c)
        throw Error('"(' + a + "," + b + "," + c + '") is not a valid RGB color');
    a = Ed(a.toString(16));
    b = Ed(b.toString(16));
    c = Ed(c.toString(16));
    return "#" + a + b + c
}
function Fd(a, b, c) {
    0 > c ? c += 1 : 1 < c && (c -= 1);
    return 1 > 6 * c ? a + 6 * (b - a) * c : 1 > 2 * c ? b : 2 > 3 * c ? a + 6 * (b - a) * (2 / 3 - c) : a
}
var yd = /^#(?:[0-9a-f]{3}){1,2}$/i, Ad = /^(?:rgb)?\((0|[1-9]\d{0,2}),\s?(0|[1-9]\d{0,2}),\s?(0|[1-9]\d{0,2})\)$/i;
function Ed(a) {
    return 1 == a.length ? "0" + a : a
};
function Gd() {
    Q.call(this)
}
z(Gd, Q);
Gd.prototype.kc = aa;
function Hd(a) {
    if (a[0]instanceof Gd)
        return a[0];
    w(a) || (a = B(arguments));
    return 2 < a.length ? new Id(a) : x(a[0]) && ("rgb(" == a[0].substring(0, 4) || "rgba(" == a[0].substring(0, 5) || "#" == a[0].substring(0, 1)) ? new Id(a[0]) : new Jd(a[0])
}
Gd.prototype.$a = aa;
Gd.prototype.ea = aa;
function Id(a) {
    Q.call(this);
    this.wa = 1;
    this.fa(a)
}
z(Id, Gd);
q = Id.prototype;
q.id = "color";
function Kd(a) {
    var b = n;
    y(a.Xa) && y(a.Ua) && y(a.Ra) ? b = [a.Xa, a.Ua, a.Ra, a.wa] : x(a.V) && (a = xd(a.V), "named" != a.type && (b = Dd(a.jc)), b.push(1));
    return b
}
function Ld(a, b) {
    return Md(a, 2, b)
}
function Md(a, b, c) {
    c = c || 0.1;
    var d = Kd(a);
    if (!d)
        return a;
    d.pop();
    var e = d[0] / 255, f = d[1] / 255, d = d[2] / 255, g = Math.max(e, f, d), k = Math.min(e, f, d), m = 0, v = 0, u = 0.5 * (g + k);
    g != k && (g == e ? m = 60 * (f - d) / (g - k) : g == f ? m = 60 * (d - e) / (g - k) + 120 : g == d && (m = 60 * (e - f) / (g - k) + 240), v = 0 < u && 0.5 >= u ? (g - k) / (2 * u) : (g - k) / (2-2 * u));
    d = [Math.round(m + 360)%360, v, u];
    d[b] += c;
    1 < d[b] && (d[b] = 1);
    b = d[1];
    c = d[2];
    g = f = e = 0;
    d = d[0] / 360;
    0 == b ? e = f = g = 255 * c : (k = g = 0, k = 0.5 > c ? c * (1 + b) : c + b - b * c, g = 2 * c - k, e = 255 * Fd(g, k, d + 1 / 3), f = 255 * Fd(g, k, d), g = 255 * Fd(g, k, d-1 / 3));
    d = [Math.round(e), Math.round(f),
    Math.round(g)];
    d.push(a.wa);
    return a.fa(d)
}
q.fa = function(a) {
    var b = a;
    if (x(a))
        return this.V = a, this;
    2 < arguments.length && (b = arguments);
    3 <= b.length && (this.Xa = b[0], this.Ua = b[1], this.Ra = b[2]);
    4 == b.length && (this.wa = b[3]);
    this.V = 1 == this.wa ? "rgb(" + this.Xa + "," + this.Ua + "," + this.Ra + ")" : "rgba(" + this.Xa + "," + this.Ua + "," + this.Ra + "," + this.wa + ")";
    return this
};
q.$a = function(a) {
    a.style.background = this.V
};
q.ea = function(a) {
    a.fillStyle = this.V
};
q.d = function() {
    var a = new Id("");
    a.Xa = this.Xa;
    a.Ua = this.Ua;
    a.Ra = this.Ra;
    a.wa = this.wa;
    a.V = this.V;
    return a
};
function Nd(a, b) {
    Q.call(this);
    var c = w(a) ? a: B(arguments);
    this.C = c[0] || 1;
    c.shift();
    this.fa.apply(this, c)
}
z(Nd, Gd);
q = Nd.prototype;
q.id = "stroke";
q.$a = function(a) {
    a.style.border = this.C + "px solid " + this.oa.V
};
q.ea = function(a) {
    a.strokeStyle = this.oa.V;
    a.lineWidth = this.C
};
q.fa = function(a) {
    var b = B(arguments);
    b[0]instanceof Id ? this.oa = b[0] : (this.oa = new Id("#000"), b.length && this.oa.fa.apply(this.oa, b));
    return this
};
q.d = function() {
    var a = new Nd;
    a.C = this.C;
    a.oa = this.oa;
    return a
};
function Jd(a) {
    Q.call(this);
    a && da(a.data) && (a = a.data());
    x(a) ? (this.X = a, 50 < this.X.length && (this.X = this.X.substr(-50)), Od[this.X] ? this.M = Od[this.X] : (this.M = new Image, this.M.src = a)) : (this.X = a.src, 50 < this.X.length && (this.X = this.X.substr(-50)), this.M = Od[this.X] ? Od[this.X] : a);
    Pd(this) || P(this.M, "load", this.Yd, p, this);
    Od[this.X] = this.M
}
z(Jd, Gd);
var Od = {};
q = Jd.prototype;
q.id = "image";
q.kc = function(a) {
    var b = a.f(), c = this;
    !b.width&&!b.height && (Pd(this) ? a.c(this.M.width, this.M.height) : P(this, "load", function() {
        var a = this.f();
        !a.width&&!a.height && this.c(c.M.width, c.M.height)
    }, p, a));
    Pd(this) || P(this, "load", function() {
        S(a, 4)
    }, p, this)
};
q.Yd = function(a) {
    this.dispatchEvent(a)
};
function Pd(a) {
    return !(!a.M ||!a.M.width ||!a.M.height)
}
q.c = function(a, b, c) {
    y(a) && (a = new E(a, b), b = c || p);
    this.A = a;
    this.re = b;
    return this
};
function Qd(a, b) {
    var c = b.f().d();
    a.A && (a.re ? (c.width*=a.A.width, c.height*=a.A.height) : c = a.A);
    var d = new D(0, 0);
    a.yc && (a.Ke ? (d.x = c.width * a.yc.x, d.y = c.height * a.yc.y) : d = a.yc);
    return [c, d]
}
q.Fd = cc && (ec || /CriOS/.test(s.navigator.userAgent));
q.$a = function(a, b) {
    var c = "url(" + this.M.src + ")";
    if (this.Fd) {
        var d = a.style.background;
        if (!d||-1 === d.indexOf(c))
            a.style.background = c
    } else 
        a.style.background = c;
    d = Qd(this, b);
    c = d[0];
    d = d[1];
    a.style[Kc("BackgroundSize")] = c.width + "px " + c.height + "px";
    c = b.B ? b.B.C : 0;
    a.style.backgroundPosition = d.x - c + "px " + (d.y - c) + "px";
    this.Oe && (a.style.imageRendering = "optimizeQuality")
};
q.ea = function(a, b) {
    var c = b.f(), d = I(b);
    if (c.width && c.height)
        try {
            var e = this.M, f = Qd(this, b), g = f[0], k = f[1], m = a.createPattern(e, "repeat"), v = g.width / e.width, u = g.height / e.height;
            a.save();
            a.translate(d.left + k.x, d.top + k.y);
            a.scale(v, u);
            a.fillStyle = m;
            "circle" === b.id || "roundedrect" === b.id ? a.fill() : a.fillRect( - k.x / v, - k.y / u, c.width / v, c.height / u);
            a.restore()
    } catch (C) {}
};
G.D = {};
K.D = {};
function W() {
    R.call(this);
    this.B = this.pa = n
}
z(W, R);
W.prototype.id = "sprite";
W.prototype.ta = [Oa(K, K.D), Oa(G, G.D)];
W.prototype.o = function(a, b, c, d) {
    this.pa = Hd(B(arguments));
    this.pa.kc(this);
    S(this, 4);
    return this
};
W.prototype.qe = function(a) {
    a&&!(a instanceof Nd) && (a = new Nd(B(arguments)));
    this.B = a;
    S(this, 4)
};
K.D.t = function(a) {
    this.pa === n || this.pa.$a(a, this);
    this.B === n ? this.ld && (x("border-width") ? zc(a, 0, "border-width") : fb("border-width", la(zc, a)), this.ld = p) : (this.B.$a(a, this), this.ld = l)
};
G.D.t = function(a) {
    var b = this.f(), c = this.pa, d = this.B;
    if (c || d) {
        var e = I(this);
        c && (c.ea(a, this), "image" != c.id && "frame" != c.id && a.fillRect(e.left, e.top, b.width, b.height));
        if (d && (d.ea(a, this), "sprite" == this.id || "label" == this.id))
            c = d.C / 2, a.strokeRect(e.left + c, e.top + c, b.width-2 * c, b.height-2 * c)
    }
};
function Rd() {
    V.call(this)
}
z(Rd, V);
Rd.prototype.update = aa;
function Sd(a) {
    V.call(this);
    var b = B(arguments);
    w(a) && (b = a);
    this.g = 2 < b.length ? [b.shift(), new Sd(b)] : b;
    this.s(this.g[0].v + this.g[1].v)
}
z(Sd, V);
Sd.prototype.mb = function(a) {
    V.prototype.mb.call(this, a);
    this.s(this.g[0].v + this.g[1].v);
    this.bb = this.g[0].v / this.v;
    this.ca =- 1
};
Sd.prototype.stop = function() {
    this.ca&&-1 != this.ca && this.g[this.ca].stop(this.ga);
    V.prototype.stop.apply(this, arguments)
};
Sd.prototype.va = function(a, b) {
    if (0 == this.J)
        return a;
    for (var c = b.length; 0<=--c;)
        sd(this, b[c]);
    var d = c = 0;
    a >= this.bb ? (c = 1, d = 1 == this.bb ? 1 : (a - this.bb) / (1 - this.bb)) : (c = 0, d = 0 != this.bb ? a / this.bb : 1);
    -1 == this.ca && 1 == c && (this.g[0].J = 1, this.g[0].va(1, b), this.g[0].stop());
    this.ca != c && (-1 != this.ca && this.g[this.ca] && (this.g[this.ca].va(1, b), this.g[this.ca].stop()), this.g[c].J = 1);
    this.g[c].va(d, b);
    this.ca = c;
    return a
};
function Td(a) {
    V.call(this);
    var b = B(arguments);
    w(a) && (b = a);
    2 < b.length ? (this.Wa = b.shift(), this.eb = new Td(b)) : (this.Wa = b[0], this.eb = b[1]);
    var b = this.Wa.v, c = this.eb.v;
    this.s(Math.max(b, c));
    var d = new Rd;
    b > c ? this.eb = new Sd(this.eb, d.s(b - c)) : b < c && (this.Wa = new Sd(this.Wa, d.s(c - b)))
}
z(Td, V);
Td.prototype.mb = function(a) {
    V.prototype.mb.call(this, a);
    this.Wa.J = 1;
    this.eb.J = 1
};
Td.prototype.va = function(a, b) {
    if (0 != this.J) {
        for (var c = b.length; 0<=--c;)
            sd(this, b[c]);
        this.Wa.va(a, b);
        this.eb.va(a, b);
        return a
    }
};
function Ud(a, b) {
    kd.call(this);
    this.lb = "lime-button";
    t(a) && (this.K = a, this.appendChild(this.K), this.ub =- 1, Vd(this, Wd));
    t(b) && Xd(this, b);
    var c = this;
    P(this, ["mousedown", "touchstart", "touchmove"], function(a) {
        Vd(c, Yd);
        a.Na("mousemove", function(a) {
            c.Ea(a) ? Vd(c, Yd) : Vd(c, Wd)
        });
        a.Na("touchmove", function(a) {
            c.Ea(a) || (Vd(c, Wd), a.qb())
        });
        a.Na(["mouseup", "touchend"], function(a) {
            c.Ea(a) && c.dispatchEvent({
                type: Zd
            });
            Vd(this, Wd)
        })
    })
}
z(Ud, kd);
var Wd = 0, Yd = 1, Zd = "click";
function Xd(a, b) {
    a.Y = b;
    a.appendChild(b);
    a.ub =- 1;
    Vd(a, Wd)
}
function Vd(a, b) {
    if (b != a.ub) {
        a.ub == Wd && b == Yd && a.dispatchEvent({
            type: "down"
        });
        a.ub == Yd && b == Wd && a.dispatchEvent({
            type: "up"
        });
        var c = a.K;
        t(a.Y) && (Yd == b ? c = a.Y : ed(a.Y, l));
        c != a.K && ed(a.K, l);
        ed(c, p);
        a.ub = b
    }
};
G.gb = {};
K.gb = {};
function X() {
    W.call(this);
    $d(this, 5)
}
z(X, W);
X.prototype.id = "roundedrect";
X.prototype.ta = [Oa(K.D, K.gb), Oa(G.D, G.gb)];
function $d(a, b) {
    a.Se = p;
    a.Bc = b;
    return a
}
K.gb.t = function(a) {
    this.f();
    K.D.t.call(this, a);
    Pc(a, [this.Bc, this.Bc])
};
function ae(a, b, c, d, e, f) {
    a.save();
    a.beginPath();
    a.moveTo(b + f, c);
    a.lineTo(b + d - f, c);
    a.quadraticCurveTo(b + d, c, b + d, c + f);
    a.lineTo(b + d, c + e - f);
    a.quadraticCurveTo(b + d, c + e, b + d - f, c + e);
    a.lineTo(b + f, c + e);
    a.quadraticCurveTo(b, c + e, b, c + e - f);
    a.lineTo(b, c + f);
    a.quadraticCurveTo(b, c, b + f, c);
    a.closePath();
    a.restore()
}
G.gb.t = function(a) {
    var b = this.pa, c = this.B, d = I(this), e = this.Bc, f = d.left, g = d.top, k = d.right - d.left, d = d.bottom - d.top;
    b !== n && (ae(a, f, g, k, d, e), b.ea(a, this), b instanceof Jd || a.fill());
    c !== n && (ae(a, f + c.C / 2, g + c.C / 2, k - c.C, d - c.C, e - c.C / 2), c.ea(a, this), a.stroke())
};
G.fb = {};
K.fb = {};
function Y(a) {
    W.call(this);
    this.xc = p;
    S(this, 4);
    this.i(a);
    this.ab(be);
    this.l(14);
    Z(this, "#000");
    ce(this);
    de(this, "400");
    a = [0, 0, 0, 0];
    t(h) && (a[1] = a[3] = h);
    t(h) && (a[2] = h);
    t(h) && (a[3] = h);
    this.N = a;
    S(this, 8);
    this.ae = p;
    this.pd = 1.15;
    this.pe(n);
    this.o(255, 255, 255, 0);
    this.Fc = "normal";
    S(this, 8)
}
z(Y, W);
Y.prototype.id = "label";
var be = "Arial";
Y.prototype.ta = [Oa(K.D, K.fb), Oa(G.D, G.fb)];
(function() {
    var a;
    Y.prototype.measureText = function() {
        t(a) || (a = document.createElement("canvas").getContext("2d"));
        var b = ee(this) * this.Da;
        this.xc && (b*=sa(this.la).split("\n").length);
        a.font = this.Fc + " " + this.gc + " " + this.Da + "px " + this.fc;
        var c = a.measureText(this.la), d = this.B ? this.B.C: 0;
        return new E(this.N[1] + this.N[3] + (lb.Be ? c.width : c.width + 1) + 2 * d, this.N[0] + this.N[2] + b + 2 * d)
    }
})();
q = Y.prototype;
q.f = function() {
    var a = R.prototype.f.call(this);
    return !a ||!a.width&&!a.height ? this.measureText() : a
};
q.i = function(a) {
    this.la = a + "";
    S(this, 4);
    delete this.Jc;
    return this
};
function de(a, b) {
    a.gc = b;
    S(a, 8);
    return a
}
q.ab = function(a) {
    this.fc = a;
    S(this, 8);
    return this
};
q.l = function(a) {
    this.Da = a;
    S(this, 8);
    return this
};
function Z(a, b) {
    a.ec = b;
    S(a, 8);
    return a
}
function ee(a) {
    var b = Math.abs(a.U.y) + 2 * a.Z;
    return a.ae ? (a.pd + b) / a.Da : a.pd + b / a.Da
}
function ce(a) {
    a.Sc = "center";
    S(a, 8);
    return a
}
q.pe = function(a, b, c, d) {
    1 == arguments.length && a === n ? (this.rb = "#ccc", this.Z = 0, this.Rb(0, 0)) : 2 == arguments.length ? (this.rb = a, this.Z = b, this.Rb(new L(0, 0))) : 3 == arguments.length ? (this.rb = a, this.Z = b, this.Rb(c)) : (this.rb = a, this.Z = b, this.Rb(c, d));
    S(this, 8)
};
q.Rb = function(a, b) {
    this.U = 2 == arguments.length ? new L(arguments[0], arguments[1]) : a;
    S(this, 8)
};
q.update = function() {
    this.p & 4 && delete this.od;
    R.prototype.update.apply(this, arguments)
};
K.fb.t = function(a) {
    K.D.t.call(this, a);
    var b = a.style;
    this.p & 4 && (this.xc ? a.innerHTML = ta(this.la).replace(/\n/g, "<br/>") : xc(a, this.la));
    this.p & 8 && (b.lineHeight = ee(this), b.padding = Fa(this.N, function(a) {
        return a
    }, this).join("px ") + "px", b.color = this.ec, b.fontFamily = this.fc, b.fontSize = this.Da + "px", b.fontWeight = this.gc, b.textAlign = this.Sc, b["font-style"] = this.Fc, b.textShadow = this.Z || this.U.x || this.U.y ? this.rb + " " + this.U.x + "px " + this.U.y + "px " + this.Z + "px" : "")
};
G.fb.t = function(a) {
    G.D.t.call(this, a);
    var b = I(this), c =- b.left - this.N[3] + b.right - this.N[1] + Math.abs(this.U.x) + Math.abs(2 * this.Z), d = 0;
    if (!this.Jc) {
        var d = [], e = this.la.length, f = this.la.match(vb ? /[\s\.]+/g : /[\s-\.]+/g), g = 0;
        if (f)
            for (var k = 0; k < f.length; k++) {
                var m = f[k], m = this.la.indexOf(m, g) + m.length;
                d.push(this.la.substring(g, m));
                g = m
            }
        g != e && d.push(this.la.substring(g, e));
        this.Jc = d;
        d = 1
    }
    e = this.B ? this.B.C : 0;
    a.save();
    f = this.Sc;
    "left" == f ? a.translate(b.left + this.N[3] + e, b.top + this.N[0] + e) : "right" == f ? a.translate(b.right -
    this.N[1] - e, b.top + this.N[0] + e) : "center" == f && a.translate(0.5 * (b.left + this.N[3] + b.right - this.N[1]), b.top + this.N[0] + e);
    b = ee(this);
    a.fillStyle = this.ec;
    a.font = this.Fc + " " + this.gc + " " + this.Da + "px/" + b + " " + this.fc;
    a.textAlign = f;
    a.textBaseline = "top";
    if (this.Z || this.U.x || this.U.y)
        a.shadowColor = this.rb, a.shadowOffsetX = this.U.x, a.shadowOffsetY = this.U.y, a.shadowBlur = this.Z;
    if (d || c != this.od) {
        for (var d = c-2 * e, e = [], f = "", g = this.Jc, v, k = 0; k < g.length; k++) {
            m = 0;
            if (this.xc && (v = g[k].match(/\n/g)))
                m = v.length;
            "" == f ? f = g[k] :
            (v = a.measureText(sa(f + g[k])), v.width > d ? (e.push(sa(f)), f = g[k]) : f += g[k]);
            for (v = 0; v < m; v++)
                e.push(sa(f)), f = ""
        }
        e.push(f);
        this.qc = e;
        this.od = c
    }
    if (this.qc) {
        c = b * this.Da;
        b = (t(this.Z) ? Math.abs(this.Z) : 0) + (t(this.U) ? Math.abs(this.U.y) / 2 : 0);
        c = N ? Math.floor(c) : Math.round(c);
        for (d = 0; d < this.qc.length; d++)
            a.fillText(this.qc[d], 0, c * d + b-0.5)
    }
    a.restore()
};
function fe() {
    Q.call(this);
    this.ib = [];
    ge(this)
}
z(fe, Gd);
q = fe.prototype;
q.id = "lineargradient";
q.kc = function(a) {
    (ub || M) && Xc(a, G)
};
function ge(a) {
    a.z = [0, 0, 0, 1];
    return a
}
q.addColorStop = function(a, b) {
    var c = B(arguments);
    c.shift();
    this.ib.push([a, Hd(c)]);
    return this
};
q.Sd = function(a) {
    return N ? "color-stop(" + a[0] + ", " + a[1].V + ")" : a[1].V + " " + 100 * a[0] * this.me + "%"
};
q.$a = function(a, b) {
    var c, d = I(b);
    c = d.right - d.left;
    var e = d.bottom - d.top;
    if (!N) {
        var f = (this.z[2] - this.z[0]) * c, g = (this.z[1] - this.z[3]) * e, k = d.left + c * this.z[0], m = d.top + e * this.z[1], v = Math.atan2(g, f), u =- g / f;
        Infinity == u && (u = Math.pow(10, 10));
        d = 0 < v && v < Math.PI / 2 ? [d.right, d.top] : 0 < v ? [d.left, d.top] : v>-Math.PI / 2 ? [d.right, d.bottom] : [d.left, d.bottom];
        d = (d[1] + 1 / u * d[0] - m + u * k) / (u + 1 / u);
        u = u * d + m - k * u;
        d -= k;
        u -= m;
        this.me = Math.sqrt((f * f + g * g) / (d * d + u * u))
    }
    f = Fa(this.ib, this.Sd, this);
    c = N ? "-webkit-gradient(linear," + 100 * this.z[0] +
    "% " + 100 * this.z[1] + "%," + 100 * this.z[2] + "% " + 100 * this.z[3] + "%," + f.join(",") + ")" : "linear-gradient(" + 100 * this.z[0] + "% " + 100 * this.z[1] + "% " + Math.atan2((this.z[1] - this.z[3]) * e, (this.z[2] - this.z[0]) * c) + "rad," + f.join(",") + ")";
    vb && (c = "-moz-" + c);
    a.style.background = c
};
q.ea = function(a, b) {
    for (var c = this.z, d = I(b), e = d.right - d.left, f = d.bottom - d.top, c = a.createLinearGradient(d.left + e * c[0], d.top + f * c[1], d.left + e * c[2], d.top + f * c[3]), d = 0; d < this.ib.length; d++)
        c.addColorStop(this.ib[d][0], this.ib[d][1].V);
    a.fillStyle = c
};
function he(a) {
    Ud.call(this, this.uc(a), this.uc(a));
    this.borderWidth = 2;
    this.i(a);
    this.fa("#62be00")
}
z(he, Ud);
q = he.prototype;
q.uc = function(a) {
    var b = new X;
    b.ba = new X;
    b.label = Z(ce(new Y(a)).ab('"Trebuchet MS"'), "#010101").l(17);
    b.appendChild(b.ba);
    b.ba.appendChild(b.label);
    return b
};
q.fa = function(a) {
    a = Hd(a);
    Da([this.K, this.Y], function(b) {
        var c;
        b == this.Y ? (c = a.d(), c = Md(c, 1, -0.2)) : c = a;
        b.o(c);
        var d = ge(new fe);
        d.addColorStop(0, Ld(c.d(), 0.13));
        d.addColorStop(0.5, Ld(c.d(), 0.05));
        d.addColorStop(0.52, c);
        d.addColorStop(1, c);
        b.ba.o(d)
    }, this);
    return this
};
q.i = function(a) {
    this.K.label.i(a);
    this.Y.label.i(a);
    return this
};
q.l = function(a) {
    this.K.label.l(a);
    this.Y.label.l(a);
    return this
};
q.ab = function(a) {
    this.K.label.ab(a);
    this.Y.label.ab(a);
    return this
};
q.c = function(a, b) {
    if (this.K) {
        this.K.c.apply(this.K, arguments);
        var c = this.K.f();
        Da([this.K, this.Y], function(a) {
            a.c(c);
            var b = c.d();
            b.width -= this.borderWidth;
            b.height -= this.borderWidth;
            a.ba.c(b)
        }, this)
    }
    return this
};
q.f = function() {
    return this.K.f()
};
var ie, je, ke, le;
function me(a) {
    he.call(this, a);
    this.borderWidth = 4;
    this.fa("#000")
}
z(me, he);
me.prototype.uc = function() {
    var a = $d((new X).o("#fff"), 15);
    a.ba = $d(new X, 15);
    a.label = Z(ce(new Y), "#eef").l(35).c(250, 35);
    a.appendChild(a.ba);
    a.ba.appendChild(a.label);
    return a
};
me.prototype.fa = function(a) {
    a = Hd(a);
    Da([this.K, this.Y], function(b) {
        var c = b == this.Y ? Ld(a.d(), 0.1): a, d = Ld(c.d(), 0.3), e = ge(new fe);
        e.addColorStop(0, d);
        e.addColorStop(0.45, c);
        e.addColorStop(0.55, c);
        e.addColorStop(1, d);
        b.ba.o(e)
    }, this);
    return this
};
function $(a) {
    V.call(this);
    this.F = a
}
z($, V);
$.prototype.scope = "fade";
$.prototype.Va = function(a) {
    var b = a.F;
    rd(this) && (a.ma[Rc] = [this.F, this.v, this.Sa, 0], S(a, Sc));
    return {
        te: b,
        m: this.F - b
    }
};
$.prototype.update = function(a, b) {
    if (0 != this.J) {
        var c = sd(this, b);
        gd(b, c.te + c.m * a)
    }
};
$.prototype.aa = function(a) {
    rd(this) && (a.aa(Rc), S(a, Sc))
};
G.Xb = {};
K.Xb = {};
K.Xb.t = function(a) {
    var b = this.f();
    K.D.t.call(this, a);
    Pc(a, 0.5 * b.width, 0.5 * b.height)
};
G.Xb.t = function(a) {
    var b = this.pa, c = this.B, d = I(this), e = 0.5 * (d.right - d.left), d = 0.5 * (d.bottom - d.top);
    b !== n && (ae(a, e, d), b.ea(a, this), b instanceof Jd || a.fill());
    c !== n && (ae(a, e - c.C / 2, d - c.C / 2), c.ea(a, this), a.stroke())
};
function H() {
    R.call(this);
    this.I(0, 0);
    this.lb = "lime-scene";
    Zc(this)
}
z(H, R);
H.prototype.Db = function() {
    return this
};
H.prototype.Ib = function() {
    return I(this)
};
G.Kc = {};
function ne() {
    W.call(this)
}
z(ne, W);
ne.prototype.id = "canvas";
ne.prototype.ta = [Oa(G.D, G.Kc)];
ne.prototype.t = aa;
G.Kc.t = function(a) {
    G.D.t.call(this, a);
    this.t(a)
};
function oe(a) {
    V.call(this);
    this.Pe = n;
    this.Cd = pe;
    var b = Hd(B(arguments));
    b instanceof Id && (this.Pb = Kd(b))
}
z(oe, V);
oe.prototype.scope = "color";
var pe = "fill";
oe.prototype.Va = function(a) {
    var b;
    switch (this.Cd) {
    case pe:
        a = a.pa;
        b = a instanceof Id ? Kd(a) : [255, 255, 255, 0];
        break;
    case "stroke":
        a = a.B.oa;
        b = a instanceof Id ? Kd(a) : [255, 255, 255, 0];
        break;
    case "font":
        b = Dd(a.ec)
    }
    return {
        start: b,
        m: [this.Pb[0] - b[0], this.Pb[1] - b[1], this.Pb[2] - b[2], this.Pb[3] - b[3]]
    }
};
oe.prototype.update = function(a, b) {
    if (0 != this.J) {
        var c = sd(this, b), d = Math.round(c.start[0] + c.m[0] * a), e = Math.round(c.start[1] + c.m[1] * a), f = Math.round(c.start[2] + c.m[2] * a);
        if ("start"in c)
            switch (this.Cd) {
            case pe:
                c = c.start[3] + c.m[3] * a;
                b.o(d, e, f, c);
                break;
            case "stroke":
                c = c.start[3] + c.m[3] * a;
                b.qe(b.B.fa(d, e, f, c));
                break;
            case "font":
                Z(b, Bd(d, e, f))
            }
        }
};
function qe() {
    X.call(this);
    var a = 40, b = 20;
    this.c(320, a);
    $d(this, b);
    this.I(0, 0.5);
    this.o((new fe).addColorStop(0, 41, 84, 21, 0.5).addColorStop(1, 41, 84, 21, 0.1));
    this.Jb = (new kd).a(125, 0);
    this.appendChild(this.Jb);
    var a = a-16, b = 12, c = $d(new X, b).c(50, a).o(255, 255, 255, 0).I(0, 0.5).a(8, 0);
    this.Jb.appendChild(c);
    this.width = 320;
    this.ba = c;
    c = $d(new X, b).c(50, a).o("#Ff9900").I(0, 0.5).a(8, 0);
    this.Jb.appendChild(c);
    c.o((new fe).addColorStop(0, 255, 255, 255, 0.4).addColorStop(0.49, 255, 255, 255, 0).addColorStop(0.5, 0, 0, 0,
    0.1).addColorStop(1, 255, 255, 255, 0.3));
    this.width = 320;
    this.Ie = c
}
z(qe, X);
function re(a, b) {
    var c, d = 360 * (0.26 * b + 0.01), e = c = 0, f = 0, g = Math.floor(d / 60), k = d / 60 - g, d = 245 * (1-1 * k), k = 245 * (1-1 * (1 - k));
    switch (g) {
    case 1:
        c = d;
        e = 245;
        f = 0;
        break;
    case 2:
        c = 0;
        e = 245;
        f = k;
        break;
    case 3:
        c = 0;
        e = d;
        f = 245;
        break;
    case 4:
        c = k;
        e = 0;
        f = 245;
        break;
    case 5:
        c = 245;
        e = 0;
        f = d;
        break;
    case 6:
    case 0:
        c = 245, e = k, f = 0
    }
    c = [Math.floor(c), Math.floor(e), Math.floor(f)];
    a.Ne = b;
    T(a.Jb, (new se(250 * b, 0)).s(3));
    T(a.ba, (new oe(c[0], c[1], c[2])).s(3));
    return a
};
function te(a) {
    W.call(this);
    this.value = a;
    this.Od = (new W).o("assets/bubble_back.png").c(70, 70);
    this.appendChild(this.Od);
    this.Zd = de(Z((new Y).i(a).l(34), "#fff"), 700).ab("Impact");
    this.appendChild(this.Zd);
    this.Ed = 2.5;
    this.I(0, 0);
    this.Ma(1.2);
    this.Dd = new L(0, this.Ed)
}
z(te, W);
function ue(a) {
    a.Dd.add(new L(0.6 * (2 * Math.random()-1), 0.1 * Math.random()));
    var b = a.Dd.d().scale(ie), b = ud((new ve(b.x, b.y)).s(20));
    b.Sa = vd;
    a.move = b;
    T(a, a.move)
};
function se(a, b) {
    V.call(this);
    this.e = 2 == arguments.length ? new D(arguments[0], arguments[1]) : a
}
z(se, V);
q = se.prototype;
q.scope = "move";
q.Va = function(a) {
    var b = a.e, c = new D(this.e.x - b.x, this.e.y - b.y);
    rd(this) && (a.ma[J] = [this.e, this.v, this.Sa, 0], S(a, Vc));
    return {
        tb: b,
        m: c
    }
};
q.hb = function() {
    if (this.sb && this.ga.length) {
        var a = this.ga[0].e;
        this.s(this.sb * Ka(new D(this.e.x - a.x, this.e.y - a.y)) / 100);
        this.Ec = 1
    }
};
q.update = function(a, b) {
    if (0 != this.J) {
        var c = sd(this, b);
        b.a(c.tb.x + c.m.x * a, c.tb.y + c.m.y * a)
    }
};
q.aa = function(a) {
    rd(this) && (a.aa(J), S(a, Vc))
};
function we(a) {
    V.call(this);
    this.hd = 1 == arguments.length && y(a) ? new L(a, a) : 2 == arguments.length ? new L(arguments[0], arguments[1]) : a
}
z(we, V);
we.prototype.scope = "scale";
we.prototype.Va = function(a) {
    var b = a.H, c = new L(b.x * this.hd.x - b.x, b.y * this.hd.y - b.y);
    rd(this) && (a.ma[Qa] = [new L(b.x + c.x, b.y + c.y), this.v, this.Sa, 0], S(a, 2));
    return {
        zd: b,
        m: c
    }
};
we.prototype.update = function(a, b) {
    if (0 != this.J) {
        var c = sd(this, b);
        b.Ma(c.zd.x + c.m.x * a, c.zd.y + c.m.y * a)
    }
};
we.prototype.aa = function(a) {
    rd(this) && (a.aa(Qa), S(a, 2))
};
function xe() {
    return gd($d((new X).o(255, 255, 255, 0.6), 40).c(680, 550).a(0, 270).I(0.5, 0), 0)
}
function ye() {
    var a = xe(), b = (new Y).i("Tutorial").l(40).a(0, 70);
    a.appendChild(b);
    b = Z((new Y).i("Divide and add bubbles with different numeric values to get them to equal magical value before they fall to the ground.").c(450, 50).a(0, 130).l(24), "#333");
    a.appendChild(b);
    b = (new W).o("assets/dialog_tutorial1.jpg").a(-150, 400).Ma(0.9);
    a.appendChild(b);
    b = (new W).o("assets/dialog_tutorial2.jpg").a(150, 400).Ma(0.9);
    a.appendChild(b);
    b = Z((new Y).l(22), "#80c010").i("Draw line around bubbles to add their values together").c(250,
    50).a(-150, 250);
    a.appendChild(b);
    b = Z((new Y).l(22), "#80c010").i("Draw line through a bubble to split it into two.").c(250, 50).a(150, 250);
    a.appendChild(b);
    return a
}
function ze()
{
    var a = xe(), b = (new Y).i("Tutorial").l(40).a(0, 70);
    return a;
    a.appendChild(b);
    b = Z((new Y).i("If you are using mouse or trackpad you may find it easier to hold down key Z for making a selection instead of pressing on mouse.").c(450, 50).a(0, 130).l(24), "#333");
    a.appendChild(b);
    b = (new W).o("assets/dialog_keyz.jpg").a(0, 360);
    a.appendChild(b);
    return a
}
function Ae(a) {
    var b = xe(), c = (new Y).i("Level #" + a.nb).l(40).a(0, 70);
    b.appendChild(c);
    c = Z((new Y).i("This is your magic number for this level:").c(450, 50).a(0, 130).l(24), "#333");
    b.appendChild(c);
    c = (new W).o("assets/dialog_number.jpg").a(0, 320);
    b.appendChild(c);
    a = Z((new Y(a.Ia)).l(60).a(0, 320), "#fff");
    b.appendChild(a);
    return b
}
function Be(a) {
    var b = (new $(1)).s(0.3);
    T(a, b)
}
function Ce(a, b) {
    var c = new Sd((new Rd).s(5), (new $(0)).s(0.3));
    T(a, c);
    b && P(c, "stop", b)
};
function De(a) {
    H.call(this);
    this.Gd = 600;
    this.Nc = 7;
    this.Lc = 0.9;
    this.Mc = 0.15;
    this.nb = a;
    this.Ia = 6 + Math.round(9 * ((a-1) / 20));
    je = 6800-120 * a;
    ie = 75 + 1.4 * this.nb;
    this.Hb = (new W).o((new fe).addColorStop(0, 0, 0, 0, 0).addColorStop(0.95, 0, 0, 0, 0.1).addColorStop(1, 0, 0, 0, 0)).c(768, 760).I(0, 0).a(0, 130);
    this.appendChild(this.Hb);
    this.Hb = (new W).c(768, 760).I(0, 0).a(0, 130);
    this.appendChild(this.Hb);
    this.R = new kd;
    /Chrome\/9\.0\.597/.test(rb()) && Xc(this.R, G);
    this.appendChild(this.R);
    Wc(this.R, this.Hb);
    gd(this.R, 0.5);
    this.bubbles =
    [];
    Ee(this, 3);
    U.Dc(this.reload, this, je);
    U.Dc(this.Yc, this, 200);
    this.$d = Z((new Y).i("NUMBER " + this.Ia).a(760, 15).I(1, 0), "#80ff36").l(70);
    this.appendChild(this.$d);
    this.wd = re(new qe, 0.5).a(20, 50);
    this.appendChild(this.wd);
    this.Ka = this.Ia * this.Nc;
    Fe(this, 0);
    this.ia = (new kd).a(ke.f().width / 2, 0);
    this.appendChild(this.ia);
    a = (new me("Back to menu")).c(270, 70).a(150, 945);
    this.appendChild(a);
    P(a, "click", function() {
        Ge(He)
    });
    Ie(this);
    this.xa = pc("canvas").getContext("2d");
//    Je(this)
}
z(De, H);
function Ee(a, b) {
    for (var c = 0; c < b; c++) {
        var d;
        d = Math.ceil(Math.random() * (a.Ia-1));
        d = new te(d);
        d.a(Math.random() * a.Gd + 100, 0-100 * Math.random());
        a.R.appendChild(d);
        a.bubbles.push(d)
    }
    U.Md(a.ze, a)
}
q = De.prototype;
q.reload = function() {
    Ee(this, 2)
};
function Fe(a, b) {
    a.Ka += b;
    0 > a.Ka && (a.Ka = 0);
    var c = a.Ka / (2 * a.Ia * a.Nc);
    1 < c && (c = 1);
    re(a.wd, c);
    (0 >= c || 1 <= c) && Ke(a)
}
q.start = function() {
    this.touches = [];
    T(this.R, new $(1));
    this.ic = (new ne).c(ke.f().d()).I(0, 0);
    this.appendChild(this.ic);
    this.ic.t = ka(this.gd, this);
    this.nc = p;
    P(this, ["mousedown", "touchstart", "keydown"], this.ed, p, this);
    U.Qb(function() {
        S(this.ic, 4)
    }, this)
};
q.gd = function(a) {
    var b = ma();
    this.oc || (this.oc = b);
    var c = (b - this.oc) / 1E3, d = this.Lc, e = this.Mc, f = this.Lc - this.Mc, g, k, m;
    this.oc = b;
    wb ? this.xa.globalCompositeOperation = "copy" : a.clearRect(0, 0, ke.f().width, ke.f().height);
    a.strokeStyle = "rgba(0,0,0,0)";
    a.lineCap = "round";
    a.lineWidth = 17;
    a.shadowBlur = 0;
    a.shadowColor = "#fff";
    for (b = this.touches.length; 0<=--b;) {
        m = this.touches[b].Lb;
        g = m.length;
        for (a.beginPath(); 0<=--g;)
            k = m[g], a.moveTo(k.da[0], k.da[1]), a.lineTo(k.T[0], k.T[1]), k.Ga > d && m.splice(g, 1);
        a.stroke();
        this.touches[b].remove &&
        !m.length && this.touches.splice(b, 1)
    }
    for (var b = [241, 249, 57], v = [255 - b[0], 255 - b[1], 255 - b[2]], b = 0; b < this.touches.length; b++) {
        if (!this.touches[b])
            debugger;
        m = this.touches[b].Lb;
        for (g = 0; g < m.length; g++) {
            k = m[g];
            a.lineWidth = k.Ga < e ? Math.ceil(4 + 4 * (k.Ga / e)) : Math.ceil(12 * ((f - (k.Ga - e)) / f));
            if (2 < a.lineWidth) {
                var u = k.Ga / (d-0.3);
                a.strokeStyle = "rgba(" + Math.round(255 - v[0] * u) + "," + Math.round(255 - v[1] * u) + "," + Math.round(255 - v[2] * u) + "," + a.lineWidth / 12 + ")";
                a.beginPath();
                a.moveTo(k.da[0], k.da[1]);
                a.lineTo(k.T[0], k.T[1]);
                a.stroke()
            }
            k.Ga +=
            c
        }
    }
};
q.ed = function(a) {
    if ("keydown" == a.type)
        if (90 == a.event.keyCode&&!this.nc)
            this.nc = l;
        else 
            return;
    var b = {
        La: a.position,
        Lb: [],
        sa: [0, 0, 0, 0],
        sd: p
    };
    this.touches.push(b);
    a.Na(["mousemove", "touchmove"], la(this.ge, b));
    a.Na(["mouseup", "touchend", "touchcancel", "keyup"], la(this.ye, b))
};
q.ge = function(a, b) {
    if (t(a.La)) {
        a.sd = l;
        var c = b.position.x - a.La.x, d = b.position.y - a.La.y;
        if (c * c + d * d > (wb ? 300 : 0))
            0 < c ? 0 < d ? a.sa[0] = 1 : a.sa[1] = 1 : 0 < d ? a.sa[2] = 1 : a.sa[3] = 1, a.Lb.push(new Le(a.La.x, a.La.y, b.position.x, b.position.y)), a.La = b.position
    } else 
        a.La = b.position
};
q.ye = function(a, b) {
    if (!("keyup" == b.type && 90 != b.event.keyCode)) {
        var c = this.xa, d = a.Lb, e = this.bubbles, f, g, k, m, v = [];
        this.nc = p;
        a.remove = 1;
        if (d.length) {
            c.beginPath();
            f = d[d.length-1].T[0] - d[0].da[0];
            g = d[d.length-1].T[1] - d[0].da[1];
            k = a.sa[0] + a.sa[1] + a.sa[2] + a.sa[3];
            if (2 < k || 6E3 > f * f + g * g) {
                c.moveTo(d[0].da[0], d[0].da[1]);
                for (k = 0; k < d.length; k++)
                    c.lineTo(d[k].T[0], d[k].T[1])
                } else 
                    for (k = 0; k < d.length; k++)
                        for (m = e.length; 0<=--m;)
                            1 != e.value && (g = e[m].e, f = g.x - d[k].T[0], g = g.y - d[k].T[1], f = f * f + g * g, 1E3 > f && Me(this, e[m], d[k].T[0] -
                            d[k].da[0], d[k].T[1] - d[k].da[1]));
            c.closePath();
            for (k = 0; k < e.length; k++)
                g = e[k].e, c.isPointInPath(g.x, g.y) && v.push(e[k]);
            1 < v.length && Ne(this, v)
        } else if (!a.sd)
            for (m = e.length; 0<=--m;)
                if (1 != e.value && (g = e[m].e, f = g.x - b.position.x, g = g.y - b.position.y, f = f * f + g * g, 1E3 > f)) {
                    Oe(this, e[m]);
                    break
                }
    }
};
function Ie(a) {
    var b = (new Y).i("Your game is about to start").l(52).a(0, 0);
    a.ia.appendChild(b);
    var c = (new ve(0, 200)).s(0.5);
    T(b, c);
    var d = ye();
    a.ia.appendChild(d);
    P(c, "stop", function() {
        Be(d);

          var f = Ae(a);
          Ce(d, function() {
             a.ia.removeChild(d);
             a.ia.appendChild(f);
             Be(f);
             Ce(f, function() {
                a.ia.removeChild(f);
                a.ia.removeChild(b);
                a.start()
                })
             })
    })
}
function Ke(a) {
    a.Fe = 1;
    U.vb(a.reload, a);
    U.vb(a.Yc, a);
    for (var b = 0; b < a.bubbles; b++)
        td.ve(a.bubbles[b]);
    b = $d(new X, 30).o((new fe).addColorStop(0, 0, 0, 0, 0.5).addColorStop(1, 0, 0, 0, 0.7)).c(400, 400).a(400, 200).I(0.5, 0);
    a.appendChild(b);
    var c = Z((new Y).i("Level complete!"), "#fff").l(46).a(0, 70);
    b.appendChild(c);
    var d = (new me).i("NEXT LEVEL").c(300, 90).a(0, 200);
    b.appendChild(d);
    0 >= a.Ka ? (c.i("You lost"), d.i("TRY AGAIN")) : 20 == a.nb && b.removeChild(d);
    P(d, Zd, function() {
        Pe(0 > this.Ka ? this.nb : this.nb + 1)
    }, p, a);
    d = (new me).i("MAIN SCREEN").c(300,
    90).a(0, 320);
    b.appendChild(d);
    P(d, Zd, function() {
        Ge(l)
    });
    Xb(a, ["mousedown", "touchstart", "keydown"], a.ed, p, a);
    U.vb(a.gd, a)
}
function Oe(a, b) {
    a.R.removeChild(b);
    Fe(a, - b.value);
    var c = de(gd(Z((new Y).i("-" + b.value), "#c00").l(40), 1).a(b.e), 700);
    a.appendChild(c);
    var d = new Td(new ve(0, -60), new $(0), new we(2));
    T(c, d);
    P(d, "stop", function() {
        this.removeChild(c)
    }, p, a);
    Ha(a.bubbles, b)
}
q.Yc = function() {
    for (var a = this.bubbles.length; 0<=--a;)(840 < this.bubbles[a].e.y || 0 > this.bubbles[a].e.x || 768 < this.bubbles[a].e.x) 
        && Oe(this, this.bubbles[a])
};
function Qe(a, b) {
    var c = new Td(new we(2), new $(0));
    P(c, "stop", function() {
        this.R.removeChild(b)
    }, p, a);
    T(b, c);
    Fe(a, b.value);
    var d = de(gd(Z((new Y).i("+" + b.value), "#060").l(40), 0.5).a(b.e.d()), 700);
    a.appendChild(d);
    c = new Td(new ve(0, -60), new $(0), new we(2));
    T(d, c);
    P(c, "stop", function() {
        this.removeChild(d)
    }, p, a)
}
q.ze = function() {
    for (var a = 0; a < this.bubbles.length; a++)
        ue(this.bubbles[a])
};
function Ne(a, b) {
    for (var c = [0, 0], d = 0, e = 0; e < b.length; e++) {
        var f = b[e].e;
        c[0] += f.x;
        c[1] += f.y;
        Ha(a.bubbles, b[e]);
        d += b[e].value
    }
    c[0]/=b.length;
    c[1]/=b.length;
    f = new Td(ud(new se(c[0], c[1])), ud(new $(0)));
    for (e = 0; e < b.length; e++)
        Ga(f.ga, b[e]);
    f.play();
    P(f, "stop", function() {
        for (var a = 0; a < b.length; a++)
            this.R.removeChild(b[a])
    }, p, a);
    var g = gd((new te(d)).a(c[0], c[1]), 0);
    a.R.appendChild(g);
    c = new Sd((new Rd).s(0.5), new $(1));
    P(c, "stop", function() {
        g.value == this.Ia ? Qe(this, g) : (this.bubbles.push(g), ue(g))
    }, p, a);
    T(g,
    c)
}
function Me(a, b, c, d) {
    if (!(2 > b.value)) {
        var e = Math.ceil(Math.random() * (b.value-1)), e = [e, b.value - e];
        Ha(a.bubbles, b);
        var f = b.e.d(), g = new $(0);
        P(g, "stop", function() {
            this.R.removeChild(b)
        }, p, a);
        T(b, g);
        c = (new L( - d, c)).normalize().scale(70);
        for (d = 0; 2 > d; d++) {
            var k = gd((new te(e[d])).a(f), 0.5);
            a.R.appendChild(k);
            d && Xa(c);
            var g = new Td(new ve(c.x, c.y), new $(1)), m = a;
            P(g, "stop", function() {
                this.value == m.Ia ? Qe(m, this) : (m.bubbles.push(this), ue(k))
            }, p, k);
            T(k, g)
        }
    }
};
function ve(a, b) {
    V.call(this);
    this.jb = 2 == arguments.length ? new D(arguments[0], arguments[1]) : a
}
z(ve, V);
q = ve.prototype;
q.scope = "move";
q.Va = function(a) {
    rd(this) && (a.ma[J] = [new D(a.e.x + this.jb.x, a.e.y + this.jb.y), this.v, this.Sa, 0], S(a, Vc));
    return {
        tb: a.e
    }
};
q.hb = function() {
    this.sb && (this.s(this.sb * Ka(this.jb) / 100), this.Ec = 1)
};
q.update = function(a, b) {
    if (0 != this.J) {
        var c = sd(this, b);
        b.a(c.tb.x + this.jb.x * a, c.tb.y + this.jb.y * a)
    }
};
q.aa = function(a) {
    rd(this) && (a.aa(J), S(a, Vc))
};
function Re(a, b) {
    Q.call(this);
    this.v = 1;
    this.Kb = a;
    this.ja = b;
    this.Rd = p
}
z(Re, Q);
Re.prototype.s = function(a) {
    this.v = a;
    return this
};
Re.prototype.start = function() {
    this.ja.a(new D(0, 0));
    ed(this.ja, p);
    this.finish()
};
Re.prototype.finish = function() {
    this.dispatchEvent(new Lb("end"));
    this.Rd = l
};
function Se(a, b, c) {
    Re.call(this, a, b);
    this.wc = Te;
    this.he = c || p
}
z(Se, Re);
var Te = 0;
Se.prototype.start = function() {
    var a = this.ja.f(), b = new D(0, 0);
    switch (this.wc) {
    case Te:
        this.ja.a( - a.width, 0);
        b.x = a.width;
        break;
    case 1:
        this.ja.a(0, - a.height);
        b.y = a.height;
        break;
    case 2:
        this.ja.a(a.width, 0);
        b.x =- a.width;
        break;
    case 4:
        this.ja.a(0, a.height), b.y =- a.height
    }
    ed(this.ja, p);
    a = (new ve(b)).s(this.v);
    this.Kb&&!this.he && Ga(a.ga, this.Kb);
    Ga(a.ga, this.ja);
    P(a, "stop", this.finish, p, this);
    a.play()
};
Se.prototype.finish = function() {
    this.Kb && this.Kb.a(0, 0);
    Re.prototype.finish.call(this)
};
function Ue(a, b, c) {
    Se.call(this, a, b, c);
    this.wc = 1
}
z(Ue, Se);
function Ve(a, b, c) {
    Se.call(this, a, b, c);
    this.wc = 4
}
z(Ve, Se);
function He(a, b) {
    Ue.call(this, a, b, l)
}
z(He, Ue);
function We(a, b) {
    Ve.call(this, a, b, l)
}
z(We, Ve);
function Xe() {
    H.call(this);
    this.b.style.cssText = "background:rgba(255,255,255,.8)"
}
z(Xe, H);
function Ye(a) {
    this.kb = a;
    this.identifier = 0
}
Ye.prototype.Na = function(a, b, c) {
    a = w(a) ? a : [a];
    for (var d = 0; d < a.length; d++)
        this.kb.Na(this, a[d], b);
    c && this.event.stopPropagation()
};
Ye.prototype.qb = function(a) {
    var b = t(a), c = w(a) ? a: [a];
    if (a = this.kb.ua[this.identifier]) {
        var d = this;
        a = Ea(a, function(a) {
            return !t(d.Oa) || a[0] == d.Oa && (!b || 0 <= Ca(c, a[1])) ? (Xb(a[0], a[1], a[2]), p) : l
        });
        a.length ? this.kb.ua[this.identifier] = a : delete this.kb.ua[this.identifier]
    }
};
Ye.prototype.d = function() {
    var a = new Ye(this.kb);
    Pa(a, this);
    return a
};
function Ze(a) {
    this.za = a;
    this.w = {};
    this.ua = {}
}
Ze.prototype.Ob = function(a, b) {
    t(this.w[b]) ? 0 <= Ca(this.w[b], a) || (this.w[b].push(a), this.w[b].Sb = p) : (this.w[b] = [a], this.w[b].Sb = l, P("touch" == b.substring(0, 5) && a != this.za ? document : "key" == b.substring(0, 3) ? window : this.za.b.parentNode, b, this, p, this))
};
Ze.prototype.qb = function(a, b) {
    t(this.w[b]) && (Ha(this.w[b], a), this.w[b].length || (Xb(this.za.b.parentNode, b, this, p, this), delete this.w[b]))
};
function jd(a, b) {
    for (var c in a.w) {
        var d = a.w[c];
        0 <= Ca(d, b) && (d.Sb = p)
    }
}
Ze.prototype.Na = function(a, b, c) {
    var d = a.identifier;
    t(this.ua[d]) || (this.ua[d] = []);
    this.ua[d].push([a.Oa, b, c]);
    P(a.Oa, b, aa)
};
Ze.prototype.handleEvent = function(a) {
    if (t(this.w[a.type])) {
        this.w[a.type].Sb || (this.w[a.type].sort(bd), this.w[a.type].Sb = l);
        for (var b = this.w[a.type].slice(), c = p, d = 0, e = 0; !e;) {
            var f = new Ye(this);
            f.type = a.type;
            f.event = a;
            if ("touch" == a.type.substring(0, 5)) {
                var g = a.Ca.changedTouches[d];
                f.Za = new D(g.pageX, g.pageY);
                f.identifier = g.identifier;
                d++;
                d >= a.Ca.changedTouches.length && (e = 1)
            } else 
                f.Za = new D(a.clientX + document.body.scrollLeft + document.documentElement.scrollLeft, a.clientY + document.body.scrollTop + document.documentElement.scrollTop),
            e = 1;
            if (t(this.ua[f.identifier])) {
                for (var g = this.ua[f.identifier], k = 0; k < g.length; k++)
                    if (g[k][1] == a.type || w(g[k][1]) && 0 <= Ca(g[k][1], a.type)) {
                        var m = g[k][0];
                        f.Oa = m;
                        f.position = m.ka(f.Za);
                        g[k][2].call(m, f);
                        c = l
                    }
                if ("touchend" == a.type || "touchcancel" == a.type || "mouseup" == a.type || "keyup" == a.type)
                    delete f.Oa, f.qb()
            } else 
                for (k = 0; k < b.length; k++)
                    if (m = b[k], !((this.za.k.length ? this.za.k[this.za.k.length-1] : n) != m.Db() && m != this.za)&&!m.Fb && m.u)if (f.Oa = m, m.Ea(f) || "key" == a.type.substring(0, 3)
                )if (f.Oa = m, m.dispatchEvent(f)
                ,
            c = l, f.event.ra)break
        }
        c && 0 != a.type.lastIndexOf("key", 0) && a.preventDefault()
    }
};
function $e(a) {
    Q.call(this);
    this.Wb = a || window;
    this.be = P(this.Wb, "resize", this.Wd, p, this);
    this.A = oc(this.Wb || window)
}
z($e, Q);
q = $e.prototype;
q.be = n;
q.Wb = n;
q.A = n;
q.f = function() {
    return this.A ? this.A.d() : n
};
q.Wd = function() {
    var a = oc(this.Wb || window);
    if (!(a == this.A || (!a ||!this.A ? 0 : a.width == this.A.width && a.height == this.A.height)))
        this.A = a, this.dispatchEvent("resize")
};
function af(a, b, c) {
    R.call(this);
    this.u = l;
    this.I(0, 0);
    this.k = [];
    this.ad = [];
    this.lb = "lime-director";
    Zc(this);
    a.appendChild(this.b);
    N && wb && (this.$c = document.createElement("div"), hc(this.$c, "lime-cover-below"), tc(this.$c, this.b), this.Zc = document.createElement("div"), hc(this.Zc, "lime-cover-above"), uc(this.Zc, this.b));
    "absolute" != a.style.position && (a.style.position = "relative");
    a.style.overflow = "hidden";
    if (a == document.body) {
        Hc("html,body{margin:0;padding:0;height:100%;}");
        var d = document.createElement("meta");
        d.name = "viewport";
        var e = "initial-scale=1.0,minimum-scale=1,maximum-scale=1.0,user-scalable=no";
        /android/i.test(navigator.userAgent) && (e += ",target-densityDpi=device-dpi");
        d.content = e;
        document.getElementsByTagName("head").item(0).appendChild(d);
        if (wb&&!s.navigator.se) {
            var f = this;
            setTimeout(function() {
                window.scrollTo(0, 0);
                f.Gb()
            }, 100)
        }
    }
    var g;
    a = Fc(a);
    this.c(new E(g = b || a.width || 400, c || a.height * g / a.width || 400));
    this.dd && vc(this.Ud);
    this.dd = p;
    bf(this);
    b = new $e;
    P(b, "resize", this.Gb, p, this);
    P(s, "orientationchange",
    this.Gb, p, this);
    U.Qb(this.cb, this);
    this.Ta = new Ze(this);
    P(this, ["touchmove", "touchstart"], function(a) {
        a.event.preventDefault()
    }, p, this);
    P(this, ["mouseup", "touchend", "mouseout", "touchcancel"], function() {}, p);
    this.Gb()
}
z(af, R);
function bf(a) {
    if (a.nd != p)
        if (a.nd = p, U.Nd(a)
            , a.nd) {
        a.zc = new (a.Me || Xe);
        var b = a.zc, c;
        b.c(a.f().d());
        t(h) && a.k.length && (c = a.k[a.k.length-1], c = new h(c, b), t(h) && c.s(h), b.b.style.display = "none");
        a.k.push(b);
        a.b.appendChild(b.b);
        b.q = a;
        hd(b);
        c && c.start()
    } else 
        a.zc && (cf(a), delete a.zc)
}
q = af.prototype;
q.P = function() {
    return this
};
q.Db = function() {
    return n
};
q.cb = function(a) {
    this.dd && (this.kd++, this.wb += a, 100 < this.wb && (this.Td = 1E3 * this.kd / this.wb, xc(this.Ud, this.Td.toFixed(2)), this.wb = this.kd = 0));
    qa()
};
function df(a, b) {
    var c = ke;
    a.c(c.f().d());
    var d = b || Re, e = n;
    c.k.length && (e = c.k[c.k.length-1]);
    for (var f = [], g = c.k.length; 0<=--g;)
        id(c.k[g]), f.push(c.k[g].b), c.k[g].q = n;
    c.k.length = 0;
    c.k.push(a);
    a.b.style.display = "none";
    c.b.appendChild(a.b);
    a.q = c;
    hd(a);
    d = new d(e, a);
    Wb(d, "end", function() {
        for (var a = f.length; 0<=--a;)
            vc(f[a]);
        f.length = 0
    }, p, c);
    t(h) && d.s(h);
    d.start()
}
q.Pa = function() {
    this.p&=-65
};
function cf(a) {
    var b, c = a.k.length ? a.k[a.k.length-1]: n;
    if (c !== n) {
        var d = function() {
            id(c);
            c.q = n;
            vc(c.b);
            this.k.pop();
            c = n
        };
        t(h) && 1 < a.k.length ? (b = new h(c, a.k[a.k.length-2]), t(h) && b.s(h), Wb(b, "end", d, p, a)) : d.call(a);
        b && b.start()
    }
}
q.ka = function(a) {
    a = a.d();
    a.x -= this.Ab.x + this.e.x;
    a.y -= this.Ab.y + this.e.y;
    a.x/=this.H.x;
    a.y/=this.H.y;
    return a
};
q.ob = function(a) {
    a = a.d();
    a.x*=this.H.x;
    a.y*=this.H.y;
    a.x += this.Ab.x + this.e.x;
    a.y += this.Ab.y + this.e.y;
    return a
};
q.update = function() {
    R.prototype.update.call(this);
    for (var a = this.ad.length; 0<=--a;)
        this.ad[a].update()
};
q.Gb = function() {
    var a = Fc(this.b.parentNode);
    this.b.parentNode == document.body && (window.scrollTo(0, 0), y(window.innerHeight) && (a.height = window.innerHeight));
    var b;
    b = this.f().d();
    b = b.scale(b.width / b.height > a.width / a.height ? a.width / b.width : a.height / b.height);
    var c = b.width / this.f().width;
    this.Ma(c);
    a.width / a.height < b.width / b.height ? this.a(0, (a.height - b.height) / 2) : this.a((a.width - b.width) / 2, 0);
    var c = this.b.parentNode, d, e = lc(c), f = Ac(c, "position"), g = vb && e.getBoxObjectFor&&!c.getBoundingClientRect && "absolute" ==
    f && (d = e.getBoxObjectFor(c)) && (0 > d.screenX || 0 > d.screenY);
    b = new D(0, 0);
    var k;
    d = e ? lc(e) : document;
    if (k = M)
        if (k=!(M && 9 <= Ib))
            k = "CSS1Compat" != jc(d).Aa.compatMode;
    k = k ? d.body : d.documentElement;
    if (c != k)
        if (c.getBoundingClientRect)
            d = Bc(c), e = jc(e).Aa, c=!N && "CSS1Compat" == e.compatMode ? e.documentElement : e.body || e.documentElement, e = e.parentWindow || e.defaultView, c = M && O("10") && e.pageYOffset != c.scrollTop ? new D(c.scrollLeft, c.scrollTop) : new D(e.pageXOffset || c.scrollLeft, e.pageYOffset || c.scrollTop), b.x = d.left + c.x, b.y = d.top +
    c.y;
    else if (e.getBoxObjectFor&&!g)
        d = e.getBoxObjectFor(c), c = e.getBoxObjectFor(k), b.x = d.screenX - c.screenX, b.y = d.screenY - c.screenY;
    else {
        d = c;
        do {
            b.x += d.offsetLeft;
            b.y += d.offsetTop;
            d != c && (b.x += d.clientLeft || 0, b.y += d.clientTop || 0);
            if (N && "fixed" == Ac(d, "position")) {
                b.x += e.body.scrollLeft;
                b.y += e.body.scrollTop;
                break
            }
            d = d.offsetParent
        }
        while (d && d != c);
        if (ub || N && "absolute" == f)
            b.y -= e.body.offsetTop;
        for (d = c; (d = Cc(d)) && d != e.body && d != k;)
            if (b.x -= d.scrollLeft, !ub || "TR" != d.tagName)
                b.y -= d.scrollTop
    }
    this.Ab = b;
    wb && this.b.parentNode ==
    document.body && (this.ud && (b = this.ud, vc(b.ownerNode || b.owningElement || b)), this.ud = Hc("html{height:" + (a.height + 120) + "px;overflow:hidden;}"))
};
function ef() {
    function a(a, b) {
        var c = document.createElement("meta");
        c.name = a;
        c.content = b;
        document.getElementsByTagName("head").item(0).appendChild(c)
    }
    var b = ke, c = p;
    t(localStorage) && (c = localStorage.getItem("_lime_visited"));
    a("mobile-web-app-capable", "yes");
    if (/(ipod|iphone|ipad)/i.test(navigator.userAgent) && (a("apple-mobile-web-app-capable", "yes"), a("apple-mobile-web-app-status-bar-style", "black"), !window.navigator.se && (!c && b.b.parentNode == document.body) && t(localStorage)))
    try
    {
        localStorage.setItem("_lime_visited", l)
    } catch (d) {}
}
q.Ea = function(a) {
    a && a.Za && (a.position = this.ka(a.Za));
    return l
};
function Ge(a) {
    var b = new H;
    df(b, a ? We : h);
    a = (new kd).a(384, 0);
    b.appendChild(a);
    b = (new W).o("assets/main_title.png").a(0, 250);
    a.appendChild(b);
    b = (new W).c(620, 560).o("#c00").I(0.5, 0).a(0, 410);
    a.appendChild(b);
    var c = (new kd).a(0, 280);
    a.appendChild(c);
    Wc(c, b);
    a = (new me("PLAY NOW")).a(0, 330).c(250, 100);
    c.appendChild(a);
    P(a, Zd, function() {
        Pe(1)
    });
    a = (new me("PICK LEVEL")).a(0, 480).c(250, 100);
    c.appendChild(a);
    P(a, Zd, function() {
        T(c, ud(new se(0, -255)))
    });
    b = (new kd).a(0, 690);
    c.appendChild(b);
    /Chrome\/9\.0\.597/.test(rb()) &&
    Xc(b, G);
    a = Z((new Y).i("PICK LEVEL:").l(30).I(0.5, 0).a(0, 0), "#fff");
    b.appendChild(a);
    a = (new kd).a(-250, 110);
    b.appendChild(a);
    for (b = b = 0; 4 > b; b++)
        for (var d = 0; 5 > d; d++) {
            var e = d + 1 + 5 * b, f = (new me("" + e)).c(80, 80).a(125 * d, 90 * b);
            a.appendChild(f);
            P(f, Zd, function() {
                Pe(this)
            }, p, e)
        }
    b = (new me("Back to Menu")).c(400, 80).a(250, 90 * b);
    a.appendChild(b);
    P(b, Zd, function() {
        T(c, ud(new se(0, 280)))
    }, p, e)
}
function Pe(a) {
    le = new De(a);
    df(le, He)
}
function Je(a) {
    var b = (new W).o("assets/lime.png"), c = Z((new Y).i("Built with"), "#fff").l(24).a(550, 950), b = (new Ud(b)).Ma(0.3).a(670, 950);
    P(b, "click", function() {
        s.location.href = "http://www.limejs.com/"
    });
    a.appendChild(c);
    a.appendChild(b)
}
function Le(a, b, c, d) {
    this.da = [a, b];
    this.T = [c, d];
    this.Ga = 0
}
function ff() {
    ke = new af(document.body, 768, 1004);
    ef();
    be = "Impact";
    Hc('@font-face{font-family: "Impact";src: url(assets/impact.ttf) format("truetype");})');
    Ge()
}
var gf = ["zlizer", "start"], hf = s;
!(gf[0]in hf) && hf.execScript && hf.execScript("var " + gf[0]);
for (var jf; gf.length && (jf = gf.shift());)
    !gf.length && ff !== h ? hf[jf] = ff : hf = hf[jf] ? hf[jf] : hf[jf] = {};

