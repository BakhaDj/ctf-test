import CTFd from "../compat/CTFd";
import $ from "jquery";
import dayjs from "dayjs";
import advancedFormat from "dayjs/plugin/advancedFormat";
import nunjucks from "nunjucks";
import { Howl } from "howler";
import events from "../compat/events";
import times from "../compat/times";
import styles from "../styles";
import { default as helpers } from "../compat/helpers";

dayjs.extend(advancedFormat);

CTFd.init(window.init);
window.CTFd = CTFd;
window.helpers = helpers;
window.$ = $;
window.dayjs = dayjs;
window.nunjucks = nunjucks;
window.Howl = Howl;

$(() => {
  styles();
  times();
  events(CTFd.config.urlRoot);
});
