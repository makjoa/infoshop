define("app/ui/signup/with_captcha", ["module", "require", "exports"], function (module, require, exports) {
    function with_captcha() {
        this.defaultAttrs({
            captchaAvailable: !1,
            recaptcha: {
                srcUrl: "https://www.google.com/recaptcha/api/js/recaptcha_ajax.js",
                publicKey: "6LfbTAAAAAAAAE0hk8Vnfd1THHnn9lJuow6fgulO"
            }
        }), this.checkCaptcha = function (a) {
            if (!this.validated()) return !1;
            if (!this.$node.is(".captcha-active")) return this.$node.addClass("captcha-active"), this.attr.env != "selenium" && Recaptcha.create(this.attr.recaptcha.publicKey, this.$captcha.find("div.embed")[0], {
                    lang: document.documentElement.lang || "en",
                    theme: "white",
                    callback: Recaptcha.focus_response_field
                }), this.trigger("uiCaptchaShown"), this.setSubmitting(!1), !1;
            this.$captcha.hide()
        }, this.after("initialize", function () {
            this.validated = this.validated || function () {
                return !1
            }, this.setSubmitting = this.setSubmitting || function () {}, this.attr.env == "selenium" && (this.attr.recaptcha.srcUrl = ""), this.attr.captchaAvailable && (this.$captcha = this.$node.find(".captcha-container"), this.$captcha.size() && using(this.attr.recaptcha.srcUrl, function () {
                this.on("submit", this.checkCaptcha), this.$node.is(".captcha-tryagain") && this.$node.trigger("submit").find("fieldset.textbox").hide()
            }.bind(this)))
        })
    }
    module.exports = with_captcha
});
define("app/utils/common_regexp", ["module", "require", "exports"], function (module, require, exports) {
    module.exports = {
        name: /\S+/,
        ampersat: /^[@＠]$/,
        usernameForSignup: /^[@＠]?([a-zA-Z0-9_]{1,15})$/,
        email: /^[\w-]+([^@,\s\<\>\(\)]*[\w-]+)?\@[\w-]+(\.[\w-]+)*\.[a-z]{2,}$/i,
        end: "end"
    }
});
define("app/ui/signup/with_signup_validation", ["module", "require", "exports", "app/data/ddg", "core/clock", "app/utils/common_regexp"], function (module, require, exports) {
    function withSignupValidation() {
        this.defaultAttrs({
            holdingSelector: "div.holding",
            usernameSelector: 'input[name="user[screen_name]"]',
            fullnameSelector: 'input[name="user[name]"]',
            emailSelector: 'input[name="user[email]"]',
            passwordSelector: 'input[name="user[user_password]"]',
            scoreSelector: ".password .score",
            submitSelector: 'input[type="submit"]',
            bqSelector: 'input[name="user[use_cookie_personalization]"]',
            mobileNumberSelector: 'input[name="device[address]"]',
            suggestionSelector: ".username .suggestions li button",
            smallPrintSelector: "fieldset.textbox",
            emailCorrectionSelector: ".js-email-correction",
            isDeviceCompletion: !1,
            forceConfirmPasswordField: !1
        }), this.fields = {
            username: !1,
            name: !1,
            email: !1,
            password: !1,
            mobileNumber: !0
        }, this.showTip = function (a, b) {
            var c = $(a.target),
                d = c.closest(".holding");
            d.find(".sidetip p").removeClass("active"), b && d.find("." + b + ":first").addClass("active")
        }, this.validated = function () {
            var a = !0;
            return Object.keys(this.fields).forEach(function (b) {
                this.fields[b] || (a = !1)
            }.bind(this)), a
        }, this.validatedField = function (a, b) {
            this.fields[b.field] = b.valid
        }, this.validate = function (a, b, c, d) {
            if (this.disabled) return;
            var e = {
                name: b,
                value: c,
                quick: d,
                username: this.$username.val(),
                password: this.$password.val(),
                email: this.$email.val(),
                fullname: this.$fullname.val()
            };
            this.$confirmEmail && (e.confirmEmail = this.$confirmEmail.val()), this.$confirmPassword && (e.confirmPassword = this.$confirmPassword.val()), this.$mobileNumber && (e.mobileNumber = this.$mobileNumber.val()), a.trigger("uiSignupValidate", e)
        }, this.focusInput = function (a) {
            var b = $(a.target);
            b.addClass("focused"), b.val() || b.trigger("uiShowTip", "tip")
        }, this.blurInput = function (a) {
            var b = $(a.target);
            b.removeClass("focused"), b.trigger("uiInputFieldChanged")
        }, this.keydownInput = function (a) {
            var b = $(a.target),
                c = a && a.keyCode == 8;
            !b.prop("fieldTouched") && b.val().length && (b.prop("fieldTouched", !0), b.trigger("uiFieldTouched", b)), setTimeout(function () {
                b.trigger("uiInputFieldChanged", {
                    forceAdd: c && !b.val().length
                })
            }.bind(this), 0)
        }, this.checkAllFields = function () {
            this.$allFields.each(function () {
                $(this).trigger("uiInputFieldChanged", {
                    noRemove: !0
                })
            })
        }, this.uiInputFieldChanged = function (a, b) {
            var c = $(a.target),
                d = c.val(),
                b = b || {};
            b.forceAdd || d.length ? c.closest(".holding").addClass("has-content") : b.noRemove || c.closest(".holding").removeClass("has-content");
            if (b.forceValidate || d != c.prop("lastValue")) c.prop("lastValue", d), b.forceValidate ? this.validate(c, c.attr("name"), d) : (this.validate(c, c.attr("name"), d, !0), clearTimeout(c.prop("validatorTimeout")), c.prop("validatorTimeout", setTimeout(function () {
                    this.validate(c, c.attr("name"), d)
                }.bind(this), 750)))
        }, this.dataValidateUsernameResult = function (a, b) {
            b.sourceEventData.custom && (this.trigger("uiValidated", {
                field: "username",
                valid: b.valid,
                quick: !1
            }), b.valid ? (this.$username.trigger("uiShowTip", "ok"), this.$password.val() && this.$password.trigger("uiInputFieldChanged", {
                forceValidate: !0
            })) : b.reason == "improper_format" ? this.$username.trigger("uiShowTip", "invalid") : b.reason == "blank" ? this.$username.trigger("uiShowTip", "blank") : this.$username.trigger("uiShowTip", "taken"))
        }, this.chooseSuggestion = function (a, b) {
            a.preventDefault();
            var c = $(a.target),
                d = c.text();
            this.$username.prop("lastValue", d), this.$username.val(d), this.$username.trigger("uiShowTip", "ok"), this.$username.trigger("uiInputFieldChanged"), this.$password.val() && this.$password.trigger("uiInputFieldChanged", {
                forceValidate: !0
            }), this.trigger("uiValidated", {
                field: "username",
                valid: !0,
                quick: !1
            })
        }, this.dataValidateEmailResult = function (a, b) {
            this.trigger("uiValidated", {
                field: "email",
                valid: b.valid,
                quick: !1
            }), b.valid ? b.email_suggestion ? (this.select("emailCorrectionSelector").text(b.email_suggestion), this.$email.trigger("uiShowTip", "domain"), this.trigger("uiShowingEmailCorrection")) : this.$email.trigger("uiShowTip", "ok") : b.taken ? this.$email.trigger("uiShowTip", "taken") : b.blank ? this.$email.trigger("uiShowTip", "blank") : this.$email.trigger("uiShowTip", "invalid")
        }, this.fail = function (a, b) {
            this.trigger("uiShowError", "eek")
        }, this.updateEmailField = function (a) {
            a.preventDefault(), this.$email.val(this.select("emailCorrectionSelector").text()).trigger("uiInputFieldChanged", {
                noRemove: !0,
                forceValidate: !0
            })
        }, this.formSubmit = function () {
            if (!this.validated() && !this.disabled) return this.shakeSubmitBtn(), this.trigger("uiSignupValidationFail"), !1;
            this.select("smallPrintSelector").slideUp();
            var a = this.$username.val().match(regexps.usernameForSignup);
            a && this.$username.val(a[1]), this.setSubmitting(!0)
        }, this.setSubmitting = function (a) {
            a !== !1 ? (this.$node.addClass("submitting"), this.$submit.attr("disabled", !0)) : (this.$node.removeClass("submitting"), this.$submit.attr("disabled", !1))
        }, this.shakeSubmitBtn = function () {
            var a = this.$submit;
            a.css("position", "relative");
            var b = 0,
                c = function () {
                    var d = [-8, 8, -5, 5, 0][b];
                    typeof d != "undefined" && (b++, a.animate({
                        left: d
                    }, 100, c))
                };
            c()
        }, this.disableValidation = function () {
            this.disabled = !0, this.$node.addClass("validation-disabled")
        }, this.enableValidation = function () {
            this.disabled = !1, this.$node.removeClass("validation-disabled")
        }, this.after("initialize", function () {
            this.trigger("uiReportSignupPageLoaded"), this.$username = this.select("usernameSelector"), this.$fullname = this.select("fullnameSelector"), this.$email = this.select("emailSelector"), this.$password = this.select("passwordSelector"), this.$score = this.select("scoreSelector"), this.$mobileNumber = this.select("mobileNumberSelector"), this.$holding = this.select("holdingSelector"), this.$allFields = this.$holding.find("input"), this.$submit = this.select("submitSelector"), this.$bq = this.select("bqSelector"), this.disabled = !1, this.$node.find("span.holder").click(function (a) {
                $(a.target).closest(".holding").find("input").focus()
            }), this.on("focusin", {
                usernameSelector: this.focusInput,
                fullnameSelector: this.focusInput,
                emailSelector: this.focusInput,
                passwordSelector: this.focusInput,
                mobileNumberSelector: this.focusInput
            }), this.on("focusout", {
                usernameSelector: this.blurInput,
                fullnameSelector: this.blurInput,
                emailSelector: this.blurInput,
                passwordSelector: this.blurInput,
                mobileNumberSelector: this.blurInput
            }), this.on("keydown", {
                usernameSelector: this.keydownInput,
                fullnameSelector: this.keydownInput,
                emailSelector: this.keydownInput,
                passwordSelector: this.keydownInput,
                mobileNumberSelector: this.keydownInput
            });
            if (ddg.bucket("confirm_signup_fields_538") === "confirm_email" || ddg.bucket("confirm_signup_fields_538") === "confirm_both" || this.attr.forceConfirmEmailField) this.attr.confirmEmailSelector = 'input[name="user[confirm_email]"]', this.fields.confirmEmail = !1, this.$confirmEmail = this.select("confirmEmailSelector"), this.on(this.$confirmEmail, "focusin", this.focusInput), this.on(this.$confirmEmail, "focusout", this.blurInput), this.on(this.$confirmEmail, "keydown", this.keydownInput), this.on(this.$email, "uiInputFieldChanged", function () {
                    this.$confirmEmail.trigger("uiInputFieldChanged", {
                        forceValidate: !0
                    })
                });
            if (ddg.bucket("confirm_signup_fields_538") === "confirm_password" || ddg.bucket("confirm_signup_fields_538") === "confirm_both" || this.attr.forceConfirmPasswordField) this.attr.confirmPasswordSelector = 'input[name="user[user_confirm_password]"]', this.fields.confirmPassword = !1, this.$confirmPassword = this.select("confirmPasswordSelector"), this.on(this.$confirmPassword, "focusin", this.focusInput), this.on(this.$confirmPassword, "focusout", this.blurInput), this.on(this.$confirmPassword, "keydown", this.keydownInput), this.on(this.$password, "uiInputFieldChanged", function () {
                    this.$confirmPassword.trigger("uiInputFieldChanged", {
                        forceValidate: !0
                    })
                });
            this.on(document, "uiValidated", this.validatedField), this.on(document, "dataUsernameResult", this.dataValidateUsernameResult), this.on(document, "dataUsernameError", this.fail), this.on(document, "dataEmailResult", this.dataValidateEmailResult), this.on(document, "dataEmailError", this.fail), this.on("uiInputFieldChanged", this.uiInputFieldChanged), this.on(document, "uiCorrectEmailClicked", this.updateEmailField), this.on(document, "uiDisableSignupValidation", this.disableValidation), this.on(document, "uiEnableSignupValidation", this.enableValidation), this.on("submit", this.formSubmit), this.on("click", {
                suggestionSelector: this.chooseSuggestion
            }), this.on("uiShowTip", this.showTip), this.$allFields.each(function (a, b) {
                var c = $(b);
                c.prop("lastValue", c.val()), c.val().length > 1 && !c.closest(".holding").find(".sidetip p.active").size() && c.trigger("uiInputFieldChanged", {
                    forceValidate: !0
                })
            }), clock.setIntervalEvent("uiCheckAllFields", 2222), this.on(document, "uiCheckAllFields", this.checkAllFields), this.attr.isDeviceCompletion && (this.$username.attr("disabled", !0), this.fields.username = !0), this.trigger("uiReportBQCheckboxState", {
                bq: this.$bq.attr("checked") ? "on" : "off"
            }), this.on("click", {
                bqSelector: function () {
                    this.trigger("uiReportBQCheckboxState", {
                        bq: this.$bq.attr("checked") ? "select" : "deselect"
                    })
                }
            }), this.$node.is(".validated") && (Object.keys(this.fields).forEach(function (a) {
                this.fields[a] = !0
            }.bind(this)), this.formSubmit()), this.on(this.select("emailCorrectionSelector"), "click", function () {
                this.trigger("uiCorrectEmailClicked")
            })
        })
    }
    var ddg = require("app/data/ddg"),
        clock = require("core/clock"),
        regexps = require("app/utils/common_regexp");
    module.exports = withSignupValidation
});
define("app/ui/signup/signup_form", ["module", "require", "exports", "core/component", "core/clock", "app/ui/signup/with_captcha", "app/ui/signup/with_signup_validation", "app/utils/common_regexp"], function (module, require, exports) {
    function signupForm() {
        this.focusFirstNonOkField = function () {
            this.$holding.each(function () {
                var a = $(this);
                if (!a.find(".sidetip p.isaok.active, .sidetip p.checking.active").size()) return a.find("input").focus(), !1
            })
        }, this.showPasswordScore = function (a, b) {
            this.$score.fadeIn().find("b").animate({
                width: b / 2
            })
        }, this.after("initialize", function () {
            this.on(document, "uiSignupValidationFail", this.focusFirstNonOkField), this.on(document, "uiValidated", function (a, b) {
                b.fieldname == "username" && b.valid == 1 && this.focusFirstNonOkField()
            }), this.on(document, "dataPasswordStrength", this.showPasswordScore), this.on(document, "uiSwiftLoaded", this.focusFirstNonOkField)
        })
    }
    var defineComponent = require("core/component"),
        clock = require("core/clock"),
        withCaptcha = require("app/ui/signup/with_captcha"),
        withSignupValidation = require("app/ui/signup/with_signup_validation"),
        regexps = require("app/utils/common_regexp");
    module.exports = defineComponent(signupForm, withCaptcha, withSignupValidation)
});
define("app/ui/with_password_strength", ["module", "require", "exports", "core/i18n"], function (module, require, exports) {
    function withPasswordStrength() {
        this.defaultAttrs({
            minLength: 6,
            requireStrong: !1,
            username: "",
            bannedPasswords: []
        }), this.strength = function (b, c) {
            function i(a, b) {
                var c = "";
                for (var d = 0; d < b.length; d++) {
                    var e = !0;
                    for (var f = 0; f < a && f + d + a < b.length; f++) e = e && b.charAt(f + d) == b.charAt(f + d + a);
                    f < a && (e = !1), e ? (d += a - 1, e = !1) : c += b.charAt(d)
                }
                return c
            }
            var d = 0,
                c = c || this.attr.username;
            if (b.length < this.attr.minLength) return {
                    score: b.length,
                    message: _('\ub108\ubb34 \uc9e7\uc2b5\ub2c8\ub2e4'),
                    reason: "tooshort"
            };
            if (c && c && b.toLowerCase() == c.toLowerCase()) return {
                    score: 0,
                    message: _('\ub108\ubb34 \ubed4\ud569\ub2c8\ub2e4.'),
                    reason: "obvious"
            };
            if (this.attr.bannedPasswords.indexOf(b.toLowerCase()) > -1) return {
                    score: 0,
                    message: _('\ub108\ubb34 \ubed4\ud569\ub2c8\ub2e4.'),
                    reason: "obvious"
            };
            if (this.attr.requireStrong) {
                var e = 10,
                    f = "# ` ~ ! @ $ % ^ & * ( ) - _ = + [ ] { } \\ | ; : ' \" , . < > / ?".split(" ");
                f = f.map(function (a) {
                    return "\\" + a
                }).join("");
                var g = ["\\d", "[a-z]", "[A-Z]", "[" + f + "]"],
                    h = g.map(function (a) {
                        return "(?=.*" + a + ")"
                    }).join("");
                if (!b.match(new RegExp("(" + h + "){10,}"))) return {
                        score: 0,
                        message: _('Too Weak'),
                        reason: "tooweak"
                }
            }
            d += b.length * 4, d += (i(1, b).length - b.length) * 1, d += (i(2, b).length - b.length) * 1, d += (i(3, b).length - b.length) * 1, d += (i(4, b).length - b.length) * 1, b.match(/(.*[0-9].*[0-9].*[0-9])/) && (d += 5), b.match(/(.*[!@#$%^&*?_~].*[!@#$%^&*?_~])/) && (d += 5), b.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/) && (d += 10), b.match(/([a-zA-Z])/) && b.match(/([0-9])/) && (d += 15), b.match(/([!@#$%^&*?_~])/) && b.match(/([0-9])/) && (d += 15), b.match(/([!@#$%^&*?_~])/) && b.match(/([a-zA-Z])/) && (d += 15);
            if (b.match(/^\w+$/) || b.match(/^\d+$/)) d -= 10;
            return d < 0 && (d = 0), d > 100 && (d = 100), d < 34 ? {
                score: d,
                message: _('Weak'),
                reason: "weak"
            } : d < 50 ? {
                score: d,
                message: _('\uc778\uae30'),
                reason: "good"
            } : d < 75 ? {
                score: d,
                message: _('Strong'),
                reason: "strong"
            } : {
                score: d,
                message: _('Very Strong'),
                reason: "verystrong"
            }
        }, this.undoBannedPasswordROT13 = function () {
            var a = [];
            for (var b = 0, c = this.attr.bannedPasswords.length; b < c; b++) a.push(this.attr.bannedPasswords[b].replace(/[a-z]/gi, function (a) {
                    var b = a.charCodeAt(0),
                        c = b + 13;
                    if (b <= 90 && c > 90 || c > 122) c -= 26;
                    return String.fromCharCode(c)
                }));
            this.attr.bannedPasswords = a
        }, this.after("initialize", function () {
            this.attr.bannedPasswords.length && this.undoBannedPasswordROT13()
        })
    }
    var _ = require("core/i18n");
    module.exports = withPasswordStrength
});
define("app/data/signup_data", ["module", "require", "exports", "core/component", "app/ui/with_password_strength", "app/utils/common_regexp", "core/utils", "core/i18n"], function (module, require, exports) {
    function signupData() {
        this.defaultAttrs({
            ajaxTimeout: 6e3
        });
        var a = "";
        this.validateUsernameAndSuggest = function (b) {
            var c = b.username.match(regexps.usernameForSignup);
            c && (b.username = c[1]);
            var d = {
                suggest: 1,
                username: b.username,
                full_name: b.fullname,
                email: b.email,
                context: this.attr.scribeContext || "signup",
                custom: b && b.custom || 0
            };
            d.suggest_on_username = a !== d.username, a = d.username, this.trigger("dataValidateUsername", d)
        }, this.validateName = function (a, b, c) {
            var d = !! a.match(regexps.name),
                e = "tip";
            return d ? b || (e = "ok") : e = a.length ? "invalid" : "blank", this.trigger("uiValidated", {
                field: "name",
                valid: d,
                quick: b
            }), e
        }, this.validateEmail = function (a, b, c) {
            var d = "tip";
            return b || (d = "checking", this.trigger("dataValidateEmail", {
                email: a
            }), this.validateUsernameAndSuggest(c)), this.trigger("uiValidated", {
                field: "email",
                valid: !0,
                quick: b
            }), d
        }, this.validatePassword = function (a, b, c) {
            var d = "tip",
                e = a.length > 6;
            if (!b) {
                var f = this.strength(a, c.username);
                f.score || (e = !1);
                switch (f.reason) {
                    case "obvious":
                    case "banned":
                        d = "obvious", e = !1;
                        break;
                    case "whitespace":
                    case "tooshort":
                    case "tooweak":
                        d = "invalid", e = !1;
                        break;
                    case "verystrong":
                        d = "perfect", e = !0;
                        break;
                    case "good":
                    case "strong":
                        d = "ok", e = !0;
                        break;
                    case "weak":
                    default:
                        var g = f.score > 9;
                        d = "weak." + (g ? "isaok" : "error"), e = g
                }
                this.trigger("dataPasswordStrength", f.score)
            }
            return !e && d == "tip" && (d = a.length ? "invalid" : "blank"), this.trigger("uiValidated", {
                field: "password",
                valid: e,
                quick: b
            }), d
        }, this.validateConfirmEmail = function (a, b, c) {
            if (a === "") return "";
            var d = a === c.email,
                e = d ? "match" : "no-match";
            return this.trigger("uiValidated", {
                field: "confirmEmail",
                valid: d,
                quick: b
            }), e
        }, this.validateConfirmPassword = function (a, b, c) {
            if (a === "") return "";
            var d = a === c.password,
                e = d ? "match" : "no-match";
            return this.trigger("uiValidated", {
                field: "confirmPassword",
                valid: d,
                quick: b
            }), e
        }, this.validateUsername = function (a, b, c) {
            var d = !1,
                e = "tip";
            if (a.match(regexps.ampersat)) d = !0, e = "tip";
            else {
                var f = a.match(regexps.usernameForSignup),
                    d = f;
                this.attr.isDeviceCompletion ? e = "ok" : b || (f && (e = "checking"), this.validateUsernameAndSuggest(util.merge(c, {
                    custom: !0
                })))
            }
            return !d && e == "tip" && (e = a.length ? "invalid" : "blank"), d || this.trigger("uiValidated", {
                field: "username",
                valid: d,
                quick: b
            }), e
        }, this.validateMobileNumber = function (a, b, c) {
            if (b) return "";
            var d = "";
            return a.length == 12 ? d = "ok" : a.length > 0 && (d = "invalid"), this.trigger("uiValidated", {
                field: "mobileNumber",
                valid: d == "ok",
                quick: b
            }), d
        }, this.validateField = function (a, b) {
            var c = "tip",
                d = {
                    "user[name]": this.validateName,
                    "user[email]": this.validateEmail,
                    "user[confirm_email]": this.validateConfirmEmail,
                    "user[user_password]": this.validatePassword,
                    "user[user_confirm_password]": this.validateConfirmPassword,
                    "user[screen_name]": this.validateUsername,
                    "device[address]": this.validateMobileNumber
                };
            c = d[b.name].call(this, b.value, b.quick, b), $(a.target).trigger("uiShowTip", c)
        }, this.after("initialize", function () {
            this.on("uiSignupValidate", this.validateField)
        })
    }
    var defineComponent = require("core/component"),
        withPasswordStrength = require("app/ui/with_password_strength"),
        regexps = require("app/utils/common_regexp"),
        util = require("core/utils"),
        _ = require("core/i18n"),
        SignupData = defineComponent(signupData, withPasswordStrength);
    module.exports = SignupData
});
define("app/data/settings", ["module", "require", "exports", "core/component", "app/data/with_auth_token", "app/data/with_data", "core/i18n"], function (module, require, exports) {
    var defineComponent = require('core/component'),
        withAuthToken = require('app/data/with_auth_token'),
        withData = require('app/data/with_data'),
        _ = require('core/i18n');
    var SettingsData = defineComponent(settingsData, withData, withAuthToken);

    function settingsData() {
        // TODO: dedupe these methods
        this.defaultAttrs({
            ajaxTimeout: 6000,
            noShowError: true
        });
        this.verifyUsername = function (event, data) {
            this.get({
                url: '/users/username_available',
                eventData: data,
                data: data,
                success: 'dataUsernameResult',
                error: 'dataUsernameError'
            });
        };
        this.verifyEmail = function (event, data) {
            this.get({
                url: '/users/email_available',
                eventData: data,
                data: data,
                success: 'dataEmailResult',
                error: 'dataEmailError'
            });
        };
        this.cancelPendingEmail = function (event, data) {
            var success = function (json) {
                this.trigger('dataCancelEmailSuccess', json);
            };
            var error = function (request) {
                this.trigger('dataCancelEmailFailure', request);
            };
            this.post({
                url: data.url,
                data: this.addAuthToken(),
                success: success.bind(this),
                error: error.bind(this)
            });
        };
        this.resendPendingEmail = function (event, data) {
            var success = function (json) {
                this.trigger('dataResendEmailSuccess', json);
            };
            var error = function (request) {
                this.trigger('dataResendEmailFailure', request);
            };
            this.post({
                url: data.url,
                data: this.addAuthToken(),
                success: success.bind(this),
                error: error.bind(this)
            });
        };
        this.resendPassword = function (event, data) {
            this.post({
                url: data.url,
                data: this.addAuthToken(),
                dataType: 'text',
                success: function () {
                    this.trigger('dataForgotPasswordSuccess', {});
                }.bind(this)
            });
        };
        this.deleteGeoData = function (event) {
            var error = function (request) {
                this.trigger('dataGeoDeletionError', {});
            };
            this.post({
                url: '/account/delete_location_data',
                dataType: 'text',
                data: this.addAuthToken(),
                error: error.bind(this)
            });
        };
        //enhanced profile events
        this.publishBanner = function (event, data) {
            this.post({
                url: '/settings/enhanced_profile/publish_banner',
                eventData: data,
                data: {},
                timeout: this.attr.ajaxTimeout,
                success: 'dataPublishBannerSuccess',
                error: 'dataPublishBannerFailure'
            });
        };
        this.deletePreviewBanner = function (event, data) {
            this.post({
                url: '/settings/enhanced_profile/delete_banner',
                eventData: data,
                data: {
                    'banner_type': 'preview'
                },
                timeout: this.attr.ajaxTimeout,
                success: 'dataDeletePreviewSuccess',
                error: 'dataDeletePreviewFailure'
            });
        };
        this.deleteBanner = function (event, data) {
            this.post({
                url: '/settings/enhanced_profile/delete_banner',
                eventData: data,
                data: {
                    'banner_type': 'live'
                },
                timeout: this.attr.ajaxTimeout,
                success: 'dataDeleteBannerSuccess',
                error: 'dataDeleteBannerFailure'
            });
        };
        this.revokeAuthority = function (event, data) {
            this.post({
                url: '/oauth/revoke',
                eventData: data,
                data: data,
                success: 'dataOAuthRevokeResultSuccess',
                error: 'dataOAuthRevokeResultFailure'
            });
        };
        // duckface events
        this.uploadImage = function (event, data) {
            var uploadTypeToUrl = {
                header: '/settings/profile/upload_profile_header',
                avatar: '/settings/profile/profile_image_update'
            };
            data.page_context = this.attr.pageName;
            this.post({
                url: uploadTypeToUrl[data.uploadType],
                eventData: data,
                data: data,
                success: 'dataImageEnqueued',
                error: 'dataImageFailedToEnqueue'
            });
        };
        this.checkImageUploadStatus = function (event, data) {
            var uploadTypeToUrl = {
                header: '/settings/profile/check_header_processing_complete',
                avatar: '/settings/profile/swift_check_processing_complete'
            };
            this.get({
                url: uploadTypeToUrl[data.uploadType],
                eventData: data,
                data: data,
                headers: {
                    'X-Retry-After': true
                },
                success: 'dataHasImageUploadStatus',
                error: 'dataFailedToGetImageUploadStatus'
            });
        };
        this.deleteImage = function (event, data) {
            var uploadTypeToUrl = {
                header: '/settings/profile/destroy_profile_header',
                avatar: '/settings/profile'
            };
            this.destroy({
                url: uploadTypeToUrl[data.uploadType],
                eventData: data,
                data: data,
                success: 'dataDeleteImageSuccess',
                error: 'dataDeleteImageFailure'
            });
        };
        // method also exists in data/email_banner.js
        this.resendConfirmationEmail = function (event, data) {
            this.post({
                url: '/account/resend_confirmation_email',
                eventData: data,
                data: data,
                success: 'dataResendConfirmationEmailSuccess',
                error: 'dataResendConfirmationEmailError'
            });
        };
        // Call to export tweets
        this.tweetExport = function (event, data) {
            this.post({
                url: '/account/request_tweet_export',
                eventData: data,
                data: data,
                success: 'dataTweetExportSuccess',
                error: 'dataTweetExportError'
            });
        };
        // Call to resend download email
        this.tweetExportResend = function (event, data) {
            this.post({
                url: '/account/request_tweet_export_resend',
                eventData: data,
                data: data,
                success: 'dataTweetExportResendSuccess',
                error: 'dataTweetExportResendError'
            });
        };
        // Call to increase rate limiter on user
        this.tweetExportIncrRateLimiter = function (event, data) {
            this.post({
                url: '/account/request_tweet_export_download',
                eventData: data,
                data: data,
                success: 'dataTweetExportDownloadSuccess',
                error: 'dataTweetExportDownloadError'
            });
        };
        this.after('initialize', function () {
            this.on('uiPublishBanner', this.publishBanner);
            this.on('uiDeletePreview', this.deletePreviewBanner);
            this.on('uiDeleteBanner', this.deleteBanner);
            this.on('uiUsernameChange', this.verifyUsername);
            this.on('uiEmailChange', this.verifyEmail);
            this.on('uiCancelPendingEmail', this.cancelPendingEmail);
            this.on('uiResendPendingEmail', this.resendPendingEmail);
            this.on('uiForgotPassword', this.resendPassword);
            this.on('uiDeleteGeoData', this.deleteGeoData);
            this.on('uiRevokeClick', this.revokeAuthority);
            // duckface endpoint
            this.on('uiImageSave', this.uploadImage);
            this.on('uiDeleteImage', this.deleteImage);
            this.on('uiCheckImageUploadStatus', this.checkImageUploadStatus);
            // Grailbird (tweet / DM export)
            this.on('uiTweetExportButtonClicked', this.tweetExport);
            this.on('uiTweetExportResendButtonClicked', this.tweetExportResend);
            this.on('uiTweetExportConfirmEmail', this.resendConfirmationEmail);
            this.on('uiTweetExportIncrRateLimiter', this.tweetExportIncrRateLimiter);
            // signup uses these:
            this.on('dataValidateUsername', this.verifyUsername);
            this.on('dataValidateEmail', this.verifyEmail);
        });
    }
    module.exports = SettingsData;
});
define("app/data/signup_scribe", ["module", "require", "exports", "core/component", "app/data/with_scribe"], function (module, require, exports) {
    function signupScribe() {
        this.defaultAttrs({
            signupButtonSelector: ".signup-btn",
            suggestionSelector: ".username .suggestions li button",
            bqLearnMoreSelector: ".cookie-personalization-support"
        }), this.scribeValidationError = function (a, b) {
            var c = b.field;
            c == "username" && (c = "screen_name");
            if (b.quick || b.valid) return;
            this.scribe({
                component: "personalization",
                element: c,
                action: "validation_error"
            }, {
                context: this.attr.signupContext
            })
        }, this.scribeSuggestionSelected = function (a, b) {
            var c = $(a.target);
            this.scribe({
                component: "form",
                element: "suggestion",
                action: "click"
            }, {
                message: c.text(),
                query: c.attr("data-sugg-sources"),
                event_info: c.attr("data-sugg-technik"),
                context: this.attr.signupContext
            })
        }, this.scribeCaptchaImpression = function () {
            this.scribe({
                component: "form",
                element: "captcha",
                action: "impression"
            }, {
                context: this.attr.signupContext
            })
        }, this.scribeFocus = function (a, b) {
            var c = $(a.target),
                d = c.closest(".holding").attr("data-fieldname");
            this.scribe({
                component: "form",
                element: d,
                action: "focus_field"
            }, {
                context: this.attr.signupContext
            })
        }, this.scribeBQLearnMore = function (a, b) {
            this.scribe({
                component: "personalization",
                element: "support_link",
                action: "click"
            }, {
                context: this.attr.signupContext
            })
        }, this.scribeBQState = function (a, b) {
            this.scribe({
                component: "personalization",
                element: "checkbox",
                action: b.bq
            }, {
                context: this.attr.signupContext
            })
        }, this.scribeEmailCorrectionImpression = function (a, b) {
            this.scribe({
                component: "form",
                element: "email_autocorrect",
                action: "impression"
            }, {
                context: this.attr.signupContext
            })
        }, this.scribeImpression = function (a, b) {
            this.scribe({
                component: "javascript",
                action: "impression"
            }, {
                context: this.attr.signupContext
            })
        }, this.scribeEmailCorrectionClick = function (a, b) {
            this.scribe({
                component: "form",
                element: "email_autocorrect",
                action: "click"
            }, {
                context: this.attr.signupContext
            })
        }, this.scribeSignupButtonClick = function () {
            this.scribe({
                component: "form",
                element: "signup_button",
                action: "click"
            }, {
                context: this.attr.signupContext
            })
        }, this.after("initialize", function () {
            this.on("uiCorrectEmailClicked", this.scribeEmailCorrectionClick), this.on("uiShowingEmailCorrection", this.scribeEmailCorrectionImpression), this.on("uiValidated", this.scribeValidationError), this.on("click", {
                suggestionSelector: this.scribeSuggestionSelected,
                bqLearnMoreSelector: this.scribeBQLearnMore,
                signupButtonSelector: this.scribeSignupButtonClick
            }), this.on("uiCaptchaShown", this.scribeCaptchaImpression), this.on("uiFieldTouched", this.scribeFocus), this.on("uiReportBQCheckboxState", this.scribeBQState), this.on("uiReportSignupPageLoaded", this.scribeImpression)
        })
    }
    var defineComponent = require("core/component"),
        withScribe = require("app/data/with_scribe");
    module.exports = defineComponent(signupScribe, withScribe)
});
define("app/ui/signup/suggestions", ["module", "require", "exports", "core/component"], function (module, require, exports) {
    function suggestions() {
        this.showSuggestions = function (a, b) {
            var c = b.suggestions;
            if (c && c.length) {
                var d = this.$node,
                    e = d.children("ul").empty(),
                    f = "";
                $.each(c, function () {
                    f += '<li><button class="btn-link" data-sugg-sources="' + this.sources.join(",") + '"' + ' data-sugg-technik="' + this.technique + '"' + ">" + this.suggestion + "</button></li>" + "\n"
                }), e.append($(f)), d.slideDown("fast", function () {
                    this.trigger("uiUsernameSuggestionsShown")
                }.bind(this))
            }
        }, this.after("initialize", function () {
            this.on(document, "dataUsernameResult", this.showSuggestions)
        })
    }
    var defineComponent = require("core/component"),
        Suggestions = defineComponent(suggestions);
    module.exports = Suggestions
});
define("app/utils/animate_window_scrolltop", ["module", "require", "exports"], function (module, require, exports) {
    function getScrollEl() {
        return scrollEl ? scrollEl : ([document.body, document.documentElement].forEach(function (a) {
            var b = a.scrollTop;
            a.scrollTop = b + 1, a.scrollTop == b + 1 && (scrollEl = a.tagName.toLowerCase(), a.scrollTop = b)
        }), scrollEl)
    }
    var scrollEl;
    module.exports = function (a, b) {
        $(getScrollEl()).animate({
            scrollTop: a
        }, b)
    }
});
define("app/ui/signup/small_print_expander", ["module", "require", "exports", "core/component", "app/utils/animate_window_scrolltop"], function (module, require, exports) {
    function smallPrintExpander() {
        this.defaultAttrs({
            speed: 666,
            height: 400
        }), this.showTOS = function () {
            var a = this.$node;
            a.animate({
                height: this.attr.height
            }, this.attr.speed).blur();
            var b = a.offset().top - 60;
            animateWinScrollTop(b, this.attr.speed), this.off("mousedown")
        }, this.after("initialize", function () {
            this.on("mousedown", this.showTOS)
        })
    }
    var defineComponent = require("core/component"),
        animateWinScrollTop = require("app/utils/animate_window_scrolltop"),
        SmallPrintExpander = defineComponent(smallPrintExpander);
    module.exports = SmallPrintExpander
});
define("app/ui/signin_dropdown", ["module", "require", "exports", "core/component", "app/ui/with_dropdown"], function (module, require, exports) {
    function signinDropdown() {
        this.defaultAttrs({
            toggler: ".js-session .dropdown-toggle",
            usernameSelector: ".email-input"
        }), this.focusUsername = function () {
            this.select("usernameSelector").focus()
        }, this.after("initialize", function () {
            this.on("uiDropdownOpened", this.focusUsername)
        })
    }
    var defineComponent = require("core/component"),
        withDropdown = require("app/ui/with_dropdown"),
        SigninDropdown = defineComponent(signinDropdown, withDropdown);
    module.exports = SigninDropdown
});
define("app/ui/signup_download/us_phone_number_checker", ["module", "require", "exports", "core/component", "app/data/with_scribe"], function (module, require, exports) {
    function usPhoneNumberChecker() {
        var a = "";
        this.recordLast = function (b, c) {
            a = $(b.target).val()
        }, this.uiFieldChanged = function (b, c) {
            var d = $(b.target).val(),
                e = "";
            if (a === d) return;
            d = d.replace(/\D/g, ""), d = d.replace(/^1/, ""), d.length > 10 && (d = d.substring(0, 10)), d.length > 6 ? e = d.substring(0, 3) + "-" + d.substring(3, 6) + "-" + d.substring(6, 10) : d.length > 3 ? e = d.substring(0, 3) + "-" + d.substring(3, 10) : e = d, $(b.target).val(e)
        }, this.after("initialize", function () {
            this.on("keydown", this.recordLast), this.on("keyup", this.uiFieldChanged)
        })
    }
    var defineComponent = require("core/component"),
        withScribe = require("app/data/with_scribe"),
        USPhoneNumberChecker = defineComponent(usPhoneNumberChecker, withScribe);
    module.exports = USPhoneNumberChecker
});
define("app/pages/signup/signup", ["module", "require", "exports", "app/ui/signup/signup_form", "app/boot/common", "app/data/signup_data", "app/data/settings", "app/data/signup_scribe", "app/ui/signup/suggestions", "app/ui/signup/small_print_expander", "app/ui/signin_dropdown", "app/ui/signup_download/us_phone_number_checker"], function (module, require, exports) {
    var SignupForm = require("app/ui/signup/signup_form"),
        bootCommon = require("app/boot/common"),
        SignupData = require("app/data/signup_data"),
        SettingsData = require("app/data/settings"),
        SignupScribe = require("app/data/signup_scribe"),
        Suggestions = require("app/ui/signup/suggestions"),
        SmallPrintExpander = require("app/ui/signup/small_print_expander"),
        SigninDropdown = require("app/ui/signin_dropdown"),
        USPhoneNumberChecker = require("app/ui/signup_download/us_phone_number_checker");
    module.exports = function (a) {
        bootCommon(a), SigninDropdown.attachTo(".js-session"), SignupScribe.attachTo(document, {
            scribeContext: a.scribeContext
        }), SettingsData.attachTo(document, a), SignupData.attachTo(document, {
            scribeContext: a.scribeContext,
            bannedPasswords: a.bannedPasswords,
            isDeviceCompletion: a.isDeviceCompletion
        }), SmallPrintExpander.attachTo(".tos .scroller"), SignupForm.attachTo("#phx-signup-form", {
            env: a.environment,
            captchaAvailable: a.captchaAvailable,
            isDeviceCompletion: a.isDeviceCompletion
        }), Suggestions.attachTo(".username .suggestions"), USPhoneNumberChecker.attachTo('input[name="device[address]"]')
    }
});