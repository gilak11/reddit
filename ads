! Title: uBlock filters
! Last modified: %timestamp%
! Expires: 5 days
! Description: Filters optimized for uBlock, to be used along EasyList
! Homepage: https://github.com/uBlockOrigin/uAssets
! License: https://github.com/uBlockOrigin/uAssets/blob/master/LICENSE
!
! GitHub issues: https://github.com/uBlockOrigin/uAssets/issues
! GitHub pull requests: https://github.com/uBlockOrigin/uAssets/pulls

! https://github.com/uBlockOrigin/uAssets/issues/1408
*_ad_$media,domain=youtube.com,3p
! https://github.com/easylist/easylist/issues/5112
! @@||youtube.com/get_video_info?*timedtext_editor$xhr,1p
! https://redd.it/ggcmkp https://redd.it/gx03e0
! https://github.com/uBlockOrigin/uAssets/pull/18106/
! https://www.reddit.com/r/uBlockOrigin/comments/1atwzem/comment/l06ayn9/
tv.youtube.com##+js(trusted-replace-xhr-response, '"adPlacements"', '"no_ads"', /playlist\?list=|player\?|watch\?[tv]=|youtubei\/v1\/player/)
!#if !cap_html_filtering
www.youtube.com##+js(trusted-replace-xhr-response, /"adPlacements.*?([A-Z]"\}|"\}{2\,4})\}\]\,/, , /playlist\?list=|player\?|watch\?[tv]=|youtubei\/v1\/player/)
www.youtube.com##+js(trusted-replace-xhr-response, /"adPlacements.*?("adSlots"|"adBreakHeartbeatParams")/gms, $1, youtubei/v1/player)
www.youtube.com##+js(trusted-replace-fetch-response, /"adPlacements.*?([A-Z]"\}|"\}{2\,4})\}\]\,/, , player?)
www.youtube.com##+js(trusted-replace-fetch-response, /\"adSlots.*?\}\]\}\}\]\,/, , player?)
!#else
||www.youtube.com/playlist?list=$xhr,1p,replace=/"adPlacements.*?([A-Z]"\}|"\}{2\,4})\}\]\,//
||www.youtube.com/playlist?list=$xhr,1p,replace=/"adSlots.*?\}\]\}\}\]\,//
||www.youtube.com/watch?$xhr,1p,replace=/"adPlacements.*?([A-Z]"\}|"\}{2\,4})\}\]\,//
||www.youtube.com/watch?$xhr,1p,replace=/"adSlots.*?\}\]\}\}\]\,//
||www.youtube.com/youtubei/v1/player?$xhr,1p,replace=/"adPlacements.*?([A-Z]"\}|"\}{2\,4})\}\]\,//
||www.youtube.com/youtubei/v1/player?$xhr,1p,replace=/"adSlots.*?\}\]\}\}\]\,//
!#endif
! https://www.reddit.com/r/uBlockOrigin/comments/154vtwy/getting_ads_on_youtube/jsu299l/
! https://github.com/uBlockOrigin/uBlock-issues/issues/3083#issuecomment-1899349892
! https://github.com/uBlockOrigin/uBlock-discussions/discussions/831#discussioncomment-8271839
m.youtube.com,music.youtube.com,tv.youtube.com,www.youtube.com,youtubekids.com,youtube-nocookie.com##+js(set, ytInitialPlayerResponse.playerAds, undefined)
m.youtube.com,music.youtube.com,tv.youtube.com,www.youtube.com,youtubekids.com,youtube-nocookie.com##+js(set, ytInitialPlayerResponse.adPlacements, undefined)
m.youtube.com,music.youtube.com,tv.youtube.com,www.youtube.com,youtubekids.com,youtube-nocookie.com##+js(set, ytInitialPlayerResponse.adSlots, undefined)
m.youtube.com,music.youtube.com,tv.youtube.com,www.youtube.com,youtubekids.com,youtube-nocookie.com##+js(set, playerResponse.adPlacements, undefined)
! https://github.com/uBlockOrigin/uAssets/issues/7636#issuecomment-1674303331
m.youtube.com,music.youtube.com,youtubekids.com,youtube-nocookie.com##+js(json-prune, playerResponse.adPlacements playerResponse.playerAds playerResponse.adSlots adPlacements playerAds adSlots important)
! https://github.com/uBlockOrigin/uAssets/issues/20586#issuecomment-2144781835
www.youtube.com##+js(json-prune-fetch-response, playerAds adPlacements adSlots playerResponse.playerAds playerResponse.adPlacements playerResponse.adSlots, , propsToMatch, /playlist?)
! https://github.com/uBlockOrigin/uAssets/issues/15632
youtube.com##.ytlr-horizontal-list-renderer__items > .yt-virtual-list__container > .yt-virtual-list__item--visible.yt-virtual-list__item--selected.yt-virtual-list__item:has-text(Ad)
! https://www.reddit.com/r/uBlockOrigin/comments/163cy47/youtube_antiadblock_and_ads_weekly_thread_august/jyemgzo/
||googlevideo.com/initplayback?source=youtube*&c=TVHTML5&oad=$xhr,domain=youtube.com
! Shorts Ad
m.youtube.com,music.youtube.com,tv.youtube.com,www.youtube.com,youtubekids.com,youtube-nocookie.com##+js(json-prune-fetch-response, reelWatchSequenceResponse.entries.[-].command.reelWatchEndpoint.adClientParams.isAd entries.[-].command.reelWatchEndpoint.adClientParams.isAd, , propsToMatch, url:/reel_watch_sequence?)

! AdDefend
!#if env_chromium
lablue.*##+js(nostif, push, 500)
||doubleclick.net^$script,important,domain=auto-motor-und-sport.de
!#endif
4-liga.com,4fansites.de,4players.de,9monate.de##+js(nostif, .call(null), 10)
aachener-nachrichten.de,aachener-zeitung.de,abendblatt.de,abendzeitung-muenchen.de,about-drinks.com,abseits-ka.de,airliners.de,ajaxshowtime.com,allgemeine-zeitung.de,alpin.de,antenne.de,arcor.de,areadvd.de,areamobile.de,ariva.de,astronews.com,aussenwirtschaftslupe.de,auszeit.bio,auto-motor-und-sport.de,auto-service.de,autobild.de,autoextrem.de,autopixx.de,autorevue.at,az-online.de##+js(nostif, .call(null), 10)
baby-vornamen.de,babyclub.de,bafoeg-aktuell.de,berliner-kurier.de,berliner-zeitung.de,bigfm.de,bikerszene.de,bildderfrau.de,blackd.de,blick.de,boerse-online.de,boerse.de,boersennews.de,braunschweiger-zeitung.de,brieffreunde.de,brigitte.de,buerstaedter-zeitung.de,buffed.de,businessinsider.de,buzzfeed.at,buzzfeed.de##+js(nostif, .call(null), 10)
caravaning.de,cavallo.de,chefkoch.de,cinema.de,clever-tanken.de,computerbild.de,computerhilfen.de,comunio-cl.com,comunio.*,connect.de,chip.de##+js(nostif, .call(null), 10)
da-imnetz.de,dasgelbeblatt.de,dbna.com,dbna.de,deichstube.de,deine-tierwelt.de,der-betze-brennt.de,derwesten.de,desired.de,dhd24.com,dieblaue24.com,digitalfernsehen.de,dnn.de,donnerwetter.de##+js(nostif, .call(null), 10)
e-hausaufgaben.de,e-mountainbike.com,eatsmarter.de,echo-online.de,ecomento.de,einfachschoen.me,elektrobike-online.com,eltern.de,epochtimes.de,essen-und-trinken.de,express.de,extratipp.com##+js(nostif, .call(null), 10)
familie.de,fanfiktion.de,fehmarn24.de,fettspielen.de,fid-gesundheitswissen.de,finanzen.*,finanznachrichten.de,finanztreff.de,finya.de,firmenwissen.de,fitforfun.de,fnp.de,football365.fr,formel1.de,fr.de,frankfurter-wochenblatt.de,freenet.de,fremdwort.de,froheweihnachten.info,frustfrei-lernen.de,fuldaerzeitung.de,funandnews.de,fussballdaten.de,futurezone.de##+js(nostif, .call(null), 10)
gala.de,gamepro.de,gamersglobal.de,gamesaktuell.de,gamestar.de,gameswelt.*,gamezone.de,gartendialog.de,gartenlexikon.de,gedichte.ws,geissblog.koeln,gelnhaeuser-tageblatt.de,general-anzeiger-bonn.de,geniale-tricks.com,genialetricks.de,gesund-vital.de,gesundheit.de,gevestor.de,gewinnspiele.tv,giessener-allgemeine.de,giessener-anzeiger.de,gifhorner-rundschau.de,giga.de,gipfelbuch.ch,gmuender-tagespost.de,golem.de,gruenderlexikon.de,gusto.at,gut-erklaert.de,gutfuerdich.co##+js(nostif, .call(null), 10)
hallo-muenchen.de,hamburg.de,hanauer.de,hardwareluxx.de,hartziv.org,harzkurier.de,haus-garten-test.de,hausgarten.net,haustec.de,haz.de,heftig.*,heidelberg24.de,heilpraxisnet.de,heise.de,helmstedter-nachrichten.de,hersfelder-zeitung.de,hftg.co,hifi-forum.de,hna.de,hochheimer-zeitung.de,hoerzu.de,hofheimer-zeitung.de##+js(nostif, .call(null), 10)
iban-rechner.de,ikz-online.de,immobilienscout24.de,ingame.de,inside-digital.de,inside-handy.de,investor-verlag.de##+js(nostif, .call(null), 10)
jappy.com,jpgames.de##+js(nostif, .call(null), 10)
kabeleins.de,kachelmannwetter.com,kamelle.de,kicker.de,kindergeld.org,klettern-magazin.de,klettern.de,kochbar.de,kreis-anzeiger.de,kreisbote.de,kreiszeitung.de,ksta.de,kurierverlag.de##+js(nostif, .call(null), 10)
lachainemeteo.com,lampertheimer-zeitung.de,landwirt.com,laut.de,lauterbacher-anzeiger.de,leckerschmecker.me,leinetal24.de,lesfoodies.com,levif.be,lifeline.de,liga3-online.de,likemag.com,linux-community.de,linux-magazin.de,live.vodafone.de,ln-online.de,lokalo24.de,lustaufsleben.at,lustich.de,lvz.de,lz.de##+js(nostif, .call(null), 10)
macwelt.de,macworld.co.uk,mail.de,main-spitze.de,manager-magazin.de,manga-tube.me,mathebibel.de,mathepower.com,maz-online.de,medisite.fr,mehr-tanken.de,mein-kummerkasten.de,mein-mmo.de,mein-wahres-ich.de,meine-anzeigenzeitung.de,meinestadt.de,menshealth.de,mercato365.com,merkur.de,messen.de,metal-hammer.de,metalflirt.de,meteologix.com,minecraft-serverlist.net,mittelbayerische.de,modhoster.de,moin.de,mopo.de,morgenpost.de,motor-talk.de,motorbasar.de,motorradonline.de,motorsport-total.com,motortests.de,mountainbike-magazin.de,moviejones.de,moviepilot.de,mt.de,mtb-news.de,musiker-board.de,musikexpress.de,musikradar.de,mz-web.de##+js(nostif, .call(null), 10)
n-tv.de,naumburger-tageblatt.de,netzwelt.de,neuepresse.de,neueroeffnung.info,news.at,news.de,news38.de,newsbreak24.de,nickles.de,nicknight.de,nl.hardware.info,nn.de,nnn.de,nordbayern.de,notebookchat.com,notebookcheck-ru.com,notebookcheck-tr.com,notebookcheck.*,noz-cdn.de,noz.de,nrz.de,nw.de,nwzonline.de##+js(nostif, .call(null), 10)
oberhessische-zeitung.de,och.to,oeffentlicher-dienst.info,onlinekosten.de,onvista.de,op-marburg.de,op-online.de,outdoor-magazin.com,outdoorchannel.de##+js(nostif, .call(null), 10)
paradisi.de,pc-magazin.de,pcgames.de,pcgameshardware.de,pcwelt.de,pcworld.es,peiner-nachrichten.de,pferde.de,pietsmiet.de,pixelio.de,pkw-forum.de,playboy.de,playfront.de,pnn.de,pons.com,prad.de,prignitzer.de,profil.at,promipool.de,promobil.de,prosiebenmaxx.de,psychic.de##+js(nostif, .call(null), 10)
quoka.de##+js(nostif, .call(null), 10)
radio.at,radio.de,radio.dk,radio.es,radio.fr,radio.it,radio.net,radio.pl,radio.pt,radio.se,ran.de,readmore.de,rechtslupe.de,recording.de,rennrad-news.de,reuters.com,reviersport.de,rhein-main-presse.de,rheinische-anzeigenblaetter.de,rimondo.com,roadbike.de,roemische-zahlen.net,rollingstone.de,rot-blau.com,rp-online.de,rtl.de,rtv.de,rugby365.fr,ruhr24.de,rundschau-online.de,runnersworld.de##+js(nostif, .call(null), 10)
safelist.eu,salzgitter-zeitung.de,sat1.de,sat1gold.de,schoener-wohnen.de,schwaebische-post.de,schwarzwaelder-bote.de,serienjunkies.de,shz.de,sixx.de,skodacommunity.de,smart-wohnen.net,sn.at,sozialversicherung-kompetent.de,spiegel.de,spielen.de,spieletipps.de,spielfilm.de,sport.de,sport365.fr,sportal.de,spox.com,stern.de,stuttgarter-nachrichten.de,stuttgarter-zeitung.de,sueddeutsche.de,svz.de,szene1.at,szene38.de##+js(nostif, .call(null), 10)
t-online.de,tagesspiegel.de,taschenhirn.de,techadvisor.co.uk,techstage.de,tele5.de,testedich.*,the-voice-of-germany.de,thueringen24.de,tichyseinblick.de,tierfreund.co,tiervermittlung.de,torgranate.de,transfermarkt.*,trend.at,truckscout24.*,tv-media.at,tvdigital.de,tvinfo.de,tvspielfilm.de,tvtoday.de,tvtv.*,tz.de##+js(nostif, .call(null), 10)
unicum.de,unnuetzes.com,unsere-helden.com,unterhalt.net,usinger-anzeiger.de,usp-forum.de##+js(nostif, .call(null), 10)
videogameszone.de,vienna.at,vip.de,virtualnights.com,vox.de##+js(nostif, .call(null), 10)
wa.de,wallstreet-online.de,waz.de,weather.us,webfail.com,weihnachten.me,weihnachts-bilder.org,weihnachts-filme.com,welt.de,weltfussball.at,weristdeinfreund.de,werkzeug-news.de,werra-rundschau.de,wetterauer-zeitung.de,wetteronline.*,wieistmeineip.*,wiesbadener-kurier.de,wiesbadener-tagblatt.de,winboard.org,windows-7-forum.net,winfuture.de,wintotal.de,wlz-online.de,wn.de,wohngeld.org,wolfenbuetteler-zeitung.de,wolfsburger-nachrichten.de,woman.at,womenshealth.de,wormser-zeitung.de,woxikon.de,wp.de,wr.de##+js(nostif, .call(null), 10)
yachtrevue.at##+js(nostif, .call(null), 10)
ze.tt,zeit.de##+js(nostif, .call(null), 10)
meineorte.com,osthessen-news.de,techadvisor.com,focus.de##+js(nostif, .call(null))
kicker.de##+js(set, ov.advertising.tisoomi.loadScript, noopFunc)
! https://github.com/uBlockOrigin/uAssets/issues/22096
!#if cap_html_filtering
alpin.de,boersennews.de,chefkoch.de,chip.de,clever-tanken.de,desired.de,donnerwetter.de,fanfiktion.de,focus.de,formel1.de,frustfrei-lernen.de,gewinnspiele.tv,giga.de,gut-erklaert.de,kino.de,messen.de,nickles.de,nordbayern.de,spielfilm.de,teltarif.de,unsere-helden.com,weltfussball.at,watson.de,moviepilot.de##^script:has-text(DisplayAcceptableAdIfAdblocked)
!#else
alpin.de,boersennews.de,chefkoch.de,chip.de,clever-tanken.de,desired.de,donnerwetter.de,fanfiktion.de,focus.de,formel1.de,frustfrei-lernen.de,gewinnspiele.tv,giga.de,gut-erklaert.de,kino.de,messen.de,nickles.de,nordbayern.de,spielfilm.de,teltarif.de,unsere-helden.com,weltfussball.at,watson.de,moviepilot.de##+js(rmnt, script, DisplayAcceptableAdIfAdblocked)
!#endif
||giga.de/special/gutscheine/*.png$script,1p
||kino.de/mages/*.png$script,1p
||teltarif.de/img/$script,1p
.de/bilder/*.jpg|$script,1p
.at/bilder/*.jpg|$script,1p
.de/image/*.gif|$script,1p
teltarif.de,kino.de,desired.de,giga.de##img[referrerpolicy="unsafe-url"][src^="/img/"][src$=".jpg"]
wetter.*##+js(nostif, (null), 10)
tagesspiegel.de##+js(aopr, Notification)
newsbreak24.de##^script:has-text(===):has-text(/[\w\W]{14000}/)
t-online.de##+js(set, abp, false)
businessinsider.de##.slideshow__mobile-ad
businessinsider.de##.slideshow__middle-ad-container
businessinsider.de##.slideshow__desktop-ad:style(max-height:20px)
businessinsider.de##.bi-superbanner
businessinsider.de##.slideshow__ad
businessinsider.de##.bi-injected-ad
businessinsider.de##.adup-wrap
desired.de##.sad_banner
frustfrei-lernen.de##.noContentBannerArea
macworld.co.uk##.leaderBoardHolder
! https://www.reddit.com/r/uBlockOrigin/comments/a5g4uu/wallstreetonline_likewise_for_many_german_pages/
wallstreet-online.de##+js(nostif, userHasAdblocker)
bonedo.de##.banner
mtb-news.de##.mtbnews-forum__banner
newsbreak24.de##.aw-track-click
newsbreak24.de###adup1
transfermarkt.*##.noscript
! https://github.com/uBlockOrigin/uAssets/issues/10975
n-tv.de##+js(aopr, embedAddefend)
! To counter unnecessary exception filters
||adnxs.com^$important,domain=bz-berlin.de|metal-hammer.de|musikexpress.de|rollingstone.de|stylebook.de
||googlesyndication.com^$script,important,domain=autobild.de|metal-hammer.de|musikexpress.de|rollingstone.de
||sascdn.com^$script,important,domain=autobild.de|metal-hammer.de|musikexpress.de|rollingstone.de
||smartadserver.com^$script,important,domain=metal-hammer.de|musikexpress.de|rollingstone.de|welt.de
@@||11freunde.de/sites/all/themes/elf/gujAd/gujAd.js$domain=11freunde.de,badfilter
@@||g.doubleclick.net/gpt/pubads_impl_$script,domain=11freunde.de|auto-motor-und-sport.de|brigitte.de|gala.de|geo.de|hardwareluxx.de|hbf-info.de|kochbar.de|n-tv.de|notebooksbilliger.de|rakuten.at|rakuten.de|rtl.de|stern.de|welt.de|zalando.de,badfilter
abendzeitung-muenchen.de##.wtc-wg-plugilo-connector
boerse-online.de##.center_top_bar
wetter.de##.outbrain-ad-slot
||iframe.chefkoch.de/amp/online-food-trade/rewe/$frame
mathebibel.de###banner-bottom
/\.de\/[a-z]{10,18}\.js$/$script,1p,strict1p,match-case,domain=www.capital.de|www.essen-und-trinken.de|www.geo.de|www.eltern.de
! https://github.com/uBlockOrigin/uAssets/issues/12360 VRM anti adblock
! https://github.com/uBlockOrigin/uAssets/issues/6541#issuecomment-1093665401
! https://github.com/uBlockOrigin/uAssets/issues/12962
@@*$ghide,domain=allgemeine-zeitung.de|buffed.de|buerstaedter-zeitung.de|echo-online.de|gamezone.de|lampertheimer-zeitung.de|lauterbacher-anzeiger.de|main-spitze.de|oberhessische-zeitung.de|wiesbadener-kurier.de|wormser-zeitung.de
! https://github.com/uBlockOrigin/uAssets/issues/11915#issuecomment-1407167951
echo-online.de##.mainFooter__ccePosition
echo-online.de##.recommendations__cceWidget
echo-online.de##.storyElementWrapper__container:has(> [data-testid="storyElementWrapper-cceWidget-element"])
echo-online.de##.swiper-slide [data-testid="topStories-cardSlider-ad"]:upward(.swiper-slide)
echo-online.de##.teaserGrid > div:has(.nativeAd)
echo-online.de##div.frontpageOverview__child
allgemeine-zeitung.de,buerstaedter-zeitung.de,echo-online.de,lampertheimer-zeitung.de,lauterbacher-anzeiger.de,main-spitze.de,oberhessische-zeitung.de,wiesbadener-kurier.de,wormser-zeitung.de##.adSlot, .loadingBanner
berliner-zeitung.de##[class^="ad-slot"]
berliner-zeitung.de##[class^="outbrain"]
! breakage
@@||scdn.cxense.com/cx.cce.js$script,domain=allgemeine-zeitung.de|buerstaedter-zeitung.de|echo-online.de|lampertheimer-zeitung.de|lauterbacher-anzeiger.de|main-spitze.de|oberhessische-zeitung.de|wiesbadener-kurier.de|wormser-zeitung.de
@@||api.cxense.com/public/widget/data$xhr,domain=allgemeine-zeitung.de|buerstaedter-zeitung.de|echo-online.de|lampertheimer-zeitung.de|lauterbacher-anzeiger.de|main-spitze.de|oberhessische-zeitung.de|wiesbadener-kurier.de|wormser-zeitung.de

! Jun 22, 2024 https://watch.livecricketsl.xyz
watch.livecricketsl.xyz##h3

! Yavli ads
*.jpg$script,domain=allthingsvegas.com|clashdaily.com|madworldnews.com|politicalcowboy.com|reviveusa.com|sonsoflibertymedia.com|teltarif.de|themattwalshblog.com|videogamesblogger.com
! https://www.reddit.com/r/uBlockOrigin/comments/12hq3us/
*$script,3p,denyallow=aghtag.tech|agorahtag.tech|brid.tv|cloudflare.com|cloudflare.net|consensu.org|enetscores.com|etop.ro|facebook.net|fastly.net|fastlylb.net|fbcdn.net|fontawesome.com|google.com|googleapis.com|gstatic.com|hcaptcha.com|hwcdn.net|instagram.com|jquery.com|jsdelivr.net|jwpcdn.com|mrf.io|onnetwork.tv|pahtzh.tech|quantcast.com|recaptcha.net|wall-street.ro|ziareromania.ro,domain=ziare.com|cancan.ro|ciao.ro|gandul.ro|prosport.ro|descopera.ro|csid.ro|raziculacrimi.ro|go4games.ro|wall-street.ro|9am.ro
*$script,3p,denyallow=anycast.me|cloudflare.com|cloudflare.net|consensu.org|consentframework.com|facebook.net|fastly.net|fastlylb.net|fbcdn.net|google.com|googleapis.com|gstatic.com|hcaptcha.com|hwcdn.net|jquery.com|jsdelivr.net|mrf.io|priice.net|sirdata.fr|twitter.com|recaptcha.net|x.com,domain=lebigdata.fr|montjeuturf.net
*$script,3p,denyallow=cloudflare.com|cloudflare.net|consensu.org|facebook.net|fastly.net|fastlylb.net|fbcdn.net|google.com|googleapis.com|gstatic.com|hcaptcha.com|hwcdn.net|jquery.com|jsdelivr.net|jwpcdn.com|recaptcha.net|sharethis.com|tradingview.com|twitter.com|x.com,domain=beforeitsnews.com
! https://github.com/uBlockOrigin/uAssets/issues/18430
*$script,domain=amgreatness.com,3p,denyallow=spreaker.com|starfield.ai
/^https?:\/\/.*\/easylist\/[0-9]{5}/
*banner$domain=beforeitsnews.com,image
||jeengweb.com^$3p
! https://github.com/uBlockOrigin/uBlock-issues/issues/2858
dcdirtylaundry.com,ipatriot.com,newser.com,politicalcowboy.com##+js(aost, Math, onerror)
! aupetitparieur.com,allthingsvegas.com,beforeitsnews.com,concomber.com,conservativebrief.com,conservativefiringline.com,dailylol.com,funnyand.com,letocard.fr,mamieastuce.com,meilleurpronostic.fr,patriotnationpress.com,toptenz.net,vitamiiin.com,writerscafe.org,populist.press,dailytruthreport.com,livinggospeldaily.com,first-names-meanings.com,welovetrump.com,thehayride.com,thelibertydaily.com,thepoke.co.uk,thepolitistick.com,theblacksphere.net,shark-tank.com,naturalblaze.com,greatamericanrepublic.com,dailysurge.com,truthlion.com,flagandcross.com,westword.com,republicbrief.com,freedomfirstnetwork.com,phoenixnewtimes.com,clashdaily.com,madworldnews.com,reviveusa.com,sonsoflibertymedia.com,videogamesblogger.com,topminceur.fr,lovezin.fr,protrumpnews.com,thepalmierireport.com,kresy.pl,thepatriotjournal.com,gellerreport.com,wltreport.com,miaminewtimes.com,politicalsignal.com,rightwingnews.com,bigleaguepolitics.com,comicallyincorrect.com##+js(aost, Math.random, injectedScript)
telexplorer.com.ar##+js(aost, Math.random, /injectedScript.*inlineScript/)
designbump.com,thedesigninspiration.com##+js(aost, Math.random, /(?=.*onerror)(?=^(?!.*(https)))/)
! https://github.com/uBlockOrigin/uAssets/issues/19808
!#if cap_html_filtering
aupetitparieur.com,allthingsvegas.com,100percentfedup.com,beforeitsnews.com,concomber.com,conservativebrief.com,conservativefiringline.com,dailylol.com,funnyand.com,letocard.fr,mamieastuce.com,meilleurpronostic.fr,patriotnationpress.com,toptenz.net,vitamiiin.com,writerscafe.org,populist.press,dailytruthreport.com,livinggospeldaily.com,first-names-meanings.com,welovetrump.com,thehayride.com,thelibertydaily.com,thepoke.co.uk,thepolitistick.com,theblacksphere.net,shark-tank.com,naturalblaze.com,greatamericanrepublic.com,dailysurge.com,truthlion.com,flagandcross.com,westword.com,republicbrief.com,freedomfirstnetwork.com,phoenixnewtimes.com,designbump.com,clashdaily.com,madworldnews.com,reviveusa.com,sonsoflibertymedia.com,thedesigninspiration.com,videogamesblogger.com,protrumpnews.com,thepalmierireport.com,kresy.pl,thepatriotjournal.com,gellerreport.com,thegatewaypundit.com,wltreport.com,miaminewtimes.com,politicalsignal.com,rightwingnews.com,bigleaguepolitics.com,comicallyincorrect.com##^script:has-text(/==undefined.*body/)
!#else
aupetitparieur.com,allthingsvegas.com,100percentfedup.com,beforeitsnews.com,concomber.com,conservativebrief.com,conservativefiringline.com,dailylol.com,funnyand.com,letocard.fr,mamieastuce.com,meilleurpronostic.fr,patriotnationpress.com,toptenz.net,vitamiiin.com,writerscafe.org,populist.press,dailytruthreport.com,livinggospeldaily.com,first-names-meanings.com,welovetrump.com,thehayride.com,thelibertydaily.com,thepoke.co.uk,thepolitistick.com,theblacksphere.net,shark-tank.com,naturalblaze.com,greatamericanrepublic.com,dailysurge.com,truthlion.com,flagandcross.com,westword.com,republicbrief.com,freedomfirstnetwork.com,phoenixnewtimes.com,designbump.com,clashdaily.com,madworldnews.com,reviveusa.com,sonsoflibertymedia.com,thedesigninspiration.com,videogamesblogger.com,protrumpnews.com,thepalmierireport.com,kresy.pl,thepatriotjournal.com,gellerreport.com,thegatewaypundit.com,wltreport.com,miaminewtimes.com,politicalsignal.com,rightwingnews.com,bigleaguepolitics.com,comicallyincorrect.com##+js(rmnt, script, /==undefined.*body/)
!#endif

whatfinger.com##+js(set, oeo, noopFunc)
@@*$ghide,domain=themattwalshblog.com
||rddywd.com^$image,redirect-rule=1x1.gif
@@||rddywd.com/advertising.js$script
@@||thegatewaypundit.com^$image,1p
@@||wltreport.com^$image,1p
wltreport.com##.top-banner

! https://github.com/NanoMeow/QuickReports/issues/2493
newser.com##+js(aeld, load, Object)
funnyand.com##.ad-unit-desktop
conservativebrief.com###main-box-3
conservativebrief.com###main-box-5
conservativebrief.com###main-box-7
conservativebrief.com##.ai-attributes
conservativebrief.com##[id^="vuukle-ad-"]
conservativebrief.com##.ai_widget
conservativebrief.com###vuukle-powerbar
beforeitsnews.com##[src*="/banner"]
politicalcowboy.com##.dsk-box-ad-e
politicalcowboy.com##.dsk-box-ad-a
truthlion.com##.ad-banner-revcontent
westword.com##.AirBillboardInlineContentresponsive
gellerreport.com##.__hinit

! https://adblockplus.org/forum/viewtopic.php?f=2&t=43192
! Users should not have to punch holes in their blockers if it can be avoided.
*/fuckadblock-$script,redirect=fuckadblock.js-3.2.0:5
*/fuckadblock.$script,redirect=fuckadblock.js-3.2.0:5
! https://github.com/gorhill/uBlock/issues/1271
! https://forums.lanik.us/viewtopic.php?f=62&t=40409
*/blockadblock.$script,redirect=fuckadblock.js-3.2.0:5
*/blockadblock-$script,redirect=fuckadblock.js-3.2.0:5

! https://github.com/uBlockOrigin/uAssets/issues/1551
! https://github.com/uBlockOrigin/uAssets/issues/1554
*/wp-adblock-$script,redirect=fuckadblock.js-3.2.0:5

! https://github.com/gorhill/uBlock/issues/949
! https://github.com/uBlockOrigin/uAssets/issues/6541#issuecomment-1012435405
||s3.amazonaws.com/homad-global-configs.schneevonmorgen.com/hd-main.js$script,domain=autobild.de|cinema.de|computerbild.de|cdnapi.kaltura.com|focus.de|spieleaffe.de|sueddeutsche.de,redirect=hd-main.js
||svonm.com/hd-main.js$script,redirect=hd-main.js,domain=cinema.de|cdnapi.kaltura.com
tvspielfilm.de##.promo-box
tvtoday.de##+js(nosiif, fireEvent, 500)
@@||tvtoday.de^$ghide
! https://forums.lanik.us/viewtopic.php?p=129561#p129561
@@||a.bf-ad.net/makabo/ads_fol_init.js$script,domain=chip.de
! https://github.com/uBlockOrigin/uAssets/issues/6587
||chip.de/*&$script,1p
chip.de##.js_download_button:has(> a.Download-Button--Free[href*="withinstaller"][href*="lastchanged"])
! https://github.com/uBlockOrigin/uAssets/issues/7589
chip.de##+js(json-prune, enabled, force_disabled)

##[href*="/afu.php"]

! https://github.com/uBlockOrigin/uAssets/issues/2840
kisscartoon.*##+js(aeld, mousedown, clientX)
kisscartoon.*###upgrade_pop

! https://github.com/uBlockOrigin/uAssets/issues/7079
blackmod.net##.js-notices.notices--bottom_fixer.notices

! https://github.com/gorhill/uBlock/issues/1428
onrpg.com##a[href*="mmo-it.com/"]
onrpg.com##[href^="http://server.cpmstar.com/click.aspx"]
onrpg.com###onrpg-hotbox-widget

! https://github.com/gorhill/uBlock/issues/1340#issuecomment-191082824
||gamingaffiliation.com^$3p

! https://github.com/uBlockOrigin/uAssets/issues/5156
||adnxs.com/*/sport1.js$script,redirect=noopjs,domain=sport1.de
||acdn.adnxs.com/as/1h/pages/sport1_mediathek.js$script,redirect=noopjs,domain=sport1.de
||asadcdn.com/adlib/*$script,redirect=noopjs,domain=sport1.de
@@||tag.aticdn.net^$script,domain=sport1.de
@@||asadcdn.com/adlib/pages/sport1.js$script,domain=sport1.de
sport1.de##+js(aeld, load, hard_block)
sport1.de##.s1-ad
sport1.de##strong:has-text(/anzeige/i)

! https://adblockplus.org/forum/viewtopic.php?f=10&t=44887
vaughn.live##+js(nosiif, header_menu_abvs, 10000)
vaughn.live##.vs_v9_stream_content_abvs
vaughn.live##.vs_v9_header_menu_abvs
vaughn.live##div[id$="-ad"][id^="vs_v9_"]

! https://github.com/uBlockOrigin/uAssets/issues/35
||g9g.eu^*fa.js$script,redirect=fuckadblock.js-3.2.0
||8s8.eu^*fa.js$script,redirect=fuckadblock.js-3.2.0
||sprzedaz2.oczarjk.pl/img/ads/banner.gif$image,redirect-rule=1x1.gif,domain=im9.eu
g9g.eu##+js(aopr, adBlockDetected)

! Computers seizing thanks to these moronic scripts leading to system-wide out
! of memory condition
! https://github.com/gorhill/uBlock/issues/1449
||twnmm.com/js/*/adobe_audience_manager$script,redirect=noopjs
! https://forums.informaction.com/viewtopic.php?f=10&t=21675
! https://github.com/uBlockOrigin/uAssets/issues/6221
||twnmm.com/js/*/dfpad/*$script,redirect=noopjs

! https://github.com/uBlockOrigin/uAssets/issues/362
! https://github.com/uBlockOrigin/uAssets/issues/15820
allmusic.com##+js(no-fetch-if, adsbygoogle)
allmusic.com##.advertising

! https://github.com/NanoMeow/QuickReports/issues/144
redtube.*###paid_tabs_list
! https://github.com/uBlockOrigin/uAssets/issues/7164
pornhub.*##div[id^="customSkin"]
pornhub.*##div.container:style(margin-top: 0px !important)
! https://github.com/uBlockOrigin/uAssets/issues/356
! https://forums.lanik.us/viewtopic.php?p=120148#p120148
youjizz.com##+js(noeval)
youjizz.com###desktopFooterPr
youjizz.com##.top_pr

! https://forums.lanik.us/viewtopic.php?f=62&t=31285&start=30
||indiatimes.com/detector$script
||static.clmbtech.com^$script,important,domain=indiatimes.com
||chartbeat.com/js/chartbeat.js$script,important,domain=indiatimes.com
||tags.crwdcntrl.net^$script,important,domain=indiatimes.com
! https://github.com/uBlockOrigin/uAssets/issues/149
economictimes.indiatimes.com##.active > ul > li:has-text(Ad:)
indiatimes.com##[onclick] .btxt:has-text(/Ad/):xpath(../../..)
indiatimes.com#@#a[onclick*="/click.htm?"]
indiatimes.com##[onclick] p:has-text(/Ad/):xpath(../../..)
indiatimes.com,samayam.com##[onclick] p:matches-css-before(content:/Ad /):xpath(../..):not(p:has-text(/MAHA/i)):not(p:has-text(/Times/i))
samayam.com##:xpath(//span[(text()='Ad')]/../../..)
m.economictimes.com##H2:has-text(/Promoted/) + DIV
m.economictimes.com##h2:has-text(/Promoted/)
||m.economictimes.com/mpetat/commons/images/rbc-red.png$image
economictimes.indiatimes.com##div h2:has(span:matches-css-before(content: /Sponsored/))
economictimes.indiatimes.com##div h2:has(span:matches-css-before(content: /Sponsored/)) + div
indiatimes.com##h2:has-text(/Promoted/) + div
indiatimes.com##h2:has-text(/Promoted/)
indiatimes.com##.wzrk-overlay
||media.indiatimes.in/idthat/commons/images/rbc-gray.png$image
indiatimes.com##[onclick] h5:has-text(/Ad/):xpath(../../..)
m.timesofindia.com##.brand_ctn:has-text(/Ad:/):xpath(../..)
m.timesofindia.com##span:has-text(/Ad:/):xpath(../..)
m.timesofindia.com##p:has-text(/Ad:/):xpath(../../..)
indiatimes.com##p:matches-css(background-image: /colombia-icon/):xpath(../..)
indiatimes.com##div:matches-css(background-image: /colombia_/):xpath(../..)
m.timesofindia.com##.asAffiliate
seithy.com##.slick-track
indiatimes.com##.PPD_ADS_JS
timesofindia.indiatimes.com##+js(set, nsShowMaxCount, 0)
||assets.toiimg.com/affiliates/sdk/v2.js$script,domain=indiatimes.com|timesofindia.com
||assets.toiimg.com/affiliates/sdk/v1.js$script,domain=indiatimes.com|timesofindia.com
timesofindia.indiatimes.com##.nonAppView > .mPws3
timesofindia.indiatimes.com##div[class*="personaliseWidgetLoader"]
! https://github.com/uBlockOrigin/uAssets/issues/22603
timesofindia.indiatimes.com##.sidebar_ad_fix .imageBanner

! punemirror .com banner ads
||punemirror.com/api/v1$xhr,1p

! https://github.com/uBlockOrigin/uAssets/issues/4056
||malayalam.samayam.com/*/amazon_widget.cms?type=amazondeal$frame
! interstitial page
economictimes.indiatimes.com##+js(set, objVc.interstitial_web,'')
! https://github.com/uBlockOrigin/uAssets/issues/19766
economictimes.indiatimes.com##+js(nosiif, adb)

! https://github.com/uBlockOrigin/uAssets/issues/168#issuecomment-726134068
maharashtratimes.com##.ad1
maharashtratimes.com##.colombia
##[href^="https://trk.clmbtrck.in/click"]
*/pwafeeds/amazon_$frame
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=indiatimes.com|iamgujarat.com|vijaykarnataka.com|tamil.samayam.com|telugu.samayam.com|malayalam.samayam.com,redirect-rule=google-ima.js
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect-rule=google-ima.js,domain=m.economictimes.com
||dealspakki.com^$frame,domain=eisamay.com|iamgujarat.com|indiatimes.com|maharashtratimes.com|samayam.com|vijaykarnataka.com
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect=google-ima.js,domain=maharashtratimes.com,important
! ads placeholders
eisamay.com,indiatimes.com,samayam.com,vijaykarnataka.com##.wdt-taboola
eisamay.com,indiatimes.com,samayam.com,vijaykarnataka.com##.pwa-deals.wdt_amz
eisamay.com,indiatimes.com,samayam.com,vijaykarnataka.com##div[class="news-card col4"]
eisamay.com,indiatimes.com,samayam.com,vijaykarnataka.com##.advertorialwrapper
eisamay.com,indiatimes.com,samayam.com,vijaykarnataka.com##.atf-wrapper
eisamay.com,indiatimes.com,samayam.com,vijaykarnataka.com##.top-atf-enabled-wrapper
indiatimes.com##.article_first_ad
health.economictimes.indiatimes.com##.layer-overlay
health.economictimes.indiatimes.com##.article-detail-ad-slot
! https://github.com/AdguardTeam/AdguardFilters/issues/180466
educationtimes.com##div[class]:has(> div[class] > div[id^="div-gpt-ad"])

! https://github.com/uBlockOrigin/uAssets/issues/88
! https://github.com/uBlockOrigin/uAssets/issues/211
! https://github.com/uBlockOrigin/uAssets/issues/223
! https://github.com/uBlockOrigin/uAssets/issues/622
! https://github.com/uBlockOrigin/uAssets/issues/753
! https://github.com/uBlockOrigin/uAssets/issues/1404
||svonm.com/hd-main.js$script,redirect=hd-main.js,domain=kicker.de|myspass.de|spielaffe.de|tele5.de

! https://github.com/uBlockOrigin/uAssets/issues/70
! https://github.com/uBlockOrigin/uAssets/issues/16999
aranzulla.it##+js(aopr, navigator.userAgent)
*$script,domain=aranzulla.it,redirect-rule=noopjs
aranzulla.it##.banner:remove()
aranzulla.it##[id^="ad"]:remove()

! https://github.com/uBlockOrigin/uAssets/issues/66
||paywall.folha.uol.com.br/wall.jsonp?callback=paywall.inicio$domain=blogfolha.uol.com.br|educacao.uol.com.br|folha.uol.com.br
! https://github.com/uBlockOrigin/uAssets/issues/124
||jsuol.com.br/*/detectadblock/$script,important,domain=uol.com.br
! https://github.com/uBlockOrigin/uAssets/issues/765
www.uol##.content-lightbox
www.uol##.overlay-lightbox
uol.com.br##.bg-banner
uol.com.br##[id^="banner-300x250"]:remove()

! https://github.com/gorhill/uBlock/issues/1879
||popads.net/pop.js$script,redirect=popads.net.js

! https://forums.lanik.us/viewtopic.php?f=62&t=31357&p=100144
@@||indiatoday.intoday.in/video/$ghide

! https://github.com/reek/anti-adblock-killer/issues/1698
! https://github.com/uBlockOrigin/uAssets/issues/102
businesstoday.in###zedoads1:style(height: 1px !important)
businesstoday.in###zedoads2:style(height: 1px !important)
businesstoday.in###zedotopnavads:style(height: 1px !important)
businesstoday.in###zedotopnavads1:style(height: 1px !important)
businesstoday.in###adbocker_alt
! https://github.com/uBlockOrigin/uAssets/issues/102#issuecomment-241239514
businesstoday.in##.adblocker-container
businesstoday.in###story-maincontent:style(display: block !important)

! https://adblockplus.org/forum/viewtopic.php?f=10&t=46010
! https://github.com/uBlockOrigin/uAssets/issues/102
indiatoday.in,indiatoday.intoday.in##.ad_bn.row
indiatoday.in,intoday.in###adbocker_alt
indiatoday.in,intoday.in###zedoads1:style(height: 1px !important)
indiatoday.in,intoday.in###zedoads2:style(height: 1px !important)
indiatoday.in,intoday.in##.adblockcontainer:style(display: block !important)
! https://github.com/uBlockOrigin/uAssets/issues/102#issuecomment-239625264
||zedo.com^$script,important,domain=indiatoday.in|intoday.in
||googlesyndication.com^$script,important,domain=indiatoday.in|intoday.in

! https://forums.lanik.us/viewtopic.php?f=62&t=32109
ndtv.com###ndtv-message-users
ndtv.com###ins_videodetail:style(display: block !important;)

! https://github.com/uBlockOrigin/uAssets/issues/98
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion###stream_pagelet div[id^="hyperfeed_story_id_"]:has(a.uiStreamSponsoredLink)
! "People You May Know": EasyList tries to block these, might as well block them fully
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion###stream_pagelet div[id^="hyperfeed_story_id_"]:if(h6:has-text(People You May Know))
touch.facebook.com,mtouch.facebook.com,x.facebook.com,iphone.facebook.com,m.beta.facebook.com,touch.beta.facebook.com,mtouch.beta.facebook.com,x.beta.facebook.com,iphone.beta.facebook.com,m.facebook.com,b-m.facebook.com,mobile.facebook.com,touch.facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion,mtouch.facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion,x.facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion,iphone.facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion,touch.beta.facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion,m.facebook.com,m.facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion,b-m.facebook.com,b-m.facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion,mobile.facebook.com,mobile.facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##article:has(footer > div > div > a[href^="/friends/center/?fb_ref="])
! https://www.reddit.com/r/uBlockOrigin/comments/58o3k6/facebook_ads_solution/
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##.ego_section:has(a.adsCategoryTitleLink)
! https://github.com/uBlockOrigin/uAssets/issues/507
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion###stream_pagelet [id^="hyperfeed_story_id_"]:has(span._4dcu)
! https://github.com/uBlockOrigin/uAssets/issues/722
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##.ego_column:if(a[href^="/campaign/landing"])
! https://forums.lanik.us/viewtopic.php?p=128997#p128997
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##.ego_section:if(a[href^="/ad_campaign"])
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##.userContentWrapper:has(a[href*="/ads/"]):not(:has(a[href*="/ads/preferences"]))
! https://github.com/uBlockOrigin/uAssets/issues/3367
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion#@#div[id^="hyperfeed_story_id_"]:has(a[href*="utm_campaign"])
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##.userContentWrapper>div div>span>span:has-text(/^Suggested Post$/)
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##div[id^="hyperfeed_story_id_"]:has(div > span:has(abbr .timestampContent):matches-css(display: none))
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##.ego_section:has(a[href*="campaign_id"])
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##div[id^=hyperfeed_story_id_]:has(span[data-ft="{\"tn\":\"j\"}"])
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion#?#.pagelet-group .pagelet:has(a:has-text(/Sponsored|Create ad|Crear un anuncio|Publicidad/))
! https://github.com/uBlockOrigin/uAssets/issues/3367#issuecomment-1367973454
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##div[role="complementary"] div:not([class]):not([id]) > span:not([class]):not([id]):not([aria-labelledby])
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##div[role="region"] + div[role="main"] div[role="article"] div[style="border-radius: max(0px, min(8px, ((100vw - 4px) - 100%) * 9999)) / 8px;"] > div[class]:not([class*=" "])
! https://github.com/uBlockOrigin/uAssets/issues/3367#issuecomment-1416733062
! !#if env_chromium
! facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##html[lang="en"] div[aria-posinset] svg[style$="width: 56.8906px;"] use:upward(div[aria-posinset])
! facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##html[lang="pl"] div[aria-posinset] svg[style$="width: 78.5465px;"] use:upward(div[aria-posinset])
! facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##html[lang="vi"] div[aria-posinset] svg[style$="width: 65.0684px;"] use:upward(div[aria-posinset])
! !#endif
! !#if env_firefox
! facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##html[lang="en"] div[aria-posinset] svg[style$="width: 59px;"] use:upward(div[aria-posinset])
! facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##html[lang="pl"] div[aria-posinset] svg[style$="width: 80.8px;"] use:upward(div[aria-posinset])
! facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##html[lang="vi"] div[aria-posinset] svg[style$="width: 65px;"] use:upward(div[aria-posinset])
! !#endif
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##div[aria-posinset]:has(a[aria-label="広告"]):style(height: 0 !important; overflow: hidden !important;)
! https://github.com/uBlockOrigin/uAssets/issues/3367#issuecomment-2094725581
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##:matches-path(/^\/(\?[a-z]+=\w+)?$/) div[aria-posinset] :is(h3, h4) span > a[href]:not([href^="/groups/"]):not([href*="section_header_type"]):matches-attr(href="/__cft__\[0\]=[-\w]{290,}/"):upward(div[aria-posinset]):style(height: 0 !important; overflow: hidden !important;)
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##div[aria-describedby]:not([aria-posinset]) :is(h3, h4) span > a[href]:not([href^="/groups/"]):not([href*="section_header_type"]):matches-attr(href="/__cft__\[0\]=[-\w]{290,}/"):upward(div[aria-describedby]):style(height: 0 !important; overflow: hidden !important;)
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion###watch_feed div:not([class]) > div:not([class]) div[class] span[class] > a span[aria-labelledby]:has(> span[style="display: flex;"] > span[class]:has-text(/^S$/)):has(> span[style="display: flex;"] > span[class]:has-text(/^p$/)):has(> span[style="display: flex;"] > span[class]:has-text(/^d$/)):upward(div:not([class]) > div:not([class])):style(height: 0 !important; overflow: hidden !important;)
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion###watch_feed div:not([class]) > div:not([class]) div[class] span[class] > a[aria-label="広告"]:upward(div:not([class]) > div:not([class])):style(height: 0 !important; overflow: hidden !important;)
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion###watch_feed div:not([class]) > div:not([class]) div[class] [class] > a[href*="utm_source=facebook"] span[class] > span[class][style*="-webkit-line-clamp"]:has-text(広告):upward(div:not([class]) > div:not([class])):style(height: 0 !important; overflow: hidden !important;)
! https://github.com/uBlockOrigin/uAssets/issues/3367#issuecomment-2094875891
facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##:matches-path(/search/) div[role="article"] span > a[href]:not([href^="/groups/"]):not([href*="section_header_type"]):matches-attr(href="/__cft__\[0\]=[-\w]{265,}/"):upward([role="article"]):style(height: 0 !important; overflow: hidden !important;)
! https://github.com/uBlockOrigin/uAssets/issues/3367#issuecomment-1993620105
! https://github.com/uBlockOrigin/uAssets/issues/3367#issuecomment-1999029976
! https://www.reddit.com/r/uBlockOrigin/comments/1bjfs9x/facebook_loading_slow/kvraphx/
! https://github.com/uBlockOrigin/uAssets/issues/3367#issuecomment-2048528598
! https://github.com/uBlockOrigin/uAssets/issues/3367#issuecomment-2054573634
!#if env_chromium
www.facebook.com##+js(json-prune, require.0.3.0.__bbox.require.[].3.1.__bbox.result.data.node, require.0.3.0.__bbox.require.[].3.1.__bbox.result.data.node.sponsored_data.ad_id)
!#else
www.facebook.com##+js(json-prune, require.0.3.0.__bbox.require.[].3.[-].__bbox.result.data.node.sponsored_data.ad_id)
!#endif
! https://github.com/uBlockOrigin/uAssets/issues/3367#issuecomment-2095001151
www.facebook.com##+js(json-prune, require.0.3.0.__bbox.require.[].3.1.__bbox.result.data.serpResponse.results.edges.[-].relay_rendering_strategy.view_model.story.sponsored_data.ad_id)
! https://www.facebook.com/marketplace/
! https://www.facebook.com/watch/
!#if cap_html_filtering
||www.facebook.com/api/graphql/$xhr,replace=/\{"brs_content_label":[^,]+,"(?:category|feed_story_category)":"SPONSORED"[^\n]+"cursor":"[^"]+"\}/{}/g
||www.facebook.com/api/graphql/$xhr,replace=/\{"node":\{"role":"SEARCH_ADS"[^\n]+?cursor":[^}]+\}/{}/g
||www.facebook.com/api/graphql/$xhr,replace=/\{"node":\{"__typename":"MarketplaceFeedAdStory"[^\n]+?"cursor":(?:null|"\{[^\n]+?\}"|[^\n]+?MarketplaceSearchFeedStoriesEdge")\}/{}/g
||www.facebook.com/api/graphql/$xhr,replace=/\{"node":\{"__typename":"VideoHomeFeedUnitSectionComponent"[^\n]+?"sponsored_data":\{"ad_id"[^\n]+?"cursor":null\}/{}/
!#else
www.facebook.com##+js(trusted-replace-xhr-response, '/\{"brs_content_label":[^,]+,"(?:category|feed_story_category)":"SPONSORED"[^\n]+"cursor":"[^}]+\}/g', {}, /api/graphql)
www.facebook.com##+js(trusted-replace-xhr-response, /\{"node":\{"role":"SEARCH_ADS"[^\n]+?cursor":[^}]+\}/g, {}, /api/graphql)
www.facebook.com##+js(trusted-replace-xhr-response, /\{"node":\{"__typename":"MarketplaceFeedAdStory"[^\n]+?"cursor":(?:null|"\{[^\n]+?\}"|[^\n]+?MarketplaceSearchFeedStoriesEdge")\}/g, {}, /api/graphql)
www.facebook.com##+js(trusted-replace-xhr-response, /\{"node":\{"__typename":"VideoHomeFeedUnitSectionComponent"[^\n]+?"sponsored_data":\{"ad_id"[^\n]+?"cursor":null\}/, {}, /api/graphql)
!#endif
www.facebook.com##+js(json-prune, require.0.3.0.__bbox.require.[].3.1.__bbox.result.data.node, require.0.3.0.__bbox.require.[].3.1.__bbox.result.data.node.story.sponsored_data.ad_id)
! https://www.facebook.com/marketplace/category/home/
www.facebook.com##+js(json-prune, require.0.3.0.__bbox.require.[].3.1.__bbox.result.data.marketplace_search.feed_units.edges.[-].node.story.sponsored_data.ad_id)
! https://www.facebook.com/marketplace/category/vehicles
www.facebook.com##+js(json-prune, require.0.3.0.__bbox.require.[].3.1.__bbox.result.data.viewer.marketplace_feed_stories.edges.[-].node.story.sponsored_data.ad_id)
www.facebook.com###seo_pivots ~ div > div[style^="max-width"] > div[class] > div[style^="max-width"]:has(a[href^="/ads/about/?"])

!facebook.com,facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion##div[role="feed"] > div[class]:has([data-ad-preview])

! mail.yahoo.com stuff
mail.yahoo.com##[data-test-id="right-rail-ad"]
! https://github.com/uBlockOrigin/uAssets/issues/13439
mail.yahoo.com##[data-test-id="video-container"]
! https://github.com/uBlockOrigin/uAssets/issues/19333
mail.yahoo.com##[aria-labelledby^="bottom-sticky-pencil-ad-brand-name"]
! https://www.reddit.com/r/uBlockOrigin/comments/1atftuq/help_on_sportsyahoocom_ads/
sports.yahoo.com##div[id^="mrt-node-"][id$="-Ad"]

! https://forums.lanik.us/viewtopic.php?f=62&t=31322&start=30
ndtv.com###ndtv-myModal
ndtv.com##body:style(overflow: auto !important)

! https://github.com/uBlockOrigin/uAssets/issues/3573
*$3p,denyallow=cloudflare.com|googleapis.com|gstatic.com|support.send.cm|userscloud.net,domain=userscloud.com
@@||userscloud.com^$ghide
userscloud.com##+js(aeld, /contextmenu|keydown/)
userscloud.com##+js(set, console.clear, trueFunc)
||userscloud.com/js/de.min.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/108
wetteronline.*##+js(aopr, __eiPb)
wetteronline.*##^script:has-text(runCount)
wetteronline.*###topcontainer
wetteronline.de###woRect
wetteronline.de###woCsiAdContent

! https://github.com/uBlockOrigin/uAssets/issues/104
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=m.timesofindia.com,redirect-rule=google-ima.js
! https://github.com/uBlockOrigin/uAssets/issues/176
! https://github.com/NanoAdblocker/NanoFilters/issues/57
@@||m.photos.timesofindia.com^$ghide
||static.toiimg.com/ad-banner*/photo/*$image,redirect=2x2.png,domain=m.timesofindia.com
m.timesofindia.com##.adsinview
timesofindia.com##+js(aopr, detector)
timesofindia.indiatimes.com##+js(aeld, , adb)
m.timesofindia.com,timesofindia.indiatimes.com##+js(nostif, adb)
! https://github.com/NanoMeow/QuickReports/issues/1905
||indiatimes.com^$image,redirect-rule=1x1.gif

! https://github.com/uBlockOrigin/uAssets/issues/104
m.aajtak.in##body > #adbocker_alt.adblocker-page
m.aajtak.in##body > .secArticleTitle:style(display: block !important)
m.aajtak.in##body > .pubTime:style(display: block !important)
m.aajtak.in##body > .secArticleImage:style(display: block !important)
m.aajtak.in##body > .storyBody:style(display: block !important)
/amazon_products_prod.js$script,domain=aajtak.in

! https://github.com/uBlockOrigin/uAssets/issues/4705
finanzen.*##+js(nosiif, nrWrapper)
finanzen.*##+js(nostif, nrWrapper)
finanzen.*###adup1
finanzen.*###bs_abstand
finanzen.*##[id^="sas_"]:style(height: 1px !important)
||images.finanzen.net/*banner$image
finanzen.net##.pull-right.img-responsive
finanzen.net##:xpath('//*[contains(text(),"Werbung")]') + [class]

! https://github.com/uBlockOrigin/uAssets/issues/127
gadgets.ndtv.com##.adblockerContent:style(display: initial !important;)
gadgets.ndtv.com###ndtv-message-userss

! https://forums.lanik.us/viewtopic.php?p=102620#p102620
amazon.*###s-results-list-atf > .s-result-item:has(> .s-item-container h5.s-sponsored-list-header)
! https://github.com/uBlockOrigin/uAssets/issues/1278
amazon.*###s-results-list-atf > .s-result-item:has(.s-item-container h5.s-sponsored-header)
! https://github.com/uBlockOrigin/uAssets/issues/399
amazon.*##.s-result-item:has(> .s-item-container > h5 .s-sponsored-info-icon)
! https://github.com/AdguardTeam/AdguardFilters/issues/83145
amazon.*##.s-widget:has(> [data-cel-widget^="MAIN"] > [data-cel-widget^="tetris"] > div[id^="CardInstance"][class^="_tetris-"])
! https://jbbs.shitaraba.net/bbs/read.cgi/internet/25463/1618326670/80 blank slide on top page
amazon.*##.a-carousel-card:has(> div > div[cel_widget_id^="adplacements:"]):remove()
! https://github.com/uBlockOrigin/uAssets/issues/12268
amazon.*##.AdHolder
! https://jbbs.shitaraba.net/bbs/read.cgi/internet/25463/1598352715/851
amazon.*###similarities_feature_div:has(span[id^="ad-feedback-text"])
! https://github.com/easylist/easylist/commit/73701244b11d5d916bef99627dbfb409e7e14e44
amazon.*##div[cel_widget_id="sims-consolidated-5_csm_instrumentation_wrapper"]

! https://github.com/uBlockOrigin/uAssets/issues/1347
motherless.com##+js(set, _ml_ads_ns, null)
motherless.com##+js(acs, jQuery, cookie)

! https://forums.lanik.us/viewtopic.php?f=62&t=32878
freethesaurus.com,thefreedictionary.com##div:has(> a:not([href*="/"]) > img:not([src*="/"]))
freethesaurus.com,thefreedictionary.com##+js(nostif, warn)
! https://github.com/uBlockOrigin/uAssets/issues/1896
freethesaurus.com,thefreedictionary.com##+js(aopr, adc)
freethesaurus.com,thefreedictionary.com##div[class][id]:not(.logo):if-not(*):has-text(/^$/)
freethesaurus.com,thefreedictionary.com###sidebar > .widget:not([id]):has(> .holder > a[href])
! To counter exception filters
||googlesyndication.com^$script,important,domain=thefreedictionary.com

! https://news.ycombinator.com/item?id=12677179
||x.shopsavvy.com^$3p

! https://github.com/uBlockOrigin/uAssets/issues/161
||uim.tifbs.net/js/*.js$script,redirect=noopjs,domain=gmx.*|web.de
! https://github.com/uBlockOrigin/uAssets/issues/6834
web.de##.main [data-ac]:empty
gmx.*##.main [data-ac]:empty
! https://github.com/uBlockOrigin/uAssets/issues/9083
web.de##.iba-acceptable:has-text(/Anzeige|Info/)
! https://github.com/uBlockOrigin/uAssets/issues/15422
*$image,redirect-rule=1x1.gif,domain=web.de
@@*$ghide,domain=web.de|gmx.*
web.de#@#.ad
web.de##.ad:style(position:absolute !important; left:-10000px !important; display:block !important; pointer-events: none !important;)
! https://github.com/uBlockOrigin/uAssets/issues/22834
||web.de/*/nonfriendlyiframe.html$frame,1p
web.de##+js(rmnt, script, '"Anzeige"')
web.de##div[data-service-slot-initialized]

! https://github.com/uBlockOrigin/uAssets/issues/8047
! https://github.com/uBlockOrigin/uAssets/issues/5532
! https://github.com/uBlockOrigin/uAssets/issues/5575
! https://github.com/uBlockOrigin/uBlock-issues/issues/630
! https://github.com/uBlockOrigin/uAssets/issues/6002
golem.de##+js(acs, showAds)
golem.de##+js(nostif, adBlockerDetected)
golem.de##+js(nostif, show)
||video.golem.de/*/scripts/radiant/homad$xhr,redirect=nooptext,domain=golem.de
golem.de##[href^="https://ads.golem.de/"]
golem.de##.sp-article:has(span:matches-css-before(content:/Anzeige/i))
golem.de##.list-articles>li:has(.icon-addy:matches-css-before(content: "Anzeige"))
golem.de##[data-article-id]:has([class]:matches-css-before(content:/ANZEIGE/))

! https://github.com/uBlockOrigin/uAssets/issues/7753
@@||bild.de^$ghide
bild.de#@##fullBanner
bild.de#@##powerplace
bild.de#@##subchannelBanner1_1
bild.de#@##subchannelBanner2_2
bild.de#@#.cbErotikContentbar15
bild.de#@#.contentbar
bild.de#@#.eyecatcher
bild.de#@#.footerbar
bild.de#@#.jetzt_aufnehmen
bild.de#@#.servicelinks
bild.de#@#.tea-rectangle
bild.de#@#.txe
bild.de#@#.yield
bild.de#@#.rectangle
bild.de#@#.fullbanner
bild.de#@#.ads
bild.de##div:matches-css-before(content:/Anzeige/i)
bild.de##.ad-wrapper
bild.de##aside[data-type="ad"]
! https://github.com/uBlockOrigin/uAssets/issues/8257
! https://www.reddit.com/r/uBlockOrigin/comments/jxrzda/
||tagger.opecloud.com^$xhr,redirect=noop.txt,domain=bild.de
bild.de##+js(aopr, SmartAdServerASMI)
bild.de##+js(rpnt, script, "adBlockWallEnabled":true, "adBlockWallEnabled":false)
sport.bild.de#@#.ad-wrapper
! https://github.com/uBlockOrigin/uAssets/issues/8360
spiele.bild.de##+js(nano-stb, , 10000)
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,xhr,domain=spiele.bild.de
spiele.bild.de##div[id^="ad-landingpage-"]
spiele.bild.de##div[id^="ad-gamepage-"]
spiele.bild.de##.ad-vertical-box
||servedby.adbility-media.com^$3p
||partners2.das-onlinespiel.de^$3p
! https://github.com/uBlockOrigin/uAssets/issues/9615
bild.de##.main-nav .utilities > li:style(margin-left:-0.5px !important)

! https://github.com/uBlockOrigin/uAssets/issues/174
! https://github.com/uBlockOrigin/uAssets/issues/4106
sueddeutsche.de##+js(aopr, _sp_._networkListenerData)
sueddeutsche.de##+js(aopw, SZAdBlockDetection)
sueddeutsche.de##+js(set, _sp_.config, undefined)

! https://github.com/uBlockOrigin/uAssets/issues/238
8muses.com##.a-image
8muses.com###content > div > .gallery > a.t-hover.c-tile:has(iframe[src^="/banner/"])
8muses.com##[href^="https://bit.ly/"]

! Popups triggered by webrtc
123movies.net,2ddl.*,allitebooks.*,bonstreams.net,convertinmp4.com,crictime.com,ddlvalley.me,dramamate.*,eztv.*,fluvore.com,kiss-anime.*,letmewatchthis.*,mac-torrents.com,mkvcage.*,nflstream.io,oceanoffgames.com,pastehere.xyz,sawlive.tv,skidrowcrack.com,toros.co,uptobox.com,yts.*,zooqle.*##+js(nowebrtc)

! https://github.com/uBlockOrigin/uAssets/issues/245
gamer.com.tw##img[onload="AntiAd.check(this)"]
gamer.com.tw##+js(aopr, AntiAd.check)

! https://github.com/uBlockOrigin/uAssets/issues/244
skidrowreloaded.com##+js(acs, open)
skidrowreloaded.com##+js(no-fetch-if, /^/)

! skidrowcodexgames.com ads
skidrowcodexgames.com##+js(aopr, _pop)
skidrowcodexgames.com##[class^="aligncenter wp-image-"]
*$script,3p,denyallow=googleapis.com,domain=skidrowcodexgames.com

! Sourcepoint
! https://forums.lanik.us/viewtopic.php?f=62&t=34570
! https://github.com/uBlockOrigin/uAssets/issues/266
autobytel.com,cesoirtv.com,gamesradar.com,huffingtonpost.co.uk,huffingtonpost.com,moviefone.com,playboy.de##+js(aopw, _sp_)
faz.net##+js(acs, $, _sp_._networkListenerData)
eltern.de,essen-und-trinken.de,focus.de##+js(aopr, _sp_.mms.startMsg)
! https://github.com/jspenguin2017/uBlockProtector/issues/367
! https://github.com/uBlockOrigin/uAssets/issues/701
! https://github.com/uBlockOrigin/uAssets/issues/848
! https://forums.lanik.us/viewtopic.php?p=127088#p127088
! https://github.com/uBlockOrigin/uAssets/issues/1008
! https://github.com/NanoAdblocker/NanoFilters/issues/12
! https://github.com/uBlockOrigin/uAssets/issues/1442
! https://forums.lanik.us/viewtopic.php?f=62&t=40162
! https://github.com/uBlockOrigin/uAssets/issues/461
! https://github.com/uBlockOrigin/uAssets/issues/4076
! https://github.com/uBlockOrigin/uAssets/issues/5864
20min.ch,al.com,alphr.com,autoexpress.co.uk,bikeradar.com,blick.ch,chefkoch.de,cyclingnews.com,digitalspy.com,democratandchronicle.com,denofgeek.com,esgentside.com,evo.co.uk,exclusivomen.com,ft.com,gala.de,gala.fr,heatworld.com,itpro.co.uk,livingathome.de,masslive.com,maxisciences.com,metabomb.net,mlive.com,motherandbaby.co.uk,motorcyclenews.com,muthead.com,neonmag.fr,newyorkupstate.com,ngin-mobility.com,nj.com,nola.com,ohmirevista.com,ohmymag.*,oregonlive.com,pennlive.com,programme.tv,programme-tv.net,radiotimes.com,silive.com,simplyvoyage.com,stern.de,syracuse.com,theweek.co.uk,ydr.com##+js(aopr, _sp_._networkListenerData)
! https://github.com/uBlockOrigin/uAssets/issues/271
! https://forums.lanik.us/viewtopic.php?p=112285#p112285
car.com,codeproject.com,familyhandyman.com,goldderby.com,headlinepolitics.com,html.net,indiewire.com,marmiton.org,mymotherlode.com,nypost.com,realgm.com,tvline.com,wwd.com##+js(aopw, _sp_)
codeproject.com##+js(aopr, retrievalService)
! https://github.com/NanoMeow/QuickReports/issues/928
usatoday.com##+js(aopr, _sp_._networkListenerData)
usatoday.com##[aria-label="advertisement"]
usatoday.com##[data-gl-method="initTaboola"]
usatoday.com##.gnt_n:style(top: 0 !important; margin-top: 0 !important;)
familyhandyman.com##.ad
familyhandyman.com##.advertisement
familyhandyman.com##.cm-ad-unit-section

! https://github.com/uBlockOrigin/uAssets/issues/273
cwseed.com##+js(aopr, admrlWpJsonP)

! https://github.com/uBlockOrigin/uAssets/issues/278
pocketnow.com##+js(aopr, InstallTrigger)

! https://github.com/el1t/uBlock-Safari/issues/24
! https://github.com/uBlockOrigin/uAssets/commit/495baa68abad94e80bb3e21dbfbe6636f08cb10a#comments
! https://forums.lanik.us/viewtopic.php?p=145520#p145520
! https://github.com/NanoMeow/QuickReports/issues/3028
||adition.com^$important,domain=spiegel.de
@@||ad.yieldlab.net^$script,domain=spiegel.de,badfilter
||cdn.prod.www.spiegel.de/public/spon/generated/web/js/header*.js$script,1p
spiele.spiegel.de###ad-gamepage-top
spiele.spiegel.de##.ad
spiele.spiegel.de##div#ad-gamepage-bottom
spiegel.de##[data-area="affiliatebox"]
spiegel.de##[data-area="vouchers"]

! https://github.com/uBlockOrigin/uAssets/issues/289
! https://github.com/uBlockOrigin/uAssets/issues/2114
! https://github.com/uBlockOrigin/uAssets/issues/2262
! https://github.com/uBlockOrigin/uAssets/issues/2404
! https://github.com/uBlockOrigin/uAssets/issues/3640
quora.com##.PromptsList
quora.com##.AdBundle
quora.com##.AdStory
!#if env_mobile
quora.com##.top_slot
!#endif
quora.com##div[id$="_content_box"]
quora.com##.lower_slot
quora.com##[disable_auto_login*="True"]
quora.com##:xpath(//div[not(@class="ui_qtext_para") and contains(text(), 'ad by')]/parent::div/parent::div/parent::div[@id])
quora.com##:xpath(//div[not(@class="ui_qtext_para") and contains(text(), 'promoted') and contains(text(), 'by')]/parent::a/parent::div/parent::div/parent::div[@id])
quora.com##:xpath(//div[not(@class="ui_qtext_para") and contains(text(), 'Quora') and contains(text(), 'by') and contains(text(), 'Business')]/parent::a/parent::div/parent::div/parent::div[@id])
quora.com##.FeedStory.feed_item > div > div:has-text(/by Quora for Business/i)
quora.com##.Toggle.SimpleToggle.ToggleAnswerFooterWrapper > div:has-text(/Promoted/i)
quora.com##:xpath(//span[contains(text(), 'by')]/ancestor::*[contains(concat(' ', @class, ' '), ' external_link ')]/../../..)
quora.com##:xpath(//p[(text()='d')]/../../../../..)
! from abp cv list for https://github.com/uBlockOrigin/uAssets/issues/8032
quora.com##.u-margin-top--lg+div[class="UnifiedAnswerPagedList PagedListFoo unified"][id$="_paged_list"]
quora.com##.pagedlist_item > div[id$="_paged_list"]
quora.com##.answer_auto_expanded_comments + div > div.feed_expand
quora.com##.feedback_wrapper.hidden:not(.negative_action) + .FeedStory.HyperLinkFeedStory.feed_item
quora.com##div[class="question_main_col"]  > div:nth-child(3) > div[class="UnifiedAnswerPagedList PagedListFoo unified"]
quora.com##div[class="pagedlist_item"]  div[id*="paged_list"]
quora.com##.q-box.qu-borderAll>.q-box>div>div[class^="Box-sc-"]>div:not([class])
quora.com##.q-box.qu-borderTop>[class^="Box-sc-"]>div:not([class])
quora.com##div > [class^="Box-"] > div > .q-box.qu-pb--tiny.qu-pt--medium.qu-px--medium
quora.com##.qu-bg--white>[class^="Box-"] .qu-pt--medium
quora.com##.q-box.qu-borderTop>[class^="Box-"] .q-box.qu-pt--medium.qu-pb--tiny
quora.com##.q-box.qu-borderAll>.q-box>div:not([class="q-box"])>[class^="Box-"]
quora.com##.q-box.qu-borderAll.qu-bg--white>.q-box>div>[class="q-box "]>[class="q-box"]
quora.com##[class="q-box qu-borderTop"]>[class="q-box "]
quora.com##[class="q-box qu-bg--white"]>[class="q-box "]>[class="q-box"]
quora.com##.dom_annotate_multifeed_bundle_AdBundle
!www.quora.com##.q-box.qu-bg--white > span[data-nosnippet="true"] > .q-box
!www.quora.com##.qu-mb--small.qu-bg--white > .q-box > div > span[data-nosnippet="true"] > .q-box
!www.quora.com##.q-box.qu-borderTop > span[data-nosnippet="true"] > .q-box
!www.quora.com##span[data-nosnippet="true"] .q-box.qu-pb--tiny.qu-pt--medium

##[onclick*="window.open('http://deloplen.com/"]

! https://www.reddit.com/r/uBlockOrigin/comments/8stv3y
! https://github.com/uBlockOrigin/uAssets/issues/2667
! https://github.com/uBlockOrigin/uAssets/issues/7220
eurogamer.net,rockpapershotgun.com,vg247.com##+js(aopw, yafaIt)
eurogamer.de,eurogamer.es,eurogamer.it,eurogamer.net,eurogamer.pt,rockpapershotgun.com,vg247.com##+js(aopr, _sp_.mms.startMsg)
||bit.ly^$popup,domain=eurogamer.net
eurogamer.net,rockpapershotgun.com##.leaderboards
eurogamer.*##.advert

! https://forums.lanik.us/viewtopic.php?p=101913#p101913
auto-motor-und-sport.de,caravaning.de,womenshealth.de##+js(aopw, adblockActive)

! https://github.com/uBlockOrigin/uAssets/issues/299
! https://github.com/uBlockOrigin/uAssets/issues/846
gamestorrents.*,gogoanimes.*,limetorrents.*,piratebayz.*##+js(aopr, LieDetector)
mediafire.com##+js(aeld, click, ClickHandler)
mediafire.com##+js(aeld, load, IsAdblockRequest)
mediafire.com##+js(nostif, InfMediafireMobileFunc, 1000)
gamestorrents.*,gogoanimes.*,limetorrents.*,piratebayz.*##^script:has-text(AaDetector)
mediafire.com##.errorExtraContent

! https://github.com/uBlockOrigin/uAssets/issues/3826
||rule34.us/ad.html$frame

! https://github.com/uBlockOrigin/uAssets/issues/1081
! https://www.reddit.com/r/uBlockOrigin/comments/8sbjjk
! https://github.com/uBlockOrigin/uAssets/issues/8307
rule34.xxx##+js(aopr, newcontent)
rule34.xxx##[src^="https://rule34.xxx/aa/"]
rule34.xxx###right-col > div > #lbot1.a_list
rule34.xxx##body > a > div[id]:style(background: var(--c-bg, #aae5a3) !important)
rule34.xxx###halloween
! https://github.com/uBlockOrigin/uAssets/issues/16970#issuecomment-1803126533
rule34.xxx##.dp
||rule34.xxx/static/fp/$image,1p
||rule34.xxx/images/clicker.png
realbooru.com##+js(aopr, ExoLoader.serve)
realbooru.com##.adzoneTest
realbooru.com##.flex_content_main > div[style$="min-height: 125px;"]
! https://github.com/uBlockOrigin/uAssets/issues/16970
||rule34.xxx/*/nutaku/

! rule34.top etc. popups
||topxxxlist.net/eroclick.js
/pop.js$domain=booru.*|erotic-beauties.com|hardsex.cc|rule34.top|sex-movies.biz|tube18.sexy|xvideos.name
||rule34.top^$csp=sandbox allow-forms allow-same-origin allow-scripts allow-modals allow-orientation-lock allow-pointer-lock allow-presentation allow-top-navigation
||rule34.top/eroclick.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/1080
xbooru.com##a[href^="https://xbooru.com/c.html"]
||xbooru.com^$frame,1p

! https://github.com/uBlockOrigin/uAssets/issues/17987
@@||kbb.com^$ghide
kbb.com##[id^="kbbAds"], [id^="kbbAds"] + p

! Fingerprint2 popups
dfiles.eu,downsub.com,j.gs,macserial.com,microify.com,minecraft-forum.net,onmovies.*,pirateproxy.*,psarips.*,solidfiles.com,thepiratebay.org,uptobox.com##+js(aopw, Fingerprint2)
solidfiles.com##.remove
thepiratebay.org##[href^="http://www.coiwqe.site/"]

! https://github.com/uBlockOrigin/uAssets/issues/4086
! https://github.com/uBlockOrigin/uAssets/issues/12524
! https://github.com/uBlockOrigin/uAssets/issues/12740
watchcartoononline.*,wcostream.*##+js(nofab)
watchcartoononline.*,wcostream.*##+js(noeval)
watchcartoononline.*,watchcartoonsonline.*,wcostream.*##+js(acs, document.createElement, jsc.mgid.com)
wcostream.*##+js(nowoif)
watchcartoononline.bz##.BorderColorChangeElement
! https://www.reddit.com/r/uBlockOrigin/comments/eslovb/seriously_well_now_watchcartoononline_has_their/
@@||wcoanimedub.tv^$ghide
@@||wcoanimesub.tv^$ghide
@@||wco.tv^$ghide
wco.tv##iframe.hide-ads:upward(div[style])
watchanimesub.net,wco.tv,wcoanimesub.tv,wcoforever.net##+js(set, isAdBlockActive, false)
wcoanimedub.tv,wcoforever.net##+js(nostif, google_jobrunner)
m.wcostream.org##center
||bloxplay.com^
wcoforever.net##.anti-ad
wcoforever.net###sidebar_r1
@@||embed.watchanimesub.net^$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/331
! https://github.com/uBlockOrigin/uAssets/issues/10133
handelsblatt.com##+js(no-xhr-if, request=adb)
@@||handelsblatt.com^$ghide
||handelsblatt.com/*/empty.js$script,1p
||wiwo.de/preparesite/empty.js$script,1p
wiwo.de##+js(set, AdController, noopFunc)
@@||wiwo.de^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/347
transfermarkt.*##+js(acs, document.querySelector, popupBlocked)
transfermarkt.*##+js(acs, Math, /\}\s*\(.*?\b(self|this|window)\b.*?\)/)
transfermarkt.*##body > div[id]:has(a[href^="/intern/adblock"])
||s0.2mdn.net/instream/video/client.js$script,redirect=noopjs,domain=player.performgroup.com
||sascdn.com^$important,script,domain=transfermarkt.de
transfermarkt.*###werbung_superbanner
transfermarkt.*##.werbung
transfermarkt.*##[id^="home-rectangle-"]

! kissasian .sh, .li, .sk
! https://www.reddit.com/r/uBlockOrigin/comments/u8f1c6/blocked_video/
kissasian.*##+js(aeld, /^(?:click|mousedown)$/, _0x)
keephealth.info,kissasian.*##+js(aopr, mm)
keephealth.info,kissasian.*##+js(nostif, (), 45000)
kissasian.*##+js(set, check_adblock, true)
kissasian.*##+js(nowoif)
@@||kissasian.*^$ghide
kissasian.*##.ksAds
kissasian.*##[id*="ScriptRoot"]
kissasian.*###videoAd
kissasian.*###hideAds
kissasian.*##div[style$="width: 610px;"]:has(.adsbyvli)
kissasian.*##div[style$="height: 90px;"]:has(.adsbyvli)
kissasian.*###overplay
||kissasian.*/Ads/$frame

! https://www.wilderssecurity.com/threads/ublock-a-lean-and-fast-blocker.365273/page-107#post-2668597
! https://www.wilderssecurity.com/threads/ublock-a-lean-and-fast-blocker.365273/page-126#post-2719661
! https://github.com/uBlockOrigin/uAssets/issues/1493
thewindowsclub.com##+js(aopr, googletag)
@@||google.com/*/search/*$script,domain=thewindowsclub.com

! https://github.com/uBlockOrigin/uAssets/issues/4864
*expires$media,redirect=noopmp3-0.1s,domain=sat1.de|wetter.com
||vidapi.expepp.de/files/*$media,domain=moviepilot.de
! https://github.com/uBlockOrigin/uAssets/issues/14619
moviepilot.de##+js(nano-stb, _0x, *)
moviepilot.de##+js(no-xhr-if, doubleclick)
! https://github.com/uBlockOrigin/uAssets/issues/20985
moviepilot.de##+js(rmnt, script, Promise)

! https://github.com/uBlockOrigin/uAssets/issues/3209
*$image,redirect-rule=32x32.png,domain=afreesms.com
afreesms.com##+js(aeld, error)
afreesms.com##+js(nowoif)
afreesms.com##+js(nostif, 0x)
afreesms.com###smspage:style(display: block !important;)
afreesms.com##[href^="https://freemining.co/"]

! https://forums.lanik.us/viewtopic.php?f=64&t=29322
mma-core.*##+js(nostif, displayAdBlockedVideo)
mma-core.*##+js(acs, $, undefined)
mma-core.*###tlbrd
mma-core.*##.rsky
mma-core.*##.outVidAd
mma-core.*##.banr
||webpartners.co^$3p

! https://forums.lanik.us/viewtopic.php?f=62&t=36750
! https://github.com/uBlockOrigin/uAssets/issues/406
! https://github.com/NanoAdblocker/NanoFilters/issues/100
! https://github.com/uBlockOrigin/uAssets/issues/2509
! https://github.com/NanoMeow/QuickReports/issues/253
@@||poststar.com^$ghide
poststar.com##.dfp-ad
grubstreet.com,twitchy.com##+js(aopr, stop)
||em0n.com^$domain=grubstreet.com|twitchy.com
popculture.com##div.modernInContent
! https://github.com/uBlockOrigin/uAssets/issues/2904
||static.tvtropes.org/design/js/google-adblock.js$script
! https://popculture.com/celebrity/news/austin-butler-tears-up-remembering-lisa-marie-presley/ video breakage
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect=google-ima.js,domain=popculture.com,important
! https://www.reddit.com/r/uBlockOrigin/comments/17w81gw/remove_whitespace_at_the_top_and_move_everything/
popculture.com##body:not(.skybox-loaded) > header:style(top: 0 !important;)
popculture.com##body.pcm-public:not(.skybox-loaded):style(margin-top: 90px !important;)

! Prevent popunders + redirections on multiple websites
||go.oclasrv.com/apu.php$script,redirect=noopjs
||go.onclasrv.com/apu.php$script,redirect=noopjs
||onclkds.com/apu.php$script,redirect=noopjs
||xxlargepop.com/apu.php$script,redirect=noopjs

! https://github.com/gorhill/uBlock/issues/3176
rule34hentai.net##+js(aopr, open)
||rule34hentai.net/*.php$script,1p
@@||fluidplayer.com^$script,domain=rule34hentai.net
rule34hentai.net##[href^="https://syndication.dynsrvtbg.com/splash.php"]
rule34hentai.net###commentlistimage ~ section[id$="main"]
rule34hentai.net###imagelist ~ section[id$="main"]
rule34hentai.net##section[id$="left"]:has(> .blockbody > script[type])
rule34hentai.net##section[id$="main"]:has(> .blockbody > .adsbyexoclick)

! https://github.com/uBlockOrigin/uAssets/issues/444
kingofdown.com##+js(aeld, load, onload)

! https://github.com/uBlockOrigin/uAssets/issues/446
mind42.com###sidebar
mind42.com###content.sidebar2:style(margin-right: 0 !important;)

! https://twitter.com/v_josel/status/877137961615273985
elmundo.es##.Bloque-anuncios-shadow
elmundo.es##.Bloque-anuncios
elmundo.es##.disabled-vscroll:style(overflow: auto !important; position: initial !important;)

! https://github.com/uBlockOrigin/uAssets/issues/492
||andreas-unterberger.at/includes/js/helperFunctions.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/498
receive-sms-online.info##+js(aopr, ga.length)

! https://github.com/uBlockOrigin/uAssets/issues/500
! https://github.com/uBlockOrigin/uAssets/issues/828
||gainskins.com^$frame,domain=hltv.org
||hltv.org/img/newwidgets/$image
||hltv.org/img/static/featured_bet_bg.png$image
||hltv.org/*.gif?ixlib=$image
hltv.org##+js(nowoif)
hltv.org##.leftCol > aside:first-child:has(> .ggbe-firstcol-box > a[href] > img[src*="/ggbet/"])
hltv.org##body, body::before:style(background-image: unset !important;)
hltv.org##:is(div, aside):has(> a[href^="/"][data-link-tracking-page="Widget"])
hltv.org##.leftCol > div [data-link-tracking-page="Widget"]:upward(.leftCol > div)
hltv.org##.presented-by
hltv.org##.thunderpick-firstcol-box
hltv.org##a:matches-attr(href=/[a-zA-Z0-9]{100,}/)

! https://github.com/uBlockOrigin/uAssets/issues/516
! https://github.com/uBlockOrigin/uAssets/issues/18549
thepiratebay.*,theproxyproxy.com,tpbay.*##+js(aopr, _wm)

! https://github.com/uBlockOrigin/uAssets/issues/518
wallpapershome.com##+js(nostif, .adsbygoogle)

! https://github.com/uBlockOrigin/uAssets/issues/7802
! primewire.mn ads
primewire.*##+js(set, console.clear, noopFunc)
primewire.*##:xpath('//*[contains(text(),"Sponsored")]'):upward(2)
||primewire.*/sw$script,1p
||primewire.*/addons/*.gif$image
primewire.*##.ico.close

! https://github.com/uBlockOrigin/uAssets/issues/7113
! https://github.com/uBlockOrigin/uAssets/issues/9118
!broken video ign.com##+js(aopr, __eiPb)
ign.com##^script:has-text(iframeTestTimeMS)
ign.com##.preShell:style(height: 0 !important;)
ign.com###king
ignboards.com,ign.com##^script:has-text(g02.)
!#if env_chromium
||au.ign.com^$inline-script
! https://github.com/abp-filters/abp-filters-anti-cv/pull/455
ignboards.com##+js(acs, JSON.stringify)
!#endif
*$xhr,redirect-rule=1x1.gif,domain=ign.com
*$script,redirect-rule=noopjs,domain=ignboards.com

! https://github.com/uBlockOrigin/uAssets/issues/905
||fux.com/*banner$image
fux.com##.autonextAd
.com/external/*?width=300&height=250$frame,1p
.com/nativeexternal/$frame,1p

! https://github.com/uBlockOrigin/uAssets/issues/549
! https://forums.lanik.us/viewtopic.php?f=64&t=40089
steamplay.*##+js(aopr, btoa)
steamplay.*,streamp1ay.*##+js(aopw, Fingerprint2)
streamp1ay.*##+js(aopw, Fingerprent2)
steamplay.*,streamp1ay.*##+js(aopr, console.clear)
steamplay.*,streamp1ay.*##+js(aopw, adcashMacros)
slreamplay.*##+js(nano-stb, grecaptcha.ready, *)
@@player*.html$frame,1p,domain=slreamplay.*
*$frame,denyallow=google.com,domain=slreamplay.*|streampiay.*
ext=$script,1p,domain=slreamplay.*
||*ontent.steamplay.*^$all
||steamplay.*^$csp=worker-src 'none';
@@||streamp1ay.*^$ghide
*$xhr,frame,3p,domain=streamp1ay.cc,denyallow=spcdn.cc
! https://github.com/uBlockOrigin/uAssets/issues/8244
slreamplay.*,steamplay.*,steanplay.*,stemplay.*,streamp1ay.*,streanplay.*,streampiay.*##+js(nowoif)
streanplay.*##+js(set, console.log, noopFunc)
streanplay.*##+js(set, console.clear, noopFunc)
streanplay.*,steanplay.*##+js(aeld, , BACK)
streanplay.*##+js(nowebrtc)
steamplay.*,steanplay.*,stemplay.*,streamp1ay.*,streanplay.*##+js(aopr, jwplayer.utils.Timer)
steamplay.*,steanplay.*,streamp1ay.*,streanplay.*##.ad
slreamplay.*,steamplay.*,steanplay.*,stemplay.*,streamp1ay.*,streampiay.*,streanplay.*###uverlay
steanplay.*,streanplay.*##div[style*="z-index: 2147483647;"][style*="position: fixed;"]
*$xhr,frame,3p,domain=steanplay.*|streanplay.cc,denyallow=spcdn.cc
stre4mplay.*##.ad
stre4mplay.*##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/3895
torrentfunk.com##+js(nowebrtc)
||torrentfunk.com/s1w.js$script,1p
torrentfunk.com##[href*=".premium"]
torrentfunk.com##:xpath(//strong[contains(text(),"VPN")]/../../..)
torrentfunk.com##.extneed

! https://github.com/uBlockOrigin/uAssets/issues/558
! https://github.com/uBlockOrigin/uAssets/issues/578
! https://github.com/uBlockOrigin/uAssets/issues/4272
! https://github.com/NanoAdblocker/NanoCore/issues/234#issuecomment-450343022
torrentz2.*##[class]:not(body):not(html):has-text(/Protect your privacy/i)
torrentz2.*##[class]:not(body):not(html):has-text(Sponsored)
torrentz2.*##.xpressa

! https://github.com/uBlockOrigin/uAssets/issues/571
informer.com##+js(aopr, adblock_added)
informer.com##.screen_ad

! https://github.com/uBlockOrigin/uAssets/issues/1286
torlock.*,torlock2.*##+js(acs, setTimeout, admc)
||torlock.*/sww.js$script,1p
torlock.*##:xpath(//strong[contains(text(),"VPN")]/../../..)
torlock.*,torlock2.*##+js(nowebrtc)
torlock2.*##:xpath(//strong[contains(text(),"VPN")]/../../..)
torlock.*,torlock2.*##.extneed
/script/bootstrap.js$script,3p,domain=torlock.*|torlock2.*

! https://github.com/uBlockOrigin/uAssets/issues/590
! https://www.reddit.com/r/uBlockOrigin/comments/76srms/local_news_sites_in_the_uk_now_attempting_to/
bordertelegraph.com,bournemouthecho.co.uk,dailyecho.co.uk,dorsetecho.co.uk,eveningtimes.co.uk,guardian-series.co.uk,heraldscotland.com,iwcp.co.uk,lancashiretelegraph.co.uk,oxfordmail.co.uk,salisburyjournal.co.uk,theargus.co.uk,thetelegraphandargus.co.uk,yorkpress.co.uk##+js(aopw, _sp_)

##[href^="https://www.onclickmega.com/"]

! https://github.com/uBlockOrigin/uAssets/issues/598
! https://github.com/uBlockOrigin/uAssets/issues/7124
dronedj.com##+js(set, String.prototype.charCodeAt, trueFunc)
9to5google.com,9to5mac.com,9to5toys.com,dronedj.com,electrek.co,marketrealist.com##.ad-disclaimer-container, .inlinead, .ad-container
||googlesyndication.com^$xhr,redirect=noopjs,domain=9to5google.com|9to5mac.com|9to5toys.com|dronedj.com|electrek.co|marketrealist.com
*$script,redirect-rule=noopjs,domain=9to5google.com|9to5mac.com|9to5toys.com|dronedj.com|electrek.co|marketrealist.com
dronedj.com##.adsense, a[target="_blank"][rel="noopener noreferrer"]
9to5toys.com,dronedj.com##.slot-leaderboard
marketrealist.com###Track\.End + div[class]
marketrealist.com##.gXgoom > div

! https://github.com/uBlockOrigin/uAssets/issues/609
igfap.com##+js(aopr, decodeURI)

! https://github.com/uBlockOrigin/uAssets/issues/611
||dslr-forum.de/ads/$image
*/plugin/advertisement/$image

! https://github.com/uBlockOrigin/uAssets/issues/12823
@@||myreadingmanga.disqus.com^$script
myreadingmanga.info##.imgtop
myreadingmanga.info##center
##[href*="www.gaming-adult.com/"]

! https://github.com/uBlockOrigin/uAssets/issues/620
alibaba.com##.m-product-item:has-text(Sponsored Listing)

! https://github.com/uBlockOrigin/uAssets/issues/506
! https://github.com/uBlockOrigin/uAssets/issues/6568
||msn.com/advertisement.ad.js$script,1p,important
||aolcdn.com/ads/adswrappermsni.js$script,domain=msn.com,important
! https://github.com/uBlockOrigin/uAssets/issues/3703#issuecomment-435044782
msn.com##.extnativeaditem, .serversidenativead > h3
msn.com##.colombiaintraarticleads
! https://github.com/NanoMeow/QuickReports/issues/2332
msn.com##[data-aop="stripe.sponsored.navigation_stripenavigation"]:upward(2)
!#if !env_mobile
msn.com##[data-aop="stripe.store.navigation_stripenavigation"]:upward(2)
!#endif
!#if env_mobile
msn.com##.stripenav:has(.adslabel):upward(2)
!#endif
msn.com##.todayshowcasead
! https://github.com/NanoMeow/QuickReports/issues/1486#issuecomment-557161527
msn.com##.stripecontainer:has(.adslabel)
! https://www.msn.com/ja-jp/news placeholder
msn.com##msft-article-card:not([class])
! https://github.com/uBlockOrigin/uAssets/issues/19845
!#if env_mobile
msn.com##cs-native-ad-card-no-hover
msn.com##msft-article-card:not(.contentCard)
!#endif
! https://github.com/AdguardTeam/AdguardFilters/issues/173054
www.msn.com##+js(json-prune-fetch-response, properties.componentConfigs.slideshowConfigs.slideshowSettings.interstitialNativeAds, , propsToMatch, url:consumptionpage/gallery_windows/config.json)
! https://github.com/AdguardTeam/AdguardFilters/issues/146823
www.msn.com##+js(json-prune-fetch-response, *, list.*.link.ad list.*.link.kicker, propsToMatch, url:content/v1/cms/api/amp)

! https://github.com/uBlockOrigin/uAssets/issues/12058
mcloud.bz##+js(acs, Math, XMLHttpRequest)
mcloud.bz##+js(nosiif, break)
mcloud.bz##+js(aopr, open)
@@||mcloud.bz^$ghide
mcloud.bz,vidstream.pro##+js(nowoif)
vidstream.pro##+js(aopr, mm)
mcloud.bz##+js(aopr, __Y)
vidstream.pro##+js(nosiif, break)
vidstream.pro##div[id][style^="position: fixed; inset: 0px; z-index: 2147483647;"]
bflix.*,mcloud.*,vizcloud.*,vizcloud2.*##+js(aopr, AaDetector)
bflix.*##+js(aopr, mm)
vizcloud.*,vizcloud2.*##.xad-wrapper
mcloud.bz,vidplay.*,vidstream.pro,vizcloud.*##+js(ra, data-id|data-p, '[data-id],[data-p]', stay)
mcloud.bz,vidplay.*##[src^="assets/bn"]:upward([style])
||i.imgur.com^$image,domain=vizcloud.*|vizcloud2.*
/mellowpresence.com^$script
/\/[A-Z]{1,2}\/[-0-9a-z]{5,}\.com\/(?:[0-9a-f]{2}\/){3}[0-9a-f]{32}\.js$/$script,1p,match-case
! https://github.com/uBlockOrigin/uAssets/issues/19260
vidstream.pro##.aslot
/lazymolecule/*.js$script

youtubedownloader.*##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/662
liferayiseasy.*##+js(aeld, load, getComputedStyle)
liferayiseasy.*##+js(aeld, load, adsense)

! https://github.com/uBlockOrigin/uAssets/issues/829
iptvbin.com##+js(aost, String.prototype.charCodeAt, ai_)
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=iptvbin.com

! https://github.com/uBlockOrigin/uAssets/issues/672
@@||playok.com^$ghide
playok.com##.adsbygoogle:style(height: 1px !important; width: 1px !important;)

! https://www.youtube.com/watch?v=t6oyXKqB2vY
blackspigot.com##+js(aopw, AdBlockDetectorWorkaround)

! https://github.com/uBlockOrigin/uAssets/issues/688
spaste.com##+js(nofab)
spaste.com##[href^="http://bit.ly/"]
spaste.com##[href="javascript:showhide('deals')"]
spaste.com##b
spaste.com##h5:has(> a[href^="javascript:"])
spaste.com##h5 > a[href^="http://amzn.to/"]

! https://forums.lanik.us/viewtopic.php?p=124271#p124271
dailyuploads.net##+js(acs, $, window.open)
dailyuploads.net##+js(nowoif)
*$script,3p,denyallow=google.com|gstatic.com,domain=dailyuploads.net
||coertiest.click^

! sports streams vipleague
@@*$ghide,domain=f1stream.*|fbstream.*|mlbstream.*|motogpstream.*|nbastream.*|nflstream.*|nhlstream.*|plylive.*|plyvdo.*|rugbystreams.*|socceronline.*|tennisstreams.*|tvply.*|ufcstream.*|vipleague.*
plylive.*,plyvdo.*##+js(nowoif)
tennisstreams.*,vipleague.*##+js(acs, setTimeout, admc)
||mw19c3mi5a.com^$3p
||ryllae.com^$3p,important
##[data-uri^="https://s3.amazonaws.com"]
##[data-lnguri^="https://s3.amazonaws.com"]
fbstream.*##.position-absolute
vipleague.*##.bg-dark.ratio > .position-absolute
*/script/formula.js|$script
nolive.me##+js(set, attachEvent, trueFunc)
nolive.me##+js(nosiif, debug)
vipleague.*##.m-1.btn-danger.btn

! https://github.com/uBlockOrigin/uAssets/issues/718
cs-fundamentals.com##+js(aopr, google_jobrunner)

! https://github.com/uBlockOrigin/uAssets/issues/723
xmoviesforyou.*##+js(aopr, popjs.init)
xmoviesforyou.*##+js(aopr, decodeURI)

! https://github.com/jspenguin2017/uBlockProtector/issues/624
kisshentai.net##+js(aopr, adblock)

! https://github.com/uBlockOrigin/uAssets/issues/739
||zergnet.com/zerg-inf-multi$3p,script

! https://github.com/gorhill/uBlock/issues/3114
wunderground.com##+js(aopw, _sp_)
wunderground.com##[class*="-ad-box-"]
! https://github.com/uBlockOrigin/uAssets/issues/22408
wunderground.com##.content-wrap #inner-wrap:style(height: 100vh !important;)
wunderground.com##body wu-header:style(margin-top: 0px !important;)

! https://github.com/uBlockOrigin/uAssets/issues/841
putlockerc.*##+js(nowoif)
putlocker.*##[id*="ScriptRoot"]
putlocker.*##.ep_buttons
||putlocker.*^*banner
||put-locker.com/sw$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/4674
! https://forums.lanik.us/viewtopic.php?f=62&t=40397
! https://www.reddit.com/r/uBlockOrigin/comments/aqcoi3/annoying_ads_on_putlockertv/
putlocker-website.com,putlockertv.*##+js(nowoif)

! https://www.reddit.com/r/uBlockOrigin/comments/9vmhj2
||greedseed.world/vpaid/YtVpaid.php
putlocker.*##+js(aopw, open)
putlocker.*##+js(aopw, adcashMacros)
||putlocker.*/*.gif$image

! https://forums.lanik.us/viewtopic.php?f=62&t=38536
10fastfingers.com##+js(acs, document.createElement, decodeURIComponent)

! https://github.com/uBlockOrigin/uAssets/issues/757
@@||ultrahorny.com^$ghide
@@||ajax.googleapis.com^$script,domain=ultrahorny.com
ultrahorny.com##.afs_ads
ultrahorny.com###hideads

! https://www.reddit.com/r/uBlockOrigin/comments/75zmyk/ublock_not_blocking_grammarly_ads_on_citation/
! https://github.com/uBlockOrigin/uAssets/issues/806
bibme.org,citationmachine.net##+js(aopr, SBMGlobal.run.pcCallback)
citationmachine.net,citethisforme.com,easybib.com##+js(aopr, SBMGlobal.run.gramCallback)
citethisforme.com##.sbm-ad
! https://github.com/uBlockOrigin/uAssets/issues/2155
bibme.org,citationmachine.net##+js(aeld, load, (!o))
easybib.com##+js(aeld, load, (!i))
citethisforme.com##.ads_top_middle
||contributor.google.com/scripts/*/loader.js$script,domain=citationmachine.net

! https://forums.lanik.us/viewtopic.php?f=62&t=38653
radio.*##.topAdSpacer

! https://www.reddit.com/r/uBlockOrigin/comments/772sm4/help_me_figure_out_how_to_block_these/
! https://github.com/NanoMeow/QuickReports/issues/2485
mmorpg.com##[onclick^="trackClick"]
mmorpg.com##a[href^="http://v2.g.99.com/"]
mmorpg.com##.vhadb

! https://github.com/uBlockOrigin/uAssets/issues/4163
mylink.*,my1ink.*,myl1nk.*,myli3k.*##+js(acs, decodeURIComponent, 'shift')
mylink.*,my1ink.*,myl1nk.*,myli3k.*##+js(nosiif, /0x|google|ecoded|==/)
mylink.*,my1ink.*,myl1nk.*,myli3k.*##+js(nowoif)
mylink.*,my1ink.*,myl1nk.*,myli3k.*##a[href^="https://go.nordvpn.net/"], [src^="/nordcode.php"]
mylink.*,my1ink.*,myl1nk.*,myli3k.*##div[id][style^="width: 970px; height: 250px;"]
mylink.*,my1ink.*,myl1nk.*,myli3k.*##div[id][style="width: 300px; height: 250px;"]
mylink.*,my1ink.*,myl1nk.*,myli3k.*##div[id][style="width: 728px; height: 90px;"]:upward(#pub1)
mylink.*,my1ink.*,myl1nk.*,myli3k.*##html > iframe
@@*$script,1p,domain=mylink.*|my1ink.*|myl1nk.*|myli3k.*
@@||in-page-push.com^$script,domain=mylink.*|my1ink.*|myl1nk.*|myli3k.*
@@||googleads.g.doubleclick.net/pagead/test_domain.js$script,domain=mylink.*|my1ink.*|myl1nk.*|myli3k.*
*$script,redirect-rule=noopjs,domain=mylink.*|my1ink.*|myl1nk.*|myli3k.*
*$script,3p,denyallow=cloudflare.com|cloudflare.net|consensu.org|google.com|googleapis.com|gstatic.com|hcaptcha.com|hwcdn.net|recaptcha.net|twitter.com|x.com,domain=mylink.*|my1ink.*|myl1nk.*|myli3k.*
freebeacon.com##.uppercase:has-text(/advertisement/i)

! https://github.com/uBlockOrigin/uAssets/issues/19806
sankakucomplex.com##.vce-ad-container
sankakucomplex.com#@#.scad
sankaku.app##+js(no-xhr-if, googlesyndication)
chan.sankakucomplex.com##body.no-scroll:style(overflow: auto !important; position: static !important; width: unset !important;)

! https://github.com/uBlockOrigin/uAssets/issues/778
! https://github.com/jspenguin2017/uBlockProtector/issues/853
@@||anghami.com^$ghide
@@||anghamiwebcdn.akamaized.net/ads.$script,domain=play.anghami.com
@@||d24n15hnbwhuhn.cloudfront.net/libs/amplitude-$script,domain=play.anghami.com
play.anghami.com##.sideBox:has(.adsbox)
anghami.com##anghami-ads
anghami.com##+js(nostif, isDesktopApp, 1000)

! https://github.com/uBlockOrigin/uAssets/issues/5952
player.glomex.com,merkur.de,tz.de##+js(set, Object.prototype._getSalesHouseConfigurations, noopFunc)
player.glomex.com##+js(no-fetch-if, player-feedback)
||player-feedback*.glomex.*^

! https://github.com/uBlockOrigin/uAssets/issues/767
theoutline.com##.stack-embed

! https://github.com/uBlockOrigin/uAssets/issues/25
wired.com##[class^="OutbrainGridColumn-"]
wired.com##[class^="StickyHeroAdWrapper-"]
wired.com###around-the-web
! https://github.com/uBlockOrigin/uAssets/issues/28
||googlesyndication.com/pagead/*$script,important,domain=wired.com
||wired.com/ams/page-ads.js$important,script
wired.com##+js(nostif, Bait)
! "Sponsored stories" section spotted 1st-hand at:
! https://www.wired.com/2011/08/google-studying-re-ranking-search-results-using-1-button-data-but-its-touchy/
wired.com##.sponsored-stories-component
! wired.com: more EasyList's exception filters to counter
||doubleclick.net^$important,script,domain=wired.com
wired.com##[id^="cns_ads_"]
wired.com##[class^="adv"]
wired.com##.failsafe-desktop
! https://github.com/NanoMeow/QuickReports/issues/1751#issuecomment-591741616
wired.com##.consumer-marketing-unit

! https://github.com/uBlockOrigin/uAssets/issues/790
androidrepublic.org##+js(acs, $, samInitDetection)

! https://github.com/uBlockOrigin/uAssets/issues/796
! https://github.com/uBlockOrigin/uAssets/issues/6880
biqle.*##+js(acs, decodeURI, decodeURIComponent)
biqle.*##+js(aopr, Date.prototype.toUTCString)
||biqle.ru/swp.js$script,1p
dxb.to##+js(nowebrtc)

! https://github.com/uBlockOrigin/uAssets/issues/10545
nytimes.com,nytimes3xbfgragh.onion###site-content > div[class^="css"]:has(> [data-testid="StandardAd"])
nytimes.com,nytimes3xbfgragh.onion##article.story:style(opacity: 1.0 !important;)
nytimes.com,nytimes3xbfgragh.onion##:xpath(//div[starts-with(@id, "dfp-ad")]/../..)
nytimes.com,nytimes3xbfgragh.onion##section[aria-labelledby="new-york-section"] > div > div[class^="css"]:has(> #pp_morein-wrapper)
! https://github.com/uBlockOrigin/uAssets/issues/816
! https://github.com/uBlockOrigin/uAssets/issues/3708
cooking.nytimes.com#?#.nytc---modal-window---isShown:not(:has(.nytc---largepicturemodal---contentBody > .nytc---x---x.nytc---largepicturemodal---xBtn[role="button"], .nytc---grocerylistmodal---groceryListContentContainer))
cooking.nytimes.com##body:style(height: auto !important; overflow: auto !important)
cooking.nytimes.com##html:style(height: auto !important; overflow: auto !important)
! https://github.com/easylist/easylist/commit/1509d85840e1245394ed7fb6cbbbedc9c0cda103
@@||nytimes.com^*/adslot-$script,xhr,badfilter
! https://github.com/uBlockOrigin/uAssets/issues/16519
nytimes.com##[id^="story-ad"][id$="wrapper"]

! https://forums.lanik.us/viewtopic.php?f=62&t=32450
! https://github.com/uBlockOrigin/uAssets/issues/2973
mp4upload.com##+js(aopw, adcashMacros)
mp4upload.com##+js(aopr, Adcash)
mp4upload.com###lay.lay
*$script,redirect-rule=noopjs,domain=mp4upload.com
*$script,3p,denyallow=cloudflare.com|cloudflare.net|fontawesome.com|gstatic.com|hwcdn.net|jquery.com|jsdelivr.net,domain=mp4upload.com

! https://github.com/AdguardTeam/AdguardFilters/issues/133530
@@||userupload.*^$ghide
userupload.*##.btn-danger:has-text(/download/i)
userupload.*##a[href*="hotstar"]
userupload.*##ins.adsbygoogle
userupload.*##.ads
||tgwidget.com^$3p

! https://github.com/uBlockOrigin/uAssets/issues/5674
get.getpczone.com,rahim-soft.com,uploadrar.*###commonId > a[target="_blank"]
||canoestallowrootsabre.com^
||pixeltrey.com^

! https://github.com/reek/anti-adblock-killer/issues/3723
wetter.com##+js(acs, $, lobster)
at.wetter.com##+js(aopw, openLity)

! https://www.camp-firefox.de/forum/viewtopic.php?p=1057609#p1057609
! https://forums.lanik.us/viewtopic.php?p=127880#p127880
motorradonline.de,zentralplus.ch##+js(nofab)

! https://github.com/uBlockOrigin/uAssets/issues/843
business-standard.com##+js(acs, $, blockThisUrl)

! https://forums.lanik.us/viewtopic.php?f=62&t=39052
powerthesaurus.org##+js(aopw, ad_abblock_ad)

! https://github.com/uBlockOrigin/uAssets/issues/846
! https://github.com/jspenguin2017/uBlockProtector/issues/816
! https://github.com/uBlockOrigin/uAssets/issues/16180
! Popups triggered by popads
animepahe.*,kwik.*##^script:has-text('shift')
animepahe.*,kwik.*##^script:has-text(\'shift\')
animepahe.*,kwik.*##+js(acs, String.fromCharCode, 'shift')
animepahe.*,kwik.*##+js(aopr, open)
animepahe.*,kwik.*##+js(aopr, PopAds)
pahe.*##+js(rmnt, script, Reflect)
pahe.*##+js(nowoif)
@@||kwik.*^$script,1p
! https://forums.lanik.us/viewtopic.php?f=62&t=44940 pahe .in / .ph
! https://github.com/uBlockOrigin/uAssets/issues/8398
pahe.*##+js(aeld, , _0x)
@@||pahe.*^$ghide

! https://forums.lanik.us/viewtopic.php?f=64&t=39161
zonebourse.com##+js(acs, $, AdBlocker)

! bad*.it network sites
! https://github.com/NanoMeow/QuickReports/issues/3260
badtaste.it##+js(aeld, , Adblock)

! https://github.com/reek/anti-adblock-killer/issues/3760
aofsoru.com##+js(acs, addEventListener, displayMessage)

! https://github.com/uBlockOrigin/uAssets/issues/5397
! https://github.com/uBlockOrigin/uAssets/issues/8295
! https://github.com/uBlockOrigin/uAssets/pull/12748
yts.*##+js(aeld, , _0x)
yts.*##+js(aopr, runAdblock)
yts.*##+js(nowoif)
yts.*##+js(nostif, "admc")
yts.*##+js(acs, document.createElement, admc)
yts.*##+js(aopw, Adcash)
yts.*##^script:has-text(admc)
*/script/clock.js$script,domain=yts.*
yts.*##[id*="container"][id^="id"]
yts.*##html:style(overflow: auto !important;)
yts.*##.cborz-bordered
yts.*##.madikf
! https://github.com/uBlockOrigin/uAssets/issues/19405
yts.mx##.title ~ a[href] .button:upward(.container > div)
yts.mx##^script:has-text(document.write)
!#if !cap_html_filtering
yts.mx##+js(rmnt, script, document.write)
!#endif
yts.mx##.container > [class]:has-text(VPN)

! https://www.reddit.com/r/uBlockOrigin/comments/7fr9jc/help_with_disabling_the_antiadbock_message_on/
sarugbymag.co.za##+js(aopr, showAds)

! https://forums.lanik.us/viewtopic.php?f=62&t=39202
! https://github.com/AdguardTeam/AdguardFilters/issues/78153
! https://github.com/AdguardTeam/AdguardFilters/issues/116391
imgdrive.net,imgwallet.com##+js(acs, jQuery, TestAdBlock)
imgadult.com,imgdrive.net,imgtaxi.com,imgwallet.com##+js(aopr, ExoLoader)
imgadult.com,imgdrive.net,imgtaxi.com,imgwallet.com##+js(aopr, loadTool)
imgadult.com,imgdrive.net,imgtaxi.com,imgwallet.com##+js(aopw, cticodes)
imgadult.com,imgdrive.net,imgtaxi.com,imgwallet.com##+js(aopw, imgadbpops)
imgadult.com,imgdrive.net,imgtaxi.com,imgwallet.com##+js(acs, document.getElementById, document.write)
imgadult.com,imgdrive.net,imgtaxi.com,imgwallet.com##+js(nano-stb, redirect, 4000)
/(?:com|net)\/[a-z-]{3,10}\.html$/$frame,1p,domain=imgadult.com|imgdrive.net|imgtaxi.com|imgwallet.com
/(?:com|net)\/[0-9a-f]{12}\.js$/$script,1p,domain=imgadult.com|imgdrive.net|imgtaxi.com|imgwallet.com
/ea/fl.js
/ea2/fl.js
/altiframe.php$domain=imgadult.com|imgdrive.net|imgtaxi.com|imgwallet.com
/altiframe2.php$domain=imgadult.com|imgdrive.net|imgtaxi.com|imgwallet.com
/frame.php$domain=imgadult.com|imgdrive.net|imgtaxi.com|imgwallet.com
imgadult.com,imgdrive.net,imgtaxi.com,imgwallet.com##.blink
imgadult.com,imgdrive.net,imgtaxi.com,imgwallet.com##.sidebar > div:first-of-type
imgadult.com,imgdrive.net,imgtaxi.com,imgwallet.com##.sidebar > h3:first-child
imgadult.com,imgdrive.net,imgwallet.com##.bottom_abs
imgadult.com,imgdrive.net,imgwallet.com##.centered
imgtaxi.com###image_details:style(margin-top: 30px !important)

! https://github.com/uBlockOrigin/uAssets/issues/870
! https://www.reddit.com/r/uBlockOrigin/comments/hbxqip/sxyprnnet_video_ads/
! https://www.reddit.com/r/uBlockOrigin/comments/1966h80/ublock_filters_blocking_website_element/
sxyprn.*##+js(acs, decodeURI, decodeURIComponent)
sxyprn.*##+js(set, vast_urls, {})
sxyprn.*##+js(aopr, popns)
sxyprn.*##+js(acs, document.createElement, /l\.parentNode\.insertBefore\(s/)
sxyprn.*##+js(aopw, __aaZoneid)
sxyprn.*##.tbd
sxyprn.*##.cbd
*$frame,script,3p,denyallow=google.com|googleapis.com|gstatic.com|hcaptcha.com|recaptcha.net,domain=sxyprn.*

! https://github.com/uBlockOrigin/uAssets/issues/1197
lacuevadeguns.com##+js(aost, onload, inlineScript)
*$image,redirect-rule=1x1.gif,domain=magesy.*|majesy.*|mage.si|magesypro.*
@@*$ghide,domain=mage.si|magesypro.*|magesy.blog
magesy.*##ins.adsbygoogle
mage.si##+js(aeld, load, nextFunction)
mage.si##+js(nano-sib)
magesypro.*##ins.adsbygoogle
magesypro.pro,magesy.*##+js(nostif, AdBlocker)
magesy.*##+js(no-fetch-if, adsbygoogle)
audiotools.pro,magesy.blog,magesypro.pro##+js(noeval-if, blocker)
audiotools.pro,magesy.blog,magesypro.pro##+js(nostif, Blocked)
magesy.download##+js(acs, addEventListener, google_ad_client)
magesy.*,magesypro.pro##+js(aost, document.getElementById, adsBlocked)
@@*$script,1p,domain=audiotools.pro|magesy.blog|magesypro.pro|audioztools.com
/magesy\.blog\/biocontent\/themes\/[a-z0-9]{4,15}\.js/$script,1p,important,domain=magesy.blog
||cdn.jsdelivr.net/npm/@rimiti/abm@latest/dist/$script,css,3p
magesy.blog###abm
magesy.blog##+js(nostif, ai_adb)
magesy.blog##+js(nostif, match, 100)

! https://github.com/uBlockOrigin/uAssets/issues/6223
hqq.*##+js(aopr, adBlockDetected)
hqq.*##+js(set, sadbl, false)
hqq.*##+js(nowoif)
||hqq.*/cdn-cgi/trace$xhr,1p,important
||googletagmanager.com/ns.html$redirect-rule=noop.js
@@||hqq.*^$ghide
@@||hqq.*^$script,xhr,1p
@@||cdn.jsdelivr.net/npm/videojs-contrib-ads/$domain=hqq.*
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=hqq.*
!#if env_firefox
@@||hqq.*/sec/player/*$csp
!#endif
hqq.*##[href="https://t.me/Russia_Vs_Ukraine_War3"]
hqq.*##a[onclick="openAuc();"]
||vkcdnservice.com^$script,redirect-rule=noopjs,3p
! https://github.com/uBlockOrigin/uAssets/issues/10039
||ebd.cda-hd.cc^
! https://www.reddit.com/r/uBlockOrigin/comments/14r6074/
! https://www.reddit.com/r/uBlockOrigin/comments/14r6074/adblock_blocked_netutvhqqto_site/jqv92vj/
hqq.*,waaw.*##+js(set, adblockcheck, false)
! Redirecting
hqq.*,waaw.*##^script:has-text(self == top)
!#if !cap_html_filtering
hqq.*,waaw.*##+js(rmnt, script, self == top)
!#endif
! https://github.com/uBlockOrigin/uAssets/issues/14001
*$script,3p,denyallow=google.com|gstatic.com|polyfill.io,domain=playdede.us
waaw.*##+js(aopr, doSecondPop)
! https://github.com/uBlockOrigin/uAssets/issues/20599
waaw.*##+js(nowoif)
waaw.*##+js(set, arrvast, [])

! https://forums.lanik.us/viewtopic.php?f=62&t=39244
filescdn.com##+js(nowoif)

! https://github.com/NanoMeow/QuickReports/issues/3099
! palimas tv => palimas org
@@||palimas.*^$ghide
*$script,3p,denyallow=cloudflare.com|cloudflare.net|fluidplayer.com|fontawesome.com|google.com|gstatic.com|hwcdn.net|jquery.com,domain=palimas.*

! URL Shortener
! https://github.com/uBlockOrigin/uAssets/issues/2768
adbull.org##+js(set, blurred, false)
*$script,3p,domain=adbull.org
@@||static.adbull.me^$script,domain=adbull.org
*$script,redirect-rule=noopjs,domain=adbull.org
adbull.*##+js(ra, onclick)
adbull.*##[src^="https://i.imgur.com/"]
deportealdia.live##+js(nano-sib, , 1200, 0)
deportealdia.live##+js(nowoif)
deportealdia.live###overlay
adyou.me,srt.am##+js(nowebrtc)
! https://github.com/uBlockOrigin/uAssets/issues/6299
srt.am##+js(aopr, RunAds)
||srt.am/sw.js$script,1p
! https://github.com/uBlockOrigin/uAssets/issues/3091
adyou.*##+js(aeld, /^(?:click|mousedown)$/, bypassEventsInProxies)
adyou.me#@#.adscontainer

! https://github.com/uBlockOrigin/uAssets/issues/883
||fbs.com^$3p
! https://github.com/uBlockOrigin/uAssets/issues/1009#issuecomment-352160776
! https://github.com/jspenguin2017/uBlockProtector/issues/791
! https://github.com/jspenguin2017/uBlockProtector/issues/792
! https://github.com/NanoMeow/QuickReports/issues/354
123link.*##+js(aopr, jQuery.adblock)
123link.*##+js(acs, $, test-block)
123link.*##+js(acs, $, adi)
123link.*##+js(acs, $, undefined)
||123link.*/push/
123link.*##.ads-block-warning
! https://github.com/uBlockOrigin/uAssets/issues/3374
123link.*##+js(aopr, ads_block)
123link.*##+js(aopr, blockAdBlock)
123link.*##+js(nano-sib)
123link.*##+js(set, blurred, false)
||yoads.network^$3p

! https://forums.lanik.us/viewtopic.php?f=62&t=39252&p=128960#p128838
||player.ooyala.com/static/*ad$script,redirect=noopjs,domain=dugout.com

! https://github.com/uBlockOrigin/uAssets/issues/891
sheshaft.com##+js(aopr, decodeURI)
sheshaft.com##[class*="banner"]
sheshaft.com##.adv-aside

! https://github.com/uBlockOrigin/uAssets/issues/892
alrincon.com##+js(aopr, loadTool)
alrincon.com##+js(aopr, ExoLoader.serve)
alrincon.com##+js(aopr, open)
alrincon.com##+js(acs, onload, open)
||trcklks.com^$3p
! ##[href^="https://sex.cam/"]
alrincon.com##center:has-text(deal)
||alrincon.com/2022/varios/crazyshit.jpg
||alrincon.com/imagenes/stasyq/
/nbk/frnd_ld.js

! https://github.com/uBlockOrigin/uAssets/issues/893
@@||playview.io/*/showads.js$xhr,1p
playview.io##.ads_player

! https://github.com/uBlockOrigin/uAssets/issues/896
hdporn.net##+js(aopr, exoOpts)
hdporn.net##+js(aopr, doOpen)
hdporn.net##[href^="http://www.hdporn.net/site.php"]
||grandfuckauto.xxx^$3p
||long.xxx^$3p
||amateurporn.net/*.gif$image

! https://github.com/uBlockOrigin/uAssets/issues/897
watch-my-gf.com,watchmyexgf.net##+js(aopr, prPuShown)
watchmyexgf.net##+js(nowoif)
watchmygf.me##+js(set, flashvars.adv_pre_src, '')
watchmyexgf.net##.adv
watchmyexgf.net##[href^="http://wct.link/click"]
watch-my-gf.com##.table
||watch-my-gf.com/images/bear.png
||watchmyexgf.net/z/gf.jpg

! https://github.com/uBlockOrigin/uAssets/issues/907
*$frame,domain=clik.pw
*$script,3p,denyallow=google.com|gstatic.com|recaptcha.net,domain=clik.pw
@@||api-secure.solvemedia.com^$frame
clik.pw##a[href^="https://href.li/"]
clik.pw##body > div[style]:has(input[type="button"])
clik.pw##div[style*="z-index:99999"] > div[style*="width:300px"]
##a[href^="https://syndication.exdynsrv.com/splash.php"]
*$popup,domain=clik.pw,3p
clik.pw##+js(aopr, open)

@@||api.solvemedia.com^$script,frame

! https://github.com/uBlockOrigin/uAssets/issues/911
adshort.*##+js(aopw, Fingerprint2)
adshort.*,adsrt.*##+js(nowoif)
adshort.*##+js(set, blurred, false)
adshort.*##A[href$=".html"][rel="nofollow norefferer noopener"]
adshort.*,adsrt.*##[id*="frme"]
! https://github.com/uBlockOrigin/uAssets/issues/911#issuecomment-417348509
adsrt.*#@#div[id*="ScriptRoot"]
! https://github.com/uBlockOrigin/uAssets/issues/911#issuecomment-423769642
||adsrt.*/sw.js$script,1p
adsrt.*##div[id^="SC_TBlock"]
@@||adshort.*^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/906
! https://github.com/AdguardTeam/AdguardFilters/issues/117551
upload-4ever.com##+js(nowoif)
*$script,domain=upload-4ever.com,3p,denyallow=gstatic.com
##[onclick*="postlnk.com"]
##[href*="postlnk.com"]

! https://github.com/uBlockOrigin/uAssets/issues/2482
tube8.*##+js(set, showPopunder, false)
tube8.*##+js(aeld, , _0x)
tube8.*##+js(aopw, IS_ADBLOCK)
tube8.*##+js(nowoif)
tube8.*##+js(set, page_params.holiday_promo, true)
tube8.*##.adsbytrafficjunky
tube8.*##.js-remove-ads-premium-link
tube8.*##main.row > aside.col-4 > div[class]
tube8.*##input + div:has(.adsbytrafficjunky)
tube8.*##.gridList > [class]:has(.adsbytrafficjunky)
tube8.*##[href^="https://ads.trafficjunky.net/ads"]
tube8.*##[style="background-color: rgb(255, 255, 255); display: block;"]
tube8.*###flvplayer > [style]:has(.js-remove-ads-premium-link)
tube8.*###result_container_wrapper > [style]:has(.js-remove-ads-premium-link)
tube8.*###result_container > [class]:not(.video_box)

! https://github.com/uBlockOrigin/uAssets/issues/915
hdpornt.com##+js(aopr, ExoLoader)
hdpornt.com##+js(aopw, __NA)

! https://github.com/uBlockOrigin/uAssets/issues/922
@@||simply-hentai.com^$ghide
*$script,redirect-rule=noopjs,domain=simply-hentai.com
simply-hentai.com##.page-leave
simply-hentai.com##.native + div

! https://github.com/uBlockOrigin/uAssets/issues/916
||daporn.com/*banner$image
||daporn.com/frames/$frame
daporn.com##.ntv-media
daporn.com##.bottom-promo
daporn.com###mediaOverlay
daporn.com###close-aff
*.gif$domain=daporn.com,image
daporn.com##[href*="offer"]
daporn.com##[href*="&aff"]
daporn.com##.sponsor

! https://github.com/uBlockOrigin/uAssets/issues/918
4tube.com##+js(aopr, ExoLoader)
4tube.com##+js(aopw, ads_priv)
||4tube.com/*banner$image

! https://adblockplus.org/forum/viewtopic.php?f=10&t=54673
mp3cut.net##+js(aopw, ab_detected)

! https://github.com/uBlockOrigin/uAssets/issues/925
pornerbros.com##+js(aopr, ExoLoader)
pornerbros.com##+js(aopw, ads_priv)
pornerbros.com##+js(set, adsEnabled, true)
pornerbros.com##+js(aopr, document.dispatchEvent)
||pornerbros.com/*banner$image
||pornerbros.com/sw.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/927
@@||media.oadts.com/www/delivery/afv.php$domain=serienjunkies.de
@@||media.oadts.com/www/delivery/video.php$domain=serienjunkies.de
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=media.oadts.com
serienjunkies.de###sj-ad-wrapper

! https://github.com/uBlockOrigin/uAssets/issues/930
pichaloca.com##+js(aopr, ExoLoader)
pichaloca.com##.publis-bottom

! https://github.com/uBlockOrigin/uAssets/issues/931
pornodoido.com##+js(aopr, ExoLoader)

! https://github.com/uBlockOrigin/uAssets/issues/5470
! https://github.com/uBlockOrigin/uAssets/issues/8039
kinos.*,kinox.*##+js(acs, adcashMacros)
kinos.*,kinox.*##+js(aopr, AaDetector)
kinos.*,kinox.*##+js(aopr, eddOptions)
||35.226.75.50^

! https://github.com/uBlockOrigin/uAssets/issues/941#issuecomment-405022292
@@||ucoz.com^$ghide
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=shidurlive.com

! https://github.com/uBlockOrigin/uAssets/issues/945
vortez.net##+js(nowoif)
vortez.net##+js(acs, $, Adblock)

! https://github.com/uBlockOrigin/uAssets/issues/948
! https://forums.lanik.us/viewtopic.php?p=140858#p140858
platinmods.com##+js(aopr, adBlockDetected)
platinmods.*##+js(nano-sib)

! https://github.com/uBlockOrigin/uAssets/issues/949
||whentai.com/*.gif$image

! Common rules for TXXX network
/\/[a-z]{4,}\/(?!holly7|siksik7)[0-9a-z]{3,}\d\.\d{1,2}\.\d{1,2}\.[0-9a-f]{32}\.js$/$script,domain=555.porn|abxxx.com|aniporn.com|bigdick.tube|gaytxxx.com|hclips.com|hdzog.*|hotmovs.*|imzog.com|in-porn.com|inporn.com|javdaddy.com|manysex.*|porn555.com|pornclassic.tube|pornforrelax.com|porngo.tube|pornj.com|pornl.com|pornq.com|porntop.com|privatehomeclips.com|puporn.com|see.xxx|shemalez.com|sss.xxx|thegay.*|tubepornclassic.com|tuberel.com|txxx.*|txxxporn.tube|upornia.*|vjav.*|voyeurhit.*|vxxx.com|xjav.tube
/\.[a-z]{3,5}\/[0-9a-z]{8,12}\/[0-9a-z]{8,12}\.js$/$script,domain=555.porn|abxxx.com|aniporn.com|asiantv.fun|blackporn.tube|bdsmx.tube|bigdick.tube|gaytxxx.com|hclips.com|hdzog.*|hotmovs.*|imzog.com|in-porn.com|inporn.com|javdaddy.com|manysex.*|mrgay.tube|onlyporn.tube|porn555.com|pornclassic.tube|pornforrelax.com|porngo.tube|pornhits.com|pornj.com|pornl.com|pornq.com|porntop.com|pornzog.com|privatehomeclips.com|puporn.com|see.xxx|senzuri.tube|sextu.com|shemalez.com|sss.xxx|teenorgy.video|thegay.*|tubepornclassic.com|tuberel.com|txxx.*|txxxporn.tube|upornia.*|vjav.*|voyeurhit.*|vxxx.com|xjav.tube|xmilf.com
/afon7.$script,1p
/barbar7.$script,1p
! https://github.com/uBlockOrigin/uAssets/issues/10064
/huyass7.$script,1p
/lemon7.$script,1p
/rass7.$script,1p
/teo7.$script,1p
/nofa7.$script,1p
/ytrek7.$script,1p
/kzdh7.$script,1p
/klesd7.$script,1p
/leo7.$script,1p
/howone7.$script,1p
/duayn7.$script,1p
/assets/jwplayer-*/vast.js$script,1p
! https://github.com/uBlockOrigin/uAssets/issues/953
txxx.*##+js(acs, setTimeout, hommy.mutation.mutation)
txxx.*##+js(aopr, jwplayer.utils.Timer)
txxx.*##.content.page.page-video .video-content > div[class] > div > div[class] > div[class][style^="background-image:"]:style(background-image: none !important;)
txxx.*##div[style="display:flex !important"] > div
txxx.*##.page-video > div.video-videos-slider ~ div[class]:matches-css(justify-content: center)
txxx.*##.video-videos-slider
txxx.*##.video-content > div + div:last-child
txxx.*##.video-content > div:first-child > div[class]:has(> div > a[href="#"])
txxx.*##.videos-tube-friends
txxx.*##span:only-child:has-text(/^AD$/):upward(2)
txxx.*##.suggestion
txxx.*##.index-page > .wrapper > .row + div[class]
txxx.*##.pwa-ad
txxx.*##.jw-atitle.nopop:has(> [href*="g2fame.com"][href*="&campaign"])
*$frame,3p,denyallow=google.com|gstatic.com,domain=txxx.*
*$popunder,3p,domain=txxx.*
! https://github.com/uBlockOrigin/uAssets/issues/956
voyeurhit.*##+js(acs, adver)
voyeurhit.*##.content > div > .container + div
voyeurhit.*##.video-page__content > div.left + div[class]:last-child
voyeurhit.*##.video-page__underplayer > div[class]:first-child > div[class]
voyeurhit.*##.video-related + div[class] > div[class]:only-child
voyeurhit.*##div[style="display:flex !important"] > div
voyeurhit.*##.video-tube-friends + div[class]
! https://github.com/uBlockOrigin/uAssets/issues/957
! https://github.com/uBlockOrigin/uAssets/issues/20968#issuecomment-1833320642
upornia.*##+js(acs, adver)
upornia.com##+js(rmnt, script, /popunder|isAdBlock|admvn.src/i)
upornia.com##h5:has-text(Advertisement)
upornia.com##section:not(:empty)
upornia.com##.underplayer:style(min-height: initial !important;)
upornia.com##.video-page__content > .right
upornia.*##.intwo__img
upornia.*##.video-videos-slider
upornia.*##span[style="display:flex !important"] > div:first-child
! https://www.reddit.com/r/uBlockOrigin/comments/1anqltk/video_wont_play/
upornia.*##+js(set, hommy, {})
upornia.*##+js(set, hommy.waitUntil, noopFunc)
upornia.*##.jw-title-secondary
pornzog.com###ntv_a
pornzog.com##.video-ntv-list
! https://github.com/uBlockOrigin/uAssets/issues/2074
hotmovs.*##+js(acs, adver)
hotmovs.com##.partners-wrap
hotmovs.*##.block_label--last + div[class]
hotmovs.*##.pagination + div.block_label--last
hotmovs.*##.underplayer__info > div[class]:first-child
hotmovs.*##.video-page__content > div.left + div[class]:last-child
hotmovs.*##div[style="display:flex !important"] > div
hotmovs.*##.video-page > div.block_label.mt-15 + div[class]
hotmovs.*##.videos-tube-friends
! https://github.com/uBlockOrigin/uAssets/issues/959
*$script,3p,denyallow=gstatic.com,domain=vjav.*
vjav.*##.hv-block
vjav.*##div[style="display:flex !important"] > div
vjav.*##.album-page > div.video-page__wrapper + div[class]
vjav.*##.content > div:not([class]) > div.video-page + div[class]
vjav.*##.video-page__content > div.left + div[class]:last-child
vjav.*##.video-page__player + div[class] > div[class]
vjav.*##.video-tube-friends
vjav.*##.video-tube-friends + div[class]:not(.pagination)
vjav.*##.index-page > div.container + div[class]
vjav.*##.jw-reset.jw-atitle.nopop
vjav.*##.partners-wrap + div[class]
vjav.*##div[class] > div[class] > section[style="padding: 10px;"]
! pornq .com popups
||bitupsss.com^$all
! pornj .com popups
pornj.com##+js(aopr, open)
pornj.com##.vda-item
! pornl.com
pornl.com##+js(aopr, open)
pornl.com##.adv-list--footer
pornl.com##.vda-item
! porn555 .com popups
porn555.com##.vda-x2
! see .xxx
||see.xxx/nr.js
see.xxx##.vda-item
! https://github.com/easylist/easylist/pull/6720
porntop.com###inv_pause
porntop.com##.ip > .btn-close
! https://github.com/easylist/easylist/issues/7918
! https://github.com/AdguardTeam/AdguardFilters/issues/131194
thegay.*##+js(acs, adver)
thegay.*##.content > div:not([class]) > .wrapper ~ div[class]:not(.wrapper)
thegay.*##.underplayer__info > div[class]:first-child
thegay.*##.video-page__content > div.left + div[class]:last-child
thegay.*##div[style="display:flex !important"] > div
||thegay.com^$csp=default-src 'self' *.ahcdn.com fonts.gstatic.com fonts.googleapis.com https://thegay.com https://tn.thegay.com 'unsafe-inline' 'unsafe-eval' data: blob:,badfilter
! privatehomeclips.com
privatehomeclips.com##span[style="display:flex !important"] > div:first-child
privatehomeclips.com##.partners-wrap
privatehomeclips.com##.video-page__content > .right
privatehomeclips.com##.video-page__item
privatehomeclips.com##.content > div > .wrapper + div[class]:not(.wrapper)
privatehomeclips.com##.underplayer > div[class]:not([class*="_"]) > div[class]
privatehomeclips.com##.partners-wrap + div[class]
privatehomeclips.com##.undp--karp
privatehomeclips.com##section[style="padding: 20px;"]
privatehomeclips.com##.left + div:not([class]):last-child
! vxxx.com
vxxx.com##+js(acs, ACtMan)
vxxx.com###player-1 > div[style="display:flex !important"]
vxxx.com##.video-page-content + div[class]
vxxx.com##.video-page-content-left + div[class]:last-child
vxxx.com##.videoplayer + div > div[class]
vxxx.com##.wrapper-margin + div[class]:last-child
! pornhits.com popup/under
pornhits.com##+js(acs, ACtMan)
pornhits.com###s-suggesters
pornhits.com##.ft
pornhits.com##.index-ntv
pornhits.com##.jwplayer > span
pornhits.com##.sponsor
pornhits.com##.right
||pornhits.com/magic/
||red12flyw2.site^$3p
! inporn.com ads/PH
in-porn.com,inporn.com##.video-page__content > div.right
in-porn.com,inporn.com##.video-info > section
in-porn.com,inporn.com##.video__wrapper > div.wrapper.headline
in-porn.com,inporn.com##.wrapper > article
in-porn.com,inporn.com##section[is-footer-banners]
in-porn.com,inporn.com###in_v
in-porn.com,inporn.com##.btn-close
in-porn.com,inporn.com##[style="display:flex !important"] > div > div:not(:last-child)
in-porn.com,inporn.com##.jw-channel-btn.nopop
in-porn.com,inporn.com##.wrapper[style="min-width: 0px;"] > section[style="padding: 12px;"]
! senzuri.tube redirect, ad
senzuri.tube##+js(acs, adver)
senzuri.tube##.video-page + div[class]:not(.container)
senzuri.tube##.video-page__content > div.left + div[class]:last-child
senzuri.tube##.index-page > div.container + div[class]
senzuri.tube##.content-block + .video-tube-friends + div[class]
senzuri.tube##div[style="display:flex !important"] > div
! https://github.com/AdguardTeam/AdguardFilters/issues/130607
txxxporn.tube##+js(acs, adver)
txxxporn.tube##div[style="display:flex !important"] > div
txxxporn.tube##.video-content > div:not(:has(.pplayer))
txxxporn.tube##.video-content > div[class]:first-child > div[class]:has(> div > a[href="#"])
txxxporn.tube##span:only-child:has-text(/^AD$/):upward(2)
! https://www.reddit.com/r/uBlockOrigin/comments/14zn1mz/filter_blocking_related_videos_on_txxxporntube/
txxxporn.tube##.suggestion
txxxporn.tube##.video-videos-slider
txxxporn.tube##.page-video > div[class]:has(> div[class]:not(.video-related) > div[id][class]:empty)
! https://github.com/uBlockOrigin/uAssets/issues/4234
hclips.com##+js(acs, adver)
hclips.com##.wrapper + .partners-wrap + div[class]
hclips.com##.underplayer > section
hclips.com##.video__wrapper > section[style]
hclips.com##span[style="display:flex !important"] > div:first-child
hclips.com##.video-page__content > div.left + div:not([class])
*$frame,3p,denyallow=google.com|gstatic.com,domain=hclips.com
! https://github.com/uBlockOrigin/uAssets/issues/8391
! https://github.com/uBlockOrigin/uAssets/issues/1114
hdzog.*##+js(acs, adver)
hdzog.*##.content > div:not([class]) > div.content-block ~ div[class]:not(.content-block)
hdzog.*##.suggestions
hdzog.*##.partners-wrap
hdzog.*##.pagination +  div[class]:last-of-type
hdzog.*##.video-page__left > div[class]:last-of-type
hdzog.*##div[style="display:flex !important"] > div
! https://www.reddit.com/r/uBlockOrigin/comments/10abahw/
hdzog.*##.video-page__content > div:not([class*="video"])
hdzog.*##.video-page__row > div:not([class*="video"])
! https://tuberel.com/
tuberel.com##+js(acs, adver)
! https://github.com/AdguardTeam/AdguardFilters/issues/156409
sextu.com##.afs_ads + span[style] > div > div:not(:last-child)
sextu.com##.right
sextu.com##.thumbs__banner
sextu.com##.wrapper > article
sextu.com##.wrapper > section
sextu.com##div[id^="underplayer_"]
! https://github.com/AdguardTeam/AdguardFilters/issues/159495
manysex.com,manysex.tube##.suggestion-wrapper
manysex.com,manysex.tube##.right
manysex.com,manysex.tube##.video-page__related + .headline
manysex.com,manysex.tube##.videoplayer + section
manysex.com,manysex.tube##section[style="padding: 12px;"]
manysex.com,manysex.tube##span[style="display:flex !important"] > div > div:not(:last-child)
manysex.com,manysex.tube##.jw-reset.jw-atitle.nopop
! https://github.com/AdguardTeam/AdguardFilters/issues/169195
abxxx.com##.video-page__content > div.left > section
abxxx.com##.video__wrapper > div.wrapper > section
abxxx.com##.video__wrapper > div.wrapper.headline
! https://github.com/AdguardTeam/AdguardFilters/issues/169177
gaytxxx.com##.index-page > div.wrapper > div.row + div[class]
gaytxxx.com##.jw-reset.jw-atitle.nopop
gaytxxx.com##.suggestion + div[class]:has(> .video-related) + div[class]
gaytxxx.com##.undp
gaytxxx.com##.video-content > div[class]:first-child > div[class]:has(> div[class] > div[class] > div[id])
gaytxxx.com##.video-content > div[class] + div[class]:last-child
gaytxxx.com##.wrapper + div[style="margin-top: 0px;"]
gaytxxx.com##div[style="display:flex !important"] > div
! https://github.com/uBlockOrigin/uAssets/issues/1798
shemalez.com##+js(acs, adver)
shemalez.com##+js(aeld, , window.open)
shemalez.com##+js(nosiif, document.readyState)
shemalez.com##.video-page__content > .left  + div[class]
shemalez.com##.video-tube-friends + div[class]
shemalez.com##.content > div > .wrapper + div[class]
shemalez.com##div[style="display:flex !important"] > div
! xjav.tube
xjav.tube##.left > section
xjav.tube##.right
xjav.tube##.video-tube-friends + article
xjav.tube##.wrapper > section[style="padding: 12px;"]
xjav.tube##.wrapper.headline:has(+ .wrapper > section[style="padding: 12px;"])
xjav.tube##span[style="display:flex !important"] > div > div:not(:last-child)
xjav.tube##.jw-channel-btn.nopop

! https://github.com/uBlockOrigin/uAssets/issues/966
mcfucker.com##+js(aopw, t4PP)
sponsor=$domain=mcfucker.com
mcfucker.com##.vadv
mcfucker.com##.c2p

! https://github.com/uBlockOrigin/uAssets/issues/704
! https://github.com/uBlockOrigin/uAssets/issues/10283
imgprime.com##+js(aopr, document.createElement)
imgprime.com##+js(ra, href|target, a[href="https://imgprime.com/view.php"][target="_blank"], complete)
||imgprime.com/*.php$script
imgprime.com##.overlayBg

! https://github.com/uBlockOrigin/uAssets/issues/969
imgshots.com##+js(popads.net)
imgshots.com###introOverlayBg

! https://github.com/uBlockOrigin/uAssets/issues/1005
porn.com##+js(nowoif)
porn.com##+js(set, String.prototype.charAt, trueFunc)

! https://github.com/uBlockOrigin/uAssets/issues/2042
bdupload.*##+js(nano-stb)
bdupload.*##[href*="/dloadbutton.php"]
||bdupload.*/sw.js$script,1p
||socialbars-web5.com/*/notifications/$script

! https://github.com/uBlockOrigin/uAssets/issues/976
taroot-rangi.com##+js(aopw, sc_adv_out)

! https://github.com/uBlockOrigin/uAssets/issues/980
! https://github.com/AdguardTeam/AdguardFilters/issues/78763
pornwatchers.com##+js(aopr, ExoLoader)
pornwatchers.com##+js(aopr, document.dispatchEvent)
pornwatchers.com##.aside-block
pornwatchers.com##.fluid_nonLinear_bottom
pornwatchers.com##.stage-promo
##.aff-content-col
##.aff-inner-col
##.aff-item-list
||pornwatchers.com/sw.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/983
sotemnovinhas.com##+js(nofab)
||sotemnovinhas.com/*.gif$image

! https://github.com/uBlockOrigin/uAssets/issues/5421
ondemandkorea.com##+js(aopr, pbjs.libLoaded)
ondemandkorea.com##.banner_728x90
ondemandkorea.com##.floatBanner
ondemandkorea.com##.player_overlay.banner
@@||ondemandkorea.com^$ghide
||ondemandkorea.com/*/*sponsor*300x250.jpg$image,redirect=32x32.png
||google-analytics.com/collect$image,redirect=1x1.gif,domain=ondemandkorea.com

! https://github.com/uBlockOrigin/uAssets/issues/978
katestube.com##+js(nostif, '0x)
katestube.com##+js(nowoif)
katestube.com##.bottom-banners
katestube.com##.advertising
katestube.com###under-video

! https://github.com/uBlockOrigin/uAssets/issues/979
gotporn.com##+js(aeld, , open)
gotporn.com##+js(aopr, ExoLoader)

! https://github.com/easylist/easylist/issues/11901
! https://github.com/AdguardTeam/AdguardFilters/issues/129925
! https://github.com/AdguardTeam/AdguardFilters/issues/130267
! https://github.com/AdguardTeam/AdguardFilters/issues/131192
bdsmx.tube##+js(aopr, mz)
bdsmx.tube##.btn-close
bdsmx.tube##article
blackporn.tube,xmilf.com##.right
blackporn.tube,mrgay.tube##.video-info > section
blackporn.tube,mrgay.tube,xmilf.com##.wrapper > section
blackporn.tube,mrgay.tube,xmilf.com##article > section
bdsmx.tube,blackporn.tube,mrgay.tube,xmilf.com##[is-footer-banners]
bdsmx.tube,blackporn.tube,mrgay.tube,xmilf.com##.headline.wrapper
bdsmx.tube,blackporn.tube,mrgay.tube,xmilf.com##[style="display:flex !important"] > div > div:not(:last-child)
mrgay.*##.right

! https://github.com/uBlockOrigin/uAssets/issues/992
||googlesyndication.com^$script,important,domain=mypapercraft.net
mypapercraft.net##+js(nofab)
mypapercraft.net##.ezoic-ad

! https://github.com/uBlockOrigin/uAssets/issues/985
sintelevisor.com,tvpor-internet.com##+js(nowebrtc)
||livesports.pw/adblock.js$script,1p,redirect=fuckadblock.js-3.2.0
@@||sintelevisor.com^$ghide
||sintelevisor.com/tv/asarasa.html$frame,1p
sintelevisor.com###floatLayer

! https://github.com/uBlockOrigin/uAssets/issues/993
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=supergames.com
||adservice.google.com.*/adsid/integrator.js?domain=player.tubia.com$xhr,redirect=nooptext

! https://github.com/uBlockOrigin/uAssets/issues/801
! https://github.com/uBlockOrigin/uAssets/issues/4084
tune.pk###tpk-revenue-sharing-program
tune.pk##+js(set, ad_blocker, false)

! https://github.com/uBlockOrigin/uAssets/issues/5339
europixhd.*,hdeuropix.*,topeuropix.*##+js(aopr, AaDetector)
europixhd.*,hdeuropix.*,topeuropix.*##+js(aopr, LieDetector)
europixhd.*,hdeuropix.*,topeuropix.*##+js(popads-dummy)
europixhd.*,hdeuropix.*,hindipix.*,topeuropix.*##+js(disable-newtab-links)
europixhd.*,topeuropix.*##+js(nowoif)
topeuropix.*##+js(aeld, , _0x)
||europixhd.net/js/propadbl_epxhd.js$script,1p
europixhd.*,hdeuropix.*,topeuropix.*###MyImageId
@@|blob:$domain=hdeuropix.cc
europixhd.*,topeuropix.*##[id^="MyAdsId"]

! https://forums.lanik.us/viewtopic.php?p=129417#p129417
$script,domain=zdnet.fr,3p
@@||ajax.googleapis.com^$script,domain=zdnet.fr

! https://github.com/uBlockOrigin/uAssets/issues/1010
pornxs.com##+js(acs, ExoLoader)
pornxs.com##+js(aopr, _abb)
||pornxs.com/*.php
pornxs.com##[id^="div_theAd"]
pornxs.com##[data-ad-index-parent]

! https://github.com/uBlockOrigin/uAssets/issues/1013
||megayoungsex.com/func.js
megayoungsex.com##.SAbnsBotBl
megayoungsex.com##.SHVidBlockUndBn
megayoungsex.com##.SHVidBlockR

! https://github.com/uBlockOrigin/uAssets/issues/1014
mangoporn.net##+js(acs, puShown, /doOpen|popundr/)
mangoporn.net##+js(aopr, document.dispatchEvent)
mangoporn.net##+js(aopw, pURL)
mangoporn.net##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/1020
frprn.com##+js(nosiif, readyState)
frprn.com##.spot
frprn.com##.footer-spot

! watchseries.unblocked.* popups
watchseries.unblocked.*##+js(nowebrtc)
vidlox.*##A[href$=".html"][rel="nofollow norefferer noopener"]

! https://github.com/uBlockOrigin/uAssets/issues/1024
@@||arkadiumhosted.com^$script,domain=arkadiumarena.com|games.baltimoresun.com|games.chicagotribune.com|games.dailypress.com|games.express.co.uk|games.mcall.com|games.nydailynews.com|games.orlandosentinel.com|games.sun-sentinel.com|puzzles.bestforpuzzles.com
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=arkadiumarena.com|games.baltimoresun.com|games.chicagotribune.com|games.dailypress.com|games.express.co.uk|games.mcall.com|games.nydailynews.com|games.orlandosentinel.com|games.sun-sentinel.com|juegos.elpais.com|puzzles.bestforpuzzles.com|games.startribune.com
||arkadiumhosted.com/*/adsBlob/$xhr,domain=bestforpuzzles.com|charlotteobserver.com|independent.co.uk|miamiherald.com|standard.co.uk|word.tips
##[class^="DisplayAd"]
##.ark-ad-message
##div[class*="displayAdRight"]
! https://www.reddit.com/r/uBlockOrigin/comments/pmutke/
! https://www.reddit.com/r/uBlockOrigin/comments/tp3gtr/how_to_get_rid_of_antiadblock_on_site_could_you/
puzzles.standard.co.uk,puzzles.independent.co.uk,puzzles.bestforpuzzles.com,arkadiumarena.com,games.charlotteobserver.com,games.miamiherald.com,games.startribune.com,games.word.tips##+js(nano-sib, generalTimeLeft, *, 0.02)
@@*$ghide,domain=games.startribune.com|games.charlotteobserver.com|games.miamiherald.com|games.word.tips|puzzles.bestforpuzzles.com|puzzles.independent.co.uk|puzzles.standard.co.uk
puzzles.standard.co.uk,puzzles.independent.co.uk,puzzles.bestforpuzzles.com,games.charlotteobserver.com,games.miamiherald.com,games.startribune.com,games.word.tips##[class*="Ad"]

@@*$ghide,domain=arcade.buzzrtv.com|arcade.lemonde.fr|arena.gamesforthebrain.com|bestpuzzlesandgames.com|cointiply.arkadiumarena.com|gamelab.com|games.abqjournal.com|games.amny.com|games.bellinghamherald.com|games.besthealthmag.ca|games.bnd.com|games.boston.com|games.bostonglobe.com|games.bradenton.com|games.centredaily.com|games.cnhinews.com|games.crosswordgiant.com|games.dallasnews.com|games.daytondailynews.com|games.denverpost.com|games.everythingzoomer.com|games.fresnobee.com|games.gameshownetwork.com|games.get.tv|games.greatergood.com|games.heraldonline.com|games.heraldsun.com|games.idahostatesman.com|games.insp.com|games.islandpacket.com|games.journal-news.com|games.kansas.com|games.kansascity.com|games.kentucky.com|games.lancasteronline.com|games.ledger-enquirer.com|games.macon.com|games.mercedsunstar.com|games.modbee.com|games.moviestvnetwork.com|games.myrtlebeachonline.com|games.nationalreview.com|games.newsobserver.com|games.parade.com|games.pressdemocrat.com|games.puzzlebaron.com|games.puzzler.com|games.puzzles.ca|games.qns.com|games.readersdigest.ca|games.sacbee.com|games.sanluisobispo.com|games.sixtyandme.com|games.sltrib.com|games.springfieldnewssun.com|games.star-telegram.com|games.sunherald.com|games.theadvocate.com|games.thenewstribune.com|games.theolympian.com|games.theportugalnews.com|games.thestar.com|games.thestate.com|games.tri-cityherald.com|games.triviatoday.com|games.usnews.com|games.wordgenius.com|games.wtop.com|jeux.meteocity.com|juegos.as.com|juegos.elnuevoherald.com|juegos.elpais.com|philly.arkadiumarena.com|play.dictionary.com|puzzles.centralmaine.com|puzzles.crosswordsolver.org|puzzles.nola.com|puzzles.pressherald.com|puzzles.sunjournal.com
arcade.buzzrtv.com,arcade.lemonde.fr,arena.gamesforthebrain.com,bestpuzzlesandgames.com,cointiply.arkadiumarena.com,gamelab.com,games.abqjournal.com,games.ajc.com,games.amny.com,games.bellinghamherald.com,games.besthealthmag.ca,games.bnd.com,games.boston.com,games.bostonglobe.com,games.bradenton.com,games.centredaily.com,games.cnhinews.com,games.crosswordgiant.com,games.dallasnews.com,games.daytondailynews.com,games.denverpost.com,games.everythingzoomer.com,games.fresnobee.com,games.gameshownetwork.com,games.get.tv,games.greatergood.com,games.heraldonline.com,games.heraldsun.com,games.idahostatesman.com,games.insp.com,games.islandpacket.com,games.journal-news.com,games.kansas.com,games.kansascity.com,games.kentucky.com,games.lancasteronline.com,games.ledger-enquirer.com,games.macon.com,games.mercedsunstar.com,games.modbee.com,games.moviestvnetwork.com,games.myrtlebeachonline.com,games.nationalreview.com,games.newsobserver.com,games.parade.com,games.pressdemocrat.com,games.puzzlebaron.com,games.puzzler.com,games.puzzles.ca,games.qns.com,games.readersdigest.ca,games.sacbee.com,games.sanluisobispo.com,games.sixtyandme.com,games.sltrib.com,games.springfieldnewssun.com,games.star-telegram.com,games.sunherald.com,games.theadvocate.com,games.thenewstribune.com,games.theolympian.com,games.theportugalnews.com,games.thestar.com,games.thestate.com,games.tri-cityherald.com,games.triviatoday.com,games.usnews.com,games.vgwplay.com,games.wordgenius.com,games.wtop.com,jeux.meteocity.com,juegos.as.com,juegos.elnuevoherald.com,juegos.elpais.com,philly.arkadiumarena.com,play.dictionary.com,puzzles.centralmaine.com,puzzles.crosswordsolver.org,puzzles.nola.com,puzzles.pressherald.com,puzzles.sunjournal.com##+js(nano-sib)
arcade.buzzrtv.com,arcade.lemonde.fr,arena.gamesforthebrain.com,bestpuzzlesandgames.com,cointiply.arkadiumarena.com,gamelab.com,games.abqjournal.com,games.ajc.com,games.amny.com,games.bellinghamherald.com,games.besthealthmag.ca,games.bnd.com,games.boston.com,games.bostonglobe.com,games.bradenton.com,games.centredaily.com,games.cnhinews.com,games.crosswordgiant.com,games.dallasnews.com,games.daytondailynews.com,games.denverpost.com,games.everythingzoomer.com,games.fresnobee.com,games.gameshownetwork.com,games.get.tv,games.greatergood.com,games.heraldonline.com,games.heraldsun.com,games.idahostatesman.com,games.insp.com,games.islandpacket.com,games.journal-news.com,games.kansas.com,games.kansascity.com,games.kentucky.com,games.lancasteronline.com,games.ledger-enquirer.com,games.macon.com,games.mercedsunstar.com,games.modbee.com,games.moviestvnetwork.com,games.myrtlebeachonline.com,games.nationalreview.com,games.newsobserver.com,games.parade.com,games.pressdemocrat.com,games.puzzlebaron.com,games.puzzler.com,games.puzzles.ca,games.qns.com,games.readersdigest.ca,games.sacbee.com,games.sanluisobispo.com,games.sixtyandme.com,games.sltrib.com,games.springfieldnewssun.com,games.star-telegram.com,games.sunherald.com,games.theadvocate.com,games.thenewstribune.com,games.theolympian.com,games.theportugalnews.com,games.thestar.com,games.thestate.com,games.tri-cityherald.com,games.triviatoday.com,games.usnews.com,games.wordgenius.com,games.wtop.com,jeux.meteocity.com,juegos.as.com,juegos.elnuevoherald.com,juegos.elpais.com,philly.arkadiumarena.com,play.dictionary.com,puzzles.centralmaine.com,puzzles.crosswordsolver.org,puzzles.nola.com,puzzles.pressherald.com,puzzles.sunjournal.com##[class^="DisplayAd__container"]
*/advertisement/video/static/advantage.xml$xhr

! https://www.reddit.com/r/uBlockOrigin/comments/7kg792/need_help_blocking_this_persistent_ad/
nwanime.tv##+js(nowoif)
nwanime.tv##.adf-float

! https://github.com/uBlockOrigin/uAssets/commit/91f936dbaeaa681fab4d9259a818458db2200e74#commitcomment-26342002
/all-for-adsense/*

! https://github.com/uBlockOrigin/uAssets/issues/1045
ah-me.com##+js(acs, $, serve)
ah-me.com##+js(aopr, open)

! https://github.com/uBlockOrigin/uAssets/issues/1046
! https://github.com/uBlockOrigin/uAssets/issues/1052
||hprofits.com^$domain=gogaytube.tv|shemaleporntube.tv
gogaytube.tv,shemaleporntube.tv##.videojs-hero
/iframe.php?spotID=

! https://forums.lanik.us/viewtopic.php?p=129648#p129648
@@||mdsrwdassets-a.akamaihd.net^$xhr,script,other,domain=telecinco.es|cuatro.com
@@||imasdk.googleapis.com/js/sdkloader/ima3_dai.js$script,domain=telecinco.es|cuatro.com
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=telecinco.es|cuatro.com
@@||cuatro.com^$ghide
@@||telecinco.es^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/1051
! https://github.com/uBlockOrigin/uAssets/issues/2752
! https://github.com/uBlockOrigin/uAssets/issues/1235
! https://github.com/uBlockOrigin/uAssets/issues/2754
! https://github.com/uBlockOrigin/uAssets/issues/3055
ouo.*##+js(aopr, AaDetector)
ouo.*##+js(nowebrtc)
ouo.*##+js(nano-sib, stop())
ouo.*##^script:has-text('shift')
ouo.*##^script:has-text(\'shift\')
ouo.*##[style*="width:300px"] > a[href][target="_blank"] > img
||ouo.*/js/jbitly.js$script,1p
||ouo.*/js/webpush.ma.js$script,1p
||ouo.*/sw$script,1p
*$script,redirect-rule=noopjs,domain=ouo.*
||egnatius-ear.com^$script,domain=ouo.*
ouo.*##[href^="https://dynamicadx.com/"]
ouo.*##iframe:not([src])
ouo.*##[id*="ScriptRoot"]
ouo.*##.dlbtns
ouo.press##.skip-container > .text-center > span[style="display: block;color: #aaa;font-size: 13px;padding-bottom: 2px;"]

! https://github.com/uBlockOrigin/uAssets/issues/1057
chooyomi.com##+js(nowoif)
*$script,3p,denyallow=google.com|gstatic.com|recaptcha.net,domain=chooyomi.com

! https://github.com/uBlockOrigin/uAssets/issues/4225#issuecomment-449619422
! https://github.com/NanoMeow/QuickReports/issues/1048
x1337x.*##[href*=".php"]
1337x.*,x1337x.*,1337x.unblock2.xyz,1337x.unblocked.*,1337x.unblockit.*##ul > li:has-text(/‌/i)
1337x.*,x1337x.*,1337x.unblock2.xyz,1337x.unblocked.*,1337x.unblockit.*##:xpath('//*[contains(text(),"Hide your IP")]/..')
1337x.unblock2.xyz,1337x.unblockit.*##+js(aopr, btoa)
1337x.unblock2.xyz,1337x.unblocked.*,1337x.unblockit.*##+js(aopr, open)
1337x.unblock2.xyz##+js(aopr, Math.floor)
1337x.unblocked.*###lb-banner
1337x.*,1337x.unblockit.*##a[href$="Promo.php"] > img
||topblockchainsolutions.*^$all

! https://github.com/uBlockOrigin/uAssets/issues/1063
xiaopan.co##+js(aopw, AdBlockDetectorWorkaround)

! https://github.com/uBlockOrigin/uAssets/issues/1064
shooshtime.com##+js(nowoif)
||monad.network^$script,domain=shooshtime.com

! https://github.com/uBlockOrigin/uAssets/issues/1663
seattletimes.com##+js(nostif, apstagLOADED)

! https://github.com/uBlockOrigin/uAssets/issues/1068
noticias.gospelmais.com.br##+js(set, blockAdBlock, true)

! https://github.com/uBlockOrigin/uAssets/issues/1070
songs.*##+js(aopr, AaDetector)

! https://github.com/uBlockOrigin/uAssets/issues/1076
mel.fm##+js(nofab)

! https://github.com/uBlockOrigin/uAssets/issues/1083
@@||spiele.heise.de^$ghide
heise.de###topBannerContainer
heise.de##.keygameBannerContainer
heise.de##.ad-microsites
heise.de##.tipps-content-ad
heise.de##.hbs-ad
heise.de##.stage-advertising
heise.de##.ad

! https://github.com/uBlockOrigin/uAssets/issues/1101
dailygeekshow.com##+js(aopr, jQuery.hello)

! https://github.com/uBlockOrigin/uAssets/issues/1093
! https://www.reddit.com/r/uBlockOrigin/comments/otw7nq/adblock_detected/
@@||seirsanduk.*^$ghide
@@||seirsanduk.*/$script,1p
seirsanduk.*##+js(popads.net)
seirsanduk.*##[href^="https://www.bybit.com/"]
seirsanduk.*##ins.adsbygoogle
seirsanduk.*##[href^="//bgtop.net/"]

! https://github.com/uBlockOrigin/uAssets/issues/1099
! https://github.com/uBlockOrigin/uAssets/issues/21880
! https://github.com/uBlockOrigin/uAssets/issues/23845
bestgames.com,yiv.com##+js(nostif, /Adb|moneyDetect/)
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=bestgames.com|yiv.com,redirect-rule=google-ima.js
bestgames.com,yiv.com#@##adsContainer
bestgames.com,yiv.com###LeftAdDiv
bestgames.com,yiv.com###game_middle_ad
bestgames.com,yiv.com###RightAdTopDiv
bestgames.com,yiv.com###RightAdMiddleDiv

! https://github.com/uBlockOrigin/uAssets/issues/1090
jacquieetmicheltv.net##+js(set, is_adblocked, false)
jacquieetmicheltv.net##+js(set, showPopunder, noopFunc)
jacquieetmicheltv.net##.espace-cam
||easysexe.com^$3p
||tawenda-tech.net^$frame,3p
||rencontres-coquines.jacquieetmichel.net^

! https://github.com/uBlockOrigin/uAssets/issues/1087
gotgayporn.com##+js(aopr, decodeURI)
||gotgayporn.com/sw.js$script,1p

! https://github.com/jspenguin2017/uBlockProtector/issues/771
rue89lyon.fr##+js(aopr, isShowingAd)

! https://forums.lanik.us/viewtopic.php?f=62&t=38298
kitguru.net##body:style(background-image:none !important)

! https://github.com/uBlockOrigin/uAssets/issues/7062
! https://github.com/uBlockOrigin/uAssets/issues/16657
viki.com##+js(set, VikiPlayer.prototype.pingAbFactor, noopFunc)
viki.com##+js(set, player.options.disableAds, true)
*expire=$media,redirect=noopmp3-0.1s,domain=viki.com
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect-rule=google-ima.js,domain=viki.com

! https://github.com/uBlockOrigin/uAssets/issues/1115
realgfporn.com##+js(aopr, ExoLoader)
realgfporn.com##+js(aopw, __htapop)
realgfporn.com##+js(popads-dummy)
realgfporn.com##+js(aopr, ExoLoader.serve)
realgfporn.com##+js(aeld, click, exopop)
realgfporn.com##+js(aeld, /^(?:load|click)$/, popMagic)
realgfporn.com##+js(acs, document.createElement, 'script')
realgfporn.com###fixedBanner
realgfporn.com##.overlay-banner
realgfporn.com##.video-overlay
realgfporn.com##.banner-video-right
||realgfporn.com/sw.js$script,1p
*$popunder,domain=realgfporn.com

! https://github.com/uBlockOrigin/uAssets/issues/1122
picturelol.com###rang2
picturelol.com##+js(aopr, ExoLoader)
picturelol.com##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/1123
imgspice.com##+js(nowoif)
imgspice.com##+js(aopr, ExoLoader)
imgspice.com##+js(aeld, mousedown, popundrInit)
imgspice.com###widepage
imgspice.com###interdiv

! https://github.com/uBlockOrigin/uAssets/issues/1128
mitly.us##+js(aopr, adBlockDetected)
mitly.us##+js(aopr, open)
mitly.us##+js(aopw, adcashMacros)
mitly.us##+js(aopw, atOptions)
mitly.us##+js(set, blurred, false)
@@||mitly.us^$ghide
*$script,3p,denyallow=google.com|gstatic.com|recaptcha.net,domain=mitly.us
||googlesyndication.com/pagead/$script,redirect=noopjs,domain=mitly.us
mitly.us##ins.adsbygoogle
mitly.us##[href^="http://deloplen.com/"]

! https://forums.lanik.us/viewtopic.php?p=138269#p138269
! https://github.com/AdguardTeam/AdguardFilters/issues/80460
watch-series.*,watchseries.*##+js(acs, Math, XMLHttpRequest)
watch-series.*,watchseries.*##+js(nowebrtc)
watch-series.*,watchseries.*##+js(nowoif)
watch-series.*,watchseries.*##+js(set, console.clear, trueFunc)
watch-series.*,watchseries.*##.freeEpisode
watch-series.*,watchseries.*##.sp-leader
watch-series.*,watchseries.*##.shd_button
watch-series.*,watchseries.*##.sp-leader-bottom
watch-series.*,watchseries.*##.category-item-ad
watch-series.*,watchseries.*###related
watch-series.*,watchseries.*###rotating-item-wrapper
watch-series.*,watchseries.*##div.block-left-home-inside[style^="height:252"]
@@||watchseries.*^$ghide
||watch-series.*/sw.js$script,1p
! https://github.com/uBlockOrigin/uAssets/issues/5723
||watchseries.*/sw.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/1132
fetishshrine.com##+js(aopr, decodeURI)
fetishshrine.com##.adv-aside

! https://github.com/uBlockOrigin/uAssets/issues/1133
sleazyneasy.com##+js(aopr, decodeURI)
sleazyneasy.com##+js(set, flashvars.adv_pre_vast, '')
sleazyneasy.com##+js(set, flashvars.adv_pre_vast_alt, '')
sleazyneasy.com##+js(set, x_width, 1)
/contents/images-banners/*
sleazyneasy.com##.container-aside > .item
sleazyneasy.com##.remove-spots

! https://github.com/uBlockOrigin/uAssets/issues/1131
vikiporn.com##+js(aeld, getexoloader)
vikiporn.com##+js(aopr, decodeURI)

! https://github.com/NanoMeow/QuickReports/issues/2426
@@||anime-loads.org^$ghide
anime-loads.org###leaderwidget
anime-loads.org##.skycontent
/static/js/amvn.js

! https://github.com/reek/anti-adblock-killer/issues/3825
! https://www.reddit.com/r/uBlockOrigin/comments/l0vsp6/globalrph_blurs_the_webpage_upon_detecting_adblock/
globalrph.com##+js(nostif, disableDeveloper)

! https://github.com/jspenguin2017/uBlockProtector/issues/755
onlinemschool.com##+js(aopr, oms.ads_detect)
onlinemschool.com###oms_left_block

! https://github.com/uBlockOrigin/uAssets/issues/1144
e-glossa.it##+js(nostif, Blocco, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/1151
pornsocket.com##+js(set, _site_ads_ns, true)
||adspaces.ero-advertising.com/adspace/*$script,redirect=noopjs,domain=pornsocket.com

! http://forum.chip.de/rund-um-online/werbeterror-spendenaufruf-pic-upload-de-microsoft-alarm-u-google-benachr-1879678.html
pic-upload.de##+js(aopw, Fingerprint2)

! https://twitter.com/tj_fogarty/status/948169965546430464
limerickleader.ie###abr_purchase_div

! https://github.com/uBlockOrigin/uAssets/issues/3761
pornhd.com##+js(aopr, hasAdBlock)
pornhd.com,pornhdin.com##+js(aopr, ExoLoader.serve)
pornhd.com##+js(popads-dummy)
pornhd.com##+js(nowoif)
pornhd.com##+js(aeld, , pop)
pornhdin.com##+js(aopr, open)
||syndication.exoclick.com/ads-iframe-display.php$script,redirect=noopjs,domain=pornhd.com
pornhd.com##.phdZone
pornhd.com##.overlay-content
pornhd.com##.video-list-corner-ad
##.inplayer-ad

! https://github.com/uBlockOrigin/uAssets/issues/2375
! https://github.com/uBlockOrigin/uAssets/issues/18091
luxuretv.com##+js(acs, $, ltvModal)
luxuretv.com##iframe[data-src^="https://networkmanag.com/"]
luxuretv.com##+js(set, luxuretv.config, '')
luxuretv.com##+js(aopr, popns)

! https://github.com/uBlockOrigin/uAssets/issues/1161
! https://github.com/uBlockOrigin/uAssets/issues/19368
*$script,3p,denyallow=gstatic.com|polyfill.io,domain=sexu.com
||sexu.com^$frame,1p
sexu.com##.footerBanners
sexu.com###jw_video_popup
sexu.com##.container > .info
sexu.com##.player-related
sexu.com##.player-block__line
sexu.com##.title--sm
sexu.com##.player-block__square

! https://github.com/uBlockOrigin/uAssets/issues/3616
pussyspace.*##+js(aopr, open)
pussyspace.com,pussyspace.net##+js(aost, navigator.userAgent, exopop.browser.is)
pussyspace.com,pussyspace.net##+js(aeld, load, exoJsPop101)
pussyspace.com,pussyspace.net##+js(norafif, exoframe)
pussyspace.com,pussyspace.net##+js(aeld, /^loadex/)
pussyspace.com,pussyspace.net##a[href$="/live/meet-and-fuck/"]
pussyspace.com,pussyspace.net##a:matches-attr(/^on/=/event/)
pussyspace.com,pussyspace.net##a:matches-attr(/-h?ref/)
pussyspace.com,pussyspace.net###alphabet, #channels, #divx-container, #hmenu, #inform, #nowlooking, #playerCamBox, #playerMenu, #qcat, #showPlayer, #tabel_tagslist, #video_content, #web_cam, .BaseRoomContents, .buttons, .carouselTopScroll, .carusel-keys-box-ps, .footerdesc, .in_top, .load_more_rel, .mainBoxTitle, .pagIno, .playerContent100pr, .relatedVideo, .right-160px, .videos-related, footer, header, [href^="/webcams.php"]:others()
||pussyspace.$image
||pussyspace.*/live/meet-and-fuck/$all
@@||www.pussyspace.com/favicon.ico|
@@||www.pussyspace.com/ajax/contact/exo-logo.png|
@@||www.pussyspace.com/class/captcha/captcha.php|
@@||www.pussyspace.com/class/captcha/arrow.png|
@@||www.pussyspace.com/player/loading.gif|
@@||www.pussyspace.com/style/img/abuse.email.png#|
@@||www.pussyspace.com/style/img/navbg.hover.png|
@@||www.pussyspace.com/upload/no_img.jpg|
@@||www.pussyspace.net/favicon.ico|
@@||www.pussyspace.net/ajax/contact/exo-logo.png|
@@||www.pussyspace.net/class/captcha/captcha.php|
@@||www.pussyspace.net/class/captcha/arrow.png|
@@||www.pussyspace.net/player/loading.gif|
@@||www.pussyspace.net/style/img/abuse.email.png#|
@@||www.pussyspace.net/style/img/navbg.hover.png|
@@||www.pussyspace.net/upload/no_img.jpg|
@@||st.pussyspace.com/player/playBTN.png|
@@||st.pussyspace.com/favicon.ico|
@@||st.pussyspace.com/style/03/img/bg.png|
@@||st.pussyspace.com/style/03/img/dropmenudownarrow.png|
@@||st.pussyspace.com/style/03/img/navbg.hover.png|
@@||st.pussyspace.com/style/03/img/navbg.png|
@@||st.pussyspace.com/style/03/img/pinkbg.gif|
@@||st.pussyspace.com/style/03/img/speed-dials.png|
@@||st.pussyspace.com/style/03/img/x-sprite.png|
@@||st.pussyspace.com/style/10/img/logo.png|
@@||st.pussyspace.com/style/10/img/logo_mobile.png|
@@||st.pussyspace.com/style/webcam.jpg|
@@||st.pussyspace.net/player/playBTN.png|
@@||st.pussyspace.net/favicon.ico|
@@||st.pussyspace.net/style/03/img/bg.png|
@@||st.pussyspace.net/style/03/img/dropmenudownarrow.png|
@@||st.pussyspace.net/style/03/img/navbg.hover.png|
@@||st.pussyspace.net/style/03/img/navbg.png|
@@||st.pussyspace.net/style/03/img/pinkbg.gif|
@@||st.pussyspace.net/style/03/img/speed-dials.png|
@@||st.pussyspace.net/style/03/img/x-sprite.png|
@@||st.pussyspace.net/style/10/img/logo.png|
@@||st.pussyspace.net/style/10/img/logo_mobile.png|
@@||st.pussyspace.net/style/webcam.jpg|
@@/^https:\/\/[a-z]\.pussyspace\.(?:com|net)\/(?:yip?|xvs)\/videos\/20\d{4}\/\d{2}\/\d{9}\/(?:original|thumbs_\d{2})\/\d{1,2}(?:\(m=e[0-9A-Za-z]{5,7}aaaa\)\(mh=[-_0-9A-Za-z]{16}\))?\.jpg$/$image,1p,domain=pussyspace.*
@@/^https:\/\/[a-z]\.pussyspace\.(?:com|net)\/(?:yip?|xvs)\/videos\/thumbs169l\/[0-9a-f]{2}\/[0-9a-f]{2}\/[0-9a-f]{2}\/[0-9a-f]{32}(?:-\d)?\/[0-9a-f]{32}\.\d{1,2}\.jpg$/$image,1p,domain=pussyspace.*
@@/^https:\/\/[a-z]\.pussyspace\.(?:com|net)\/(?:yip?|xvs)\/videos\/thumbs_5\/\d{1,2}(?:\(m=e[0-9A-Za-z]{5,7}aaaa\)\(mh=[-_0-9A-Za-z]{16}\))?\.jpg$/$image,1p,domain=pussyspace.*
@@/^https:\/\/[a-z]\.pussyspace\.(?:com|net)\/jz\/(?:[0-9a-f]\/){3,5}[0-9a-f]{42}-?(?:\d{2,3}|(?:(?:\d{3,4}-){3}h264)?\.(?:mp4-\d{1,2}|flv-\d))\.jpg$/$image,1p,domain=pussyspace.*
@@/^https:\/\/[a-z]\.pussyspace\.(?:com|net)\/sb\/t\/\d{6,8}\/\d\/\d\/w:300\/t\d{1,2}-enh\/(?:[0-9a-z]+-)*[0-9a-z]+\.jpg$/$image,1p,domain=pussyspace.*
@@/^https:\/\/st\.pussyspace\.(?:com|net)\/upload\/cat\.image\/[_3a-z]{2,16}\.jpg$/$image,1p,domain=pussyspace.*
@@/^https:\/\/st\.pussyspace\.(?:com|net)\/upload\/poster_img_url\/par\/c3Rhci9[%0-9A-Za-z]{16,32}&size_width\/par\/160\/l\.jpg$/$image,1p,domain=pussyspace.*
||pussyspace.*/js/all.js?v=gitcache_gulp_
||pussyspace.*/lazyload.im
/click.php?$popup,3p,domain=pussyspace.com|pussyspace.net
*$image,3p,denyallow=cdn77.org|fpbns.net|globalcdn.co|others-cdn.com|rncdn7.com|sb-cd.com|stream.highwebmedia.com|upsiloncdn.net|xvideos-cdn.com|youjizz.com|ypncdn.com,from=pussyspace.com|pussyspace.net

! https://github.com/uBlockOrigin/uAssets/commit/fd983e43ba12355945f0f0bc836006df299d1106#commitcomment-32736940
||propbigo.com/*.xml$xhr,redirect=nooptext
||doathair.com^

! https://github.com/uBlockOrigin/uAssets/issues/1179
bigtitsxxxsex.com##+js(aopr, ALoader)
bigtitsxxxsex.com##+js(nowoif)
bigtitsxxxsex.com##+js(noeval)
bigtitsxxxsex.com##.bano1

! https://github.com/uBlockOrigin/uAssets/issues/3768
||adn.porndig.com^
||videos.porndig.com/js/videojs.logobrand.js
porndig.com##+js(set, Object.prototype.AdOverlay, noopFunc)
porndig.com##+js(set, tkn_popunder, null)
||porndig.com/sw$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/1181
! https://github.com/uBlockOrigin/uAssets/issues/4654
@@||mamahd.*^$ghide
||mamahd.*/hd.php$frame

! https://github.com/uBlockOrigin/uAssets/issues/1185
perfectgirls.*,perfektdamen.*##+js(acs, ExoLoader)
perfectgirls.*,perfektdamen.*##+js(aopw, ads_priv)
perfectgirls.*,perfektdamen.*##+js(noeval)
perfectgirls.*,perfektdamen.*##.advertisement
perfectgirls.*,perfektdamen.*##.promo

! https://github.com/uBlockOrigin/uAssets/issues/1182
area51.porn##+js(aopr, document.dispatchEvent)
area51.porn##.under-video-banner

! https://github.com/uBlockOrigin/uAssets/issues/1186
hentaipulse.com##+js(acs, ExoLoader)

! https://github.com/uBlockOrigin/uAssets/issues/1189
1fichier.com##+js(nowebrtc)
1fichier.com##+js(nano-stb, dlw, 40000)

! https://github.com/uBlockOrigin/uAssets/issues/1191
vivud.com##+js(aopr, ALoader)
vivud.com##+js(acs, ExoLoader)
vivud.com##+js(nowoif)
vivud.com##+js(aopr, LieDetector)
||vivud.com/sw$script,1p
vivud.com##+js(aopr, decodeURI)
vivud.com##+js(aopr, Notification)
*.mp4$media,redirect=noopmp3-0.1s,domain=vivud.com
@@/key=$media,domain=vivud.com
||utubeworkers.com/Campaigns/$script,xhr,domain=vivud.com
vivud.com##.adv
##.inplayer_banners
##.in_stream_banner

! https://github.com/uBlockOrigin/uAssets/issues/1202
||googlesyndication.com^$script,important,domain=incredibox.com
@@||incredibox.com/ad/*$xhr,1p

! https://github.com/uBlockOrigin/uAssets/issues/1196
webcheats.com.br##+js(set, can_run_ads, true)
webcheats.com.br##+js(nostif, test, 0)

! https://github.com/uBlockOrigin/uAssets/issues/1167
! https://github.com/uBlockOrigin/uAssets/issues/1199
! https://github.com/uBlockOrigin/uAssets/issues/1200
! https://github.com/uBlockOrigin/uAssets/issues/1201
ceesty.com,gestyy.com##+js(set, adsBlockerDetector, noopFunc)
@@||ceesty.com^$ghide
@@||corneey.com^$ghide
@@||destyy.com^$ghide
@@||festyy.com^$ghide
@@||gestyy.com^$ghide
@@||sh.st^$ghide
ceesty.com,corneey.com,destyy.com,festyy.com,gestyy.com,sh.st##.skip-advert
ceesty.com,corneey.com,destyy.com,festyy.com,gestyy.com,sh.st##+js(set, globalThis, null)
*$3p,xhr,domain=ceesty.com|corneey.com|destyy.com|festyy.com|gestyy.com
ceesty.com,corneey.com,destyy.com,festyy.com,gestyy.com##+js(aopr, NREUM)

! https://github.com/uBlockOrigin/uAssets/issues/1209
imgcloud.pw##+js(popads-dummy)
*$script,3p,denyallow=fastly.net|google.com|googleapis.com|gstatic.com|jsdelivr.net|jwpcdn.com,domain=imgcloud.pw

! https://forums.lanik.us/viewtopic.php?f=62&t=39613
angrybirdsnest.com##+js(set, adblock, false)

! https://github.com/uBlockOrigin/uAssets/issues/1211
nitroflare.com##+js(acs, $, window.open)
nitroflare.com##+js(acs, pop3, window.open)

! https://github.com/uBlockOrigin/uAssets/issues/1223
sexytrunk.com,teensark.com##+js(aopr, document.dispatchEvent)

! https://github.com/uBlockOrigin/uAssets/issues/1224
planetsuzy.org##+js(set, __ads, true)
planetsuzy.org##+js(acs, jQuery, ready)
planetsuzy.org##div[style]:has(> script[src*="ads.exoclick.com/"])

! https://github.com/uBlockOrigin/uAssets/issues/1227
zrozz.com##+js(set, adblock, false)

! https://github.com/uBlockOrigin/uAssets/issues/7021
empflix.com##+js(aopw, popzone)
empflix.com##+js(nowoif)
empflix.com##+js(set, FlixPop.isPopGloballyEnabled, falseFunc)
empflix.com##+js(aeld, , /exo)
tnaflix.com##+js(aopr, ads.pop_url)
tnaflix.com##+js(aeld, getexoloader)
||tnaflix.com/*.php$script,1p
empflix.com,tnaflix.com##.lastLiAvx
tnaflix.com###vidPlayer span:has-text(Advertisement)
tnaflix.com###vidPlayer > div:last-child
tnaflix.com###zoneInPlayer
tnaflix.com##.improveADS
empflix.com##.mewDv
empflix.com##.padAdvx
empflix.com#@##hideAd
empflix.com##.col-xs-6:not([data-vid])
! https://github.com/uBlockOrigin/uAssets/issues/22389
tnaflix.com##+js(set-cookie, popunder_stop, 1)
tnaflix.com##.pause-overlay
||adsession.com^$popup

! https://github.com/uBlockOrigin/uAssets/issues/1233
pornomovies.com##+js(aopr, ExoLoader.serve)
pornomovies.com##+js(aopr, decodeURI)
pornomovies.com##.twocolumns > .viewlist + .aside

! https://github.com/uBlockOrigin/uAssets/issues/1238
urlcero.*##+js(aopr, open)
urlcero.*##+js(nostif, checkAdblockUser, 1000)

! https://github.com/uBlockOrigin/uAssets/issues/1244
onlinetv.planetfools.com##+js(acs, setTimeout, 1000)
planetfools.com##+js(nowebrtc)

! https://forums.lanik.us/viewtopic.php?f=91&t=39633
! https://github.com/uBlockOrigin/uAssets/pull/1248
gala.fr,gentside.com,geo.fr,hbrfrance.fr,nationalgeographic.fr,ohmymag.com,serengo.net,vsd.fr##+js(nostif, checkPub, 6000)

! https://github.com/uBlockOrigin/uAssets/issues/1247
! https://github.com/NanoMeow/QuickReports/issues/1618#issuecomment-517955406
@@||startimez.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/1225
newsextv.com##+js(acs, ExoLoader)
||aa.21pron.com^
anyporn.com##+js(nowoif)
anyporn.com##+js(acs, ExoLoader)
||anyporn.com/if2/

! https://github.com/reek/anti-adblock-killer/issues/3841
||img.stomp.com.sg/sites/all/themes/stompst/images/placeholder.jpg$image
stomp.straitstimes.com##.content:has(> div:has-text(Branded Content))

! https://github.com/NanoAdblocker/NanoFilters/issues/13
linkrex.net##+js(aopr, open)
linkrex.net##+js(aopw, __htapop)
linkrex.net,linx.cc##+js(set, blurred, false)
*$script,3p,denyallow=cloudflare.com|cloudflare.net|google.com|gstatic.com|recaptcha.net,domain=linkrex.net|linx.cc

! https://github.com/uBlockOrigin/uAssets/issues/1274
shrtfly.*##+js(aopr, open)
shrtfly.*##+js(aopr, tabUnder)
@@||shrtfly.*^$ghide
shrtfly.*##ins.adsbygoogle
shrtfly.*##.banner

! https://github.com/uBlockOrigin/uAssets/issues/1273
oke.io##+js(aopr, open)
oke.io##+js(aopw, Fingerprint2)
oke.io##+js(set, blurred, false)

! https://www.reddit.com/r/uBlockOrigin/comments/7pyzt3/lots_of_ads_on_gogoanime/
! https://github.com/uBlockOrigin/uAssets/issues/2256
! https://www.reddit.com/r/uBlockOrigin/comments/94alm0/gogoanimesh_prevalent_ads_bypasses_older/
! https://github.com/uBlockOrigin/uAssets/issues/3710
! https://www.reddit.com/r/uBlockOrigin/comments/aiv8xl/ublock_origin_not_blocking_ads_on_gogoanime/
! https://github.com/uBlockOrigin/uAssets/issues/4991
! https://github.com/uBlockOrigin/uAssets/issues/6953
gogoanime.*##+js(acs, atob, decodeURIComponent)
gogoanime.*,gogoanimes.*##+js(nowoif)
gogoanime.*##+js(set, console.clear, undefined)
gogoanime.*##+js(set, check_adblock, true)
gogoanime.*##+js(acs, document.createElement, /l\.parentNode\.insertBefore\(s/)
gogoanime.*##.banner_center
gogoanime.*##.anime_video_body_cate > div[style]:has(> div[id] + script[src])
gogoanime.*##.adx
gogoanimetv.*##+js(aopr, AaDetector)
gogoanimetv.*##+js(nosiif, _0x)
||gogoanime.*/api/pop.php$xhr,1p
gogoanimetv.*##+js(nowoif)
||gogoanime.me/*.gif$image
/get/*?zoneid=$script

! https://github.com/uBlockOrigin/uAssets/issues/1277
cpmlink.net##+js(acs, decodeURI, decodeURIComponent)
cpmlink.net##+js(nowebrtc)
cpmlink.net##.__web-inspector-hide-shortcut__
*$script,3p,denyallow=cloudflare.com|cloudflare.net|disqus.com|disquscdn.com|fastly.net|fastlylb.net|google.com|googleapis.com|gstatic.com|hcaptcha.com|hwcdn.net|jsdelivr.net|jquery.com|jwpcdn.com|recaptcha.net|tawk.to,domain=cpmlink.net
cpmlink.net##+js(aeld, , _blank)
*$frame,3p,domain=cpmlink.net
cpmlink.net##[href^="https://bit.ly"]
cpmlink.net##iframe[src="about:blank"]

! https://github.com/uBlockOrigin/uAssets/issues/1282
sunporno.com##+js(aopr, ExoLoader.addZone)
sunporno.com##+js(popads-dummy)
sunporno.com##+js(aeld, , ;})
sunporno.com##+js(aopr, console.clear)
sunporno.com##+js(aeld, load, BetterPop)
sunporno.com##+js(aopr, SUN_XER)
sunporno.com##+js(aopr, exoNoExternalUI38djdkjDDJsio96)
*.gif$domain=sunporno.com,image
sunporno.com##.flirt
sunporno.com##.flirt-footer
sunporno.com##.flirt-block
sunporno.com##.thumbs-container > .th-ba
||sunporno.com/*.php$script,1p
sunporno.com##.safelink
/api/model/feed?siteId=$xhr,3p

! https://github.com/uBlockOrigin/uAssets/issues/1285
namethatporn.com##+js(popads-dummy)
namethatporn.com##[data-flba^="https://landing.brazzersnetwork.com"]
||namethatporn.com/assets/imgs/1x1.gif$badfilter
||namethatporn.com/assets/imgs/1x1.gif$frame,redirect=noopframe

! https://github.com/uBlockOrigin/uAssets/issues/1286
magnetdl.com,magnetdl.org##+js(nowoif)
magnetdl.com,magnetdl.org##a[href="/site/vpn/"]
magnetdl.com,magnetdl.org##+js(ra, href, a[href="https://vpn-choice.com"])
magnetdl.com,magnetdl.org##a[href^="https://usenetbay.com/"]

! https://github.com/uBlockOrigin/uAssets/issues/1299
! https://forums.lanik.us/viewtopic.php?t=48326-nsfw-freeviewmovies-com
freeviewmovies.com##+js(aopw, encodeURIComponent)
freeviewmovies.com##+js(set, isAdBlockActive, false)
freeviewmovies.com###pause-container

! https://github.com/uBlockOrigin/uAssets/issues/1298
badjojo.com##+js(aopw, encodeURIComponent)
pornhost.com##+js(aopr, raConf)
badjojo.com##.embed-overlay

! https://github.com/uBlockOrigin/uAssets/issues/1300
eroprofile.com##+js(acs, ExoLoader)
||eroprofile.com/js/nvbla.js
eroprofile.com##.center-block
eroprofile.com###divVideoListAd2

! https://github.com/uBlockOrigin/uAssets/issues/1301
feet9.com##[data-vid^="live-"]:remove()
feet9.com##[href^="https://go.cam.feet9.com/"]:upward(3)
||feet9.com/t/newbuttonyellow.png$image
feet9.com##.pup
feet9.com##.video:has(span:has-text(Live))
! https://github.com/uBlockOrigin/uAssets/issues/1301#issuecomment-1364615843
feet9.com##+js(acs, __ADX_URL_U)
feet9.com##[onclick*="banner"]:upward(.video)
feet9.com##.hvr-pulse
feet9.com##[class^="ig"]
||feet9.com^$csp=worker-src 'none';

! https://github.com/uBlockOrigin/uAssets/issues/1304
locopelis.com##+js(aopr, popTimes)
locopelis.com##+js(aopr, smrtSB)
locopelis.com##+js(aopr, smrtSP)

! https://github.com/uBlockOrigin/uAssets/issues/1297
absoluporn.*##+js(acs, ExoLoader)
@@||chaturbate.com/*embed$frame,domain=absoluporn.com
/code/script/back.php|

! https://github.com/uBlockOrigin/uAssets/issues/4069
short.pe##+js(acs, atob, tabunder)
short.pe##+js(acs, RegExp, POSTBACK_PIXEL)
short.pe##+js(aopr, AaDetector)
short.pe##+js(aopr, console.clear)
short.pe##+js(aeld, mousedown, preventDefault)
short.pe##+js(nowebrtc)
short.pe##+js(nowoif)
short.pe##+js(nostif, '0x)
*$frame,denyallow=google.com|hcaptcha.com,domain=short.pe
short.pe##a[href^="https://href.li/"]
short.pe##body > div[style]:has(input[type="button"])
short.pe##div[style*="z-index:99999"] > div[style*="width:300px"]

! https://github.com/uBlockOrigin/uAssets/issues/1329#issuecomment-627532234
185.153.231.222##+js(nowebrtc)

! https://github.com/uBlockOrigin/uAssets/issues/1330
filespace.com##+js(set, fuckAdBlock, false)

! https://github.com/uBlockOrigin/uAssets/issues/1332
orgyxxxhub.com##+js(aopr, ExoLoader)
orgyxxxhub.com##+js(aopr, Aloader)
orgyxxxhub.com##+js(aopr, advobj)
orgyxxxhub.com##+js(noeval-if, replace)
||orgyxxxhub.com/js/arjlk.js

! https://github.com/uBlockOrigin/uAssets/issues/1324
repelis.net##+js(aopr, popTimes)

! https://github.com/uBlockOrigin/uAssets/issues/1355
pornomico.com##+js(aopr, addElementToBody)
pornomico.com##+js(popads-dummy)
pornomico.com##+js(aopr, decodeURI)
pornomico.com##.vjs-overlay

! https://github.com/uBlockOrigin/uAssets/issues/1356
donkparty.com##+js(aopr, phantomPopunders)
donkparty.com##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/1357
watchmygf.me##+js(noeval)
||watchmygf.me/js/popupimage.js
watchmygf.me##+js(aopr, open)
watchmygf.me##+js(set, $.magnificPopup.open, noopFunc)
watchmygf.me##[href^="https://wct.link/click"]

! https://github.com/uBlockOrigin/uAssets/issues/1358
mylust.com##+js(aopr, document.dispatchEvent)
mylust.com##+js(aopr, console.clear)
mylust.com##.no_pop.centeredbox
mylust.com##iframe.clear_both
mylust.com##div[class^="span"] > div.box:has(> .title > div:has-text(Advertisement))
mylust.com###wrapper > div[style*="height:18px"]
mylust.com##.list_videos_ad
mylust.com###main_video_fluid_html_on_pause
||mylust.com/*.jsx
||mylust.com/assets/script.js

! https://forums.lanik.us/viewtopic.php?f=62&t=39765
! https://github.com/uBlockOrigin/uAssets/issues/4806
deepbrid.com##+js(acs, document.getElementById, undefined)
deepbrid.com##+js(set, adsenseadBlock, noopFunc)

! https://github.com/uBlockOrigin/uAssets/issues/1361
! https://github.com/uBlockOrigin/uAssets/issues/12576
pinsystem.co.uk##+js(aeld, /^(?:click|mousedown)$/, _0x)
@@||pinsystem.co.uk^$ghide
pinsystem.co.uk##ins.adsbygoogle
pinsystem.co.uk##+js(no-xhr-if, /adsbygoogle|doubleclick/)
pinsystem.co.uk##+js(acs, eval, replace)
pinsystem.co.uk##+js(rmnt, script, deblocker)

! https://github.com/uBlockOrigin/uAssets/issues/1374
boysfood.com##+js(aopw, encodeURIComponent)
boysfood.com###pause-container

! https://github.com/uBlockOrigin/uAssets/issues/1375
submityourflicks.com##+js(aopr, ExoLoader.serve)
submityourflicks.com##+js(aopr, decodeURI)
submityourflicks.com##+js(set, flashvars.adv_pause_html, '')
submityourflicks.com##.aside
submityourflicks.com##.spot
||submityourflicks.com/sw.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/1381
sextingforum.net##+js(aopw, stagedPopUnder)

! https://github.com/uBlockOrigin/uAssets/issues/1394
! https://github.com/AdguardTeam/AdguardFilters/issues/77244
linkshorts.*##+js(aopr, open)
linkshorts.*##+js(set, blurred, false)
*$script,3p,denyallow=google.com|gstatic.com|recaptcha.net,domain=linkshorts.*

! https://github.com/uBlockOrigin/uAssets/issues/1392
dz4link.com##+js(aopw, Fingerprint2)
dz4link.com##+js(set, blurred, false)
dz4link.com##+js(nowoif)
dz4link.com##.banner
dz4up.com##.container + div[style] > [title="Download Now"] > img
*$frame,denyallow=google.com,domain=dz4link.com
*$script,3p,denyallow=facebook.net|google.com|gstatic.com|recaptcha.net,domain=dz4link.com

! https://github.com/uBlockOrigin/uAssets/issues/18480
! pixhost. to
pixhost.*###js
pixhost.*###web:style(display: block !important;)
pixhost.*##^script:has-text(exdynsrv)
!#if !cap_html_filtering
pixhost.*##+js(rmnt, script, exdynsrv)
!#endif

! https://adblockplus.org/forum/viewtopic.php?f=1&t=54957
readmng.com##.desk
readmng.com##.sideways
||readmng.com/dist/img/banner*$image,1p

! https://github.com/uBlockOrigin/uAssets/issues/10665
! https://www.reddit.com/r/uBlockOrigin/comments/171bmjh/
@@||next-episode.net^$ghide
@@||next-episode.net^$script,1p
*$script,redirect-rule=noopjs,domain=next-episode.net
!next-episode.net##+js(rmnt, script, /<.*>.*\x40/)
!next-episode.net##.adsbygoogle
next-episode.net##[id=""]

! https://forums.lanik.us/viewtopic.php?f=62&t=39824
||beinsports.com/*/adbw/

! https://github.com/uBlockOrigin/uAssets/issues/1406
! https://github.com/uBlockOrigin/uAssets/pull/9827
indi-share.com##+js(nano-stb, seconds)
indi-share.com##+js(nano-sib, clearInterval)
techmyntra.net##+js(nano-stb)
||dwf6crl4raal7.cloudfront.net^$script,3p
||techmyntra.net^$3p

! https://forums.lanik.us/viewtopic.php?f=62&p=131716#p94691
@@||fwmrm.net/ad/$script,domain=dplay.dk
||dniadops-a.akamaihd.net/video-assets/*.mp4$media,domain=dplay.dk

! https://github.com/uBlockOrigin/uAssets/issues/1687
updato.com##+js(nostif, document.querySelector, 5000)

! https://github.com/easylist/easylist/commit/8b6e6544f04b3ded98fbd70bd832dfcc4e61db52#commitcomment-27222476
! https://github.com/uBlockOrigin/uAssets/issues/3126
! https://github.com/NanoMeow/QuickReports/issues/1258
! https://github.com/NanoMeow/QuickReports/issues/1270
! https://github.com/uBlockOrigin/uAssets/issues/8847
imgdew.*,imgoutlet.*,imgsen.*,imgsto.*,imgtown.*,imgview.*##+js(aopr, CustomEvent)
imgdew.*,imgmaze.*,imgoutlet.*,imgtown.*,imgview.*##+js(aopr, exoJsPop101)
imgdew.*,imgmaze.*,imgtown.*,imgview.*##+js(aopr, ExoLoader.addZone)
imgmaze.*,imgtown.*##+js(aopr, popjs.init)
imgdew.*,imgmaze.*,imgoutlet.*,imgtown.*,imgview.*##+js(aopw, Fingerprint2)
imgdew.*,imgmaze.*,imgoutlet.*,imgtown.*,imgview.*##+js(nowoif)
dewimg.*,imgrock.*,imgviu.*,mazpic.*,outletpic.*,picrok.*##+js(nowoif)
*$script,frame,xhr,3p,domain=mazpic.*,denyallow=imgmaze.com
*$script,frame,xhr,3p,domain=picrok.*,denyallow=imgrock.net
*$script,frame,xhr,3p,domain=imgviu.*,denyallow=imgview.net
*$script,frame,xhr,3p,domain=outletpic.*,denyallow=imgoutlet.com
*$script,frame,xhr,3p,domain=dewimg.*,denyallow=imgdew.com
*$script,frame,xhr,3p,domain=imgtown.*,denyallow=imgtown.net
*$script,3p,domain=imgsen.com
@@||imgtown.*^$ghide
@@||imgmaze.*^$ghide
@@||imgoutlet.*^$ghide
@@||imgview.*^$ghide
/\/[0-9a-z]{5,9}\.js(\?[a-z]{3})?$/$script,domain=dewimg.*|imgtown.*|imgviu.*|mazpic.*|outletpic.*|picrok.*
dewimg.*,imgtown.*,imgviu.*,mazpic.*,outletpic.*,picrok.*##+js(acs, addEventListener, -0x)
dewimg.*,imgtown.*,imgviu.*,mazpic.*,outletpic.*,picrok.*##div[style^="z-index: 999999; background-image: url(\"data:image/gif;base64,"][style$="position: absolute;"]
dewimg.*,imgtown.*,imgviu.*,mazpic.*,outletpic.*,picrok.*##[href^="//"][rel="nofollow norefferer noopener"]

! https://github.com/easylist/easylist/commit/8b6e6544f04b3ded98fbd70bd832dfcc4e61db52#commitcomment-27222476
imgclick.net##+js(aopw, Fingerprint2)
imgclick.net##+js(noeval)

! https://github.com/uBlockOrigin/uAssets/issues/1417
behindwoods.com###cboxOverlay
behindwoods.com###cboxWrapper
behindwoods.com###colorbox
behindwoods.com##.vedio-block

! https://github.com/uBlockOrigin/uAssets/issues/1423
rojadirecta.*,tarjetarojatvonline.*##+js(aopw, closeMyAd)
rojadirecta.*,rojadirectatv.*,tarjetarojatvonline.*##+js(aopw, smrtSP)
capshd.*,rojadirectatvlive.*##+js(nowoif)
||misert.com^
||behabs.com^
||adblockenterpriseedition.com^

! https://www.reddit.com/r/uBlockOrigin/comments/7uncmj/help_remove_dynamic_antiadblocker_overlay/
@@||ekstrabladet.dk^$ghide
@@||adtech.de/dt/common/DAC.js$domain=ekstrabladet.dk
ekstrabladet.dk##.eb-placement

! https://github.com/uBlockOrigin/uAssets/issues/1458
webnovel.com##+js(set, adblockSuspected, false)
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=webnovel.com

! https://github.com/uBlockOrigin/uAssets/issues/1463
@@||totaldebrid.org^$ghide
*.gif#$image,redirect=1x1.gif,domain=totaldebrid.org
! https://github.com/uBlockOrigin/uAssets/issues/1463#issuecomment-534039208
totaldebrid.*##+js(nostif, nextFunction, 250)
totaldebrid.org##+js(aeld, load, nextFunction)

! https://github.com/uBlockOrigin/uAssets/issues/1464
streamwish.*##+js(set, xRds, true)
streamwish.*##+js(set, cRAds, false)

! https://github.com/jspenguin2017/uBlockProtector/issues/835#issuecomment-362782205
! Add filters to boost timers, for the reasoning read the link above
! Copied from https://github.com/NanoAdblocker/NanoFilters/blob/a57366bd7b42a31d25af47eefc031218826bcae0/NanoFiltersSource/NanoTimer.txt
! https://github.com/uBlockOrigin/uAssets/issues/1497
! https://github.com/uBlockOrigin/uAssets/issues/1521
! https://github.com/uBlockOrigin/uAssets/issues/1731
al.ly,bbf.lt,cpmlink.net,cut-urls.com,eg4link.*,idlelivelink.*,igram.*,iiv.pl,shink.me,ur.ly,url.gem-flash.com,zeiz.me##+js(nano-sib)
globalbesthosting.com,srt.am##+js(nano-stb)
! https://github.com/uBlockOrigin/uAssets/issues/1481
1ink.cc##+js(nano-sib)
1ink.cc##[id^="Ad"]
*$frame,domain=1ink.cc
! https://github.com/jspenguin2017/uBlockProtector/issues/173
freepdf-books.com##+js(nano-sib, myTimer, 1500)
@@||met.bz^$ghide
*.gif$domain=met.bz,image
met.bz##+js(noeval)
met.bz##+js(aopr, AaDetector)

! https://github.com/jspenguin2017/uBlockProtector/issues/840
hideout.*##+js(acs, stop, adblock)

! https://github.com/uBlockOrigin/uAssets/issues/1475
@@||pastpapers.papacambridge.com^$ghide
pastpapers.papacambridge.com##[id^="aswift"]

! https://github.com/uBlockOrigin/uAssets/issues/1480
mimaletadepeliculas.*##+js(aeld, load, advertising)

! https://github.com/jspenguin2017/uBlockProtector/issues/228#issuecomment-311761121
themeslide.com##+js(nano-sib, countdown, 2000)
themeslide.com##+js(nano-stb)

! https://github.com/NanoAdblocker/NanoFilters/issues/272
! https://github.com/NanoMeow/QuickReports/issues/25
! https://github.com/uBlockOrigin/uAssets/pull/6696
@@||aternos.org^$ghide
*$script,redirect-rule=noopjs,domain=aternos.org
@@||hb.vntsm.com/v2/live/$xhr,domain=aternos.org
@@||tlx.3lift.com/header/auction?$xhr,domain=aternos.org
@@||fastlane.rubiconproject.com/a/api/fastlane.json?$xhr,domain=aternos.org
@@||bidder.criteo.com/cdb?$xhr,domain=aternos.org
@@||hbopenbid.pubmatic.com/translator?source=prebid-client$xhr,domain=aternos.org
@@||mp.4dex.io/prebid$xhr,domain=aternos.org
@@||prg.smartadserver.com/prebid/v1$xhr,domain=aternos.org
@@||venatusmedia-d.openx.net/w/1.0/arj$xhr,domain=aternos.org
@@||adx.adform.net/adx/openrtb$xhr,domain=aternos.org
@@||htlb.casalemedia.com/cygnus?s=$xhr,domain=aternos.org
@@||prebid.a-mo.net/a/c$xhr,domain=aternos.org
@@||vntsm.com/*/ad-manager.min.js$script,domain=aternos.org
@@||hb.vntsm.io/content.html$xhr,domain=aternos.org
@@||securepubads.g.doubleclick.net/tag/js/gpt.js$script,domain=aternos.org
||aternos.org/panel/ajax/reportDetection.php?$xhr,1p
||aternos.org/ajax/account/report-detection$xhr,1p
||tech426.com^$3p
||ultra-rv.com^$3p
||atom-ds.com^$3p
||fastlane.rubiconproject.com^$removeparam,domain=aternos.org
||htlb.casalemedia.com^$removeparam=r,domain=aternos.org

! https://github.com/uBlockOrigin/uAssets/issues/1027
@@||imasdk.googleapis.com/js/sdkloader/*$script,domain=video.gjirafa.com
gjirafa.com##[id^="gjc"]
gjirafa.com##[id^="an-holder"]
!video.gjirafa.com##+js(json-prune, 0)

||s3.amazonaws.com/dmas-public/revcontent/bundle.js

! https://github.com/uBlockOrigin/uAssets/pull/1506
pcworld.com###amazon-bottom-widget

! https://github.com/uBlockOrigin/uAssets/pull/1507
thedailywtf.com##.article-body > div:has(a[href*="utm_medium"])

! https://github.com/uBlockOrigin/uAssets/issues/1522
befap.com##+js(aopr, ExoLoader)
befap.com##+js(aopw, tiPopAction)
befap.com##.row-middle

! https://github.com/uBlockOrigin/uAssets/issues/1523
tubemania.org##+js(nowoif)
||tubemania.org^$frame,1p

! https://github.com/NanoAdblocker/NanoDefender/issues/24#issuecomment-364821024
wp-time.com##a[href^="https://goo.gl/"]:has(img)
wp-time.com###pop-ad-wrap

! https://github.com/uBlockOrigin/uAssets/issues/1531
#@#.reklama
~offmoto.com##.reklama:not(.ads)

! https://github.com/uBlockOrigin/uAssets/issues/1538
cumlouder.com##+js(aopw, ExoLoader)

! https://forums.lanik.us/viewtopic.php?f=62&t=39983
nme.com##.advert:style(z-index: -999999 !important;)
nme.com###wrapper:style(padding-top: 0 !important;)
idealhome.co.uk,look.co.uk##body > div#wrapper:style(padding-top: 0px !important;)
goodtoknow.co.uk,marieclaire.co.uk,womanandhome.com##.header-advert-wrapper

! mejortorrent.com popups
mejortorrent.*,mejortorrento.*,mejortorrents.*,mejortorrents1.*,mejortorrentt.*##+js(nowebrtc)
mejortorrento.*,mejortorrents.*,mejortorrents1.*,mejortorrentt.*##iframe[src^="publi"]
||mejortorrent.*/bannner

! https://github.com/uBlockOrigin/uAssets/issues/1549
! https://www.reddit.com/r/uBlockOrigin/comments/x289uk
*$popunder,domain=xfreehd.com,3p
xfreehd.com##.nvheader > span:has-text(Advertisement)
*$frame,redirect-rule=noopframe,domain=xfreehd.com
xfreehd.com##.ad-body:remove()

! https://github.com/uBlockOrigin/uAssets/issues/1550
! https://forums.lanik.us/viewtopic.php?f=62&t=42535
||downloadfullfree.com^$xhr,redirect=nooptext

! https://github.com/uBlockOrigin/uAssets/issues/911#issuecomment-366335870
! https://github.com/NanoMeow/QuickReports/issues/3664
adsrt.*##+js(acs, atob, decodeURIComponent)
adsrt.*##+js(aopw, Fingerprint2)
adsrt.*##+js(aopr, rmVideoPlay)
adsrt.*##+js(set, blurred, false)
*$script,3p,denyallow=google.com|gstatic.com|recaptcha.net,domain=adsrt.*

! https://github.com/uBlockOrigin/uAssets/issues/1555
linclik.com##+js(set, blurred, false)
||kogaqmlci.com^

! https://forums.lanik.us/viewtopic.php?f=62&t=39985
rd.com##+js(acs, btoa, Adblock)

! https://github.com/uBlockOrigin/uAssets/issues/2938#issuecomment-445134813
||uptostream.com/assets/ads.xml$xhr,domain=imasdk.googleapis.com
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect-rule=google-ima.js,domain=uptostream.com

! https://www.reddit.com/r/uBlockOrigin/comments/81am26
! https://www.reddit.com/r/uBlockOrigin/comments/9byeux
1movies.*##+js(set, String.prototype.charCodeAt, trueFunc)
! https://github.com/uBlockOrigin/uAssets/issues/1718
1movies.*##+js(set, check_adblock, true)
1movies.*##^script:has-text(3f87b0eaddd)
||1movies.*/sw.js$script,1p
||amgload.net^$xhr,redirect=nooptext,domain=1movies.*
||piguiqproxy.com^$xhr,redirect=nooptext,domain=1movies.*
1movies.*##a[href^="https://vpn-stream.com"]
1movies.*##+js(aopw, decodeURIComponent)
1movies.*##+js(nowoif)
@@||1movies.*/*.html$csp,1p
1movies.life##div[id^="___"][style="display: block;"]

! https://github.com/uBlockOrigin/uAssets/issues/6447
bs.to,burningseries.*##+js(aeld, click, preventDefault)
*$popunder,3p,domain=bs.to|burningseries.*
bs.to,burningseries.*##+js(ra, onclick)

! https://www.reddit.com/r/uBlockOrigin/comments/7ys9hz/nsfw_how_do_you_get_rid_of_those_dancing_girls/
hentaigo.com##+js(aopr, loadTool)
hentaigo.com##+js(aopr, r3H4)
hentaigo.com##a[href*="//www.nutaku.net/signup/"]

! https://github.com/uBlockOrigin/uAssets/issues/1584
lin-ks.*##+js(nano-sib)

! https://github.com/uBlockOrigin/uAssets/issues/1591
streamfare.com##[id^="wb_AdText"]

! https://github.com/AdguardTeam/AdguardFilters/issues/83544
||thebookee.net^$image,redirect-rule=1x1.gif,1p
@@||thebookee.net^$ghide
thebookee.net##ins.adsbygoogle

! https://github.com/gorhill/uBlock/issues/3539
webdesigndev.com##+js(nowoif)

! https://forums.lanik.us/viewtopic.php?f=90&t=40053
! https://forums.lanik.us/viewtopic.php?p=145117#p145117
@@||schwaebische.de/*/ad$script,1p
schwaebische.de##+js(set, disasterpingu, false)
@@||schwaebische.de^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/1608
dz4soft.*##+js(noeval)
dz4soft.*##+js(aeld, load, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/1607
imageweb.ws##+js(nowoif)
||imageweb.ws/*.gif$image
imageweb.ws##a[href^="http://refer.ccbill.com/"]
hardcoreluv.com,imageweb.ws,pezporn.com,wildpictures.net##.box1[style^="height"]

! https://github.com/uBlockOrigin/uAssets/issues/1614
stream2watch.*##+js(acs, atob)
stream2watch.*##+js(aopr, AdservingModule)
stream2watch.*##p[style="color:white;"]
stream2watch.*##.min-test
hindimean.com,streamcdn.*##+js(aopr, AaDetector)
hindimean.com##+js(nowebrtc)
streamcdn.*##+js(aopr, open)
wizhdsports.fi##+js(nowebrtc)
||stream2watch.*/sw.js$script,1p
! daddylive.live (.club .me .eu) popups
! https://github.com/NanoMeow/QuickReports/issues/1306
daddylive.*##+js(aopr, AaDetector)
daddylive.*##+js(aopr, require)
daddylive.*##+js(nowebrtc)
daddylive.*##+js(aopw, afStorage)
daddylive.*##^script:has-text(decodeURIComponent)
dlhd.sx##+js(aopw, u_cfg)
/adblock.php$script,domain=dlhd.sx
dlhd.sx##+js(nostif, (), 150)
||gocast2.com/z-$script,1p
||daddylive.*/*ads$frame,1p
||daddylive.*/sw.js$script,1p
gooals.*###mo-ads-close
daddylive.*###floatLayer1
daddylive.*###html1
daddylive.*##div > a.btn-outline-primary.btn
! https://github.com/AdguardTeam/AdguardFilters/issues/150430
daddylive.link#@#+js(aopr, require)

! https://github.com/uBlockOrigin/uAssets/issues/1618
cnnamador.com##+js(nostif, backRedirect)
cnnamador.com##+js(aeld, , pop)
cnnamador.com##+js(noeval)
cnnamador.com##.banner
||cnnamador.com/player/float.php
cnnamador.com##.is-ad-visible
cnnamador.com##+js(aopw, adv_pre_duration)
cnnamador.com##+js(aopw, adv_post_duration)
cnnamador.com##+js(aeld, /^(click|mousedown|mousemove|touchstart|touchend|touchmove)/, system.popunder)
cnnamador.com##.cards__item:has([href*="loboclick"])
||cnnamador.com/sw.js$script,1p
||adsloboclick.com^

! https://github.com/uBlockOrigin/uAssets/pull/1623
dirpy.com##a[href*="bit.ly"]
dirpy.com##a[href*="out.dirpy.com"]
dirpy.com###dirpy-news

! https://github.com/jspenguin2017/uBlockProtector/issues/865
clix4btc.com##+js(set, adblock, false)

! https://github.com/uBlockOrigin/uAssets/issues/1629
mp3guild.*,mp3clan.*##+js(aopw, Fingerprint2)

! https://github.com/uBlockOrigin/uAssets/issues/1632
vidoza.net##+js(noeval)
vidoza.net##+js(nowoif)
vidoza.net##.in-block
vidoza.net###plo_0
vidoza.net##[id*="ScriptRoot"]
vidoza.net##.simpleToast
vidoza.net##.download-green

! https://github.com/uBlockOrigin/uAssets/issues/2695
*$image,redirect-rule=1x1.gif,domain=freeopenvpn.org
freeopenvpn.org##.ipspeed
freeopenvpn.org#@##advert_top
freeopenvpn.org##div[style^="display: block"][style*="width: 336px"]

! https://github.com/uBlockOrigin/uAssets/issues/1639
! https://forums.lanik.us/viewtopic.php?f=103&t=32877
@@||diariosur.es^$ghide
@@||diariovasco.com^$ghide
@@||elcomercio.es^$ghide
@@||elcorreo.com^$ghide
@@||eldiariomontanes.es^$ghide
@@||elnortedecastilla.es^$ghide
@@||hoy.es^$ghide
@@||ideal.es^$ghide
@@||larioja.com^$ghide
@@||lasprovincias.es^$ghide
@@||leonoticias.com^$ghide
||static.vocento.com/dab/*.js
diariovasco.com,eldiariomontanes.es,elnortedecastilla.es,hoy.es,ideal.es,larioja.com,lasprovincias.es,leonoticias.com##.voc-advertising

! https://github.com/uBlockOrigin/uAssets/issues/7298
*$script,redirect-rule=noopjs,domain=spiegel.de
*$xhr,redirect-rule=noopjs,domain=spiegel.de
||doubleclick.net^$script,important,domain=spiegel.de
spiegel.de#@#.asset-affiliatebox
spiegel.de#@#.nativead
spiegel.de#@#.nativead + .headline-date
spiegel.de#@#a[href^="http://paid.outbrain.com/network/redir?"]
spiegel.de#@#a[href^="https://paid.outbrain.com/network/redir?"]
spiegel.de#@#a[data-nvp*="'trafficUrl':'https://paid.outbrain.com/network/redir?"]
spiegel.de#@#a[onmousedown^="this.href='https://paid.outbrain.com/network/redir?"]
spiegel.de#@#a[onmousedown^="this.href='http://paid.outbrain.com/network/redir?"]

! https://github.com/uBlockOrigin/uAssets/issues/1642
||focus.de/src/js/spmsg$script,redirect=noopjs,1p
focus.de##.clearfix.branding > .surftipp:has-text(Anzeige)
focus.de##[href^="https://www.cyberport.de"]

! https://github.com/uBlockOrigin/uAssets/issues/1644
@@||ariva.de^$ghide
||ariva.de/js/fcm-sw.js$script,1p
ariva.de##.werb_textlink
ariva.de###iqd_mainAd

! https://github.com/uBlockOrigin/uAssets/issues/1649
haxmaps.com##+js(acs, ab1, ab2)

! https://github.com/uBlockOrigin/uAssets/issues/1627
! https://github.com/uBlockOrigin/uAssets/issues/1650
! https://github.com/uBlockOrigin/uAssets/issues/2732
mercurynews.com##+js(set, CnnXt.Event.fire, noopFunc)
@@||mercurynews.com^$ghide
/wp-content/client-mu-plugins/src/Paywall/static/js/connext-paywall-analytics.min.js

! https://forums.lanik.us/viewtopic.php?f=62&t=40124
vsco.co##.page-wrap > section:has-text(Download the free)

! https://github.com/jspenguin2017/uBlockProtector/issues/873
@@||bittube.me/*/js/ads2.js$xhr,1p

! https://github.com/uBlockOrigin/uAssets/issues/1669
generacionretro.net##+js(aeld, load, 2000)

! https://github.com/NanoAdblocker/NanoFilters/issues/39
arlinadzgn.com,idntheme.com##+js(aopw, hidekeep)

! https://github.com/uBlockOrigin/uAssets/issues/3441
ma-x.org##+js(aeld, load, adb)

! https://forums.lanik.us/viewtopic.php?f=62&t=40167
||waybig.com/*.gif$image
waybig.com##.aff-list
waybig.com##.content-aff
waybig.com##.aside-adds-col

! https://github.com/uBlockOrigin/uAssets/issues/1953
! animeflv.net | animeflvnet.com | animeflv.ac | animeflv.cc | animeflv.la | animeflv.ru  ads/popup
animeflv.*##+js(acs, jQuery, 'pp12')
*$script,3p,denyallow=cloudflare.com|cloudflare.net|cloudfront.net|disqus.com|disquscdn.com|facebook.net|fastly.net|fastlylb.net|fbcdn.net|google.com|googleapis.com|gstatic.com|hcaptcha.com|hwcdn.net|jquery.com|jsdelivr.net|mega.nz|recaptcha.net,domain=animeflv.*
@@||animeflv.*/assets/vast/videojs$script,1p
||animeflv.*/api/pop.php

! https://github.com/uBlockOrigin/uAssets/issues/1690
! https://github.com/uBlockOrigin/uAssets/issues/21463
jkanime.*##+js(nowoif)
sfastwish.com##+js(aopr, __Y)

! https://github.com/uBlockOrigin/uAssets/issues/1686
8tracks.com##+js(set, App.views.adsView.adblock, false)

! https://github.com/uBlockOrigin/uAssets/issues/1692
nudecelebforum.com##+js(aopr, __ads)
nudecelebforum.com##+js(noeval)
nudecelebforum.com##+js(nostif, document.querySelectorAll, 1000)
nudecelebforum.com###floatingbar

! https://github.com/uBlockOrigin/uAssets/issues/1697
! https://github.com/NanoAdblocker/NanoFilters/issues/103
@@||hyperdebrid.*^$ghide
hyperdebrid.*##+js(acs, decodeURI, atob)

! https://www.reddit.com/r/uBlockOrigin/comments/83f3nn/please_verify_this_antiadblock_filter_for/
pronpic.org##+js(aopr, document.createEvent)
pronpic.org##+js(aopw, ShowAdbblock)
pronpic.org##+js(nostif, style)
@@||visitweb.com^$script,domain=pronpic.org

! https://www.reddit.com/r/uBlockOrigin/comments/83l1l7/how_can_i_bypass_this_adblock_detenction/
! https://github.com/NanoMeow/QuickReports/issues/3304
||player.ooyala.com/*/ad-plugin/google_ima.min.js$script,important,redirect=noopjs,domain=nrl.com
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect-rule=google-ima.js,domain=nrl.com
@@||nrl.com^$ghide
nrl.com##[id^="publift-ad-"]

! https://github.com/jspenguin2017/uBlockProtector/issues/883
! https://github.com/jspenguin2017/uBlockProtector/issues/940
! https://github.com/jspenguin2017/uBlockProtector/issues/959
! https://github.com/NanoMeow/QuickReports/issues/524
@@||ccbluex.net^$ghide
*/adsid/integrator.js$script,redirect=noopjs,domain=dl.ccbluex.net
||googlesyndication.com^$script,redirect=noopjs,domain=dl.ccbluex.net

! https://github.com/uBlockOrigin/uAssets/issues/1708
thewebflash.com##+js(nostif, clientHeight)

! https://github.com/uBlockOrigin/uAssets/issues/1709
! https://github.com/uBlockOrigin/uAssets/issues/3172
chyoa.com##+js(aopr, __NA)
chyoa.com##+js(aopw, ExoLoader)
chyoa.com##.chyoa-banner
chyoa.com##.chyoa-adzone

! https://github.com/uBlockOrigin/uAssets/issues/1711
3movs.com##+js(popads-dummy)
3movs.com##+js(noeval-if, ExoLoader)
3movs.com##+js(set, flashvars.adv_pause_html, '')
3movs.com##[src*="aid="]
3movs.com###player-pop-layer
||3movs.com/su4unbl-ssu.js

! https://github.com/uBlockOrigin/uAssets/issues/1705
@@||seekingalpha.com^$ghide
||seekingalpha.com/boot_data.js$important
seekingalpha.com##[id^="ad-slot-"]

! https://github.com/uBlockOrigin/uAssets/issues/1714
! https://github.com/uBlockOrigin/uAssets/issues/4687
! https://github.com/uBlockOrigin/uAssets/issues/4711
! https://github.com/uBlockOrigin/uAssets/issues/5919
twitter.com,twitter3e4tixl4xyajtrzo62zg5vztmjuricljdp2c5kshju4avyoid.onion,x.com##[data-testid="trend"]:has-text(/Promoted|Gesponsert|Promocionado|Patrocinat|Sponsorisé|Sponsorizzato|Promowane|Promovido|Реклама|Uitgelicht|Sponsorlu|Promotert|Promoveret|Sponsrad|Mainostettu|Sponzorováno|Promovat|Ajánlott|Προωθημένο|Dipromosikan|Được quảng bá|推廣|推广|推薦|推荐|プロモーション|프로모션|ประชาสัมพันธ์|प्रचारित|বিজ্ঞাপিত|تشہیر شدہ|مُروَّج|تبلیغی|מקודם/):upward(1)
twitter.com,twitter3e4tixl4xyajtrzo62zg5vztmjuricljdp2c5kshju4avyoid.onion,x.com##div[style^="transform"] h2 > div[style^="-webkit-line-clamp"] > span:has-text(/^(?:Promoted Post|Promowany Post|Post promovat|プロモポスト)$/):upward(3)

! https://forums.lanik.us/viewtopic.php?f=62&t=40228#p133884
popularmechanics.com##+js(nostif, addEventListener, 0)

! https://github.com/uBlockOrigin/uAssets/issues/1725
@@||azlink.xyz^$ghide
azlink.xyz##+js(nano-sib)

! cricfree .io .live/xyz
cricplay2.xyz##+js(acs, setTimeout, admc)

! https://github.com/uBlockOrigin/uAssets/issues/4458
xmovies8.*##+js(nowoif)
xmovies8.*##+js(aeld, /^(?:click|mousedown|mousemove|touchstart|touchend|touchmove)$/, system.popunder)
xmovies8.*##+js(set, check_adblock, true)
xmovies08.org##+js(aeld, , '0x)
xmovies8.*###upgrade_pop

||hipercontas.com.br^$3p

! https://forums.lanik.us/viewtopic.php?f=90&t=30966
main-echo.de##div[id^="traffective-ad"]

! https://github.com/uBlockOrigin/uAssets/issues/1739
divxtotal.*,divxtotal1.*##+js(acs, jQuery, btoa)
divxtotal.*,divxtotal1.*###banner_publi

! https://github.com/uBlockOrigin/uAssets/issues/1740
broadwayworld.com##a[href^="https://ad.doubleclick.net/ddm/"]

! https://www.reddit.com/r/uBlockOrigin/comments/85m6fp/ublock_origin_is_showing_adds_on_a_website_for_me/
op.gg##+js(aopw, lifeOnwer)
op.gg##+js(nostif, adblock, 2000)
! https://github.com/uBlockOrigin/uAssets/issues/13033
op.gg##div[class^="css-"]:has(> div:not([class], [id]) > .vm-placement:not([style]))
op.gg##div[class^="css-"]:has(> div:not([class], [id]) > .vm-placement[data-display-type="hybrid-banner"])
! https://github.com/uBlockOrigin/uAssets/issues/13023
op.gg##[id^="div-gpt-ad"]:not([class]):upward(div[class])
@@||doubleclick.net^$xhr,domain=op.gg
@@||vntsm.com^$xhr,domain=op.gg
@@||pagead2.googlesyndication.com^$xhr,domain=op.gg

! https://www.reddit.com/r/uBlockOrigin/comments/85mgro/%C2%B5block_doesnt_block_ads_on_this_site/
birdsandblooms.com,bombshellbling.com,dorkly.com,dryscalpgone.com,eclypsia.com,familyhandyman.com,gala.fr,gentlemansgazette.com,homeschoolgiveaways.com,hotbeautyhealth.com,ketoconnect.net,mom4real.com,mynaturalfamily.com,oneessentialcommunity.com,pageflutter.com,printablecrush.com,psychologyjunkie.com,skinnyms.com,skintagsgone.com,stayglam.com,tasteandtellblog.com,thecelticblog.com,thecozyapron.com,theendlessmeal.com,thehappierhomemaker.com,thelovenerds.com,yellowblissroad.com##+js(acs, btoa, BOOTLOADER_LOADED)
thisisfutbol.com##+js(aopr, PerformanceLongTaskTiming)
pcwelt.de##+js(aopr, proxyLocation)
sixsistersstuff.com##+js(aopr, Int32Array)

! https://github.com/AdguardTeam/AdguardFilters/issues/57638
moondoge.co.in##+js(ra, src, iframe#claimAd)
moondoge.co.in##iframe#claimAd:style(max-height:1px !important;max-width:1px !important)
moondoge.co.in##div.flexContentAd, .btn-sm.btn-coin, .flexBefore, .flexAfter
moondoge.co.in###advert-space > iframe:style(visibility: collapse !important)
moondoge.co.in##[src^="//coinad.com/ads/"]:style(visibility: collapse !important)
moondoge.co.in##.captchaAd:style(visibility: collapse !important)
||localbitcoins.com^$3p

! https://github.com/NanoAdblocker/NanoFilters/commit/f711954f407c43329b5d242a7516a5a38c3bee4e#commitcomment-28218753
revealname.com##+js(set, $.fx.off, true)

! https://github.com/uBlockOrigin/uAssets/issues/1768
alphaporno.com##+js(aopr, ExoLoader)
alphaporno.com##+js(set, console.clear, noopFunc)
alphaporno.com,zedporn.com##.bnnrs-player
alphaporno.com,zedporn.com##.bottom-banners
alphaporno.com,zedporn.com##.block-banner
alphaporno.com##.movies-block > div[style*="text-align:center;"]
alphaporno.com,zedporn.com##.sponsor
||alphaporno.com/bravoplayer/custom/alphapornocom/scripts/inplaybn-

! https://github.com/uBlockOrigin/uAssets/issues/1775
lequipe.fr##+js(nostif, start, 0)
@@||lequipe.fr/js/thirdparty/smarttag.js$script,1p
@@||lequipe.fr/js/thirdparty/prebid.js$script,1p
@@||lequipe.fr^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/1767
?zoneId=*&sponsor$frame

! https://github.com/uBlockOrigin/uAssets/issues/6585
! https://github.com/uBlockOrigin/uAssets/issues/14423
fcportables.com##+js(set, adsClasses, undefined)
fcportables.com##+js(set, gsecs, 0)

! https://github.com/uBlockOrigin/uAssets/issues/1774
porntube.com##.relatedContainer
porntube.com##.col-md-3:has(> iframe[src^="/external"])
||porntube.com/external/
||porntube.com/nativeexternal/

! https://forums.lanik.us/viewtopic.php?f=103&t=40300
! https://github.com/AdguardTeam/AdguardFilters/issues/51448
! https://www.reddit.com/r/uBlockOrigin/comments/1aicy6g/ublock_detected_in_this_page_elrellanocom/
elrellano.com##+js(rmnt, script, deblocker)
elrellano.com##.widget_media_image

! https://bugzilla.mozilla.org/show_bug.cgi?id=1404468#c44
jeuxvideo.com##^script:has-text(wadsBlocking)

! https://github.com/uBlockOrigin/uAssets/issues/1796
comunidadgzone.es##+js(nostif, nextFunction, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/1797
tubous.com##+js(aopr, popMagic.init)
tubous.com##+js(aopr, document.dispatchEvent)
||fuckandcdn.com/*/ads/
||fuckandcdn.com/*/frms/
tubous.com##.allIM
tubous.com###good_money
tubous.com##a.DarkBg

! https://github.com/uBlockOrigin/uAssets/issues/1800
apurogol.net##+js(aopw, smrtSB)
apurogol.net##+js(aopw, smrtSP)
apurogol.net##[href="/stream/"]
apurogol.net###fakeplayer
||ichlnk.com^

! https://github.com/uBlockOrigin/uAssets/issues/1802
jpopsingles.eu##+js(nano-sib, downloadTimer)
jpopsingles.eu##+js(acs, document.createElement, /l\.parentNode\.insertBefore\(s/)
jpopsingles.eu##+js(noeval-if, adsBlocked)
@@||jpopsingles.eu^$ghide
@@||jpopsingles.eu^$image,1p
/ap-plugin-scripteo/frontend/img/728x90.png$image,redirect-rule=1x1.gif

! https://github.com/uBlockOrigin/uAssets/issues/1804
! freecoursesonline. me
freecoursesonline.*##+js(aeld, load, nextFunction)

! https://github.com/uBlockOrigin/uAssets/issues/1814
globaldjmix.com##+js(aeld, /DOMContentLoaded|load/, y.readyState)
@@||globaldjmix.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/2393
pelisplus2.*##+js(acs, document.getElementsByTagName, onclick)
pelisplus.*##+js(aopr, AaDetector)
pelisplus.*,pelisplushd.*##+js(aopw, adcashMacros)
pelisplus.*##+js(aopw, smrtSP)
pelisplus.*##+js(aopw, smrtSB)
pelisplus.*,pelisplushd.*,pelispop.net,streampelis.club##+js(nowoif)
streampelis.club##+js(aopr, __Y)
pelisplus.*##+js(ra, href, #opfk)
pelisplus.*##[class^="smartadtags"]
pelisplus.*##.links > a.btn[class*="fa-"]
pelisplus2.*##[style^="margin:-30px"] > [href][target="_blank"]

! https://github.com/uBlockOrigin/uAssets/issues/1816
||gotprofits.com^$3p

! https://github.com/jspenguin2017/uBlockProtector/issues/894
@@||whiskypreisvergleich.de^$ghide
@@||whiskyprices.co.uk^$ghide
@@||whiskyprijzen.*^$ghide
@@||whiskyprix.*^$ghide
whiskypreisvergleich.de,whiskyprices.co.uk,whiskyprijzen.be,whiskyprijzen.nl,whiskyprix.be,whiskyprix.fr##.blocker

! https://github.com/uBlockOrigin/uAssets/issues/1823
jellynote.com##+js(nostif, byepopup, 5000)

! https://github.com/uBlockOrigin/uAssets/issues/1826
||go.pub2srv.com/apu.php$script,redirect=noopjs
! https://github.com/uBlockOrigin/uAssets/issues/1826#issuecomment-478300989
pouvideo.*,povvideo.*,povw1deo.*,povwideo.*,powv1deo.*,powvibeo.*,powvideo.*,powvldeo.*##+js(aopr, jwplayer.vast)
pouvideo.*,povvideo.*,povw1deo.*,povwideo.*,powv1deo.*,powvibeo.*,powvideo.*,powvldeo.*##+js(aopw, adcashMacros)
pouvideo.*,povvideo.*,povw1deo.*,povwideo.*,powv1deo.*,powvibeo.*,powvideo.*,powvldeo.*##+js(aopw, Fingerprent2)
pouvideo.*,povvideo.*,povvldeo.*,povw1deo.*,povwideo.*,powv1deo.*,powvibeo.*,powvideo.*,powvldeo.*##+js(aopw, Fingerprint2)
pouvideo.*,povvideo.*,povw1deo.*,povwideo.*,powv1deo.*,powvibeo.*,powvideo.*,powvldeo.*##+js(nano-stb, grecaptcha.ready, *)
pouvideo.*,povvideo.*,povw1deo.*,povwideo.*,powv1deo.*,powvibeo.*,powvideo.*,powvldeo.*##+js(nostif, test.remove, 100)
pouvideo.*,povvideo.*,povvldeo.*,povw1deo.*,povwideo.*,powv1deo.*,powvibeo.*,powvideo.*,powvldeo.*##+js(nowoif)
pouvideo.*,povvideo.*,povw1deo.*,povwideo.*,powv1deo.*,powvibeo.*,powvideo.*,powvldeo.*##+js(set, isAdb, false)
pouvideo.*,povvideo.*,povw1deo.*,povwideo.*,powv1deo.*,powvibeo.*,powvideo.*,powvldeo.*##[src^="/ben/mgnat.html?"]
pouvideo.*,povvideo.*,povw1deo.*,povwideo.*,powv1deo.*,powvibeo.*,powvideo.*,powvldeo.*###embed
pouvideo.*,povvideo.*,povw1deo.*,povwideo.*,powv1deo.*,powvibeo.*,powvideo.*,powvldeo.*###keepFloatin
pouvideo.*,povvideo.*,povw1deo.*,povwideo.*,powv1deo.*,powvibeo.*,powvideo.*,powvldeo.*##iframe:not([src*="recaptcha"])
/jquery.notify.js$script,1p,domain=pouvideo.*|povvideo.*|povw1deo.*|povwideo.*|powv1deo.*|powvibeo.*|powvideo.*|powvldeo.*
ext=$script,1p,domain=pouvideo.*|povvideo.*|povw1deo.*|povwideo.*|powv1deo.*|powvibeo.*|powvideo.*|powvldeo.*
*$frame,3p,denyallow=google.com,domain=pouvideo.*|povvideo.*|povw1deo.*|powvibeo.*|povwideo.*|powv1deo.*|powvideo.*|powvldeo.*|povvldeo.*
*$script,3p,denyallow=googleapis.com|google.com|gstatic.com,domain=povvldeo.*|povvldeo.lol
@@player*.html$frame,1p,domain=pouvideo.*|povvideo.*|povw1deo.*|powvibeo.*|povwideo.*|powv1deo.*|powvideo.*|powvldeo.*
||wontent.powvideo.net^
||zontent.powvideo.net^
/js/fpu3/pu4.min.js

! https://github.com/uBlockOrigin/uAssets/issues/1827
pcbolsa.com###ContenidoPubliCotiza
pcbolsa.com##.InfoPcBolsaAdBlock:xpath(..)
pcbolsa.com###ContenidoPubliCotizax1

! https://github.com/uBlockOrigin/uAssets/issues/1828
minecraftraffle.com##+js(acs, awm, location)

! https://github.com/jspenguin2017/uBlockProtector/issues/885
! https://github.com/NanoMeow/QuickReports/issues/1531
golfchannel.com##+js(set, adBlockEnabled, false)
@@||v.fwmrm.net^$xhr,domain=stream.golfchannel.com

! https://github.com/uBlockOrigin/uAssets/issues/1830
downloadpirate.com##+js(aopw, Fingerprint2)
||downloadpirate.com/sw.js$script

! https://github.com/uBlockOrigin/uAssets/issues/1833
! https://github.com/uBlockOrigin/uAssets/issues/2253
reddit.com,reddittorjg6rue252oqsxryoxengawnmo46qy4kyii5wtqnwfj4ooad.onion##.size-compact.Post:has([class*="promoted"])
reddit.com,reddittorjg6rue252oqsxryoxengawnmo46qy4kyii5wtqnwfj4ooad.onion##div[id*="sidebar"][data-before-content="advertisement"]:upward(3)
reddit.com,reddittorjg6rue252oqsxryoxengawnmo46qy4kyii5wtqnwfj4ooad.onion##div[class][data-before-content="advertisement"]:not([id])
reddit.com,reddittorjg6rue252oqsxryoxengawnmo46qy4kyii5wtqnwfj4ooad.onion##div[class][data-before-content="Werbung"]:not([id])
! https://github.com/uBlockOrigin/uAssets/issues/13072
reddit.com,reddittorjg6rue252oqsxryoxengawnmo46qy4kyii5wtqnwfj4ooad.onion##[id^="t3"].promotedlink:upward(.rpBJOHq2PR60pnwJlUyP0 > div)

! https://forums.lanik.us/viewtopic.php?f=62&t=40330
toyoheadquarters.com##+js(aopr, document.dispatchEvent)

! https://github.com/NanoAdblocker/NanoFilters/issues/52
insidemarketing.it##+js(aopr, adblock)
insidemarketing.it##.homeBannerMax

! https://github.com/uBlockOrigin/uAssets/issues/1835
desiupload.*,9xupload.*##+js(nano-stb)
desiupload.*##+js(acs, getCookie)
desiupload.*##[href*="desifile.in/404"]
||a2ztechworld.com^$3p

! https://github.com/uBlockOrigin/uAssets/issues/1839
vermangasporno.com##+js(aeld, , _0x)
vermangasporno.com##+js(aopr, dataPopUnder)
vermangasporno.com##[href^="https://bit.ly"]
vermangasporno.com##[href*="http://www.ciberhentai.net"]
*$script,3p,denyallow=cloudflare.net|cloudfront.net|disqus.com|disquscdn.com|fastlylb.net,domain=vermangasporno.com

! https://github.com/uBlockOrigin/uAssets/issues/1842
bdsmstreak.com##+js(aopr, ExoLoader.serve)
bdsmstreak.com##+js(aeld, , _blank)
*$script,3p,denyallow=cloudflare.com|cloudflare.net|fastly.net|fastlylb.net|fluidplayer.com|google.com|googleapis.com|gstatic.com|hcaptcha.com|hwcdn.net|jquery.com|jsdelivr.net|recaptcha.net|twitter.com|x.com,domain=bdsmstreak.com

! https://github.com/uBlockOrigin/uAssets/issues/1843
! https://github.com/uBlockOrigin/uAssets/issues/991
! https://github.com/uBlockOrigin/uAssets/issues/17736
gamcore.com,porcore.com,69games.xxx##+js(nowoif)
gamcore.com,porcore.com,69games.xxx##+js(set, puShown, true)
gamcore.com,69games.xxx##[href*="/ads/"]
classic.gamcore.com##[id]:has(> .warningbox)
classic.gamcore.com###center > .flashes > .wide:has(> a[href][rel])
gamcore.com##.item:has([href^="/games/"][class=""])
gamcore.com##.item:has(> a[href] > img[src*="//cdn.69games.xxx/"])
gamcore.com##.menuArea [rel]
gamcore.com##.row > .d-md-block
gamcore.com##.row > .d-lg-block.d-none
gamcore.com##.mycontainer > .d-lg-block.d-none > iframe
gamcore.com##.row > .game_view > .add_game iframe
gamcore.com###preloader_2
gamcore.com##.side_flashes
gamcore.com##.wide.alphadelta_block
gamcore.com###ad_unter_spiel
gamcore.com###tvnotice
porcore.com##.adscolumn
porcore.com##[style^="width:728px;height:90px"]
porcore.com###videoitems.videoitems > .onevideothumb:has(> .clip-link > img[src^="/uploads/"][src$="gif"])
porcore.com##[target="_blank"]:has([src*=".gif"])
porcore.com##li > a[href*="/loader?"]
69games.xxx###footer
69games.xxx###right
69games.xxx###tvnotice
69games.xxx##[class^="leaderboard"]
69games.xxx##[id*="tvadbody"]
69games.xxx##[id^="center"] .I:has(> [class=""][href])
69games.xxx##.side_flash
zazzybabes.com##+js(aeld, /error|canplay/, (t))
*$frame,script,3p,denyallow=bootstrapcdn.com|cloudflare.com|cloudflare.net|fastly.net|fastlylb.net|getbootstrap.com|google.com|googleapis.com|gstatic.com|hcaptcha.com|hwcdn.net|jquery.com|recaptcha.net|serverable.com|zencdn.net,domain=porcore.com|zazzybabes.com
@@||tm-offers.gamingadult.com/?offer=$frame,domain=gamcore.com|69games.xxx
://a.*/ipp?id=$script,3p
://a.*/loader?a=$frame,3p
/strip_ngn_2020_august$script,domain=porcore.com
||serverable.com/*.gif$image

! https://github.com/uBlockOrigin/uAssets/issues/1993
cinedetodo.*##.alignnone
cinedetodo.*##.bnr
cinedetodo.*##[id*="yellow"]
||cda-online.pl/wp-content/uploads/*.js$script

! https://github.com/uBlockOrigin/uAssets/issues/1850
aquipelis.*##+js(aopw, smrtSB)
aquipelis.*##+js(aopw, smrtSP)
aquipelis.net##[class^="adsbutt"]

! https://github.com/uBlockOrigin/uAssets/issues/2081
! https://github.com/easylist/easylist/issues/7486
! https://www.reddit.com/r/uBlockOrigin/comments/177nvxn/popup/
eporner.com##+js(rmnt, script, /adb/i)
eporner.com##+js(aopw, EPeventFire)
eporner.com##+js(nostif, additional_src, 300)
*.xml$xhr,3p,domain=eporner.com
||eporner.com/js/bowser.php
||eporner.com/cppb/
||eporner.com/dotm/
eporner.com##.mb:has(> .adnative-1x1)

! https://github.com/uBlockOrigin/uAssets/issues/1855
! https://forums.lanik.us/viewtopic.php?p=134829#p134829
@@||arenavision.*^$ghide
arenavision.*##+js(nowoif)
||imgpfx.arenavision.

! https://github.com/uBlockOrigin/uAssets/issues/1857
vintage-erotica-forum.com##+js(acs, __ads)
vintage-erotica-forum.com##+js(acs, setTimeout, ____POP)
vintage-erotica-forum.com##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/1862
htmlgames.com##+js(no-fetch-if, openx)
||yollamedia.com^
||htmlgames.com/js/yolla.php
@@||yolla-d.openx.net/|$script,domain=cdn.htmlgames.com
cdn.htmlgames.com###afgContainer

! https://github.com/uBlockOrigin/uAssets/issues/1864
siamfishing.com##+js(acs, is_noadblock, window.location)

! https://github.com/uBlockOrigin/uAssets/issues/1884
! https://github.com/NanoMeow/QuickReports/issues/2960
tecknity.com##+js(set, ads_b_test, true)
@@||tecknity.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/1885
! https://github.com/NanoMeow/QuickReports/issues/564
pornbimbo.com##+js(nostif, (), 2000)
@@||pornbimbo.com^$ghide
pornbimbo.com##[href^="https://ca.clcknads.pro"]
pornbimbo.com##.bottom-adv
pornbimbo.com##[src^="http://pornbimbo.com/player/html.php"]

! https://github.com/uBlockOrigin/uAssets/issues/1883
/pu-placer.js

! https://www.reddit.com/r/Buffalo/comments/89dzra/buffalo_news_paywall_x2/dwqze26/
! https://github.com/uBlockOrigin/uAssets/issues/2330
! https://github.com/uBlockOrigin/uAssets/issues/3870
@@||bntech.io^$script,domain=buffalonews.com

! https://github.com/uBlockOrigin/uAssets/issues/1890
! https://github.com/uBlockOrigin/uAssets/issues/18832
momondo.com##+js(nowoif)
momondo.com##[onclick*="inline.ad"]
momondo.*##div[id$=-list] div[role=tab]

! https://github.com/uBlockOrigin/uAssets/issues/1891
! https://github.com/NanoMeow/QuickReports/issues/1019
! https://github.com/uBlockOrigin/uAssets/issues/7447
! https://www.reddit.com/r/uBlockOrigin/comments/17pwuvh/ublock_detected_firefox_haaretzcoil/
haaretz.co.il,haaretz.com##+js(aeld, load, hblocked)
haaretz.co.il,haaretz.com##+js(acs, $, AdBlockUtil)
haaretz.co.il,haaretz.com##+js(set, showAds, true)

! https://github.com/uBlockOrigin/uAssets/issues/1892
avoiderrors.com##+js(nostif, css_class.show)
avoiderrors.com##.ai-viewport-1.code-block-3.code-block
avoiderrors.com##[href^="https://www.avoiderrors.com/robinhood"]

! https://github.com/uBlockOrigin/uAssets/issues/1895
slate.com##+js(aeld, error, Adblocker)
slate.com##.slate-ad

! https://github.com/uBlockOrigin/uAssets/issues/1907
4tests.com##+js(set, adblock, false)

! https://github.com/uBlockOrigin/uAssets/issues/1914
@@||farmeramania.de^$ghide
farmeramania.de##+js(acs, $, show)

||sersh.com^

! https://github.com/uBlockOrigin/uAssets/issues/5587
guidedhacking.com##[href="https://guidedhacking.com/advertise"]
||guidedhacking.com/*banner$image
||guidedhacking.com/*.gif$image

! https://github.com/uBlockOrigin/uAssets/issues/1741
theralphretort.com##+js(aopw, adBlockDetected)

! https://forums.lanik.us/viewtopic.php?f=62&t=40436
||ads.puhutv.com/i.jpg$image,redirect=2x2.png

! https://forums.lanik.us/viewtopic.php?f=90&t=40441
! https://github.com/uBlockOrigin/uAssets/issues/5223
winfuture.de##+js(json-prune, adtagparameter, enabled)
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=winfuture.de
@@||widget.spoods.io/loader.js$script,domain=winfuture.de

! https://forums.lanik.us/viewtopic.php?f=96&t=40440
@@||hdblog.it^$ghide
hdblog.it#@#.item_compra
hdblog.it#@#.box_flame
hdblog.it#@#.box_grampa_shadow
hdblog.it##[id^="google_ads_iframe"]
hdblog.it##.ads_container_top
hdblog.it##.ads_block

! https://forums.lanik.us/viewtopic.php?f=96&t=40447
@@||hdmotori.it^$ghide
hdmotori.it##body:style(background: none !important; overflow: auto !important;)
hdmotori.it##+js(nostif, CANG, 3000)
hdmotori.it##.ads_block

! https://github.com/uBlockOrigin/uAssets/issues/1932
megawarez.org##+js(aopw, smrtSB)
megawarez.org##[class^="ads"]
megawarez.org##[id^="text-"] > .textwidget > p > [href][target="_blank"] > .size-full.alignnone
! https://github.com/uBlockOrigin/uAssets/issues/1932#issuecomment-457093955
megawarez.org##.onp-sl-content:style(display: block !important;)
megawarez.org##.onp-sl-social-locker
mwpaste.com##+js(nowoif, /^/, 15)
*$frame,3p,domain=mwpaste.com
! https://github.com/uBlockOrigin/uAssets/issues/1932#issuecomment-465748184
acortalo.*,acortar.*,megadescarga.net##+js(nofab)
acortalo.*,acortar.*,megadescarga.net,megadescargas.net##+js(nano-sib, , , 0)
acortalo.*,acortar.*,megadescarga.net,megadescargas.net##+js(set, clicked, true)
acortalo.*,acortar.*,megadescarga.net,megadescargas.net##+js(set, eClicked, true)
acortalo.*,acortar.*,megadescarga.net,megadescargas.net##+js(set, number, 0)
acortalo.*,acortar.*,megadescarga.net,megadescargas.net##+js(set, sync, true)
||acortalo.*^$3p
@@*$css,1p,domain=acortalo.*|acortar.*|megadescarga.net
@@*$ghide,domain=acortalo.*|acortar.*|megadescarga.net
*$popunder,domain=acortalo.*|acortar.*|megadescarga.net|megadescargas.net

! https://github.com/uBlockOrigin/uAssets/issues/7348
hentai2read.com##+js(nowoif)
hentai2read.com##[target="_blank"]:has([src^="//"])
hentai2read.com##[src^="data: ;base64,"]
||hentaicdn.com^*/NATORI.$script,3p
/\.com\/\d+/[0-9a-z]+\.js$/$script,1p,domain=hentai2w.com
||hentai2w.com/templates/default/js/ab.functions.js
||hentai2w.com/templates/default/js/arf-
hentai2w.com##+js(acs, Math.random, ExoLoader)
hentai2w.com##+js(aeld, getexoloader)
hentai2w.com##.arf-sec
hentai2w.com##.ark-noAB

! https://github.com/uBlockOrigin/uAssets/issues/1938
megalinks.info##+js(aeld, DOMContentLoaded, adlinkfly)
megapaste.xyz###newlayercontent

! https://github.com/uBlockOrigin/uAssets/issues/1945
||highstream.tv/twos.js

! https://github.com/jspenguin2017/uBlockProtector/issues/905
updato.com##+js(nostif, updato-overlay, 500)

! https://github.com/uBlockOrigin/uAssets/issues/1946
lolhentai.net##+js(nowoif)
lolhentai.net##+js(aopr, loadTool)
lolhentai.net##.sponsor
||lolhentai.net/cornergirls.js
! ! adding sites using the same script
! https://www.reddit.com/r/uBlockOrigin/comments/a6bbib/this_website_seems_to_be_able_to_bypass_ublock/
mangafreak.net##+js(nowoif)
mangafreak.net##+js(acs, setTimeout, document.querySelector)
||cdn.siteswithcontent.com/js/push/subscribe.js$script,important
||cdn.contentsitesrv.com/js/push/subscribe.js$script,important
mangafreak.net##[src^="/scripts/"]
memecenter.com##a[href$=".png"]
! https://github.com/uBlockOrigin/uAssets/issues/13147
*$script,3p,denyallow=cloudflare.net|cloudfront.net|disqus.com|disquscdn.com|facebook.com|facebook.net|fastlylb.net|fbcdn.net|fontawesome.com|google.com|googleapis.com|gstatic.com|hwcdn.net|jquery.com|sharethis.com|unpkg.com|watchcartoonsonline.info|kisscartoon.info,domain=kiss-anime.*
kiss-anime.*###rightside > .clear2 ~ .rightBox
kiss-anime.*##.episodeList > div > div[style*="text-align: center"]

! https://github.com/uBlockOrigin/uAssets/issues/1965
freepornvideo.sex,teenpornvideo.xxx##+js(aopr, ExoLoader.serve)
freepornvideo.sex##noindex
teenpornvideo.xxx##.aside-spots

! https://github.com/uBlockOrigin/uAssets/issues/10266
tubsexer.*##.sponsored_top
tubsexer.*##.table
tubsexer.*##.desktop_link
tubsexer.*##+js(nostif, innerText, 2000)
tubsexer.*##.advertising

! https://github.com/uBlockOrigin/uAssets/issues/1969
yourlust.com##+js(aopr, ExoLoader.serve)
yourlust.com##+js(aeld, getexoloader)

! https://github.com/uBlockOrigin/uAssets/issues/719
twitch.tv##+js(nowoif, amazon-adsystem)
||amazon-adsystem.com/aax2/apstag.js$script,domain=twitch.tv,important
||ddacn6pr5v0tl.cloudfront.net^
! https://github.com/uBlockOrigin/uAssets/issues/5184#issuecomment-1960744541
twitch.tv##.stream-display-ad__wrapper

! https://github.com/uBlockOrigin/uAssets/issues/1977
imx.to##+js(aopr, ExoLoader.serve)

! https://github.com/uBlockOrigin/uAssets/issues/1980
crazyshit.com##+js(acs, jQuery, document.cookie)
||crazyshit.com/aff/$frame

! https://github.com/uBlockOrigin/uAssets/issues/1982
strikeout.*##+js(nowoif, |)
strikeout.*##+js(acs, setTimeout, admc)
strikeout.*##.position-absolute:style(opacity: 0 !important;)
strikeout.*##.d-none.d-lg-block.col-lg-3
strikeout.*##+js(acs, String.fromCharCode, 'shift')
strikeout.*##.m-1.btn-danger.btn
strikeout.*##.w-100.position-absolute.h-100
*$image,redirect-rule=1x1.gif,domain=strikeout.*
! https://github.com/uBlockOrigin/uAssets/issues/14879
plyjam.*##+js(set, attr, {})
plyjam.*##+js(set, scriptSrc, '')

! https://github.com/NanoAdblocker/NanoDefender/issues/38
lejdd.fr##+js(aopr, SmartWallSDK)

! https://github.com/uBlockOrigin/uAssets/issues/1994
peliculasmx.net###pbar_outerdiv
peliculasmx.net##.selected:has-text(Ads)
peliculasmx.net##+js(nowebrtc)
peliculasmx.net##+js(aopw, segs_pop)
##[href^="https://www.onclickperformance.com/"]
peliculasmx.net###pills-ads
peliculasmx.net###pills-ads-tab

! https://github.com/uBlockOrigin/uAssets/issues/1995
ciberdvd.*##+js(nowoif)
ciberdvd.*##+js(aopw, smrtSB)

! https://github.com/uBlockOrigin/uAssets/issues/2001
@@||windows10gadgets.pro^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/2009
elfqrin.com##+js(nostif, alert, 8000)

! https://github.com/uBlockOrigin/uAssets/issues/2018
anonymousemail.me##+js(acs, document.getElementById, adblock)

! https://github.com/uBlockOrigin/uAssets/issues/2019
porngem.com##+js(set, console.clear, noopFunc)
porngem.com##.video-right
porngem.com###player-pop-layer
porngem.com##.adv-in-video
porngem.com##.bottom-b-s

! https://forums.lanik.us/viewtopic.php?f=104&t=40485&p=135354#p135178
@@||e-komplet.dk^$ghide

! https://forums.lanik.us/viewtopic.php?p=135477#p135477
@@||btc-echo.de^$ghide
btc-echo.de##.elementor-row:has-text([Anzeige])

! https://forum.kuketz-blog.de/viewtopic.php?f=29&p=7929
! https://github.com/uBlockOrigin/uAssets/issues/845
! https://github.com/uBlockOrigin/uAssets/issues/3438
! https://github.com/uBlockOrigin/uAssets/issues/3443
! https://github.com/uBlockOrigin/uAssets/issues/5794
!#if env_chromium
||amazonaws.com/homad-global-configs.schneevonmorgen.com/global_config.json$xhr,redirect=nooptext,domain=fitforfun.de|golem.de|n-tv.de|wetter.de
||amazonaws.com/homad-global-configs-eu-fra.schneevonmorgen.com/global_config.json$xhr,redirect=nooptext,domain=desired.de
!#endif
n-tv.de##+js(set, Object.prototype.adReinsertion, noopFunc)
! https://github.com/uBlockOrigin/uAssets/issues/19951
brigitte.de,stern.de##+js(set, Object.prototype.disableAds, true)
wetter.de##+js(no-xhr-if, homad-global-configs)
! https://github.com/uBlockOrigin/uAssets/issues/3443#issuecomment-420714439
||amazonaws.com/homad-global-configs.schneevonmorgen.com/global_config.json$xhr,redirect=nooptext,domain=tele5.de
! ||damoh.tele5.de/*$media,redirect=noopmp3-0.1s,domain=tele5.de
kochbar.de##.ks-ad
kochbar.de##[data-adslot]
kochbar.de##.admanager

! https://forums.lanik.us/viewtopic.php?f=62&t=41254
foxsports.com.au##+js(set, cxStartDetectionProcess, noopFunc)

! https://github.com/uBlockOrigin/uAssets/issues/2064
thememypc.net##+js(aopr, Abd_Detector)
thememypc.net##+js(nano-sib, counter, 2000)
kinoger.*##+js(aopr, __Y)

! https://github.com/uBlockOrigin/uAssets/issues/2068
cityam.com##+js(aopr, paywallWrapper)

! https://github.com/uBlockOrigin/uAssets/issues/2061
! https://www.reddit.com/r/uBlockOrigin/comments/13dz3wp/
thesimsresource.com##+js(set, isAdBlocked, false)
thesimsresource.com##+js(no-xhr-if, /enthusiastgaming|googleoptimize|googletagmanager/)
thesimsresource.com##.crtv-bottom-wrapper
thesimsresource.com##.pleasewaitad

! https://github.com/uBlockOrigin/uAssets/issues/2075
xbabe.com##.bnnr
xbabe.com##.bnnrs-bottom
*$script,3p,denyallow=googleapis.com|hwcdn.net|fastly.net|jwpcdn.com,domain=xbabe.com

! https://www.camp-firefox.de/forum/viewtopic.php?p=1081244#p1081244
||akamaihd.net/vod/*$media,redirect=noopmp3-0.1s,domain=7tv.de

! https://github.com/uBlockOrigin/uAssets/issues/2082
satcesc.com##+js(nostif, css_class)
||wpfc.ml/b.gif$image,redirect-rule=1x1.gif,domain=satcesc.com

! https://github.com/uBlockOrigin/uAssets/issues/2085
pornoreino.com##+js(aopr, ExoLoader)
pornoreino.com##+js(aopr, open)
pornoreino.com##.banner

! https://github.com/uBlockOrigin/uAssets/issues/2097
! https://github.com/uBlockOrigin/uAssets/issues/19474
@@||dogefaucet.com^$ghide
dogefaucet.com##.loader
||a-ads.com^$frame,redirect-rule=noopframe,domain=dogefaucet.com

! https://github.com/uBlockOrigin/uAssets/issues/2095
playretrogames.com##+js(nano-stb, ez, *, 0.02)
playretrogames.com##.adblock

! https://github.com/uBlockOrigin/uAssets/issues/2092
shrt10.com##+js(aopr, open)
shrt10.com##+js(aopw, adcashMacros)
shrt10.com##+js(set, blurred, false)
*$script,3p,denyallow=cloudflare.com|google.com|gstatic.com|recaptcha.net,domain=shrt10.com
||dx-tv.com^$3p
@@||shrt10.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/2093
fxporn69.*##+js(aeld, click, exopop)
fxporn69.*##+js(set, adblock, noopFunc)
fxporn69.*##+js(nostif, nextFunction, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/4546
||vipbox.*^$script,1p
*$popup,domain=vipbox.*,3p
@@|about:blank|$popup,domain=vipbox.*
vipbox.*##a[href^="https://s3.amazonaws.com/"]
vipbox.*##button[data-open="_blank"]
vipbox.*##.btn-lg.btn
~vipbox.pl,vipbox.*,vipboxtv.*##.position-absolute
##[data-lnguri*="vipbox"]
*$image,redirect-rule=1x1.gif,domain=vipbox.*
@@||vipbox.*^$ghide
vipbox.*##.btn-success.btn
vipbox.*,viprow.*##+js(set, path, '')
vipbox.*,vipboxtv.*##+js(json-prune, *, *.adserverDomain)
vipbox.*,viprow.*##^script:has-text("admc")
vipbox.*,viprow.*##^script:has-text(\"admc\")
vipbox.*##+js(nowoif, , 10)

! https://github.com/uBlockOrigin/uAssets/issues/2104
wkyc.com##+js(acs, btoa)
wkyc.com##.grid__sticky-column_side_left

! https://github.com/jspenguin2017/uBlockProtector/issues/915
crackllc.com##.onp-sl-content:style(display: block !important;)
crackllc.com##.onp-sl-social-locker

! https://forums.lanik.us/viewtopic.php?f=62&t=40607
animeid.tv##+js(nowebrtc)
animeid.tv##[href^="http://play.leadzupc.com/"]

! https://github.com/uBlockOrigin/uAssets/issues/2111
geo.fr##+js(aopw, $getWin)

! https://github.com/uBlockOrigin/uAssets/issues/2109
tfc.tv##+js(aopw, adBlockDetected)
@@||tfc.tv/Scripts/*ads.js

! https://github.com/uBlockOrigin/uAssets/issues/2115
! https://github.com/uBlockOrigin/uAssets/issues/15909
gnomio.com##+js(no-xhr-if, /doubleclick|googlesyndication/)

! https://forums.lanik.us/viewtopic.php?f=64&t=40616
@@||nba.com^$ghide
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=nba.com
! https://www.reddit.com/r/uBlockOrigin/comments/jz12a7/cant_watch_videos_without_turning_off_ubo/
@@||neulionms-a.akamaihd.net^$script,domain=nba.com
! https://github.com/AdguardTeam/AdguardFilters/issues/118188
||ugdturner.com/xd.sjs$script,redirect-rule=noopjs,domain=nba.com
||clips-manifests-aka.warnermediacdn.com^$xhr,removeparam=caid,domain=nba.com
! https://github.com/uBlockOrigin/uAssets/issues/21165
||akamaized.net/*.m3u8$xhr,3p,removeparam=csid,domain=nba.com
||akamaized.net/*.m3u8$xhr,3p,removeparam=pcaid,domain=nba.com

! https://github.com/uBlockOrigin/uAssets/issues/2122
hotcopper.com.au##+js(acs, $, blockAds)

! https://github.com/uBlockOrigin/uAssets/issues/2140
trekbbs.com##div[style^="width:970px"]

! https://github.com/uBlockOrigin/uAssets/issues/2139
@@||popcornflix.com^$ghide
popcornflix.com##+js(json-prune, adEnabled)

! https://github.com/uBlockOrigin/uAssets/issues/2142
hdbox.ws##+js(nostif, show)

! https://github.com/uBlockOrigin/uAssets/issues/2130
@@||benkhouya.com^$script,domain=anonymousemail.me

! https://github.com/uBlockOrigin/uAssets/issues/2137
timeforbitco.in##+js(set, adBlock, false)
@@||timeforbitco.in^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/2143
inmanga.com##+js(acs, setTimeout, manageAntiBlock)

! https://github.com/jspenguin2017/uBlockProtector/issues/919
designmodo.com##.onp-sl-content:style(display: block !important;)
designmodo.com##.onp-sl-social-locker

! https://github.com/uBlockOrigin/uAssets/issues/2145
! https://github.com/uBlockOrigin/uAssets/issues/4787
||ctrl.blog/ac/rba$frame,1p
ctrl.blog##+js(set, _ctrl_vt.blocked.ad_script, false)
ctrl.blog##.boxa

! https://github.com/uBlockOrigin/uAssets/issues/2149
@@||adz.bz^$ghide
adz.bz###frameAd:style(height: 51 px !important; display: block !important; visibility: collapse !important;)

! https://github.com/uBlockOrigin/uAssets/issues/2153
! https://github.com/uBlockOrigin/uAssets/commit/de1a12fbfcc5bf8942173a395e3746cc45575166#commitcomment-28816238
*/wp-content/plugins/adunblocker/*$script,1p

! https://github.com/jspenguin2017/uBlockProtector/issues/922
download.ipeenk.com##+js(aopw, adBlockDetected)
download.ipeenk.com##+js(aopw, Fingerprint2)

! https://github.com/uBlockOrigin/uAssets/issues/2168
revivelink.com##+js(acs, Object.defineProperty, XMLHttpRequest)

! https://github.com/uBlockOrigin/uAssets/issues/2173
sportlife.es##+js(set, blockAdBlock, noopFunc)

! https://forums.lanik.us/viewtopic.php?f=62&t=40676
inhabitat.com##+js(aopr, registerSlideshowAd)

! https://github.com/uBlockOrigin/uAssets/issues/2194
*$frame,domain=lusthero.com,3p
lusthero.com##+js(nostif, (), 50)

! https://github.com/uBlockOrigin/uAssets/issues/1849
! https://forums.lanik.us/viewtopic.php?p=136255#p136255
m4ufree.*##+js(nostif, debugger)
m4ufree.*,streamm4u.*##+js(nowebrtc)
m4ufree.*##+js(aopr, mm)
streamm4u.*##+js(aopr, AaDetector)
||caffeinecontainerakin.com^

! https://github.com/uBlockOrigin/uAssets/issues/5411
! https://github.com/uBlockOrigin/uAssets/issues/7481
itv.com##+js(json-prune, Playlist.ContentBreaks)
itv.com##+js(nowoif)
||toots-a.akamaihd.net/priority/*$media,redirect=noopmp3-0.1s,domain=itv.com
||toots-a.akamaihd.net/priority/*$media,redirect=noopmp4-1s,domain=itv.com
itv.com##.stage__upsell-button
itv.com##.seek-bar__ad

! https://github.com/uBlockOrigin/uAssets/issues/2198
! https://github.com/uBlockOrigin/uAssets/issues/2198#issuecomment-478436892
mega-dvdrip.*,peliculas-dvdrip.*##+js(aeld, DOMContentLoaded, shortener)
peliculas-dvdrip.*##+js(aopr, AdservingModule)
peliculas-dvdrip.*##[class*="col-"] > p > [href] > img.alignnone
megapastes.com##+js(aeld, DOMContentLoaded, adlinkfly)
megapastes.com##.content > center

! https://www.reddit.com/r/uBlockOrigin/comments/bv37t2/animedao_blocking_ublock_origins/
! https://github.com/NanoMeow/QuickReports/issues/1325
@@||anime-update*.*^$ghide
@@||animedao*.*^$ghide
animedao.*##.gads
*$script,redirect-rule=noopjs,domain=animedao.*
@@||animedao*.stream^$script,1p
animedao.*##.ab
animedao.*##hr

! https://www.reddit.com/r/uBlockOrigin/comments/8hgrg9/blocking_deals_on_kinja_sites_gizmodo_kotaku/
! https://github.com/uBlockOrigin/uAssets/issues/2836
! https://www.reddit.com/r/uBlockOrigin/comments/b3co9c/ublock_origin_doesnt_work_properly_on_some/
avclub.com,clickhole.com,deadspin.com,earther.com,gizmodo.com,jalopnik.com,jezebel.com,kotaku.com,lifehacker.com,splinternews.com,theinventory.com,theonion.com,theroot.com,thetakeout.com##article.postlist__item:has(.meta__network)
!#if env_firefox
@@||amazon-adsystem.com/$script,domain=avclub.com|clickhole.com|deadspin.com|earther.com|gizmodo.com|jalopnik.com|jezebel.com|kotaku.com|lifehacker.com|splinternews.com|theinventory.com|theonion.com|theroot.com|thetakeout.com
!#endif

! https://github.com/uBlockOrigin/uAssets/issues/2204
worldfreeware.com##+js(aopr, require)
@@||worldfreeware.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/2207
||tibiabr.com/$frame,1p

! https://github.com/uBlockOrigin/uAssets/issues/11351
einthusan.*##+js(no-xhr-if, /^(?!.*(einthusan\.io|yahoo|rtnotif|ajax|quantcast|bugsnag))/)
@@||einthusan.*/prebid.js$script,1p
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=einthusan.*
@@||googletagmanager.com/gtm.js$xhr,domain=einthusan.tv
einthusan.*##.adspace-lb
einthusan.*##.adspace-lr

! https://github.com/uBlockOrigin/uAssets/issues/2236
nuevos-mu.ucoz.com##+js(aeld, load, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/5710
@@||esradio.libertaddigital.com/ad/*$xhr,1p
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=esradio.libertaddigital.com
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=storage.oraclecloud.com
@@||storage.oraclecloud.com/*/smartclip-services/sc_player/$script,1p
esradio.libertaddigital.com###mega-atf

! Fix navbar being stuck in the middle of the page
dailydot.com##.dd-nav-global:style(top: 0 !important; transform: none !important;)

! https://github.com/uBlockOrigin/uAssets/issues/2242
pornfay.*##+js(nowoif)
*$frame,domain=pornfay.*
pornfay.*##.rmedia
pornfay.*##.zone
||pvrtx.net^
pornfay.*##.bottom-adv

! https://github.com/uBlockOrigin/uAssets/issues/2247
finofilipino.org##+js(set, caca, noopFunc)

! https://github.com/uBlockOrigin/uAssets/issues/2249
in.search.yahoo.com##.reg:has([href*="aclick"])
in.search.yahoo.com##.reg:has([href*="clk"])

! https://github.com/NanoMeow/QuickReports/issues/2244
yahoo.com##.ys-mobileFeaturedAd
||cdn.yahoomedia.net/creatives/*/BlackFriday
yahoo.com###HPSPON-ad

! https://forums.lanik.us/viewtopic.php?f=62&t=40733
mypornstarbook.net##+js(aopr, ExoLoader.serve)
mypornstarbook.net##table > tbody > tr:has-text(Advertisement)

! https://github.com/uBlockOrigin/uAssets/issues/2260
grantorrent.*,grantorrent1.*##+js(aopr, getUrlParameter)
grantorrent.*##+js(acs, onload, btoa)
grantorrent.*##+js(aopr, LieDetector)
grantorrent.*,grantorrents.*##+js(nano-stb)
grantorrent.*,grantorrent1.*##+js(aopw, Fingerprint2)
grantorrent.*,grantorrent1.*##+js(acs, decodeURI, decodeURIComponent)
grantorrents.*##.myButton
grantorrents.*##.custom-html-widget.textwidget > [style*="width:300px; height:600px"]
##[href*="passtechusa.com"]
! https://github.com/uBlockOrigin/uAssets/issues/2260#issuecomment-488532216
desbloqueador.*##+js(aeld, mousedown, trigger)
desbloqueador.*##+js(set, Ok, true)
desbloqueador.*##+js(nowoif, given)

! https://forums.lanik.us/viewtopic.php?f=62&t=16610
ddlvalley.*##+js(acs, decodeURI, getScriptFromCss)
ddlvalley.*##+js(aopw, Fingerprint2)

! https://github.com/uBlockOrigin/uAssets/issues/2263
! https://github.com/uBlockOrigin/uAssets/issues/11416
speedtest.net##+js(set, isBlocked, false)
speedtest.net##+js(aopr, _sp_)
speedtest.net#@#.pure-u-custom-ad-skyscraper

! https://forums.lanik.us/viewtopic.php?p=136580#p136580
! https://github.com/uBlockOrigin/uAssets/issues/4483
seehd.*##+js(acs, String.fromCharCode, 'shift')
||bokarsolutions.co.uk^$3p

! https://forums.lanik.us/viewtopic.php?f=62&t=40741
mangaku.*##+js(nowebrtc)
mangaku.*##+js(acs, $, onclick)
*.gif$domain=mangaku.*,image

! https://forums.lanik.us/viewtopic.php?f=62&t=29217
mac2sell.net##+js(no-fetch-if, method:HEAD)

! https://github.com/uBlockOrigin/uAssets/issues/2267
xberuang.*##+js(set, safelink.adblock, false)
xberuang.*##+js(nano-sib)

! https://forums.lanik.us/viewtopic.php?f=91&t=40756
@@||v.fwmrm.net/ad/g/$xhr,domain=mycanal.fr

! https://forums.lanik.us/viewtopic.php?f=62&t=40758
goafricaonline.com##+js(aopr, goafricaSplashScreenAd)

! https://github.com/uBlockOrigin/uAssets/issues/11337
@@||youmath.it/$script,1p
*$script,redirect-rule=noopjs,domain=youmath.it
youmath.it##+js(acs, document.getElementById, try)
youmath.it##+js(nostif, adb)
youmath.it##+js(no-xhr-if, /adnxs.com|onetag-sys.com|teads.tv|google-analytics.com/)
youmath.it###D_1
youmath.it###C_1

! https://github.com/uBlockOrigin/uAssets/issues/2282
ashemaletube.com##+js(aopr, open)
ashemaletube.com##.ads-block-rightside
@@||ashemaletube.com^$ghide
||cc.ashemaletube.com/*/black-header.jpg$image
||cc.ashemaletube.com/*/header-black.jpg$image
ashemaletube.com##.video-end-overlay
*.mp4$media,redirect=noopmp3-0.1s,domain=ashemaletube.com
||cc.ashemaletube.com/*/black-main.jpg$image,1p
ashemaletube.com###site-wrapper:style(padding-top: 0 !important;)
ashemaletube.com##.header-ads-wrapper
@@/key=$media,domain=ashemaletube.com
ashemaletube.com##li[class]:has(a[href^="https://shemale.show/"][rel="sponsored"])
ashemaletube.com##.js-toggle-content-wrapper a[href^="https://shemale.show/"][rel="sponsored"]:upward(.js-toggle-content-wrapper)
ashemaletube.com##.ads-wrapper

! https://github.com/uBlockOrigin/uAssets/issues/2286
hotscope.tv##+js(nowoif)
hotscope.tv##[style^="transform"]:has(#videoHolder)
hotscope.tv##ul[style^="padding-top:"]
||hotscope.tv^$csp=script-src 'self' 'unsafe-inline' 'unsafe-eval' data: https://disqus.com *.disqus.com *.google-analytics.com *.disquscdn.com
||hotscope.tv/_next/static/chunks/pages/go-$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/2287
japanesefuck.com##+js(aopr, ExoLoader.serve)

! https://github.com/uBlockOrigin/uAssets/issues/2292
*/wp-content/plugins/deadblocker/*$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/2294
todopolicia.com##+js(nostif, show)

! https://github.com/uBlockOrigin/uAssets/issues/4351
poedb.tw##+js(aopr, importFAB)
@@||poedb.tw^$ghide
poedb.tw###bottombanner970
poedb.tw###topbanner970
! https://github.com/uBlockOrigin/uAssets/issues/14680
poedb.tw##[target="_blank"]:has([src*="webp"])
poedb.tw##.text-center:has([src*="webp"]):has([style])

! https://github.com/NanoAdblocker/NanoCore/issues/166
cine.to##+js(aeld, , 0x)

! https://github.com/uBlockOrigin/uAssets/issues/2306
micloudfiles.com##+js(aeld, load, 2000)
micloudfiles.com##+js(acs, atob, tabunder)
micloudfiles.com##+js(nowoif)
micloudfiles.com##[href*="medbooksvn.org/"]
micloudfiles.com##[href*="usmlematerials.net/"]
||media.giphy.com^$image,domain=micloudfiles.com
||imgur.com^$image,domain=micloudfiles.com
||usmlematerials.net^$image,domain=micloudfiles.com

! https://forums.lanik.us/viewtopic.php?f=62&t=40787
coinfaucet.io##+js(acs, atob, tabunder)
coinfaucet.io,freecardano.com,freenem.com##+js(nowebrtc)

! https://github.com/uBlockOrigin/uAssets/issues/2310
@@||cloudstorageoptions.com^$ghide
cloudstorageoptions.com##ins.adsbygoogle
cloudstorageoptions.com##.adslot_left

! https://github.com/uBlockOrigin/uAssets/issues/2300
cbc.ca##+js(aopw, xhr.prototype.realSend)
cbc.ca##.ad-risingstar-container
cbc.ca##.ad-container

! popups http://assia.tv/live/betsport/?lang=rs
! https://github.com/AdguardTeam/AdguardFilters/issues/116307
assia.tv,assia4.com,assia24.com##+js(set, ClickUnder, noopFunc)
/css/*$frame,domain=assia.tv|assia4.com|assia24.com
/css/jquerymin*$script,1p,domain=assia.tv|assia4.com|assia24.com
assia.tv,assia4.com,assia24.com##[class*="ban"]
assia.tv,assia4.com,assia24.com##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/2327
dallasnews.com##+js(nostif, initializeCourier, 3000)
@@||courier-js.dallasnews.com^$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/2329
nulledteam.com##+js(acs, $, userAgent)

! https://forums.lanik.us/viewtopic.php?f=62&t=40812
turbobit.net##+js(acs, decodeURI, decodeURIComponent)
turbobit.net##+js(aopr, open)
turbobit.net##+js(popads-dummy)

! https://forums.lanik.us/viewtopic.php?p=136716#p136716
link.tl##+js(aopr, _0xbeb9)
link.tl##+js(nano-sib, , 1800)
||link.tl/interstitial/*$frame,1p
||link.tl/splash/*$script,1p
||lnk.news^$csp=sandbox allow-forms allow-same-origin allow-scripts allow-modals allow-orientation-lock allow-pointer-lock allow-presentation allow-top-navigation
||lnk.parts^$csp=sandbox allow-forms allow-same-origin allow-scripts allow-modals allow-orientation-lock allow-pointer-lock allow-presentation allow-top-navigation
lnk.news,lnk.parts##+js(aopr, popAdsClickCount)
lnk.news,lnk.parts##+js(nano-sib, , , 0)
lnk.news,lnk.parts##+js(nostif, redirectPage)
lnk.news,lnk.parts##.child-centered.display-300x250

! https://github.com/uBlockOrigin/uAssets/issues/2335
! https://www.reddit.com/r/uBlockOrigin/comments/bn9n4o/nzbstarscom/
nzbstars.com##+js(acs, document.getElementById, adblocker)
nzbstars.com##[href="usenetbucket.php"]
||nzbstars.com/*.gif$image

! https://github.com/uBlockOrigin/uAssets/issues/9814
@@||frkn64modding.com^$ghide
frkn64modding.com##+js(no-xhr-if, ad_)
frkn64modding.com##.ezoic-ad

! https://forums.lanik.us/viewtopic.php?f=96&t=40712
accordo.it###bglink
||accordo.it/cloud-assets/x/sfondi/

! https://forums.lanik.us/viewtopic.php?f=62&t=40852
seatguru.com##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/2359
vixenless.com##+js(acs, azar, redirect)

! https://github.com/uBlockOrigin/uAssets/issues/2362
! https://github.com/uBlockOrigin/uAssets/issues/3781
! https://github.com/uBlockOrigin/uAssets/issues/13164
! https://github.com/AdguardTeam/AdguardFilters/issues/116483
camslib.com,camwhores.*,camwhorestv.*##+js(acs, onload)
camwhores.*,camwhorestv.*##+js(aeld, , Pop)
camwhores.*,camwhorestv.*##+js(aopr, _wm)
camwhores.*,camwhorestv.*##+js(aopr, loadTool)
camwhores.*,camwhorestv.*##+js(nowoif)
camwhores.*,camwhorez.tv##+js(set, flashvars.adv_pre_src, '')
camwhores.*,camwhorez.tv##+js(set, flashvars.adv_pre_url, '')
camwhores.*,camwhorez.tv##+js(set, flashvars.adv_pre_vast, '')
camwhores.*,camwhorez.tv##+js(set, flashvars.protect_block, '')
camwhores.*##+js(set, flashvars.video_click_url, '')
||camwhores.tv/contents/*/preroll$media,important,1p
||h-cdn.com/loader.js$script,domain=camwhores.tv
||lexozfldkklgvc.com^$3p
||virtwishmodels.com^$frame,3p
||cemiocw.com^$3p
camwhores.*,camwhorestv.*##.place
camwhores.*,camwhorestv.*##[href^="https://go.schjmp.com"]
camwhores.*,camwhorestv.*##.row-models
camwhores.*,camwhorestv.*##.topad
camwhores.*,camwhorestv.*###list_videos_friends
*pre-roll$media,redirect=noopmp4-1s,domain=camwhores.tv,important
/\/[0-9a-f]{12}\.js$/$script,1p,domain=camvideos.org|camwhores.*

! https://github.com/uBlockOrigin/uAssets/issues/2364
! https://github.com/uBlockOrigin/uAssets/issues/2376
bestialitytaboo.tv,bestialitysextaboo.com,mujeresdesnudas.club##+js(acs, $, azar)
bestialitysexanimals.com,bestialporn.com,mujeresdesnudas.club,mynakedwife.video##+js(aopr, open)
zootube1.com##+js(aopr, popunderSetup)
zootube1.com##+js(cookie-remover, da325)
zootube1.com##+js(aost, document.cookie, https)
videoszoofiliahd.com##+js(aopr, open)
videoszoofiliahd.com##+js(aeld, /^(?:click|mousedown)$/, popunder)
asiananimaltube.org,zoosex.pink##+js(nowoif)
videoszoofiliahd.com##[href^="https://redirect.ero-advertising.com/"]
allbestiality.com,beastwomans.com,beastzoo.org,bestialitysexvideos.com,bestialitytaboo.tv,bestialityworld.org,bestialporn.net,bestialzoo.*,fakingszoo.com,hispajotes.com,portalzoo.com,videosbizarre.com,zoofiliak9.com,zoofilianet.com,zoofiliataboo.com,zookings.com,zoosexnet.com,zoosexsite.com,zootubex.tv,zootubex.us##[href^="https://www.skypeis"]
! https://github.com/uBlockOrigin/uAssets/issues/2364#issuecomment-393353226
porntopic.com##+js(aopr, loadTool)
||grtyb.com^$3p
! https://github.com/uBlockOrigin/uAssets/issues/2364#issuecomment-406739691
xxxtubezoo.com,zooredtube.com##+js(aopr, popunderSetup)
xxxtubezoo.com,zooredtube.com##+js(aeld, DOMContentLoaded, preventExit)

! https://github.com/uBlockOrigin/uAssets/issues/2364
hdbraze.com##+js(acs, Math.floor, hilltop)
||hdbraze.com/sw.js$script,1p
hdbraze.com##.ads

! https://github.com/uBlockOrigin/uAssets/issues/2365
fapdig.com##+js(acs, document.createElement, 'script')
||fapdig.com/sw.js$script,1p
||pornbraze.com/popup.js

! https://github.com/uBlockOrigin/uAssets/issues/2366
! https://github.com/uBlockOrigin/uAssets/issues/2367
! https://github.com/uBlockOrigin/uAssets/issues/2368
! https://github.com/uBlockOrigin/uAssets/issues/2379
! https://github.com/uBlockOrigin/uAssets/issues/3292
pornbraze.com##.adv-square
pornbraze.com/sw.js$script,1p
! https://github.com/uBlockOrigin/uAssets/issues/1604
! https://github.com/uBlockOrigin/uAssets/issues/4487
fembed.com##+js(aopr, decodeURI)
fembed.com##+js(aeld, /^(?:click|mousedown)$/, _0x)
fembed.com##+js(disable-newtab-links)
fembed.com##+js(nosiif, (), 500)
@@||fembed.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/2370
videos1002.com##+js(acs, $, azar)
videos1002.com##+js(aopr, jsPopunder)

! https://github.com/uBlockOrigin/uAssets/issues/2377
ancensored.com,ganool.*##+js(aeld, /^(?:click|mousedown)$/, _0x)
ganool.*##+js(nowebrtc)

! https://forums.lanik.us/viewtopic.php?f=62&t=40357
! https://github.com/uBlockOrigin/uAssets/issues/661
@@||boards.net^$ghide
@@||freeforums.net^$ghide
@@||proboards.com^$ghide
/tortoise.min.js$domain=boards.net|freeforums.net|proboards.com
boards.net,freeforums.net,proboards.com##+js(acs, $, vglnk)
boards.net,freeforums.net,proboards.com##[id^="ad-"], #remove_ads_link
proboards.com###ad1

! https://github.com/uBlockOrigin/uAssets/issues/2414
acortarm.xyz##+js(aeld, mousedown, trigger)
acortarm.xyz##+js(set, Ok, true)
||ref-dir.xyz^$popunder

! https://github.com/uBlockOrigin/uAssets/issues/2415
inkapelis.*##+js(acs, setTimeout, aadblock)
inkapelis.*##+js(aopr, AaDetector)
inkapelis.*##+js(aopw, smrtSB)
inkapelis.*##+js(aopw, smrtSP)
inkapelis.*##+js(aopw, Fingerprint2)
inkapelis.*##+js(acs, decodeURI, decodeURIComponent)
||inkapelis.*/sw.js$script

! https://github.com/uBlockOrigin/uAssets/issues/2416
cuevana3.*##+js(aopr, S9tt)
cuevana3.*##+js(aopr, decodeURI)
cuevana3.*##+js(aopw, popUpUrl)
player.cuevana.ac##+js(nowoif, , 10)
||player.cuevana.ac/cdn-cgi/trace$xhr,1p

! https://github.com/uBlockOrigin/uAssets/issues/2423
yoututosjeff.*##+js(aopw, adBlockDetected)
yoututosjeff.*##+js(aeld, load, 2000)
||googlesyndication.com/pagead/$script,redirect=noopjs,domain=yoututosjeff.es

! https://github.com/uBlockOrigin/uAssets/issues/2426
efukt.com##+js(aeld, click, preventDefault)
efukt.com##+js(nostif, _0x, 2000)
efukt.com##+js(aopr, open)
||syndication.twitter.com/i/jot$frame,domain=efukt.com,important
efukt.com##[href^="https://efukt.com/videos/naughty/"]
efukt.com##.hide_before:has([href*="?utm_source=efukt"])
efukt.com##div.tile:has(a[href^="https://efukt.com/out.php"])
efukt.com##.efukt-widget-slider-nice-try-adblockers
efukt.com##.plugs-nice-try-adblockers

! https://github.com/uBlockOrigin/uAssets/issues/2428
gtaall.com##+js(nowebrtc)
gtaall.com##+js(aopr, Notification)

! https://github.com/uBlockOrigin/uAssets/issues/2434
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=arlinadzgn.com|idntheme.com

! https://github.com/uBlockOrigin/uAssets/issues/2444
fotbolltransfers.com##+js(aopr, adBlockDetected)

! https://github.com/uBlockOrigin/uAssets/issues/2445
androidaba.*##+js(aopw, adBlockDetected)

! https://github.com/uBlockOrigin/uAssets/issues/2446
! https://github.com/NanoAdblocker/NanoFilters/issues/229
ilpuntotecnico.com##[style^="text-align:center; height:"][style$="px;"]
@@||ilpuntotecnico.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/2449
! https://github.com/AdguardTeam/AdguardFilters/issues/147765
a2zapk.*##+js(acs, atob, decodeURIComponent)
a2zapk.*##+js(aopr, AaDetector)
||a2zapk.*/js/notification.js
@@||a2zupload.com^$ghide
@@||googlesyndication.com/pagead/$script,domain=a2zupload.com
@@*$image,domain=a2zupload.com
a2zapk.*,a2zupload.com##ins.adsbygoogle
a2zapk.*,educatiocenter.online##+js(acs, $, alertmsg)
@@||dl.a2zapk.*/getred.php$xhr,domain=a2zapk.*|educatiocenter.online
@@||tmp.a2zapk.*/js/advertisement/$frame,domain=a2zapk.*|educatiocenter.online
||googlesyndication.com^$image,redirect-rule=1x1.gif,domain=a2zapk.*|educatiocenter.online

! https://www.reddit.com/r/uBlockOrigin/comments/phaeom/gaming_adult_ads_not_blocked/
! https://github.com/uBlockOrigin/uAssets/issues/12966
! https://github.com/uBlockOrigin/uAssets/issues/16178
! https://github.com/uBlockOrigin/uAssets/issues/18232
! https://github.com/uBlockOrigin/uAssets/issues/18317
igg-games.com##+js(acs, addEventListener, document.createElement)
*$script,3p,domain=igg-games.com|bluemediafile.sbs,denyallow=cloudflare.com|fastcomments.com|googleapis.com|addtoany.com
igg-games.com##+js(aopw, btoa)
igg-games.com##+js(ra, srcdoc, iframe)
||igg-games.com/sw.js$script,1p
igg-games.com##[href^="https://tm-offers"]
@@||igg-games.com^$ghide
igg-games.com#@#.uk-panel.widget-text
igg-games.com##.uk-panel.widget-text:style(height: 0px !important; visibility: collapse;)
igg-games.com##.widget_advads_ad_widget
igg-games.com##a[href^="https://igg-games.com/c1flix"], a[aria-label="faadgg"], a[aria-label="fdgg"], a[aria-label="aswd"]
igg-games.com##.uk-margin-medium-top > *:first-child:has(img[src^="https://igg-games.com/wp-content/uploads/"])
igg-games.com##.uk-margin-medium-top > *:first-child + a:has(img[src^="https://igg-games.com/wp-content/uploads/"])
igg-games.com##article > a:has(img[loading="lazy"][width][height])
igg-games.com###tm-sidebar > div:not([class], [id]):has(a[rel] > img[src^="https://igg-games.com/wp-content/uploads/"])
igg-games.com##aside > :not(:first-child) a[href] img
igg-games.com##a[href$=".php"]
igg-games.com##a[href^="https://igg-games.com/"][href*="flix"] > img
||igg-games.com/wp-content/uploads/2024/02/hhh3.png$image
||igg-games.com/wp-content/uploads/2021/02/hh1.gif$image
||igg-games.com/wp-content/uploads/2024/02/naa1.jpg$image
||igg-games.com/wp-content/uploads/2024/02/aaa.jpg$image
||igg-games.com/wp-content/uploads/2024/02/sss.jpg$image
pcgamestorrents.com##[href*="banner"]
pcgamestorrents.org##[href*="/gameadult/"][href$=".php"]
||pcgamestorrents.com/*.gif$image
pcgamestorrents.com,pcgamestorrents.org##a[href^="https://pcgamestorrents."][href*="/cuskilo"]
pcgamestorrents.com,pcgamestorrents.org##a[href][aria-label="awed"]

! https://github.com/uBlockOrigin/uAssets/issues/2458
pornrabbit.com##+js(nowoif)
||pornrabbit.com/sw.js$script,1p
pornrabbit.com##.stage-promo
pornrabbit.com##.footer-margin
pornrabbit.com##.table

! https://github.com/uBlockOrigin/uAssets/issues/2457
camwhoresbay.com##+js(acs, readCookieDelit)
camwhoresbay.com##div.opt
camwhoresbay.com##.fake-player
camwhoresbay.com##.content > center:has([style="width:300px;height:250px"])

! https://github.com/jspenguin2017/uBlockProtector/issues/942
@@||my5.tv^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/2468
gamepedia.com###bodyContent:style(width:100%!important)
gamepedia.com##[id^="siderail_"]

! https://github.com/uBlockOrigin/uAssets/issues/2461
anon-v.com##+js(acs, atob, decodeURI)
anon-v.com##+js(acs, onload)
anon-v.com##.embed-container
anon-v.com##.place
anon-v.com##.sponsor
anon-v.com##.table
||cum-shows.net^$frame,3p
||cfgr2.com^
||hrtya.com^
||nudespree.com/a/av/live.php$frame

! https://github.com/uBlockOrigin/uAssets/issues/2480
cartoonporno.xxx##+js(aopr, prPuShown)
cartoonporno.xxx##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/2481
@@||solvettube.com^$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/2482
! https://github.com/uBlockOrigin/uAssets/issues/4779
! https://github.com/uBlockOrigin/uAssets/issues/10052
you-porn.com,youporn.*,youporngay.com,youpornru.com##+js(set, page_params.holiday_promo, true)
youpornru.com##+js(nowoif)
you-porn.com,youporn.*,youporngay.com,youpornru.com##.ad-bottom-text
you-porn.com,youporn.*,youporngay.com##.adLinkText
you-porn.com,youporn.*,youporngay.com,youpornru.com##.adsbytrafficjunky
you-porn.com,youporn.*,youpornru.com##.e8-column
you-porn.com,youporn.*##[data-removelink="removeLink"]
you-porn.com,youporngay.com,youpornru.com###pb_template
you-porn.com##[id^="adblock"]
youpornru.com##.adLinkText
youpornru.com##[data-tracking="track-close-btn-ad"]
##.trafficjunky-float-right
! https://github.com/uBlockOrigin/uAssets/issues/2482#issuecomment-395244585
redtube.*##+js(acs, Object.defineProperty, trafficjunky)
redtube.*##+js(nowoif)
redtube.*##+js(set, page_params.holiday_promo, true)
redtube.*##.abovePlayer
redtube.*##.adsbytrafficjunky
redtube.*##li:has(.adsbytrafficjunky)
redtube.*##.remove_ads
! mirror
9908ww.com,adelaidepawnbroker.com,bztube.com,hotovs.com,insuredhome.org,nudegista.com,pornluck.com,vidd.se##+js(set, page_params.holiday_promo, true)

! anti adb https://www.tvserial.it/the-generi-serie-tv-sky-maccio-capatonda-video/
@@||tvserial.it^$ghide
@@||exmarketplace.com^$domain=tvserial.it
tvserial.it##.gptslot

! https://github.com/uBlockOrigin/uAssets/issues/2484#issuecomment-395174594
foumovies.*##+js(aopw, decodeURIComponent)
fullywatchonline.com,myvidmate.*##+js(acs, atob, decodeURIComponent)
hubfiles.ws##+js(nowoif)
hubfiles.ws##+js(nano-stb)
moviescounter.*##+js(aopr, LieDetector)
moviescounter.*##+js(aeld, , _0x)
/watchbutton11.png$image
/download11.png$image
mydownloadtube.*##.movie-box > .vert-add
||vuwomoby.pro^

! https://github.com/uBlockOrigin/uAssets/issues/4349
douploads.*##+js(acs, $, show)
douploads.*##+js(ra, checked, input#chkIsAdd)
douploads.*##[href^="https://href.li/"]
||douploads.*/*sw$script,1p
@@||douploads.*^$ghide
douploads.*##a[rel="nofollow"]

! https://github.com/uBlockOrigin/uAssets/issues/2487
@@||v.fwmrm.net/ad/*$script,domain=funimation.com
||mediausamns-a.akamaihd.net^$media,domain=funimation.com
funimation.com##+js(json-prune, adRenderers)
*$media,redirect=noopmp3-0.1s,domain=funimation.com
@@||media.truex.com/integration/vpaid/com.truex.TrueXRenderer.js$script,domain=funimation.com
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=funimation.com
@@||pubads.g.doubleclick.net/gampad/ads*.funimation.com*player$xhr,domain=imasdk.googleapis.com

! https://www.reddit.com/r/uBlockOrigin/comments/8p8sin/is_there_a_way_to_block_those_ads_without/
autobild.de##+js(aopr, adSSetup)

! https://github.com/uBlockOrigin/uAssets/issues/2498
alimaniac.com##+js(aopr, document.cookie)

! https://github.com/uBlockOrigin/uAssets/issues/2503
hulkshare.com##+js(nosiif, adblockerModal, 1000)

! https://www.reddit.com/r/uBlockOrigin/comments/8prah0/ads_script_ublock_cant_block_since_months
springfieldspringfield.co.uk##+js(nostif, ads, 750)

! https://github.com/uBlockOrigin/uAssets/issues/2513
mcoc-guide.com#@#ins.adsbygoogle[data-ad-slot]

! https://github.com/uBlockOrigin/uAssets/issues/2515
porngun.net##.video:not([id])

! https://github.com/uBlockOrigin/uAssets/issues/2527
mp3fy.com##+js(nostif, nextFunction, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/2529
ebookmed.*##+js(aeld, load, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/2533
@@||appvn.com^$ghide
appvn.com##.ads
appvn.com##.downloadtitle
appvn.com###info:style(display: block !important)

! https://github.com/uBlockOrigin/uAssets/issues/2537
@@||worldofbitco.in^$ghide
worldofbitco.in,weatherx.co.in##+js(set, adBlock, false)
worldofbitco.in,weatherx.co.in##+js(set, spoof, noopFunc)

! https://github.com/uBlockOrigin/uAssets/issues/2540
dailyfreebits.com##+js(acs, $, html)

! https://github.com/uBlockOrigin/uAssets/issues/2538
@@||getyourbitco.in^$ghide
getyourbitco.in##+js(set, adBlock, false)

! https://github.com/uBlockOrigin/uAssets/issues/7836
! https://github.com/uBlockOrigin/uAssets/issues/13508
! https://github.com/uBlockOrigin/uAssets/issues/14372
sbs.com.au##+js(set, adBlockerDetected, undefined)
sbs.com.au##+js(m3u-prune, /redirector\.googlevideo\.com\/videoplayback\?[\s\S]*?dclk_video_ads/, pubads.g.doubleclick.net/ondemand/hls/)
sbs.com.au##+js(no-xhr-if, /redirector\.googlevideo\.com\/videoplayback[\s\S]*?dclk_video_ads/)
sbs.com.au##+js(json-prune, ads breaks cuepoints times)
sbs.com.au##+js(rc, ad-controls, .bitmovinplayer-container.ad-controls)
||pubads.g.doubleclick.net/ondemand/hls/content/*/streams$xhr,redirect=noop.txt,domain=sbs.com.au
||redirector.googlevideo.com/*&source=dclk_video_ads&$redirect=noop.txt,domain=sbs.com.au,important,image,media,subdocument,stylesheet,script,xhr,other
@@||pubads.g.doubleclick.net/ondemand/hls/content/*/vid/*/streams$domain=sbs.com.au
@@||pubads.g.doubleclick.net/ssai/event/$xhr,domain=sbs.com.au
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$domain=sbs.com.au
sbs.com.au##^script:has-text(NREUM)
@@||sbs.com.au^$ghide
@@/ad/banner/_adsense_/_adserver/_adview_.ad.json$1p
@@||sbs.com.au/ondemand/ad/peel1.js$script,domain=sbs.com.au
*$script,3p,redirect-rule=noopjs,domain=sbs.com.au
! https://github.com/uBlockOrigin/uAssets/issues/22753
@@||sbs.com.au^$xhr,1p
@@||dpm.demdex.net^$xhr,domain=sbs.com.au
! https://github.com/uBlockOrigin/uAssets/issues/24045
sbs.com.au##+js(aopr, odabd)

! https://github.com/uBlockOrigin/uAssets/issues/2547
neko-miku.com##+js(aeld, load, nextFunction)
||player.neko-miku.com/*slot$media,redirect=noopmp4-1s,domain=neko-miku.com

! https://github.com/uBlockOrigin/uAssets/issues/1322
! http://www.subtorrents.io/series/the-durrells/ popups
subtorrents.*,subtorrents1.*##+js(aopr, capapubli)
subtorrents.*,subtorrents1.*##+js(aopr, getUrlParameter)
subtorrents.*,subtorrents1.*##+js(nowebrtc)
subtorrents.*,subtorrents1.*##+js(noeval)
subtorrents.*,subtorrents1.*##+js(popads-dummy)
subtorrents.*,subtorrents1.*##+js(set, btoa, null)

! https://github.com/uBlockOrigin/uAssets/issues/2557
lordpremium.*##+js(aeld, load, nextFunction)

! https://github.com/uBlockOrigin/uAssets/issues/2559
tranny.one##+js(popads-dummy)
tranny.one##+js(aopr, open)
tranny.one##+js(aopr, exoNoExternalUI38djdkjDDJsio96)
tranny.one##.adsFirst
tranny.one##.adsSecond
tranny.one##.squarecont
||tranny.one/trannystatic/ads/

! https://github.com/uBlockOrigin/uAssets/issues/2562
pornhost.com##+js(aopw, encodeURIComponent)

! https://www.reddit.com/r/uBlockOrigin/comments/8rer61
loveroms.*##+js(acs, decodeURI, decodeURIComponent)

! https://github.com/uBlockOrigin/uAssets/issues/2535
! https://github.com/uBlockOrigin/uAssets/issues/2536
! https://github.com/uBlockOrigin/uAssets/issues/2555
! https://github.com/uBlockOrigin/uAssets/issues/2564
! https://github.com/uBlockOrigin/uAssets/issues/2565
! https://github.com/uBlockOrigin/uAssets/issues/2566
! https://github.com/uBlockOrigin/uAssets/issues/2567
! https://github.com/uBlockOrigin/uAssets/issues/2568
! https://github.com/uBlockOrigin/uAssets/issues/2569
! https://github.com/uBlockOrigin/uAssets/issues/2570
! https://github.com/uBlockOrigin/uAssets/issues/2571
! https://github.com/uBlockOrigin/uAssets/issues/2572
! https://github.com/uBlockOrigin/uAssets/issues/2573
! https://github.com/uBlockOrigin/uAssets/issues/2574
! https://github.com/uBlockOrigin/uAssets/issues/2575
! https://github.com/uBlockOrigin/uAssets/issues/2576
! https://github.com/uBlockOrigin/uAssets/issues/2577
! https://github.com/uBlockOrigin/uAssets/issues/2584
! https://github.com/uBlockOrigin/uAssets/issues/2585
! https://github.com/uBlockOrigin/uAssets/issues/2586
! https://github.com/uBlockOrigin/uAssets/issues/2587
! https://github.com/uBlockOrigin/uAssets/issues/2588
! https://github.com/uBlockOrigin/uAssets/issues/2589
! https://github.com/uBlockOrigin/uAssets/issues/2590
! https://github.com/uBlockOrigin/uAssets/issues/2591
1xxx-tube.com,asssex-hd.com,bigcockfreetube.com,bigdickwishes.com,enjoyfuck.com,freemomstube.com,fuckmonstercock.com,gobigtitsporn.com,gofetishsex.com,hard-tubesex.com,hd-analporn.com,hiddencamstube.com,kissmaturestube.com,lesbianfantasyxxx.com,modporntube.com,pornexpanse.com,pornokeep.com,pussytubeebony.com,tubesex.me,vintagesexpass.com,voyeur-pornvideos.com,voyeurspyporn.com,voyeurxxxfree.com,xxxtubenote.com,yummysextubes.com##+js(aopr, Aloader.serve)
1xxx-tube.com,asssex-hd.com,bigcockfreetube.com,bigdickwishes.com,enjoyfuck.com,freemomstube.com,fuckmonstercock.com,gobigtitsporn.com,gofetishsex.com,hard-tubesex.com,hd-analporn.com,hiddencamstube.com,kissmaturestube.com,lesbianfantasyxxx.com,modporntube.com,pornexpanse.com,pornokeep.com,pussytubeebony.com,tubesex.me,vintagesexpass.com,voyeur-pornvideos.com,voyeurspyporn.com,voyeurxxxfree.com,xxxtubenote.com,yummysextubes.com##+js(noeval)
1xxx-tube.com###invideo_3
enjoyfuck.com,pornokeep.com##.advin
fuckmonstercock.com##.znaipn
fuckmonstercock.com##.ztkady
kissmaturestube.com,yummysextubes.com##.block-a
pornexpanse.com##.banners_pl
pussytubeebony.com##div.banner-area
tubesex.me##.adban1

! https://github.com/uBlockOrigin/uAssets/issues/2582
||uii.io^$csp=script-src 'self' 'unsafe-inline' 'unsafe-eval' data: *.gstatic.com *.google.com *.googletagmanager.com *.recaptcha.net
uii.io##+js(noeval)
uii.io##+js(nowebrtc)
uii.io##+js(nowoif)
@@||uii.io^$ghide
*$frame,denyallow=google.com|hcaptcha.com,domain=uii.io
uii.io##.banner
uii.io##a[href^="https://href.li/"]
uii.io##a[href^="http://mob1ledev1ces.com/"]
uii.io##body > div[style]:has(input[type="button"])
uii.io##div[style*="z-index:99999"] > div[style*="width:300px"]
! https://github.com/uBlockOrigin/uAssets/issues/2582#issuecomment-490780661
!#if env_chromium
uii.io##+js(aeld, mouseup, _blank)
uii.io#@#+js(noeval)
!#endif

! https://forums.lanik.us/viewtopic.php?p=137876#p137876
lebensmittelpraxis.de##+js(nostif, nextFunction, 2000)

! https://www.reddit.com/r/uBlockOrigin/comments/8rnrsa
telemundodeportes.com##+js(set, adBlockEnabled, false)
@@||v.fwmrm.net/ad/$xhr,domain=telemundodeportes.com

! https://github.com/uBlockOrigin/uAssets/issues/2606
ojogos.com.br##+js(set, sp_ad, true)
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=witchhut.com

! https://github.com/uBlockOrigin/uAssets/issues/2605
studopedia.org##+js(aopw, detectAdblk)

! https://github.com/uBlockOrigin/uAssets/issues/2614
sheamateur.com##+js(aopr, __htapop)

! https://github.com/uBlockOrigin/uAssets/issues/2615
nekopoi.*##+js(acs, atob, tabunder)
nekopoi.*##+js(aeld, , adsense)
nekopoi.*##[href^="http://bit.ly/"]
*.gif$domain=nekopoi.*,image

! https://www.reddit.com/r/assholedesign/comments/8scqdg/no_journalists_should_go_unpaid/e0ycqf7/
||d3jcjsor8fnmka.cloudfront.net^

! https://github.com/uBlockOrigin/uAssets/issues/2618
ccn.com##.widget:has-text(/advert|sponsor/i)
ccn.com##.row.divider:has-text(/sponsor|press releases/i)

! https://github.com/uBlockOrigin/uAssets/issues/7334
! https://vinaurl.net/PTOK4d
vinaurl.*##+js(aopr, app_vars.force_disable_adblock)
vinaurl.*##+js(aopr, open)
vinaurl.*##+js(aopw, adsHeight)
vinaurl.*##+js(ra, onmousemove, button)
vinaurl.*##+js(set, blurred, false)
||dembuon.vn/lib/flies/flier.js$script,domain=vinaurl.*
||i.imgur.com^$image,domain=vinaurl.*
vinaurl.*###ads-notice
vinaurl.*##[href^="https://dembuon.vn"]
vinaurl.*##.alert-danger
vinaurl.*##[href^="https://kttm.club/"]
||vinaurl.*/*png
! https://loptelink.com/oLpaN
gamelopte.com##+js(nano-sib, yuidea-, *)
loptelink.com##+js(set, blurred, false)
loptelink.com##center > a[href^="https://loptelink.com/ref/"] > img
||googleusercontent.com/*/s320/download-button-gif-$domain=loptelink.com

! https://github.com/uBlockOrigin/uAssets/issues/2628
! https://github.com/NanoMeow/QuickReports/issues/680
powforums.com##+js(set, adsBlocked, false)
powforums.com##+js(nowoif)
@@||powforums.com/js/*$xhr,1p

! https://github.com/uBlockOrigin/uAssets/issues/2637
usgamer.net##+js(set, _sp_.msg.displayMessage, noopFunc)

! https://github.com/NanoAdblocker/NanoFilters/issues/112
wallpapersmania.com##.js_disabled
wallpapersmania.com###cpa_wrap

! https://github.com/uBlockOrigin/uAssets/issues/2645
megacams.me##+js(aeld, load)
@@||chaturbate.com/affiliates/$frame,domain=megacams.me
megacams.me#@#a[href^="https://chaturbate.com/affiliates/"]
@@||chaturbate.com^$popup,domain=megacams.me

! https://github.com/uBlockOrigin/uAssets/issues/2647
sexviacam.com#@#a[href^="https://chaturbate.com/affiliates/"]
@@||chaturbate.com^$frame,domain=sexviacam.com

! https://github.com/uBlockOrigin/uAssets/issues/3568
porndoe.com##+js(aopr, open)
porndoe.com##+js(aeld, click, pop_under)
porndoe.com##+js(nostif, location.href, 500)
||porndoe.com/movie/preroll/$media,1p
||porndoe.com/wp-contents/video?id=$frame
porndoe.com##.player-right
porndoe.com##.-h-ticker
##[href^="https://t.mobtyb.com/"]

! https://github.com/uBlockOrigin/uAssets/issues/2649
naughtymachinima.com##+js(acs, __htapop)
naughtymachinima.com##.col-md-8 > a[href][target="_blank"]
||chaturbate.com^$frame,domain=naughtymachinima.com

! https://github.com/uBlockOrigin/uAssets/issues/10336
!uploadbank.com##+js(aost, Math, /(?=^(?!.*(api|jquery|inlineScript|form|Progress)))/)
uploadbank.com###container > div[style="width:970px; height:200px;"]
uploadbank.com##+js(set, console.clear, noopFunc)
@@||uploadbank.com^$ghide
!uploadbank.com##+js(nowoif)
uploadbank.com###iframeCore____
||uploadbank.com/js/abcode.js
||yousaidthewallow.info^$popup

! https://github.com/uBlockOrigin/uAssets/issues/2652
! https://github.com/uBlockOrigin/uAssets/issues/2742
filecrypt.*##+js(acs, decodeURIComponent, replace)
filecrypt.*##+js(acs, parseInt, open)
filecrypt.*##+js(aopr, __pop_debugX)
filecrypt.*##+js(set, isAdblock, false)
||filecrypt.*^$popunder
@@||cutcaptcha.com/captcha/*$script,domain=filecrypt.cc|filecrypt.co
filecrypt.*##div:has(> [href*=".html"])
filecrypt.*###jvb
filecrypt.*##li:has-text(100% Anonym)
filecrypt.*##.bums
filecrypt.*##.support
filecrypt.*##[src^="https://filecrypt.cc/images/"]
filecrypt.*##[src^="../../../images/"]
filecrypt.*##[href^="/xux/"]
filecrypt.*##div[class] > i[style*="background:url"][onclick*="openLink"]
filecrypt.*##+js(ra, onclick, button[id][onclick*=".html"])
filecrypt.*##div[class] > i[style][onclick]
filecrypt.*##button[id]:has-text(/High-speed/i)
sharer.pw###overlay

! https://github.com/uBlockOrigin/uAssets/issues/2655
! https://github.com/uBlockOrigin/uAssets/issues/3262
! https://github.com/uBlockOrigin/uAssets/issues/11241
||pornblade.com/*.php
||twincdn.com^$3p,script,image
||pornblade.com^$xhr,1p
||pornfelix.com^$xhr,1p
hd-easyporn.com,pornblade.com,pornfelix.com##.vjs-overlayed
hd-easyporn.com,pornblade.com,pornfelix.com###wrapper_content > aside[id]
pornblade.com###e_v + aside[id]
*$xhr,3p,domain=hd-easyporn.com
hd-easyporn.com##[rel*="sponsored"]
||pornojenny.com/api/widget/$3p
/static/exnb/froload.js?v=$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/2657
asianxxxvideo.net##+js(aopw, ExoLoader)
asianxxxvideo.net##.a_all
asianxxxvideo.net##.play

! https://github.com/uBlockOrigin/uAssets/issues/2651
! https://github.com/uBlockOrigin/uAssets/issues/14352
channel4.com##+js(no-xhr-if, /\/ad\/g\/1/)
channel4.com##.advertsMpu
channel4.com##.block--mpu

! https://github.com/uBlockOrigin/uAssets/issues/2658
webs.com.gt##+js(acs, jQuery, Adblocker)

! https://github.com/uBlockOrigin/uAssets/issues/2659
filehorse.com##+js(set, isAdBlockActive, false)
@@||mygoroot.com^$ghide
@@||unlockvungtau.com^$ghide
! https://github.com/uBlockOrigin/uAssets/issues/6572
gsm-solution.com##+js(aopr, _0x32d5)
gsm-solution.com###adblock-blocker-overlay

! https://github.com/uBlockOrigin/uAssets/issues/2660
@@||motortrendondemand.com/advertisements-ad-unit/*$xhr,1p

! https://github.com/uBlockOrigin/uAssets/issues/2661
ettv.*##+js(nowoif)
ettv.*##+js(aopr, AaDetector)
ettv.*##:xpath('//*[contains(text(),"VPN")]'):upward(2)

! https://github.com/uBlockOrigin/uAssets/issues/2668
pelisgratis.*##+js(aopw, smrtSB)
pelisgratis.*##a[href*="look.kfiopkln.com"]
pelisgratis.*##a[href*="look.opskln.com"]

! https://github.com/uBlockOrigin/uAssets/issues/2670
! https://github.com/uBlockOrigin/uAssets/issues/5279
ver-pelis.*##+js(nowoif)
ver-pelis.*##+js(acs, decodeURI, decodeURIComponent)

! https://github.com/uBlockOrigin/uAssets/issues/2671
newpelis.*,pelix.*##+js(aeld, , 0x)
newpelis.*,pelix.*##+js(set, btoa, null)
newpelis.*,pelix.*##+js(nowoif)
newpelis.*,pelix.*##+js(aeld, load, url)
newpelis.*,pelix.*##+js(aopw, smrtSB)
newpelis.*,pelix.*##+js(aopw, smrtSP)
pelix.*##+js(aopr, AaDetector)
pelix.*##+js(aopw, adcashMacros)

! https://github.com/uBlockOrigin/uAssets/issues/2672
peliculas24.*##+js(acs, blur)
peliculas24.*##+js(aopw, smrtSB)
peliculas24.*##[href^="http://refpadsm.host/"]

! https://github.com/uBlockOrigin/uAssets/issues/2679
topvideosgay.com##+js(aopr, open)

! https://github.com/uBlockOrigin/uAssets/issues/2681
kissjav.*##.column:has(> .card > .adv)
kissjav.*##.is-12-touch.is-narrow-desktop.has-text-centered
kissjav.*##+js(aost, atob, _0x)

! https://github.com/uBlockOrigin/uAssets/issues/2666
capo2play.com##+js(acs, document.createElement, onerror)
*$popup,domain=extremotvplay.com,3p
/skipad.png$image

! https://github.com/uBlockOrigin/uAssets/issues/2694
ihackedgames.com##+js(aopr, decodeURIComponent)

! https://github.com/uBlockOrigin/uAssets/issues/2696
yxzero.xyz##+js(aopr, adBlockDetected)

! https://forums.lanik.us/viewtopic.php?p=155287&sid=9a160e54c765d0ee355eaf9be7ed45e8#p155287
! https://github.com/uBlockOrigin/uAssets/issues/9831
onlinevideoconverter.*##+js(nowoif)
@@||onlinevideoconverter.*^$ghide
onlinevideoconverter.*##.music-container > div[style] > a[href][target] > img

! https://github.com/uBlockOrigin/uAssets/issues/2697
elsfile.org##+js(aeld, load, nextFunction)

! https://github.com/uBlockOrigin/uAssets/issues/2706
pnd.*##+js(aopr, AaDetector)
pnd.*##+js(aopw, Fingerprint2)
pnd.*##A[href$=".html"][rel="nofollow norefferer noopener"]
pnd.*##.banner-captcha

! https://github.com/uBlockOrigin/uAssets/issues/2709
! https://github.com/uBlockOrigin/uAssets/issues/5750
freebitcoin.win##+js(aopr, adBlockDetected)
freebitcoin.win##+js(set, CaptchmeState.adb, undefined)
@@||freebitcoin.win^$ghide
freebitcoin.win##.wrapper > .section > .container > .row > div.d-md-block.d-none.col-md-3
freebitcoin.win##.col-md-12
||clprr.com^

! https://github.com/uBlockOrigin/uAssets/issues/2709#issuecomment-401538448
e-monsite.com##+js(set, CaptchmeState.adb, undefined)

! https://github.com/uBlockOrigin/uAssets/issues/2709#issuecomment-402537225
coindice.win##+js(set, CaptchmeState.adb, undefined)
coindice.win##+js(aopr, adBlockDetected)
@@||coindice.win^$ghide

! https://github.com/NanoAdblocker/NanoFilters/issues/117#issuecomment-401351982
planet-explorers-isos.com##+js(set, adblock, false)

! https://github.com/uBlockOrigin/uAssets/issues/2711
plusone8.com##+js(aopr, ExoLoader.serve)
plusone8.com###overlay-advertising

! https://github.com/uBlockOrigin/uAssets/issues/2712
camvideos.tv##.thumbs-items
||bblivecams.com^$frame,3p
||gldrdr.com^$frame,3p

! https://github.com/uBlockOrigin/uAssets/issues/2715
lanjutkeun.*##+js(aeld, load, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/2713
xrares.com##+js(acs, decodeURI, decodeURIComponent)
xrares.com##+js(disable-newtab-links)
xrares.com###linkedblok
xrares.com##.absd-body:not(.row + .well)
xrares.com##[href^="/plugout.php"]:upward([class^="col-sm"])
||xrares.com/sw.js$script,1p

! https://github.com/jspenguin2017/uBlockProtector/issues/958
||shidurlive.com/adz*.html$frame
||tvbarata.club/ads/*$frame

! https://github.com/uBlockOrigin/uAssets/issues/2717
@@||filmix.co^$ghide
||googleads.g.doubleclick.net/pagead/$xhr,redirect=nooptext,domain=filmix.co
||protovid.com/preroll/$media,redirect=noopmp3-0.1s,domain=filmix.co

! https://github.com/uBlockOrigin/uAssets/issues/2722
adfloz.*##+js(nowoif)
adfloz.*##+js(set, blurred, false)
adfloz.*##.banner

! https://github.com/uBlockOrigin/uAssets/issues/2729
aliancapes.*##+js(nostif, nextFunction, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/2748
radiotormentamx.com##+js(aeld, load, onload)

! https://github.com/uBlockOrigin/uAssets/issues/324
! https://github.com/uBlockOrigin/uAssets/issues/2762
! https://github.com/uBlockOrigin/uAssets/issues/2763
! https://github.com/uBlockOrigin/uAssets/commit/6732af10e9174c868938d10e944a8bd4cb2a50ca#commitcomment-29589001
*/rellect/AdblockDetector/handler.min.js$script,important,redirect=noopjs

! https://github.com/uBlockOrigin/uAssets/issues/4734
torrentz2eu.*##+js(aopr, glxopen)
torrentz2eu.*##+js(acs, decodeURI, decodeURIComponent)
torrentz2eu.*##+js(acs, $, open)

! https://github.com/uBlockOrigin/uAssets/issues/2770
@@||sport-tv-guide.live^$ghide
sport-tv-guide.live##ins.adsbygoogle
*$frame,domain=sport-tv-guide.live,redirect-rule=noopframe
sport-tv-guide.live##+js(set, bb, false)

! https://github.com/uBlockOrigin/uAssets/issues/2773
acienciasgalilei.com##+js(aeld, load, adverts-top-container)

! https://github.com/uBlockOrigin/uAssets/issues/2774
22pixx.xyz##+js(ra, onclick, button[name="imgContinue"][onclick])
22pixx.xyz##^script:has-text('shift')
22pixx.xyz##^script:has-text(\'shift\')
22pixx.xyz##+js(aopr, AdservingModule)
22pixx.xyz##+js(aopr, ExoLoader.addZone)
22pixx.xyz##+js(aopr, _pop)
22pixx.xyz##+js(ra, target, #continuetoimage > [href])
22pixx.xyz##+js(ra, href|target, #continuetoimage > [href][onclick]\, #overlayera > #ajax_load_indicator > #page_effect > [href][onclick])
22pixx.xyz##[class^="resp-container"]
*$frame,3p,domain=22pixx.xyz

! https://github.com/uBlockOrigin/uAssets/issues/2787
smsget.net##+js(nostif, Adblock, 5000)
smsget.net##+js(nostif, disable, 200)

! https://github.com/uBlockOrigin/uAssets/issues/2788
! https://github.com/uBlockOrigin/uAssets/issues/8458
temp-mails.com##+js(acs, document.getElementById, AdBlock)
temp-mails.com##+js(set, indexedDB.open, trueFunc)

! https://github.com/uBlockOrigin/uAssets/issues/2791
zigforums.com##+js(no-xhr-if, googlesyndication)
zigforums.com##+js(aopw, adsBlocked)
@@||zigforums.com/js/*$xhr,1p

! https://www.reddit.com/r/uBlockOrigin/comments/8whmpf/any_idea_how_bypass_this_block_detection/
kjanime.net##+js(nostif, CekAab, 0)

! https://github.com/uBlockOrigin/uAssets/issues/2801
soft112.com##+js(nano-sib)

! https://github.com/uBlockOrigin/uAssets/issues/2800
popmatters.com##+js(aopr, CatapultTools)

! https://github.com/uBlockOrigin/uAssets/issues/2806
goto.com.np##+js(aopr, open)
goto.com.np##+js(nano-sib, timeLeft)
link.goto.com.np##.wpsafe-top > div > center:has-text(Advertisements)
*$frame,3p,domain=goto.com.np

! https://www.reddit.com/r/uBlockOrigin/comments/8xhann/getting_around_antiadblock_on_a_wiki_site/
undeniable.info##+js(acs, document.getElementById, testadblock)

! https://github.com/uBlockOrigin/uAssets/issues/2831
transparentcalifornia.com##+js(set, $.magnificPopup.open, noopFunc)

! https://github.com/uBlockOrigin/uAssets/issues/2832
klartext-ne.de##+js(acs, document.addEventListener, google_ad_client)

! https://github.com/uBlockOrigin/uAssets/issues/2812
! https://github.com/NanoMeow/QuickReports/issues/353
titsbox.com##+js(aeld, click, exopop)
titsbox.com##+js(nowoif)
*$script,3p,domain=titsbox.com
titsbox.com##[class*="banners"]
||titsbox.com/iframe/*_NTV_
||titsbox.com/js/pns.min.js
! https://github.com/uBlockOrigin/uAssets/issues/1121
zmovs.com##+js(nowoif)
zmovs.com##+js(aopr, ALoader)
||zmovs.com/js/pns.min.js
||zmovs.com/nb/

! https://github.com/uBlockOrigin/uAssets/issues/2813
spycock.com##+js(aopr, document.dispatchEvent)
spycock.com##+js(aopw, Fingerprint2)
spycock.com##+js(nowoif)
||spycock.com/coco/$script
spycock.com##.footer-banner-wrapper
spycock.com###advertising
jizz.us,spycock.com###alfa_promo_parent
jizz.us,spycock.com##.aside-itempage-col
||jizz.us/loco/$script

! https://github.com/uBlockOrigin/uAssets/issues/2848
sandrives.*##+js(nostif, nextFunction, 250)

! https://github.com/uBlockOrigin/uAssets/issues/4885
! https://github.com/uBlockOrigin/uAssets/issues/12829
movies123.*##+js(nowoif)
0123movie.*,movies123.*##+js(aopr, AaDetector)
movies123.*##[href^="//himekingrow.com/"]
movies123.*###list-eps:style(display:block!important)
movies123.*##.les-title:has-text(HD)
movies123.*##.vip.server-item.le-server:first-child

! https://github.com/uBlockOrigin/uAssets/issues/2877
freiepresse.de##+js(set, UhasAB, false)

! https://www.reddit.com/r/uBlockOrigin/comments/8yn0ss
icy-veins.com##+js(aopr, adbackDebug)

! https://github.com/uBlockOrigin/uAssets/issues/2889
hiddenobjectgames.com##.banner

! https://github.com/uBlockOrigin/uAssets/issues/2873
@@||v.fwmrm.net/ad/$script,domain=fxnetworks.com
@@||media.truex.com/release/*TrueXRenderer.js$script,domain=fxnetworks.com

! https://github.com/uBlockOrigin/uAssets/issues/2897
files-save.com##+js(popads-dummy)
@@||files-save.com/Assets/Addon/Css/ads.css$css,1p

! https://github.com/uBlockOrigin/uAssets/issues/2901
@@||fordclub.eu^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/2907
tetris.com##.horizontalAxContainer
tetris.com##div[class^="verticalAxContainer"]

! https://github.com/uBlockOrigin/uAssets/issues/2908
girlsgogames.co.uk##+js(aopr, googletag)

! https://github.com/uBlockOrigin/uAssets/issues/2905
! https://github.com/uBlockOrigin/uAssets/issues/2909
||cdn.witchhut.com^$script,domain=ejocuri.ro|gamesheep.com|girlg.com|girlsplay.com|jocurifete.ro|playpod.com

! https://www.reddit.com/r/uBlockOrigin/comments/8z405v/ublock_origin_not_catching_google_ads_in_firefox/
! https://github.com/uBlockOrigin/uAssets/issues/3092
! https://github.com/uBlockOrigin/uAssets/issues/3994
! https://github.com/uBlockOrigin/uAssets/issues/4070
! https://www.reddit.com/r/uBlockOrigin/comments/auik40/first_time_getting_ads_while_using_ublock/
! https://github.com/NanoMeow/QuickReports/issues/2171
! added sites using the same ad-reinsertion script
anallievent.com,au-di-tions.com,badgehungry.com,beingmelody.com,bloggingawaydebt.com,casutalaurei.ro,cornerstoneconfessions.com,culture-informatique.net,dearcreatives.com,disneyfashionista.com,divinelifestyle.com,dna.fr,eslauthority.com,estrepublicain.fr,fitting-it-all-in.com,heresyoursavings.com,irresistiblepets.net,julieseatsandtreats.com,justjared.com,lecturisiarome.ro,lemonsqueezyhome.com,libramemoria.com,lovegrowswild.com,magicseaweed.com,measuringflower.com,mjsbigblog.com,mommybunch.com,mustardseedmoney.com,myfunkytravel.com,onetimethrough.com,panlasangpinoymeatrecipes.com,silverpetticoatreview.com,the-military-guide.com,therelaxedhomeschool.com,the2seasons.com,zeroto60times.com##+js(aopr, __eiPb)
adivineencounter.com,alcasthq.com,au-di-tions.com,badgehungry.com,bloggingawaydebt.com,chipandco.com,cornerstoneconfessions.com,dearcreatives.com,divinelifestyle.com,eslauthority.com,heresyoursavings.com,investingchannel.com,irresistiblepets.net,justjared.com,kompas.com,lovegrowswild.com,mjsbigblog.com,mommybunch.com,mustardseedmoney.com,myfunkytravel.com,mywomenstuff.com,onetimethrough.com,panlasangpinoymeatrecipes.com,peru21.pe,savespendsplurge.com,savvyhoney.com,silverpetticoatreview.com,tamaratattles.com,the-military-guide.com,the2seasons.com,therelaxedhomeschool.com,thetechieguy.com,truesteamachievements.com,truetrophies.com,waterheaterleakinginfo.com,zeroto60times.com##^script:has-text(axtd)
justjared.com,truetrophies.com##+js(acs, setTimeout, isIframeNetworking)
truetrophies.com##+js(aopr, $pxy822)
truetrophies.com##^script:has-text(isIframeNetworking)
alcasthq.com##+js(aopr, performance)
alcasthq.com##+js(acs, Math.floor, axtd)

! https://github.com/uBlockOrigin/uAssets/issues/2920
cut-fly.com##+js(nowoif)
cut-fly.com##+js(set, blurred, false)
cut-fly.com##.banner-inner
cut-fly.com##form#go-popup:remove()

! https://github.com/NanoAdblocker/NanoFilters/issues/136
gioialive.it##+js(nostif, rbm_block_active, 1000)

! https://github.com/uBlockOrigin/uAssets/issues/18577
investing.com##+js(no-fetch-if, ads)
investing.com##[class^="outbrain_outbrain-wrapper"]
! https://github.com/uBlockOrigin/uAssets/issues/12831
investing.com##[class*="adBlock"]
investing.com##[class*="overlay_overlay"]
investing.com##body:style(overflow: auto !important)
! https://github.com/uBlockOrigin/uAssets/issues/18310
investing.com###__next > .fixed
! https://github.com/uBlockOrigin/uAssets/issues/18731#issuecomment-1613121145
||investing.com/*/ad-notification-popup
! https://www.reddit.com/r/uBlockOrigin/comments/14djjud/just_to_let_developers_know_that_investingcom/jqdzkm7/
investing.com##[class^="ad-notification"]
! https://www.reddit.com/r/uBlockOrigin/comments/14r9m8a/
investing.com##[id^="adNotification"]
! https://github.com/uBlockOrigin/uAssets/issues/18917
! https://github.com/uBlockOrigin/uAssets/issues/18966
investing.com##+js(set, adNotificationDetected, false)
investing.com##[class*="notification_notification"]
investing.com##div[class]:has(> :is(.ad-blockers-section, [class*="adNotification"]))
! https://github.com/uBlockOrigin/uAssets/issues/19085#issuecomment-1643681900
investing.com##.border-b:has(> .box-content[data-test="ad-slot-visible"])

! https://github.com/uBlockOrigin/uAssets/issues/2926
ausfile.com##+js(aopw, Fingerprint2)
ausfile.com##+js(aopw, SubmitDownload1)
ausfile.com##+js(nano-stb)
@@||ausfile.com^$ghide
ausfile.com##ins.adsbygoogle

! https://www.reddit.com/r/uBlockOrigin/comments/8zm7bx
femdomtb.com##+js(nostif, innerText, 2000)
femdomtb.com##+js(aopr, open)
femdomtb.com##.bannerImage
femdomtb.com##div.opt
femdomtb.com##.place

! https://github.com/uBlockOrigin/uAssets/issues/2938
! https://www.reddit.com/r/uBlockOrigin/comments/ap353j/help_needed_for_voirfilms/
@@||voirfilms.*^$ghide
voirfilms.*##+js(aopw, smrtSB)
voirfilms.*##+js(nowoif)
voirfilms.*##.lefermeur
voirfilms.*##+js(acs, atob, decodeURIComponent)
||voirfilms.*/sw.js

! https://github.com/uBlockOrigin/uAssets/issues/2946
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=coolgames.com
@@||g.doubleclick.net/pagead/managed/js/gpt/*/pubads_impl.js$domain=games.coolgames.com

! https://github.com/uBlockOrigin/uAssets/issues/2965
classicreload.com##.ad-wrapper:upward(div.region-sidebar-first-wrapper)
classicreload.com##+js(nostif, show())
classicreload.com##.content-top-wrapper

! https://github.com/uBlockOrigin/uAssets/issues/2969
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=stickgames.com

! https://github.com/uBlockOrigin/uAssets/issues/2971
senmanga.com##+js(aopr, AaDetector)
senmanga.com##[class*="banner"]
*$script,3p,domain=senmanga.com

! https://github.com/uBlockOrigin/uAssets/issues/2972
mimaletamusical.blogspot.com##+js(nowebrtc)
mimaletamusical.blogspot.com##+js(aeld, load, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/2974
||cdn.rawgit.com^*/arlinablock.js$script
||cdn.rawgit.com^*/AdblockRampok.js$script

! https://www.reddit.com/r/uBlockOrigin/comments/90x6vn
! https://github.com/uBlockOrigin/uAssets/issues/16449
@@||faucetcrypto.com^$ghide
||faucetcrypto.com/ads/$frame
faucetcrypto.com##+js(no-fetch-if, googlesyndication)
faucetcrypto.com##+js(nosiif, user=null, 1000)
faucetcrypto.com##.vs-dialog-danger.con-vs-dialog.vs-component
*$frame,redirect-rule=noopframe,domain=faucetcrypto.com

! https://github.com/uBlockOrigin/uAssets/issues/2983
linkfinal.com##+js(set, blurred, false)
linkfinal.com##.banner
linkfinal.com##.blog-content

! https://github.com/uBlockOrigin/uAssets/issues/13864
hotpornfile.org##+js(aopw, getIfc)
hotpornfile.org##+js(aeld, getexoloader)
*$popunder,domain=hotpornfile.org
hotpornfile.org##+js(nostif, _0x)
! https://github.com/uBlockOrigin/uAssets/issues/16197
! https://github.com/uBlockOrigin/uAssets/commit/20f1238c39ff45e17315af334af799feff505ce8#commitcomment-94788494
search.crowdsearch.net#@##adslot1
! https://github.com/uBlockOrigin/uAssets/issues/18803
hotpornfile.org##+js(set, adblockcheck, false)
hotpornfile.org##+js(nowoif, !bergblock, 10)
@@||searchwithme.net/redirect?tid=$frame,domain=hotpornfile.org
||hotpornfile.org/wp-content/themes/hpf-theme/assets/img/search-ash.gif$image

! https://github.com/uBlockOrigin/uAssets/issues/2996
moviejones.de##+js(acs, document.getElementById, overlayBtn)

! https://github.com/uBlockOrigin/uAssets/issues/3004
! https://github.com/uBlockOrigin/uAssets/issues/7487
hackyouriphone.org##.labeladv

! https://github.com/uBlockOrigin/uAssets/issues/3005
donnaglamour.it##+js(aopw, adBlockRunning)
donnaglamour.it##.banner_contest

! https://www.reddit.com/r/uBlockOrigin/comments/91jf4m
@@||globaltv.com^$ghide
globaltv.com##.adChoices_overlayContainer
globaltv.com##.adTile
globaltv.com##.dynamic-ad-wrapper
globaltv.com##.footerAd-wrapper
globaltv.com###_evidon_banner

! https://github.com/uBlockOrigin/uAssets/issues/3019
repelisgoo.*,repelisgooo.*,repelisgt.*,repelisxd.*,pelisplusgo.*,pelisplusxd.*###ads
repelisgoo.*,repelisgooo.*,repelisgt.*,repelisxd.*,pelisplusgo.*,pelisplusxd.*##div[class]:has(> div[class] > iframe[src*="/srv-pv/tag-"])

! https://github.com/uBlockOrigin/uAssets/issues/3021
pelisplus.online##+js(aopw, mz_str)
pelisplus.online##+js(aopr, popjs.init)
pelisplus.online##a.fasc-button
pelisplus.online###custom_html-7
cine24.online##+js(nowoif)
cine24.online###publicidad-video
@@||cine24.online^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/2963
tornadomovies.*##+js(set, atob, noopFunc)
||tornadomovies.*/sw.js$script
tornadomovies.*##[href="/user/premiumregistration"]

! https://github.com/uBlockOrigin/uAssets/issues/3031
! https://github.com/uBlockOrigin/uAssets/issues/1409
avgle.com###player_3x2_close:style(opacity: 0 !important; height: 300px !important;)
avgle.com###ps32-container
*$3p,popup,domain=avgle.com
*$frame,script,3p,denyallow=cloudflare.com|cloudflare.net|google.com|gstatic.com|hcaptcha.com|jsdelivr.net|recaptcha.net|webflow.com,domain=avgle.com
javher.com###popunderLink
javher.com##.affiliate-card-container

! https://github.com/uBlockOrigin/uAssets/issues/3036
sexwebvideo.*##+js(aeld, , _blank)
sexwebvideo.*##+js(set, flashvars.popunder_url, '')
@@||sexwebvideo.*^$ghide
sexwebvideo.*##.spot-vertical-wrap
*banner$domain=sexwebvideo.*,frame

! https://github.com/uBlockOrigin/uAssets/issues/3038
novelasesp.*##+js(aeld, load, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/3043
playrust.io##+js(aeld, , Date)

! https://github.com/uBlockOrigin/uAssets/issues/3065
supforums.com##+js(set, adsBlocked, false)
supforums.com##+js(aopr, htaUrl)

! https://github.com/uBlockOrigin/uAssets/issues/3079
! https://github.com/uBlockOrigin/uAssets/issues/3287
||booking.com^$popunder,domain=viamichelin.*

! https://github.com/uBlockOrigin/uAssets/issues/3086
mp3fiber.com##+js(aeld, /^(?:click|mousedown)$/, _0x)
mp3fiber.com##+js(aeld, load, nextFunction)
mp3fiber.com##+js(set, _pop, noopFunc)

! https://github.com/uBlockOrigin/uAssets/issues/3098
chicoer.com##+js(nostif, n.trigger, 1)
chicoer.com##+js(set, CnnXt.Event.fire, noopFunc)

! https://github.com/uBlockOrigin/uAssets/issues/3096
visionias.net##+js(aeld, load, 2000)
*.gif$domain=www.visionias.net,image

! https://github.com/uBlockOrigin/uAssets/issues/3102
tennisactu.net##+js(acs, document.getElementById, ads)

! https://github.com/uBlockOrigin/uAssets/issues/3114
xrivonet.info##+js(aopw, Fingerprint2)
xrivonet.info##+js(aeld, /^(?:click|mousedown)$/, _0x)
xrivonet.info##+js(nowebrtc)
xrivonet.info##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/3116
! https://github.com/NanoMeow/QuickReports/issues/185
suedkurier.de##+js(set, _ti_update_user, noopFunc)

! https://github.com/uBlockOrigin/uAssets/issues/3118
gounlimited.to##+js(acs, $, adb)
gounlimited.to##+js(nowoif)
gounlimited.to##+js(nowebrtc)

! https://github.com/uBlockOrigin/uAssets/issues/3115
! https://www.reddit.com/r/uBlockOrigin/comments/117xsif/
cbssports.com##div#network-bar-spacer:style(height:0 !important)
@@||imasdk.googleapis.com/$frame,domain=cbssports.com
@@||imasdk.googleapis.com/js/sdkloader/$script,domain=cbssports.com
@@||cbsistatic.com/*/bundles/$script,domain=cbssports.com
@@||cbssports.com^$ghide
@@||plotrabbit.com^$script,domain=cbssports.com
@@||saa.cbssports.com^$script,1p
@@||discreetquarter.com^$xhr,domain=cbssports.com
cbssports.com#@#.leaderboard-wrap
cbssports.com#@#.skybox-top-wrapper

! https://github.com/uBlockOrigin/uAssets/issues/3121
animeheaven.*##+js(set, check_adblock, true)
||animeheaven.*/api/pop.php$xhr,1p

! https://github.com/uBlockOrigin/uAssets/issues/3125
payskip.org##+js(aeld, DOMContentLoaded, &nbsp)
payskip.org##+js(aopw, atOptions)
payskip.org##+js(set, blurred, false)
payskip.org##+js(ra, onclick)
||payskip.org/sw.js$script,1p
||payskip.org/VLC.php$frame,1p
payskip.org##.box-main center > a[href][target="_blank"] > img
payskip.org##center > center
payskip.org###link-view > p
payskip.org###link-view a[href] > img
*$script,3p,denyallow=cloudflare.com|cloudflare.net|google.com|gstatic.com|jsdelivr.net|recaptcha.net|tawk.to,domain=payskip.org

! https://github.com/uBlockOrigin/uAssets/issues/3130
@@||shortit.pw^$ghide
shortit.pw##+js(nowoif)
shortit.pw##+js(set, console.clear, noopFunc)
shortit.pw##+js(set, valid, 1)
||allcoins.pw/js/ref.js
||shortit.pw/js/adbb.js

! https://github.com/uBlockOrigin/uAssets/issues/3134
pirateproxy.*##+js(nowebrtc)
pirateproxy.*,thehiddenbay.com##+js(acs, String.fromCharCode, decodeURIComponent)
pirate.*,piratebay.*,pirateproxy.*,proxytpb.*,thepiratebay.*##+js(aeld, /^(?:click|mousedown)$/, _0x)
piratebay.*##+js(aopr, AaDetector)
pirateproxy.*##+js(acs, Object.defineProperty, document.body.appendChild)
piratebay.*,pirateproxy.*##[href]:has-text(PLAY)
||nfkd2ug8d9.com^
pirateproxy.*,thehiddenbay.com###content > div > iframe

! https://github.com/uBlockOrigin/uAssets/issues/3143
vidcloud.*##+js(nowoif)
vidcloud.*##+js(aopr, BetterJsPop)
vidcloud.*##+js(aopr, decodeURI)
vidcloud.*##+js(aopw, adBlockDetected)
vidcloud.*##+js(aopr, __Y)
vidcloud.*###overlay-center

! https://github.com/uBlockOrigin/uAssets/issues/3147
@@||adinplay.com/libs/aiptag/assets/adsbygoogle.js^$xhr,domain=devast.io
devast.io###advert

! https://github.com/uBlockOrigin/uAssets/issues/1220
! https://github.com/uBlockOrigin/uAssets/issues/3149
imgrock.*##+js(aopr, CustomEvent)
imgrock.*##+js(aopr, popjs.init)
imgrock.*##+js(aopw, Fingerprint2)
imgrock.*##+js(nano-stb, /.?/, 4000)
imgrock.*##+js(popads-dummy)
imgrock.*##+js(popads.net)
@@||imgrock.*^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/3152
imgtorrnt.in##+js(aopr, ExoLoader.serve)
imgtorrnt.in##+js(aopr, document.dispatchEvent)
imgtorrnt.in##+js(aeld, , _0x)
imgtorrnt.in##[id*="Banner"]
||ddns.net/*.php$frame
*$frame,3p,domain=imgtorrnt.in
*$popunder,3p,domain=imgtorrnt.in
imgtorrnt.in##.bannerImage
*.gif$domain=imgtorrnt.in,image

! https://github.com/uBlockOrigin/uAssets/issues/3158
! https://github.com/uBlockOrigin/uAssets/issues/5357
! https://github.com/NanoMeow/QuickReports/issues/1218
webbro.*##+js(aopr, AaDetector)
@@||webbro.*^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/3159
javhay.net##.title-most-views:first-child
javhay.net###logoplayer
iframejav.*##+js(nowoif)
iframejav.*##+js(aopr, __Y)

! https://github.com/uBlockOrigin/uAssets/issues/3160
anysex.com##+js(set, vastAds, [])
anysex.com##+js(aopr, ExoLoader)
anysex.com##+js(aopr, document.dispatchEvent)
anysex.com##+js(aopr, console.clear)
anysex.com##+js(aopr, decodeURI)
anysex.com##[class^="content"] > .no_pop
anysex.com###content > .naf_dd
anysex.com##+js(aopr, setExoCookie)

! https://github.com/uBlockOrigin/uAssets/issues/3162
||nwch.az-cdn.ch^$script,domain=solothurnerzeitung.ch

! https://www.reddit.com/r/Adblock/comments/95ipg0
gocurrycracker.com##+js(aopr, encodeURIComponent)

! https://github.com/uBlockOrigin/uAssets/issues/3399
! https://github.com/uBlockOrigin/uAssets/issues/14692
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=gentside.*|maxisciences.com|ohmymag.*
!*$script,redirect-rule=noopjs,domain=gentside.*|gentside.com|gentside.de|gentside.co.uk|maxisciences.com|ohmymag.com|ohmymag.de|ohmymag.co.uk,3p
@@||maxisciences.com/js/amazon/$script,domain=maxisciences.com
@@||googletagservices.com/tag/js/gpt.js$script,domain=gentside.*|maxisciences.com|ohmymag.*
@@*/assets/prebid/$script,xhr,1p,domain=gentside.*|maxisciences.com|ohmymag.*
@@||securepubads.g.doubleclick.net/tag/js/gpt.js$script,domain=gentside.*|ohmymag.*
@@||securepubads.g.doubleclick.net/*/pubads_impl.js$script,domain=gentside.*|ohmymag.*
@@||cdn.adsafeprotected.com^$script,domain=gentside.*|ohmymag.*|maxisciences.com
@@||pixel.adsafeprotected.com/services/pub$xhr,domain=gentside.*|ohmymag.*|maxisciences.com
@@||btloader.com/tag?h=prismamedia-com&upapi=true$script,domain=maxisciences.com|gentside.*|ohmymag.*
@@||js-sec.indexww.com/$script,domain=maxisciences.com|gentside.*|ohmymag.*
@@||prismamedia-com.videoplayerhub.com/galleryplayer.js$script,domain=maxisciences.com|gentside.*|ohmymag.*
@@||tra.scds.pmdstatic.net/advertising-core/$script,domain=gentside.*|gentside.com|gentside.de|gentside.co.uk|maxisciences.com|ohmymag.com|ohmymag.de|ohmymag.co.uk

! https://github.com/uBlockOrigin/uAssets/issues/3176
thurrott.com##+js(acs, $, adblockDetected)

! https://github.com/uBlockOrigin/uAssets/issues/3180
! https://github.com/NanoMeow/QuickReports/issues/3313
icdrama.*,vlist.se##+js(set, adblock, 1)
icdrama.*###closeADV

! https://github.com/uBlockOrigin/uAssets/issues/7216
streamdreams.org##+js(aopr, exoJsPop101)

! https://github.com/uBlockOrigin/uAssets/issues/3200
wowescape.com,games2rule.com,bigescapegames.com##.col-12:has(> .adsbyvli)
wowescape.com,games2rule.com,bigescapegames.com##.col-12:has(> .adsbygoogle)
wowescape.com,games2rule.com,bigescapegames.com##div.border_radius:has-text(Advertisement)
wowescape.com##+js(no-fetch-if, adsbygoogle)
wowescape.com###gameplay > iframe:style(display: block !important;)
wowescape.com###preroll

! https://github.com/uBlockOrigin/uAssets/issues/4476
! https://github.com/uBlockOrigin/uAssets/issues/14708
duellinksmeta.com##+js(noeval)
*$script,redirect-rule=noopjs,domain=duellinksmeta.com
@@||cdn.intergi.com/hera/*$xhr,domain=duellinksmeta.com
@@||cdn.intergient.com^$script,xhr,domain=duellinksmeta.com
@@||duellinksmeta.com^$1p
@@||duellinksmeta.com^$ghide
duellinksmeta.com##.advertisement-box
duellinksmeta.com##.ad-slot

! https://github.com/uBlockOrigin/uAssets/issues/3205
pornve.com##+js(set, frg, 1)
pornve.com##+js(nowoif)
pornve.com###blockblockB:style(display: block!important;)
pornve.com###blockblockA
pornve.com###close-teaser

! https://github.com/uBlockOrigin/uAssets/issues/3214
seselah.com##+js(aopw, adBlockDetected)

! https://github.com/uBlockOrigin/uAssets/issues/3212
venstrike.jimdofree.com##+js(aeld, load, nextFunction)

! https://github.com/uBlockOrigin/uAssets/issues/3211
@@||programasve.blogspot.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/3208
maxcheaters.com##.esPopupWrapper
maxcheaters.com##.b-modal
@@||maxcheaters.com/uploads2/country/*.gif$image
maxcheaters.com##.ipsContained.ipsImage
maxcheaters.com##+js(nostif, adblock)

! https://github.com/uBlockOrigin/uAssets/issues/3206
mivo.com##.ads

! https://github.com/uBlockOrigin/uAssets/issues/3222
sportsplays.com##+js(nostif, abDetected)

! https://github.com/uBlockOrigin/uAssets/issues/3223
! https://github.com/NanoAdblocker/NanoFilters/issues/186
! https://github.com/NanoMeow/QuickReports/issues/196
rmdown.com##+js(aopw, open)
rmdown.com##.container td[bgcolor="white"] > a[target="_blank"]
*$image,3p,redirect=1x1.gif,domain=rmdown.com

! https://github.com/NanoMeow/QuickReports/issues/442
! https://github.com/uBlockOrigin/uAssets/issues/4353
! https://github.com/NanoMeow/QuickReports/issues/534
! https://github.com/NanoMeow/QuickReports/issues/667
dailybreeze.com,dailybulletin.com,dailynews.com,delcotimes.com,eastbaytimes.com,macombdaily.com,ocregister.com,pasadenastarnews.com,pe.com,presstelegram.com,redlandsdailyfacts.com,reviewjournal.com,santacruzsentinel.com,saratogian.com,sentinelandenterprise.com,sgvtribune.com,tampabay.com,times-standard.com,theoaklandpress.com,trentonian.com,twincities.com,whittierdailynews.com##+js(set, CnnXt.Event.fire, noopFunc)
*$script,domain=delcotimes.com|macombdaily.com|santacruzsentinel.com|saratogian.com|theoaklandpress.com|trentonian.com,redirect-rule=noopjs
*$image,domain=delcotimes.com|macombdaily.com|santacruzsentinel.com|saratogian.com|theoaklandpress.com|trentonian.com,redirect-rule=2x2.png
ocregister.com##a[href^="http://www.webpublished.com"]

! https://github.com/uBlockOrigin/uAssets/commit/d3da1a8ea7ca2065f4616aacc4d542e2ac4f8e72#commitcomment-30109151
@@||mobinozer.com^$ghide
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=mobinozer.com

! https://github.com/uBlockOrigin/uAssets/issues/16420
pixlr.com###workspace:style(right: 0px !important;)
! https://github.com/uBlockOrigin/uAssets/issues/18373
pixlr.com###right-space

! https://github.com/uBlockOrigin/uAssets/issues/3254
schoener-wohnen.de##+js(aopr, _sp_._networkListenerData)

! http://www.gamesgames.com/game/mahjong-quest anti adb
@@||gamesgames.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/3257
! https://github.com/uBlockOrigin/uAssets/issues/7931
savemedia.*##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/3263#issuecomment-414133567
watchhouseonline.net##+js(aopr, decodeURI)
watchhouseonline.net###custom_html-2

! https://github.com/uBlockOrigin/uAssets/issues/3268
! https://github.com/uBlockOrigin/uAssets/issues/14634
linkedin.com##.ad-banner-container

! https://github.com/NanoMeow/QuickReports/issues/4
||2mdn.net^$media,redirect=noopmp4-1s,domain=games2rule.com
||youtube.com/get_video$media,redirect=noopmp4-1s,domain=games2rule.com
@@||googleads.g.doubleclick.net/pagead/*games2rule$xhr,domain=imasdk.googleapis.com
games2rule.com##embed:style(display:inherit!important)
games2rule.com##[id^="gdsdk_"]
games2rule.com##div:has(> div:has(> .adsbygoogle))
games2rule.com##div.border_radius:has-text(Advertisement)
games2rule.com##.col-sm-4:has-text(Advertisement)
games2rule.com##+js(ra, target)

! https://github.com/uBlockOrigin/uAssets/issues/3276
! https://github.com/uBlockOrigin/uAssets/issues/11143
elixx.*##+js(aopr, AdservingModule)
elixx.*##+js(aopr, LieDetector)
elixx.*##+js(aopw, I833)
elixx.*##+js(json-prune, urls, urls.0)
elixx.*##^script:has-text(0x3)
||elixx.*/popcash.js^

! ads, popups https://www.limetorrents .info/search/all/duck/
! https://github.com/AdguardTeam/AdguardFilters/issues/115648
! https://github.com/uBlockOrigin/uAssets/issues/561#issuecomment-1833524685
! => limetorrents. lol
limetorrents.*##+js(aeld, , _0x)
limetorrents.*##+js(aeld, load, onload)
limetorrents.*##+js(acs, Object.assign, popunder)
limetorrents.*##+js(acs, Math, XMLHttpRequest)
limetorrents.*##+js(nowoif)
limetorrents.*##[href^="/fast.php"]
limetorrents.*##div:has(> div > a[href^="/leet/?"])
limetorrents.*##tr:has-text(VPN)
||limetorrents.*/sw.js
! https://github.com/uBlockOrigin/uAssets/issues/7592
@@||limetorrents.*^$ghide
limetorrents.*##[href^="https://affiliate.rusvpn.com/"]
limetorrents.*##.head:has-text(Adv)

! https://github.com/uBlockOrigin/uAssets/issues/3288
ebookdz.com##+js(aopr, AaDetector)
ebookdz.com##+js(nowebrtc)
ebookdz.com##+js(nostif, nextFunction, 2000)
@@||ebookdz.com^$ghide
*$script,domain=ebookdz.com,redirect-rule=noopjs
ebookdz.com##[href*="offer"]

! https://github.com/uBlockOrigin/uAssets/issues/3289
telerium.*##+js(nostif, KeepOpeningPops, 1000)
telerium.*##+js(nowoif)
telerium.*##+js(aopr, LieDetector)
@@||telerium.*^$ghide
telerium.*###overlay
onhockey.tv,web.livecricket.is##+js(nowebrtc)
||onhockey.tv/stopadblock*.jpg$image

! https://github.com/NanoMeow/QuickReports/issues/23
! https://github.com/uBlockOrigin/uAssets/issues/4337
@@||amc.com^$ghide
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=amc.com
! https://github.com/uBlockOrigin/uAssets/issues/13065
||ssaimanifest.prod.boltdns.net^$xhr,removeparam=prof,domain=amc.com

! https://github.com/uBlockOrigin/uAssets/issues/3298
pornvideospass.com##+js(aopw, Aloader)
pornvideospass.com##+js(aopw, bindall)

! https://github.com/uBlockOrigin/uAssets/issues/3300
barfuck.com##+js(aopr, document.dispatchEvent)
barfuck.com###im-layer
||curvyfemales.com/*.php$script,1p
curvyfemales.com##.im-show

! https://github.com/uBlockOrigin/uAssets/issues/3301
pornvideotop.com##+js(aopr, open)
pornvideotop.com##+js(nostif, location.href)
pornvideotop.com###user18div
||aa.pornvideotop.com^
||pornvideotop.com/ads300x250.php
||pornvideotop.com/e/fp.js
||pornvideotop.com/js/popec.js
||spermyporn.com/js/my.js
||young-porn-movie.com/adv.js
||tds.pornvideotop.com^

! https://github.com/uBlockOrigin/uAssets/issues/1886#issuecomment-415991715
! https://forums.lanik.us/viewtopic.php?f=103&t=35451
/mod_ablockdetector/*
@@||trecetv.es^$ghide
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=shares.enetres.net
@@||player.enetres.net/js/videojs-plugins/videojs-ads-contrib/videojs.ads.js$script,domain=shares.enetres.net

! https://github.com/uBlockOrigin/uAssets/issues/13250
file4go.*##+js(acs, document.getElementById, ad_block)
file4go.*##+js(set, time, 0)
@@||file4go.*/ads.js$script,1p
file4go.*##div.banner300b, .lateral

! https://github.com/uBlockOrigin/uAssets/issues/1603
! https://github.com/uBlockOrigin/uAssets/issues/4860
! https://github.com/AdguardTeam/AdguardFilters/issues/50834
! jav688.com popups
javwide.*##+js(aopr, AaDetector)
cdnfinder.xyz,player.javqd.*,player.javwide.*###preroll
cdnfinder.xyz###poster
*$script,3p,denyallow=cdnfinder.xyz,domain=cdnfinder.xyz
##a[href^="http://www.poweredbyliquidfire.mobi/"]

! https://www.reddit.com/r/uBlockOrigin/comments/9argxo
holavid.com##+js(aopw, decodeURIComponent)
||hawaktv.com/sw.js$script

! Similar group of german porn sites
! https://github.com/uBlockOrigin/uAssets/issues/3349
pornohirsch.net##+js(set, vpPrerollVideo, undefined)
deinesexfilme.com,einfachtitten.com,halloporno.com,herzporno.com,lesbenhd.com,milffabrik.com,porn-monkey.com,porndrake.com,pornhubdeutsch.net,pornoaffe.com,pornodavid.com,pornoente.tv,pornofisch.com,pornofelix.com,pornohammer.com,pornohelm.com,pornoklinge.com,pornotom.com,pornotommy.com,pornovideos-hd.com,pornozebra.com,xhamsterdeutsch.xyz,xnxx-sexfilme.com##+js(nostif, appendChild)
@@*$ghide,domain=deinesexfilme.com|einfachtitten.com|halloporno.com|herzporno.com|lesbenhd.com|milffabrik.com|porn-monkey.com|porndrake.com|pornhubdeutsch.net|pornoaffe.com|pornodavid.com|pornoente.tv|pornofisch.com|pornofelix.com|pornohammer.com|pornohelm.com|pornoklinge.com|pornotom.com|pornotommy.com|pornovideos-hd.com|pornozebra.com|xhamsterdeutsch.xyz|xnxx-sexfilme.com
deinesexfilme.com,einfachtitten.com,halloporno.com,herzporno.com,pornohirsch.net,lesbenhd.com,milffabrik.com,porndrake.com,pornoaffe.com,pornodavid.com,pornoente.tv,pornofisch.com,pornofelix.com,pornohammer.com,pornohelm.com,pornoklinge.com,pornovideos-hd.com,pornotom.com,pornotommy.com,pornozebra.com,xnxx-sexfilme.com##.vjs-overlay
deinesexfilme.com,herzporno.com,lesbenhd.com,milffabrik.com,pornoaffe.com,pornoente.tv,pornohelm.com,pornoklinge.com,xnxx-sexfilme.com###wa_join_btn
einfachtitten.com,halloporno.com,pornodavid.com,pornofisch.com,pornofelix.com,pornohammer.com,pornotom.com,pornotommy.com,pornovideos-hd.com,pornozebra.com##.send_event.widget_btn.cf
deinesexfilme.com,einfachtitten.com,halloporno.com,herzporno.com,lesbenhd.com,milffabrik.com,porn-monkey.com,porndrake.com,pornhubdeutsch.net,pornoaffe.com,pornodavid.com,pornoente.tv,pornofisch.com,pornofelix.com,pornohammer.com,pornohelm.com,pornoklinge.com,pornotom.com,pornotommy.com,pornovideos-hd.com,pornozebra.com,xhamsterdeutsch.xyz,xnxx-sexfilme.com##+js(aopr, open)
||static.twincdn.com^$media,redirect=noopmp3-0.1s
##.preroll-blocker
! https://github.com/uBlockOrigin/uAssets/issues/3341
xnxx-sexfilme.com##+js(aopw, SpecialUp)
||pushpad.xyz^$script,domain=xnxx-sexfilme.com
xnxx-sexfilme.com##.img_box:has-text(Anzeige)
xnxx-sexfilme.com###wa-banner
xnxx-sexfilme.com##aside ins:upward(aside)
||xnxx.com/cams/
xnxx-sexfilme.com##.grid_box:has(a[target="_blank"])
xnxx-sexfilme.com##.preroll-blocker
xnxx-sexfilme.com##.preroll-skip-button
xnxx-sexfilme.com##.vjs-overlayed
||twincdn.com/video/susilive/$media,redirect=noopmp4-1s,domain=xnxx-sexfilme.com

! https://github.com/NanoMeow/QuickReports/issues/39
marie-claire.es##+js(set, ads, true)
*$xhr,redirect-rule=nooptext,domain=marie-claire.es

! https://github.com/NanoMeow/QuickReports/issues/41
||starbits.io/libs/check.js$script,1p

! sawlive.tv popups
! https://github.com/NanoMeow/QuickReports/issues/1793
sawlive.tv##+js(aopw, Fingerprint2)
sawlive.tv##+js(nowoif)
@@||sawlive.tv^$script,1p
sawlive.tv##body[onclick^="closeMyAd"] > div[id][style^="position"][style*="background-color"]

! https://www.reddit.com/r/uBlockOrigin/comments/9bk0es
converto.io##+js(acs, atob, decodeURIComponent)

! https://github.com/uBlockOrigin/uAssets/issues/3368
player.xxxbestsites.com##+js(aopr, BetterJsPop)

! https://github.com/uBlockOrigin/uAssets/issues/3371
svipvids.com##+js(aopw, KillAdBlock)

! https://github.com/uBlockOrigin/uAssets/issues/3372
gaypornmasters.com##+js(aost, String.prototype.charCodeAt, ai_)
||hexupload.net/images/Premium_Banners/$3p

! https://github.com/uBlockOrigin/uAssets/issues/3385
short-url.link##+js(aeld, click, read_cookie)
short-url.link##+js(nano-sib)
short-url.link##center > [src$=".html"]

! https://github.com/NanoMeow/QuickReports/issues/56
salamanca24horas.com##+js(aopr, ReviveBannerInterstitial)

! https://github.com/uBlockOrigin/uAssets/issues/3688
scrapywar.com##+js(acs, eval, replace)
scrapywar.com##.stream-item-widget

! Videos disabled by anti-blocker:
! https://globalnews.ca/news/4332734/quebec-farmers-hoping-for-rain-after-drought-heat-wave-threaten-crops/
globalnews.ca##+js(set, GNCA_Ad_Support, true)
globalnews.ca##.c-ad__unit
globalnews.ca##.c-ad__label

! https://github.com/uBlockOrigin/uAssets/issues/3410
king-pes.*##+js(aeld, load, onload)

! https://github.com/NanoMeow/QuickReports/issues/2911
@@||rp-online.de^$ghide
@@||saarbruecker-zeitung.de^$ghide
@@||volksfreund.de^$ghide
@@||rp-online.de/assets/adsbygoogle.js$script,1p
@@||saarbruecker-zeitung.de/assets/adsbygoogle.js$script,1p
@@||volksfreund.de/assets/adsbygoogle.js$script,1p
rp-online.de,saarbruecker-zeitung.de,volksfreund.de##.park-portal

! https://github.com/AdguardTeam/AdguardFilters/issues/71150
@@||mylivesignature.com^$ghide
@@||mylivesignature.com/$script,1p
mylivesignature.com##.topadscontainer

! https://github.com/uBlockOrigin/uAssets/issues/3422
@@||googlesyndication.com/pagead/managed/js/adsense/*/show_ads_impl$domain=searchftps.net
@@||googlesyndication.com/pagead/show_ads.js$script,domain=searchftps.net

! https://github.com/NanoMeow/QuickReports/issues/62
hungama.com##+js(set, showAds, true)
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect-rule=google-ima.js,domain=hungama.com

! https://github.com/NanoAdblocker/NanoFilters/issues/176
! https://github.com/NanoMeow/QuickReports/issues/2500
@@||crazyhd.com^$ghide
@@||chd4.com^$ghide
! https://github.com/bogachenko/fuckfuckadblock/issues/223
chd4.com##+js(aopw, checkAdBlocker)
||adblockanalytics.com^$xhr,redirect-rule=noop.txt

! https://github.com/NanoMeow/QuickReports/issues/66
@@||goalad.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/3431
canberratimes.com.au##+js(set, cxStartDetectionProcess, noopFunc)

! https://github.com/NanoMeow/QuickReports/issues/67
letribunaldunet.fr##+js(nostif, adb, 0)

! https://github.com/uBlockOrigin/uAssets/issues/3432
tryboobs.com##+js(aopr, exoNoExternalUI38djdkjDDJsio96)
tryboobs.com##+js(aopr, open)
tryboobs.com##.bottomspots
tryboobs.com##.flirt.spot
tryboobs.com###sr

! https://github.com/uBlockOrigin/uAssets/issues/3433
tubedupe.com##+js(aopr, ExoLoader)
tubedupe.com##+js(aeld, , midRoll)
||tubedupe.com/player/html.php$frame,1p

! https://github.com/NanoMeow/QuickReports/issues/71
veekyforums.com##+js(nowoif)
@@||veekyforums.com/js/adcash.js$xhr,1p

! https://github.com/uBlockOrigin/uAssets/issues/2364
||yespornclips.com/sw.js$script,1p

! https://www.reddit.com/r/uBlockOrigin/comments/9f9u6t/block_ads_from_mlbcom_mlb_gameday_mlbtv/
@@||mlbstatic.com/mlb.com/video/*/advertise$xhr,domain=mlb.com

! https://github.com/gorhill/uBO-Extra/issues/104
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=ipla.tv

! https://forums.lanik.us/viewtopic.php?f=62&t=41669#p140881
cutpaid.com##+js(aeld, , _blank)
cutpaid.com##+js(aopr, app_vars.force_disable_adblock)
cutpaid.com##+js(nowoif)
cutpaid.com##+js(set, blurred, false)
cutpaid.com##center
*$frame,denyallow=google.com,domain=cutpaid.com
*$script,3p,denyallow=google.com|gstatic.com|recaptcha.net,domain=cutpaid.com

! https://github.com/uBlockOrigin/uAssets/issues/3448
germancarforum.com##+js(rmnt, script, adsbygoogle)

! https://github.com/uBlockOrigin/uAssets/issues/3462
televisionlibre.net##+js(aopw, smrtSB)
televisionlibre.net##+js(nowoif)
televisionlibre.net##[class^="fkdaop"]
todovieneok.*##+js(aeld, load, nextFunction)

! https://github.com/uBlockOrigin/uAssets/issues/3471
findwords.info##div[itemtype="http://schema.org/WPAdBlock"]
findwords.info##.ads-block-horizontal
||forwardrb.bid^

! https://github.com/uBlockOrigin/uAssets/issues/3476
thewestmorlandgazette.co.uk##+js(aopr, _sp_._networkListenerData)

! https://github.com/NanoMeow/QuickReports/issues/94
live-tv-channels.org##+js(aopr, adBlockDetected)
live-tv-channels.org##+js(nostif, adBlocked)
live-tv-channels.org##.adsense-player
live-tv-channels.org##.adsense-player-2
live-tv-channels.org##[class^="_ads-"]

! https://github.com/NanoMeow/QuickReports/issues/95
drinksmixer.com,leitesculinaria.com##+js(set, Date.now, noopFunc)

! https://github.com/uBlockOrigin/uAssets/issues/3506
andiim3.com##+js(acs, jQuery, AdBlock)

! https://github.com/uBlockOrigin/uAssets/issues/3508
twatis.com##+js(aopr, ExoLoader.addZone)

! https://github.com/uBlockOrigin/uAssets/issues/11515
hitomi.la##+js(noeval)
*$script,3p,domain=hitomi.la
hitomi.la##+js(aopr, open)
hitomi.la##.container > div[class$="content"] > div[class]:has(> script)
||ltn.hitomi.la^*?yuo1=$script,1p

! https://forums.lanik.us/viewtopic.php?p=141036#p141036
fupa.net##+js(set, jQuery.adblock, 1)
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect-rule=google-ima.js,domain=fupa.net
@@||ad.71i.de/*/loader.js$script,domain=fupa.net

! https://forums.lanik.us/viewtopic.php?p=141091#p141091
! sites with the same ad-reinsertion script
kompas.com##+js(acs, setTimeout, iframeTestTimeMS)
namemc.com##+js(acs, setTimeout, runInIframe)
namemc.com##+js(aopw, deployads)
namemc.com##.ad-container
pockettactics.com##+js(acs, Math.floor, iframeTestTimeMS)
tribunnews.com##+js(acs, Math, ='\x)

! https://github.com/NanoMeow/QuickReports/issues/108
descarga-animex.*##+js(aopw, adBlockDetected)

! https://github.com/uBlockOrigin/uAssets/issues/3536
bollywoodshaadis.com##+js(aopr, Debugger)
bollywoodshaadis.com##+js(aopw, adBlockDetected)

! https://github.com/uBlockOrigin/uAssets/issues/3542
hdvid.*##+js(aopw, atOptions)
hdvid.*##+js(aost, String.fromCharCode, stackDepth:3)
hdvid.*,onvid.*,ovid.*,vidhd.*##+js(aopw, Fingerprint2)
hdvid.*,onvid.*,ovid.*,vidhd.*##+js(aopw, smrtSB)
hdvid.*,onvid.*,ovid.*,vidhd.*##+js(nowebrtc)
vidhd.*##+js(aopr, AaDetector)
hdvid.*,onvid.*,ovid.*,vidhd.*##.video_batman
||hdvid.tv/sw.js$script
||onvid.*/sw.js$script
||ovid.*/sw.js$script,1p
||vidhd.*/sw.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/3546
hardmob.com.br#?#.postcontainer:has(.usertitle:has-text(Publicidade))

! https://github.com/NanoMeow/QuickReports/issues/111
@@||ugdturner.com^$script,domain=live.bleacherreport.com
@@||v.fwmrm.net/crossdomain.xml$xhr,domain=live.bleacherreport.com

! https://forums.lanik.us/viewtopic.php?f=62&t=41761#p141302
downloadming.*##+js(aopw, decodeURIComponent)

! https://github.com/NanoMeow/QuickReports/issues/125
nfl.com##[class$="adblock"]

! https://github.com/uBlockOrigin/uAssets/issues/3565
guidetnt.com##+js(set, isAdBlockActive, false)

! https://www.reddit.com/r/uBlockOrigin/comments/9j5bxk
eslfast.com##+js(nostif, warning, 100)

! https://github.com/uBlockOrigin/uAssets/issues/3593
quelleestladifference.fr##+js(aeld, load, onload)

! https://github.com/uBlockOrigin/uAssets/issues/3594
iwin.com##.modals
iwin.com#@##sponsorText

! https://forums.lanik.us/viewtopic.php?f=62&t=41791
giveawayoftheday.com##+js(nosiif, _checkBait)

! https://github.com/uBlockOrigin/uAssets/issues/3597
sexykittenporn.com##+js(aopr, loadTool)
sexykittenporn.com##+js(aopr, ExoLoader)
sexykittenporn.com##+js(ra, href, [href*="ccbill"])
sexykittenporn.com##.hr.babes

! https://github.com/uBlockOrigin/uAssets/issues/3608
@@||i8086.de^$ghide
i8086.de##ins.adsbygoogle

! https://github.com/uBlockOrigin/uAssets/issues/3604
starmusiq.*##+js(nowebrtc)
starmusiq.*##+js(set, isAdBlockActive, false)

! https://forums.lanik.us/viewtopic.php?f=62&t=41809
! https://github.com/NanoMeow/QuickReports/issues/145
@@||gameguardian.net^$ghide
||googlesyndication.com/pagead/$script,redirect=noopjs,domain=gameguardian.net
gameguardian.net##.adsbygoogle:style(height: 1px !important;)

! https://www.reddit.com/r/uBlockOrigin/comments/9jzdwf/detected_by_hawtcelebs/
hawtcelebs.com##+js(aopw, close_screen)

! https://github.com/uBlockOrigin/uAssets/issues/3629
camgirlfap.com##+js(acs, document.createElement, onerror)
##.happy-inside-player

! https://github.com/uBlockOrigin/uAssets/issues/3630
cda-hd.cc##+js(aopr, AaDetector)

! https://github.com/uBlockOrigin/uAssets/issues/3632
ge-map-overlays.appspot.com##+js(no-xhr-if, googlesyndication)

! https://github.com/uBlockOrigin/uAssets/issues/3635
vinylcollective.com##+js(acs, jQuery, dismissAdBlock)

! https://github.com/uBlockOrigin/uAssets/issues/3644
sp-today.com##+js(set, isAdBlockActive, false)

! https://github.com/uBlockOrigin/uAssets/issues/3646
! https://github.com/NanoMeow/QuickReports/issues/2351
! https://github.com/NanoMeow/QuickReports/issues/4527
mirrorace.*##+js(aopr, AaDetector)
mirrorace.*##+js(aeld, click, _0x)
mirrorace.*##+js(popads-dummy)
/invoke.js$script,domain=mirrorace.*
@@||mirrorace.*^$ghide
mirrorace.*##.uk-card-secondary:has-text(VPN)
mirrorace.*##[href*="search/"]
||mirrorace.org/*.gif$image

! https://github.com/uBlockOrigin/uAssets/issues/3651
! https://github.com/uBlockOrigin/uAssets/issues/5046
tamilmv.*##+js(nowebrtc)
tamilmv.*##+js(acs, atob, decodeURIComponent)
||tamilmv.*/sw.js$script,xhr,1p

! https://github.com/uBlockOrigin/uAssets/issues/3652
||xxxwebdlxxx.org^$csp=script-src 'self' data:

! https://github.com/uBlockOrigin/uAssets/issues/3654
! https://www.reddit.com/r/uBlockOrigin/comments/89tfkf/how_do_i_stop_we_see_youre_using_an_ad_blocker/
! https://github.com/uBlockOrigin/uAssets/issues/2188
! https://github.com/uBlockOrigin/uAssets/issues/2636
! https://github.com/uBlockOrigin/uAssets/issues/3656
browardpalmbeach.com,dallasobserver.com,houstonpress.com,miaminewtimes.com,phoenixnewtimes.com,westword.com##+js(set, VMG.Components.Adblock, false)

! https://forums.lanik.us/viewtopic.php?p=141849#p141849
prostoporno.*##+js(aopr, ExoLoader.serve)
prostoporno.*##.spot

! https://forums.lanik.us/viewtopic.php?f=103&t=41858
! https://www.reddit.com/r/uBlockOrigin/comments/mpffxo/
muyinteresante.es##+js(no-fetch-if, googlesyndication, method:HEAD)
*$xhr,redirect-rule=nooptext,domain=muyinteresante.es

! https://github.com/uBlockOrigin/uAssets/issues/311
9xbuddy.*##+js(nowoif)
@@||offmp3.*^$ghide
*$script,3p,denyallow=9xbud.com|cloudflare.com|cloudflare.net|disqus.com|disquscdn.com|fastly.net|fastlylb.net|google.com|googleapis.com|gstatic.com|hcaptcha.com|hwcdn.net|jquery.com|jsdelivr.net|jwpsrv.com|plyr.io|twimg.com|twitter.com|recaptcha.net|x.com,domain=9xbuddy.*

! https://github.com/NanoMeow/QuickReports/issues/175
durtypass.com##+js(nowoif)
durtypass.com##+js(aopr, _pop)
@@||durtypass.com^$ghide

! https://forums.lanik.us/viewtopic.php?f=62&t=41882
||pornid.*$csp=frame-src
pornid.*##.rsidebar-spots-holder, .spots-bottom
pornid.*##.cs-under-player-link
pornid.*##+js(aopr, decodeURI)
||pornid.*/azone/
||pornid.*/pid/dev.js
!#if env_mobile
pornid.*##.cs
pornid.*##.spots-title
pornid.*###fltd
pornid.*###native_code
||pornid.*/xdman2/$frame,1p
!#endif

! https://github.com/NanoMeow/QuickReports/issues/179
practicequiz.com,wapkiz.com##+js(aopw, adBlockDetected)
freegamescasual.com##+js(nostif, adblock_popup, 500)

! https://github.com/NanoMeow/QuickReports/issues/183
opjav.com##+js(nowoif)
||clipbongda.info^

! https://github.com/uBlockOrigin/uAssets/issues/3678
123moviesjr.cc##+js(aopr, mm)
||123movie.*/sw.js$script

! https://forums.lanik.us/viewtopic.php?f=90&t=41915
schrauben-normen.de##+js(aeld, load, nextFunction)

! https://github.com/NanoMeow/QuickReports/issues/191
ngelag.com##+js(aopr, FuckAdBlock)

! https://github.com/NanoMeow/QuickReports/issues/17
! https://github.com/uBlockOrigin/uAssets/issues/3687
@@||homegrownfreaks.net/player/player_ads.html$frame,1p
@@||homegrownfreaks.net^$ghide
homegrownfreaks.net##.fp-brand

! https://github.com/NanoMeow/QuickReports/issues/195
depedlps.*##+js(aeld, load, onload)
depedlps.*##+js(aopr, encodeURIComponent)

! https://github.com/uBlockOrigin/uAssets/issues/3693
pianokafe.com##+js(aopw, adBlockDetected)

! https://github.com/NanoMeow/QuickReports/issues/197
huim.com##+js(aopr, isAdEnabled)
||push.zhanzhang.baidu.com/push.js$script,domain=huim.com

! https://github.com/uBlockOrigin/uAssets/issues/3700
! https://github.com/uBlockOrigin/uAssets/issues/5004
||zbporn.*/tri/zp.js
zbporn.*##+js(aopr, decodeURI)
zbporn.*##+js(aopr, promo)
zbporn.*##.desktop-nat-spot
*$popunder,domain=zbporn.com
||zbporn.*/ttt/
zbporn.*##.view-right

! https://github.com/uBlockOrigin/uAssets/issues/3701
fapality.com##+js(aopr, document.dispatchEvent)
fapality.com##+js(aopr, open)
||yourlustmedia.com^$3p

! https://github.com/uBlockOrigin/uAssets/issues/3702
worldsex.com##+js(aopr, Notification)
worldsex.com##+js(aopr, document.dispatchEvent)
worldsex.com###video_banner
worldsex.com##div.da-by
worldsex.com##.overlay

! https://github.com/NanoMeow/QuickReports/issues/155
! https://github.com/uBlockOrigin/uAssets/issues/16014
@@||api.production.k8s.y3o.tv/*/video-ads$xhr,domain=yallo.tv
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=yallo.tv
||adservice.google.com^$script,redirect-rule=noopjs,domain=yallo.tv
@@||secure.adnxs.com/ptv$xhr,domain=imasdk.googleapis.com
imasdk.googleapis.com##+js(xml-prune, VAST, , adnxs)

! https://github.com/uBlockOrigin/uAssets/issues/3706
babesxworld.com,cocogals.com##+js(aopr, loadTool)
babesxworld.com##+js(aopr, open)
babesxworld.com##+js(aopr, document.dispatchEvent)
babesxworld.com##.g-link
babesxworld.com##a[href^="http://refer.ccbill.com/"]
*$3p,popup,domain=babesxworld.com
*$script,3p,denyallow=cloudflare.com|bootstrapcdn.com|fastly.net|fluidplayer.com|hwcdn.net|twitter.com|x.com,domain=babesxworld.com
babesxworld.com##[onclick*="spons"]

! https://github.com/NanoMeow/QuickReports/issues/202
masteranime.tv##+js(set, check_adblock, true)
||masteranime.tv/api/pop.php$xhr,1p
*$script,3p,denyallow=anmedm.com|cloudflare.net|cloudfront.net|disqus.com|disquscdn.com|facebook.net|fastlylb.net|fbcdn.net|google.com,domain=masteranime.tv
||ad.masteranime.tv^$script,1p

! https://www.reddit.com/r/uBlockOrigin/comments/9o5lin/cant_browse_httpswwwtcpvpncom_without_disabling/
tcpvpn.com##+js(nostif, Adblock)

! https://github.com/uBlockOrigin/uAssets/issues/3715
otakuworldsite.blogspot.com##+js(aeld, load, onload)

! https://github.com/NanoAdblocker/NanoFilters/issues/192
pornoman.pl##+js(aopr, decodeURI)
pornoman.pl##+js(aopr, _0x311a)
pornoman.pl##[src*="bannery"]
pornoman.pl###porno_accept
@@||pornoman.pl^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/10405
nhentai.net##+js(nowoif)
nhentai.net##+js(set, _n_app.popunder, null)
nhentai.net##+js(rpnt, script, popunder, p)

! https://adblockplus.org/forum/viewtopic.php?f=10&t=60372&start=0
*.mp4$media,redirect=noopmp4-1s,domain=abc.go.com

! https://github.com/uBlockOrigin/uAssets/issues/3737
canadianunderwriter.ca##+js(aopw, mockingbird)

! https://github.com/uBlockOrigin/uAssets/issues/3749
! https://github.com/uBlockOrigin/uAssets/issues/5549
! https://www.reddit.com/r/uBlockOrigin/comments/brwyhb/ad_filled_redirect_site_detects_ublock_origin/
! https://github.com/AdguardTeam/AdguardFilters/issues/128679
! https://github.com/uBlockOrigin/uAssets/issues/16601
forexmab.com,linkjust.com,linkszia.co##+js(set, blurred, false)
forexlap.com,forexmab.com,forexwaw.club,forex-articles.com,fx4vip.com,forexrw7.com,3rabsports.com,fx-22.com,gold-24.net##+js(nano-sib, , , 0.001)
forexlap.com##+js(nowoif)
linkjust.com##.banner-inner
linkszia.co##.banner
@@||linkjust.com^$ghide
||proviralhost.com^$3p
||urbharat.xyz^$3p
||forexrw7.com^$frame,3p
! https://github.com/AdguardTeam/AdguardFilters/issues/139844
djxmaza.in,proviralhost.com###wait1button.disabled, #wait2button.disabled:remove-class(disabled)
djxmaza.in,proviralhost.com###wait1
proviralhost.com###wait2button:upward(center):style(display: block !important;)
djxmaza.in###wait1button:upward(center) ~ *:not(center)
proviralhost.com###wait1button ~ *:not(#wait2button, center:has(#wait2button))
! https://github.com/uBlockOrigin/uAssets/issues/16383
*$image,redirect-rule=1x1.gif,domain=djxmaza.in|proviralhost.com|examtadka.com

! https://github.com/uBlockOrigin/uAssets/issues/3748
business-standard.com##+js(set, adblock, false)

! https://github.com/uBlockOrigin/uAssets/issues/3741
*$popunder,domain=camsexvideo.net
camsexvideo.net##.list-spots

! https://forums.lanik.us/viewtopic.php?f=62&t=42004
! https://github.com/uBlockOrigin/uAssets/issues/22466
nowtv.com.tr##+js(set, adblockDetector, trueFunc)

! https://github.com/uBlockOrigin/uAssets/issues/3767
oemdtc.com##.easyazon-block
oemdtc.com##.blocker-notice, .blocker-overlay
oemdtc.com##[src^="https://cdn.flowdee.de/"], [href^="https://www.amazon.com/b"]

! https://github.com/NanoMeow/QuickReports/issues/234
! https://github.com/uBlockOrigin/uAssets/issues/4345
! https://github.com/uBlockOrigin/uAssets/issues/7271
! https://github.com/uBlockOrigin/uAssets/issues/13164
cambay.tv,caminspector.net,camporn.tube,camwhorescloud.com,camwhorespy.com,camwhoria.com,camvideos.org##+js(acs, crakPopInParams)
cambay.tv,caminspector.net,camporn.tube,camwhorescloud.com,camwhoreshd.com,camwhorespy.com,camvideos.org##+js(acs, onload, onclick)
cambay.tv,caminspector.net,camwhorespy.com,camwhoria.com,camgoddess.tv##+js(aopr, console.log)
cambay.tv,camwhoreshd.com,camwhorespy.com,cwtvembeds.com##+js(nowoif)
cambay.tv,caminspector.net,camwhoreshd.com,camgoddess.tv##+js(set, hasPoped, true)
camwhorescloud.com##+js(aost, Math.round, inlineScript)
camwhoreshd.com,cwtvembeds.com##.hola_top_element
cwtvembeds.com##+js(set, flashvars.protect_block, '')
cwtvembeds.com##+js(set, flashvars.video_click_url, undefined)
camwhoreshd.com##+js(aopr, loadTool)
cambay.tv,camporn.tube,camwhorescloud.com,camwhoreshd.com,camgoddess.tv##.table
caminspector.net,camvideos.org##.place
@@*$media,domain=camvideos.org
@@||video$xhr,media,domain=camvideos.org
camseek.tv##+js(aopr, decodeURI)
||camseek.tv/live/live.php$frame,1p
camseek.tv##div[style$="height: 240px; background: white"]
||wpnrtnmrewunrtok.xyz^$badfilter
cambay.tv##.rltdsldr
cambay.tv##+js(set, flashvars.adv_pause_html, '')
cambay.tv##+js(set, flashvars.adv_start_html, '')
cambay.tv##+js(set, flashvars.popunder_url, '')
||cfgr3.com/popin/$script,3p
##[href^="https://go.smljmp.com/"]
caminspector.net##.top
cambay.tv##.fp-logo
cambay.tv##+js(set, flashvars.adv_post_src, '')
cambay.tv##+js(set, flashvars.adv_post_url, '')
cambay.tv##+js(set, flashvars.adv_pre_src, '')
cambay.tv##+js(set, flashvars.adv_pre_url, '')

! https://github.com/jspenguin2017/uBlockProtector/issues/999
! https://github.com/uBlockOrigin/uAssets/issues/4176
@@||open.http.mp.streamamg.com/html5/$script,domain=mediapason.it
@@||pubads.g.doubleclick.net/gampad/live/*.mediapason.it$xhr,domain=imasdk.googleapis.com
mediapason.it##+js(set, jQuery.adblock, false)

! https://github.com/uBlockOrigin/uAssets/issues/3777
! https://github.com/uBlockOrigin/uAssets/issues/14133
leechpremium.link##+js(set, blurred, false)
*$image,1p,redirect-rule=1x1.gif,domain=leechpremium.link
leechpremium.link###myModal
leechpremium.link##ins.adsbygoogle
leechpremium.link##.fade.modal-backdrop
leechpremium.link##[id*="ScriptRoot"]
leechpremium.link##body:style(overflow: auto !important;)
leechpremium.link##.row > .col-md-2:first-child > .pricingTable
! https://github.com/uBlockOrigin/uAssets/issues/3777#issuecomment-586671449
leechpremium.link##+js(no-fetch-if, adsbygoogle)
*$script,3p,denyallow=bootstrapcdn.com|cloudflare.net|google.com|googleapis.com|gstatic.com|recaptcha.net|tawk.to|jsdelivr.net,domain=leechpremium.link
! https://github.com/AdguardTeam/AdguardFilters/issues/123870
@@||leechpremium.net^$ghide
leechpremium.net##.adsbygoogle

! https://github.com/NanoMeow/QuickReports/issues/236
! https://github.com/uBlockOrigin/uAssets/issues/24087
@@||tsubasa.im^$ghide
tsubasa.im##+js(nostif, location.href, 10000)

! https://github.com/uBlockOrigin/uAssets/issues/3778
zemporn.com##+js(aopr, h1mm.w3)
zemporn.com##.player-aside-banners

! https://github.com/NanoMeow/QuickReports/issues/241
guitarnick.com##+js(acs, document.getElementById, banner)

! https://github.com/uBlockOrigin/uAssets/issues/3793
jeshoots.com##+js(set, google_jobrunner, true)

! https://github.com/uBlockOrigin/uAssets/issues/3794
xxxuno.com##+js(nostif, #chatWrap, 1000)

! https://github.com/uBlockOrigin/uAssets/issues/3801
allmonitors24.com##+js(nostif, (), 2000)

! https://github.com/uBlockOrigin/uAssets/issues/3799
apritos.com,bsierad.com,diminimalis.com,downloadbatch.com,eksporimpor.com,jadijuara.com,kicaunews.com,palapanews.com,ridvanmau.com,teknohot.com,unduh31.net##+js(aopw, adBlockDetected)

! https://github.com/uBlockOrigin/uAssets/issues/3815
homebooster.de,newhome.de##+js(acs, document.getElementById, blocker_div)

! https://github.com/uBlockOrigin/uAssets/issues/3818
ellibrepensador.com##+js(aopr, require)

! https://github.com/uBlockOrigin/uAssets/issues/3825
porconocer.com##+js(acs, document.getElementById, onscroll)

! https://github.com/uBlockOrigin/uAssets/issues/3828
0123movies.*##+js(set, check_adblock, true)
0123movies.*##+js(aopr, mm)
0123movies.*##.fake_player, #tab-ad
0123movies.*##[href="#tab-ad"]
0123movies.*##.les-title:has-text(HD)
0123movies.*##.mvic-btn

! https://github.com/uBlockOrigin/uAssets/issues/3829
sholah.net,2rdroid.com##+js(nostif, keep-ads, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/3830
tinyppt.com##+js(rmnt, script, deblocker)

! https://github.com/uBlockOrigin/uAssets/issues/3833
internetretailing.com.au##.textwidget:has(> div > div[id^="IRN_Homepage_300x250"])

! https://github.com/NanoMeow/QuickReports/issues/676
@@||mygoodstream.pw^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/3849
bisceglielive.it##+js(nostif, #rbm_block_active, 1000)
bisceglielive.it##.mkt-300x250
bisceglielive.it##.mkt-728x90

! https://github.com/uBlockOrigin/uAssets/issues/3858
worldaide.fr##+js(aopr, adblock)
@@||worldaide.fr^$ghide
worldaide.fr##ins.adsbygoogle

! https://github.com/uBlockOrigin/uAssets/issues/3860
wpgdadatong.com##+js(aopr, checkAdblock)

! https://github.com/uBlockOrigin/uAssets/issues/3861
creativebusybee.com##+js(aopw, checkAds)

! https://github.com/uBlockOrigin/uAssets/issues/3867
scamalot.com##+js(acs, $, #DontBloxMyAdZ)

! https://github.com/uBlockOrigin/uAssets/issues/3869
beautypackaging.com,coatingsworld.com,contractpharma.com,happi.com,inkworldmagazine.com,labelandnarrowweb.com,mpo-mag.com,nutraceuticalsworld.com,odtmag.com,printedelectronicsnow.com##+js(acs, $, #pageWrapper)
beautypackaging.com,coatingsworld.com,contractpharma.com,happi.com,inkworldmagazine.com,labelandnarrowweb.com,mpo-mag.com,nutraceuticalsworld.com,odtmag.com,printedelectronicsnow.com##.modal-backdrop
beautypackaging.com,coatingsworld.com,contractpharma.com,happi.com,inkworldmagazine.com,labelandnarrowweb.com,mpo-mag.com,nutraceuticalsworld.com,odtmag.com,printedelectronicsnow.com##body:style(overflow: auto !important;)

! https://github.com/uBlockOrigin/uAssets/issues/3874
savevideo.me##+js(acs, $, banner)

! https://github.com/uBlockOrigin/uAssets/issues/3876
yeutienganh.com##+js(aopw, adBlockDetected)

! https://github.com/uBlockOrigin/uAssets/issues/3871
openspeedtest.com##+js(nostif, google_jobrunner)

! https://github.com/uBlockOrigin/uAssets/issues/3882
situsberita2terbaru.blogspot.com##+js(acs, document.getElementById, adpbtest)

! https://github.com/uBlockOrigin/uAssets/issues/3872
telecharger-igli4.*##+js(aopw, adBlockDetected)

! https://github.com/uBlockOrigin/uAssets/issues/3880
addtobucketlist.com##+js(nostif, google_jobrunner)

! https://github.com/uBlockOrigin/uAssets/issues/3885
syracusefan.com##+js(aopw, XF)

! https://github.com/uBlockOrigin/uAssets/issues/3897
@@||promods.net^$ghide
@@||promods.net/kampyle.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/3917
argio-logic.net##+js(acs, document.getElementById, alert)

! https://github.com/uBlockOrigin/uAssets/issues/3933
appstore-discounts.com##+js(acs, document.getElementById, undefined)

! https://github.com/uBlockOrigin/uAssets/issues/3930
onlineatlas.us#@#ins.adsbygoogle[data-ad-slot]

! https://github.com/uBlockOrigin/uAssets/issues/3927
ohorse.com##+js(aopw, check)

! https://github.com/uBlockOrigin/uAssets/issues/13096
@@||tabooporns.com^$ghide
player.tabooporns.com##+js(aopr, BetterJsPop)
player.tabooporns.com,x69.ovh##+js(nowoif, , 10)
player.tabooporns.com,x69.ovh##+js(set, adblockcheck, false)
||unpkg.com/videojs-vast-vpaid@2.0.2/bin/videojs_5.vast.vpaid.min.js$script,domain=player.tabooporns.com|x69.ovh
player.tabooporns.com##[href="https://t.me/Russia_Vs_Ukraine_War3"]
player.tabooporns.com##a[onclick="openAuc();"]
x08.ovh##+js(nowoif)
x08.ovh##+js(acs, JSON.parse, showTrkURL)
x08.ovh##+js(acs, Math, /window\['(?:\\x\d{2}){1}/)
||findmyheadache.com^

! https://github.com/uBlockOrigin/uAssets/issues/3949
photos-public-domain.com##+js(aopr, blockAdBlock)

! https://github.com/uBlockOrigin/uAssets/issues/3911
@@/wp-content/themes/mts_ad_sense/*$1p
##.blocker-notice
##.blocker-overlay

! https://github.com/NanoMeow/QuickReports/issues/262
popcorntv.it##.box-adv

! Generic BlockAdBlock and other sites
! https://github.com/uBlockOrigin/uAssets/issues/3401
arianatoday.net###phpeverywherewidget-2
teamos-hkrg.com##[href^="https://bit.ly/"]
digitask.ru##ins[class][style="display:inline-block;width:300px;height:250px;"]
heidibemvindaacasabrasil.blogspot.com###popup
l2network.eu##.ubm_banner
mylivewallpapers.com,softfully.com##+js(no-fetch-if, ads)
mylivewallpapers.com##.group.posts > div.post

aalah.me,academiadelmotor.es,aiailah.com,almursi.com,altebwsneno.blogspot.com,ambonkita.com,androidspill.com,aplus.my.id,arrisalah-jakarta.com,babyjimaditya.com,bbyhaber.com,beritabangka.com,beritasulteng.com,bestsellerforaday.com,bintangplus.com,bitco.world,br.nacaodamusica.com,bracontece.com.br,dicariguru.com,fairforexbrokers.com,foguinhogames.net,formasyonhaber.net,fullvoyeur.com,healbot.dpm15.net,igli4.com,indofirmware.site,hagalil.com,javjack.com,latribunadelpaisvasco.com,line-stickers.com,luxurydreamhomes.net,m5g.it,miltonfriedmancores.org,minutolivre.com,oportaln10.com.br,pedroinnecco.com,philippinenmagazin.de,piazzagallura.org,pornflixhd.com,safehomefarm.com,synoniemboek.com,techacrobat.com##+js(aopw, adBlockDetected)

elizabeth-mitchell.org##+js(aopw, adBlockDetected)
elizabeth-mitchell.org##.widget-title:has-text(AD)
ad-itech.blogspot.com##+js(aeld, load, onload)
avengerinator.blogspot.com##+js(aeld, load, nextFunction)
best4hack.blogspot.com##+js(acs, atob, decodeURI)
||myfreecopyright.com^$3p

! https://github.com/uBlockOrigin/uAssets/issues/16889
3dzip.org##+js(nostif, google_jobrunner)
3dzip.org##+js(nostif, null, 4000)
||googlesyndication.com^$script,redirect-rule=googlesyndication_adsbygoogle.js,domain=3dzip.org
3dzip.org##.adcontainer
3dzip.org##div.better-ads-listitemad
3dzip.org##div[id][itemtype="https://schema.org/WPAdBlock"]

technisches-zeichnen.net##[id^="banner-"]
technisches-zeichnen.net###ad-unten-01
technisches-zeichnen.net##.bild-rechts-01

mi-globe.com##.td-is-sticky

||googlesyndication.com^$script,redirect-rule=googlesyndication_adsbygoogle.js,domain=fatgirlskinny.net
fatgirlskinny.net##+js(aeld, load, isBlanketFound)
fatgirlskinny.net##[href^="https://www.topcashback.co.uk/"]

canaltdt.es##+js(aeld, load, showModal)
*$script,redirect-rule=noopjs,domain=canaltdt.es

! https://github.com/AdguardTeam/AdguardFilters/issues/57790
4download.net##+js(acs, addEventListener, nextFunction)
4download.net##+js(nano-sib)

! https://github.com/AdguardTeam/AdguardFilters/issues/57320
! https://github.com/AdguardTeam/AdguardFilters/issues/94971
! https://github.com/uBlockOrigin/uAssets/issues/13860
scat.gold##+js(nostif, show)
scat.gold##+js(acs, document.createElement, onerror)

! https://github.com/AdguardTeam/AdguardFilters/issues/55748
globalssh.net##+js(acs, addEventListener, nextFunction)

! https://www.reddit.com/r/uBlockOrigin/comments/pqthf7/anti_adblocker_script_on_sysnettechsolutionscom/
sysnettechsolutions.com##a[href^="https://bit.ly/"]

! https://github.com/uBlockOrigin/uAssets/issues/3965
pandajogosgratis.com.br##+js(nostif, (), 2500)

! https://github.com/uBlockOrigin/uAssets/issues/3972
5278.cc##+js(nostif, myaabpfun, 3000)

! https://github.com/uBlockOrigin/uAssets/issues/3979
! https://github.com/AdguardTeam/AdguardFilters/issues/46874
icutlink.com##+js(aopr, open)
icutlink.com##+js(set, blurred, false)
icutlink.com##+js(nano-sib, time)
icutlink.com##+js(set, sec, 0)
icutlink.com##.banner-inner
zegtrends.com##+js(nowoif)
zegtrends.com##+js(nano-sib, time, 2500)
@@/ad.min.js$script,domain=icutlink.com|zegtrends.com
zegtrends.com##+js(noeval-if, /chp_?ad/)

! https://forums.lanik.us/viewtopic.php?f=62&t=42076
hotbabes.tv##+js(aopr, loadTool)
candid.tube,filesamba.*,hotbabes.tv,purelyceleb.com##+js(aopr, _wm)
cambabe.*,camgirlbay.net##+js(acs, onload)
cambabe.*##+js(acs, crakPopInParams)
cambabe.*##.topad
cambabe.*##.place
purelyceleb.com##.embed-container
##.exo-horizontal

! https://forums.lanik.us/viewtopic.php?f=62&t=22759
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=cookinggames.com
@@||witchhut.com^$script,1p

! https://forums.lanik.us/viewtopic.php?p=70300#p70300
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=girlgames.com

! https://www.reddit.com/r/uBlockOrigin/comments/olc7nh/ads_shortener_detecting_ublock/
! https://github.com/uBlockOrigin/uAssets/issues/3990
stfly.me##+js(aopw, Fingerprint2)
stfly.me##+js(aopw, tabUnder)
stfly.me##+js(aeld, click, trigger)
stfly.me##+js(aopr, open)
stfly.me##+js(set, blurred, false)
@@||stfly.me^$ghide
*$3p,denyallow=bootstrapcdn.com|cloudflare.com|google.com|googleapis.com|gstatic.com|hcaptcha.com|recaptcha.net|unpkg.com,domain=stfly.me
||bulletprofit.com^$3p
! https://www.reddit.com/r/uBlockOrigin/comments/ygt18i/
! https://www.reddit.com/r/uBlockOrigin/comments/11z2git/
altblogger.net,blogbux.net,stfly.me##+js(acs, document.createElement, Adblock)
! https://github.com/uBlockOrigin/uAssets/issues/14711
altblogger.net##+js(nostif, nextFunction)
! https://www.reddit.com/r/uBlockOrigin/comments/128edrf/
blogbux.net###overlay

! https://github.com/uBlockOrigin/uAssets/issues/4009
@@||audiotools.*^$ghide
audiotools.*##ins.adsbygoogle
*$image,redirect-rule=1x1.gif,domain=audiotools.blog

! https://github.com/uBlockOrigin/uAssets/issues/4033
pandafreegames.*##+js(nostif, adFilled, 2500)

! https://github.com/uBlockOrigin/uAssets/issues/4037
multporn.net##+js(aopr, document.dispatchEvent)

! https://github.com/NanoAdblocker/NanoCore/issues/227
tonspion.de##+js(nostif, (), 15000)

! https://github.com/uBlockOrigin/uAssets/issues/4054
oncehelp.com##+js(aeld, click, trigger)
oncehelp.com##+js(aopr, open)
oncehelp.com##+js(set, blurred, false)
oncehelp.com##.banner-inner
oncehelp.com##[href*="?token"]

! https://github.com/uBlockOrigin/uAssets/issues/4057
@@||consensu.org/*/cmp2.js$script,domain=novagente.pt

! https://github.com/uBlockOrigin/uAssets/issues/4059
viprow.*##+js(acs, setTimeout, admc)
viprow.*##+js(nowoif, //)
viprow.*##+js(rmnt, script, FingerprintJS)
viprow.*##+js(json-prune, *, *.adserverDomain)
viprow.*##.position-absolute

! https://www.reddit.com/r/uBlockOrigin/comments/9uq4cl/myegycc/
! https://github.com/uBlockOrigin/uAssets/issues/9908
myegy.*##+js(aopw, decodeURI)

! https://github.com/uBlockOrigin/uAssets/issues/4068
gamezhero.com##+js(set, ads, true)
||gamezhero.com/promo$frame,1p
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect-rule=google-ima.js,domain=gamezhero.com

! https://www.reddit.com/r/uBlockOrigin/comments/9utd8b/wikifeet_adverts/
wikifeet.com##+js(aopr, NativeAd)

! https://github.com/NanoMeow/QuickReports/issues/295
flashplayer.fullstacks.net##+js(set, gadb, false)

! https://github.com/NanoAdblocker/NanoFilters/issues/286
@@||encoretvb.com^$ghide
encoretvb.com###square-ad-1

! https://github.com/NanoMeow/QuickReports/issues/304
sms-receive.net##+js(acs, $, adblock)

! https://github.com/NanoMeow/QuickReports/issues/305
@@||wordgames.com^$ghide
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=wordgames.com
wordgames.com###ad-gamepage-leaderboard
wordgames.com###skyscrapper-container
wordgames.com###skyscraper-container

! https://github.com/NanoMeow/QuickReports/issues/311
ani-stream.com##+js(no-fetch-if, damoh.ani-stream.com)
!#if env_chromium
||amazonaws.com/homad-global-configs.schneevonmorgen.com/global_config.json$xhr,redirect=nooptext,domain=ani-stream.com
!#endif
||fairytail-tube.org/templates/caprica/amz$image,1p

! https://github.com/uBlockOrigin/uAssets/issues/9449
||grammarly.com/*utm_source=$popup,domain=duplichecker.com|plagiarismchecker.co|plagiarismdetector.net|searchenginereports.net|smallseotools.com
duplichecker.com,plagiarismchecker.co,plagiarismdetector.net,searchenginereports.net,smallseotools.com##[href*="grammarly.com"]
duplichecker.com,plagiarismchecker.co,plagiarismdetector.net,searchenginereports.net##+js(nostif, showPopup)
plagiarismdetector.net##a[rel*="nofollow"][rel*="noopener"]:has(> img.img-fluid[src^="https://plagiarismdetector.net/pd-imgs/"])
plagiarismdetector.net##a[onclick*="PC_Home_gra"][rel="nofollow noopener"][target="_blank"]
searchenginereports.net##div[class^="theMSsy"], div[id^="theMSsy"], a[onclick*="PushClickTag"][rel], a[href^="https://searchenginereports.net/gmdasads"]
||searchenginereports.net/thAdoGMA/$image
smallseotools.com##+js(aeld, mouseout, clientWidth)
smallseotools.com##span[onclick*="https://smallseotools.com/deep_grammar.html"]
smallseotools.com##span[onclick*="https://smallseotools.com/deep_pcgrammar.html"]
plagiarismchecker.co##body *:matches-css(margin: /auto/):matches-css(width: /^[2-3]{1}[0-9]{2}(\.[0-9]+)?px$/):matches-css(height: /^[2-3]{1}[0-9]{2}(\.[0-9]+)?px$/):matches-css(display: /block|table/):remove()
duplichecker.com##vvv, ccc, spavn, .qwert, .dfdfdf, .nhnhnhn, [class^="alkjhg"], #btnbtnn2, a[href="https://www.duplichecker.com/gcl"], [mv*="grmly"]
||duplichecker.com/asets/img/logo.svg$image,1p

! https://github.com/uBlockOrigin/uAssets/issues/4104
jagran.com##.ads

! https://github.com/uBlockOrigin/uAssets/issues/5695
picbaron.com##+js(aeld, , _0x)
picbaron.com##+js(aopr, loadTool)
picbaron.com##+js(aopr, open)
picbaron.com##+js(noeval)
picbaron.com##.newsbar_blue
picbaron.com###fadeinbox
*$frame,domain=picbaron.com
||picbaron.com/*.gif$image
picbaron.com##[href*="/redirect?tid="]

! https://github.com/uBlockOrigin/uAssets/issues/4098
! https://github.com/uBlockOrigin/uAssets/issues/7122
temp-mail.org##+js(set, checkadBlock, noopFunc)
temp-mail.org#?#li:has(.viewLink:has-text(AD |))

! http://forums.mozillazine.org/viewtopic.php?f=38&t=3043519
3dprintersforum.co.uk##+js(acs, $, gandalfads)

! https://www.reddit.com/r/uBlockOrigin/comments/9wzeku/ublock_detected_in/
giallozafferano.it##+js(nostif, (), 1)

! https://github.com/uBlockOrigin/uAssets/issues/4127
javstream.com##+js(aopr, AaDetector)
javstream.com##+js(aopw, __aaZoneid)

! https://github.com/uBlockOrigin/uAssets/issues/4130
sna3talaflam.com###adblock_abdoutech
sna3talaflam.com##body:style(overflow: auto !important;)
sna3talaflam.com##+js(aeld, load, onload)

! https://github.com/uBlockOrigin/uAssets/pull/4124
linkspaid.com##+js(set, jQuery.adblock, false)
linkspaid.com##+js(nostif, (), 1000)

! https://github.com/NanoMeow/QuickReports/issues/329
kurazone.net##+js(aopr, AaDetector)
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=kurazone.net

! agar.*
agar.pro##+js(aeld, load, onload)
@@||ip-api.com/json/$script,domain=agar.pro
@@||agar.pro^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/4136
@@||methbox.com^$ghide
methbox.com##+js(nostif, nextFunction, 250)
||popcent.org^$3p

! https://forums.lanik.us/viewtopic.php?f=62&t=42181
! https://github.com/uBlockOrigin/uAssets/issues/4202
gamecopyworld.*##+js(acs, document.createElement, Tool)
dl.gamecopyworld.*##.t2 > tbody > tr:nth-of-type(1) > td
dl.gamecopyworld.*##td:nth-of-type(2)
dl.gamecopyworld.*##tr:nth-of-type(6) > td
consoletarget.com##+js(aopr, loadTool)
||gamecopyworld.com/!_$frame

! https://github.com/NanoAdblocker/NanoFilters/issues/220
! https://github.com/AdguardTeam/AdguardFilters/issues/114751
@@||asianclub.*^$ghide
asianclub.*##+js(set, clientSide.adbDetect, noopFunc)
asianclub.*##+js(aopr, AaDetector)
asianclub.*##+js(aopr, jwplayer.utils.Timer)
asianclub.*##+js(nowoif)
asianclub.*##+js(aopr, __Y)
javmost.*##center > div[style^="width:100%; height: 100px"]
watchjavnow.xyz##+js(aopr, __Y)

! https://github.com/uBlockOrigin/uAssets/issues/13833
! vidmoly . me | .to popups
vidmoly.*##+js(nowoif)
||apptospace.com^
||disproveknob.com^
vidmoly.*###mg_vd
vidmoly.*###voc_block
vidmoly.*###dos_vlock
||cdn.staticmoly.me/*.php$domain=vidmoly.*

! nsfw xcums . com popups
xcums.com##+js(aopr, encodeURIComponent)

! https://github.com/uBlockOrigin/uAssets/issues/6354
xpaja.net##+js(acs, String.fromCharCode, atob)

! https://github.com/NanoMeow/QuickReports/issues/351
comnuan.com##+js(set, cmnnrunads, true)

! https://github.com/uBlockOrigin/uAssets/issues/3960
mega-p2p.net##+js(aopr, open)

! https://github.com/uBlockOrigin/uAssets/issues/4156
audioz.download,peeplink.in##+js(acs, String.fromCharCode, 'shift')

! https://github.com/uBlockOrigin/uAssets/issues/22511
@@||savelinks.*^$ghide
savelinks.*##+js(aopr, LieDetector)
savelinks.*##+js(nowoif)

! uppit. com ads
||uppit.com^$document,csp=script-src 'self' 'unsafe-eval' 'unsafe-inline' data: *.cloudflare.com
@@||uppit.com^$ghide

! https://github.com/abp-filters/abp-filters-anti-cv/issues/18
xianzhenyuan.cn##+js(acs, document.getElementById, undefined)

! https://forums.lanik.us/viewtopic.php?f=96&t=42204
novablogitalia.*##+js(aeld, load, nextFunction)

! https://github.com/uBlockOrigin/uAssets/issues/4164
||shrinkearn.com/sw.js$script,1p
*$frame,domain=shrinkearn.com,3p,denyallow=cloudflare.com
shrinkearn.com##+js(aopr, open)

! https://github.com/uBlockOrigin/uAssets/issues/4171
gsm1x.xyz##+js(aopw, downloadJSAtOnload)
gsm1x.xyz##+js(nano-stb, run)
||romgoc.net^$3p

! https://github.com/NanoMeow/QuickReports/issues/364
dexterclearance.com#@#ins.adsbygoogle[data-ad-slot]
dexterclearance.com##.adsbygoogle:style(max-height: 1px !important;)

! https://github.com/uBlockOrigin/uAssets/issues/4184
a-o.ninja,anime-odcinki.pl##+js(set, showAds, true)
! https://github.com/uBlockOrigin/uAssets/issues/4338
anime-odcinki.pl##+js(aopr, _pop)
anime-odcinki.pl##.size-full

! https://github.com/uBlockOrigin/uAssets/issues/4187
singingdalong.*##+js(aeld, load, 2000)

! https://forums.lanik.us/viewtopic.php?f=62&t=42217
mrdeepfakes.com##+js(aopw, ReactAds)
mrdeepfakes.com##+js(acs, document.getElementsByTagName, script)
mrdeepfakes.com##+js(aopw, phtData)
mrdeepfakes.com##[href*="offer"]

! https://github.com/NanoMeow/QuickReports/issues/370
! https://www.reddit.com/r/uBlockOrigin/comments/a4ms6i/ublock_for_firefoxchrome_not_blocking_video_on/
*&expires$media,redirect=noopmp3-0.1s,domain=prosieben.at|prosieben.de|prosiebenmaxx.de|ran.de
||zomap.de/*&expires=$script,domain=prosieben.at|prosieben.de|prosiebenmaxx.de|ran.de

! popunder / (nsfw) sites - phtData
donk69.com,hotdreamsxxx.com##+js(aopw, phtData)

! https://github.com/NanoMeow/QuickReports/issues/340
! https://forums.lanik.us/viewtopic.php?p=143447#p143447
veedi.com##+js(set, adBlocker, false)
4j.com##+js(nostif, (), 2000)
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=4j.com|veedi.com,redirect-rule=google-ima.js
4j.com###bio_ep, #bio_ep_bg
4j.com##body:style(overflow: auto !important;)

! https://www.reddit.com/r/uBlockOrigin/comments/a09q3o/anti_adblock_uonano_defender/
! https://github.com/uBlockOrigin/uAssets/issues/20572
anitube.*##+js(aopr, exoJsPop101)
anitube.*##+js(set, adBlockDetected, noopFunc)
anitube.*###iframeCore____
||anitube.*/sw.js$script,1p
anitube.*##div[style^="pointer-events: none; position: absolute; "]

! https://github.com/uBlockOrigin/uAssets/issues/4193
goltelevision.com##+js(set, adblock, false)
@@||nqs.nice264.com/data?system=golt&plugin$xhr,domain=goltelevision.com

! https://github.com/uBlockOrigin/uAssets/issues/4198
||code.jquery.com/jquery-$script,domain=mega-mkv.com
mega-mkv.com,mkv-pastes.com##+js(aeld, DOMContentLoaded, adlinkfly)
mega-mkv.com##+js(aeld, DOMContentLoaded, shortener)
mega-mkv.com##center > p:has(> a[href] > img.alignnone)

! https://github.com/NanoMeow/QuickReports/issues/382
medievalists.net##.widget-title:has-text(Adv)

! celebritymovieblog . com popups / ads
celebritymovieblog.com##+js(acs, puShown, /doOpen|popundr/)
celebritymovieblog.com##.banner_top

! https://github.com/NanoMeow/QuickReports/issues/385
stiletv.it##+js(set, StileApp.somecontrols.adBlockDetected, noopFunc)

! https://github.com/uBlockOrigin/uAssets/issues/4212
beeimg.com##+js(nostif, document.cookie, 2500)
beeimg.com##+js(nostif, window.open)
beeimg.com##.offer

! https://github.com/uBlockOrigin/uAssets/issues/4215
fileone.tv##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/4216
mywatchseries.*##+js(nowebrtc)
||d19f0dp1dh77jq.cloudfront.net^
||mywatchseries.*/sw.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/4219
yomovies.*##+js(aopr, decodeURI)
mixdrp.*##+js(aeld, load, download-wrapper)
mixdrop.*##+js(set, MDCore.adblock, 0)
mixdrop.*,mixdrp.*##+js(acs, $, String.fromCharCode)
mixdrop.*,mixdrp.*##+js(nano-stb, disabled)
mdbekjwqa.pw##+js(noeval-if, setInterval)
mdbekjwqa.pw##+js(acs, document.createElement, onerror)
mdfx9dc8n.net,mdzsmutpcvykb.net,mixdrop21.net,mixdropjmk.pw##+js(rmnt, script, /h=decodeURIComponent|popundersPerIP/)
mdbekjwqa.pw,mdfx9dc8n.net,mdzsmutpcvykb.net,mixdroop.*,mixdrop.*,mixdrop21.net,mixdropjmk.pw,mixdrp.*##+js(nowoif)
||mixdrop.*/sw.js$script,1p
mixdrop.*##div[onclick^="$(this).remove"]
mdbekjwqa.pw,mdfx9dc8n.net,mixdroop.*,mixdrop.*,mixdrop21.net,mixdropjmk.pw,mixdrp.*##body > div[style^="position: absolute;"][style*="z-index"]
*$script,3p,denyallow=dotblocking.dummy|google.com|gstatic.com|hwcdn.net|jquery.com,domain=mixdrop.*|mixdrp.*|~mixdrop.one|mixdroop.*
||auubslxxi.com^
||brightadnetwork.com^
||cviezjsg.com^
||gtbtnrpzz.com^
||jwgigawtq.com^
||zwuucugezzjhhi.com^

! https://github.com/NanoMeow/QuickReports/issues/389
||d81idz8m5qll8.cloudfront.net/app.min.js$script

! https://github.com/uBlockOrigin/uAssets/issues/4221
m.hellporno.com###fltd-inner
hellporno.*##.bnnrs-player

||share.notizie.it^
||areyouabot.net^$3p

! https://www.reddit.com/r/uBlockOrigin/comments/a2bkso/ublock_not_blocking/
! https://github.com/uBlockOrigin/uAssets/issues/7790
u.gg###af-header-link
u.gg###af-all:style(margin-top: 4em;)

! https://github.com/uBlockOrigin/uAssets/issues/4241
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=actiongame.com|brain-games.co.uk|classicgame.com|games-site.co.uk|hiddenobjectgames.com|mahjong.co.uk|mahjong.com|match3.co.uk|match3games.com|mindgames.com|neongames.co.uk|solitaireonline.com|timemanagementgame.com
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect-rule=google-ima.js,domain=neongames.com

! anti adb puzzlefry . com
puzzlefry.com##+js(aopw, killAdBlock)

! https://github.com/uBlockOrigin/uAssets/issues/4246
hentaisd.*##+js(aopr, LieDetector)
||n1g459ky7y.com^

! https://github.com/uBlockOrigin/uAssets/issues/6177
ftlauderdalebeachcam.com,ftlauderdalewebcam.com,juneauharborwebcam.com,keywestharborwebcam.com,kittycatcam.com,mahobeachcam.com,miamiairportcam.com,morganhillwebcam.com,njwildlifecam.com,nyharborwebcam.com,paradiseislandcam.com,pompanobeachcam.com,portbermudawebcam.com,portcanaveralwebcam.com,portevergladeswebcam.com,portmiamiwebcam.com,portnywebcam.com,portnassauwebcam.com,portstmaartenwebcam.com,portstthomaswebcam.com,porttampawebcam.com,sxmislandcam.com##+js(nostif, innerHTML)
ftlauderdalebeachcam.com,ftlauderdalewebcam.com,juneauharborwebcam.com,keywestharborwebcam.com,kittycatcam.com,mahobeachcam.com,miamiairportcam.com,morganhillwebcam.com,njwildlifecam.com,nyharborwebcam.com,paradiseislandcam.com,pompanobeachcam.com,portbermudawebcam.com,portcanaveralwebcam.com,portevergladeswebcam.com,portmiamiwebcam.com,portnywebcam.com,portnassauwebcam.com,portstmaartenwebcam.com,portstthomaswebcam.com,porttampawebcam.com,sxmislandcam.com##.horiz-banner-box-1, .info-left, .info-right
||cdn.ptztv.live/*/ads/$image
portevergladeswebcam.com###partnerad1div

! https://github.com/NanoMeow/QuickReports/issues/400
hqtv.biz##+js(set, google_tag_data, noopFunc)

! https://www.reddit.com/r/uBlockOrigin/comments/a31vbm/some_help_needed_in_finding_out_the_antiadblock/
thoptv.*##+js(aopr, AaDetector)
thoptv.*##+js(nostif, readyplayer, 2000)

! https://github.com/NanoMeow/QuickReports/issues/403
liveuamap.com##+js(set, noAdBlock, true)

! https://github.com/uBlockOrigin/uAssets/issues/4255
||smrmembers-smr.smartmediarep.com/*/video/*.mp4$media,domain=tv.naver.com,redirect=noopmp4-1s

! https://github.com/uBlockOrigin/uAssets/issues/4260
forum-pokemon-go.fr##+js(nostif, nextFunction, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/4263
||short.es/adv/*$frame,1p

! https://forums.lanik.us/viewtopic.php?f=62&t=42285
! https://github.com/uBlockOrigin/uAssets/issues/4577
! https://github.com/uBlockOrigin/uAssets/issues/6416
@@||rte.ie^$ghide
@@||v.fwmrm.net/ad/g/*_HTML5_Live$script,domain=rte.ie
@@||src.litix.io/videojs/$script,domain=rte.ie
@@||rte.ie/player/$script,xhr,1p
@@||googlesyndication.com/pagead/js/adsbygoogle.js$xhr,domain=rte.ie
||rte.ie/ads/*$media,redirect=noopmp4-1s,domain=rte.ie
@@||doubleclick.net/gampad/live/ads*rte.ie$xhr,domain=imasdk.googleapis.com
@@||doubleclick.net/gampad/ads*rte.ie$xhr,domain=imasdk.googleapis.com
||securecdn.videologygroup.com/Prod/DSPMedia/$media,redirect=noopmp3-0.1s,domain=rte.ie
*/media/*.mp4|$media,domain=rte.ie,redirect=noopmp3-0.1s
! https://www.reddit.com/r/uBlockOrigin/comments/l65lnp/
*$1p,image,redirect-rule=1x1.gif,domain=rte.ie
rte.ie##.vjs-close-button
rte.ie##.adCue

! crohasit . com popups
crohasit.*##+js(aopw, Fingerprint2)

! https://github.com/uBlockOrigin/uAssets/issues/4266
theglobeandmail.com##+js(aopw, adBlocker)

! https://github.com/NanoMeow/QuickReports/issues/411
macwelt.de,pcwelt.de##+js(aeld, load, autoRecov)

! 6play fr anti adb
@@||v.fwmrm.net/ad/g/*_html5_live$script,domain=6play.fr
@@||v.fwmrm.net/ad/g/$xhr,domain=6play.fr
*.mp4$media,redirect=noopmp3-0.1s,domain=6play.fr
@@||ads.stickyadstv.com^$xhr,domain=6play.fr
*$script,redirect-rule=noopjs,domain=6play.fr
@@||7cbf2.v.fwmrm.net^$xhr,domain=6play.fr

||adslop.com^$3p

! https://github.com/NanoMeow/QuickReports/issues/417
@@||genvideos.*/js/showads.js$xhr,1p

! https://github.com/uBlockOrigin/uAssets/issues/4276
||googlesyndication.com/pagead/$script,redirect=noopjs,domain=uploadbox.io
uploadbox.io##+js(nosiif, (), 5000)

! https://github.com/uBlockOrigin/uAssets/issues/4268
gaypornwave.com##+js(aost, String.prototype.charCodeAt, ai_)
gaypornwave.com##+js(aopr, ExoLoader)
gaypornwave.com##+js(aopr, _pop)
##[href^="https://popcash.net/"]
##[href^="https://adult.xyz/"]

! https://github.com/uBlockOrigin/uAssets/issues/4268#issuecomment-445406636
onlineclassnotes.com###turnOffAdBlockerContainer

! https://forums.lanik.us/viewtopic.php?p=143974#p143974
dualpaste.net##+js(nowebrtc)

! https://github.com/AdguardTeam/AdguardFilters/issues/26605
urbia.de##+js(aopr, _sp_.mms.startMsg)

! https://github.com/AdguardTeam/AdguardFilters/issues/26600
! https://github.com/uBlockOrigin/uAssets/issues/13747
! https://github.com/uBlockOrigin/uAssets/issues/19127
freecoursesite.com,livsavr.co##+js(acs, eval, replace)
freecoursesite.com##+js(nostif, show)

! https://github.com/uBlockOrigin/uAssets/issues/4279
scubidu.eu##+js(aost, String.prototype.charCodeAt, ai_)
scubidu.eu###custom_html-15
scubidu.eu###custom_html-16

! https://github.com/uBlockOrigin/uAssets/issues/4281
root-top.com##+js(aopr, adblockblock)

! https://github.com/uBlockOrigin/uAssets/issues/6205
! https://github.com/uBlockOrigin/uAssets/issues/20954
!#if env_firefox
||cibntv.net/youku/$media,important,redirect=none:10,from=youku.com
!#endif
||cibntv.net/youku/*$media,redirect=noopmp3-0.1s,domain=youku.com
||valipl.cp31.ott.cibntv.net^$media,redirect=noopmp3-0.1s,domain=youku.com
youku.com##+js(nano-stb, , ,0)
@@||valipl.cp31.ott.cibntv.net^$xhr,domain=youku.com
*$image,redirect-rule=1x1.gif,domain=youku.com

! popunder celebjihad . com nsfw
celebjihad.com##+js(aopr, dataPopUnder)
||celebjihad.live^$3p
||leojmp.com^

! https://github.com/uBlockOrigin/uAssets/issues/4303
! https://github.com/easylist/easylist/issues/6200
! https://github.com/easylist/easylist/issues/6543
! https://github.com/easylist/easylist/issues/6553
allmomsex.com,allnewindianporn.com,analxxxvideo.com,animalextremesex.com,anime3d.xyz,animefuckmovies.com,animepornfilm.com,animesexbar.com,animesexclip.com,animexxxsex.com,animexxxfilms.com,anysex.club,apetube.asia,asianfuckmovies.com,asianfucktube.com,asianporn.sexy,asiansex.*,asiansexcilps.com,beeg.fund,beegvideoz.com,bestasiansex.pro,bravotube.asia,brutalanimalsfuck.com,candyteenporn.com,daddyfuckmovies.com,desifuckonline.com,exclusiveasianporn.com,exteenporn.com,fantasticporn.net,fantasticyoungporn.com,fineasiansex.com,firstasianpussy.com,freeindiansextube.com,freepornasians.com,freerealvideo.com,fuck-beeg.com,fuck-xnxx.com,fuckasian.pro,fuckfuq.com,fuckundies.com,gojapaneseporn.com,golderotica.com,goodyoungsex.com,goyoungporn.com,hardxxxmoms.com,hdvintagetube.com,hentaiporn.me,hentaisexfilms.com,hentaisexuality.com,hot-teens-movies.mobi,hotanimepornvideos.com,hotanimevideos.com,hotasianpussysex.com,hotjapaneseshows.com,hotmaturetube.com,hotmilfs.pro,hotorientalporn.com,hotpornyoung.com,hotxxxjapanese.com,hotxxxpussy.com,indiafree.net,indianpornvideo.online,japanfuck.*,japanporn.*,japanpornclip.com,japanesetube.video,japansex.me,japanesexxxporn.com,japansporno.com,japanxxx.asia,japanxxxworld.com,keezmovies.surf,lingeriefuckvideo.com,liveanimalporn.zooo.club,madhentaitube.com,megahentaitube.com,megajapanesesex.com,megajapantube.com,milfxxxpussy.com,momsextube.pro,momxxxass.com,monkeyanimalporn.com,moviexxx.mobi,newanimeporn.com,newjapanesexxx.com,nicematureporn.com,nudeplayboygirls.com,openxxxporn.com,originalindianporn.com,originalteentube.com,pig-fuck.com,plainasianporn.com,popularasianxxx.com,pornanimetube.com,pornasians.pro,pornhat.asia,pornheed.online,pornjapanesesex.com,pornomovies.asia,pornvintage.tv,primeanimesex.com,realjapansex.com,realmomsex.com,redsexhub.com,retroporn.world,retrosexfilms.com,sex-free-movies.com,sexanimesex.com,sexanimetube.com,sexjapantube.com,sexmomvideos.com,sexteenxxxtube.com,sexxxanimal.com,sexyoungtube.com,sexyvintageporn.com,sopornmovies.com,spicyvintageporn.com,sunporno.club,tabooanime.club,teenextrem.com,teenfucksex.com,teenhost.net,teensex.*,teensexass.com,tnaflix.asia,totalfuckmovies.com,totalmaturefuck.com,txxx.asia,vintagetube.*,voyeurpornsex.com,warmteensex.com,wetasiancreampie.com,wildhentaitube.com,wowyoungsex.com,xhamster-art.com,xmovie.pro,xnudevideos.com,xnxxjapon.com,xpics.me,xvide.me,xxxanimefuck.com,xxxanimevideos.com,xxxanimemovies.com,xxxhentaimovies.com,xxxhothub.com,xxxjapaneseporntube.com,xxxlargeporn.com,xxxmomz.com,xxxmovies.*,xxxpornmilf.com,xxxpussyclips.com,xxxpussysextube.com,xxxretrofuck.com,xxxsex.pro,xxxsexyjapanese.com,xxxteenyporn.com,xxxvideo.asia,xxxvideos.ink,xxxyoungtv.com,youjizzz.club,youngpussyfuck.com##+js(aopr, popit)
allmomsex.com,allnewindianporn.com,analxxxvideo.com,animalextremesex.com,anime3d.xyz,animefuckmovies.com,animepornfilm.com,animesexbar.com,animesexclip.com,animexxxsex.com,animexxxfilms.com,anysex.club,apetube.asia,asianfuckmovies.com,asianfucktube.com,asianporn.sexy,asiansex.*,asiansexcilps.com,beeg.fund,beegvideoz.com,bestasiansex.pro,bravotube.asia,brutalanimalsfuck.com,candyteenporn.com,daddyfuckmovies.com,desifuckonline.com,exclusiveasianporn.com,exteenporn.com,fantasticporn.net,fantasticyoungporn.com,fineasiansex.com,firstasianpussy.com,freeindiansextube.com,freepornasians.com,freerealvideo.com,fuck-beeg.com,fuck-xnxx.com,fuckasian.pro,fuckfuq.com,fuckundies.com,gojapaneseporn.com,golderotica.com,goodyoungsex.com,goyoungporn.com,hardxxxmoms.com,hdvintagetube.com,hentaiporn.me,hentaisexfilms.com,hentaisexuality.com,hot-teens-movies.mobi,hotanimepornvideos.com,hotanimevideos.com,hotasianpussysex.com,hotjapaneseshows.com,hotmaturetube.com,hotmilfs.pro,hotorientalporn.com,hotpornyoung.com,hotxxxjapanese.com,hotxxxpussy.com,indiafree.net,indianpornvideo.online,japanfuck.*,japanporn.*,japanpornclip.com,japanesetube.video,japansex.me,japanesexxxporn.com,japansporno.com,japanxxx.asia,japanxxxworld.com,keezmovies.surf,lingeriefuckvideo.com,liveanimalporn.zooo.club,madhentaitube.com,megahentaitube.com,megajapanesesex.com,megajapantube.com,milfxxxpussy.com,momsextube.pro,momxxxass.com,monkeyanimalporn.com,moviexxx.mobi,newanimeporn.com,newjapanesexxx.com,nicematureporn.com,nudeplayboygirls.com,openxxxporn.com,originalindianporn.com,originalteentube.com,pig-fuck.com,plainasianporn.com,popularasianxxx.com,pornanimetube.com,pornasians.pro,pornhat.asia,pornheed.online,pornjapanesesex.com,pornomovies.asia,pornvintage.tv,primeanimesex.com,realjapansex.com,realmomsex.com,redsexhub.com,retroporn.world,retrosexfilms.com,sex-free-movies.com,sexanimesex.com,sexanimetube.com,sexjapantube.com,sexmomvideos.com,sexteenxxxtube.com,sexxxanimal.com,sexyoungtube.com,sexyvintageporn.com,sopornmovies.com,spicyvintageporn.com,sunporno.club,tabooanime.club,teenextrem.com,teenfucksex.com,teenhost.net,teensex.*,teensexass.com,tnaflix.asia,totalfuckmovies.com,totalmaturefuck.com,txxx.asia,vintagetube.*,voyeurpornsex.com,warmteensex.com,wetasiancreampie.com,wildhentaitube.com,wowyoungsex.com,xhamster-art.com,xmovie.pro,xnudevideos.com,xnxxjapon.com,xpics.me,xvide.me,xxxanimefuck.com,xxxanimevideos.com,xxxanimemovies.com,xxxhentaimovies.com,xxxhothub.com,xxxjapaneseporntube.com,xxxlargeporn.com,xxxmomz.com,xxxmovies.*,xxxpornmilf.com,xxxpussyclips.com,xxxpussysextube.com,xxxretrofuck.com,xxxsex.pro,xxxsexyjapanese.com,xxxteenyporn.com,xxxvideo.asia,xxxvideos.ink,xxxyoungtv.com,youjizzz.club,youngpussyfuck.com##+js(aeld, popstate, noPop)
twister.porn##+js(aopr, open)
xpics.me##+js(nowoif)
fuckundies.com##+js(acs, puShown, /doOpen|popundr/)
hotxxxpussy.com,openxxxporn.com,xxxlargeporn.com,xxxpussyclips.com,xxxpussysextube.com##.imbar
##.ave-pl
##.bottom-hor-block
##.brs-block
finevids.xxx##.spot3-holder
hentaisexuality.com###popwindow
livejapaneseporn.com##body > div > div > aside[class]
pornjapanese.me##.bottom-spot-area
pornjapanese.me##[class$="spots-area"]
teencumpot.com###spot-holder
xnxxjapon.com###asg-inplayer-block:upward(4)
xxmovz.com##+js(aopr, decodeURI)
xxmovz.com##.ad
xxxvideos.ink###hidme
xxxvideos.ink##li.plate:has(iframe[width="300"])
xxxvideos.ink##.curiosity
/quwet.js$script,1p
||all-usanomination.com^$3p
||willalland.info^
! https://github.com/easylist/easylist/issues/8709
##.advboxemb
freeporn.works##.show
freeporn.works##.past
||freeporn.works/seven.aspx?
||clivads.com^
! https://github.com/easylist/easylist/issues/8710
||sexxx.kim/literature.xhtml?
! https://github.com/easylist/easylist/issues/8718
||granny.asia/partner.xhtml?
! https://github.com/easylist/easylist/issues/8729
xvideo.party##.pride.dump
||xvideo.party/shop.aspx?

! https://github.com/gorhill/uBO-Extra/issues/111
mtlblog.com,narcity.com##+js(aopw, Ha)

! https://github.com/uBlockOrigin/uAssets/issues/4311
komikcast.*##+js(aeld, load, onload)
komikcast.*##+js(aopr, open)
@@||komikcast.*^$ghide
||blogspot.*/*.gif$image,domain=komikcast.*

! https://github.com/uBlockOrigin/uAssets/issues/4316
! https://github.com/uBlockOrigin/uAssets/issues/4457
! https://github.com/uBlockOrigin/uAssets/issues/4456
vidcloud.*##+js(acs, atob, decodeURIComponent)
vidcloud.*##+js(acs, Math, XMLHttpRequest)
@@||vidcloud.*^$ghide
streamingworld.*##+js(acs, atob, decodeURIComponent)
streamingworld.*##+js(aopr, AaDetector)
streamingworld.*##+js(aopw, Fingerprint2)
*$script,3p,denyallow=googleapis.com,domain=streamingworld.club
l23movies.*,123moviess.*,123movieshub.*##+js(acs, JSON.parse, atob)
0l23movies.*##+js(aopr, rid)
123moviess.*##+js(aost, document.createElement, inlineScript)
||d1b0fk9ns6n0w9.cloudfront.net^
||mousheen.net^
123moviesfree.*##+js(nowoif)
123moviesd.com,123moviesjr.cc,123moviess.se##+js(aopr, mm)

! yesmovies .vc/. ws/. org/ .mn
yesmovies.*##+js(nowoif)
yesmovies.*##+js(aopr, AaDetector)
yesmovies.*##+js(nowebrtc)
/sw-vodlocker.to.js$script
yesmovies.*##a.btn-successful

! https://github.com/uBlockOrigin/uAssets/issues/2031
solarmovie.*##+js(aopr, AaDetector)
solarmovie.*##+js(nowoif)
solarmovie.*##.close
solarmovie.*##[href*="/4k"]
solarmovie.*##table.movie_version:has-text(Promo)
solarmovie.*##div.row:has-text(in HD)
solarmovie.*##.jw-reset.jw-logo-top-left.jw-logo
||solarmovie.vip/js/dab.min.js

! https://github.com/uBlockOrigin/uAssets/issues/4326
! https://github.com/NanoAdblocker/NanoFilters/issues/503
mega4up.*,zeefiles.*##+js(ra, onclick, [onclick^="window.open"])
zeefiles.*##+js(nano-stb, tick)
zeefiles.*##+js(nowoif)
mycoolmoviez.*##[href="javascript:void(0);"]
mycoolmoviez.*##+js(nowebrtc)
||mycoolmoviez.*/sw.js
! https://github.com/uBlockOrigin/uAssets/issues/8607
mega4up.*##+js(nowoif)

! https://www.reddit.com/r/uBlockOrigin/comments/a6r2qx/ublock_filters_for_putlocker9ru/
! https://github.com/uBlockOrigin/uAssets/issues/6090
putlocker9.*##+js(aopw, Fingerprint2)
putlocker9.*##.pframe:has([href^="javascript: void(0);"])

! https://github.com/jspenguin2017/uBlockProtector/issues/1011
k511.me##+js(acs, document.getElementById, undefined)

! https://github.com/uBlockOrigin/uAssets/issues/4333
thepiratebay.*,thepiratebay10.org##+js(aopw, spot)
thepiratebay.*##+js(aopr, popjs.init)

! https://github.com/NanoMeow/QuickReports/issues/463
audycje.tokfm.pl##+js(set, adsOk, true)
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=audycje.tokfm.pl

! https://github.com/uBlockOrigin/uAssets/issues/4335
news-leader.com##+js(aopr, _sp_._networkListenerData)

! https://github.com/NanoAdblocker/NanoFilters/issues/228
ihub.live,naturalbd.com##+js(aopr, encodeURIComponent)
||ihub.live/sw.js$script,1p
||naturalbd.com/sw.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/1916
bdiptv.*##+js(aopr, AaDetector)
bdiptv.*##+js(nowoif)
@@||bdiptv.*^$ghide
bdlive.*###AdDiv

! https://github.com/uBlockOrigin/uAssets/commit/8e1f6da09188c35695f3b21eaeda055e1c15248e#commitcomment-31744488
milfzr.com##+js(nowoif)
milfzr.com##+js(acs, String.prototype.charCodeAt, tabunder)
milfzr.com##.wpfp_custom_ad_content
milfzr.com###post-0
||milfzr.com/*.gif$image

! https://forums.lanik.us/viewtopic.php?f=62&t=42364
wemakesites.net##+js(acs, $, adBlockChecker)

! https://github.com/uBlockOrigin/uAssets/issues/8269
! https://www.reddit.com/r/uBlockOrigin/comments/9lom6n/help_blocking_ads_on_hulu/
! https://www.reddit.com/r/uBlockOrigin/comments/eexi26/
hulu.com##+js(set, Object.prototype._parseVAST, noopFunc)
hulu.com##+js(set, Object.prototype.createAdBlocker, noopFunc)
hulu.com##+js(set, Object.prototype.isAdPeriod, falseFunc)
||assetshuluimcom-a.akamaihd.net/*.mp3$media,redirect=noopmp3-0.1s,domain=hulu.com
@@||hulu.com^$ghide
hulu.com###banner-ad-container
hulu.com##.ad-choices
! https://github.com/uBlockOrigin/uAssets/issues/17382
! https://www.reddit.com/r/uBlockOrigin/comments/14b5lbw/
! https://www.reddit.com/r/uBlockOrigin/comments/158nvca/not_blocking_hulu_ads/jti29qk/
! https://www.reddit.com/r/uBlockOrigin/comments/16hr6pk/hulu_subtitles_getting_delayed_again/
hulu.com##+js(json-prune-fetch-response, breaks pause_ads video_metadata.end_credits_time, pause_ads)
hulu.com##+js(json-prune-fetch-response, breaks pause_ads video_metadata.end_credits_time, breaks)
hulu.com##+js(json-prune, breaks pause_ads video_metadata.end_credits_time, pause_ads)
hulu.com##+js(json-prune, breaks pause_ads video_metadata.end_credits_time, breaks)
hulu.com##+js(xml-prune, xpath(//*[name()="MPD"]/@mediaPresentationDuration | //*[name()="Period"][.//*[name()="BaseURL" and contains(text()\,'/ads-')]] | //*[name()="Period"]/@start), Period[id^="Ad"i], .mpd)

! https://github.com/uBlockOrigin/uAssets/issues/4356
@@||adserver.iprom.net/adserver7$xhr,domain=rtl.hr

! https://github.com/NanoAdblocker/NanoCore/issues/235
myjest.com##+js(nosiif, _$, 12345)

! https://github.com/uBlockOrigin/uAssets/issues/4268#issuecomment-449131154
*$frame,domain=9ig.de,3p

! https://github.com/uBlockOrigin/uAssets/issues/4268#issuecomment-449134469
rgl.vn##+js(set, blurred, false)
s.sseluxx.com##+js(nano-sib)

! https://github.com/uBlockOrigin/uAssets/issues/4377
! https://github.com/NanoMeow/QuickReports/issues/2059
unlockapk.com##+js(aeld, load, onload)
@@||unlockapk.com^$ghide
@@||unlockapk.com^$script,1p
||googlesyndication.com/simgad/*$image,domain=unlockapk.com,redirect=1x1.gif
@@||googlesyndication.com/pagead/js/adsbygoogle.js$script,domain=unlockapk.com
unlockapk.com##ins.adsbygoogle

! https://github.com/uBlockOrigin/uAssets/issues/4368#issuecomment-449780120
reqlinks.net##+js(set, blurred, false)

! https://github.com/uBlockOrigin/uAssets/issues/4396
mangovideo.*,pandamovies.pw##+js(acs, document.createElement, 'script')
pandamovies.pw##+js(acs, puShown, /doOpen|popundr/)
pandamovies.pw##+js(aopr, ExoLoader.serve)
pandamovies.pw##+js(nowoif)
mangovideo.*##+js(set, flashvars.popunder_url, '')
mangovideo.*##.sponsor
mangovideo.*##.top
mangovideo.*##.table
mangovideo.*##[target="_blank"]
@@||pandamovies.pw^$ghide
pandamovies.pw##.btn-lg.btn-block.btn
||mangovideo.*/sw.js$script,1p
||mangovideo.*/player/html.php?aid
*$script,3p,domain=mangovideo.*

! https://github.com/uBlockOrigin/uAssets/issues/4397
||pradjadj.com^$csp=child-src *.google.com *.gstatic.com *.arc.io
pradjadj.com##[href="/advertise"]
pradjadj.com##.ABD_display
||pradjadj.com/*banner$image

! https://github.com/uBlockOrigin/uAssets/issues/4402
siriusfiles.com##+js(nano-stb)
||siriusfiles.com/adframe.js$frame,redirect-rule=noop.html

! https://github.com/uBlockOrigin/uAssets/issues/4401
@@||dvdporngay.com^$ghide
||dvdporngay.com/wp-content/themes/*/images/loading.gif$image
dvdporngay.com##+js(aopr, decodeURIComponent)

! https://github.com/uBlockOrigin/uAssets/issues/4368#issuecomment-449787995
alimaniacky.cz##+js(acs, $, urlForPopup)

! https://github.com/uBlockOrigin/uAssets/issues/4368#issuecomment-449866993
dozarte.com##+js(acs, document.getElementById, undefined)
dozarte.com##+js(ra, onclick)
dozarte.com###banana

! https://github.com/uBlockOrigin/uAssets/issues/4415
shush.se##+js(set, check, true)
||shush.se/loader/load.js$script

! https://github.com/uBlockOrigin/uAssets/issues/16693
! https://github.com/uBlockOrigin/uAssets/issues/18099
emurom.net##+js(set, dvsize, 51)
emurom.net##+js(aost, jQuery, removeDLElements)

! https://github.com/uBlockOrigin/uAssets/issues/4399
! https://www.reddit.com/r/uBlockOrigin/comments/u72fym/dailymotion_adblock_detected/
||s3.amazonaws.com/dmas-public/rubicon/bundle.js$script,domain=dailymotion.com
@@||dailymotion.com^$ghide

! cinemalibero .best popups/ ads
cinemalibero.*##+js(nowoif)
cinemalibero.*##+js(aopr, AaDetector)

! https://github.com/uBlockOrigin/uAssets/issues/4435
allkpop.com##+js(set, isal, true)

! https://github.com/uBlockOrigin/uAssets/issues/4449
gearingcommander.com##+js(nostif, innerHTML)
gearingcommander.com##+js(no-xhr-if, ads)

! https://github.com/NanoMeow/QuickReports/issues/508
generate.plus##+js(nostif, checkStopBlock)

! https://github.com/uBlockOrigin/uAssets/issues/4455
za.gl##+js(acs, document.addEventListener, click)
za.gl##+js(acs, document.getElementById, overlay)
za.gl##+js(acs, setInterval, location)
za.gl##+js(aopr, popad)
za.gl##+js(nowoif, !za.gl, 0)
za.gl##+js(set, document.hidden, true)
za.gl###ww
*$script,3p,denyallow=cloudflare.com|google.com|googleapis.com|gstatic.com,domain=za.gl

! https://github.com/uBlockOrigin/uAssets/issues/4469
||earn-bitcoins.*/banner_
||bmovies.*/bassets/js/jquery.watch.js$script,1p
bmovies.*###upgrade_pop
||bmovies.*/sw.js$script,1p
||doo6pwib3qngu.cloudfront.net^

! https://github.com/uBlockOrigin/uAssets/issues/4472
watchfree.*###vpnvpn
||filesenzu.com^$3p

! https://github.com/NanoMeow/QuickReports/issues/512
rockit.it##.articolo-body-text-banner
@@||rockitecn.nohup.it/webnew/js/adv$script,domain=rockit.it

! https://github.com/uBlockOrigin/uAssets/issues/4478
watchtvseries.*##+js(nowebrtc)
||watchtvseries.*/sw.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/4481
gazetedamga.com.tr##+js(aopw, importFAB)

! https://github.com/uBlockOrigin/uAssets/issues/4368#issuecomment-450665976
bitlk.com##+js(aopr, open)
bitlk.com##+js(set, blurred, false)

! anti-adb wakanim.tv
@@||wakanim.tv^$script,xhr,1p

! https://github.com/uBlockOrigin/uAssets/issues/4488
pickcrackpasswords.blogspot.com##+js(set, awm, true)

! https://github.com/uBlockOrigin/uAssets/issues/4491
*$script,redirect-rule=noopjs,domain=debilizator.tv
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=debilizator.tv

! https://forums.lanik.us/viewtopic.php?p=144605#p144605
! https://github.com/uBlockOrigin/uAssets/issues/4541#issuecomment-478325073
||cdn.provesrc.com/provesrc.js

! https://github.com/uBlockOrigin/uAssets/issues/4512
dramacool.*##h2.widget-title:has-text(Advertisement)
dramacool.*##[class$="_ads"]
*$script,3p,denyallow=cloudflare.com|facebook.net|fbcdn.net|google.com|googleapis.com|gstatic.com|hcaptcha.com|recaptcha.net,domain=dramacool9.*

! https://github.com/uBlockOrigin/uAssets/issues/4368#issuecomment-450945393
! http://fwd.ovh/J4NMS => http://qlinks.eu/J4NMS
qlinks.eu##+js(set, blurred, false)
||d.wedosas.net/i/$domain=qlinks.eu

! https://github.com/uBlockOrigin/uAssets/issues/10486
simsdom.com##+js(nowoif)
simsdom.com##._ad
simsdom.com###ad860
simsdom.com###adv840
simsdom.com##._pubR
simsdom.com##._pubL
simsdom.com##div[id^="elm"][style="opacity: 1; display: block;"]
simsdom.com##+js(nano-sib, clearInterval, *)

! https://github.com/uBlockOrigin/uAssets/issues/4526
wsj.com##[class*="sponsored"]
wsj.com##div[id^="wrapper-AD_"]
wsj.com##div[class^="style--column--"]:has(> div[class=""] > div[id^="wrapper-AD_NATIVE"])
! https://www.wsj.com/livecoverage/tropical-storm-idalia-hurricane-florida?mod=hp_lead_pos7
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect=google-ima.js,domain=wsj.com,important

! https://github.com/NanoMeow/QuickReports/issues/520
@@||c.amazon-adsystem.com/aax2/apstag.js$script,domain=mylifetime.com
@@||mylifetime.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/4533
gomovies.*,gomoviesc.*##+js(nowoif)
gostream.*,gomovies.*##+js(set, check_adblock, true)
gomovies.*##+js(aopr, mm)
||gomovies.*/sw.js$script,1p
||haupsoti.net^

! https://forums.lanik.us/viewtopic.php?f=62&t=40809
getfreesmsnumber.com##+js(acs, document.getElementById, undefined)

! https://github.com/uBlockOrigin/uAssets/issues/4368#issuecomment-451280061
link.3dmili.com##+js(set, blurred, false)

! https://github.com/NanoMeow/QuickReports/issues/519
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=zattoo.com

! https://github.com/NanoMeow/QuickReports/issues/529
kfrfansub.com##+js(set, adblockEnabled, false)

! https://github.com/NanoMeow/QuickReports/issues/535
! https://github.com/NanoMeow/QuickReports/issues/4754
movisubmalay.*##+js(aopr, glxopen)
movisubmalay.*##+js(aopr, exoJsPop101)

! bayimg.com popups
bayimg.com##+js(aeld, /^(?:click|mousedown)$/, ppu)

! https://github.com/uBlockOrigin/uAssets/issues/4543
avcesar.com##+js(nostif, adspot_top, 1500)

! https://github.com/NanoMeow/QuickReports/issues/538
proxydocker.com##+js(nostif, (), 1000)

! https://github.com/uBlockOrigin/uAssets/issues/4547
illicoporno.com##+js(set, is_adblocked, false)
*$popunder,domain=illicoporno.com

! https://github.com/uBlockOrigin/uAssets/issues/4549
mobdi3ips.com##+js(aeld, load, onload)

! https://github.com/uBlockOrigin/uAssets/issues/4368#issuecomment-451670210
short-fly.com##+js(set, blurred, false)
||ecotrackings.com^$3p

! https://github.com/uBlockOrigin/uAssets/issues/4552
@@||audiotag.info^$script,1p
*$image,domain=audiotag.info,redirect-rule=1x1.gif
audiotag.info##+js(nostif, /offsetHeight|google|Global/)

! https://github.com/uBlockOrigin/uAssets/issues/4557
legionpeliculas.org##+js(aopw, smrtSB)
legionpeliculas.org##+js(aopw, smrtSP)

! https://github.com/uBlockOrigin/uAssets/issues/4378#issuecomment-451783706
latribunadelpaisvasco.com##+js(noeval)

! https://github.com/uBlockOrigin/uAssets/issues/4080
hanime.tv##+js(set, ABLK, false)
@@||hanime.tv^$ghide
hanime.tv##a[href^="https://a.adtng.com/"]
hanime.tv##div:has(> a[href^="https://track.aftrk1.com/"])
||members.hanime.tv/*/preroll_ad_event$xhr
@@||adtng.com/get/$frame,domain=hanime.tv,badfilter
! https://www.reddit.com/r/uBlockOrigin/comments/mgu1v7/banner_ads_on_hanimetv_videos_on_firefox_mobile/
!#if env_mobile
hanime.tv##.htvad[style^="width: 300px; display: block"]
hanime.tv##.htvnad1
hanime.tv##.htvnad
!#endif

! https://github.com/uBlockOrigin/uAssets/issues/4368#issuecomment-452155399
! https://youshort.me/rCsn => bantenexis.com
youshort.me##+js(aopr, open)
youshort.me##.blog-item
bantenexis.com###wpsafe-generate, #wpsafe-link:style(display: block !important;)
bantenexis.com##div[id^="wpsafe-wait"]

! https://www.reddit.com/r/uBlockOrigin/comments/adwlvz/is_there_a_way_to_skip_countdown_timer_on_this/
dokumen.tips##+js(nano-stb, , , 0.02)

! https://github.com/uBlockOrigin/uAssets/issues/4580
tudigitale.it##+js(nostif, an_message, 500)

! https://github.com/uBlockOrigin/uAssets/issues/4613
ibcomputing.com##+js(nostif, Adblocker, 10000)

! https://github.com/uBlockOrigin/uAssets/issues/4616
footballstream.tv,mlbstream.tv,nbastream.tv,nflstream.tv##+js(acs, decodeURI, decodeURIComponent)
mlbstream.tv,nbastream.tv,nflstream.tv,nhlstream.tv##[href*="allsports4free.online/"]
mlbstream.tv,nbastream.tv,nhlstream.tv##[href^="https://pl.allsports4free.club/"]
||sports-streams-online.club^$3p
||givememmastreams.com^$3p

! https://github.com/uBlockOrigin/uAssets/issues/4617
celeb.gate.cc##+js(aeld, click, native code)
celeb.gate.cc##[href^="https://goo.gl/"]
||strpjmp.com^

! https://github.com/uBlockOrigin/uAssets/issues/4619
bolly4u.*##+js(aopr, open)
bolly4u.*##+js(aopr, XMLHttpRequest)
bolly4u.*##.code-block

||d1pozdfelzfhyt.cloudfront.net^

! https://github.com/uBlockOrigin/uAssets/issues/4623
@@||f4links.*^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/4625
androidweblog.com##.stream-item
androidweblog.com##[class^="andro-random-paragraph"]

! https://www.reddit.com/r/uBlockOrigin/comments/aezw21/pogo/
pogo.com##+js(set, pogo.intermission.staticAdIntermissionPeriod, 0)
@@||cdn.pogo.com/*/blockadblock$script,1p
@@||cdn.pogo.com/*/imasdk/application.js$script,1p
@@||cdn.pogo.com/*/imasdk/imasdk-pogo-1.0.js$script,1p
@@||cdn.pogo.com/*/imasdk/video_player.js$script,1p
@@||cdn.pogo.com/*prebid.js$script,1p
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=pogo.com
@@||pogo.com^$ghide
pogo.com##.hideableAd
pogo.com###leaderboard-ad
pogo.com##[class*="gameSkyscraperAd"]
pogo.com##[class*="gameTopAd"]

! https://github.com/uBlockOrigin/uAssets/pull/4626
@@||torrent9.*^$ghide
torrent9.*##+js(aeld, , _0x)
torrent9.*###vpnvpn

! https://github.com/uBlockOrigin/uAssets/issues/4632
||retdaz.fun^$all

! https://github.com/uBlockOrigin/uAssets/issues/4636
! https://github.com/uBlockOrigin/uAssets/issues/13168
||cloudvideo.tv/sw.js$script,1p
cloudvideo.tv##+js(set, SubmitDownload1, noopFunc)
cloudvideotv.*,cloudvideo.tv##+js(nowoif)
cloudvideotv.*##+js(aopr, localStorage)
cloudvideo.tv##+js(aopr, mm)

! https://github.com/uBlockOrigin/uAssets/issues/4646
bdsmporn.cc,cocoporn.net,dirtyporn.cc,faperplace.com,freeadultvideos.cc,freepornstream.cc,generalpornmovies.com,kinkyporn.cc,moviesxxx.cc,movstube.net,onlinefetishporn.cc,peetube.cc,pornonline.cc,porntube18.cc,streamextreme.cc,streamporn.cc,videoxxx.cc,watchporn.cc,x24.video,xxxonline.cc,xxxonlinefree.com,xxxopenload.com##+js(acs, decodeURI, decodeURIComponent)
bdsmporn.cc,cocoporn.net,dirtyporn.cc,faperplace.com,freeadultvideos.cc,freepornstream.cc,generalpornmovies.com,kinkyporn.cc,moviesxxx.cc,movstube.net,onlinefetishporn.cc,peetube.cc,pornonline.cc,porntube18.cc,streamextreme.cc,streamporn.cc,videoxxx.cc,watchporn.cc,x24.video,xxx24.vip,xxxonline.cc,xxxonlinefree.com,xxxopenload.com##+js(aopr, exoJsPop101)

! https://www.reddit.com/r/uBlockOrigin/comments/agpu7r/
startseite.to##+js(nowebrtc)
@@||startseite.to^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/4665
@@||getfreebit.xyz^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/4666
fautsy.com##+js(nano-sib, seconds)
@@||fautsy.com^$ghide
||fautsy.com/adblock.php$xhr,redirect-rule=nooptext,1p
fautsy.com##.coinzilla
fautsy.com##ins[class][style^="display:inline-block;width:"]

! https://github.com/NanoMeow/QuickReports/issues/523
legia.net##+js(nostif, timeoutChecker)

! https://github.com/uBlockOrigin/uAssets/issues/4677
legionprogramas.org##+js(aopw, smrtSB)
legionprogramas.org##+js(aopw, smrtSP)
legionjuegos.org,legionpeliculas.org,legionprogramas.org##+js(nano-sib, , ,0.02)
legionjuegos.org,legionpeliculas.org,legionprogramas.org##+js(set, t, 0)
||ouo.*^$popup,domain=legionjuegos.org|legionpeliculas.org|legionprogramas.org

! https://github.com/uBlockOrigin/uAssets/issues/4681
! https://github.com/uBlockOrigin/uAssets/issues/20330
||adxxx.com^$3p
wiztube.xyz##+js(aopr, BetterJsPop)
wiztube.xyz##+js(acs, Math.floor, vpn)
wiztube.xyz##+js(set, adblockcheck, false)

! https://www.reddit.com/r/uBlockOrigin/comments/aho1fs/help_with_ads_and_overlays_on_a_website/
! https://github.com/uBlockOrigin/uAssets/issues/15466
kinoger.to##+js(nowebrtc)
kinoger.ru##+js(nowoif)
kinoger.re##+js(nostif, 0x)
kinoger.ru##+js(aopr, my_pop)
kinoger.to##a[href^="//fbmedia-ckl.com/get"]
||notifyvideo.info/p/creative-video/*$media,3p,redirect=noopmp4-1s

! https://github.com/uBlockOrigin/uAssets/issues/4683
xxxbunker.com##+js(nowoif)
||static.xxxbunker.com/preroll/*$media,1p

! https://github.com/uBlockOrigin/uAssets/issues/4684
clasicotas.org##+js(aopr, nombre_dominio)
clasicotas.org##+js(nowoif)
||clasicotas.org/themes/*/js/links.js$script,1p

! https://github.com/NanoMeow/QuickReports/issues/588
! https://github.com/AdguardTeam/AdguardFilters/issues/52587
moretvtime.*##+js(acs, adBlockDetected)
moretvtime.*##.sc-banner

! https://www.reddit.com/r/uBlockOrigin/comments/ai01d9/first_state_update_ad_blocker_blocker/
||aterroppop.com^
||pandanetwork.club^$3p,script
/?r=dir&zoneid=$all
||letaikay.net^

! https://www.reddit.com/r/uBlockOrigin/comments/aidnkv/invisible_full_page_ad_breaks_the_search_bar/
watchjavonline.com##+js(acs, atob, decodeURIComponent)
||artofxxx.net^$image,domain=watchjavonline.com

! https://forums.lanik.us/viewtopic.php?f=103&t=42491
tvguia.es##+js(acs, $, .height)

! https://github.com/uBlockOrigin/uAssets/issues/4697
foxseotools.com##+js(nowoif, !?safelink_redirect=)
foxseotools.com##+js(set, blurred, false)
foxseotools.com##form#go-popup:remove()
@@||foxseotools.com^$ghide
foxseotools.com##.iframe-overlay
*$frame,denyallow=facebook.com|google.com|youtube.com,domain=foxseotools.com
*$script,3p,denyallow=akamaiedge.net|cloudflare.com|facebook.net|fbcdn.net|google.com|googleapis.com|gstatic.com|pinterest.com|recaptcha.net,domain=foxseotools.com

! https://github.com/uBlockOrigin/uAssets/issues/4698 / movierulz group
123movierulz.*,7movierulz1.*,7moviesrulz.*,5movierulz2.*,movieruls.*,movierulz.*,movierulzfree.*,movierulz2free.*,movierulzs.*,movierulzwatch.*,movierulzz.*,moviesrulz.*,moviesrulzfree.*,watchmoviesrulz.com##+js(nowoif)
movierulzlink.*,newmovierulz.*##+js(aopr, String.fromCharCode)
4movierulz.*,4movierulz1.*,7movierulzfree.*,movieruls.*,movierulz4k.*,movierulzfree.*,movierulz2free.*,movierulzwatch.*,movierulzs.*##.ad_btn-white
123movierulz.*,4movierulz.*,4movierulz1.*,7movierulzfree.*,7moviesrulz.*,movieruls.*,movierulz4k.*,movierulzfree.*,movierulz2free.*,movierulzs.*,movierulzwatch.*,movierulzz.*,moviesrulz.*,moviesrulzfree.*,watchmovierulz.*,watchmoviesrulz.com##.ad_watch_now
7moviesrulz.com,movierulzfree.*,movierulzs.*##.hd-buttons
123movierulz.*,4movierulz.*,4movierulz1.*,5movierulz2.*,7moviesrulz.*,movieruls.*,movierulz4k.*,moviesrulz.*,moviesrulzfree.*,movierulz2free.*##.btn1
7movierulzfree.*##.display\:none\;\"hd-buttons\"
||hellrider.live^$3p
||suftanzine.com^
! https://github.com/uBlockOrigin/uAssets/issues/24147
6hiidude.gold##+js(acs, document.documentElement, break;case $.)
6hiidude.gold##+js(href-sanitizer, a[href^="https://cdns.6hiidude.gold/file.php?link=http"], ?link)
6hiidude.gold##p > a[href*="/4/"][target="_blank"]

! https://github.com/uBlockOrigin/uAssets/issues/4700
||9xmovies.*/sw.js$script,1p

! https://www.reddit.com/r/uBlockOrigin/comments/aj27ua/redirect_on_couchtuner/
! https://github.com/uBlockOrigin/uAssets/issues/16528
couchtuner.*##+js(acs, RegExp, 0x)
||couchtuner.*/sw.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/10701
dutchycorp.*##+js(acs, eval, replace)
dutchycorp.*##center > .hide-on-med-and-down
dutchycorp.*##[class^="bmadblock"]
dutchycorp.*##div[class][style="width:468px;height:60px;display: inline-block;margin: 0 auto"]
dutchycorp.*##+js(nano-sib, time.html, 1000)
dutchycorp.*##+js(set, blurred, false)
@@||dutchycorp.*^$ghide
dutchycorp.*##ins.adsbygoogle
dutchycorp.*##[class$="-page"] .box-main center center
dutchycorp.*##[class$="-page"] > .hide-on-small-only
dutchycorp.*##[class$="-page"] > .container > .row > .col-md-offset-1 .text-left > *:not(.box-main)
dutchycorp.*##[class$="-page"] center > p
dutchycorp.*##.box-main > .row > center
dutchycorp.*##.box-main > center > div
dutchycorp.*##.nav-ad
dutchycorp.*##.row [style*="width:728px;height:90px"]
dutchycorp.*##.sidenav_left
dutchycorp.*##.sidenav_right
dutchycorp.*##[id*="ScriptRoot"]
dutchycorp.*##[style*="width:300px;height:250px"]
dutchycorp.*###link-view [style^="width:468px"]
dutchycorp.*###boxes
dutchycorp.*###link-view > center > br
*$frame,denyallow=cloudflare.com|facebook.com|google.com|hcaptcha.com|youtube.com|jungleofferwall.com,domain=dutchycorp.*
! https://github.com/uBlockOrigin/uAssets/issues/17166#issuecomment-1477414313
*$script,redirect-rule=noopjs,from=dutchycorp.*,to=~sentry-cdn.com
autofaucet.dutchycorp.space##.show-on-medium
@@||googletagmanager.com/gtag/js$script,domain=autofaucet.dutchycorp.*
@@||cdnjs.cloudflare.com^$script,domain=autofaucet.dutchycorp.*
@@||imasdk.googleapis.com^$script,domain=autofaucet.dutchycorp.*
! https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-8262172
dutchycorp.*##+js(rmnt, script, /adblock.php)

! https://forums.lanik.us/viewtopic.php?p=145148#p145148
sexgalaxy.net##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/4732
||watchserieshd.watch/ajax/banner/$xhr,1p

! https://github.com/NanoMeow/QuickReports/issues/616
mtsproducoes.*##+js(aopw, block_detected)

! https://github.com/uBlockOrigin/uAssets/issues/4742
zooqle.*##+js(aeld, /^(?:mousedown|mouseup)$/, 0x)

! https://forums.lanik.us/viewtopic.php?f=62&t=42524#p145173
16honeys.com##+js(set, ckaduMobilePop, noopFunc)

! https://github.com/NanoMeow/QuickReports/issues/619
socks24.org##+js(aeld, load, onload)
socks24.org##[href^="http://www.linkev.com/"]

! https://github.com/AdguardTeam/AdguardFilters/issues/28893
tugaflix.*##+js(aopr, open)

! https://github.com/uBlockOrigin/uAssets/issues/4750
mongri.net##+js(aopw, adBlockDetected)

! https://github.com/AdguardTeam/AdguardFilters/issues/28936
@@||nonsensediamond.*^$ghide
nonsensediamond.*##+js(aopr, decodeURI)

! https://github.com/NanoMeow/QuickReports/issues/623
planetf1.com##+js(aopr, CatapultTools)

! https://github.com/jspenguin2017/uBlockProtector/issues/1034
easy-coin.*##+js(acs, Math.random, banner)

! https://github.com/uBlockOrigin/uAssets/issues/4760
@@||eestatic.com/*/adsbygoogle.js$script,domain=elespanol.com
elespanol.com##+js(set, tieneAdblock, 0)

! https://github.com/NanoAdblocker/NanoFilters/issues/263
! https://github.com/NanoMeow/QuickReports/issues/1642
masterplayer.xyz##+js(aeld, click, popundr)
onifile.com,topflix.*##+js(nano-sib)
topflix.*##+js(nowoif)
@@||topflix.*^$ghide
topflix.*##+js(aopr, console.clear)

! https://forums.lanik.us/viewtopic.php?p=145288#p145288
||ads.exoclick.com^$script,redirect=noopjs,domain=uflash.tv
@@||uflash.tv^$ghide
uflash.tv#@#.ad
@@||exosrv.com/popunder1000.js$script,domain=uflash.tv
uflash.tv##+js(aopw, ads_priv)
uflash.tv##.advertisement
uflash.tv##[id^="ad-float"]
! https://github.com/uBlockOrigin/uAssets/issues/24103
uflash.tv##+js(nowoif, adblock, 1, obj)
uflash.tv##+js(no-fetch-if, ujsmediatags method:HEAD)

! https://github.com/uBlockOrigin/uAssets/issues/4776
jizzbunker.com,xxxdan.com##+js(aopw, spot)
jizzbunker.com##+js(aopr, XMLHttpRequest)
jizzbunker.com##+js(aopr, Notification)
jizzbunker.com##.banner-popup
jizzbunker.com##.panel-rklcontent-wide
jizzbunker.com##.panel-body

! https://github.com/uBlockOrigin/uAssets/issues/4774
porndex.com##+js(aeld, click)

! https://www.reddit.com/r/uBlockOrigin/comments/am512n/antiadblocker_on_remodelistacom/
remodelista.com##+js(set, adsAreBlocked, false)
remodelista.com##[data-advert]

! https://github.com/uBlockOrigin/uAssets/issues/4792
club-flank.com##+js(aopr, ExoLoader.serve)

! https://github.com/uBlockOrigin/uAssets/issues/4794
idedroidsafelink.*,links-url.*##+js(aeld, load, onload)

! https://github.com/uBlockOrigin/uAssets/issues/4798
hackstore.*##.onp-sl-content:style(display: block !important;)
hackstore.*##.onp-sl-social-locker
! https://github.com/uBlockOrigin/uAssets/issues/4798#issuecomment-464387517
! https://github.com/uBlockOrigin/uAssets/issues/6112
hackstore.me##+js(acs, spr)
##[href^="//look.utndln.com/offer"]
! https://github.com/uBlockOrigin/uAssets/issues/7964
@@*$ghide,domain=drivelinks.me|hackshort.me|pelislinks.me
*$popunder,domain=drivelinks.me|hackshort.me|pelislinks.me
drivelinks.me,hackshort.me,pelislinks.me##+js(acs, document.oncontextmenu)
drivelinks.me,hackshort.me,pelislinks.me##+js(acs, document.onmousedown)
@@*$ghide,domain=freeserverhostingweb.club|me-encantas.com|tanfacil.net|tecnoaldia.net
freeserverhostingweb.club,me-encantas.com,mexicogob.com,noticiascripto.site,tanfacil.net,tecnoaldia.net,todoandroid.live##+js(acs, document.oncontextmenu)
freeserverhostingweb.club,me-encantas.com,mexicogob.com,noticiascripto.site,tanfacil.net,tecnoaldia.net,todoandroid.live##+js(acs, document.onkeydown)
freeserverhostingweb.club,me-encantas.com,mexicogob.com,noticiascripto.site,tanfacil.net,tecnoaldia.net,todoandroid.live##+js(acs, document.onmousedown)
! https://github.com/uBlockOrigin/uAssets/issues/11378
||ads-twitter.com/uwt.js$xhr,3p,redirect-rule=noop.txt
noticiascripto.site##.pb

! https://github.com/uBlockOrigin/uAssets/issues/4799
compucalitv.com##.onp-sl-content:style(display: block !important;)
compucalitv.com##.onp-sl-social-locker
compucalitv.com##+js(aeld, DOMContentLoaded, compupaste)
compucalitv.com##+js(aopr, redirectURL)
compucalitv.com##.botondescarga
*$script,3p,denyallow=chatango.com,domain=compucalitv.com

! https://github.com/uBlockOrigin/uAssets/issues/4807
||gigaleecher.com/templates/plugmod/giga.js$script,1p

! https://github.com/jspenguin2017/uBlockProtector/issues/1035
teknorizen.*##+js(set, safelink.adblock, false)

! https://github.com/uBlockOrigin/uAssets/issues/4818
hdfriday.*##+js(aopr, open)

! https://github.com/uBlockOrigin/uAssets/issues/4834
extramovies.*##+js(aopr, open)
extramovies.*##+js(aopr, AaDetector)
extramovies.*##+js(aopw, u_cfg)
vanfem.com##+js(aopr, __Y)
extramovies.*##center
extramovies.*##[href^="/dlbutton.php"]
extramovies.*##[href^="http://adfpoint.com"]
*$script,3p,denyallow=bootstrapcdn.com|disqus.com|jsdelivr.net|jwpcdn.com|fastly.net|fastlylb.net|jquery.com|hwcdn.net|recaptcha.net|cloudflare.com|cloudflare.net|google.com|googleapis.com|gstatic.com|facebook.net,domain=extramovies.*
extramovies.*###theme_back
! https://github.com/uBlockOrigin/uAssets/issues/11023
||extramovies.*/ads.js$script,1p
! https://github.com/AdguardTeam/AdguardFilters/issues/145210
extramovies.*#@#.ad_btn
extramovies.*##+js(aopw, afStorage)

! https://github.com/uBlockOrigin/uAssets/issues/4835
@@||googletagmanager.com/gtm.js$script,domain=ciudad.com.ar

! https://github.com/uBlockOrigin/uAssets/issues/4836
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=gameswf.com

! https://github.com/uBlockOrigin/uAssets/issues/4837
mangasail.*##+js(set, adblock, 1)

! https://github.com/uBlockOrigin/uAssets/issues/4842
daizurin.com##+js(nostif, nextFunction, 250)

! https://github.com/uBlockOrigin/uAssets/issues/4854
animekb.*##+js(nowebrtc)

! https://github.com/uBlockOrigin/uAssets/issues/4861
@@||webtvhd.com^$ghide
@@||webserver.one^$ghide
webtvhd.com##[id*="ScriptRoot"]
webtvhd.com##ins.adsbygoogle
webserver.one##ins.adsbygoogle
webserver.one##div[id^="imCell_"][class=""]:has-text(/Advertisement/i)
webserver.one##[id*="ScriptRoot"]

! https://github.com/uBlockOrigin/uAssets/issues/4863#issuecomment-462169290
! https://github.com/AdguardTeam/AdguardFilters/issues/49897
coolmathgames.com##+js(nano-sib)
coolmathgames.com##+js(set, cmgpbjs, false)
coolmathgames.com##+js(set, displayAdblockOverlay, false)
coolmathgames.com##+js(set, google, false)
coolmathgames.com###block-adstop-otherpage-728x90
coolmathgames.com##[class*="-ads"]

! https://github.com/NanoMeow/QuickReports/issues/661
||poweredbyliquidfire.mobi^

! news-und-nachrichten.de anti adb
news-und-nachrichten.de##+js(set, adblock, false)
news-und-nachrichten.de##.adverts_billboard
news-und-nachrichten.de##.adverts_top

! https://github.com/uBlockOrigin/uAssets/issues/4875
acapellas4u.co.uk##+js(nostif, bait, 1)

! https://github.com/NanoMeow/QuickReports/issues/663
austin.culturemap.com##+js(aopr, CatapultTools)

! https://github.com/uBlockOrigin/uAssets/issues/4892
! https://github.com/uBlockOrigin/uAssets/issues/5144
t-online.de##^script:has-text(}(window);)
t-online.de##^script:has-text(,window\);)
t-online.de##^script:has-text(toscr\')
email.t-online.de#@#^script:has-text((window);)
email.t-online.de#@#^script:has-text(,window\);)
@@||t-online.de^$ghide
t-online.de##[href^="http://pubads.g.doubleclick.net"]
! https://www.reddit.com/r/uBlockOrigin/comments/m1zwji/
!#if env_mobile
pcgames.de,t-online.de#@#+js(set, CustomEvent, noopFunc)
!#endif
! https://github.com/uBlockOrigin/uAssets/issues/8892
t-online.de##[href^="https://ad1.adfarm1.adition.com"]
t-online.de###Tasfeed1
t-online.de###T-Shopping

! https://github.com/uBlockOrigin/uAssets/issues/4894
! https://github.com/uBlockOrigin/uAssets/issues/5273
kstreaming.*##+js(aopw, Fingerprint2)
kstreaming.*##+js(nowebrtc)

! https://github.com/uBlockOrigin/uAssets/issues/10420
atomohd.*##+js(nowoif, !atomtt)
atomohd.*##+js(acs, setTimeout, admc)
pctfenix.*,pctnew.*##+js(acs, I833)
pctfenix.*,pctnew.*##+js(aopr, AaDetector)
pctfenix.*,pctnew.*##+js(aopr, TID)
atomixhq.*,pctfenix.*,pctnew.*##+js(aopw, adcashMacros)
atomixhq.*,pctfenix.*,pctnew.*##+js(nowoif, !/download\/|link/)
atomixhq.*,pctfenix.*,pctnew.*##.ads
*$script,3p,denyallow=cloudflare.net|fontawesome.com|googleapis.com|hwcdn.net|jquery.com,domain=atomixhq.*|pctfenix.*
atomtt.com##+js(acs, setTimeout, admc)
@@||acorta-enlace.com^$ghide
||pctnew.*/sw.js$script
atomohd.*##.ads
||atomohd.*/*/banners$image
*/script/pattern.js|$script

! https://github.com/uBlockOrigin/uAssets/issues/4903
audiofanzine.com##+js(set, Math.pow, noopFunc)

! https://github.com/NanoMeow/QuickReports/issues/677
hubzter.com##+js(aopr, adsanity_ad_block_vars)

! sport stuff 
/adu.php$frame,3p
allfeeds.*,daddylive.*,sporting77.*,teleriumtv.*##+js(nowoif)
allfeeds.*,teleriumtv.*###overlay

! lewdzone. com popups
lewdzone.com##+js(aopr, decodeURI)
lewdzone.com##+js(nano-sib, circle_animation)
lewdzone.com##+js(nano-stb, CountBack, 990)
@@||lewdzone.com^$ghide
||lewdzone.com/wp-content/themes/lz/assets/affiliate/$image
lewdzone.com##.ad_overlay, .ad, [href^="https://theporndude.com"]
lewdzone.com##.affiliate-block
lewdzone.com##.alzd
lewdzone.com##.Leaderboard
lewdzone.com##.item.widget_text
lewdzone.com##.site-margin > .container-block div:has(> .item.widget_text)
lewdzone.com###ad_vid

! https://github.com/uBlockOrigin/uAssets/issues/4927
problogbooster.com##+js(aopw, hidekeep)

! https://github.com/uBlockOrigin/uAssets/issues/4926
ispunlock.*,tpb.*##+js(aopr, pace)
||d3t9nyds4ufoqz.cloudfront.net^

! https://github.com/NanoMeow/QuickReports/issues/686
robloxscripts.com##+js(nostif, ai_adb)

! https://github.com/uBlockOrigin/uAssets/issues/4943
! https://github.com/NanoMeow/QuickReports/issues/1967
megafile.io##+js(nosiif, (), 5000)
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=megafile.io

||padsims.com^

! https://www.reddit.com/r/uBlockOrigin/comments/asidoc/antiantiadblocker_not_working_on_geoguessr/
@@||geoguessr.com/_ads/*$script,1p
@@||geoguessr.com^$xhr,1p

! https://www.reddit.com/r/uBlockOrigin/comments/asmddi/i_have_no_clue_how_this_ad_works/
skpb.live##+js(acs, atob, decodeURIComponent)

! https://github.com/uBlockOrigin/uAssets/issues/4956
link-to.net##+js(aeld, load, nextFunction)
link-to.net##+js(nano-sib)
@@||link-to.net^$ghide
||link-to.net^$image,redirect-rule=1x1.gif,1p
link-to.net##.ad-block-1

! https://github.com/uBlockOrigin/uAssets/issues/4962
123movies.*##+js(aopr, open)
||d13jhr4vol1304.cloudfront.net^
||oppfiles.com/common/scriptjs.php
/jquery.watch.js|$script,1p,important,domain=~dekrantvantoen.nl

! https://forums.lanik.us/viewtopic.php?p=145787#p145787
! https://github.com/uBlockOrigin/uAssets/issues/7644
@@||static.sunmedia.tv^$script,xhr,domain=ivoox.com
@@||services.sunmedia.tv/geotarget/geocity.php$xhr,domain=ivoox.com
@@||ivoox.com^$ghide
ivoox.com###adLayout
||static.addevweb.com/integrations$script,3p

! https://github.com/uBlockOrigin/uAssets/issues/4965
*$script,3p,domain=7starhd.*,denyallow=googleapis.com
7starhd.*##+js(nowoif)
||r-q-e.com^$3p

! https://github.com/abp-filters/abp-filters-anti-cv/issues/58
! https://github.com/abp-filters/abp-filters-anti-cv/issues/59
! https://github.com/abp-filters/abp-filters-anti-cv/issues/60
autojournal.fr,autoplus.fr,sportauto.fr##+js(nostif, (), 1)

! https://github.com/NanoAdblocker/NanoFilters/issues/274
! https://github.com/NanoAdblocker/NanoFilters/issues/314
uploadev.*##+js(nowoif)
uploadev.*##+js(set, openInNewTab, noopFunc)

! https://forums.lanik.us/viewtopic.php?p=145808#p145808
volksstimme.de##+js(aopr, TRM)

! https://github.com/uBlockOrigin/uAssets/issues/4972
! https://github.com/AdguardTeam/AdguardFilters/issues/59901
! https://github.com/AdguardTeam/AdguardFilters/issues/79755
@@||shortearn.*^$ghide
shortearn.*##.banner
shortearn.*##+js(aopr, AaDetector)
shortearn.*##+js(aopr, open)
shortearn.*##+js(set, blurred, false)
shortearn.*##.box-main > .blog-item
beta.shortearn.eu##+js(acs, fetch, detectAdblockWithInvalidURL)
beta.shortearn.eu##^script:has-text(detectAdblockWithInvalidURL)
*$frame,denyallow=google.com,domain=shortearn.in
*$script,3p,denyallow=cloudflare.com|google.com|gstatic.com|recaptcha.net,domain=shortearn.*

! https://github.com/uBlockOrigin/uAssets/issues/4978
4shared.com##+js(nosiif, .append, 1000)
||4shared.com/empty.js$script,1p,important
||4shared.com/sw.js$script,important

! https://github.com/uBlockOrigin/uAssets/issues/4980
pingit.*,~pingit.com,~pingit.me,pngit.live##+js(aopr, AaDetector)
pingit.*,~pingit.com,~pingit.me,pngit.live##+js(aopr, open)
pingit.*,~pingit.com,~pingit.me,pngit.live##+js(aopr, rmVideoPlay)
pingit.*,~pingit.com,~pingit.me,pngit.live##+js(aopr, _pop)
pingit.*,~pingit.com,~pingit.me,pngit.live##+js(aopw, Fingerprint2)
pingit.*,~pingit.com,~pingit.me,pngit.live##+js(set, blurred, false)
||pingit.*/sw.js$script,1p,domain=~pingit.com|~pingit.me
*$frame,3p,domain=pingit.im|pngit.live
*$script,3p,denyallow=cdn77.org|google.com|gstatic.com|pingit.im|recaptcha.net|smartsuppcdn.com|smartsuppchat.com,domain=pingit.*|pngit.live|~pingit.com|~pingit.me
noticiasesports.live,noweconomy.live##+js(nano-sib, , 1200, 0)
noticiasesports.live,noweconomy.live##+js(nowoif)
noticiasesports.live,noweconomy.live###overlay
noweconomy.live##+js(set, adblockDetector, noopFunc)
noweconomy.live##+js(ra, disabled, button[id="invisibleCaptchaShortlink"])

! https://github.com/uBlockOrigin/uAssets/issues/4983
pelisplay.*##+js(aopw, smrtSB)
pelisplay.*##+js(aopw, smrtSP)
pelisplay.*##+js(acs, document.write, advnetwork)
pelisplay.*##+js(disable-newtab-links)
pelisplay.*#@#[href*="/afu.php"]
pelisplay.*##[data-lang="Publicidad"]

! https://forums.lanik.us/viewtopic.php?p=145842#p145842
@@||chichester.co.uk^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/4988
hdfull.*##+js(acs, document.createElement, /l\.parentNode\.insertBefore\(s/)
hdfull.*##+js(aeld, mousedown, !!{});)
hdfull.*##+js(nano-stb)
! https://github.com/uBlockOrigin/uAssets/issues/4988#issuecomment-480530699
gamovideo.com##+js(acs, onload)
gamovideo.com##+js(aopr, open)
gamovideo.com##+js(acs, document.createElement, onerror)
gamovideo.com###po-pimp
||gamovideo.com^$frame,1p

! https://github.com/uBlockOrigin/uAssets/issues/4990
hitokin.net##+js(set, loadingAds, true)

||swarm.video/telerium_dev.js

! developerinsider.co anti adb
developerinsider.co##+js(set, runAdBlocker, false)

! https://github.com/uBlockOrigin/uAssets/issues/5001
phonenumber-lookup.info##+js(aopr, pa)

! loadTool
abellalist.com,didilist.com,erotichdworld.com,sharkyporn.com##+js(acs, loadTool, popping)

! nextorrent . site popups
nextorrent.*##+js(acs, jQuery, popunder)
nextorrent.*##+js(ra, onclick)

! https://github.com/NanoMeow/QuickReports/issues/718
closeronline.co.uk##+js(aopr, _sp_._networkListenerData)

! https://github.com/NanoMeow/QuickReports/issues/721
calculate.plus##+js(nostif, checkStopBlock)

! https://github.com/uBlockOrigin/uAssets/issues/5019
turkdown.com##+js(aopr, AaDetector)
link.turkdown.com##+js(set, blurred, false)
@@||turkdown.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/726
@@||hilly.io/adBlockDetector.js$script,1p
@@||hilly.io^$ghide
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=hilly.io

! https://github.com/NanoMeow/QuickReports/issues/722
ilprimatonazionale.it#@#.td-ad-background-link
ilprimatonazionale.it##+js(set, td_ad_background_click_link, undefined)
ilprimatonazionale.it##body:style(background-image: none !important;)

! https://github.com/NanoMeow/QuickReports/issues/733
urlgalleries.net##+js(aopr, AaDetector)
urlgalleries.net##+js(acs, document.cookie, setOCookie)

! https://github.com/uBlockOrigin/uAssets/issues/5032
moonquill.com##+js(aopw, document.getElementsByClassName)

! https://github.com/uBlockOrigin/uAssets/issues/5044
googlvideo.com##+js(aopr, mm)
googlvideo.com##+js(nowoif)

! https://github.com/NanoMeow/QuickReports/issues/170
@@||finobe.com^$ghide
@@||googlesyndication.com/pagead/js/adsbygoogle.js$script,domain=finobe.com
*$script,redirect-rule=noopjs,domain=finobe.com

! https://github.com/uBlockOrigin/uAssets/issues/5047
@@||convallariaslibrary.com^$ghide
convallariaslibrary.com##.code-block
convallariaslibrary.com##.widget_custom_html ins:upward(.widget_custom_html)

! https://github.com/uBlockOrigin/uAssets/issues/6773
! https://github.com/uBlockOrigin/uAssets/issues/5052#issuecomment-1407771485
frag-mutti.de##.intext-ad
frag-mutti.de##.ad-loading:remove()
frag-mutti.de###campaign-popup
frag-mutti.de###fm-shadow

! https://github.com/NanoMeow/QuickReports/issues/751
! https://github.com/uBlockOrigin/uAssets/issues/18626
thehindu.com##+js(set, Adblock, false)
thehindu.com###gsi_overlay

! https://github.com/uBlockOrigin/uBlock-issues/issues/416#issuecomment-467794333
maniac.de##+js(aopr, td_ad_background_click_link)
maniac.de##[href^="https://www.maniac.de/linkout/"]

! https://github.com/uBlockOrigin/uAssets/issues/6825
! https://github.com/uBlockOrigin/uAssets/issues/11096
cambro.tv##+js(acs, document.addEventListener, initBCPopunder)
cambro.tv##+js(acs, crakPopInParams)
cambro.tv##+js(aopr, onload)
cambro.tv##.box.rltdsldr
cambro.tv##.bttsptt.box
cambro.tv##[href^="https://go.strpjmp.com"]
||cambro.tv/contents/*/player/*$media,1p
||cambro.tv/player/html.php$frame,1p
*$popunder,domain=cambro.tv
||liveflirt.net^$frame,domain=cambro.tv
cambro.tv###kt_player > [href^="https://www.cambro.tv/"]
cambro.tv##.crak_cams_ctn
cambro.tv##.fp-brand
cambro.tv##[href^="https://t.grtya.com/"]
||widgets.skyprivate.com/promo/$frame
cambro.tv##+js(set, flashvars.logo_url, '')
cambro.tv##+js(set, flashvars.logo_text, '')

! https://github.com/uBlockOrigin/uAssets/issues/5061
! https://github.com/uBlockOrigin/uAssets/issues/7043
nibelungen-kurier.de##+js(set, nlf.custom.userCapabilities, false)

! https://github.com/AdguardTeam/AdguardFilters/issues/61829
coolsoft.altervista.org##+js(nostif, _0x)
coolsoft.altervista.org###block-block-30
coolsoft.altervista.org###content-right-floatbox

! https://github.com/NanoMeow/QuickReports/issues/755
@@||hanimesubth.com/assets/js/ads.core.js$script,1p
hanimesubth.com##+js(aeld, load, nextFunction)
hanimesubth.com##[href="https://slotgame66.co/"]
*.gif$domain=hanimesubth.com,image
*.webp$domain=hanimesubth.com,image,3p

! https://github.com/uBlockOrigin/uAssets/issues/20727
watchkobestreams.info##+js(aost, atob, inlineScript)
*$script,3p,domain=fromwatch.com,denyallow=cloudflare.com|googleapis.com

! https://github.com/NanoMeow/QuickReports/issues/781
tcheats.com##+js(aopr, checkAds)

! https://github.com/NanoMeow/QuickReports/issues/735
gamekult.com##+js(aopr, SmartWallSDK)

! https://github.com/uBlockOrigin/uAssets/issues/5093
gsmturkey.net##+js(aeld, load, nextFunction)
*$script,3p,domain=gsmturkey.net,redirect-rule=noopjs

! https://github.com/easylist/easylist/issues/2929
@@||cdnjs.cloudflare.com/ajax/libs/*$script,domain=warda.at

! https://github.com/uBlockOrigin/uAssets/issues/5101
dz4up1.com##+js(acs, document.getElementById, adblockinfo)

! https://github.com/uBlockOrigin/uAssets/issues/5102
readmng.com#@#.scroll_target_top

! https://github.com/uBlockOrigin/uAssets/issues/5105
ciudadgamer.com##+js(acs, atob, encodeURIComponent)

! https://github.com/uBlockOrigin/uAssets/pull/8730
ovagames.com##+js(acs, JSON, _0x)
ovagames.com###adter:upward(3)
ovagames.com##.single-entry-titles:has-text(Sponsor)
@@||ovagames.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/797
! https://github.com/NanoMeow/QuickReports/issues/830
mmacore.tv##+js(acs, $, importFAB)
@@||mmacore.tv^$ghide

! https://github.com/abp-filters/abp-filters-anti-cv/issues/102
laprovence.com,viedemerde.fr##+js(acs, document.createElement, __esModule)

! https://github.com/uBlockOrigin/uAssets/issues/5120
@@||svonm.com/hd-main.js$script,domain=kicker.de|kino.de|videos.giga.de|video.spieletipps.de
!#if env_chromium
@@||svonm.com/hd-main.js$script,domain=kicker.de|kino.de|videos.giga.de|video.spieletipps.de,badfilter
!#endif
!#if env_firefox
@@||svonm.com/hd-main.js$script,domain=kicker.de|kino.de|videos.giga.de|video.spieletipps.de,badfilter
!#endif
!#if env_edge
@@||svonm.com/hd-main.js$script,domain=kicker.de|kino.de|videos.giga.de|video.spieletipps.de,badfilter
!#endif
!#if env_safari
@@||svonm.com/hd-main.js$script,domain=kicker.de|kino.de|videos.giga.de|video.spieletipps.de,badfilter
!#endif
!#if env_mobile
@@||svonm.com/hd-main.js$script,domain=kicker.de|kino.de|videos.giga.de|video.spieletipps.de,badfilter
!#endif

! https://github.com/uBlockOrigin/uAssets/issues/7192
symbolab.com##.googleLeftSkyScrapper

! https://github.com/NanoMeow/QuickReports/issues/811
@@||googlesyndication.com/pagead/js/adsbygoogle.js$script,domain=safelinkunited.blogspot.com
@@||pagead2.googlesyndication.com/pagead/$script,domain=safelinkunited.blogspot.com
safelinkunited.blogspot.com##.ADS
safelinkunited.blogspot.com##ins.adsbygoogle

! https://github.com/NanoMeow/QuickReports/issues/812
||ipla.pluscdn.pl/p/*$media,redirect=noopmp4-1s,domain=polsatsport.pl
@@||redefineadpl.hit.gemius.pl^$xhr,domain=polsatsport.pl

! https://github.com/uBlockOrigin/uAssets/issues/5291
! https://github.com/AdguardTeam/AdguardFilters/issues/34440
@@||gemius.pl^$script,xhr,domain=polsatnews.pl
@@||hit.stat24.com/$xhr,domain=polsatnews.pl
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect-rule=google-ima.js,domain=polsatnews.pl

! https://github.com/uBlockOrigin/uAssets/issues/8642
! https://github.com/uBlockOrigin/uAssets/issues/8287
lookmovie.*##+js(aopr, adBlockDetected)
@@||lookmovie.*^$ghide
||metrika.lookmovie.io^$important
lookmovie.*##.view-top-ab
lookmovie.*##.notifyjs-corner
lookmovie.*##.nord-vpn.home-banner
lookmovie.*###single.dtsingle > .content > center > a[href] > img
lookmovie.*###single.dtsingle > .content > .sheader > .poster > .extra > center > a[href] > img
lookmovie.*##+js(aopr, mm)
lookmovie.ag.w3snoop.com##.ezoic-ad

! https://github.com/NanoMeow/QuickReports/issues/822
streamhentaimovies.com##+js(nostif, pum-open)

! https://github.com/uBlockOrigin/uAssets/issues/4918#issuecomment-473450129
! https://github.com/uBlockOrigin/uAssets/issues/6423
||p-cdn.us/public/*$media,redirect=noopmp3-0.1s,domain=soundcloud.com
||sndcdn.com/audio/*$media,redirect=noopmp3-0.1s,domain=soundcloud.com
||soundcloud.com/audio-ad$1p,xhr
||soundcloud.com/promoted$1p,xhr
soundcloud.com##.soundList__item:has(.sc-promoted-icon-medium)

! https://github.com/uBlockOrigin/uAssets/issues/5141
@@||virginmediatelevision.ie/player/$xhr,1p
@@||virginmediatelevision.ie/includes/js/cookienotice.js.pagespeed.$script,1p

! as suggested https://github.com/uBlockOrigin/uAssets/issues/5153
! https://github.com/uBlockOrigin/uAssets/issues/5157
*expires$media,redirect=noopmp3-0.1s,domain=kabeleins.de
*expires$media,redirect=noopmp3-0.1s,domain=kabeleinsdoku.de
*expires$media,redirect=noopmp3-0.1s,domain=sat1gold.de
*expires$media,redirect=noopmp3-0.1s,domain=sixx.de
||zomap.de/*&expires=$script,domain=kabeleins.de|kabeleinsdoku.de|sat1gold.de|sixx.de
vox.de##+js(no-xhr-if, svonm)

! https://github.com/NanoMeow/QuickReports/issues/834
bharian.com.my##+js(aopr, SmartWallSDK)

! amyscans.com popups
amyscans.com##+js(aost, String.prototype.charCodeAt, ai_)
amyscans.com##+js(ra, href, #clickfakeplayer)

! https://github.com/NanoMeow/QuickReports/issues/850
laradiobbs.net##+js(set, adblock, false)

! https://github.com/uBlockOrigin/uAssets/issues/5186
!#if env_firefox
||fwmrm.net/ad/*$script,redirect=noopjs,domain=nationalgeographic.com
!#endif
! https://www.reddit.com/r/uBlockOrigin/comments/ygkeqa/
nationalgeographic.fr##+js(no-xhr-if, /\/VisitorAPI\.js|\/AppMeasurement\.js/)
nationalgeographic.*##.ng-ad-banner
nationalgeographic.*##.ngart__footer-ad

! https://forums.lanik.us/viewtopic.php?p=146528#p146528
mstream.*##+js(aopr, open)
ver-pelis-online.*##+js(set, decodeURIComponent, trueFunc)
ver-pelis-online.*##a.lav_btn
ver-pelis-online.*##[href$="player.html"]
ver-pelis-online.*##.holder >li:has([href="/pelis/descargar.html"])
ver-pelis-online.*##a.eli_lav_btn, .mobile_btn

! https://github.com/NanoMeow/QuickReports/issues/855
konten.co.id##+js(nostif, overlay, 2000)

! https://github.com/NanoMeow/QuickReports/issues/856
@@||farsondigitalwatercams.com^$ghide
farsondigitalwatercams.com##.advert

! thefmovies . me popups
! https://github.com/uBlockOrigin/uAssets/issues/5926
thefmovies.*##+js(aost, Math, inlineScript)
thefmovies.*##+js(nostif, '0x)
thefmovies.*##+js(nowoif)
thefmovies.*##.mobile-btn

! https://github.com/uBlockOrigin/uAssets/issues/5198
sembunyi.in##+js(aopr, popjs)

! https://adblockplus.org/forum/viewtopic.php?f=10&t=65201&p=187268#p187268
! https://www.reddit.com/r/uBlockOrigin/comments/tzla0l/ad_showing_up_on_series9_dot_me/
series9.*##div[style="padding:15px 0;text-align:right;"]

! https://github.com/uBlockOrigin/uAssets/issues/15548
! https://github.com/uBlockOrigin/uAssets/issues/22127
@@||diariodenavarra.es^$ghide
diariodenavarra.es##+js(aeld, DOMContentLoaded, /adblock/i)
diariodenavarra.es##+js(nostif, /adblock/i)
diariodenavarra.es###AdSlot_megabanner
diariodenavarra.es##.sticky_roba

! https://github.com/uBlockOrigin/uAssets/pull/9494
urlty.com##+js(set, blurred, false)
urlty.com##+js(aopr, open)

! https://github.com/uBlockOrigin/uAssets/issues/5222
keepvid.*##+js(nowoif)

! https://github.com/NanoMeow/QuickReports/issues/880
||player.ooyala.com/static/*/ad-plugin/*$script,redirect=noopjs,domain=dragons.com.au

! https://github.com/uBlockOrigin/uAssets/issues/5225
xiaomifans.pl##+js(nostif, test, 100)

! https://github.com/uBlockOrigin/uAssets/issues/5226
@@||rangdhanu.live^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5228
streamporn.pw##+js(aopr, ExoLoader.serve)
streamporn.pw##+js(nowoif)
streamporn.pw##.btn-lg.btn-block.btn
streamporn.pw###overlays

! https://github.com/uBlockOrigin/uAssets/issues/5190
@@||cdn.taboola.com/libtrc/$script,domain=ndtv.com
@@||trc.taboola.com/ndtv$script,domain=ndtv.com
@@||trc.taboola.com/ndtv-ndtvmobile/$frame,domain=ndtv.com
@@||trc.taboola.com/ndtv*/log/*$domain=trc.taboola.com
ndtv.com##.trc-content-sponsored
ndtv.com##.composite-branding.branding:has-text(/sponsored/i):xpath(..)
@@||cdn.ampproject.org/*amp-ad$script,domain=ndtv.com
@@||cdn.taboola.com/libtrc/ndtv-ndtvmobile/loader.js$script,domain=ampproject.net
@@||cdn.taboola.com/libtrc/impl.$script,domain=ampproject.net
@@||trc.taboola.com/ndtv-ndtvmobile/$script,domain=ampproject.net
ndtv.com#@#amp-embed[type="taboola"]
ndtv.com##[id^="adslot"]
ndtv.com##:xpath(//div[contains(text(),"Advert")])
ampproject.net##.trc-content-sponsored
food.ndtv.com##.ads
food.ndtv.com###jeocontainer > span:has-text(Promoted)
||hotdeals360.com^$3p
ndtv.com#@##taboola-below-article-thumbnails
ndtv.com##.tbl-feed-card:has(.trc-content-sponsored)
@@||trc.taboola.com/ndtv*/trc/*/json$xhr,domain=ndtv.com
ndtv.com##.inline.ads
ndtv.com##.tbl-wrp:has(.i-amphtml-fill-content)

/pup.php?$script

! https://www.reddit.com/r/uBlockOrigin/comments/b67qlj/ustreamyxcom_popups_block/
ustream.*##+js(nowoif)
ustream.*##^script:has-text(btoa)
ustream.*##+js(aopr, console.clear)
/zone?pub
ustream.to##.popup
ustream.to##.overlay
@@||ustream.*^$script,1p
*$script,redirect-rule=noopjs,domain=ustream.to

! https://github.com/uBlockOrigin/uAssets/issues/5237
! canalesportivo. live
fr.streamon-sport.ru,hoca4u.com##+js(acs, document.createElement, onerror)

! https://github.com/uBlockOrigin/uAssets/issues/5242
sound-park.*,soundpark.*,soundpark-club.*##+js(acs, $, open)
sound-park.*,soundpark.*,soundpark-club.*##+js(acs, document.createElement, script)

! paladinsdecks.com anti adb
||paladinsdecks.com/fileadmin/*/fab.min.js$script,1p,redirect=fuckadblock.js-3.2.0
@@||paladinsdecks.com/ad/banner/*$xhr,1p

! https://github.com/NanoMeow/QuickReports/issues/891
! https://github.com/NanoMeow/QuickReports/issues/1458#issuecomment-508324990
! https://github.com/uBlockOrigin/uAssets/issues/6001
@@||ratemyprofessors.com/assets/libs/oas.js$script,1p
ratemyprofessors.com##.slide.sticky-wrapper

! https://github.com/NanoMeow/QuickReports/issues/894
go.bucketforms.com##+js(acs, $, adblocker)

! https://github.com/uBlockOrigin/uAssets/issues/5248
hopto.org##+js(acs, document.getElementById, undefined)
@@||grahaflasher.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/897
bidouillesikea.com##+js(aopr, adbackDebug)

! https://github.com/NanoMeow/QuickReports/issues/898
@@||dausel.co^$ghide
@@||googlesyndication.com/pagead/$script,domain=dausel.co
dausel.co##.adsbygoogle:style(max-height: 1px !important;)
dausel.co##[id^="aswift"]

! https://github.com/uBlockOrigin/uAssets/issues/5250
blizzboygames.net##+js(nowebrtc)
blizzboygames.net##[href*="bit.ly"]
blizzboygames.net##.gp-entry-text > div > div[style] > .vc_row.wpb_row.vc_row-fluid
||blizzboygames.net/sw.js$script,1p
##[href^="https://track.wg-aff.com/click"]

! https://github.com/NanoMeow/QuickReports/issues/900
optifine.net##+js(nostif, Math.round, 1000)
! http://adfoc.us/serve/?id=47525085215776 timer
adfoc.us##+js(set, count, 0)

! https://github.com/NanoMeow/QuickReports/issues/905
pianetamountainbike.it##+js(set, LoadThisScript, true)
||pianetamountainbike.it/*Banner$image

! https://github.com/NanoMeow/QuickReports/issues/906
lavoixdux.com##+js(set, is_adblocked, false)

! https://github.com/NanoMeow/QuickReports/issues/2784
barchart.com##+js(set, showPremLite, true)
barchart.com##[id^=customAd]

! closeBlockerModal anti adb
modelisme.com,parasportontario.ca,prescottenews.com##+js(set, closeBlockerModal, false)

! https://github.com/uBlockOrigin/uAssets/issues/5269
juegoviejo.com##+js(nano-stb)

! https://github.com/uBlockOrigin/uAssets/issues/5271
anime-jl.net##+js(aopr, detector_launch)
zona-leros.net##+js(aeld, DOMContentLoaded, shortener)
zona-leros.net##.content_store
player.zona-leros.net,zlplayer.net###dvr-vid
zona-leros.net##.Body > .Container > ul.Rows > li:first-child:has(> article > a[href][target="_blank"])
zpaste.net,zlpaste.net##+js(aeld, DOMContentLoaded, adlinkfly)
zplayer.live##+js(aopr, I833)
zplayer.live##+js(nowoif)
zplayer.live##.user
zpaste.net,pixeldrain.com###sponsors
zplayer.live##.banner
||zshorte.net/*.html$frame,3p
*$script,3p,denyallow=cloudflare.com|cloudflare.net|fastly.net|fastlylb.net|google.com|googleapis.com|gstatic.com|hwcdn.net|jquery.com|jsdelivr.net|jwplatform.com|jwpcdn.com|recaptcha.net|arc.io,domain=zpaste.net|zplayer.live
@@||zplayer.live^$cname
||anime-jl.net^$3p,script
||i.imgur.com/YmmGPK1.png^$3p

! https://forums.lanik.us/viewtopic.php?f=62&t=42841
luzernerzeitung.ch,tagblatt.ch##+js(nostif, adblock, 5)

! anti adb superhumanradio .net
@@||superhumanradio.net^$ghide

! https://github.com/abp-filters/abp-filters-anti-cv/issues/138
! egydead .com => .live
@@||egydead.*^$ghide
egydead.*##.adHolder
egydead.*##.FooterAds
||herdethi.net^

! mangamanga. ml popups
mangamanga.*##+js(aeld, keydown)

! fuckdy .com popups
fuckdy.com##+js(aopr, Popunder)
fuckdy.com##.fkd-inban

! spellchecker.net ad-reinsertion
spellchecker.net##+js(aopr, gPartners)
spellcheck.net,spellchecker.net,spellweb.com##+js(nostif, bioEp)

! https://github.com/NanoAdblocker/NanoFilters/issues/297
! https://github.com/NanoMeow/QuickReports/issues/912
@@||express.de^$ghide
@@||mopo.de^$ghide
express.de,mopo.de##.dm_ad
express.de,mopo.de##.dm_ad-container
express.de,mopo.de###nativendo-marginal
mopo.de##.dm_ta300x300_html

! https://github.com/uBlockOrigin/uAssets/issues/5278
@@||berryboot.alexgoldcheidt.com^$ghide

! ableitungsrechner.net ad-reinsertion
ableitungsrechner.net##+js(nostif, ag_adBlockerDetected)
ableitungsrechner.net##a.extern[href^="//www.amazon.de/"]:upward(2)

! https://github.com/NanoMeow/QuickReports/issues/916
@@||gatevidyalay.com^$ghide
gatevidyalay.com##ins.adsbygoogle

! https://github.com/uBlockOrigin/uAssets/issues/9273
urlaubspartner.net##+js(set, adblock, false)
urlaubspartner.net##.ad
urlaubspartner.net##.text-center.col-lg-4.visible-lg-block > span

! https://github.com/uBlockOrigin/uAssets/issues/5292
bostonherald.com##+js(nostif, n.trigger, 1)
bostonherald.com##+js(set, CnnXt.Event.fire, noopFunc)

! https://github.com/NanoMeow/QuickReports/issues/1132
alternet.org##+js(nostif, null)

! https://github.com/uBlockOrigin/uAssets/issues/5293
mz-web.de##+js(acs, document.createElement, document.head.appendChild)

! https://github.com/uBlockOrigin/uAssets/issues/5296
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=freeiptv.life

! praxis-jugendarbeit.de anti adb
praxis-jugendarbeit.de##+js(nostif, nextFunction, 2000)

! https://github.com/AdguardTeam/AdguardFilters/issues/82870
m.kuku.lu##+js(acs, setTimeout, bait.css)
@@||m.kuku.lu^$ghide
m.kuku.lu##ins.adsbygoogle

! https://github.com/uBlockOrigin/uAssets/issues/5297
watchfreexxx.net##+js(acs, document.createElement, 'script')
watchfreexxx.net##+js(aopr, Date.prototype.toGMTString)
watchfreexxx.net##+js(aopr, ExoLoader)
watchfreexxx.net##+js(aopr, ExoLoader.serve)
watchfreexxx.net##+js(aopr, initPu)
watchfreexxx.net##+js(aopr, jsUnda)
watchfreexxx.net##+js(aeld, getexoloader)
watchfreexxx.net##.order-1:has(.video-block-happy-absolute)
watchfreexxx.net##.happy-player-beside, .happy-section, .widget_execphp:has-text(/Advertisement|ExoLoader/)
watchfreexxx.net###tracking-url
||watchfreexxx.net/*.php$script,1p
*$script,3p,denyallow=cloudflare.net|fastly.net|google.com|googleapis.com|gstatic.com|jwpcdn.com|jsdelivr.net|eastream.net|youtube.com|ytimg.com,domain=vidfast.co
okstream.*##[id^="click"]
*$script,3p,denyallow=bootstrapcdn.com|cloudflare.net|google.com|gstatic.com|hwcdn.net|jquery.com|jsdelivr.net|tawk.to,domain=okstream.*

! https://github.com/NanoMeow/QuickReports/issues/931
macrotrends.net##+js(acs, RegExp, '0x)
macrotrends.net##+js(aopw, ABD)
macrotrends.net##.adx_top_ad

! https://github.com/NanoMeow/QuickReports/issues/934
! https://github.com/uBlockOrigin/uAssets/issues/6224
nrj-play.fr##+js(set, adBlockDetector.isEnabled, falseFunc)

! https://github.com/NanoMeow/QuickReports/issues/935
thegatewaypundit.com##+js(aopr, adtoniq)

! https://github.com/NanoMeow/QuickReports/issues/1225
@@||muzlan.top^$ghide
@@||muzlan.top^$xhr,image,1p

! https://github.com/uBlockOrigin/uAssets/issues/5308
oeffentlicher-dienst.info##+js(set, testerli, false)

! https://github.com/uBlockOrigin/uAssets/issues/5310
lippycorn.com##+js(acs, document.createElement, __esModule)
@@||catracalivre.com.br^$ghide

! https://github.com/jspenguin2017/uBlockProtector/issues/1051
pendekarsubs.us##+js(nostif, nextFunction, 250)

! https://github.com/uBlockOrigin/uAssets/issues/8336
@@||telepisodes.org^$ghide
telepisodes.org##+js(nowebrtc)
telepisodes.org##+js(nano-sib)
*$script,3p,denyallow=cdn77.org|cloudflare.com|cloudflare.net|disqus.com|disquscdn.com|facebook.com|facebook.net|fastly.net|fastlylb.net|fbcdn.net|fluidplayer.com|hcaptcha.com|hwcdn.net|jwpcdn.com|wp.com|google.com|googleapis.com|gstatic.com|instagram.com|jquery.com|jsdelivr.net|jwpsrv.com|sharethis.com|stackpathcdn.com|recaptcha.net|twitter.com|x.com,domain=telepisodes.org
telepisodes.org###play_button:style(display:block!important;)
telepisodes.org###loading_button
telepisodes.org##a.button-link.mybutton:has-text(Play)
||d3d52lhoy0sh2w.cloudfront.net^

! https://github.com/uBlockOrigin/uAssets/issues/5315
7r6.com##+js(aopr, app_vars.force_disable_adblock)
7r6.com##+js(aopr, LieDetector)
7r6.com##+js(aopr, console.clear)
7r6.com##+js(set, blurred, false)
7r6.com##.banner
@@||7r6.com^$ghide
*$script,3p,denyallow=cloudfront.net|google.com|gstatic.com|recaptcha.net,domain=7r6.com

! https://github.com/uBlockOrigin/uAssets/issues/5305#issuecomment-480661667
b3infoarena.in##+js(aeld, load, 2000)

! https://www.reddit.com/r/uBlockOrigin/comments/n6xsjo/ablock_detected/
faucethero.com##+js(aopr, adBlockDetected)
faucethero.com##+js(nowoif)
faucethero.com##+js(acs, atob, decodeURIComponent)
faucethero.com##+js(aopr, decodeURI)
faucethero.com###middle-adspace
faucethero.com##[href^="https://freebitco.in/"]
faucethero.com##[href^="https://qik.cc/"]
faucethero.com##[href^="https://www.office.jocial.com/Affiliate/"]
||aruble.net^$3p
||qik.cc^$3p

! https://github.com/uBlockOrigin/uAssets/issues/5338
! https://github.com/easylist/easylist/pull/10399
@@||upvid.*^$ghide
upvid.*##+js(nowoif)
||upvid.*/sw.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/5340
upload.ac##.ads

! https://github.com/uBlockOrigin/uAssets/issues/5341
@@||capital.fr^$ghide
capital.fr##.cap-ads
! https://github.com/uBlockOrigin/uAssets/issues/9524#issuecomment-1404848268
capital.fr##.pmd-ads

! https://github.com/NanoMeow/QuickReports/issues/990
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=kharisma-adzana.blogspot.com

! https://forums.lanik.us/viewtopic.php?f=62&t=42881
@@||sunderlandecho.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5346
@@||googlesyndication.com/pagead/$script,domain=ebb.io

! https://github.com/uBlockOrigin/uAssets/issues/5347
720pxmovies.blogspot.com##+js(acs, Math, break)
720pxmovies.blogspot.com##+js(aopr, myFunction_ads)
720pxmovies.blogspot.com##+js(nowoif)

! https://github.com/NanoMeow/QuickReports/issues/994
hackingwithreact.com##+js(set, areAdsDisplayed, true)

! https://github.com/uBlockOrigin/uAssets/issues/5349
@@||gamesfree.ca^$ghide

! https://github.com/NanoMeow/QuickReports/issues/1004
onle.co##+js(nano-sib)
@@||onle.co^$ghide
@@||googlesyndication.com/pagead/$script,domain=onle.co
onle.co##[id^="aswift"]
onle.co##.adsbygoogle:style(max-height: 1px !important;)

! gutekueche.at anti adb
gutekueche.at##+js(set, gkAdsWerbung, true)

! https://github.com/uBlockOrigin/uAssets/issues/5355
software-on.com##+js(aopr, decodeURIComponent)
software-on.com##+js(nowebrtc)
software-on.com##+js(nowoif)
@@||software-on.com^$ghide
@@||software-on.com/*/advertising.js$script,1p
software-on.com##ins.adsbygoogle
software-on.com##.widget_oxnepzimd
software-on.com##.oxnepzimd

! https://github.com/uBlockOrigin/uAssets/issues/5305#issuecomment-483097491
gamershit.altervista.org##+js(nobab)
gamershit.altervista.org##[src="float.htm"]

! https://github.com/NanoAdblocker/NanoFilters/issues/308
@@||elbotola.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/1020
@@||berliner-kurier.de^$ghide
@@||berliner-zeitung.de^$ghide
berliner-kurier.de,berliner-zeitung.de##.dm_ad-container
berliner-kurier.de##div[class^="traffective_"]
berliner-kurier.de##div[class^="outbrain_outbrain-outer-container"]

! https://github.com/NanoMeow/QuickReports/issues/1021
eplfootballmatch.com##+js(set, document.bridCanRunAds, true)

! https://github.com/uBlockOrigin/uAssets/issues/14827
!#if env_firefox
webmail.email.it##+js(no-fetch-if, googlesyndication)
!#endif

! https://github.com/uBlockOrigin/uAssets/issues/5364
allacronyms.com##+js(nobab)

! https://github.com/uBlockOrigin/uAssets/issues/5369
@@||smscodeonline.com^$ghide
smscodeonline.com##ins.adsbygoogle

! https://github.com/uBlockOrigin/uAssets/issues/5371
peekvids.com,playvids.com,pornflip.com,pornoeggs.com##+js(aopr, open)
*&token$media,redirect=noopmp3-0.1s,domain=peekvids.com|playvids.com|pornflip.com|pornoeggs.com
peekvids.com,playvids.com,pornflip.com##+js(set, pop_target, null)
pornoeggs.com##.card-deck-promotion
pornoeggs.com##.mediaPlayerBanner

! https://github.com/uBlockOrigin/uAssets/issues/5372
@@||thuglink.com^$ghide
thuglink.com##+js(set, adblockEnabled, false)

! https://www.reddit.com/r/uBlockOrigin/comments/beo8ec/block_adblock_at_it_again/
@@||watchmalcolminthemiddle.com^$ghide

! https://github.com/NanoAdblocker/NanoFilters/issues/313
@@||onlinecoursebay.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/11543
gametop.com##+js(aost, document.getElementById, onLoadEvent)
gametop.com##.ads

! https://github.com/uBlockOrigin/uAssets/issues/5378
! https://github.com/uBlockOrigin/uAssets/issues/16740
redensarten-index.de##+js(set, is_banner, true)
redensarten-index.de##+js(nostif, adb)

! https://github.com/uBlockOrigin/uAssets/issues/5305
interviewgig.com##+js(aeld, load, onload)

! https://forums.lanik.us/viewtopic.php?f=62&t=42917
extratorrent.*##:xpath(//a[contains(text(),"VPN")]/../../..)

! https://github.com/NanoMeow/QuickReports/issues/1040
typinggames.zone##+js(acs, document.getElementById, alert)
@@||typinggames.zone^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5385
cdna.tv##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/17603
oko.sh##+js(rmnt, script, /document\.createElement|\.banner-in/)
oko.sh##+js(aopr, AaDetector)
oko.sh##+js(aopr, open)
oko.sh##+js(set, blurred, false)
oko.sh##+js(nostif, Adblock)
oko.sh##+js(no-fetch-if, /googlesyndication|inklinkor|ads\/load/)
oko.sh##+js(acs, XMLHttpRequest, adb)
oko.sh##+js(no-xhr-if, inklinkor.com)
oko.sh##.banner-inner:style(width: 0 !important;)
oko.sh##^script:has-text(adb_detected)
*$image,redirect-rule=1x1.gif,domain=oko.sh
*$script,redirect-rule=noopjs,domain=oko.sh
@@||oko.sh^$ghide
oko.sh##a[href^="https://href.li/"]
oko.sh##a[href^="https://taghaugh.com/"]
oko.sh##[href="https://tipsalert.xyz"]
oko.sh##[src^="https://i.imgur.com/"]
oko.sh##[href^="https://monetag.com/"]
oko.sh##[id^="div-gpt-"]
||inklinkor.com/tag.min.js$script,xhr,redirect-rule=noop.js,domain=oko.sh
||oko.sh/webroot/img$image,1p

! https://github.com/NanoMeow/QuickReports/issues/1050
@@||anhdep24.net^$ghide

! https://github.com/NanoMeow/QuickReports/issues/719
cam4.com##+js(nowoif)
cam4.com###Cam4DialogContainer

! https://github.com/NanoMeow/QuickReports/issues/965
footystreams.net##+js(nostif, '0x)
##[href^="https://pl.allsports4free.club/"]
##[href^="https://pl.allsports4u.club/"]
mlbstreams.net###iframe_preview

! https://github.com/uBlockOrigin/uAssets/issues/5391
@@||1warie.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5398
produktion.de##+js(set, adblock, false)

! https://github.com/uBlockOrigin/uAssets/issues/5400
vw-page.com##+js(set, $easyadvtblock, false)

! https://github.com/uBlockOrigin/uAssets/issues/5399
@@||mediaite.com^$script,1p
mediaite.com##.adthrive-ad
mediaite.com##.o-jw-sub-promo

! https://github.com/uBlockOrigin/uAssets/issues/5405
dump.xxx##+js(aopr, ExoLoader.serve)
dump.xxx##+js(popads-dummy)
dump.xxx##+js(aopr, open)
||dump.xxx/sw.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/5406
fuqer.com##+js(aopr, ExoLoader.serve)
fuqer.com##+js(aopr, open)
fuqer.com##+js(popads-dummy)
||fuqer.com/sw.js$script,1p
fuqer.com##.spot-thumbs > .right:style(height:1px !important)
fuqer.com##.right > .text
fuqer.com#@#.spot-thumbs > .right

! https://github.com/NanoMeow/QuickReports/issues/1056
@@||villatalk.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5305#issuecomment-485317006
lurdchinexgist.blogspot.com##+js(aeld, load, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/5407
sharemods.com##+js(nowebrtc)
sharemods.com##iframe[data-id$="_DFP"]
*$script,3p,denyallow=bootstrapcdn.com|cloudflare.com|cloudflare.net|cookieinfoscript.com|fastly.net|fastlylb.net|google.com|googleapis.com|gstatic.com|hcaptcha.com|hwcdn.net|jquery.com|recaptcha.net,domain=sharemods.com

! https://github.com/uBlockOrigin/uAssets/issues/5408
modsbase.com##+js(nowebrtc)

! https://github.com/NanoMeow/QuickReports/issues/1064
@@||65creedmoor.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/1074
myfreeblack.com##+js(aopw, mfbDetect)
||myfreeblack.com/sw.js$script,1p

! https://github.com/NanoMeow/QuickReports/issues/1075
auto-data.net##+js(acs, document.getElementById, adblock)

! https://github.com/uBlockOrigin/uAssets/issues/5305#issuecomment-486486252
! https://github.com/uBlockOrigin/uAssets/issues/5687
otakuindo.*##+js(aopr, Date.prototype.toUTCString)
otakuindo.*##+js(nobab)

! https://github.com/uBlockOrigin/uAssets/issues/5305#issuecomment-486487471
penis-bilder.com##+js(aopr, popunder)
penis-bilder.com##+js(nobab)

! https://github.com/uBlockOrigin/uAssets/issues/5438
filerio.in##+js(nowoif)
filerio.in##+js(ra, onclick, , stay)
filerio.in##+js(aopr, onload)
filerio.in###player_img:upward(2)

! https://github.com/uBlockOrigin/uAssets/issues/5439
ckk.ai##+js(set, blurred, false)
ckk.ai##+js(nowoif)
@@||ckk.ai^$ghide
ckk.ai##a[href][target="_blank"] > img
||35.224.227.218^$all

! https://github.com/uBlockOrigin/uAssets/issues/5441
sendvid.com##+js(nowoif, !/^https:\/\/sendvid\.com\/[0-9a-z]+$/)
sendvid.com##[href*=".php"]
sendvid.com###video-js-video > [href^="javascript:"]
sendvid.com###vjs-logo-top-bar
sendvid.com###ftr

! https://github.com/uBlockOrigin/uAssets/issues/5448
imgdawgknuttz.com##+js(aopw, atOptions)
imgdawgknuttz.com##+js(acs, document.createElement, /l\.parentNode\.insertBefore\(s/)
imgdawgknuttz.com##+js(aost, atob, inlineScript)
imgdawgknuttz.com##+js(aopr, Pub2a)
||imgdawgknuttz.com/*.php$script,1p
||xxxwebdlxxx.org^$image,domain=imgdawgknuttz.com
*$frame,3p,domain=imgdawgknuttz.com
*$script,3p,domain=imgdawgknuttz.com
||trifms.com^

! https://github.com/uBlockOrigin/uAssets/issues/5450
@@||javsubtitle.co^$ghide
javsubtitle.co###impanel
javsubtitle.co###mimpanel
javsubtitle.co##.boxAds
javsubtitle.co##.boxAds2
javsubtitle.co##.header-ads
javsubtitle.co##.mid-ads

! https://github.com/uBlockOrigin/uAssets/issues/5454
@@||iphonetweak.fr^$ghide
iphonetweak.fr##ins.adsbygoogle
iphonetweak.fr##.bigPub

! https://github.com/uBlockOrigin/uAssets/issues/15586
! https://github.com/uBlockOrigin/uAssets/issues/16307
duden.de##[id*="billboard"]
duden.de##.tabloid__side-column
!#if !env_mobile
~mentor.duden.de,duden.de##+js(aeld, DOMContentLoaded, isMobile)
!#endif
||duden.de/aab/assets/js/
! https://github.com/uBlockOrigin/uAssets/issues/17950
duden.de##body:style(margin-top: 0px !important;)

! https://www.reddit.com/r/uBlockOrigin/comments/bhr1sj/adblocker_detected/
faresgame.com##+js(aopr, adBlockDetected)

! https://github.com/NanoMeow/QuickReports/issues/1087
solarmovie.to##+js(aopw, Fingerprint2)
||solarmovie.to/sw.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/5305#issuecomment-487240463
shemalepower.xyz##+js(nobab)
shemalepower.xyz##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/5457
ssrmovies.*##+js(nowoif)
||get-link.xyz^
||hitcashtag.com^$3p
||techbumper.info^$3p
||techcdn.com^$3p

! https://github.com/NanoMeow/QuickReports/issues/1090
shrib.com##+js(nostif, adb, 6000)

! https://github.com/NanoMeow/QuickReports/issues/1093
ratemyteachers.com##+js(acs, document.getElementById, 'block')

! https://github.com/uBlockOrigin/uAssets/issues/5305#issuecomment-487342789
thefreedommatrix.blogspot.com##+js(aeld, load, 2000)
thefreedommatrix.blogspot.com##+js(nobab)

! https://github.com/uBlockOrigin/uAssets/issues/5466
desiremovies.*##+js(acs, document.createElement, console)
desiremovies.*##+js(aeld, , _0x)
||desiremovies.*/sw.js$script,1p
||presdithas.pw^
desiremovies.*##.code-block-2.code-block

! https://github.com/uBlockOrigin/uAssets/issues/5467
uploadbox.cc##.soundy
uploadbox.cc##+js(disable-newtab-links)
uploadbox.cc##.hopa
||gstatic.com/firebasejs/*/firebase.js$script,domain=uploadbox.cc

! https://github.com/uBlockOrigin/uAssets/issues/5468
pandafiles.com##+js(nostif, pop)
||grumft.com^$3p

! https://github.com/uBlockOrigin/uAssets/issues/5469
##[href="//xxxrevpushclcdu.com/app.webp"]

! https://www.reddit.com/r/uBlockOrigin/comments/bi3nw6/ublock_detected_on_some_tv_channel_website/
@@||proxy.ads.canalplus-bo.net^$xhr,domain=mycanal.fr
||static.canal-plus.net/pub/$media,redirect=noopmp3-0.1s,domain=mycanal.fr

! https://github.com/uBlockOrigin/uAssets/issues/5472
@@||damnripped.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5648
notebookcheck-ru.com##+js(acs, document.getElementById, send)
@@||notebookcheck.com^$script,1p
@@||notebookcheck.net^$script,1p
@@||notebookcheck-ru.com^$script,1p
@@||notebook-check.com^$script,domain=notebookcheck.com|notebookcheck.net|notebookcheck-ru.com
@@||notebookcheck-ru.com^$script,domain=notebookcheck.com|notebookcheck.net|notebookcheck-ru.com
notebookcheck.*##+js(aopw, ab_cl)

! https://github.com/NanoMeow/QuickReports/issues/601
@@||www-league.nhlstatic.com/nhl.com/builds/site-core/*/scripts/*$script,domain=nhl.com
@@||www-league.nhlstatic.com^$xhr,domain=nhl.com
@@||nhl.com^$ghide
*&expire$media,3p,redirect=noopmp3-0.1s,domain=nhl.com
nhl.com##.ad
nhl.com##.ad-centered
nhl.com##.ad-responsive-slot
nhl.com##.native-ad-slot

! https://github.com/uBlockOrigin/uAssets/issues/5474
@@||thuthuatjb.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/1105
dfiles.*##+js(acs, decodeURI, decodeURIComponent)
@@||cloudflare.com/ajax/libs/*/fuckadblock.js$script,domain=depositfiles.org|dfiles.eu
||dfiles.*/sw.js$script,1p

! https://github.com/NanoAdblocker/NanoFilters/issues/318
m4maths.com##+js(aopr, alert)

! https://github.com/NanoMeow/QuickReports/issues/1112
dailycamera.com##+js(nostif, n.trigger, 1)
dailycamera.com##+js(set, CnnXt.Event.fire, noopFunc)

! https://github.com/uBlockOrigin/uAssets/issues/5495
! https://github.com/uBlockOrigin/uAssets/issues/12710
fc.lc,fc-lc.com##+js(acs, document.addEventListener, nextFunction)
fc.lc##+js(aopr, adBlockDetected)
fc.lc##+js(aopr, app_vars.force_disable_adblock)
fc.lc##+js(noeval)
fc.lc##+js(set, blurred, false)
||fc.lc/*.html$frame,1p
||fc.lc/sw.js$script,1p
*$image,3p,domain=fc-lc.com
fc.lc##.banner-inner
fc.lc###ad
fc-lc.com###iframe_id
fc-lc.com##.captcha-page .box-main > a[href][target="_blank"] > img
*$frame,denyallow=facebook.com|google.com|hcaptcha.com|youtube.com,domain=fc.lc|fc-lc.com
*$script,3p,denyallow=bootstrapcdn.com|cloudflare.com|cloudflare.net|google.com|gstatic.com|jsdelivr.net|recaptcha.net|tawk.to|wp.com,domain=fc.lc|fc-lc.com
fc.lc##+js(nowoif, /^/, 1)
! https://github.com/AdguardTeam/AdguardFilters/issues/139812
! vocalley.com anti-adb
#@#.ad-area
#@#.ads_container
~job.inshokuten.com,~netmile.co.jp##.ad-area:not(.text-ad)
##.ads_container:not(.text-ad)

! https://github.com/uBlockOrigin/uAssets/issues/5496
movie4u.live##+js(aopr, AaDetector)

! https://github.com/uBlockOrigin/uAssets/issues/5489#issuecomment-488537713
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=abdoutech.com

! https://github.com/uBlockOrigin/uAssets/issues/5498
pastepvp.org,programasvirtualespc.net##+js(aopw, smrtSB)
programasvirtualespc.net##+js(nosiif, visibility, 1000)
acortame.xyz##+js(aeld, mousedown, trigger)
acortame.xyz##+js(set, Ok, true)
@@||pastepvp.org^$ghide
pastepvp.org##.content > center
@@||programasvirtualespc.net^$ghide
||acortame.xyz^$popunder
||descargaloaca.com^$3p
||fc.lc^$3p,script

! https://github.com/uBlockOrigin/uAssets/issues/5500
@@||online-courses.club^$ghide

! https://github.com/NanoMeow/QuickReports/issues/1130
turbogvideos.com##+js(aopr, open)
@@||turbogvideos.com^$ghide
@@||syndication.exosrv.com/instream-tag.php$script,domain=turbogvideos.com

! https://github.com/NanoMeow/QuickReports/issues/1131
megapornfreehd.com##+js(aopr, V4ss)

! https://github.com/uBlockOrigin/uAssets/issues/5507
cinetux.*##+js(aopw, smrtSB)
cinetux.*##+js(ra, href, #clickfakeplayer)
cinetux.*##span.button
cinetux.*##.links_table > .fix-table > table > tbody > tr:has-text(Patrocinador)

! https://github.com/NanoAdblocker/NanoFilters/issues/321
@@||ad.71i.de/somtag/loader/loader.js$script,domain=puls4.com

! https://github.com/uBlockOrigin/uBlock-issues/issues/556
@@||putlockerhd.co/js/showads.js$xhr,1p

! https://github.com/NanoMeow/QuickReports/issues/1137
@@||animecurse.cz^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5509
tonpornodujour.com##+js(aopr, popunders)
tonpornodujour.com##+js(set, is_adblocked, false)
tonpornodujour.com###disclaimerId

! https://github.com/uBlockOrigin/uAssets/issues/5510
cyfostreams.com##+js(nowebrtc)
cyfostreams.com###blockblockA
! https://github.com/AdguardTeam/AdguardFilters/issues/132251
cyfostreams.com#@#.banner_ad

! https://github.com/uBlockOrigin/uAssets/issues/5511
444.coffee##+js(noeval)
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=firm-ware27.blogspot.com|flash-reset.blogspot.com
@@||magiclen.org^$ghide
magiclen.org##ins.adsbygoogle
file.magiclen.org##+js(nano-stb, , ,0.02)

! https://github.com/uBlockOrigin/uAssets/issues/5527
! https://github.com/uBlockOrigin/uAssets/issues/9710
streameast.*,thestreameast.*##+js(aeld, /^/, 0x)
streameast.*,thestreameast.*##+js(nosiif, visibility, 1000)
streameast.*,thestreameast.*##+js(nowebrtc)
streameast.*,thestreameast.*##+js(nostif, sadbl)
streameast.*##+js(acs, Object.defineProperty, break;case)
streameast.*##^script:has-text(/aclib|runPop/)
thestreameast.*##+js(aopr, aclib)
*$xhr,redirect-rule=nooptext,domain=streameast.*|thestreameast.*
sportlive.*##+js(ra, onclick)
*$image,redirect-rule=32x32.png,domain=streameast.*|thestreameast.*
||streameast.*/*.gif$image
||thestreameast.*/*.gif$image
||dsxwcas.com^
||eagamerz.com^$popup
||supertracker200.com^$popup
||tcgjpib.com^

! https://github.com/NanoMeow/QuickReports/issues/1151
play-old-pc-games.com##+js(nostif, checkAdStatus)

! https://github.com/NanoMeow/QuickReports/issues/1152
viz.com##+js(set, show_dfp_preroll, false)
viz.com##+js(set, show_youtube_preroll, false)
@@||viz.com^$ghide
!#if env_mobile
viz.com##+js(nano-sib, , ,0)
viz.com###metamodal-dfp-preroll
viz.com###overlay
@@||doubleclick.net^$script,xhr,domain=viz.com
@@||googletagservices.com/tag/js/gpt.js$script,domain=viz.com
||assetshuluimcom-a.akamaihd.net/prerolls/$media,3p
!#endif

! https://github.com/NanoAdblocker/NanoFilters/issues/322
dplay.com##.e-overlay--adblock

! https://github.com/uBlockOrigin/uAssets/issues/5494
@@||cdn.playwire.com^$image,domain=krunker.io
@@||cdn.playwire.com/bolt4/js/zeus/frame/admgr$script,1p
*$image,domain=krunker.io,redirect-rule=1x1.gif
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=krunker.io
@@||cdn.frvr.com/fran/pubads_$script,domain=krunker.io
@@||pagead2.googlesyndication.com^$xhr,domain=krunker.io
@@||securepubads.g.doubleclick.net^$xhr,domain=krunker.io

! https://github.com/NanoMeow/QuickReports/issues/1154
||googlesyndication.com/pagead/js/$script,redirect=noopjs,domain=eazycheat.com

! https://github.com/NanoMeow/QuickReports/issues/1155
pussytorrents.org##+js(aopr, loadTool)

! https://github.com/NanoMeow/QuickReports/issues/1157
||assets.moat.com/*/ad$image,redirect=2x2.png,1p

! addic7ed.com popups
addic7ed.com##+js(aopr, AaDetector)
addic7ed.com##+js(aopr, eddOptions)

! https://github.com/uBlockOrigin/uAssets/issues/5534
@@||rmdan.*^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5538
! https://github.com/NanoMeow/QuickReports/issues/3478
tunovelaligera.com##+js(aopr, mdpDeBlocker)
tunovelaligera.com##+js(nostif, mdp)
@@||tunovelaligera.com^$ghide
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=tunovelaligera.com

! https://github.com/uBlockOrigin/uAssets/issues/5540
@@||player.ooyala.com/static/*/ad-plugin/google_ima.min.js$script,domain=ccmbg.com

! https://github.com/uBlockOrigin/uAssets/issues/5543
@@||1000ps.de^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5542
@@||desirecourse.net^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5544
@@||nfhost.me^$ghide

! jobhunterplg.xyz redirection
||scorchin.com*?realDomain$doc

! https://github.com/NanoMeow/QuickReports/issues/1162
@@||hastingsobserver.co.uk^$ghide
hastingsobserver.co.uk##.leaderboard-ad

! https://github.com/NanoMeow/QuickReports/issues/1028
dlkoo.com##+js(nowoif)

! https://github.com/NanoMeow/QuickReports/issues/1169
||wp.com*/banner$image,domain=komikmama.net

! https://github.com/uBlockOrigin/uAssets/issues/5553
freecourseweb.com##+js(nostif, brave_load_popup)
@@||freecourseweb.com^$ghide
freecourseweb.com##ins.adsbygoogle
*$script,3p,redirect-rule=noopjs,domain=freecourseweb.com

! https://github.com/uBlockOrigin/uAssets/issues/5561
svapo.it##+js(aopw, adBlockDetected)

! https://github.com/NanoAdblocker/NanoFilters/issues/328
sataniabatch.blogspot.com##+js(nofab)

! https://github.com/uBlockOrigin/uAssets/issues/5568
@@||csm.dev^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5572
papalah.com##+js(aopw, adBlockDetected)

! solarmovie.id popup
solarmovie.id##+js(aopr, AaDetector)

! https://github.com/uBlockOrigin/uAssets/issues/5489#issuecomment-491483476
bezpolitickekorektnosti.cz##+js(aopr, sc_adv_out)
bezpolitickekorektnosti.cz##.SC_TBlock

! https://github.com/uBlockOrigin/uAssets/issues/5579
glodls.*##+js(nowebrtc)

! https://www.reddit.com/r/uBlockOrigin/comments/bnscg6/ublocknano_adblocker_detected_any_way_to_bypass/
starcoins.ws##+js(aopw, adBlockDetected)

! https://github.com/uBlockOrigin/uAssets/issues/5583
anitube.site###protetorVideo

! https://github.com/uBlockOrigin/uAssets/issues/5489#issuecomment-491564073
bitcoinminingforex.blogspot.com##+js(nofab)
bitcoinminingforex.blogspot.com##+js(nowoif)

! https://forums.lanik.us/viewtopic.php?f=62&t=43018
@@||imggram.org^$ghide

! https://www.reddit.com/r/uBlockOrigin/comments/aqiblx/please_help_to_get_rid_of_protopage_ads/
protopage.com##+js(aopr, pageParams.dispAds)

! https://github.com/NanoMeow/QuickReports/issues/1211
@@||cyclismactu.net/adserver.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/5588
letmejerk.com,letmejerk2.com,letmejerk3.com,letmejerk4.com,letmejerk5.com,letmejerk6.com,letmejerk7.com##+js(aopr, ExoLoader)
letmejerk.com,letmejerk2.com,letmejerk3.com,letmejerk4.com,letmejerk5.com,letmejerk6.com,letmejerk7.com##+js(aeld, , _0x)
letmejerk.com,letmejerk2.com,letmejerk3.com,letmejerk4.com,letmejerk5.com,letmejerk6.com,letmejerk7.com##.cams-widget
letmejerk.com,letmejerk2.com,letmejerk3.com,letmejerk4.com,letmejerk5.com,letmejerk6.com,letmejerk7.com##[class^="lmj"]
letmejerk.com,letmejerk2.com,letmejerk3.com,letmejerk4.com,letmejerk5.com,letmejerk6.com,letmejerk7.com##.th:has(> span.th-ad)
||letmejerk.com/*.php$script,1p

||mn-shop.com^$3p

! https://github.com/uBlockOrigin/uAssets/issues/5599
queenfaucet.website##+js(aopw, app_vars.force_disable_adblock)
queenfaucet.website##+js(aopw, adBlockDetected)
queenfaucet.website##+js(aeld, click, trigger)
queenfaucet.website##+js(set, show_ads_gr8_lite, true)

! https://github.com/NanoMeow/QuickReports/issues/1221
@@||dailythanthi.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/1222
windowcleaningforums.co.uk##+js(nostif, show)
windowcleaningforums.co.uk##[href="https://thrivewp.com/"]
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=windowcleaningforums.co.uk
windowcleaningforums.co.uk##a[href^="https://windowcleaningforums.co.uk/index.php?"][target="_blank"]
windowcleaningforums.co.uk##.ipsAdvertisement_large

! https://github.com/uBlockOrigin/uAssets/issues/5601
pennlive.com##+js(aeld, load, PrivateMode)

! https://github.com/uBlockOrigin/uAssets/issues/5604
! https://github.com/uBlockOrigin/uAssets/issues/5585
! https://github.com/uBlockOrigin/uAssets/issues/5620
! https://github.com/uBlockOrigin/uAssets/issues/9009
! https://github.com/uBlockOrigin/uAssets/issues/17672
freeupload.info,fstore.biz,uploadfree.info##+js(acs, document.getElementById, undefined)
fstore.biz##+js(set, blurred, false)
freeupload.info,fstore.biz,uploadfree.info##+js(nano-sib)
uploadfree.info###at-btn-download

! https://github.com/NanoMeow/QuickReports/issues/1227
@@||beatricedailysun.com^$ghide
beatricedailysun.com##.tnt-ads-container

! https://github.com/uBlockOrigin/uAssets/issues/5608
.gif$image,domain=107.152.37.223

! https://github.com/NanoMeow/QuickReports/issues/1236
beautypageants.indiatimes.com##+js(aeld, scroll, _0x)

! https://github.com/NanoMeow/QuickReports/issues/1235
@@||googletagmanager.com/gtm.js$script,domain=raiplayradio.it

! https://github.com/AdguardTeam/AdguardFilters/issues/51758
freebcc.org##+js(aopr, app_vars.force_disable_adblock)
freebcc.org##+js(aopr, adBlockDetected)
@@||freebcc.org^$ghide
freebcc.org##.mb-0.mt-3.text-center.text-small
freebcc.org###Layer_1

! https://github.com/DandelionSprout/adfilt/issues/7#issuecomment-493395377
! https://github.com/uBlockOrigin/uAssets/issues/6726
pixiv.net###js-mount-point-header.with-ad:style(min-height: auto !important)
pixiv.net##._illust-upload + div[style*="968px;"][style*="170px;"]
pixiv.net##div[class^="sc-"] > div[class^="sc-"]:has(> div[style*="width: 728px;"]:only-child > iframe[name="footer"][width="728"][height="90"]):matches-css(padding-bottom: 56px)
pixiv.net##iframe[name="dashboard_home"]:upward(div[class^="sc-"][span="1"])
pixiv.net##div[style="margin: 48px auto 8px; width: 728px; line-height: 0; font-size: 0px;"]
pixiv.net##div[style^="margin-left:"]:has(> iframe[name="header"][width="468"][height="60"])
pixiv.net##div[style^="font-size:"]:has(> iframe[name="rectangle"][width="300"])
pixiv.net##.gtm-toppage-thumbnail-illustration-recommend-works-zone li > div:has(> iframe[name="topbranding_rectangle"][width="300"][height="250"])
pixiv.net##.gtm-toppage-thumbnail-manga-recommend-works-zone li:has(> iframe[name="comic"][width="184"][height="232"])
pixiv.net##main > section > div > div:has(> iframe[name][width="500"][height="520"])
pixiv.net##section > div[class^="sc-"]:last-child:has(> div[style*="width: 728px;"]:only-child > iframe[name="footer"][width="728"][height="90"]):matches-css(margin-bottom: -16px)
! https://github.com/uBlockOrigin/uAssets/issues/22418
pixiv.net##section ul > li:has(> iframe[name="infeed"])

! https://forums.lanik.us/viewtopic.php?f=62&t=43033
cda.pl##.pb-video-click
cda.pl##.pb-ad-video-player
||redcdn.pl/file/*/vstatic/*.mp4$media,redirect=noopmp3-0.1s,domain=cda.pl

! https://github.com/NanoMeow/QuickReports/issues/1250
@@||maalaimalar.com^$ghide
cinema.maalaimalar.com##.in.fade.modal-backdrop
cinema.maalaimalar.com##body:style(overflow: auto !important;)

! https://forums.lanik.us/viewtopic.php?f=91&t=43035
topito.com##+js(aopr, document.bridCanRunAds)

! https://github.com/NanoMeow/QuickReports/issues/1254
@@||neko-sama.fr^$ghide

! https://github.com/NanoMeow/QuickReports/issues/1253
0rechner.de##+js(set, doads, true)

! https://github.com/uBlockOrigin/uAssets/issues/5618
@@||galt.hit.gemius.pl/gplayer.js$script,domain=lrt.lt

! https://github.com/uBlockOrigin/uAssets/issues/5628
@@||pasty.*^$ghide
@@||pagead2.googlesyndication.com/pagead/js/adsbygoogle.js$script,domain=pasty.*
@@||pagead2.googlesyndication.com/pagead/js/*/show_ads_impl$script,domain=pasty.*

! https://github.com/uBlockOrigin/uAssets/issues/5635
! https://github.com/uBlockOrigin/uAssets/issues/5640
@@||qctimes.com^$ghide
@@||wcfcourier.com^$ghide
qctimes.com,wcfcourier.com##.tnt-ads-container

! https://github.com/NanoMeow/QuickReports/issues/1263
@@||roya.tv^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5639
sexvid.*,hdtube.porn##+js(acs, document.write, iframe)
sexvid.*,hdtube.porn##+js(aopr, ExoLoader)
sexvid.*##+js(aopr, pu)
sexvid.*###banner_video
sexvid.*##.sponsor.shown
sexvid.*##.spots_field.spots_thumbs
sexvid.*##.box_site
sexvid.*##.download_link
sexvid.*##.spot-content, .spot-title
*$xhr,frame,domain=sexvid.*
hdtube.porn##.banners
!#if env_mobile
sexvid.*,hdtube.porn###fltd-inner
sexvid.*##.wrapper > .spot-holder
sexvid.*##.cs
sexvid.*##.thumb-adv
sexvid.*##.container > .headline, .intro
sexvid.*##.under-player.spot-holder > .spot
hdtube.porn##.cards__item--adv.cards__item--big.cards__item.item
hdtube.porn##.page__main > .container
!#endif

! https://github.com/NanoMeow/QuickReports/issues/1268
livesport.ws##+js(aopr, MessageChannel)

! configspc .com popups
configspc.com##+js(set, jsUnda, noopFunc)

! https://github.com/NanoAdblocker/NanoFilters/issues/336
sbsun.com##+js(set, CnnXt.Event.fire, noopFunc)

! https://github.com/uBlockOrigin/uAssets/issues/5645
citynow.it##+js(aopr, advads_passive_ads)
||citynow.it/wp-content/uploads/*/banner$image,1p
citynow.it##.advads-close-button

! https://github.com/uBlockOrigin/uAssets/issues/5647
@@||myshorturls.blogspot.com^$ghide
myshorturls.blogspot.com##ins.adsbygoogle

! https://github.com/uBlockOrigin/uAssets/issues/5842
tmohentai.com##+js(aopr, ExoLoader.serve)
@@||tmohentai.com^$ghide
tmohentai.com##.advert
||tmohentai.com/nb/
||tmohentai.com/*.php
tmohentai.com##+js(noeval-if, tmohentai)

! https://forums.lanik.us/viewtopic.php?f=62&t=43053
variety.com##+js(aopr, pmc_admanager.show_interrupt_ads)

! https://github.com/NanoMeow/QuickReports/issues/1276
@@||sme.sk^$ghide

! anti adb http://arembed .com/live.php?ch=Bein_Sports1
@@||janjua.*^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5651
xopenload.me##+js(set, jsUnda, noopFunc)
xopenload.me##+js(aopw, open)
xopenload.me##+js(aopr, ExoLoader.serve)
xopenload.me##.btn-lg.btn-block.btn

! https://github.com/NanoAdblocker/NanoFilters/issues/338
@@||jbzdy.com.pl^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5666
@@||senpa.io^$ghide
senpa.io##+js(nobab)
senpa.io###ad-slot-left-panel
senpa.io###ad-slot-center-panel
senpa.io###banner_ad_bottom
senpa.io##.adsPanel
senpa.io##.advertisement-informer

! https://github.com/uBlockOrigin/uAssets/issues/5667
! https://github.com/uBlockOrigin/uAssets/issues/6727
getfreecourses.*##+js(nosiif, visibility, 1000)
@@||getfreecourses.*^$ghide
getfreecourses.*##ins.adsbygoogle

! https://github.com/NanoMeow/QuickReports/issues/1287
tuotromedico.com##+js(set, jQuery.adblock, false)

! https://github.com/NanoMeow/QuickReports/issues/1288
lesoir.be##+js(nostif, adb)

! https://github.com/NanoMeow/QuickReports/issues/1298
mysostech.com##+js(aopw, ai_adb_overlay)

! https://github.com/NanoMeow/QuickReports/issues/1299
gleanster.com###overlay

! Postmedia featured video ads
! https://github.com/uBlockOrigin/uAssets/issues/10499
airdrieecho.com,brantfordexpositor.ca,calgaryherald.com,calgarysun.com,canoe.com,chathamdailynews.ca,chathamthisweek.com,clintonnewsrecord.com,cochranetimes.com,cochranetimespost.ca,coldlakesun.com,communitypress.ca,countymarket.ca,countyweeklynews.ca,devondispatch.ca,draytonvalleywesternreview.com,edmontonjournal.com,edmontonsun.com,elliotlakestandard.ca,fairviewpost.com,fortmcmurraytoday.com,fortsaskatchewanrecord.com,gananoquereporter.com,goderichsignalstar.com,greybrucethisweek.ca,hannaherald.com,intelligencer.ca,kenoraminerandnews.com,kincardinenews.com,kingstonthisweek.com,lakeshoreadvance.com,leaderpost.com,leducrep.com,lfpress.com,lucknowsentinel.com,mayerthorpefreelancer.com,melfortjournal.com,midnorthmonitor.com,mitchelladvocate.com,montrealgazette.com,nantonnews.com,nationalpost.com,norfolkandtillsonburgnews.com,northernnews.ca,nugget.ca,ontariofarmer.com,ottawacitizen.com,ottawasun.com,owensoundsuntimes.com,parisstaronline.com,peacecountrysun.com,pembrokeobserver.com,pinchercreekecho.com,prrecordgazette.com,recorder.ca,sarniathisweek.com,saultstar.com,saultthisweek.com,seaforthhuronexpositor.com,sherwoodparknews.com,shorelinebeacon.com,simcoereformer.ca,sprucegroveexaminer.com,standard-freeholder.com,stonyplainreporter.com,stratfordbeaconherald.com,strathroyagedispatch.com,stthomastimesjournal.com,thebeaumontnews.ca,thechronicle-online.com,thecragandcanyon.ca,thegraphicleader.com,thelondoner.ca,thepost.on.ca,theprovince.com,thestarphoenix.com,thesudburystar.com,thewhig.com,timminspress.com,timminstimes.com,todaysfarmer.ca,torontosun.com,trentonian.ca,vancouversun.com,vermilionstandard.com,vulcanadvocate.com,wallaceburgcourierpress.com,wetaskiwintimes.com,whitecourtstar.com,wiartonecho.com,windsorstar.com,winnipegsun.com,woodstocksentinelreview.com##.featured-video

! https://github.com/NanoMeow/QuickReports/issues/1296#issuecomment-496916241
@@||canoe.com^$ghide
canoe.com###postmedia_layouts_ad-top
canoe.com##.ad__container

! https://github.com/uBlockOrigin/uAssets/issues/5697
moviflex.*##+js(acs, Math, XMLHttpRequest)
moviflex.*##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/5698
! https://github.com/NanoMeow/QuickReports/issues/3261
! https://github.com/uBlockOrigin/uAssets/issues/19463
||welect.de^$3p
||wlct-three.de^$3p

! https://github.com/uBlockOrigin/uAssets/issues/5699
||edgecast-vod.yimg.com/$media,redirect=noopmp3-0.1s,domain=yahoo.com

! https://github.com/AdguardTeam/AdguardFilters/issues/80254
vladan.fr##+js(nostif, adb, 0)
vladan.fr##body:style(background-image:none !important)
vladan.fr###text-414857080 > .widget-wrap > .widgettitle.widget-title
vladan.fr##[href^="https://www.nakivo.com/"]
vladan.fr##[href^="https://www.starwindsoftware.com/"]
vladan.fr##[href^="https://lpar2rrd.com/"]
vladan.fr##+js(nowoif)
||vladan.fr/*skin$image

! https://github.com/NanoMeow/QuickReports/issues/1313
losporn.org##+js(aopr, ExoLoader.serve)
losporn.org##+js(nowoif)

! https://www.reddit.com/r/uBlockOrigin/comments/buur9g/blocklist_addition_request/
onepiece-tube.com##+js(set, abp, noopFunc)
onepiece-tube.com##.adb
onepiece-tube.com##[href^="https://www.amazon.de/"]

! https://github.com/NanoMeow/QuickReports/issues/1315
@@||british-birdsongs.uk^$ghide
british-birdsongs.uk##ins.adsbygoogle

! https://github.com/uBlockOrigin/uAssets/issues/5713
japgay.com##+js(set, AlobaidiDetectAdBlock, true)

! https://github.com/uBlockOrigin/uAssets/issues/5718
hentai-vl.blogspot.com##+js(aeld, load, 2000)

! https://github.com/NanoMeow/QuickReports/issues/1316
@@||helenair.com^$ghide
helenair.com##.tnt-ads-container

! https://github.com/adsbypasser/adsbypasser/issues/2081
! https://github.com/uBlockOrigin/uAssets/issues/18448
deltabit.co##+js(nano-sib)
*$script,3p,domain=deltabit.co
||ipultcbpgbs.com^

! https://github.com/NanoMeow/QuickReports/issues/1322
@@||loskatchorros.com.br^$ghide
loskatchorros.com.br##.adsbygoogle:style(max-height: 1px !important;)

! https://www.reddit.com/r/uBlockOrigin/comments/cmxap7/embedded_youtubeads_inside_streaming_videos/ew6h7h8/
! https://github.com/AdguardTeam/AdguardFilters/issues/47342
! https://github.com/AdguardTeam/AdguardFilters/issues/87631
! https://github.com/AdguardTeam/AdguardFilters/issues/89759
! https://github.com/AdguardTeam/AdguardFilters/issues/92220
! https://github.com/AdguardTeam/AdguardFilters/issues/93328
! https://github.com/AdguardTeam/AdguardFilters/issues/94244
embedsito.com,fembed.com,films5k.com,javcl.me,javideo.pw,mavplay.*,playfinder.xyz,ujav.me,videobb.*##+js(aopr, jwplayer.utils.Timer)
diasfem.com,embedsito.com,fembed.*,films5k.com,javcl.me,javideo.pw,mavlecteur.com,mavplay.*,playfinder.xyz,ujav.me,videobb.*##+js(aopr, __Y)
diasfem.com,embedsito.com,fembed.*,mavlecteur.com,mavplay.*,playfinder.xyz,videobb.*##+js(aopw, adcashMacros)
diasfem.com,embedsito.com,fembed.*,javcl.me,mavlecteur.com,mavplay.*,playfinder.xyz,videobb.*##+js(aopr, mm)
fembed.com,playfinder.xyz,videobb.*##+js(aopr, glxopen)
embedsito.com,fembed.*,films5k.com,javcl.me,mavlecteur.com,mavplay.*,playfinder.xyz,ujav.me,videobb.*##+js(nowoif)
tpxanime.in,welovestream.xyz##+js(nowoif)
welovestream.xyz##.video-fake
welovestream.xyz##div[style="position: fixed; display: block; width: 100%; height: 100%; inset: 0px; background-color: rgba(0, 0, 0, 0); z-index: 300000;"]
javsister.com###custom_html-11
javsister.com###footer-widgets
javsister.com##.boxzilla-overlay
javsister.com##.boxzilla-center-container
||4gay.fans/fans.js
@@||playfinder.xyz^$ghide

! https://github.com/NanoMeow/QuickReports/issues/1336
varmatin.com##+js(aopw, checkAds)

! https://github.com/NanoMeow/QuickReports/issues/1337
@@||siouxcityjournal.com^$ghide
siouxcityjournal.com##.tnt-ads-container

||wicket.pw/embeds/icc-cwc.png$image

! https://github.com/uBlockOrigin/uAssets/issues/5761
nsw2u.*##[href^="https://bit.ly/"]
! https://www.reddit.com/r/uBlockOrigin/comments/126iwtj/
nsw2u.*##+js(acs, eval, replace)
nsw2u.*##+js(no-xhr-if, googlesyndication)

! filesharing.io anti adb
filesharing.io##+js(aopw, showMsgAb)
@@||filesharing.io^$ghide

! https://github.com/NanoMeow/QuickReports/issues/1340
@@||loveawake.com^$ghide
loveawake.com##ins.adsbygoogle

! https://github.com/uBlockOrigin/uAssets/issues/5767
softwarecrackguru.com##+js(aopw, downloadJSAtOnload)

! https://github.com/uBlockOrigin/uAssets/issues/5770
@@||kickedface.com^$ghide

! https://github.com/NanoAdblocker/NanoFilters/issues/351
mega-debrid.eu##+js(set, Advertisement, 1)

! https://github.com/uBlockOrigin/uAssets/issues/5772
projetomotog.blogspot.com##+js(aeld, load, 2000)

! https://github.com/NanoAdblocker/NanoFilters/issues/350
solvetube.*##+js(nostif, 0x, 3000)
||googlesyndication.com/pagead/$script,redirect=noopjs,domain=solvetube.site,important
||google-analytics.com/analytics.js$script,redirect=google-analytics.com/analytics.js,important,domain=solvetube.site
@@*$script,1p,domain=solvetube.*

! https://github.com/uBlockOrigin/uAssets/issues/5776
! https://www.reddit.com//r/uBlockOrigin/comments/u3l605/mlwbdhost/
mlwbd.*##+js(noeval-if, ads)
@@/home.php$popup,domain=mlwbd.*
@@/blog.php$popup,domain=mlwbd.*
mlwbd.*##+js(ra, type, input[value^="http"])
mlwbd.*##input[value^="http"]:style(width: 70% !important)

! https://github.com/uBlockOrigin/uAssets/issues/5779
123mkv.*##+js(nowoif)

! https://forums.lanik.us/viewtopic.php?f=90&t=35977
hdfilme.*##+js(aopr, eddOptions)
hdfilme.*##+js(nostif, invoke)
! https://github.com/easylist/easylist/issues/11264
hdfilme.*##+js(aopr, console.clear)
hdfilme.*##+js(aopr, adBlocked)
hdfilme.*##+js(aopr, AaDetector)
hdfilme.*###fake-player-wrapper

! https://forums.lanik.us/viewtopic.php?f=62&t=43117
||goodnewsnetwork.org^$csp=script-src 'self' 'unsafe-inline' 'unsafe-eval' *.googletagservices.com *.wp.com *.air.tv *.addthis.com *.cloudflare.com *.facebook.net *.facebook.com *.gstatic.com *.youtube.com *.ytimg.com *.google.com *.googletagmanager.com *.instagram.com
! https://github.com/uBlockOrigin/uAssets/issues/5792
apple-of-my-eye.com,barefeetonthedashboard.com,bargainbriana.com,betterbuttchallenge.com,bike-urious.com,blwideas.com,eartheclipse.com,entertainment-focus.com,fanatik.com.tr,foreverconscious.com,foreversparkly.com,getdatgadget.com,goodnewsnetwork.org,greenarrowtv.com,hbculifestyle.com,heysigmund.com,hodgepodgehippie.com,homestratosphere.com,indesignskills.com,katiescucina.com,knowyourphrase.com,letsworkremotely.com,lizs-early-learning-spot.com,ledauphine.com,leprogres.fr,milliyet.com.tr,mjsbigblog.com,pinoyrecipe.net,prepared-housewives.com,recipesforourdailybread.com,redcarpet-fashionawards.com,republicain-lorrain.fr,savespendsplurge.com,savingadvice.com,shutupandgo.travel,spring.org.uk,stevivor.com,tamaratattles.com,tastefullyeclectic.com,theavtimes.com,thechroniclesofhome.com,thisisourbliss.com,tinyqualityhomes.org,turtleboysports.com,ultimateninjablazingx.com,universfreebox.com,utahsweetsavings.com,vgamerz.com,wheatbellyblog.com,yummytummyaarthi.com##+js(acs, Date, ='\x)
apple-of-my-eye.com,barefeetonthedashboard.com,bargainbriana.com,betterbuttchallenge.com,bike-urious.com,blwideas.com,eartheclipse.com,entertainment-focus.com,fanatik.com.tr,foreverconscious.com,foreversparkly.com,getdatgadget.com,goodnewsnetwork.org,greenarrowtv.com,hbculifestyle.com,heysigmund.com,hodgepodgehippie.com,homestratosphere.com,indesignskills.com,katiescucina.com,knowyourphrase.com,letsworkremotely.com,lizs-early-learning-spot.com,ledauphine.com,leprogres.fr,milliyet.com.tr,mjsbigblog.com,pinoyrecipe.net,prepared-housewives.com,recipesforourdailybread.com,redcarpet-fashionawards.com,republicain-lorrain.fr,savespendsplurge.com,savingadvice.com,shutupandgo.travel,spring.org.uk,stevivor.com,tamaratattles.com,tastefullyeclectic.com,theavtimes.com,thechroniclesofhome.com,thisisourbliss.com,tinyqualityhomes.org,turtleboysports.com,ultimateninjablazingx.com,universfreebox.com,utahsweetsavings.com,vgamerz.com,wheatbellyblog.com,yummytummyaarthi.com##+js(acs, document.head.appendChild, ='\x)
apple-of-my-eye.com,barefeetonthedashboard.com,bargainbriana.com,betterbuttchallenge.com,bike-urious.com,blwideas.com,eartheclipse.com,entertainment-focus.com,fanatik.com.tr,foreverconscious.com,foreversparkly.com,getdatgadget.com,goodnewsnetwork.org,greenarrowtv.com,hbculifestyle.com,heysigmund.com,hodgepodgehippie.com,homestratosphere.com,indesignskills.com,katiescucina.com,knowyourphrase.com,letsworkremotely.com,lizs-early-learning-spot.com,ledauphine.com,leprogres.fr,milliyet.com.tr,mjsbigblog.com,pinoyrecipe.net,prepared-housewives.com,recipesforourdailybread.com,redcarpet-fashionawards.com,republicain-lorrain.fr,savespendsplurge.com,savingadvice.com,shutupandgo.travel,spring.org.uk,stevivor.com,tamaratattles.com,tastefullyeclectic.com,theavtimes.com,thechroniclesofhome.com,thisisourbliss.com,tinyqualityhomes.org,turtleboysports.com,ultimateninjablazingx.com,universfreebox.com,utahsweetsavings.com,vgamerz.com,wheatbellyblog.com,yummytummyaarthi.com##+js(aopr, __eiPb)

! https://github.com/uBlockOrigin/uAssets/issues/5795
@@||fapxl.com/skins/blank/js/blockadblock.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/5797
dreamfancy.org##+js(nostif, nextFunction, 250)
dreamfancy.org##+js(nowoif)

! https://www.reddit.com/r/uBlockOrigin/comments/byxkl0/please_help_me_bypass_the_adblock_detection_on/
dreamdth.com##+js(aopw, wutimeBotPattern)
! https://www.reddit.com/r/uBlockOrigin/comments/8lmjam/please_help_me_bypass_the_adblock_detection_on/
dreamdth.com##+js(set, adBlockDetected, false)
dreamdth.com##+js(acs, $, show)

! https://github.com/uBlockOrigin/uAssets/issues/5799
! https://github.com/uBlockOrigin/uAssets/issues/18375
pornhub.*##+js(nostif, adsbytrafficjunkycontext)
pornhub.*##+js(acs, Object.defineProperty, trafficjunky)
pornhub.*##+js(nowoif)
! https://github.com/uBlockOrigin/uAssets/issues/5799#issuecomment-599266182
pornhub.*##.video-wrapper > #player ~ .hd.clear
pornhub.*##.sniperModeEngaged
pornhub.*##a[href^="http://ads.trafficjunky.net/"]
pornhub.*##.realsex
pornhub.*###pb_block
! https://github.com/uBlockOrigin/uAssets/issues/11753
pornhub.*##+js(set, page_params.holiday_promo, true)
! https://github.com/AdguardTeam/AdguardFilters/issues/132379
pornhub.*###relatedVideosCenter > .wrapVideoBlock
! https://github.com/AdguardTeam/AdguardFilters/issues/146564
pornhub.*##+js(set, abp1, 1)

! https://github.com/uBlockOrigin/uAssets/issues/5804
ranker.com##+js(aopr, __eiPb)

! https://github.com/NanoMeow/QuickReports/issues/1368
@@||stltoday.com^$ghide
stltoday.com##.dfp-ad
stltoday.com##.tnt-ads-container

! https://www.reddit.com/r/uBlockOrigin/comments/brisbv/help_with_this_site/
subdivx.com##+js(cookie-remover, ref_cookie)
subdivx.com###taboola-below-article-thumbnails
||karconsulting.us^$3p

! thevidhd popups
thevidhd.*##+js(aopw, smrtSB)
thevidhd.*##+js(nowebrtc)
||thevidhd.*/sw.js$script,1p
thevidhd.*##.video_batman
thevidhd.*##h1

! https://github.com/uBlockOrigin/uAssets/issues/2290
! https://www.reddit.com/r/uBlockOrigin/comments/d7nk0c/ads_getting_through_on_vuducom_and_tubitvcom/
@@||tubitv.com^$ghide
||ads.adrise.tv^$3p
*.mp4$media,redirect=noopmp3-0.1s,domain=tubitv.com
/cdn.*/ads.$badfilter

! https://forums.lanik.us/viewtopic.php?p=148205#p148205
cuatro.com,mitele.es,telecinco.es##+js(aopr, $REACTBASE_STATE.serverModules.push)

! https://github.com/uBlockOrigin/uAssets/issues/5816
@@||wupfile.com^$ghide
wupfile.com##[id*=ScriptRoot]

! techperiod.com anti adb
@@||techperiod.com^$ghide
techperiod.com##ins.adsbygoogle

! https://forums.lanik.us/viewtopic.php?f=62&t=43156#p148250
gdrivez.xyz##+js(nostif, nextFunction, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/5828
acefile.co##+js(aopw, popup_ads)
acefile.co##.textwidget
! https://github.com/realodix/AdBlockID/issues/1746
acefile.co###btmx

! https://forums.lanik.us/viewtopic.php?f=103&t=43167
lne.es##+js(nostif, ipod)
! https://github.com/uBlockOrigin/uAssets/issues/5624
! https://github.com/uBlockOrigin/uAssets/issues/5891
diaridegirona.cat,diariodeibiza.es,diariodemallorca.es,diarioinformacion.com,eldia.es,emporda.info,farodevigo.es,laopinioncoruna.es,laopiniondemalaga.es,laopiniondemurcia.es,laopiniondezamora.es,laprovincia.es,levante-emv.com,mallorcazeitung.es,regio7.cat,superdeporte.es##+js(set, pr_okvalida, true)

! https://github.com/abp-filters/abp-filters-anti-cv/issues/193
voiranime.com##.ad

! https://github.com/uBlockOrigin/uAssets/issues/5835
@@||wikitrik.com^$ghide
@@||wikitrik.com/favicon.ico$image,1p

! fix seireshd.com anti adb
seireshd.com##+js(acs, btoa, href)
serieslandia.com##+js(aopr, scriptwz_url)
@@||seireshd.com^$ghide
||adsrt.com^$3p

! fix pivigames.blog ads & popup
pivigames.blog##+js(acs, enlace)
playpaste.com##+js(acs, document.addEventListener, Popup)
playpaste.com##+js(set, $.ajax, trueFunc)
||playpaste.com/sw.js$script,1p

! https://github.com/AdguardTeam/AdguardFilters/issues/35411
ktmx.pro##+js(aeld, load, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/5850
@@||darkw.pl^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5847
player.rtl2.de##+js(set, getHomadConfig, noopFunc)

! thecrazytourist .com popunder
thecrazytourist.com##+js(acs, document.getElementsByTagName, appendChild)
||sp.booking.com^$domain=thecrazytourist.com

! https://github.com/uBlockOrigin/uAssets/issues/5855
megatube.xxx##+js(aopr, BetterJsPop)
||megatube.xxx^$frame,1p
||megatube.xxx/atrm/*$script,1p
@@||megatube.xxx/atrm/s/s/js/m/pr-before.js$script,1p

! https://github.com/NanoMeow/QuickReports/issues/1399
dailydemocrat.com,montereyherald.com,orovillemr.com,record-bee.com,redbluffdailynews.com,reporterherald.com,thereporter.com,timescall.com,timesheraldonline.com,ukiahdailyjournal.com##+js(set, CnnXt.Event.fire, noopFunc)

! https://www.reddit.com/r/uBlockOrigin/comments/c38j3y/block_antiblocker_on_maggotdrowningcom/
@@||maggotdrowning.com/forums/js/siropu/am/ads.min.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/5863
pornult.com##+js(acs, Math.random, Exoloader)
pornult.com##+js(nowoif)
pornult.com##+js(nostif, offsetWidth)
pornult.com##+js(aopr, exoJsPop101)
pornult.com##+js(aopr, btoa)
||pornult.com/sw.js$script,1p
pornult.com##.sexshp
||pornult.com/*/custom_vast/$media,1p

! https://github.com/NanoMeow/QuickReports/issues/1406
! https://github.com/NanoMeow/QuickReports/issues/3929
! https://github.com/uBlockOrigin/uAssets/issues/23986
joyn.de,joyn.at##+js(no-fetch-if, zomap.de)
@@||ad.71i.de/global_js/AppConfig/Joyn/desktop.json$xhr,domain=joyn.de
@@||adition.com/1x1.gif$xhr,domain=joyn.de
@@||aws.route71.net/ad-$script,domain=joyn.de
@@||research.de.com/bb-mx/prime$xhr,domain=joyn.de
@@||script.ioam.de/iam.js$script,domain=joyn.de
@@||securepubads.g.doubleclick.net/pcs/view/*$xhr,domain=joyn.de

! https://github.com/AdguardTeam/AdguardFilters/issues/35676
dictionnaire-medical.net##+js(nostif, nextFunction, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/9158
@@||money.it^$ghide
money.it##.gptslot

! https://github.com/uBlockOrigin/uAssets/issues/5877
nonktube.com##+js(nowoif)
nonktube.com##+js(aopr, decodeURI)

! https://github.com/NanoMeow/QuickReports/issues/1424
@@||kenkenpuzzle.com/assets/*$xhr,1p

! https://github.com/AdguardTeam/AdguardFilters/issues/35801
izzylaif.com##+js(acs, jQuery, undefined)

! https://github.com/AdguardTeam/AdguardFilters/issues/35816
@@||gelbeseiten.de^$script,1p

! https://github.com/AdguardTeam/AdguardFilters/issues/35459
movs4u.*##+js(aeld, , _0x)
||i.imgur.com/*.gif$image,domain=movs4u.*

! https://github.com/NanoMeow/QuickReports/issues/1427
collater.al##+js(aopr, adsanity_ad_block_vars)

! https://github.com/NanoMeow/QuickReports/issues/1429
@@||get-click2.blogspot.com^$ghide
get-click2.blogspot.com##[href^="http://bit.ly"]

! https://github.com/NanoMeow/QuickReports/issues/1433
mousecity.com##.banner-box-squareb
mousecity.com##.banner-box

! https://github.com/uBlockOrigin/uAssets/issues/13918
proplanta.de##+js(nostif, /$|adBlock/)

! https://github.com/NanoMeow/QuickReports/issues/1435
@@||hydrogenassociation.org^$ghide
hydrogenassociation.org##+js(nostif, ads)

! https://github.com/NanoMeow/QuickReports/issues/1436
@@||paraphrasing-tool.com^$script,1p

! https://github.com/NanoMeow/QuickReports/issues/1438
beautypackaging.com##+js(aopw, adblockerpopup)

! https://github.com/uBlockOrigin/uAssets/issues/5893
uptomega.*##+js(nano-stb, seconds)
*$3p,denyallow=bootstrapcdn.com|cloudflare.net|fontawesome.com|hwcdn.net|jquery.com|uptomega.com,domain=uptomega.*
uptomega.*##.ads

! https://forums.lanik.us/viewtopic.php?f=62&t=43212
@@||vtpii.com^$ghide

! https://github.com/AdguardTeam/AdguardFilters/issues/36007
*$image,domain=grafixfather.com,redirect-rule=1x1.gif
@@||grafixfather.com^$ghide
grafixfather.com##ins.adsbygoogle

! https://github.com/AdguardTeam/AdguardFilters/issues/35953
@@||league-funny.com^$ghide
league-funny.com##[id^="div-gpt-ad-"]

! https://github.com/AdguardTeam/AdguardFilters/issues/35930
@@||vacation-et.work^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5901
hotgameplus.com##+js(aopw, downloadJSAtOnload)

! https://github.com/NanoMeow/QuickReports/issues/1450
puhutv.com##+js(aopw, adblockCheck)

! https://github.com/uBlockOrigin/uAssets/issues/5917
megavideo.*##+js(nowoif)
*$script,3p,denyallow=cloudflare.com|disqus.com|fastlylb.net|google.com|googleapis.com|gstatic.com|hwcdn.net|jquery.com|unpkg.com,domain=megavideo.*
uwatchfree.*,hydrax.*##+js(aeld, , _0x)
uwatchfree.*##[href*="deceittoured.com"]
uwatchfree.*##.hd-links
uwatchfree.*##center

! https://github.com/uBlockOrigin/uAssets/issues/5918
! watch4hd. net (ex .com)
watch4hd.*##+js(aopr, open)
watch4hd.*##.btn-block.btn

! altadefinizione .cloud anti adb
||altadefinizone.*^$popup,3p

! https://www.camp-firefox.de/forum/thema/111753-%C2%B5block-origin-ad-blocker-diskussionsthread/?postID=1118918#post1118918
*$popunder,3p,domain=alemannia-aachen.de
alemannia-aachen.de###grid-image-head
alemannia-aachen.de##.b-error
||hitadsmedia.com^$3p

! https://github.com/uBlockOrigin/uAssets/issues/5926
5movies.*##+js(aopr, mm)
5movies.*###cookiedata
5movies.*##.btn-lg
5movies.*###content-embed:style(display: block!important)
5movies.*##.streamaly
5movies.*##.les-title:has-text(HD)
1movietv.com##li.uk-active:remove()
||affforce.com^$doc,popup

! https://github.com/uBlockOrigin/uAssets/issues/5926
01fmovies.com##+js(aopr, AaDetector)
01fmovies.com##+js(aeld, DOMContentLoaded, checkVPN)
||01fmovies.com/mmmasdfl-asd$xhr,1p
01fmovies.com##[src^="/addons/"]
01fmovies.com##.jw-logo
01fmovies.com##.ico.close

! https://github.com/uBlockOrigin/uAssets/issues/5928
! https://github.com/uBlockOrigin/uAssets/issues/5932
||autotracer.org/cnc/?*=rightcol$xhr,1p
||vectorization.org/cnc/?*=rightcol$xhr,1p

! https://github.com/NanoMeow/QuickReports/issues/1474
oranhightech.com##+js(aopw, cancelAdBlocker)

! https://github.com/NanoMeow/QuickReports/issues/1475
! https://github.com/NanoMeow/QuickReports/issues/1686
! https://github.com/NanoAdblocker/NanoFilters/issues/426
freetutorialsus.com##+js(set, adsbygoogle.loaded, true)
@@||freetutorialsus.com^$ghide
freetutorialsus.com##.code-block-1.code-block > div
||googlesyndication.com/pagead/$script,redirect-rule=noopjs,domain=freetutorialsus.com
freetutorialsus.com###babasbmsgx
freetutorialsus.com##ins.adsbygoogle
freetutorials.*##+js(nosiif, visibility, 1000)

! https://github.com/NanoMeow/QuickReports/issues/1480
@@||nosey.com^$ghide
nosey.com##.unreel-player-overlay

! https://github.com/uBlockOrigin/uAssets/issues/5937
! https://github.com/uBlockOrigin/uAssets/issues/5938
tusfiles.com##+js(aopw, Fingerprint2)
tusfiles.com##+js(nowoif)
||tusfiles.com/sw.js$script,1p
gdtot.*,tusfiles.com##+js(acs, document.createElement, 'script')
*$3p,denyallow=cloudflare.com|fastly.net|support.send.cm|tusfiles.net|zencdn.net,domain=tusfiles.com
gdtot.*##+js(aopr, open)

! https://github.com/NanoMeow/QuickReports/issues/1481
@@||lapresse.ca^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5945
lirik3satu.blogspot.com##+js(aeld, load, 2000)

! mangovideo's sites
adultdvdparadise.com,freeomovie.info,fullxxxmovies.me,mangoparody.com,mangoporn.co,netflixporno.net,pandamovie.*,pandamovies.me,playpornfree.xyz,pornkino.cc,pornwatch.ws,speedporn.*,watchfreexxx.pw,watchpornfree.*,watchxxxfree.pw,xopenload.pw,xtapes.me,xxxmoviestream.xyz,xxxparodyhd.net,xxxscenes.net,xxxstream.me,youwatchporn.com##+js(aopr, exoNoExternalUI38djdkjDDJsio96)
adultdvdparadise.com,freeomovie.info,fullxxxmovies.me,mangoparody.com,mangoporn.co,netflixporno.net,pandamovie.*,pandamovies.me,playpornfree.xyz,pornkino.cc,pornwatch.ws,speedporn.*,watchfreexxx.pw,watchpornfree.*,watchxxxfree.pw,xopenload.pw,xtapes.me,xxxmoviestream.xyz,xxxparodyhd.net,xxxscenes.net,xxxstream.me,youwatchporn.com##+js(nowoif)
pandamovie.*,pandamovies.me,pornkino.cc,speedporn.*,youwatchporn.com###tracking-url
pornwatch.ws,xopenload.pw,xxxparodyhd.net,xxxstream.me##.btn-lg.btn-block.btn
pandamovie.*,pandamovies.me,pornkino.cc,speedporn.*,xxxscenes.net,youwatchporn.com##.video-block-happy-absolute:upward(.order-1)
pandamovie.*,pandamovies.me,pornkino.cc,speedporn.*,xxxscenes.net,youwatchporn.com##.happy-player-beside, .happy-section, .widget_execphp:has-text(/Advertisement|ExoLoader/)

! serialy.bombuj.tv | .si anti adb
! https://github.com/uBlockOrigin/uAssets/issues/22253
@@||bombuj.*^$ghide
bombuj.*##.ad_banner
bombuj.*##[id*="ekla"]
bombuj.*##style:has-text(blink_me_ad):upward(2)
bombuj.*##[href][target="_blank"]
||wurfl.io/wurfl.js$script,3p
waaaw.*,waaw1.*##+js(aopr, doSecondPop)
waaaw.*,waaw.*,waaw1.*##+js(aopr, BetterJsPop)
/cdn-cgi/trace$xhr,domain=waaw.*|waaaw.*
bombuj.*##+js(no-fetch-if, ads)
bombuj.*##+js(nobab)

! https://github.com/uBlockOrigin/uAssets/issues/5946
gamefront.com##+js(acs, $, AdBlock)
gamefront.com##+js(nano-stb, , 10000)

! https://github.com/uBlockOrigin/uAssets/issues/6339
! https://github.com/uBlockOrigin/uAssets/issues/8700
! https://github.com/uBlockOrigin/uAssets/issues/19428
!#if env_chromium
washingtonpost.com##+js(acs, Promise, 'overlay')
washingtonpost.com##+js(acs, document.createElement, 'overlay')
washingtonpost.com##+js(rmnt, script, /\badblock\b/)
!#endif
washingtonpost.com##.remainder-content .db-ns.dn
washingtonpost.com##html[style="overflow: hidden;"]:style(overflow: auto !important;)
washingtonpost.com##.outbrain-wrapper
washingtonpost.com##.bb.pt-0
washingtonpost.com##div.grey-bg
washingtonpost.com##section > div:has-text(/^AD$/)
washingtonpost.com##:xpath('//*[(text()="AD")]/..')
washingtonpost.com##.w-100:has-text(Advertisement)
! https://github.com/uBlockOrigin/uAssets/issues/23379
washingtonpost.com##[data-testid="article-body-card"]:has(> [data-qa="article-body-ad"])
! https://github.com/uBlockOrigin/uAssets/issues/9185#issuecomment-847835587
!#if env_mobile
washingtonpost.com##div.mb-lg.mt-lg.pb-lg.pt-lg.bc-gray-lighter.bh.b.justify-center.items-center.flex.dn-hp-sm-to-mx
washingtonpost.com###mobile-footer-ad-wrapper
!#endif

! https://www.reddit.com/r/uBlockOrigin/comments/ccbpn2/
! https://github.com/uBlockOrigin/uAssets/issues/15427
rawstory.com##+js(aopr, setNptTechAdblockerCookie)
@@||rawstory.com^$ghide
rawstory.com##.rs_ad_block
rawstory.com##.amp-unresolved
rawstory.com##.proper-ad-unit
rawstory.com##.alt_ad_block
rawstory.com##.connatix-holder
rawstory.com##ins.adsbygoogle
rawstory.com##[class^="mgid_"]
rawstory.com###rc-widget-d9572e
rawstory.com##[id^="spink_appeal_box"]

! https://github.com/uBlockOrigin/uAssets/issues/5951
gonzoporn.cc,onlinexxx.cc,tvporn.cc##+js(acs, decodeURI, decodeURIComponent)
gonzoporn.cc,onlinexxx.cc,tvporn.cc##+js(aopr, exoJsPop101)

! https://github.com/NanoMeow/QuickReports/issues/1492
kimochi.info##+js(nosiif, visibility, 1000)

! https://github.com/NanoMeow/QuickReports/issues/1495
! https://github.com/NanoMeow/QuickReports/issues/2510
*$script,redirect-rule=noopjs,domain=linternaute.com
@@||googletagmanager.com/gtm.js$script,domain=linternaute.com

! https://github.com/AdguardTeam/AdguardFilters/issues/36733
samash.com##+js(acs, document.getElementById, for-variations)

! https://github.com/NanoMeow/QuickReports/issues/1511
@@||blindhypnosis.com/adsbygoogle.js$script,1p

! https://github.com/NanoMeow/QuickReports/issues/1515
godtube.com##+js(aopr, googletag)

! https://github.com/NanoMeow/QuickReports/issues/1518
||googlesyndication.com/pagead/js/adsbygoogle.js$xhr,redirect=noopjs,domain=rollingstone.it

! https://github.com/uBlockOrigin/uAssets/issues/5971
ftopx.com##+js(aopr, exoJsPop101)
ftopx.com##+js(aopr, ExoLoader.addZone)
ftopx.com##+js(aopr, loadTool)

! https://github.com/NanoMeow/QuickReports/issues/1522
@@||ifc.com^$ghide

! https://github.com/easylist/easylist/issues/3796
! https://github.com/uBlockOrigin/uAssets/issues/14168
! https://github.com/uBlockOrigin/uAssets/issues/14239
@@||fwmrm.net/ad/*$xhr,domain=uktvplay.co.uk|uktvplay.uktv.co.uk
||cdn.http.anno.channel4.com/m/1/$media,domain=uktvplay.uktv.co.uk
! https://github.com/uBlockOrigin/uAssets/issues/15582
uktvplay.co.uk##+js(no-xhr-if, fwmrm.net)
! https://github.com/uBlockOrigin/uAssets/issues/22358
uktvplay.co.uk##+js(no-fetch-if, fwmrm.net)

! https://github.com/NanoMeow/QuickReports/issues/1529
techhx.com##+js(set, google_jobrunner, true)

! https://www.reddit.com/r/uBlockOrigin/comments/cf1y5b/unable_to_block_these_adverts_myselfredirect_to/
1movietv.com##+js(refresh-defuser)
1movietv.com##[target="_blank"][href$=".html"]
||ekdj30.com^

! https://github.com/NanoAdblocker/NanoFilters/issues/373
vidstream.*##+js(nowoif, !api?call=, 10, obj)
||psaiceex.net^

! https://github.com/NanoMeow/QuickReports/issues/1538
watchgameofthrones.*##+js(aopr, AaDetector)
watchgameofthrones.*##+js(nobab)
watchgameofthrones.*###keeper2

! https://github.com/uBlockOrigin/uAssets/issues/5987
! https://github.com/uBlockOrigin/uAssets/issues/17477
mad4wheels.com##+js(nostif, adsbygoogle)
mad4wheels.com##+js(aopw, adblock)

! https://github.com/NanoMeow/QuickReports/issues/1543
dailylocal.com##+js(set, CnnXt.Event.fire, noopFunc)

! marketmovers.it anti adb
marketmovers.it##+js(aeld, load, 2000)
marketmovers.it##^script:has-text(google_ad_client)

! https://github.com/NanoMeow/QuickReports/issues/1545
gsurl.*##+js(aeld, mousedown, preventDefault)
||iz682noju02ye5.com^$3p

! https://github.com/uBlockOrigin/uAssets/issues/5994
northern-scot.co.uk##+js(aopr, CatapultTools)
northern-scot.co.uk##.MPU
northern-scot.co.uk##.TaboolaSide

! https://github.com/NanoAdblocker/NanoFilters/issues/378
cnbc.com##+js(set, cnbc.canShowAds, true)
cnbc.com##[class^="CreditCardCalloutWildcard-styles-select"]:has([href*="/?lid="])

! https://github.com/uBlockOrigin/uAssets/issues/12328
! allporncomic.com anti adb popups
allporncomic.com##+js(aopw, ExoSupport)
allporncomic.com##+js(aopr, exoJsPop101)
allporncomic.com##.ad
allporncomic.com##iframe
*$script,3p,domain=allporncomic.com,denyallow=cloudflare.com

! https://github.com/uBlockOrigin/uAssets/issues/5995
! https://github.com/uBlockOrigin/uAssets/issues/6054
! https://github.com/uBlockOrigin/uAssets/issues/6349
||pmdipads-a.akamaihd.net^$media,redirect=noopmp3-0.1s

! https://github.com/NanoMeow/QuickReports/issues/1557
@@||reactgo.com^$ghide
reactgo.com##ins.adsbygoogle

! pharmaguideline.com anti adb
pharmaguideline.com##+js(aeld, load, 2000)

! https://github.com/NanoMeow/QuickReports/issues/1565
puzzles.msn.com##+js(set, Adv_ab, false)
puzzles.msn.com##+js(nano-sib)
@@||puzzles.msn.com^$ghide
@@||cdn.arkadiumhosted.com/advertisement/*/video-ads.js$script,domain=puzzles.msn.com
@@||cdn.arkadiumhosted.com/advertisement/*/display-ads.js$script,domain=puzzles.msn.com
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,3p,domain=puzzles.msn.com
puzzles.msn.com##[class*="displayAd"], .ark-ad-message

! https://github.com/uBlockOrigin/uAssets/issues/5988
||videorolls.row.aiv-cdn.net/*.mp4$media,redirect=noopmp3-0.1s,domain=amazon.com
! https://github.com/uBlockOrigin/uAssets/issues/14512
! https://www.reddit.com/r/uBlockOrigin/comments/14ftp7a/
! https://www.reddit.com/r/uBlockOrigin/comments/1ahd08o/amazon_prime_freevee_with_ads_showing_ads_never/
www.amazon.co.jp,www.amazon.co.uk,www.amazon.com,www.amazon.de,www.primevideo.com##+js(json-prune, cuepointPlaylist)
www.amazon.co.jp,www.amazon.co.uk,www.amazon.com,www.amazon.de,www.primevideo.com##+js(xml-prune, xpath(//*[name()="Period"][.//*[@value="Ad"]] | //*[name()="Period"]/@start), [value="Ad"], .mpd)

! https://github.com/NanoMeow/QuickReports/issues/1570
@@||novelgo.id^$ghide
novelgo.id##ins.adsbygoogle

! https://github.com/NanoMeow/QuickReports/issues/1576
lyricsongation.com##+js(nobab)

! https://github.com/NanoMeow/QuickReports/issues/1578
@@||finalboss.io^$ghide
finalboss.io##ins.adsbygoogle

! https://github.com/uBlockOrigin/uAssets/issues/5140#issuecomment-515653809
vev.*,vidop.*##+js(aeld, /^(?:click|mousedown|mouseup)$/, di())
vev.*,vidop.*,vidup.*##+js(set, console.clear, trueFunc)
vev.*,vidup.*##+js(nowoif, /^/, 1)
@@||vev.*^$ghide
@@||vidop.*^$ghide
@@||vidup.*^$ghide
*$frame,3p,domain=vev.red|vidop.icu|vidup.io
||vev.*/sw.js$script,1p
||vidop.*/sw.js$script,1p
||vidup.*/sw.js$script,1p
*$script,domain=vidup.io,redirect-rule=noopjs
vidup.*##.sponsored-container
vev.*##.vjs-overlay
vev.*##body > div[style="position: fixed; display: block; width: 100%; height: 100%; inset: 0px; background-color: rgba(0, 0, 0, 0); z-index: 300000;"]

! https://github.com/uBlockOrigin/uAssets/issues/6007
okanime.*##+js(acs, $, getElementById)
okanime.*##+js(nowebrtc)
okanime.*##+js(nowoif)
okanime.*###calque

! https://github.com/uBlockOrigin/uAssets/issues/6009
besthugecocks.com##+js(aopr, document.dispatchEvent)

! https://github.com/NanoMeow/QuickReports/issues/1582
pipocamoderna.com.br##+js(aopw, adBlockDetected)

! https://github.com/jspenguin2017/uBlockProtector/issues/1073
textograto.com##+js(nostif, ())

! https://forums.lanik.us/viewtopic.php?p=153254#p153254
rainanime.*##+js(aopr, loadRunative)
rainanime.*##.fake_player

! https://github.com/uBlockOrigin/uAssets/issues/6022
! https://github.com/AdguardTeam/AdguardFilters/issues/117880
shrink.*##+js(aopr, app_vars.force_disable_adblock)
shrink.*##+js(aopr, adBlockDetected)
shrink.*##+js(nowebrtc)
shrink.*##+js(set, blurred, false)
shrink.*##+js(aopr, open)
shrink.*##+js(noeval-if, replace)
shrink.*##center
shrink.*##.banner
@@||shrink.*^$ghide
bigbtc.win##div[style^="width:300px;height:250px"]
@@||onceagain.mooo.com/prebid.js$script,domain=bigbtc.win
bigbtc.win,cryptofun.space##^script:has-text(/block-adb|-0x|adblock/)
!#if !cap_html_filtering
bigbtc.win,cryptofun.space##+js(rmnt, script, /block-adb|-0x|adblock/)
!#endif
@@||bigbtc.win^$ghide
bigbtc.win,cryptofun.space###block-adb-enabled, #block-add-enabled
bigbtc.win,cryptofun.space###main, #ielement:style(display: block !important;)
bigbtc.win##div:has(> div[style] > div[id] > script[src^="//ads.themoneytizer.com"])
@@||dlvid.*/prebid.js$domain=bigbtc.win|shrink.icu

! https://github.com/uBlockOrigin/uAssets/issues/6021
! https://github.com/uBlockOrigin/uAssets/issues/17901
||watson.de/js/tisoomi.js$script,1p
watson.de##[data-ad]

! https://github.com/uBlockOrigin/uAssets/issues/6024
activistpost.com##+js(aopr, XMLHttpRequest)
activistpost.com##+js(aopr, String.fromCharCode)
||activistpost.com^$script,1p
@@||activistpost.com/wp-$script,1p

! https://github.com/NanoMeow/QuickReports/issues/1599
hackedonlinegames.com##+js(nostif, _0x)

! https://github.com/uBlockOrigin/uAssets/issues/1279#issuecomment-517348623
! https://github.com/uBlockOrigin/uAssets/issues/7512
crunchyroll.com##+js(json-prune, value.media.ad_breaks)
crunchyroll.com##+js(nosiif, onAdVideoStart)
crunchyroll.com###template_skin_leaderboard
! https://www.reddit.com/r/uBlockOrigin/comments/15vf9oj/problems_with_crunchyroll/
! https://github.com/easylist/easylist/issues/17104
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect=google-ima.js,domain=crunchyroll.com,important

! https://github.com/uBlockOrigin/uAssets/issues/6029
! https://github.com/uBlockOrigin/uAssets/issues/16049
!*$popunder,3p,domain=spankbang.com
||ersties.com^$3p
||spankbang.*/official/serve_
spankbang.*##+js(nowoif)
spankbang.*##+js(set, chrome, undefined)
spankbang.*##.ttaa2v3
spankbang.*##[id^="interstitial_div"]
spankbang.*##.video-list-with-ads > .video-item[data-id="0"]
spankbang.*##.lv_cm_int_come_on
spankbang.*##.download-promo

! https://github.com/uBlockOrigin/uAssets/issues/6040
@@||g-status.com^$ghide
g-status.com##ins.adsbygoogle
g-status.com##.topadv_placeholder

! https://github.com/NanoMeow/QuickReports/issues/1443
arcadeprehacks.com##+js(acs, Math.random, zonefile)

! https://github.com/NanoMeow/QuickReports/issues/1608
bilasport.net##+js(aopr, pwparams)

! starachowice .eu anti adb
@@||starachowice.eu^$ghide

! iporntv .net popups
iporntv.net##+js(acs, document.createElement, pop)

! https://github.com/NanoMeow/QuickReports/issues/1203#issuecomment-517941828
skeimg.com##+js(nowoif)
||d1k3dpebxhgqjc.cloudfront.net^

! https://github.com/uBlockOrigin/uAssets/issues/6045
readcomicsonline.ru##+js(acs, document.createElement, "script")
@@||readcomicsonline.ru^$ghide

! https://www.reddit.com/r/uBlockOrigin/comments/clzwbg/
yogitimes.com##+js(aopr, fuckAdBlock)

! games4king https://github.com/NanoMeow/QuickReports/issues/19
games4king.com###wrapped-content:style(display:inherit!important)
games4king.com###ava-game_container:style(display:inherit!important)
games4king.com##[id^="leaderboard"]
games4king.com##[class^="ads"]
games4king.com##[href^="https://play.google.com/"]
games4king.com##+js(ra, target)

! other https://github.com/NanoMeow/QuickReports/issues/19
##.wgAdBlockMessage
||cdn.pushcrew.com^$3p

! https://github.com/NanoMeow/QuickReports/issues/1624
4share.vn##+js(nano-stb)
4share.vn##+js(nowoif)

! https://github.com/NanoMeow/QuickReports/issues/121
firefaucet.win##+js(nofab)
firefaucet.win##+js(set, firefaucet, true)
@@||firefaucet.win^$ghide
firefaucet.win##[class^="sticky-ad"]
||cpx-research.com^$3p

! https://github.com/NanoMeow/QuickReports/issues/1627
||adservice.google.*/adsid/integrator.js$xhr,redirect=nooptext,domain=tubia.com

! https://github.com/NanoMeow/QuickReports/issues/1630
odkrywamyzakryte.com##+js(nofab)

! https://github.com/uBlockOrigin/uAssets/issues/6052
xtapes.to##+js(acs, jQuery, popunder)
xtapes.to##+js(aopw, open)
55k.io##+js(set, cRAds, true)

! https://github.com/uBlockOrigin/uAssets/commit/5b3b660a548cc01973ea5fbf6a1a492a20d936e2#commitcomment-34599062
! https://github.com/NanoMeow/QuickReports/issues/1885
0xxx.ws##+js(acs, decodeURI, decodeURIComponent)
0xxx.ws##+js(nowoif)

! gocolumbialions.com anti adb
@@||gocolumbialions.com^$ghide
||gocolumbialions.com/components/js/analytics.js$script,1p,redirect=noopjs

! cle0desktop.blogspot.com anti adb
cle0desktop.blogspot.com##+js(nostif, nextFunction, 2000)
cle0desktop.blogspot.com##+js(aeld, , pop)

! voyageforum.com anti adb
voyageforum.com##+js(nostif, AdBlock)

! wuxiaworld.com anti adb
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=wuxiaworld.com
@@||pubads.g.doubleclick.net/gampad/ads*wuxiaworld.com$xhr,domain=imasdk.googleapis.com

! https://forums.lanik.us/viewtopic.php?f=62&t=34830
g5u.pw##A[href$=".html"][rel="nofollow norefferer noopener"]
! https://github.com/abp-filters/abp-filters-anti-cv/issues/247
g5u.pw##+js(acs, Object.defineProperty, XMLHttpRequest)
||g5u.pw/sw.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/6056
artribune.com##+js(aost, Object, mark)
artribune.com##^script:has-text(window.adsbygoogle)

! https://github.com/NanoMeow/QuickReports/issues/1637
interfans.org##+js(acs, $, AdBlock)
interfans.org##+js(nobab)

! https://github.com/uBlockOrigin/uAssets/issues/470
xclusivejams.*##+js(aopr, decodeURI)
||xclusivejams.*/sw.js$script

! https://www.reddit.com/r/uBlockOrigin/comments/cnj0ex/admiral_adblock_blocker/
! https://github.com/uBlockOrigin/uAssets/issues/13322
prad.de##+js(nostif, stop-scrolling)

! https://github.com/uBlockOrigin/uAssets/issues/6062
juba-get.com##+js(aopr, detectAdBlock)

! https://github.com/uBlockOrigin/uAssets/issues/6060
chatta.it##+js(nostif, Adv)

! https://github.com/uBlockOrigin/uAssets/issues/6063
up-load.io##+js(noeval)
up-load.io##+js(nostif, nextFunction, 2000)
||up-load.io/sw.js$xhr,1p
*$3p,denyallow=cloudflare.net|fontawesome.com|google.com|googleapis.com|gstatic.com|hwcdn.net|jquery.com|up-load.download,domain=up-load.io
up-load.io##.ads

! ketubanjiwa.com anti adb
ketubanjiwa.com##+js(nostif, blockUI, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/6065
direct-link.net,link-to.net,direkt-wissen.com##+js(nano-sib, countdown)
direct-link.net,direkt-wissen.com,link-to.net##+js(nano-sib, web_counter)
direct-link.net,direkt-wissen.com,link-to.net##+js(nano-sib, video_counter)
direct-link.net,link-to.net##+js(nano-stb, notification_state, 12000)
direct-link.net,direkt-wissen.com,link-to.net##+js(set, app.addonIsInstalled, trueFunc)
direct-link.net,direkt-wissen.com##+js(nostif, nextFunction, 2000)
||direct-link.net^$xhr,1p
@@||direct-link.net/*/click$xhr,1p
@@||link-to.net/*/click$xhr,1p
direct-link.net,link-to.net##.redirect-overlay

! https://github.com/uBlockOrigin/uAssets/issues/6067
rlslog.net##+js(aeld, load)
rlslog.net##+js(nowebrtc)

! https://github.com/NanoAdblocker/NanoFilters/issues/388
@@||jwpcdn.com/player/plugins/googima/v/*/googima.js$script,domain=viu.tv

! tf1 .fr
! https://www.reddit.com/r/uBlockOrigin/comments/me8x4e/ublock_detected_again_for_mytf1fr/
@@||tf1.fr^$ghide
||delivery.tf1.fr/pub$media,redirect=noopmp3-0.1s,domain=tf1.fr
||dnl-adv-ssl.tf1.fr/$media,redirect=noopmp3-0.1s,domain=tf1.fr
*$xhr,redirect-rule=nooptext,domain=tf1.fr
tf1.fr##+js(no-fetch-if, adsafeprotected)
@@||footprint.net^$xhr,domain=prod-player.tf1.fr
@@||vendorlist.consensu.org/vendorlist.json$xhr,domain=tf1.fr
@@||cdn.tagcommander.com/cmp-api/cmp.js$script,domain=tf1.fr
||slpubmedias.tf1.fr^$media,1p,redirect=noopmp3-0.1s

! https://github.com/NanoMeow/QuickReports/issues/1653
f1livegp.net##+js(nowebrtc)
f1livegp.net###blockblockA

! safemaru.blogspot.com anti adb
safemaru.blogspot.com##+js(aeld, load, 2000)

! https://github.com/NanoMeow/QuickReports/issues/1661
reverso.net##+js(acs, $, adblock)
reverso.net##.vdahead
reverso.net##.bottom-rca
reverso.net##.wrapperW + .sticky

! https://github.com/uBlockOrigin/uAssets/issues/2285
smutr.com##+js(popads-dummy)
smutr.com##+js(set, flashvars.adv_pre_vast, '')
smutr.com##+js(set, flashvars.popunder_url, undefined)
*$popunder,domain=smutr.com,3p

! yuvutu .com popunder
yuvutu.com##+js(acs, String.prototype.charAt)

! https://github.com/NanoMeow/QuickReports/issues/1664
@@||lnk2.cc^$script,1p
lnk2.cc##+js(aeld, , \)
lnk2.cc##+js(nano-stb)

! https://github.com/uBlockOrigin/uAssets/issues/6075
ucptt.com##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/4885#issuecomment-521199974
||loadshare.org/custom/*$media,redirect=noopmp4-1s,important

! https://github.com/uBlockOrigin/uAssets/issues/6092
! https://github.com/uBlockOrigin/uAssets/issues/14928
! https://github.com/uBlockOrigin/uAssets/issues/17916
kachelmannwetter.com,meteologix.com##.dkpw-billboard-margin
kachelmannwetter.com,meteologix.com,weather.us##.dkpw-billboard-margin-fixed
kachelmannwetter.com##[href="https://pflotsh.com"]
kachelmannwetter.com###meteosafe
meteologix.com##.md-billboard-sp
meteologix.com,weather.us##.mdcss-desktop
kachelmannwetter.com,meteologix.com,weather.us##.kw-ad-right
meteologix.com,weather.us##.gad-billboard-pos
weather.us##.dkpw-abp
@@||meteologix.com^$ghide
@@||weather.us^$ghide
||mairdumont.com^$script,redirect-rule=noopjs,domain=kachelmannwetter.com
||md-nx.com^$script,redirect-rule=noopjs,domain=meteologix.com|weather.us

! https://github.com/uBlockOrigin/uAssets/issues/6081
techperiod.com##+js(set, blockAdBlock, true)

! https://forums.lanik.us/viewtopic.php?f=62&t=43387
4movierulz.*##+js(aeld, , _0x)

! https://github.com/uBlockOrigin/uAssets/issues/6083
losmovies.*##.aPlaceHolder

! sportlemons. net / org popups / ads
sportlemon.*,sportlemons.*,sportlemonx.*##+js(aopr, decodeURI)
sportlemons.*###happyDog
sportlemons.*###lazyCat
sportlemonx.com##.tallstreambanner
||bitcoinsports.org^$3p

! https://github.com/NanoAdblocker/NanoFilters/issues/391
xxx-image.com##+js(aopr, adsBlocked)
xxx-image.com##+js(aopr, open)
xxx-image.com##+js(noeval)
xxx-image.com##+js(aopr, XMLHttpRequest)
xxx-image.com##+js(aopr, Date.prototype.toUTCString)
xxx-image.com##+js(ra, oncontextmenu)
xxx-image.com##.footer-container

! https://www.reddit.com/r/uBlockOrigin/comments/cr5owd/doesnt_work_in_oscobocom_after_searching/
oscobo.com##.banotset:upward(3)

! https://github.com/uBlockOrigin/uAssets/issues/6096
! hulkpop.com -> kpopjjang.com
kpopjjang.com##+js(aopr, decodeURIComponent)
kpopjjang.com##+js(aopr, Base64)

! exe.io shorteners
! https://github.com/uBlockOrigin/uAssets/issues/7574
cuts-url.com,eio.io,exe.io,exe.app,exee.io##+js(aopr, app_vars.force_disable_adblock)
exe.io,exe.app##+js(nowoif)
cuts-url.com,eio.io,exe.app,exee.io##+js(set, blurred, false)
/sw.js$script,1p,domain=eio.io|exe.app|exee.io
exey.io##+js(acs, encodeURIComponent, XMLHttpRequest)
exey.io##+js(set, blurred, false)
eio.io,exee.io,exe.app##+js(aopr, adBlockDetected)
exey.io##+js(acs, disableItToContinue)
@@||exe.app^$ghide
exe.app,eio.io,ufacw.com##+js(no-fetch-if, google)
exe.io,wealthh.xyz##+js(aopr, parcelRequire)
@@||pagead2.googlesyndication.com/pagead/js/adsbygoogle.js$script,domain=exey.io
@@||pagead2.googlesyndication.com/pagead/managed/js/adsense/$script,domain=exey.io
/ad-m.js$script,1p
||lengejoberdak.pro^
||measur-d.com^$3p
exee.io,exe.app##.banner-page > .short
! https://github.com/AdguardTeam/AdguardFilters/issues/111672
skincarie.com##+js(nowoif)
skincarie.com##+js(set, blurred, false)
! https://github.com/uBlockOrigin/uAssets/issues/14725
ufacw.com###wpsafe-generate, #wpsafe-link:style(display: block !important;)
ufacw.com###wpsafe-generate, #wpsafe-link:others()
! https://github.com/AdguardTeam/AdguardFilters/issues/162749
exeo.app##+js(set, blurred, false)

! https://github.com/NanoMeow/QuickReports/issues/3168
nsfw247.to##+js(nostif, mdpDeBlocker)

! https://github.com/uBlockOrigin/uAssets/issues/6102
mzee.com##+js(aopr, performance)

! https://github.com/NanoMeow/QuickReports/issues/1687
@@||idalponse.blogspot.com^$ghide
idalponse.blogspot.com##ins.adsbygoogle

! automobiledimension.com anti adb
automobiledimension.com##.avisdiv

! https://github.com/jspenguin2017/uBlockProtector/issues/1080
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=mysterious-dev.com

! https://github.com/uBlockOrigin/uAssets/issues/6104
daftporn.com##+js(aopr, document.dispatchEvent)
daftporn.com##+js(disable-newtab-links)

! https://github.com/uBlockOrigin/uAssets/issues/6107
bravoerotica.com##+js(aopr, ExoLoader.serve)
bravoerotica.net##+js(set, flashvars.adv_pause_html, '')
bravoerotica.net##+js(set, flashvars.adv_start_html, '')
bravoerotica.net##.place
bravoerotica.net##.table

! https://github.com/uBlockOrigin/uAssets/issues/6111
@@||emu-games.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6106
fullhdxxx.com##+js(aeld, popstate)
fullhdxxx.com##+js(aopr, ExoLoader)
fullhdxxx.com##+js(set, adv, true)
fullhdxxx.com##+js(aopr, btoa)
fullhdxxx.com,viptube.com##+js(nowoif)
fullhdxxx.com###video-slider
! https://github.com/uBlockOrigin/uAssets/issues/6106#issuecomment-528640975
m.viptube.com##+js(aopw, mobilePop)

! https://github.com/uBlockOrigin/uAssets/issues/6113
madchensex.com##+js(aopr, ExoLoader)
madchensex.com###side-spot

! https://github.com/uBlockOrigin/uAssets/issues/6114
erogen.*##+js(aopr, document.dispatchEvent)

! https://github.com/uBlockOrigin/uAssets/issues/1854
xasiat.com##+js(aopr, exoJsPop101)
xasiat.com##+js(aopr, ExoLoader.serve)

! https://github.com/uBlockOrigin/uAssets/issues/6115
||rusexclips.com^$3p

! https://github.com/uBlockOrigin/uAssets/issues/6116
redporno.cz##+js(aopr, ExoLoader.serve)
redporno.cz##.right

! https://github.com/uBlockOrigin/uAssets/issues/6117
vintageporntubes.com##+js(aopr, ExoLoader.serve)
vintageporntubes.com##+js(aeld, getexoloader)
vintageporntubes.com##.VPT_player_ads

! https://github.com/uBlockOrigin/uAssets/issues/6118
italianoxxx.com##+js(aopr, document.dispatchEvent)
||scopateitaliane.it^$3p

! https://github.com/uBlockOrigin/uAssets/issues/6120
collegehdsex.com,lustylist.com##+js(aopr, document.dispatchEvent)

! https://github.com/uBlockOrigin/uAssets/issues/6121
yumstories.com##+js(aopr, document.dispatchEvent)

! https://github.com/uBlockOrigin/uAssets/issues/6122
18-teen-porn.com,69teentube.com,girlshd.xxx,home-xxx-videos.com,orgasmlist.com,teensextube.xxx##+js(aopr, document.dispatchEvent)

! https://github.com/uBlockOrigin/uAssets/issues/6123
xxxvideos247.com##+js(aopr, ExoLoader.serve)

! https://github.com/uBlockOrigin/uAssets/issues/6124
pornyfap.com##+js(aopr, document.dispatchEvent)

! https://github.com/uBlockOrigin/uAssets/issues/6125
young-pussy.com##+js(aopr, ExoLoader.serve)
young-pussy.com###playerOverlay

! https://forums.lanik.us/viewtopic.php?f=62&t=43398
! https://github.com/NanoMeow/QuickReports/issues/3629
! https://github.com/NanoMeow/QuickReports/issues/4367
extremereportbot.com##+js(nostif, /_0x|debug/)
extremereportbot.com##+js(nosiif, /_0x|debug/)
@@||extremereportbot.com^$ghide
*$script,redirect-rule=noopjs,domain=extremereportbot.com
||googleapis.com/discovery/$xhr,domain=extremereportbot.com
@@||pagead2.googlesyndication.com^*/show_ads_impl.js$script,domain=extremereportbot.com
@@||doubleclick.net/pagead/*$frame,domain=extremereportbot.com
@@||googlesyndication.com^$xhr,domain=extremereportbot.com

! https://github.com/NanoMeow/QuickReports/issues/1693
tatsumi-crew.net##+js(nobab)
tatsumi-crew.net###HTML2

! https://github.com/uBlockOrigin/uAssets/issues/6127
your-daily-girl.com##+js(aopr, adtoniq)

! https://github.com/uBlockOrigin/uAssets/issues/6128
nudistube.com##+js(aopr, document.dispatchEvent)

! https://github.com/uBlockOrigin/uAssets/issues/6129
uporno.xxx##+js(aopr, document.dispatchEvent)
uporno.xxx##.banner

! https://github.com/uBlockOrigin/uAssets/issues/6130
ultrateenporn.com##+js(aopr, document.dispatchEvent)

! https://github.com/uBlockOrigin/uAssets/issues/6132
! https://github.com/uBlockOrigin/uAssets/issues/18402
gosexpod.com##+js(aeld, click, my_inter_listen)
gosexpod.com##+js(aopr, document.dispatchEvent)
gosexpod.com##.zzz-ddnotice
gosexpod.com##.content__block[style^="direction"]
gosexpod.com##.video-headline
gosexpod.com##center
gosexpod.com##.natsc
gosexpod.com##.im_outer_x:upward(2)
gosexpod.com##^script:has-text(myreadCookie/)
!#if env_chromium
gosexpod.com##+js(rmnt, script, myreadCookie)
!#endif

! https://github.com/uBlockOrigin/uAssets/issues/6133
al4a.com,grannysex.name,porntb.com,scopateitaliane.it,sexbox.online,teenpornvideo.sex,twatis.com##+js(aopr, document.dispatchEvent)
/dao/dao-fel.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/6137
lonely-mature.com##+js(aopr, EviPopunder)

! https://github.com/uBlockOrigin/uAssets/issues/6143
pornclassic.tube,tubepornclassic.com##+js(acs, adver)
tubepornclassic.com##+js(acs, document.createElement, tcpusher)
tubepornclassic.com##+js(aeld, , window.open)
tubepornclassic.com##+js(aopr, preadvercb)
tubepornclassic.com##+js(nosiif, complete, 50)
tubepornclassic.com##+js(nosiif, document.readyState)
pornclassic.tube,tubepornclassic.com##+js(set, prerollMain, undefined)
*$frame,3p,domain=pornclassic.tube|tubepornclassic.com
*$popunder,3p,domain=pornclassic.tube|tubepornclassic.com
pornclassic.tube,tubepornclassic.com##.content > div > .container + div
pornclassic.tube,tubepornclassic.com##div:has(> a[href^="http://www.theclassicporn.com/"])
pornclassic.tube,tubepornclassic.com##span[style="display:flex !important"] > div:first-child
pornclassic.tube,tubepornclassic.com##.video-page__content > div.left + div[class]:last-child
pornclassic.tube,tubepornclassic.com##div[style="display:flex !important"] > div
pornclassic.tube,tubepornclassic.com##.video-page__player + div[class] > div[class]
pornclassic.tube,tubepornclassic.com##.partners-wrap + div[class]
pornclassic.tube,tubepornclassic.com##section[style="padding: 20px;"]
pornclassic.tube,tubepornclassic.com##div[style="width: 300px; height: 250px;"]

! https://github.com/uBlockOrigin/uAssets/issues/6144
flashingjungle.com##+js(aeld, /^(click|mousedown|mousemove|touchstart|touchend|touchmove)/, system.popunder)
flashingjungle.com##+js(aopr, document.dispatchEvent)
flashingjungle.com##.advertising:upward(2)

! https://github.com/uBlockOrigin/uAssets/issues/6145
pussyspot.net,wildpictures.net##+js(aopr, decodeURI)
pussyspot.net,wildpictures.net##[href^="http://ucam.xxx/"]
pussyspot.net,wildpictures.net##[href^="https://easygamepromo.com/"]

! https://github.com/uBlockOrigin/uAssets/issues/6149
! https://github.com/uBlockOrigin/uAssets/issues/6151
! https://github.com/uBlockOrigin/uAssets/issues/6153
! https://github.com/AdguardTeam/AdguardFilters/issues/70031
! https://github.com/easylist/easylist/issues/6726
! https://github.com/AdguardTeam/AdguardFilters/issues/69868
! https://github.com/AdguardTeam/AdguardFilters/issues/70891
8boobs.com,babesinporn.com,hotstunners.com,mainbabes.com,mysexybabes.com,pleasuregirl.net,rabbitsfun.com,sexybabesz.com,silkengirl.*##+js(aopr, ExoLoader.addZone)
8boobs.com,babesinporn.com,boobgirlz.com,fooxybabes.com,hotstunners.com,jennylist.xyz,jumboporn.xyz,mainbabes.com,mysexybabes.com,nakedbabes.club,pleasuregirl.net,rabbitsfun.com,sexybabesz.com,silkengirl.*,vibraporn.com,zazzybabes.com,zehnporn.com##+js(aopr, loadTool)
8boobs.com,babesinporn.com,bustybloom.com,hotstunners.com,nudebabes.sexy,pleasuregirl.net,rabbitsfun.com,silkengirl.*##+js(aopr, exoNoExternalUI38djdkjDDJsio96)
babesaround.com,dirtyyoungbitches.com,grabpussy.com,join2babes.com,nightdreambabe.com,novoglam.com,novohot.com,novojoy.com,novoporn.com,novostrong.com,pbabes.com,pussystate.com,redpornblog.com,rossoporn.com,sexynakeds.com,thousandbabes.com##+js(aopr, AaDetector)
babesinporn.com##.topbanner
boobgirlz.com##.widget-column:has(> center > [href="https://boobgirlz.com/istripper"])
nakedneighbour.com##.banner:upward(.block)
/sex.gif$domain=epikporn.com|erotichdworld.com|guruofporn.com|jesseporn.xyz|jumboporn.xyz|kendralist.com|steezylist.com
/yep.gif$domain=abellalist.com|doseofporn.com|freyalist.com|lizardporn.com|moozporn.com|zehnporn.com
/flr.js$domain=8boobs.com|angelgals.com|babesexy.com|babesinporn.com|fooxybabes.com|hotbabeswanted.com|hotstunners.com|mainbabes.com|nakedbabes.club|nakedgirlsroom.com|nudebabes.sexy|pleasuregirl.net|rabbitsfun.com|sexybabes.club|sexybabesart.com|silkengirl.*|wantedbabes.com
/images/*/b/*$image,redirect=2x2.png,domain=babesandbitches.net|babesaround.com|babesbang.com|babeuniversum.com|grabpussy.com|join2babes.com|nightdreambabe.com|novojoy.com|novoporn.com|novostrong.com|pbabes.com|pussystate.com|redpornblog.com|rossoporn.com|sexynakeds.com
/images/*/banners/*$image,redirect=2x2.png,domain=100bucksbabes.com|8boobs.com|babeimpact.com|babesandgirls.com|babesaround.com|babesinporn.com|babesmachine.com|bustybloom.com|chickteases.com|decorativemodels.com|dirtyyoungbitches.com|exgirlfriendmarket.com|fooxybabes.com|girlsofdesire.org|glam0ur.com|hotstunners.com|livejasminbabes.net|morazzia.com|nakedneighbour.com|novoglam.com|pleasuregirl.net|rabbitsfun.com|sexyaporno.com|sexykittenporn.com|silkengirl.*|slutsandangels.com|theomegaproject.org|thousandbabes.com|vibraporn.com|wantedbabes.com|wildfanny.com
/istripper/istripper_$image,domain=8boobs.com|babesinporn.com|fooxybabes.com|hotstunners.com|mainbabes.com|pleasuregirl.net|rabbitsfun.com|silkengirl.*|wantedbabes.com
/smallfr/*$frame,domain=babeimpact.com|decorativemodels.com|sexykittenporn.com
/smallfr2/*$frame,domain=babeimpact.com|decorativemodels.com
/\.com\/[_0-9a-zA-Z]+\.jpg$/$image,1p,domain=hottystop.com
||zehnporn.com/img/12221.gif
/gofd_fl.js
babeuniversum.com##.aw
babeuniversum.com##.galleryad
redpornblog.com###ads
nightdreambabe.com##.banner_place
girlsofdesire.org##a[href^="/out"]
silkengirl.com##.spots
hotbabeswanted.com,nakedbabes.club##.deskbanner
100bucksbabes.com,babesandgirls.com,morazzia.com##.vda
babesaround.com,nightdreambabe.com##.section-bustyMedinaq > a[href^="/click/o/"]
novojoy.com##.ownerbanner
pussystate.com##li[style="clear:both;float:none;width:600px;margin:0;overflow:hidden;margin-left:-5px;"]
rabbitsfun.com##.gallery-banner
rabbitsfun.com##.picture-banner
vibraporn.com##.topad
fresh-babes.com###XXXGirls
girlsofdesire.org##div[data-width="600"]
novoporn.com##a[href^="/click/o/"]
sensualgirls.org##a[href^="http://refer.ccbill.com/cgi-bin/clicks.cgi?"]
nudevista.link##.sidebar-bn
nudevista.link##.bnblog

! https://github.com/uBlockOrigin/uAssets/issues/6150
! https://github.com/uBlockOrigin/uAssets/issues/6152
angelgals.com,nakedbabes.club##+js(acs, loadTool, popping)
angelgals.com,nakedbabes.club##+js(aopr, ExoLoader.addZone)
angelgals.com##+js(aeld, getexoloader)

! https://github.com/uBlockOrigin/uAssets/issues/6154
babesexy.com,hotbabeswanted.com,nakedgirlsroom.com,nudebabes.sexy,sexybabes.club,sexybabesart.com##+js(aopr, ExoLoader.addZone)
babesexy.com##+js(aeld, getexoloader)
sexybabes.club##+js(acs, loadTool, popping)
/backend_loader$script

! https://github.com/uBlockOrigin/uAssets/issues/6155
cherrynudes.com##+js(acs, loadTool, popping)
cherrynudes.com##[href^="http://links.verotel.com/"]
cherrynudes.com##[href^="http://www.g4mz.com/"]
hegreartnudes.com##+js(acs, loadTool, popping)
cherrynudes.com##[href^="http://wcrgl.freeadult.games/hit.php"]

! https://github.com/uBlockOrigin/uAssets/issues/8719
1001tracklists.com##+js(aopr, recoverLinks)
1001tracklists.com##+js(ra, class, div.intAdX)
1001tracklists.com##+js(ra, class, div[class^="img"][class$="ad"])
@@||1001tracklists.com^$ghide
@@||1001tracklists.com^$script,1p
*$script,xhr,redirect-rule=noopjs,domain=1001tracklists.com
1001tracklists.com##.adnginRight
1001tracklists.com##div[class=""][style]
1001tracklists.com##+js(alert-buster)
1001tracklists.com##+js(no-fetch-if, method:HEAD)

! https://github.com/uBlockOrigin/uAssets/issues/6157
fetishburg.com##+js(aopr, document.dispatchEvent)
fetishburg.com##div.spot

! https://github.com/uBlockOrigin/uAssets/issues/6159
privateindianmovies.com##+js(aopr, document.dispatchEvent)

! https://github.com/uBlockOrigin/uAssets/issues/6161
homemature.net##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/6162
soyoungteens.com##+js(aopr, document.dispatchEvent)

! https://github.com/uBlockOrigin/uAssets/issues/6163
kingsofteens.com##+js(aopr, ExoLoader.serve)
kingsofteens.com##+js(aopw, base64_decode)
kingsofteens.com##+js(nowoif)
doseofporn.com##+js(acs, loadTool, popping)
kingsofteens.com##.spot

! https://github.com/uBlockOrigin/uAssets/issues/6168
@@||receivetxt.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6170
@@||properhacks.weebly.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/1702
space.tribuntekno.com##+js(aopw, adBlockDetected)

! https://github.com/NanoMeow/QuickReports/issues/1712
flashgirlgames.com,onlinesudoku.games##+js(set, ads, true)
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect-rule=google-ima.js,domain=flashgirlgames.com|onlinesudoku.games

! https://github.com/NanoMeow/QuickReports/issues/1716
otakukan.com##+js(aeld, load, appendChild)
||otakukan.com/sw.js$script,1p
||cdn.jsdelivr.net^*/arlinablock.js$script
@@||otakukan.com^$ghide
otakukan.com##ins.adsbygoogle

! https://github.com/NanoMeow/QuickReports/issues/1718
devdrive.cloud##+js(acs, document.getElementById, undefined)

! https://github.com/NanoMeow/QuickReports/issues/1717
gpxgenerator.com###adBlockDiv
gpxgenerator.com##[href="link.php"]

! https://www.reddit.com/r/uBlockOrigin/comments/cv9ake/can_i_block_a_specific_javascript_function/
@@||aston-martin-club.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6186
linkshub.*##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/6189
@@||javaguides.net^$ghide
javaguides.net##+js(aeld, load, onload)

! https://github.com/uBlockOrigin/uAssets/issues/6193
hentaihere.com##+js(nowoif)
hentaihere.com##[href^="https://goo.gl"]
hentaihere.com##.js-adzone

! https://github.com/NanoAdblocker/NanoFilters/issues/395
@@||zavislak.to^$ghide

! https://github.com/NanoMeow/QuickReports/issues/1731
||adservice.google.com/adsid/integrator.js$script,redirect=noopjs,domain=973espn.com

! https://github.com/NanoMeow/QuickReports/issues/1736
secretsdujeu.com##+js(acs, document.getElementById, adsrefresh)

! https://github.com/NanoMeow/QuickReports/issues/1392
||googlesyndication.com/pagead/$script,redirect=noopjs,domain=iptvdroid1.blogspot.com

! https://github.com/NanoMeow/QuickReports/issues/3098
cruisingearth.com##+js(nostif, show)
@@/wutime$script,1p

! https://github.com/NanoMeow/QuickReports/issues/1738
@@||roanoke.com^$ghide
roanoke.com##.dfp-ad

! https://github.com/uBlockOrigin/uAssets/issues/6207
afilmywap.*,okhatrimaza.*##+js(popads-dummy)
afilmywap.*,okhatrimaza.*##+js(aopr, glxopen)
/1clkn/*$script,3p

! https://github.com/NanoMeow/QuickReports/issues/1232
getintopc.com##+js(nostif, /ai_adb|_0x/)

! https://www.reddit.com/r/uBlockOrigin/comments/o9qoo8/videos_wont_play_on_etonlinecom/
etonline.com##+js(aopr, _sp_._networkListenerData)
etonline.com##+js(set, canRunAds, true)

! metager .org ads on search
metager.org##.result:has(.partnershop-info)

! https://github.com/uBlockOrigin/uAssets/issues/5700
supertelevisionhd.com##+js(aopr, AaDetector)
~chavesnamao.com.br###anuncio

! https://github.com/uBlockOrigin/uAssets/issues/6226
@@||aradramatv.co^$ghide
aradramatv.co##ins.adsbygoogle

! https://github.com/uBlockOrigin/uAssets/issues/6228
@@||teenserie.com/wp-content/plugins/$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/6231
/apu.php?*&zoneid=$important

! https://github.com/AdguardTeam/AdguardFilters/issues/71294
gulf-up.com##+js(aopr, AaDetector)
@@||gulf-up.com^$ghide
gulf-up.com##ins.adsbygoogle
||googlesyndication.com/$script,redirect=noopjs,domain=gulf-up.com

! https://forums.lanik.us/viewtopic.php?f=62&t=43449
keysbrasil.blogspot.com##+js(nostif, nextFunction, 2000)

! https://github.com/NanoAdblocker/NanoFilters/issues/397
@@||fiatclub.eu^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2111
vidia.tv##+js(acs, $, undefined)
vidia.tv##+js(aopr, AaDetector)
@@||vidia.tv^$script,1p
||egyanime.com^$domain=vidia.tv
vidia.tv##+js(nostif, iframe)
vidia.tv##+js(nostif, pop)
||vidia.tv^$csp=frame-src

! https://github.com/uBlockOrigin/uAssets/issues/6236
@@||liveadexchanger.com/a/display.php$script,domain=prem.link

! https://github.com/uBlockOrigin/uAssets/issues/9542
! https://github.com/uBlockOrigin/uAssets/issues/19903#issuecomment-1837748723
multiup.io,multiup.org,multiup.eu##+js(acs, decodeURI, decodeURIComponent)
multiup.io,multiup.org,multiup.eu##+js(nosiif, .submit)
multiup.io##+js(rpnt, script, setInterval)
multiup.io,multiup.org,multiup.eu##.text-center.bg-info
multiup.io,multiup.org,multiup.eu##div.col-md-4:has(> .panel > .panel-footer > a[href^="/download-fast/"][namehost^="UseNet"])
multiup.io,multiup.org,multiup.eu##.mfp-ready
multiup.io,multiup.org,multiup.eu##div.text-center:has(a[class="btn btn-success"][href^="abp:subscribe"])
*$popunder,3p,domain=multiup.io|multiup.org|multiup.eu
||multinews.me^$3p

! https://github.com/uBlockOrigin/uAssets/issues/2015
! https://github.com/uBlockOrigin/uAssets/issues/6242
tmearn.*##+js(aopr, app_vars.force_disable_adblock)
tmearn.*##+js(nowoif)
tmearn.*##+js(set, blurred, false)
cutpaid.com,tmearn.*##+js(aopr, AaDetector)
*$script,3p,denyallow=cloudflare.com|google.com|gstatic.com|recaptcha.net,domain=tmearn.*
||tmearn.com/*sw.js$script,1p
tmearn.*##.banner

! https://github.com/uBlockOrigin/uAssets/issues/6247
godmods.com##+js(aopw, mdp_deblocker)

! https://github.com/uBlockOrigin/uAssets/issues/6249
bilan.ch##+js(aopr, _sp_._networkListenerData)

! https://github.com/NanoMeow/QuickReports/issues/1782
filedown.*##+js(nowoif)
@@||filedown.*^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/3419
mexa.*##+js(acs, document.getElementById, adblockinfo)
mexa.sh##+js(acs, String.fromCharCode, 'shift')
mexa.sh##+js(aopr, eddOptions)
mexa.*##+js(aopw, adBlockDetected)
mexa.sh##+js(aopw, afScript)
mexa.*##+js(aopw, installBtnvar)
*$script,3p,denyallow=google.com|gstatic.com|hcaptcha.com|recaptcha.net,domain=mexa.sh

! https://github.com/NanoMeow/QuickReports/issues/1792
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=spieleklassiker.com
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=spieleklassiker.com
spieleklassiker.com##.banner

! https://github.com/NanoMeow/QuickReports/issues/1802
@@||valueyourmusic.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6269
qoshe.com##+js(nostif, adBlock)
yandexcdn.com##+js(nowoif)
@@||yandexcdn.com^$ghide
@@||yandexcdn.com^$script,1p
yandexcdn.com##a[onclick="openAuc();"]
yandexcdn.com##[href="https://t.me/Russia_Vs_Ukraine_War3"]

! https://github.com/uBlockOrigin/uAssets/issues/6277
*.mp4$media,redirect=noopmp3-0.1s,domain=theweedtube.com

! https://github.com/uBlockOrigin/uAssets/issues/6281
iguarras.com,peliculaspornomega.net##+js(nowoif)
iguarras.com###dimmed
peliculaspornomega.net##.dimmed
! https://github.com/uBlockOrigin/uAssets/issues/6281

! https://github.com/NanoMeow/QuickReports/issues/1814
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=tsforum.pl

! https://github.com/AdguardTeam/AdguardFilters/issues/40255
uploadas.com##+js(aopw, Fingerprint2)

! https://github.com/NanoMeow/QuickReports/issues/1815
@@||video.bestjavporn.com^$ghide
bestjavporn.com,mm9841.cc###flash
bestjavporn.com###player_3x2_container_inner
bestjavporn.com###player-container:has-text(Close ad)
! https://github.com/uBlockOrigin/uAssets/issues/6348
javporn.best##+js(aopr, AaDetector)
javporn.best##+js(aopr, glxopen)
@@||javporn.*^$ghide
@@||av-th.info^$ghide

! https://github.com/NanoMeow/QuickReports/issues/3608
lowellsun.com##+js(nostif, , 1)

! https://github.com/AdguardTeam/AdguardFilters/issues/80902
multifaucet.org##+js(nano-sib, seconds)
multifaucet.org##+js(aopr, adBlockDetected)
@@||multifaucet.org^$ghide
multifaucet.org##.flexbannergroup
multifaucet.org##ins[class][style^="display:inline-block;width:"]

! popups , ads torrentproject .io / cc
||torrentproject.*^$script,frame,1p

! https://github.com/uBlockOrigin/uAssets/issues/6296
nudogram.com##+js(acs, decodeURI, decodeURIComponent)
nudogram.com##+js(aopr, decodeURI)
||leadnote.me^
nudogram.com##.sponsor

! https://github.com/uBlockOrigin/uAssets/issues/6300
gottanut.com##+js(aopr, document.dispatchEvent)

! https://github.com/uBlockOrigin/uAssets/issues/6301
uiporn.com##+js(aopr, document.dispatchEvent)
||uiporn.com/ai/*$script,1p
||uiporn.com/sw.js$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/6302
xcafe.com##+js(aopr, document.dispatchEvent)
xcafe.com##+js(popads-dummy)
xcafe.com##+js(aeld, , bi())
||xcafe.com/js/initsite.js

! https://www.reddit.com/r/uBlockOrigin/comments/mghv7b/no_solution_for_coinlyhub/
@@||coinlyhub.com^$ghide
coinlyhub.com##+js(aopr, open)
coinlyhub.com##+js(set, Fingerprint2, true)
coinlyhub.com##+js(nano-sib, seconds)
coinlyhub.com##+js(aopr, app_vars.force_disable_adblock)
coinlyhub.com##+js(set, blurred, false)
@@||coinlyhub.com^$script,1p
coinlyhub.com##[class^="bmadblock"]
coinlyhub.com##div.highlight
coinlyhub.com##.banner
*$script,redirect-rule=noopjs,domain=coinlyhub.com|cryptotinker.com

! https://github.com/uBlockOrigin/uAssets/issues/6305
zimabdko.com##+js(nowebrtc)

! https://github.com/uBlockOrigin/uAssets/issues/6306
pornoxo.com##+js(popads-dummy)
*$popunder,3p,domain=m.pornoxo.com
||pushpad.xyz^$3p

! https://github.com/uBlockOrigin/uAssets/issues/6789
! https://github.com/uBlockOrigin/uAssets/issues/6981
leechall.*###adBanner:style(height:25px !important;left:-3000px !important;position:absolute !important)
leechall.*##+js(nano-sib)
leechall.com##+js(acs, document.createElement, /l\.parentNode\.insertBefore\(s/)
leechall.*##.text-center.alert-info.alert
@@||leechall.download^$ghide
@@||leechall.download^$script,1p
||digiseller.ru^$3p,domain=leechall.com
*$script,3p,redirect-rule=noopjs,domain=leechall.download|leechall.com
*$script,3p,denyallow=bootstrapcdn.com|cloudflare.com|cloudflare.net|googleapis.com|jsdelivr.net|tawk.to,domain=leechall.*
||hathyneglu.com^

! https://github.com/NanoMeow/QuickReports/issues/1850
||newtoki*.net/*banner$image,1p

! https://github.com/uBlockOrigin/uAssets/issues/6309
kinoz.*##+js(nowebrtc)
kinoz.*##+js(aopr, AaDetector)
kinox.*,kinoz.*##+js(aopr, decodeURI)
||tsyndolls.com^$3p

! https://github.com/NanoMeow/QuickReports/issues/1854
majalahpendidikan.com##+js(aopr, adBlockDetected)

! sombex.com anti adb
sombex.com##+js(nosiif, visibility, 1000)

! https://github.com/uBlockOrigin/uAssets/issues/2745
ultimate-catch.eu##+js(nostif, undefined)

! lampungway .com anti adb
lampungway.com##+js(aopw, adBlockDetected)

! https://github.com/uBlockOrigin/uAssets/issues/6322
movie4me.*##+js(aopr, Math.floor)
||movie4me.*/image/ad-$image
##[href^="//producebreed.com/"]
##[href*="uselnk.com/"]

! https://github.com/NanoMeow/QuickReports/issues/1339
! https://github.com/NanoAdblocker/NanoFilters/issues/546
*$script,3p,denyallow=recaptcha.net|gstatic.com,domain=dglinker.com

! cpopchanelofficial.com anti adb
cpopchanelofficial.com##+js(nostif, check, 1)

! https://github.com/uBlockOrigin/uAssets/issues/8356
! https://www.reddit.com/r/uBlockOrigin/comments/lwtwx8/whitelisting_sites_does_not_work/gpj8cbl/
@@||teemo.gg^$ghide
teemo.gg##.bg-gray-200:style(background: none !important; height: 1px !important; min-height: 1px !important;)

! https://www.reddit.com/r/uBlockOrigin/comments/d6vxzj/the_problem_is_on_the_page/
sochi.camera#@##cams_top_block

! https://github.com/NanoMeow/QuickReports/issues/1970
adsafelink.com##+js(aopr, app_vars.force_disable_adblock)
adsafelink.com##+js(nowoif)
adsafelink.com##+js(set, blurred, false)

! https://www.reddit.com/r/uBlockOrigin/comments/d758gi/blockadblock_detects_ubo_but_only_when_tab_is_in/
@@||ustv247.tv^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2436
avseesee.com##+js(acs, document.getElementById, _banner)
avseesee.com##.textwidget:has(ins)
! https://github.com/NanoMeow/QuickReports/issues/3508
juicywest.com##+js(aopr, __Y)

! https://github.com/uBlockOrigin/uAssets/issues/6329
@@||aii.sh^$ghide
aii.sh##+js(nowoif)
aii.sh##+js(nowebrtc)
aii.sh##+js(set, blurred, false)
aii.sh###link-view > center
||aii.sh/sw$script,1p
aii.sh##[src^="https://i.imgur.com/"]
##.glx-watermark-container

! https://www.reddit.com/r/uBlockOrigin/comments/novm3h/httpkisstvshowto_ublock_stopped_working_today_ad/
! https://www.reddit.com/r/uBlockOrigin/comments/u8iofi/help_with_site_detects_ad_blocker/
kisstvshow.*##+js(acs, $, #divDownload)
kisstvshow.*###hideAds
kisstvshow.*##.ksAds
kisstvshow.*##div[style="width: 620px; margin: 0px auto; overflow: hidden;"]
||kisstvshow.*/api/pop.php$xhr,1p
||ad.kisstvshow.*^
! https://www.reddit.com/r/uBlockOrigin/comments/xa95i0/
||bebi.com^$script,redirect-rule=noopjs,domain=lifestylehack.info

! winit.heatworld.com anti adb
winit.heatworld.com##+js(aopw, showModal)
winit.heatworld.com##.sticky-ad-unit-default
winit.heatworld.com##.sticky-ad-unit-spacer-default

! https://github.com/uBlockOrigin/uAssets/issues/6332
@@||ryuukoi.web.id^$ghide
||i1.wp.com/ryuukoi.web.id/wp-content/uploads/*/ANTIADBLOCK$image

||bitcoinadvertise.net^$3p

! https://github.com/NanoMeow/QuickReports/issues/1896
checkz.net##+js(aopw, console.log)
@@||checkz.net^$ghide
checkz.net##ins.adsbygoogle

! https://github.com/uBlockOrigin/uAssets/issues/10076
@@||pagead2.googlesyndication.com/pagead/js/adsbygoogle.js$script,domain=ff14angler.com
@@||pagead2.googlesyndication.com/pagead/managed/js/adsense/$script,domain=ff14angler.com
@@||g.doubleclick.net/pagead/ads?$frame,domain=ff14angler.com
@@||ff14angler.com^$ghide
ff14angler.com###main > ins.adsbygoogle:style(position: absolute !important; left: -4000px !important;)
ff14angler.com##.side_banner:style(position: absolute !important; left: -4000px !important;)

! https://github.com/NanoMeow/QuickReports/issues/1901
jaiefra.com##+js(aopr, adBlockDetected)

! hotpress.info anti adb
hotpress.info##+js(nostif, nextFunction, 2000)
@@||hotpress.info^$ghide

! mixloads.com anti adb popups
mixloads.com##+js(aopr, AaDetector)
mixloads.com##+js(aeld, load, 2000)
||mixloads.com/sw.js$script,1p

! mangaromance.eu anti adb
mangaromance.eu##+js(aeld, load, 2000)

! onlineproxy. eu popups
||onlineproxy.eu^$csp=default-src 'self' 'unsafe-inline' *.googleapis.com *.google.com *.gstatic.com *.google-analytics.com

! https://github.com/AdguardTeam/AdguardFilters/issues/41057
@@||coachmag.co.uk^$ghide

! https://github.com/NanoMeow/QuickReports/issues/1915
||doubleclick.net/pagead/id$xhr,redirect=nooptext,domain=windowsreport.com

! https://github.com/NanoMeow/QuickReports/issues/1925
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=collegestash.com
||googlesyndication.com/pagead/js/adsbygoogle.js$xhr,redirect=noopjs,domain=collegestash.com

! https://github.com/NanoMeow/QuickReports/issues/1926
buffstream.to,buffstreamz.com##+js(acs, $, modal)
buffstreamz.com##+js(nowebrtc)
buffstream.to,buffstreamz.com##.btn
buffstreamz.com##a[href*="//my-sports.club"]

##[href^="http://referrer.website/"]

! https://github.com/NanoMeow/QuickReports/issues/1929
@@||thisismoney.co.uk^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6351
! https://github.com/uBlockOrigin/uAssets/issues/8367
megagames.com##+js(acs, jQuery, fuckAdBlock)

! https://github.com/uBlockOrigin/uAssets/issues/6355
@@||chiaseapk.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6356
@@||csrevo.com^$ghide
@@||phoenixkiller.com/assets/js/ad-provider.js|$script
csrevo.com###HTML3
||i.imgur.com/FYROU5n.gif$image,3p

! https://github.com/uBlockOrigin/uAssets/issues/6357
@@||designoptimal.com^$ghide
designoptimal.com##ins.adsbygoogle

! almohtarif-tech .net anti adb
almohtarif-tech.net##+js(aeld, load, onload)

! https://www.reddit.com/r/uBlockOrigin/comments/dagme6/video_ads_are_showing_up_on_pietsmietde/
*$media,redirect=noopmp3-0.1s,domain=pietsmiet.de
@@||pietcdn.de/pietcast/*$media,domain=pietsmiet.de

! https://github.com/uBlockOrigin/uAssets/issues/6360
vidbom.com,zimabdko.com##+js(aopr, open)

! https://www.reddit.com/r/uBlockOrigin/comments/dahz6b/nsfw_czechvideoorg_owner_of_this_video_doesnot/
czxxx.org##+js(aopr, adBlockDetected)
czechvideo.org##+js(nowoif)

! https://github.com/NanoMeow/QuickReports/issues/3038
creditcardgenerator.com##+js(nostif, adsBlocked)

! interssh.com anti adb
interssh.com##+js(aeld, load, 2000)

! https://forums.lanik.us/viewtopic.php?p=150115#p150115
ancensored.com##+js(aopr, AaDetector)

! https://www.reddit.com/r/uBlockOrigin/comments/d99did/blue_banner_on_the_washington_post/f1uyoin/
elpasotimes.com##+js(aopr, _sp_.mms.startMsg)

! https://github.com/jspenguin2017/uBlockProtector/issues/1084
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=ktab3ndna.com

! sexo5k .com exo ads
sexo5k.com##+js(rmnt, script, ExoLoader)

! gfsvideos .com exo + popups
gfsvideos.com##+js(aopr, document.dispatchEvent)
gfsvideos.com##+js(nowoif)

! home-made-videos .com exo
home-made-videos.com##+js(aopr, document.dispatchEvent)
home-made-videos.com##+js(set, dclm_ajax_var.disclaimer_redirect_url, '')
home-made-videos.com###dclm_modal_content
home-made-videos.com###dclm_modal_screen

! https://github.com/uBlockOrigin/uAssets/issues/6827
shameless.com##+js(aopr, ExoLoader.addZone)
shameless.com##+js(aopr, exoNoExternalUI38djdkjDDJsio96)
shameless.com##+js(aopr, jwplayer.utils.Timer)
shameless.com##.active.pause-gift

! https://github.com/NanoMeow/QuickReports/issues/1952
electriciansforums.net##+js(nostif, adb)

! https://github.com/NanoMeow/QuickReports/issues/1954
nmn900.net##+js(acs, document.getElementById, undefined)

! https://github.com/NanoMeow/QuickReports/issues/1957
@@||realmadryt.pl^$xhr,1p

! https://github.com/uBlockOrigin/uAssets/issues/6377
@@||speakingtree.in^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6380
coinhub.pw##+js(aopw, adBlockDetected)
coinhub.pw##body > center

! https://github.com/uBlockOrigin/uAssets/issues/6374
the-voice-of-germany.de##+js(aopr, $ADP)
||zomap.de/*&expires=$script,domain=the-voice-of-germany.*
||cdn.zomap.de^$media,redirect=noopmp3-0.1s,domain=the-voice-of-germany.*

! dpstream .bz popups
dpstream.*##+js(set, load_pop_power, noopFunc)
dpstream.*##+js(ra, href, #clickfakeplayer)
dpstream.*##.movie-aye

! https://github.com/NanoMeow/QuickReports/issues/3228
unfriend-app.com##+js(nobab)
@@||unfriend-app.com^$ghide
*$script,redirect-rule=noopjs,domain=unfriend-app.com

! https://github.com/NanoMeow/QuickReports/issues/1964
adn.com##+js(aopr, MG2Loader)

! https://github.com/NanoMeow/QuickReports/issues/1965
@@||jbzdy.cc^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6385
technews.tw##+js(acs, jQuery, adblock)
technews.tw##.AD_wrapper

! https://github.com/uBlockOrigin/uAssets/issues/2756
shon.xyz##+js(nano-sib)
shon.xyz##+js(aopw, Fingerprint2)
shon.xyz##+js(ra, onclick, [onclick^="window.open"])
shon.xyz##+js(popads-dummy)
||shon.xyz^$csp=script-src 'self' 'unsafe-inline' *.gstatic.com *.google.com *.googletagmanager.com *.googleapis.com;frame-src 'self' *.google.com;connect-src 'self'
?zoneid=*&ab=1|$script,3p

! https://github.com/uBlockOrigin/uAssets/issues/6393
turkleech.com##+js(nostif, nextFunction, 2000)

! https://github.com/NanoMeow/QuickReports/issues/1962#issuecomment-538591750
gamearter.com##+js(nano-sib,/SplashScreen|BannerAd/)
gamearter.com##+js(nano-stb,/SplashScreen|BannerAd/)
gamearter.com##div[id^="ga_sp_"]

! https://github.com/NanoMeow/QuickReports/issues/1961
mpg.football##+js(set, ads, true)

! https://github.com/NanoMeow/QuickReports/issues/1984
@@||animevietsub.tv^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6402
spokesman.com##+js(aopr, Connext)

! https://github.com/uBlockOrigin/uAssets/issues/6404
medihelp.life##+js(aopw, ai_adb_overlay)

! https://www.reddit.com/r/uBlockOrigin/comments/ddrhoq/blockadblock_on_a_website/f2m9oa4/
watchmynameisearl.com##+js(nobab)
watchmynameisearl.com##+js(aopr, AaDetector)

! https://github.com/uBlockOrigin/uAssets/issues/6406
@@||guiamuriae.com.br^$ghide
||guiamuriae.com.br/*.gif$image
guiamuriae.com.br##.theiaStickySidebar
guiamuriae.com.br##ins.adsbygoogle
guiamuriae.com.br##.e3lan-top

! https://github.com/uBlockOrigin/uAssets/issues/6409
verprogramasonline.com##+js(acs, atob, decodeURI)
verprogramasonline.com##+js(aopr, mdp_deblocker)
verprogramasonline.com##.td-ss-main-sidebar

! https://github.com/NanoMeow/QuickReports/issues/1991
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=viu.tv
@@||entitlements.jwplayer.com/$xhr,domain=viu.tv

||d2wpknqle9nuv8.cloudfront.net^

! https://forums.lanik.us/viewtopic.php?p=150260#p150260
ffmovies.*##+js(acs, String.fromCharCode, break;)
ffmovies.*##+js(nowoif)

! https://github.com/NanoMeow/QuickReports/issues/1993
thisvid.com##+js(aeld, /^(?:load|click)$/, popMagic)

! https://github.com/uBlockOrigin/uAssets/issues/21821
hl-live.de##+js(nostif, nextFunction)
hl-live.de###swlad

! flsaudio.com anti adb
flsaudio.com##.adsbygoogle:upward(.widget)
flsaudio.com##.altumcode-coupon-content
||flsaudio.com^$image,redirect-rule=1x1.gif,1p

! https://github.com/NanoMeow/QuickReports/issues/1997
@@||aargauerzeitung.ch^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6414
cloudapps.herokuapp.com##+js(set, gadb, false)

! imagetwist .com popunders
imagetwist.com##+js(acs, document.getElementsByTagName, "script")
imagehaha.com,imagenpic.com,imageshimage.com,imagetwist.com##+js(aeld, , checkTarget)
imagehaha.com,imagenpic.com,imageshimage.com,imagetwist.com,picshick.com###rang2
imagehaha.com,imagenpic.com,imageshimage.com,imagetwist.com##video
imagehaha.com##+js(nowoif)

! https://github.com/NanoMeow/QuickReports/issues/2011
@@||watchsuitsonline.net^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2012
produsat.com##+js(set, adBlockDetected, true)

! https://www.reddit.com/r/uBlockOrigin/comments/dg2exo/jw_player_doesnt_load_with_ublock_origin_on/
*/gfp_video_ads/*$media,redirect=noopmp3-0.1s,domain=digisport.ro
||gvt1.com^$media,redirect=noopmp3-0.1s,domain=digisport.ro
@@||scdn.cxense.com/cx.js$script,domain=digisport.ro
@@||entitlements.jwplayer.com^$xhr,domain=digisport.ro
@@||doubleclick.net/gampad/live/ads*digisport.ro$xhr,domain=imasdk.googleapis.com
@@||jwpcdn.com/player/$script,domain=digisport.ro

! https://github.com/NanoMeow/QuickReports/issues/2020
@@||how2electronics.com^$ghide
how2electronics.com##.adsbygoogle:style(max-height: 1px !important;)

! freesoftpdfdownload.blogspot.com anti adb popups
freesoftpdfdownload.blogspot.com##+js(acs, decodeURI, decodeURIComponent)
freesoftpdfdownload.blogspot.com##+js(aeld, load, 2000)
||wap4dollar.com^$3p

! https://forums.lanik.us/viewtopic.php?f=62&t=43689
@@||upclips.*^$ghide
upclips.*##[id*="ScriptRoot"]
||upclips.online*^$csp=script-src 'self' 'unsafe-inline' blob: *.cloudflare.com *.google-analytics.com *.googleapis.com *.gstatic.com *.radiantmediatechs.com

! https://github.com/uBlockOrigin/uAssets/issues/6024#issuecomment-541228625
||mediapass.com^$3p

! https://github.com/NanoMeow/QuickReports/issues/2027
officegamespot.com##+js(acs, Math.round, zonefile)

! tamilyogi. cool popups vidorg.net anti adb
tamilyogi.*##+js(acs, String.fromCharCode, 'shift')
@@||vidorg.net^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2029
@@||tvpc.us^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2031
siacoinfaucet.info##+js(acs, document.getElementById, adsBlocked)

! https://github.com/AdguardTeam/AdguardFilters/issues/57396
parzibyte.me##+js(acs, jQuery, ai_adb)

! https://github.com/NanoMeow/QuickReports/issues/2032
livingstondaily.com##+js(aopr, _sp_)

! https://www.reddit.com/r/uBlockOrigin/comments/m7n8wj/not_working_on_bluemediafilescom/
! https://github.com/AdguardTeam/AdguardFilters/issues/129409
! https://github.com/uBlockOrigin/uAssets/issues/13085
bluemediafiles.*##+js(aopr, open)
bluemediafiles.*##+js(nano-sib, i--)
bluemediafiles.*##+js(set, Time_Start, 0)
@@||bluemediafiles.*^$ghide
*$image,redirect-rule=32x32.png,domain=bluemediafiles.*
/script/su.js$script,3p

! https://github.com/NanoMeow/QuickReports/issues/2036
nilopolisonline.com.br##+js(nostif, blocker)

! https://github.com/NanoMeow/QuickReports/issues/2037
mesquitaonline.com##+js(nostif, blocker)

! https://github.com/NanoMeow/QuickReports/issues/2039
@@||nohat.*^$script,domain=nohat.cc

! https://www.reddit.com/r/uBlockOrigin/comments/didrrg/you_can_add_filters/
tbib.org##+js(aopr, document.dispatchEvent)

greensboro.com##body:style(overflow: auto !important)
greensboro.com##.modal, .modal-backdrop

! https://github.com/uBlockOrigin/uAssets/issues/6439
@@||shirainime.com^$ghide

! espn1420.com/listen-live anti adb
||adservice.google.com/adsid/integrator.js$script,redirect=noopjs,domain=espn1420.com

! https://github.com/NanoMeow/QuickReports/issues/2054
@@||dias-uteis.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6446
fullxxxmovies.net##+js(aopr, open)

! https://github.com/uBlockOrigin/uAssets/issues/10130
socialgirls.im##+js(nostif, aswift_)
@@||socialgirls.im^$ghide

! https://github.com/gorhill/uBO-Extra/issues/123
closermag.fr##+js(acs, document.head.appendChild, ='\x)
@@||closermag.fr^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2067
@@||watchcalifornicationonline.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6450
! https://www.reddit.com/r/uBlockOrigin/comments/d91jgm/need_help_with_a_specific_anti_adblocker_message/
@@||kupujemprodajem.com^$ghide
kupujemprodajem.com##.bnrBox

! https://www.reddit.com/r/uBlockOrigin/comments/djxvm8/i_need_a_filter_for_realclearpolitics/
||evolok.net/acd/api/*/authorize/*adblock$xhr,3p

! https://github.com/NanoMeow/QuickReports/issues/2076
@@||gagetmatome.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2077
@@||animetake*.*^$script,1p
@@||animetake*.*^$ghide
animetake27.*##.gads

! https://github.com/NanoMeow/QuickReports/issues/2080
@@||s0ft4pc.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2081
lavozdegalicia.es##+js(aeld, load, adb)

! https://www.reddit.com/r/uBlockOrigin/comments/dk7weu/ptc_site/
@@||neobux.com^$script,css,1p

! https://github.com/NanoMeow/QuickReports/issues/2173
mamadu.pl##+js(nostif, , 1)

! https://github.com/NanoMeow/QuickReports/issues/2085
neoteo.com##+js(set, jQuery.adblock, false)

! https://github.com/uBlockOrigin/uAssets/issues/6459
elitegoltv.org,extremotvplay.com,tarjetarojatv.org,pirlotvonline.org,rojadirectaonlinetv.com##+js(aopr, open)

! https://forums.lanik.us/viewtopic.php?f=103&t=43734
! https://github.com/uBlockOrigin/uAssets/issues/7455
elmundo.es,expansion.com,marca.com##+js(aopr, adUnits)
marca.com##.ad-item-bt-cont
marca.com##.banner-sticky

! https://github.com/NanoMeow/QuickReports/issues/2092
yaoiotaku.com##+js(nostif, afs_ads, 2000)

! https://forums.lanik.us/viewtopic.php?f=62&t=43697
||slacker.com^*/getspot/?spotid=$media,redirect=noopmp3-0.1s

! https://github.com/NanoMeow/QuickReports/issues/2095
||googlesyndication.com/pagead/js/adsbygoogle.js$xhr,redirect=noopjs,domain=gazetadopovo.com.br
gazetadopovo.com.br##.ads-desktop

! https://www.reddit.com/r/uBlockOrigin/comments/dlljyn/ublock_is_not_working_on_this_website/
beinmatch.*##+js(nowoif)
beinmatch.*##+js(rmnt, script, /?key.*open/, condition, key)

! cirokun.blogspot.com anti adb
cirokun.blogspot.com##+js(aeld, load, 2000)

! anisubindo.video anti adb
anisubindo.*##+js(aeld, load, nextFunction)

! anibatch.me anti adb
anibatch.me##+js(nostif, nextFunction, 2000)

! https://github.com/AdguardTeam/AdguardFilters/issues/82509
mangalist.org##+js(nosiif, 0x)
@@||cdnjs.cloudflare.com/ajax/libs/blockadblock/$script,3p
@@||mangalist.org^$script,1p

! nsfw camchickscaps. com ads
camchickscaps.com##+js(aopw, ai_adb_overlay)
||nvxcvyfedg.com^
||okean-qoj.com^

! romanialivewebcam .blogspot.com anti adb
@@||romanialivewebcam.blogspot.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6468
! https://github.com/NanoMeow/QuickReports/issues/4677
techmuzz.com##+js(nosiif, adblocker)

! https://github.com/uBlockOrigin/uAssets/issues/6470
@@||minecraftpocket-servers.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2120
allusione.org##+js(aopr, b2a)

! https://www.reddit.com/r/uBlockOrigin/comments/dmjr41/photobucket_adblock_blocker_help/
! https://github.com/NanoMeow/QuickReports/issues/2491
photobucket.com##.swal2-container
photobucket.com##body.swal2-shown > [aria-hidden="true"]:style(filter: none !important)
photobucket.com##body:style(overflow: auto !important)
@@||photobucket.com/resources/common/*$script,1p

! https://www.reddit.com/r/uBlockOrigin/comments/k3xfke/ublock_gets_detected_on_vvvvid/
vvvvid.it##+js(json-prune, data.[].vast_url)
! @@||imasdk.googleapis.com/js/core/$frame,domain=vvvvid.it
! @@*ads.mperience.net/vast$xhr,domain=imasdk.googleapis.com
! preroll;$xhr,domain=imasdk.googleapis.com,important
! ||akamaized.net/Roll/$media,redirect=noopmp3-0.1s
! *$media,redirect=noopmp3-0.1s,domain=vvvvid.it
! @@||bs.serving-sys.com/*&gdpr_consent$xhr,domain=imasdk.googleapis.com

! https://github.com/NanoMeow/QuickReports/issues/1674
! https://github.com/uBlockOrigin/uAssets/issues/7086
semawur.com##+js(aopr, open)
ayobelajarbareng.com,semawur.com##+js(nano-sib, , *, 0)
semawur.com###main > .text-center > a[href] > img
||semawur.com/download$image

! https://github.com/uBlockOrigin/uAssets/issues/6486
kumpulmanga.org##+js(set, showAds, true)

! https://github.com/NanoMeow/QuickReports/issues/2146
msguides.com##+js(aopw, ai_adb_overlay)

! https://github.com/uBlockOrigin/uAssets/issues/7646
||cloudfront.net/assets.sidearmsports.com/*/bettor_detector.$script,3p
*/assets.sidearmsports.com/$script,redirect-rule=noopjs
@@/templates/dfp/dfp-component-template.html$xhr,1p
@@/components/js/analytics.js|$xhr,1p
###sidearm-adblock-modal
12thman.com##.c-sticky-leaderboard
bceagles.com##.s-sticky-dfp
bceagles.com##.article-aside__sponsor
bceagles.com##.article-aside__sponsor2
12thman.com,acusports.com,atlantic10.com,auburntigers.com,baylorbears.com,bceagles.com,bgsufalcons.com,big12sports.com,bigten.org,bradleybraves.com,butlersports.com,cmumavericks.com,conferenceusa.com,cyclones.com,dartmouthsports.com,daytonflyers.com,dbupatriots.com,dbusports.com,denverpioneers.com,fduknights.com,fgcuathletics.com,fightinghawks.com,fightingillini.com,floridagators.com,friars.com,friscofighters.com,gamecocksonline.com,goarmywestpoint.com,gobison.com,goblueraiders.com,gobobcats.com,gocards.com,gocreighton.com,godeacs.com,goexplorers.com,goetbutigers.com,gofrogs.com,gogriffs.com,gogriz.com,golobos.com,gomarquette.com,gopack.com,gophersports.com,goprincetontigers.com,gopsusports.com,goracers.com,goshockers.com,goterriers.com,gotigersgo.com,gousfbulls.com,govandals.com,gowyo.com,goxavier.com,gozags.com,gozips.com,griffinathletics.com,guhoyas.com,gwusports.com,hailstate.com,hamptonpirates.com,hawaiiathletics.com,hokiesports.com,huskers.com,icgaels.com,iuhoosiers.com,jsugamecocksports.com,longbeachstate.com,loyolaramblers.com,lrtrojans.com,lsusports.net,morrisvillemustangs.com,msuspartans.com,muleriderathletics.com,mutigers.com,navysports.com,nevadawolfpack.com,niuhuskies.com,nkunorse.com,nuhuskies.com,nusports.com,okstate.com,olemisssports.com,omavs.com,ovcsports.com,owlsports.com,purduesports.com,redstormsports.com,richmondspiders.com,sfajacks.com,shupirates.com,siusalukis.com,smcgaels.com,smumustangs.com,soconsports.com,soonersports.com,themw.com,tulsahurricane.com,txst.com,txstatebobcats.com,ubbulls.com,ucfknights.com,ucirvinesports.com,uconnhuskies.com,uhcougars.com,uicflames.com,umterps.com,uncwsports.com,unipanthers.com,unlvrebels.com,uoflsports.com,usdtoreros.com,utahstateaggies.com,utepathletics.com,utrockets.com,uvmathletics.com,uwbadgers.com,villanova.com,wkusports.com,wmubroncos.com,woffordterriers.com,1pack1goal.com,bcuathletics.com,bubraves.com,goblackbears.com,golightsgo.com,gomcpanthers.com,goutsa.com,mercerbears.com,pirateblue.com,pirateblue.net,pirateblue.org,quinnipiacbobcats.com,towsontigers.com,tribeathletics.com,tribeclub.com,utepminermaniacs.com,utepminers.com,wkutickets.com,aopathletics.org,atlantichockeyonline.com,bigsouthnetwork.com,bigsouthsports.com,chawomenshockey.com,dbupatriots.org,drakerelays.org,ecac.org,ecacsports.com,emueagles.com,emugameday.com,gculopes.com,godrakebulldog.com,godrakebulldogs.com,godrakebulldogs.net,goeags.com,goislander.com,goislanders.com,gojacks.com,gomacsports.com,gseagles.com,hubison.com,iowaconference.com,ksuowls.com,lonestarconference.org,mascac.org,midwestconference.org,mountaineast.org,niu-pack.com,niuhuskies.com,nulakers.ca,oswegolakers.com,ovcdigitalnetwork.com,pacersports.com,rmacsports.org,rollrivers.com,samfordsports.com,uncpbraves.com,usfdons.com,wiacsports.com,alaskananooks.com,broncathleticfund.com,cameronaggies.com,columbiacougars.com,etownbluejays.com,gobadgers.ca,golancers.ca,gometrostate.com,gothunderbirds.ca,kentstatesports.com,lehighsports.com,lopers.com,lycoathletics.com,lycomingathletics.com,maraudersports.com,mauiinvitational.com,msumavericks.com,nauathletics.com,nueagles.com,nwusports.com,oceanbreezenyc.org,patriotathleticfund.com,pittband.com,principiaathletics.com,roadrunnersathletics.com,sidearmsocial.com,snhupenmen.com,stablerarena.com,stoutbluedevils.com,uwlathletics.com,yumacs.com,collegefootballplayoff.com,csurams.com,cubuffs.com,gobearcats.com,gohuskies.com,mgoblue.com,osubeavers.com,pittsburghpanthers.com,rolltide.com,texassports.com,thesundevils.com,uclabruins.com,wvuathletics.com,wvusports.com,arizonawildcats.com,calbears.com,cuse.com,georgiadogs.com,goducks.com,goheels.com,gostanford.com,insidekstatesports.com,insidekstatesports.info,insidekstatesports.net,insidekstatesports.org,k-stateathletics.com,k-statefootball.net,k-statefootball.org,k-statesports.com,k-statesports.net,k-statesports.org,k-statewomenshoops.com,k-statewomenshoops.net,k-statewomenshoops.org,kstateathletics.com,kstatefootball.net,kstatefootball.org,kstatesports.com,kstatewomenshoops.com,kstatewomenshoops.net,kstatewomenshoops.org,ksuathletics.com,ksusports.com,scarletknights.com,showdownforrelief.com,syracusecrunch.com,texastech.com,theacc.com,ukathletics.com,usctrojans.com,utahutes.com,utsports.com,wsucougars.com##+js(set, blockAdBlock, trueFunc)
*$script,redirect-rule=noopjs,domain=acusports.com|atlantic10.com|big12sports.com|bigten.org|cmumavericks.com|conferenceusa.com|dartmouthsports.com|daytonflyers.com|dbupatriots.com|dbusports.com|fduknights.com|floridagators.com|friscofighters.com|gamecocksonline.com|gobobcats.com|gocreighton.com|goetbutigers.com|golobos.com|gophersports.com|gopsusports.com|goracers.com|goshockers.com|goterriers.com|gotigersgo.com|gousfbulls.com|govandals.com|gowyo.com|goxavier.com|gozags.com|gozips.com|griffinathletics.com|guhoyas.com|gwusports.com|hailstate.com|hamptonpirates.com|hawaiiathletics.com|hokiesports.com|huskers.com|icgaels.com|iuhoosiers.com|jsugamecocksports.com|longbeachstate.com|loyolaramblers.com|lrtrojans.com|lsusports.net|morrisvillemustangs.com|msuspartans.com|muleriderathletics.com|mutigers.com|navysports.com|nevadawolfpack.com|niuhuskies.com|nulakers.ca|nkunorse.com|nuhuskies.com|nusports.com|oceanbreezenyc.org|okstate.com|olemisssports.com|omavs.com|ovcsports.com|owlsports.com|purduesports.com|redstormsports.com|richmondspiders.com|sfajacks.com|shupirates.com|siusalukis.com|smcgaels.com|smumustangs.com|soconsports.com|soonersports.com|themw.com|tulsahurricane.com|txst.com|txstatebobcats.com|ubbulls.com|ucfknights.com|ucirvinesports.com|uconnhuskies.com|uhcougars.com|uicflames.com|umterps.com|uncwsports.com|unipanthers.com|unlvrebels.com|uoflsports.com|usdtoreros.com|utahstateaggies.com|utepathletics.com|utrockets.com|uvmathletics.com|uwbadgers.com|villanova.com|wkusports.com|wmubroncos.com|woffordterriers.com|1pack1goal.com|bcuathletics.com|bubraves.com|goblackbears.com|golightsgo.com|gomcpanthers.com|goutsa.com|mercerbears.com|pirateblue.com|pirateblue.net|pirateblue.org|quinnipiacbobcats.com|towsontigers.com|tribeathletics.com|tribeclub.com|utepminermaniacs.com|utepminers.com|wkutickets.com|aopathletics.org|atlantichockeyonline.com|bigsouthnetwork.com|bigsouthsports.com|chawomenshockey.com|dbupatriots.org|drakerelays.org|ecac.org|ecacsports.com|emueagles.com|emugameday.com|gculopes.com|godrakebulldog.com|godrakebulldogs.com|godrakebulldogs.net|goeags.com|goislander.com|goislanders.com|gojacks.com|gomacsports.com|gseagles.com|hubison.com|iowaconference.com|ksuowls.com|lonestarconference.org|mascac.org|midwestconference.org|mountaineast.org|niu-pack.com|niuhuskies.com|oswegolakers.com|ovcdigitalnetwork.com|pacersports.com|rmacsports.org|rollrivers.com|samfordsports.com|uncpbraves.com|usfdons.com|wiacsports.com|alaskananooks.com|broncathleticfund.com|cameronaggies.com|columbiacougars.com|etownbluejays.com|gobadgers.ca|golancers.ca|gometrostate.com|gothunderbirds.ca|kentstatesports.com|lehighsports.com|lopers.com|lycoathletics.com|lycomingathletics.com|maraudersports.com|mauiinvitational.com|msumavericks.com|nauathletics.com|nueagles.com|nwusports.com|patriotathleticfund.com|pittband.com|principiaathletics.com|roadrunnersathletics.com|sidearmsocial.com|snhupenmen.com|stablerarena.com|stoutbluedevils.com|uwlathletics.com|yumacs.com|collegefootballplayoff.com|csurams.com|cubuffs.com|gobearcats.com|gohuskies.com|mgoblue.com|osubeavers.com|pittsburghpanthers.com|rolltide.com|texassports.com|thesundevils.com|uclabruins.com|wvuathletics.com|wvusports.com|arizonawildcats.com|calbears.com|cuse.com|georgiadogs.com|goducks.com|goheels.com|insidekstatesports.com|insidekstatesports.info|insidekstatesports.net|insidekstatesports.org|k-stateathletics.com|k-statefootball.net|k-statefootball.org|k-statesports.com|k-statesports.net|k-statesports.org|k-statewomenshoops.com|k-statewomenshoops.net|k-statewomenshoops.org|kstateathletics.com|kstatefootball.net|kstatefootball.org|kstatesports.com|kstatewomenshoops.com|kstatewomenshoops.net|kstatewomenshoops.org|ksuathletics.com|ksusports.com|scarletknights.com|showdownforrelief.com|syracusecrunch.com|texastech.com|theacc.com|ukathletics.com|usctrojans.com|utahutes.com|utsports.com|wsucougars.com
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=acusports.com|atlantic10.com|big12sports.com|bigten.org|cmumavericks.com|conferenceusa.com|dartmouthsports.com|daytonflyers.com|dbupatriots.com|dbusports.com|fduknights.com|floridagators.com|friscofighters.com|gamecocksonline.com|gobobcats.com|gocreighton.com|goetbutigers.com|golobos.com|gophersports.com|gopsusports.com|goracers.com|goshockers.com|goterriers.com|gotigersgo.com|gousfbulls.com|govandals.com|gowyo.com|goxavier.com|gozags.com|gozips.com|griffinathletics.com|guhoyas.com|gwusports.com|hailstate.com|hamptonpirates.com|hawaiiathletics.com|hokiesports.com|huskers.com|icgaels.com|iuhoosiers.com|jsugamecocksports.com|longbeachstate.com|loyolaramblers.com|lrtrojans.com|lsusports.net|morrisvillemustangs.com|msuspartans.com|muleriderathletics.com|mutigers.com|navysports.com|nevadawolfpack.com|niuhuskies.com|nulakers.ca|nkunorse.com|nuhuskies.com|nusports.com|oceanbreezenyc.org|okstate.com|olemisssports.com|omavs.com|ovcsports.com|owlsports.com|purduesports.com|redstormsports.com|richmondspiders.com|sfajacks.com|shupirates.com|siusalukis.com|smcgaels.com|smumustangs.com|soconsports.com|soonersports.com|themw.com|tulsahurricane.com|txst.com|txstatebobcats.com|ubbulls.com|ucfknights.com|ucirvinesports.com|uconnhuskies.com|uhcougars.com|uicflames.com|umterps.com|uncwsports.com|unipanthers.com|unlvrebels.com|uoflsports.com|usdtoreros.com|utahstateaggies.com|utepathletics.com|utrockets.com|uvmathletics.com|uwbadgers.com|villanova.com|wkusports.com|wmubroncos.com|woffordterriers.com|1pack1goal.com|bcuathletics.com|bubraves.com|goblackbears.com|golightsgo.com|gomcpanthers.com|goutsa.com|mercerbears.com|pirateblue.com|pirateblue.net|pirateblue.org|quinnipiacbobcats.com|towsontigers.com|tribeathletics.com|tribeclub.com|utepminermaniacs.com|utepminers.com|wkutickets.com|aopathletics.org|atlantichockeyonline.com|bigsouthnetwork.com|bigsouthsports.com|chawomenshockey.com|dbupatriots.org|drakerelays.org|ecac.org|ecacsports.com|emueagles.com|emugameday.com|gculopes.com|godrakebulldog.com|godrakebulldogs.com|godrakebulldogs.net|goeags.com|goislander.com|goislanders.com|gojacks.com|gomacsports.com|gseagles.com|hubison.com|iowaconference.com|ksuowls.com|lonestarconference.org|mascac.org|midwestconference.org|mountaineast.org|niu-pack.com|niuhuskies.com|oswegolakers.com|ovcdigitalnetwork.com|pacersports.com|rmacsports.org|rollrivers.com|samfordsports.com|uncpbraves.com|usfdons.com|wiacsports.com|alaskananooks.com|broncathleticfund.com|cameronaggies.com|columbiacougars.com|etownbluejays.com|gobadgers.ca|golancers.ca|gometrostate.com|gothunderbirds.ca|kentstatesports.com|lehighsports.com|lopers.com|lycoathletics.com|lycomingathletics.com|maraudersports.com|mauiinvitational.com|msumavericks.com|nauathletics.com|nueagles.com|nwusports.com|patriotathleticfund.com|pittband.com|principiaathletics.com|roadrunnersathletics.com|sidearmsocial.com|snhupenmen.com|stablerarena.com|stoutbluedevils.com|uwlathletics.com|yumacs.com|collegefootballplayoff.com|csurams.com|cubuffs.com|gobearcats.com|gohuskies.com|mgoblue.com|osubeavers.com|pittsburghpanthers.com|rolltide.com|texassports.com|thesundevils.com|uclabruins.com|wvuathletics.com|wvusports.com|arizonawildcats.com|calbears.com|cuse.com|georgiadogs.com|goducks.com|goheels.com|gostanford.com|insidekstatesports.com|insidekstatesports.info|insidekstatesports.net|insidekstatesports.org|k-stateathletics.com|k-statefootball.net|k-statefootball.org|k-statesports.com|k-statesports.net|k-statesports.org|k-statewomenshoops.com|k-statewomenshoops.net|k-statewomenshoops.org|kstateathletics.com|kstatefootball.net|kstatefootball.org|kstatesports.com|kstatewomenshoops.com|kstatewomenshoops.net|kstatewomenshoops.org|ksuathletics.com|ksusports.com|scarletknights.com|showdownforrelief.com|syracusecrunch.com|texastech.com|theacc.com|ukathletics.com|usctrojans.com|utahutes.com|utsports.com|wsucougars.com
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect-rule=google-ima.js:5,domain=12thman.com|auburntigers.com|baylorbears.com|bceagles.com|bgsufalcons.com|bradleybraves.com|butlersports.com|cyclones.com|denverpioneers.com|fgcuathletics.com|fightinghawks.com|fightingillini.com|friars.com|goarmywestpoint.com|gobison.com|goblueraiders.com|gocards.com|godeacs.com|goexplorers.com|gofrogs.com|gogriffs.com|gogriz.com|gomarquette.com|gopack.com|goprincetontigers.com
||sidearm-syndication.s3.amazonaws.com^$script,redirect=noopjs,3p

! https://github.com/NanoMeow/QuickReports/issues/2155
@@||brid.tv/player/build/plugins/adunit.js$script,domain=pluralist.com

! https://github.com/uBlockOrigin/uAssets/issues/4582
vupload.com##+js(nowebrtc)
vupload.com##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/6493
@@||savetolink.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2158
@@||blogshinobijawi.blogspot.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2159
karanapk.com##+js(set, google_jobrunner, true)

! https://github.com/NanoMeow/QuickReports/issues/2165
*$frame,3p,domain=ironysub.net

! https://github.com/uBlockOrigin/uAssets/issues/5940
camhub.world##+js(nostif, visibility, 2000)
||camhub.world/player/player_ads.html$frame,1p,redirect=noopframe
! camhub.cc anti-adb/popunder
camhub.cc##.table
camhub.cc##+js(nostif, innerText, 2000)
camhub.cc##+js(set, flashvars.popunder_url, '')
! https://github.com/uBlockOrigin/uAssets/issues/10011
camhub.*##.popunder-opener

! averio.de anti adb
@@||averio.de^$ghide

! moneyhouse.ch anti adb
moneyhouse.ch##+js(nostif, bait)

! https://github.com/NanoMeow/QuickReports/issues/2175
@@||itavisen.no^$ghide

! megalink.pro anti adb
megalink.*##+js(aopr, app_vars.force_disable_adblock)
megalink.*##+js(set, blurred, false)
megalink.*##+js(aeld, click, popunder)
megalink.*##[href^="https://mob1ledev1ces.com/r/"]
megalink.*###__bgd_link
||i.imgur.com^$domain=megalink.*

! theshedend.com anti adb
theshedend.com##+js(rmnt, script, adblock)

! https://github.com/NanoMeow/QuickReports/issues/2181
sfile.mobi##+js(nano-sib)

! https://github.com/uBlockOrigin/uAssets/issues/6504
softwaresblue.com##+js(acs, $, setTimeout)

! https://github.com/NanoMeow/QuickReports/issues/2185
mrpiracy.*##+js(acs, document.getElementById, deleted)
mrpiracy.*##+js(aopr, LieDetector)
mrpiracy.*##+js(nowoif)
||mrpiracy.*/images/*.gif$image

! canalplus.com anti adb + ads
! https://github.com/uBlockOrigin/uAssets/issues/7575
@@||canalplus-bo.net/web/canal/*$xhr,domain=canalplus.com
@@||fwmrm.net/ad/*$xhr,domain=canalplus.com
*$media,redirect=noopmp3-0.1s,domain=canalplus.com
@@||bran-media.canalplus.pro^$media,domain=canalplus.com

! https://github.com/uBlockOrigin/uAssets/issues/6508
||vidads.gr^$3p

! https://github.com/NanoMeow/QuickReports/issues/2188
kino-zeit.de##+js(acs, getCookie)

! https://github.com/NanoMeow/QuickReports/issues/2189
! https://www.reddit.com/r/uBlockOrigin/comments/10lifv2/
topstreams.*##+js(nowebrtc)
topstreams.*##+js(acs, $, ads)
topstreams.*##+js(acs, setTimeout, admc)
topstreams.*##^script:has-text(admc)

! https://www.reddit.com/r/uBlockOrigin/comments/dq53hc/anti_adblock_on_jotapov/
jotapov.com##+js(acs, jQuery, adblocker)
jotapov.com##.jconfirm

! https://github.com/uBlockOrigin/uAssets/issues/6511
oload.*##+js(aopr, AaDetector)
oload.*,streamhoe.*##+js(aopr, open)
oload.*,streamhoe.*##+js(aopr, _pop)
oload.*##+js(aopr, decodeURI)
##[href^="https://klsdee.com/"]

! https://github.com/NanoMeow/QuickReports/issues/2190
@@||animex.*^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2197
@@||moonline.*^$ghide
moonline.*###clickfakeplayer

! https://github.com/NanoMeow/QuickReports/issues/3060
shorten.*##+js(aopr, AaDetector)
shorten.*##+js(aopr, app_vars.force_disable_adblock)
shorten.*##+js(aopr, parcelRequire)
shorten.*##+js(nowoif)
shorten.*###chromepop
||shorten.*/sw.js$script,1p

! https://www.reddit.com/r/uBlockOrigin/comments/dr1eoe/how_do_i_block_this_antiadblock_ligainsiderde/
ligainsider.de##+js(acs, $, MutationObserver)
@@||ligainsider.de^$ghide

! https://github.com/NanoAdblocker/NanoFilters/issues/417
drrtyr.mx##+js(aeld,, adb)
dirrty.remix.es##.ad_target
dirrty.remix.es##.adsbygoogle
dirrty.remix.es##.AdZone300

! https://github.com/NanoMeow/QuickReports/issues/2205
@@||globaltvapp.net^$ghide

! indaily.com.au anti adb
indaily.com.au##.advertisement

! https://www.reddit.com/r/uBlockOrigin/comments/drmhuh/how_to_remove_ads_from_bitcointalkorg/
bitcointalk.org##:xpath(//span[contains(text(),"Advert")]/../..)
bitcointalk.org##td:has(> span[class]:has-text(Advert))
bitcointalk.org##.fpcontainer

! https://github.com/NanoMeow/QuickReports/issues/2226
fluentu.com##+js(aopr, __eiPb)

! https://forums.lanik.us/viewtopic.php?f=103&p=150935#p150933
forocoches.com##+js(aopr, pbjsChunk)
forocoches.com##table.cajasnews > tbody > tr > td > table > tbody > tr:has(> td > a[rel=nofollow]:has-text(Promos))
forocoches.com##table.cajasprin > tbody > tr > td:has(iframe[src^="//cdn.forocoches.com/lwa/forocoches/fc_promo.html"])
forocoches.com##table.tborder#threadslist > tbody[id^="threadbits_forum_"] > tr:has(> [id^="td_threadtitle_"][style^="background-color: #"].alt1 > .smallfont > span)
forocoches.com##table.tborder[id^="table"] > tbody:has(> tr > .alt1 [href][target]):has(strong)
forocoches.com##table.tborder > tbody:has(> tr > .alt1 [href^="/link.php?url=https%3A%2F%2Fwww.pccomponentes.com"][target])
forocoches.com##table.tborder > tbody:has(> tr > .alt1 > table > tbody > tr > td > a):has(strong):has(span > font > strong)
forocoches.com##table.tborder > tbody:has(> tr > .alt1 > table > tbody > tr > td > table > tbody > tr > td > strong > a[target][href])
forocoches.com##table.tborder[id^="table"] > tbody > tr > .alt1:has(> table[id^="table"] > tbody > tr > td > div[style] > a[style][href^="/foro/"] > strong)
forocoches.com##table.tborder[id^="table"] > tbody:has(> tr > .alt1 > table[id^="table"] > tbody > tr > td > [href] + span > br + strong)
forocoches.com###vbnotices
m.forocoches.com##div.title-forum-display-destacado
m.forocoches.com##.page > div > ul > li[style^="word-wrap:break-word; word-break:break-word; background-color: #"]
m.forocoches.com##.page > div > ul[style]:has(> li > div[style] > a[style][href^="/foro/"] > strong)
m.forocoches.com##ul > li:has([id*="adslot"])
||cdn.forocoches.com/lwa/forocoches/*_promo.html$frame,1p

! https://github.com/NanoMeow/QuickReports/issues/2231
@@||naruto-arena.net^$script,1p

! https://github.com/NanoMeow/QuickReports/issues/2233
investmentwatchblog.com##+js(acs, Math, '0x)
investmentwatchblog.com##+js(aopw, ABD)

! https://github.com/NanoMeow/QuickReports/issues/2238
! https://github.com/uBlockOrigin/uAssets/issues/11371
fangraphs.com##+js(acs, $, Math.random)
fangraphs.com##+js(set, ezstandalone.enabled, true)
fangraphs.com##.catchall728
fangraphs.com##.fg-ra-desktop
fangraphs.com##.fg-ra-mobile

! https://github.com/uBlockOrigin/uAssets/issues/6527
phoneswiki.com##+js(set, jQuery.adblock, false)

! https://github.com/uBlockOrigin/uAssets/issues/6528
myadslink.com##+js(aeld, load, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/6531
filmonerileri.org##+js(acs, document.querySelector, adblock)

! https://github.com/uBlockOrigin/uAssets/issues/6533
@@||kisshentai.tv^$ghide
kisshentai.tv##.adv-container

! 943thex.com  live player anti adb
||adservice.google.com/adsid/integrator.js$script,redirect=noopjs,domain=943thex.com

! https://github.com/NanoMeow/QuickReports/issues/2254
@@||vidcrt.net^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6536
@@||sabervivirtv.com^$ghide
sabervivirtv.com##.ad-item
sabervivirtv.com##.ad-sidebar

! https://github.com/NanoMeow/QuickReports/issues/2224
aol.com##.maas-item:has-text(our Partners)

! https://github.com/NanoMeow/QuickReports/issues/2261
@@||debridup.com^$script,xhr,1p

! homad
! https://github.com/uBlockOrigin/uAssets/issues/6541
! https://github.com/uBlockOrigin/uAssets/issues/15698
! https://github.com/uBlockOrigin/uAssets/issues/19453
4players.de,buffed.de,gamesaktuell.de,gamezone.de,pcgames.de,videogameszone.de##+js(set, CustomEvent, noopFunc)
golem.de,player.pcgameshardware.de##+js(no-xhr-if, damoh)
vip.de,rtl.de,fitforfun.de,desired.de,kino.de,cinema.de##+js(no-xhr-if, svonm)
desired.de##+js(ra, data-ivad-preroll-adtag, video, stay)
||computer-bild.de/_static-assets/homad/homad.js
||auto-bild.de/_static-assets/homad/homad.js
||stern.de/__assets/homad
||static.kicker.de/content/js/vendor/homad
spiegel.de##^script:has-text(homad)
welt.de,~dutyfarm.welt.de##+js(json-prune, vastUrl)
welt.de,~dutyfarm.welt.de##div[id][style^="z-index: 2"][style*="margin"][style*="auto"][style*="top"][style$="px; position: absolute;"]:remove()
giga.de,kino.de,spieletipps.de##+js(rpnt, script, /\"homad\"\,/)
t-online.de##+js(rpnt, script, /\"homad\":\{\"state\":\"enabled\"\}/, "homad":{"state":"disabled"})
!#if !cap_html_filtering
spiegel.de##+js(rmnt, script, homad)
!#endif
plus.rtl.de##+js(json-prune, adReinsertion)
tvspielfilm.de,tvtoday.de,chip.de,focus.de##+js(set, DL8_GLOBALS.enableAdSupport, false)
tvspielfilm.de,tvtoday.de,chip.de,focus.de##+js(set, DL8_GLOBALS.useHomad, false)
tvspielfilm.de,tvtoday.de,chip.de,focus.de##+js(set, DL8_GLOBALS.enableHomadDesktop, false)
tvspielfilm.de,tvtoday.de,chip.de,focus.de##+js(set, DL8_GLOBALS.enableHomadMobile, false)

! https://github.com/uBlockOrigin/uAssets/issues/7508#issuecomment-659267224
||damoh.gmx.*/*$media,redirect=noop-0.1s.mp3,1p
||united-infos.net^$domain=gmx.*|web.de
! https://github.com/uBlockOrigin/uAssets/issues/6541#issuecomment-559272733
focus.de##+js(json-prune, enabled, force_disabled)
gmx.*,web.de##+js(aeld, timeupdate)
*$media,redirect-rule=noop-0.1s.mp3,3p,domain=gmx.*|web.de
! https://github.com/uBlockOrigin/uAssets/issues/7508#issuecomment-665541485
!#if env_firefox
@@||akamaiedge.net^$media,domain=gmx.*|web.de
!#endif

! https://github.com/uBlockOrigin/uAssets/issues/6545
tv2.no##+js(json-prune, enabled, testhide)

! https://forums.lanik.us/viewtopic.php?p=151059#p151059
@@||player.clevercast.com/players/video-js/video-js-plugins/videojs.ads.min.js$script,1p

! https://forums.lanik.us/viewtopic.php?f=62&t=43843
elamigosedition.com##+js(aost, document.addEventListener, blocker)

! https://github.com/uBlockOrigin/uAssets/issues/6548
camcam.cc##+js(no-fetch-if, adsbygoogle)

! https://github.com/uBlockOrigin/uAssets/issues/6549
ihow.info##+js(nostif, getComputedStyle, 250)

! https://github.com/uBlockOrigin/uAssets/issues/6552
@@||eldia.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6560
adshrink.it##+js(aeld, load, nextFunction)
adshrink.it##+js(aopr, open)
@@||googlesyndication.com/pagead/js/adsbygoogle.js$script,domain=adshrink.it
@@||googlesyndication.com/pagead/js/*/show_ads_impl$script,domain=adshrink.it
||googlesyndication.com/pagead/js/adsbygoogle.js$xhr,redirect-rule=noopjs,domain=adshrink.it
@@||shrink-service.it^$frame,domain=adshrink.it
@@||cdn.trackjs.com/agent/v*/latest/t.js$script,domain=adshrink.it
||shrink-service.it^$csp=frame-src
shrink-service.it##+js(aopr, open)
adshrink.it##.active.dimmer.ui:has-text(/Wait|Skip/i)
||offer.alibaba.com^$frame,domain=adshrink.it

! https://www.reddit.com/r/uBlockOrigin/comments/dvubaa/failed_to_load_content_please_disable_adblocker/
vipstand.*##+js(nowoif, //)

! https://github.com/uBlockOrigin/uAssets/issues/2824
turkanime.co##+js(aeld, , pop)
turkanime.*##+js(nostif, blocked)
*$script,redirect-rule=noopjs,domain=turkanime.*
@@||turkanime.*^$ghide
@@||turkanime.*/ad/$xhr,1p
turkanime.*##div.col-xs-12:has-text(MMPORG OYUNLAR)
turkanime.*###sponsored
turkanime.*##.panel-title:has-text(REKLAM)
turkanime.*##.AltkisimMenu
video.sibnet.ru###vjs-overlayclip-box
video.sibnet.ru##.vjs-overlayclip-box-close

! allcalidad.net anti adb and popup
allcalidad.*##+js(acs, doOnce)
allcalidad.*##+js(aeld, , 0x)
allcalidad.*##+js(aopw, smrtSB)
allcalidad.*##+js(set, btoa, null)
allcalidad.*##+js(ra, href, #clickfakeplayer)
allcalidad.*##.table-hover.table > tbody > tr:has-text(Descargar Premium)
*$script,3p,denyallow=cloudflare.com|cloudfront.net|facebook.net|fbcdn.net|googleapis.com|gstatic.com|heyoya.com,domain=allcalidad.*

! https://github.com/uBlockOrigin/uAssets/issues/6561
*.gif$image,domain=stream1688.com
*$media,domain=stream1688.com,redirect=noopmp3-0.1s

! https://www.reddit.com/r/uBlockOrigin/comments/dmcm6b/how_to_disable_ublock_strict_blocking_popup/f4zfjji/
! https://github.com/uBlockOrigin/uAssets/issues/17195
123anime.*,123animes.*##+js(aopr, glxopen)
123anime.*##+js(acs, setTimeout, popi)
123anime.*##+js(nowoif)
! 123animes.mobi/ru popup
123animes.*##+js(aopr, AaDetector)
123animes.*##div[id][style^="position: fixed; inset: 0px; z-index: 2147483647;"]

! https://github.com/uBlockOrigin/uAssets/issues/6562
upfile.us##+js(nano-sib)

! https://github.com/NanoMeow/QuickReports/issues/2283
metro.us##+js(set, Adv_ab, false)
games.metro.us##+js(rpnt, script, "isAdBlockerEnabled":true, "isAdBlockerEnabled":false)

! oltnertagblatt .ch anti adb
@@||nwch.az-cdn.ch^$script,domain=oltnertagblatt.ch

! https://github.com/uBlockOrigin/uAssets/issues/6567
*$media,domain=series-d.com,redirect=noopmp3-0.1s
||imgur.com/*.gif$image,domain=series-d.com
.gif$image,domain=series-d.com
@@||cdn.jsdelivr.net/npm/*/fuckadblock$script,xhr,domain=series-d.com
@@||googleusercontent.com^$media,domain=series-d.com
@@||googlevideo.com/videoplayback$media,domain=series-d.com
series-d.com##.mb-3.text-center.container-fluid
@@||series-d.com^$ghide

! enxf.net anti adb
enxf.net##+js(acs, $, adblock)

! https://www.reddit.com/r/uBlockOrigin/comments/dwnkgn/listenonrepeatcom_has_an_antiadblock/
listenonrepeat.com##+js(acs, googlefc)

! https://github.com/uBlockOrigin/uAssets/issues/6571
!#if !env_mobile
news18.com##+js(aeld, scroll, getElementById)
!#endif
!#if env_mobile
news18.com##+js(aeld, scroll, Mgid)
news18.com##+js(aopr, getAdsScripts)
news18.com##.ad-container
news18.com##[class^="adv_placeholder_"]
!#endif

! https://github.com/NanoMeow/QuickReports/issues/2290
spinbot.com##+js(aopr, angular)

! https://github.com/uBlockOrigin/uAssets/issues/6572
xiaomi-miui.gr##+js(acs, $, detected)

! https://github.com/NanoMeow/QuickReports/issues/2134
@@||calciomercato.com^$ghide
calciomercato.com##.adv

! https://github.com/uBlockOrigin/uAssets/issues/8347
! https://www.reddit.com/r/uBlockOrigin/comments/zeasej/
forum.release-apk.com###page-header:has(+ .phpbb-ads-center:matches-css(height: 280px)):style(margin-bottom: -265px !important)
forum.release-apk.com##.phpbb-ads-center:style(pointer-events: none !important)
!forum.release-apk.com##^script:has-text(/\'load\'|document.onload/)
forum.release-apk.com##+js(aeld, load, onload)
forum.release-apk.com##+js(nobab)
@@||forum.release-apk.com^$ghide
@@||pagead2.googlesyndication.com/pagead/$script,domain=forum.release-apk.com
*$frame,domain=forum.release-apk.com,redirect-rule=noopframe
@@||googleads.g.doubleclick.net/pagead/*forum.release-apk.com$frame,domain=forum.release-apk.com
forum.release-apk.com##ins:style(opacity: 0 !important; pointer-events: none !important)
*$xhr,redirect-rule=nooptext,domain=forum.release-apk.com
forum.release-apk.com##+js(acs, eval, replace)

! https://github.com/NanoMeow/QuickReports/issues/2294
adonisfansub.com##+js(nobab)

! https://github.com/NanoMeow/QuickReports/issues/2295
agefi.fr##+js(nostif, {r(), 0)

! https://forums.lanik.us/viewtopic.php?p=151106#p151085
horriblesubs.info##[class*="sponsor"]

! https://forums.lanik.us/viewtopic.php?f=91&t=43802
ladepeche.fr##+js(aopr, localStorage)

! https://forums.lanik.us/viewtopic.php?f=62&t=43872
projectfreetv.*##+js(aeld, , _0x)
##.overlay-advertising-new

! https://github.com/AdguardTeam/AdguardFilters/issues/63019
*$xhr,redirect-rule=nooptext,domain=freevocabulary.com

! https://github.com/NanoMeow/QuickReports/issues/2305
cinemaxxl.de##+js(set, adblock, false)
cinemaxxl.de##noscript:has-text(Adblocker):remove()
||cinemaxxl.de/js/adblock.js$script

! https://github.com/uBlockOrigin/uAssets/issues/6584
anime-i.com##+js(nostif, nextFunction, 2000)

! https://forums.lanik.us/viewtopic.php?f=62&t=43877
||google.com/adsid/integrator.js$script,redirect=noopjs,domain=961thebreeze.com

! https://github.com/uBlockOrigin/uAssets/issues/6588
cartoonth12.com##.header-ad
*.gif$domain=cartoonth12.com,image
@@||jwpcdn.com/player/$script,domain=player.cartoonth12.com
*.mp4$media,redirect=noopmp3-0.1s,domain=cartoonth12.com
@@||cartoonth12.com^$ghide
cartoonth12.com##.dessert-frame
cartoonth12.com##[href="https://www.sagame350.bet/"]
cartoonth12.com##.video-player.responsive-player

! https://github.com/NanoAdblocker/NanoFilters/issues/424
upzone.cc##+js(acs, document.getElementById, undefined)

! https://github.com/uBlockOrigin/uAssets/issues/6589
##.header-menu-bottom-ads
##.rkads
###bt-ads
*.gif$domain=doo4k.com,image
*$media,domain=doo4k.com,redirect=noopmp3-0.1s
@@||cdn.ekcdn.me/video.mp4$media,domain=doo4k.com

! https://github.com/NanoMeow/QuickReports/issues/2309
@@||lutontoday.co.uk^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2310
@@||kikiers.com^$ghide
@@||kikiers.com^$script,1p

! https://github.com/NanoMeow/QuickReports/issues/2453
! https://github.com/olegwukr/polish-privacy-filters/issues/67
@@||cdntvn.pl^$script,domain=player.pl
@@||player.pl^$cname
@@||player.pl^$ehide
/ad.xml$xhr,badfilter
! https://github.com/uBlockOrigin/uAssets/issues/15609
player.pl#@#+js(json-prune, movie.advertising.ad_server)
! https://github.com/uBlockOrigin/uAssets/issues/17801
$xhr,redirect-rule=noopjs,domain=player.pl
player.pl##div.adsbygoogle.prebid.adocean.ado.ad.ads.advert.banner.reklama.linkSponsorowany.adsense.advertisments.reklama-top.adv_container:style(display: block !important)
*$media,domain=player.pl,redirect=noopmp3-0.1s
@@||tvn.hit.gemius.pl^$xhr,domain=player.pl

! https://github.com/NanoMeow/QuickReports/issues/2318
@@||jbzd.com.pl^$ghide

! irisbuddies.ml (dead) anti adb
||rawgit.com/fahimraza/FK/master/ad-unblocker.js^$script
||cdn.jsdelivr.net/gh/Akshat-h/propeller/btagantiadb.js^$script

! https://forums.lanik.us/viewtopic.php?f=62&t=43891#p151254
news-herald.com##+js(aopr, Connext)

! https://github.com/uBlockOrigin/uAssets/issues/6600
*.gif$domain=037-hd.com,image
*$media,domain=037-hd.com,redirect=noopmp3-0.1s

! https://github.com/uBlockOrigin/uAssets/issues/6602
*$script,3p,denyallow=bootstrapcdn.com|disqus.com|jsdelivr.net|jwpcdn.com|fastly.net|fastlylb.net|jquery.com|hwcdn.net|recaptcha.net|cloudflare.com|cloudflare.net|google.com|googleapis.com|gstatic.com,domain=movieshub.*

! https://github.com/NanoMeow/QuickReports/issues/2321
@@||kwik.*^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2325
@@||sadeempc.com^$ghide
sadeempc.com##[class^="buttonPress"]

! https://github.com/NanoMeow/QuickReports/issues/2330
@@||game-kentang.blogspot.com^$ghide
game-kentang.blogspot.com##+js(nano-sib)

! https://github.com/NanoMeow/QuickReports/issues/2338
shortgoo.blogspot.com##+js(set, showAds, true)
shortgoo.blogspot.com##+js(nano-sib)

! https://github.com/uBlockOrigin/uAssets/issues/6612
@@||downloader.la^$ghide

! ytmp3. plus ad and popup
ytmp3.*##+js(nowoif)
ytmp3.cc#@#+js(nowoif)
ytmp3.cc##+js(nowoif, !/ytmp3|dropbox/)
||ytmp3.*/ad/$frame
! https://github.com/uBlockOrigin/uAssets/issues/11212
||ytmp3.cc/js/ad*$script,1p

! cariskuy.com anti adb
cariskuy.com##+js(nostif, nextFunction, 450)

||domnovrek.com^$3p

! blackavelic.com anti adb
blackavelic.com##+js(aeld, load, 2000)

! https://github.com/uBlockOrigin/uAssets/issues/6614
series-d.com##+js(nano-sib, curAd)
series-d.com##+js(nowoif)

! https://github.com/NanoMeow/QuickReports/issues/2349
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=felanovia.com

! https://github.com/NanoMeow/QuickReports/issues/2350
thelanb.com##+js(aeld, load, undefined)

! https://github.com/NanoMeow/QuickReports/issues/2355
planetaminecraft.com##+js(set, ab, false)

! https://github.com/uBlockOrigin/uAssets/issues/6620
@@||aasarchitecture.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6618
softwaredescargas.com##+js(aeld, DOMContentLoaded, scriptwz_url)
softwaredescargas.com##+js(aopr, scriptwz_url)

! https://www.reddit.com/r/uBlockOrigin/comments/e0uvbc/justlightnovelscom_stuck_on_browser_checking/
@@||justlightnovels.com^$ghide
justlightnovels.com##.adsbyvli
jnovels.com##+js(aopw, KillAdBlock)
! https://charexempire.com/DWsil focus detection and popup
codesnse.com###paras-devgenerate ~ *
codesnse.com##[href^="https://play.google.com/"]
cybertechng.com##+js(set, blurred, false)
cybertechng.com##+js(set, go_popup, {})

! https://github.com/NanoMeow/QuickReports/issues/2357
cracking-dz.com##+js(aeld, load, 0x)

! https://github.com/NanoMeow/QuickReports/issues/2363
voipreview.org##+js(set, adblockEnabled, false)

! https://github.com/NanoMeow/QuickReports/issues/2367
@@||safelink-jozz.blogspot.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6621
yusepjaelani.blogspot.com###showadblock, .modal-backdrop
yusepjaelani.blogspot.com##body:style(overflow: auto !important)
|about:$popup,domain=yusepjaelani.blogspot.com
||yusepjaelani.blogspot.com^$csp=sandbox allow-forms allow-same-origin allow-scripts allow-modals allow-orientation-lock allow-pointer-lock allow-presentation allow-top-navigation
yusepjaelani.blogspot.com##+js(nostif, Debug)

! https://github.com/uBlockOrigin/uAssets/issues/6624
mega1080p.*##+js(aeld, DOMContentLoaded, btoa)
mega1080p.*##.bnr
@@||easyreaders.site^$ghide

! https://www.reddit.com/r/uBlockOrigin/comments/dyhwim/how_to_block_ads_in_imdb_tv/
! https://www.reddit.com/r/uBlockOrigin/comments/e2nc95/imdb_issue/
! https://www.reddit.com/r/uBlockOrigin/comments/ox0gco/any_way_to_block_ads_on_imdb_tv/
! /interstitial/*$xhr,redirect=noop-1s.mp4,domain=imdb.com
||imdb.com/tr/*pageHit$xhr,redirect=noopjs,domain=imdb.com
||fls-na.amazon.com/$xhr,redirect=noopjs,domain=imdb.com
*$media,redirect=noopmp3-0.1s,domain=imdb.com,3p
@@||media-imdb.com^$media,domain=imdb.com

! https://forums.lanik.us/viewtopic.php?f=98&t=43932&p=151462#p151449
presentation-ppt.com##+js(aeld, load, nextFunction)

! https://github.com/uBlockOrigin/uAssets/issues/6634
*$frame,xhr,script,3p,domain=bolly4umovies.*

! https://forums.lanik.us/viewtopic.php?f=91&t=43936
femina.ch##+js(aopr, _sp_.mms.startMsg)

! https://www.reddit.com/r/uBlockOrigin/comments/mxeds6/adblocker_detectet_only_first_post_available/
photovoltaikforum.com##+js(acs, $, offsetHeight)
photovoltaikforum.com##.wcfAdLocation:upward(li)

! fix mangahere.onl ads & anti adb
mangahere.onl##+js(aopr, AdservingModule)
mangahere.onl##+js(aopr, loadRunative)
mangahere.onl##.container.ads-container
||mangahere.onl/adsbygoogle.js$script,redirect=noopjs,1p

! https://github.com/NanoAdblocker/NanoFilters/issues/430
soy502.com##+js(acs, document.getElementById, length)

! https://github.com/NanoMeow/QuickReports/issues/2386
*$script,3p,denyallow=101placeonline.com|bootstrapcdn.com|cloudflare.com|cloudflare.net|disqus.com|disquscdn.com|fastly.net|fastlylb.net|google.com|googleapis.com|gstatic.com|hcaptcha.com|hwcdn.net|jquery.com|jsdelivr.net|jwpcdn.com|recaptcha.net|sportscentral.io,domain=mlbstreams.to|nbastreams.to|nflbite.com|nflstreams.to|nhlstreams.to|soccerstreams.net

! https://www.reddit.com/r/uBlockOrigin/comments/pebw5s/not_able_to_watch_videos/
hentaihaven.xxx##+js(noeval-if, debugger)
*$xhr,redirect-rule=nooptext,domain=hentaihaven.xxx
hentaihaven.xxx##+js(nowoif)
@@||hentaihaven.xxx^$script,1p
@@||hentaihaven.xxx^$ghide
||thedevs.cyou/hh/script-manager.js
! hentaihaven .com/icu ads, popup
||hentaihaven.icu/wp-content/plugins/sscript-manager/
||mult-imgs.cyou/images/*.gif$image,domain=hentaihaven.xxx
! interstitial page
hentaihaven.xxx##+js(aopw, Script_Manager)

! https://github.com/AdguardTeam/AdguardFilters/issues/43599#issuecomment-559967206
openloadmovies.*##+js(aopr, AaDetector)
streamango.*###ad_buts

! https://www.reddit.com/r/uBlockOrigin/comments/e3wccl/naughtymachinima_ads_before_video_not_blocked/
naughtymachinima.com##+js(aopr, loadTool)
naughtymachinima.com##+js(nowoif)
||naughtymachinima.com/*banner
||naughtymachinima.com/*preroll

! https://github.com/NanoMeow/QuickReports/issues/2399
@@||bonjourdefrance.com^$script,1p

! https://github.com/NanoMeow/QuickReports/issues/2400
@@||remix.es^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/9907
arabseed.*##+js(aeld, , _0x)
||arabseed.*/sw.js$script,1p
arabseed.*##.ads-aa

! https://github.com/uBlockOrigin/uAssets/issues/6640
! https://github.com/brave/brave-browser/issues/8453
lapresse.ca##+js(set, noBlocker, true)
lapresse.ca##+js(aopw, _sp_)

! https://github.com/uBlockOrigin/uAssets/issues/6641
||nxbrew.com/sw.js$script,1p

! https://github.com/NanoMeow/QuickReports/issues/2413
@@||tele-gratuit.net/analytics/adiframe.js$script,1p

! https://github.com/NanoMeow/QuickReports/issues/2414
sportsnaut.com###dsk-banner-ad-a
sportsnaut.com###dsk-box-ad-c

! https://github.com/NanoMeow/QuickReports/issues/2418
@@||seriesytv.tv^$ghide
seriesytv.tv##+js(nowebrtc)
||seriesytv.tv/*.html$frame,1p

! https://github.com/uBlockOrigin/uAssets/issues/6644
doodle.com##+js(aopr, _sp_._networkListenerData)

! https://github.com/uBlockOrigin/uAssets/issues/6645
seeitworks.com##+js(acs, document.getElementById, adblock)

! https://github.com/uBlockOrigin/uAssets/issues/6647
televisiongratishd.com##+js(acs, adBlockDetected)
televisiongratishd.com###ventana-flotante

! https://github.com/uBlockOrigin/uAssets/issues/2180
@@||hacknetfl1x.net^$ghide

! https://github.com/NanoMeow/QuickReports/issues/1699
||googlesyndication.com/pagead/js/adsbygoogle.js$xhr,domain=jmusic.me,redirect-rule=noopjs
##.mdp-deblocker-wrapper

! https://github.com/uBlockOrigin/uAssets/issues/6652
@@||classic-retro-games.com^$ghide
classic-retro-games.com##ins.adsbygoogle, #ad, .game-ad
/bab.min.js$script,1p

! https://github.com/NanoMeow/QuickReports/issues/2432
kolyoom.com##+js(nobab)
kolyoom.com##+js(set, adsbygoogle, null)

! https://github.com/NanoAdblocker/NanoFilters/issues/432
! https://github.com/AdguardTeam/AdguardFilters/issues/67191
bde4.*#@#a[href*=".yabo816."]
bde4.*##a[href*=".yabo816."]:remove()
bde4.*##+js(nofab)
bde4.*##+js(nano-sib)

! https://forums.lanik.us/viewtopic.php?f=62&t=43979&p=151701#p151701
dailysport.*##+js(acs, String.fromCharCode, atob)
dailysport.*,eplsite.uk##+js(aopr, AaDetector)
dailysport.*,eplsite.uk##+js(aopr, open)
eplsite.uk##[href="https://www.eplsite.uk/vm.html"]
*$script,3p,denyallow=bootstrapcdn.com|cloudflare.com|cloudflare.net|googleapis.com|hwcdn.net|jsdelivr.net,domain=dailysport.*

! https://github.com/NanoMeow/QuickReports/issues/2441
@@||lesmoutonsrebelles.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6656
@@||vietgamemod.net^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/148#issuecomment-562936063
##.amp-ad-inner
###placeAds
@@||cdn.ampproject.org/*/amp-ad-*.js$script,domain=aajtak.intoday.in
@@||taboola.com/*indiatoday$domain=ampproject.net
@@||trc.taboola.com/indiatoday

! dirtyship .com tabunder
dirtyship.com##+js(aopr, dataPopUnder)

! https://www.reddit.com/r/uBlockOrigin/comments/e7v537/fluid_player_doesnt_work_when_ublock_is_on/
porn00.org##+js(nowoif)
porn00.org##.table
porn00.org##div.headline[style]
||ang-content.com/*.mp4$media,redirect=noopmp3-0.1s,domain=porn00.org

! https://github.com/uBlockOrigin/uAssets/pull/10286
@@||sonyliv.com^$ghide
@@||sonyliv.com^$xhr,1p
!sonyliv.com##+js(json-prune, adProvider)

! https://github.com/uBlockOrigin/uAssets/issues/6662
@@||realmofdarkness.net^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2465
@@||magyarhang.org^$shide
||magyarhang.org/*.gif$image

! https://github.com/uBlockOrigin/uAssets/issues/6675
savevideo.tube##+js(aopr, AaDetector)
savevideo.tube##+js(nowoif)

! https://github.com/NanoMeow/QuickReports/issues/2474
files.cx##+js(aopr, AaDetector)

! https://forums.lanik.us/viewtopic.php?f=62&t=43994
devoloperxda.blogspot.com##+js(aeld, load, onload)

! https://forums.lanik.us/viewtopic.php?f=62&t=43996&p=151781#p151781
celebmix.com##+js(set, jQuery.adblock, false)

! https://github.com/NanoMeow/QuickReports/issues/2477
vttpi.com##+js(acs, document.createElement, adblock)

! https://www.reddit.com/r/uBlockOrigin/comments/e9d8dz/adblockdetector_on_rakutentv/
! https://github.com/uBlockOrigin/uAssets/issues/15819
@@||rakuten.tv^$ghide
@@||cdnjs.cloudflare.com/ajax/libs/rollbar.js/$script,domain=rakuten.tv
@@||search.spotxchange.com/vast/$xhr,domain=rakuten.tv
rakuten.tv##+js(no-xhr-if, /youboranqs01|spotx|springserve/)

! https://github.com/NanoMeow/QuickReports/issues/2483
@@||projectkorra.com/*/siropu/*/ads$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/6681
doofree88.com##+js(nano-sib, js-btn-skip, 1000)
||doofree88.com/storage/go/banner*.gif$image,1p
doofree88.com##.go-hard
doofree88.com##.placeholder

! https://github.com/NanoMeow/QuickReports/issues/2490
insidermonkey.com##+js(acs, Math, '0x)

! https://github.com/NanoMeow/QuickReports/issues/2492
tr.savefrom.net##+js(nowoif)
tr.savefrom.net##.second-btn-box

! https://github.com/NanoMeow/QuickReports/issues/2501
@@||meucdn.*^$script,xhr,1p
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=meucdn.vip
@@||cdn.jsdelivr.net/npm/videojs-contrib-ads/$domain=meucdn.vip
@@||meucdn.*^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6686
##a[href^="http://adtrack"]
##a[href*="/go.php?a_aid="]

! https://github.com/NanoMeow/QuickReports/issues/2506
@@||allvidview.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2516
letras.mus.br##+js(nostif, r(), 0)
letras.mus.br##[id^="pub"]

! https://github.com/NanoMeow/QuickReports/issues/2513
@@||batch.id^$ghide

! https://forums.lanik.us/viewtopic.php?f=114&t=44101#p151985
pakkotoisto.com##+js(acs, $, undefined)

! https://github.com/NanoMeow/QuickReports/issues/2517
androidonepro.com##+js(aopr, downloadJSAtOnload)

! https://old.reddit.com/r/uBlockOrigin/comments/ecd6id/removing_scrollblock_on_tagesanzeigerch/
! https://github.com/uBlockOrigin/uAssets/issues/6755
! https://www.reddit.com/r/uBlockOrigin/comments/e6lash/cant_log_in_on_digital_news_website/fkrke3j/
@@||tda.io^$xhr,domain=tagesanzeiger.ch
@@||tagesanzeiger.ch^$ghide
tagesanzeiger.ch,berneroberlaender.ch,derbund.ch##div[class^="TopAds"]

! https://github.com/NanoMeow/QuickReports/issues/2518
rmcmv.*##+js(nosiif, visibility)
rmcmv.*##[class*="ads"]

! https://github.com/NanoMeow/QuickReports/issues/2521
lecourrier-du-soir.com##+js(nosiif, iframe)

! https://github.com/NanoMeow/QuickReports/issues/2524
owllink.net##+js(nobab)
owllink.net##+js(aopr, app_vars.force_disable_adblock)
owllink.net##+js(aopr, open)
owllink.net##+js(nowebrtc)
owllink.net##+js(set, blurred, false)
owllink.net##.box-main p
owllink.net###link-view > br
owllink.net##iframe[src*="publisherAddr"]
owllink.net##[href^="https://padsbrown.com/"]
owllink.net##[src^="https://url-coin.com/"]
*$frame,script,3p,denyallow=consensu.org|google.com|gstatic.com|recaptcha.net|quantcast.com|cloudflare.com,domain=owllink.net
||i.ibb.co^$image,domain=owllink.net
@@||owllink.net^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6694
9gag.com##[id^="sidebar-stream-"] > h4:has-text(Advertisement)

! https://github.com/NanoMeow/QuickReports/issues/2298
! https://github.com/NanoMeow/QuickReports/issues/2525
gazzetta.it##+js(aeld, adblockActivated)

! https://github.com/uBlockOrigin/uAssets/issues/6702
upstream.to##+js(aopr, open)
upstream.to##+js(acs, globalThis, break;case)

! https://github.com/NanoMeow/QuickReports/issues/2529
! https://github.com/NanoMeow/QuickReports/issues/4789
! https://github.com/uBlockOrigin/uAssets/issues/16316
arcadepunks.com##+js(aopr, penci_adlbock)
arcadepunks.com##[class*="ads"]
@@||arcadepunks.com^$ghide
arcadepunks.com##.header-banner
arcadepunks.com##[href^="https://www.arcadepunks.com/go/"]
arcadepunks.com##.left-ad
arcadepunks.com##.right-ad
arcadepunks.com##.spMessageFailure
arcadepunks.com##[href^="https://gameroomsolutions.com/"]
arcadepunks.com##.custom-html-widget:not(.custom-html-widget:has([href*="arcadepunks.com"]))

! https://github.com/NanoMeow/QuickReports/issues/2534
osxinfo.net##+js(acs, $, btoa)

! https://www.reddit.com/r/uBlockOrigin/comments/edtpll/another_website_detecting_ublock/
myneobuxportal.com##+js(set, jQuery.adblock, false)

! https://github.com/uBlockOrigin/uAssets/issues/6720
wohnungsboerse.net##+js(aopr, Number.isNaN)
@@||wohnungsboerse.net^$xhr,1p
wohnungsboerse.net##[href*=".php"]

! https://github.com/NanoMeow/QuickReports/issues/2548
@@||football-lineups.com/dfp.js$script,1p

! https://github.com/NanoMeow/QuickReports/issues/2554
negumo.com##+js(set, fabActive, false)

! https://github.com/NanoMeow/QuickReports/issues/2557
rysafe.blogspot.com##+js(nostif, nextFunction, 250)

! impotsurlerevenu.org anti adb
@@||impotsurlerevenu.org^$ghide

! eletronicabr.com anti adb
eletronicabr.com##+js(nostif, test, 100)

! inkagames.com anti adb
@@||inkagames.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2564
@@||filmytoday.com^$ghide
filmytoday.com##.advertisement, .adsbygoogle
filmytoday.com##.i-am-centered
filmytoday.com##.title-section:has-text(/adv/i)

! https://github.com/uBlockOrigin/uAssets/issues/6732
@@||safetxt.*^$ghide
safetxt.*##ins.adsbygoogle

! https://github.com/NanoMeow/QuickReports/issues/2573
cyberstumble.com##+js(aopr, b2a)

! https://github.com/uBlockOrigin/uAssets/issues/6736
games.wkb.jp##+js(set, gWkbAdVert, true)
games.wkb.jp##+js(set, noblock, true)
@@||games.wkb.jp/ykg/assets/pc/ad_adsense_for_games$css,script,1p
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=games.wkb.jp

! https://github.com/NanoMeow/QuickReports/issues/2582
channelmyanmar.org##+js(aopr, adBD)
channelmyanmar.org##+js(set, ai_dummy, true)
channelmyanmar.org##+js(set, ulp_noadb, true)
||channelmyanmar.org/banners/*$image,1p
channelmyanmar.org##[src$=".gif"]
||roda.site^$3p

! https://github.com/NanoMeow/QuickReports/issues/2570
asmwall.com##+js(aopr, adblock)

! https://github.com/uBlockOrigin/uAssets/issues/6761
! https://github.com/uBlockOrigin/uAssets/issues/7190
! https://github.com/uBlockOrigin/uAssets/issues/8842
fandom.com##+js(set, wgAffiliateEnabled, false)
kenshi.fandom.com##+js(set, ads, null)
fandom.com##[id^="siderail_"][id*="_gamepedia"]
fandom.com###bodyContent:style(width:100% !important)
fandom.com##.instant-suggestion
fandom.com##.top-ads-container
||45tu1c0.com^
!#if env_mobile
fandom.com##.ad-slot-wrapper
!#endif
! https://github.com/uBlockOrigin/uAssets/issues/18777
fandom.com##li.top-results__item span:has-text(Sponsored):upward(li)

! https://www.reddit.com/r/uBlockOrigin/comments/p721xg/no_more_popup_after_recent_update/
139.99.33.192##.adpop
gdriveplayer.*##+js(aopr, AaDetector)
gdriveplayer.*##+js(nowoif, !gdrivedownload)
! https://75.119.159.228/yuusha-yamemasu-episode-9/

! https://github.com/realodix/AdBlockID/issues/163
! https://github.com/realodix/AdBlockID/issues/182
kordramass.com,kshowsubindo.org,senimovie.co##+js(acs, document.onclick, popunder)

! https://github.com/uBlockOrigin/uAssets/issues/6765
uptobox.com,uptostream.com##+js(set, jsUnda, noopFunc)

! https://github.com/uBlockOrigin/uAssets/issues/6767
earnload.*##+js(aopr, app_vars.force_disable_adblock)
earnload.*##+js(disable-newtab-links)
||earnload.*/sw.js$script,1p
*$image,3p,denyallow=earnload.com,domain=earnload.*

! https://github.com/uBlockOrigin/uAssets/issues/6768
shop123.com.tw##+js(aopw, daCheckManager)
orirom.com,romfirmware.com##+js(acs, eval, AdBlock)

! https://github.com/NanoMeow/QuickReports/issues/2624
evileaks.*##+js(acs, $, prompt)
@@||evileaks.*^$ghide
evileaks.*##ins.adsbygoogle

! https://github.com/NanoMeow/QuickReports/issues/2631
||adservice.google.com/adsid/integrator.js$xhr,redirect=noopjs,domain=maxedtech.com
maxedtech.com##.widget_custom_html

! https://github.com/NanoMeow/QuickReports/issues/2633
*$xhr,redirect-rule=nooptext,domain=btik.com

! https://github.com/realodix/AdBlockID/issues/187
dewabioskop21.org###main-popup

! https://github.com/NanoMeow/QuickReports/issues/2610
||protect-ad.com^$all

! popups drivefire .co/file/ FGZUI0DAGsHKdfW9NI2I
drivefire.co##+js(aopr, AaDetector)

! https://github.com/uBlockOrigin/uAssets/issues/6776
@@||yoursavegames.com^$ghide
yoursavegames.com##ins.adsbygoogle

! https://github.com/uBlockOrigin/uAssets/issues/19174
hexupload.net##+js(aopw, Fingerprint2)
!#if env_mobile
hexupload.net##+js(acs, document.createElement, rAb)
!#endif

! https://github.com/uBlockOrigin/uAssets/issues/6781
@@||the-man.gr^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2645
||firefaucet.win/*.gif$image

||35.238.205.163^$all
||releinemaoff.pro^

! https://www.reddit.com/r/uBlockOrigin/comments/eknsyf/popups_ads_etc_on_these_sites/
xanimeporn.com##+js(nowoif)

! https://github.com/NanoMeow/QuickReports/issues/2657
@@||d1-dm.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/5038#issuecomment-571271555
||300mbmovies4u.*/sw.js$script,1p

! sensualgirls .org exo stuff
sensualgirls.org##+js(aopr, document.dispatchEvent)
sensualgirls.org##.wide_boxcontent:has-text(/adb/i)
sensualgirls.org##.cbox_cont > div[style="text-align: center;"]
sensualgirls.org##div[data-width][style*="background-image: url"]:style(background: none !important)

! https://github.com/NanoMeow/QuickReports/issues/2674
call2friends.com##+js(aopr, onload)
call2friends.com#@#.adWrapper

! https://github.com/NanoMeow/QuickReports/issues/2676
bladesalvador.com##+js(set, adblock, false)

! https://github.com/NanoMeow/QuickReports/issues/2679
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=folhabv.com.br
folhabv.com.br##.publicidade-asynchronous

! https://github.com/NanoMeow/QuickReports/issues/2682
jacquieetmichel.net##+js(set, is_adblocked, false)

! https://github.com/NanoMeow/QuickReports/issues/2686
@@||keneono.site^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6796
fruitlab.com##+js(set, adBlockDetected, noopFunc)
@@||fruitlab.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6799
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect-rule=google-ima.js,domain=babygames.com

! https://github.com/uBlockOrigin/uAssets/issues/6798
@@||audio-sound-premium.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6797
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=okyanime.com

! https://github.com/uBlockOrigin/uAssets/issues/5305#issuecomment-572308826
! https://github.com/AdguardTeam/AdguardFilters/issues/115682
@@||wallpaperwaifu.com^$ghide
wallpaperwaifu.com##.ads-between-post:upward(.post-item)
wallpaperwaifu.com##ins.adsbygoogle

||padspms.com^$all

! https://github.com/uBlockOrigin/uAssets/issues/6802
sh0rt.cc##+js(aopr, adBlockDetected)

! https://github.com/uBlockOrigin/uAssets/issues/6804
aeonax.com##+js(noeval-if, debugger)
@@||aeonax.com^$ghide
*$frame,redirect-rule=noopframe,domain=camera.aeonax.com

! https://github.com/NanoMeow/QuickReports/issues/2696
@@||omekon.blogspot.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2698
dobrapogoda24.pl##+js(nostif, , 1)

! 9hentai onclick popup/under
9hentai.*##+js(aeld, click, saveLastEvent)
9hentai.*###ads

! https://github.com/uBlockOrigin/uAssets/issues/6807
@@||chuppito.fr^$ghide
||chuppito.fr/ext/*/privacypolicy/styles/all/template/remove_url.js$script,1p

! https://github.com/NanoMeow/QuickReports/issues/2701
@@||rtl.it^$script,1p
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=rtl.it

! https://github.com/uBlockOrigin/uAssets/issues/6814
web2.0calc.*##+js(aopr, doads)
||web2.0rechner.de/*/$frame
||web2.0calc.*/*/$frame
web2.0rechner.de,web2.0calc.*###abmodal, body > .in.modal-backdrop
web2.0rechner.de,web2.0calc.*##body:style(overflow: auto !important)
web2.0rechner.de,web2.0calc.*###nocreditsmodal
web2.0rechner.de,web2.0calc.*##.first

! https://github.com/uBlockOrigin/uAssets/issues/811
@@||bzbasel.ch^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2722
bacakomik.co##+js(nowoif)
*.gif$domain=bacakomik.co,image

! https://github.com/NanoMeow/QuickReports/issues/2740
@@||mastercoria.com^$script,1p

! https://forums.lanik.us/viewtopic.php?f=62&t=44174
gaybeeg.info##+js(acs, String.fromCharCode, 'shift')
gaybeeg.info##+js(aopr, popjs)
gaybeeg.info##+js(nowebrtc)
*$script,3p,domain=gaybeeg.info

! https://github.com/uBlockOrigin/uAssets/issues/10363
keralatelecom.info##+js(nostif, adb)
keralatelecom.info##.ai-viewports

! https://github.com/uBlockOrigin/uAssets/issues/6823
extreme-down.*##+js(acs, $, friendlyduck)
extreme-down.*##+js(acs, Math, decodeURIComponent)

! https://github.com/NanoMeow/QuickReports/issues/2748
nzpocketguide.com##+js(aopr, adsanity_ad_block_vars)

! https://github.com/uBlockOrigin/uAssets/issues/6828
webcamsdolls.com##+js(nostif, offsetWidth)
*.php$script,domain=webcamsdolls.com
webcamsdolls.com##.sponsor
||mwcvu.com^$3p

! https://github.com/uBlockOrigin/uAssets/issues/6829
fussball.news##+js(aopr, adBlockDetected)

! https://forums.lanik.us/viewtopic.php?f=64&t=44188
tvchoicemagazine.co.uk##+js(acs, $, onload)

! nensaysubs.net anti adb
@@||nensaysubs.net^$ghide
||nensaysubs.net/images/logonensay.ico$image,1p,redirect=1x1.gif
nensaysubs.net###outerdiv

! https://github.com/uBlockOrigin/uAssets/issues/22781
gnula.*##+js(nowoif)
||gnula.*/player/vast*xml|$xhr,1p

! https://github.com/uBlockOrigin/uAssets/issues/840
stream.nbcsports.com##+js(set, adBlockEnabled, false)
@@||v.fwmrm.net/ad/g/1$xhr,domain=stream.nbcsports.com

! https://github.com/NanoMeow/QuickReports/issues/2774
@@||redsoccer.info^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2776
porngo.com##+js(aopr, AaDetector)
||porngo.com^$csp=child-src *
porngo.com##+js(nowoif)
*preRoll$xhr,domain=porngo.com

! https://github.com/uBlockOrigin/uAssets/issues/6847
*$xhr,redirect-rule=noopjs,domain=audioblog.com

! https://github.com/uBlockOrigin/uAssets/issues/6850
@@||easy-firmware.com/templates/default/html/en/assets/js/fingerprint2.min.js$script,1p

! https://forums.lanik.us/viewtopic.php?f=62&t=44210
@@||freetempsms.com^$ghide
||s3.amazonaws.com/callloop/banners/$3p,image
||mityneedn.com^
||perfotrack.com^

! https://github.com/NanoMeow/QuickReports/issues/2788
||fundingchoicesmessages.google.com^$3p
! https://github.com/orgs/uBlockOrigin/teams/ublock-filters-volunteers/discussions/289
! google contributor anti adblock
#@#[class^="div-gpt-ad"]
#@#[id^="div-gpt-ad"]
#@#div[id^="div-gpt-"]
##[class^="div-gpt-ad"]:not([style^="width: 1px; height: 1px; position: absolute; left: -10000px; top: -"])
##[id^="div-gpt-ad"]:not([style^="width: 1px; height: 1px; position: absolute; left: -10000px; top: -"])
##div[id^="div-gpt-"]:not([style^="width: 1px; height: 1px; position: absolute; left: -10000px; top: -"])

! https://github.com/uBlockOrigin/uAssets/issues/6862
@@||demokrasistyle.blogspot.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6864
dloady.com##+js(acs, $, show)

! https://github.com/NanoMeow/QuickReports/issues/2805
sobatkeren.*##+js(nowoif)
||sobatkeren.*/img/banner/$image

! https://github.com/NanoMeow/QuickReports/issues/2806
movieon21.*##+js(nowoif)
*.gif$domain=movieon21.*,image

! https://github.com/uBlockOrigin/uAssets/issues/6865
pornfactors.com##+js(acs, jQuery, popunder)

! https://www.reddit.com/r/uBlockOrigin/comments/esrkxo/help_adblocker_detected/
@@||javplayer.com^$ghide
javplayer.com###player-advertising

! https://github.com/uBlockOrigin/uAssets/issues/10413
animekaizoku.com##+js(aopr, decodeURI)
*$script,3p,denyallow=b-cdn.net|disqus.com|jsdelivr.net|jwpcdn.com|fastly.net|fastlylb.net|jquery.com|hetrixtools.com|hwcdn.net|recaptcha.net|cloudflare.com|cloudflare.net|google.com|googleapis.com|gstatic.com|twimg.com|twitter.com|x.com,domain=animekaizoku.com

! https://forums.lanik.us/viewtopic.php?p=152241#p152241
||doubleclick.net^$domain=pccomponentes.com,important
||googlesyndication.com^$domain=pccomponentes.com,important
||googletagservices.com^$domain=pccomponentes.com,important
||omtrdc.net^$xhr,domain=pccomponentes.com,important
pccomponentes.com##div[id^="div-gpt-ad-"]

! https://github.com/uBlockOrigin/uAssets/issues/2475
! https://www.reddit.com/r/uBlockOrigin/comments/17sd1co/request_fix_for_spacecom/
techradar.com##+js(aopr, _sp_._networkListenerData)
gamesradar.com,techradar.com,tomsguide.com,tomshardware.com,whathifi.com##.mobile-leaderboard-320-50:upward([style])
androidcentral.com,gamesradar.com,livescience.com,pcgamer.com,space.com,techradar.com,tomsguide.com,tomshardware.com,whathifi.com,windowscentral.com##.related-articles-block
androidcentral.com,gamesradar.com,livescience.com,pcgamer.com,space.com,techradar.com,tomsguide.com,tomshardware.com,whathifi.com,windowscentral.com##.van_taboola
whathifi.com##.dfp-leaderboard-container
whathifi.com###ultimedia_wrapper
whathifi.com##.slot-leaderboard
whathifi.com##.adunit

! https://github.com/NanoMeow/QuickReports/issues/2836
modebaca.com##+js(aopr, app_vars.force_disable_adblock)
modebaca.com##+js(acs, $, click)
modebaca.com##[href="https://www.tautan.pro/"]

! crichd .sc / .com / .cx / to / .tv popups
crichd.*##+js(aopr, AaDetector)

! https://github.com/NanoMeow/QuickReports/issues/2846
ticonsiglio.com##+js(aopr, jQuery.adblock)

! https://github.com/NanoMeow/QuickReports/issues/1835
mtlurb.com##+js(nostif, purple_box)

! https://github.com/uBlockOrigin/uAssets/issues/4737
! 123moviesc. cyou
123moviesc.*##+js(aopr, mm)

! https://github.com/uBlockOrigin/uAssets/issues/2484
mkvcinemas.*##+js(nowoif)
*$script,3p,denyallow=googleapis.com,domain=mkvcinemas.*

! https://github.com/uBlockOrigin/uAssets/issues/6890
debgen.fr##+js(acs, addEventListener, nextFunction)

! https://github.com/NanoMeow/QuickReports/issues/2866
@@||mabzicle.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6894
*$popunder,domain=convert2mp3.tv,3p

! https://github.com/uBlockOrigin/uAssets/issues/6895
daily-times.com##+js(aopr, _sp_._networkListenerData)

! https://github.com/NanoMeow/QuickReports/issues/2868
@@||googlesyndication.com/pagead/js/adsbygoogle.js$script,domain=lexigram.gr

! https://github.com/NanoMeow/QuickReports/issues/2869
||vidazoo.com^$domain=readonepiece.com
readonepiece.com###vidazoo-player-div

! https://github.com/NanoMeow/QuickReports/issues/2870
! https://github.com/uBlockOrigin/uAssets/issues/8411#issuecomment-752413056
imgbaron.com##+js(aopr, loadTool)
imgbaron.com##[src="https://imgbaron.com/chrome.ads.png"]
imgbaron.com##p.newsbar_b
imgbaron.com##div[style^="display: block; position: fixed; z-index"]
imgbaron.com###fadeinbox

! https://github.com/uBlockOrigin/uAssets/issues/15329
! https://github.com/uBlockOrigin/uAssets/issues/16372
! https://github.com/uBlockOrigin/uAssets/issues/16427
! https://github.com/uBlockOrigin/uAssets/issues/20520
##.samBannerUnit, .samCodeUnit
@@||ads.hausbau-forum.de/openad.js$script,1p
hausbau-forum.de##+js(no-xhr-if, adsbygoogle)
hausbau-forum.de##+js(set, detectAdblock, noopFunc)
*$script,redirect-rule=noopjs,domain=hausbau-forum.de
!#if cap_html_filtering
hausbau-forum.de##^script:has-text(Adblock)
!#else
hausbau-forum.de##+js(rmnt, script, Adblock)
!#endif

! https://github.com/NanoMeow/QuickReports/issues/2878
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=adnan-tech.com

! nbareplayhd.com anti adb
nbareplayhd.com##+js(aopr, adblockDetector)

! heavy-r .com nsfw ads (srcdoc)
||heavy-r.com^$csp=child-src *
heavy-r.com##.mob-ban
heavy-r.com##.nopop.hd-bar

! showbiz .cz ads (srcdoc)
||showbiz.cz^$csp=child-src *

! https://www.her.ie/celeb/what-ever-happened-to-enrique-iglesias-mole-269224 (scroll issue)
her.ie##html:style(overflow: auto !important)

! https://github.com/NanoMeow/QuickReports/issues/2889
warps.club##+js(aopr, adblockDetect)

! https://github.com/NanoMeow/QuickReports/issues/2890
*$script,redirect-rule=noopjs,domain=texviewer.herokuapp.com

! https://github.com/NanoMeow/QuickReports/issues/2897
fake-it.ws##+js(set, adsLoadable, true)

! https://www.reddit.com/r/uBlockOrigin/comments/ew9p5z/anti_adblocker_on_881903com/
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,redirect-rule=noopjs,domain=881903.com

! https://github.com/NanoMeow/QuickReports/issues/2901
cuatrolatastv.blogspot.com##+js(nobab)
cuatrolatastv.blogspot.com##+js(acs, _pop)
||sites.google.com/site/rvdmarcrailcatrain/home/tomber.js$script

! https://github.com/NanoMeow/QuickReports/issues/2902
dramakrsubindo.blogspot.com##+js(aopr, open)
||protectsurf-a.akamaihd.net^
||akamaihd.net/*&affid

! pelispedia. one popup
pelispedia.*##+js(acs, allclick_Public)
pelispedia.*##+js(nano-stb)
pelispedia24.*,streamplusvip.xyz##+js(nowoif)
pelispedia.*,pelispedia24.*##+js(ra, href, a#clickfakeplayer)
pelispedia.*##+js(ra, href, #opfk)
pelispedia.*##+js(ra, href, .fake_player > [href][target])
premiumstream.live##+js(ra, href, .link)
pelispedia.*##a.btns
pelispedia.*##div.mb-5.text-center
pelispedia.*##.cont.principal > .site-main > .links
pelispedia.*##.img-responsive
pelispedia.*##.mvic-btn
pelispedia.*##[class^="page_speed_"][href] > img[src$="app.png"]
pelispedia24.*##.button
pelispedia24.*##.asgdc
pelispedia24.*##.preplayer
pelispedia24.*##[href^="/acceso-total-sin-limite"]
||pelispedia.*/*sw.js$script,1p
*$script,3p,denyallow=cloudflare.com|cloudflare.net|google.com|googleapis.com|gstatic.com|jsdelivr.net,domain=pelispedia.*
pelisplayer.xyz##+js(aopr, doSecondPop)
pelispedia.*##[href^="https://settledchagrinpass.com/"]

! pelis28.co ads
pelis28.*##+js(nowoif)
pelis28.*##+js(ra, href, #clickfakeplayer)
pelis28.*##.buttons-p
pelis28.*###options-0

! verpelistoday.com popup ads
verepeliculas.com#@#.fake_player
verepeliculas.com##+js(ra, href, .fake_player > a[href])
verepeliculas.com##a[href^="https://www.verepeliculas.com/dowload/"]
playembed.xyz,playtemporal.xyz##+js(nowoif)
playembed.xyz##+js(set, clientSide.adbDetect, noopFunc)
playnetutem1.xyz##+js(aopr, doSecondPop)

! https://github.com/NanoMeow/QuickReports/issues/2903
grid.id##+js(acs, Math, '\x)

! https://github.com/NanoMeow/QuickReports/issues/2737
kompasiana.com##+js(aopr, initAdserver)
||asset.kompas.com/data/*/kgmedia/js/*notif$script

! https://github.com/NanoMeow/QuickReports/issues/2912
publish0x.com###registerModal, .show.fade.modal-backdrop
publish0x.com##body:style(overflow: auto !important;)

! https://github.com/jspenguin2017/uBlockProtector/issues/1102
*$script,redirect-rule=noopjs,domain=myschool-eng.com

! https://github.com/uBlockOrigin/uAssets/issues/6907
*$script,redirect-rule=noopjs,domain=ehubsoft.herokuapp.com

! https://www.reddit.com/r/uBlockOrigin/comments/exo1ye/ieeeorg_interstitial/
spectrum.ieee.org##+js(aopr, splashpage.init)

! https://github.com/NanoMeow/QuickReports/issues/2925 doujindesu .ch, .site
doujindesu.*##+js(aeld, load, 2000)

! https://github.com/NanoMeow/QuickReports/issues/2930
port.hu##+js(aeld, DOMContentLoaded, offsetHeight)
port.hu##+js(nostif, offsetHeight)
indavideo.hu##+js(nano-sib)
indavideo.hu###ad
indavideo.hu###preroll
@@||port.hu/js/ads.min.js$script,1p
@@||port.hu^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6911
cutdl.xyz##+js(aopr, app_vars.force_disable_adblock)
cutdl.xyz##+js(set, blurred, false)
cutdl.xyz##.banner

! https://github.com/NanoMeow/QuickReports/issues/2923
dziennikbaltycki.pl,dzienniklodzki.pl,dziennikpolski24.pl,dziennikzachodni.pl,echodnia.eu,expressbydgoski.pl,expressilustrowany.pl,gazetakrakowska.pl,gazetalubuska.pl,gazetawroclawska.pl,gk24.pl,gloswielkopolski.pl,gol24.pl,gp24.pl,gra.pl,gs24.pl,kurierlubelski.pl,motofakty.pl,naszemiasto.pl,nowiny24.pl,nowosci.com.pl,nto.pl,polskatimes.pl,pomorska.pl,poranny.pl,sportowy24.pl,strefaagro.pl,strefabiznesu.pl,stronakobiet.pl,telemagazyn.pl,to.com.pl,wspolczesna.pl##+js(aeld, , show)
||ppstatic.pl/*/reklama.js$script,domain=dziennikbaltycki.pl|dzienniklodzki.pl|dziennikpolski24.pl|dziennikzachodni.pl|echodnia.eu|expressbydgoski.pl|expressilustrowany.pl|gazetakrakowska.pl|gazetalubuska.pl|gazetawroclawska.pl|gk24.pl|gloswielkopolski.pl|gol24.pl|gp24.pl|gra.pl|gs24.pl|kurierlubelski.pl|motofakty.pl|naszemiasto.pl|nowiny24.pl|nowosci.com.pl|nto.pl|polskatimes.pl|pomorska.pl|poranny.pl|sportowy24.pl|strefaagro.pl|strefabiznesu.pl|stronakobiet.pl|telemagazyn.pl|to.com.pl|wspolczesna.pl,important

! https://www.reddit.com/r/uBlockOrigin/comments/ey5bd4/adblock/
*$script,redirect-rule=noopjs,domain=onemanhua.com
onemanhua.com##+js(aeld, /.?/, popMagic)
onemanhua.com##+js(nostif, checkSiteNormalLoad)
||onemanhua.com/js/ad/$image
@@||onemanhua.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6920
@@||euconfesso.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6919
@@||rndnovels.com^$ghide

! https://github.com/AdguardTeam/AdguardFilters/issues/49109
! https://github.com/NanoMeow/QuickReports/issues/4327
laksa19.github.io##+js(aost, console.log, /blob|injectedScript/)
laksa19.github.io##+js(set, ASSetCookieAds, null)
laksa19.github.io##+js(nostif, 0x)
*$script,redirect-rule=noopjs,domain=laksa19.github.io

! https://github.com/AdguardTeam/AdguardFilters/issues/49181
@@||guncelakademi.com^$ghide
guncelakademi.com##ins.adsbygoogle

! mangacanblog .com anti adb
mangacanblog.com##+js(aeld, load, nextFunction)

! javnew.net popups
javnew.net##+js(acs, document.querySelectorAll, adConfig)

! https://forums.lanik.us/viewtopic.php?f=62&t=44269
@@||sololeveling.net^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2941
motohigh.pl##+js(nostif, , 1)

! https://forums.lanik.us/viewtopic.php?f=62&t=44272
orangespotlight.com##+js(aopr, adBlockDetected)

! https://github.com/uBlockOrigin/uAssets/issues/6925
thenation.com##+js(aopr, ___tp)

! https://github.com/AdguardTeam/AdguardFilters/issues/49232
@@||remixsearch.co^$ghide

! https://www.camp-firefox.de/forum/thema/111753-%C2%B5block-origin-ad-blocker-diskussionsthread/?postID=1136485#post1136485
! https://github.com/easylist/easylistgermany/issues/345
t3n.de##+js(nostif, adBlockOverlay)
t3n.de##.outbrain-wrapper-outer

! https://github.com/AdguardTeam/AdguardFilters/issues/49248
@@||erovoice.us^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2947
ar-atech.blogspot.com##+js(aopr, adBlockDetected)

! https://github.com/NanoMeow/QuickReports/issues/2949
*$script,redirect-rule=noopjs,domain=kurnasional.blogspot.com

! https://github.com/AdguardTeam/AdguardFilters/issues/49255
newsonthegotoday.com##+js(aopr, STREAM_CONFIGS)
newsonthegotoday.com##+js(ra, target, .clickbutton)
newsonthegotoday.com##.clickbutton:not([data-href])
newsonthegotoday.com##.viewtable:has(> center:has-text(▼ Scroll down to Continue ▼)) > a[href][target="_blank"]

! https://github.com/AdguardTeam/AdguardFilters/issues/49273
okulsoru.com##+js(acs, addEventListener, google_ad_client)

! https://github.com/uBlockOrigin/uAssets/issues/6926
ex-foary.com##+js(aopr, app_vars.force_disable_adblock)
ex-foary.com##+js(aopr, open)
ex-foary.com##+js(nowebrtc)
ex-foary.com##.banner-inner
forex-trnd.com##+js(nosiif, visibility, 1000)
||gkxyifeulfpb.com^
||gregorfines.com^
||needntrusts.com^

! https://github.com/NanoMeow/QuickReports/issues/2951
clixwarez.blogspot.com##+js(aopr, adBlockDetected)

! https://github.com/NanoMeow/QuickReports/issues/2952
allindiaroundup.com##+js(nostif, Detected, 500)

! thewizardsmanse .com anti adb
@@||thewizardsmanse.com^$script,1p

! fellowsfilm .com anti adb
fellowsfilm.com##+js(acs, document.querySelector, XF)
fellowsfilm.com##[data-author="Advertisement"]

! zwergenstadt .com anti adb
zwergenstadt.com##+js(aeld, load, onload)

! netaffiliation .com anti adb
netaffiliation.com##+js(acs, $, hide)

! https://github.com/uBlockOrigin/uAssets/issues/6929
gigaho.com##+js(aopr, onload)

! https://github.com/NanoMeow/QuickReports/issues/2962
@@||geekdrop.com^$ghide

! https://forums.lanik.us/viewtopic.php?f=62&t=44281
@@||erepublik.tools^$ghide

! ebook300.com/longfiles.com popups
ebook3000.com,longfiles.com##+js(aopw, adcashMacros)

! https://github.com/uBlockOrigin/uAssets/issues/6932
tapchipi.com##+js(nostif, mdp)

! https://github.com/NanoMeow/QuickReports/issues/2963 popups
oceanof-games.com##+js(aopr, open)

! https://github.com/NanoMeow/QuickReports/issues/2968
||poptival.com^

! https://github.com/NanoMeow/QuickReports/issues/2973
@@||insideedition.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2974
hobby-machinist.com##+js(nostif, show)
hobby-machinist.com##.samCodeUnit

! https://github.com/NanoMeow/QuickReports/issues/2975
jacquieetmichelelite.com##+js(acs, $, show)
*$popunder,domain=jacquieetmichelelite.com

! https://github.com/NanoMeow/QuickReports/issues/2980
*$script,redirect-rule=noopjs,domain=puregym.com

! https://github.com/NanoMeow/QuickReports/issues/2982
@@||filegrade.com^$script,1p

! https://github.com/NanoMeow/QuickReports/issues/2988
arenabg.com##+js(aopr, AaDetector)
arenabg.com##[href^="http://bit.ly"]

! https://www.reddit.com/r/uBlockOrigin/comments/f14wsh/antiadblock_on_honeyhunterworldcom/
! https://github.com/NanoMeow/QuickReports/issues/1243
@@||honeyhunterworld.com/*/js/blockadblock.js$script,1p
@@||honeyhunterworld.com^$ghide
honeyhunterworld.com##div[class*="ad_"]

! https://github.com/AdguardTeam/AdguardFilters/issues/49492
@@||speed-down.org^$ghide

! https://github.com/AdguardTeam/AdguardFilters/issues/49505
dr-farfar.com##+js(aeld, , ads)
dr-farfar.com##+js(aopr, mdpDeBlocker)
dr-farfar.com##+js(nowoif)
dr-farfar.com##.essb-sharebooster
dr-farfar.com##.essb-sharebooster-overlay
||mrfog.com^$domain=dr-farfar.net

! https://forums.lanik.us/viewtopic.php?p=153496#p153496
pornhat.*##+js(aopr, document.dispatchEvent)
vr.pornhat.*#@#+js(aopr, document.dispatchEvent)
pornhat.*##.bns-bl-new.bns-bl
pornhat.*##div.player-bn
pornhat.*##.video-block > .show.before-player
pornhat.*##b
pornhat.*##.top_spot
||doublepimpads.com^$3p
||pornhat.*/static/js/300x250.

! https://forums.lanik.us/viewtopic.php?f=62&t=44297
bccondos.net###exampleModal
bccondos.net##.in.fade.modal-backdrop
bccondos.net##body:style(overflow: auto !important;)

! https://github.com/uBlockOrigin/uAssets/issues/6940
yepi.com##+js(acs, $, modal)

! https://github.com/NanoMeow/QuickReports/issues/2991
@@||ponselharian.com^$ghide
ponselharian.com##ins.adsbygoogle

! https://github.com/NanoMeow/QuickReports/issues/2992
napi.hu##+js(acs, $, show)

! https://github.com/NanoMeow/QuickReports/issues/2996
@@||gamepccrack.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/2997
*$xhr,frame,3p,domain=pcgamez-download.com
pcgamez-download.com##+js(aost, Math, inlineScript)

! https://github.com/AdguardTeam/AdguardFilters/issues/49559
av-uncen.com##+js(aopr, adBlockDetected)

! https://github.com/AdguardTeam/AdguardFilters/issues/49560
spaziogames.it##+js(acs, $, .test)

! https://github.com/AdguardTeam/AdguardFilters/issues/147745
boyfriendtv.com##+js(aopw, backgroundBanner)
boyfriendtv.com##+js(aeld, click, interstitial)
boyfriendtv.com##+js(aopr, popunder)
boyfriendtv.com##li[class]:has(a[href^="https://boyfriend.show/"][rel="sponsored"])
boyfriendtv.com##.js-toggle-content-wrapper a[href^="https://boyfriend.show/"][rel="sponsored"]:upward(.js-toggle-content-wrapper)
boyfriendtv.com##.ads-block-rightside
||cdn.nsimg.net/cache/landing^
||catsnbootsncats2020.com^
||boyfriendlive.com^$3p

! https://github.com/NanoMeow/QuickReports/issues/3009
! https://github.com/NanoMeow/QuickReports/issues/3281
1shortlink.com##+js(set, letShowAds, true)
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noop.js:10,domain=1shortlink.com
||youtube.com/embed/*$domain=1shortlink.com
@@||1shortlink.com^$ghide
1shortlink.com##[id*="ScriptRoot"]

! numbeo .com anti adb
@@||numbeo.com^$script,1p

! https://github.com/NanoMeow/QuickReports/issues/3010
||googlesyndication.com/pagead/js/adsbygoogle.j$xhr,redirect=noopjs,domain=botayit.com

! https://github.com/NanoMeow/QuickReports/issues/466
vectorizer.io##+js(nostif, modal)
vectorizer.io##[href^="https://track.fiverr.com/"]

! https://www.reddit.com/r/uBlockOrigin/comments/f25295/ublocked_get_detected_in_this_site/
||jsdelivr.net/*/levelmaxblock.js$script,3p

! https://github.com/NanoMeow/QuickReports/issues/3016
porndaa.com##+js(aeld, getexoloader)

! https://github.com/AdguardTeam/AdguardFilters/issues/49626
@@||earlymanga.website^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6945
@@||sfirmware.com^$ghide
||jsdelivr.net/*/adb-analytics$script,3p
sfirmware.com##+js(nano-sib)
sfirmware.com##.cc-window
sfirmware.com##.post-ads
sfirmware.com##.buy_on_amazon

! https://github.com/uBlockOrigin/uAssets/issues/6946
hostingunlock.com##+js(acs, $, show)

! https://github.com/NanoMeow/QuickReports/issues/3029
*$script,redirect-rule=noopjs,domain=tgbeautymedia.blogspot.com

! https://github.com/NanoMeow/QuickReports/issues/3030
wickedspot.org##+js(aopr, b2a)

! https://github.com/NanoMeow/QuickReports/issues/3031
*$script,redirect-rule=noopjs,domain=sportif.id

! https://github.com/uBlockOrigin/uAssets/issues/6951
@@||erai-raws.info^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/10829
##[href*="//agacelebir.com"]

! https://github.com/AdguardTeam/AdguardFilters/issues/49747
@@||smashresume.com^$ghide

! NSFW popups exo ads
18-teen-sex.com,18-teen-tube.com,18girlssex.com,18teen-tube.com,18tubehd.com,2017tube.com,3prn.com,sexmoza.com,yogranny.com,youfreepornotube.com,youngleak.com,zhlednito.cz##+js(acs, document.dispatchEvent, myEl)
24pornvideos.com,2japaneseporn.com,xxxvideor.com,youngleak.com,zhlednito.cz##+js(aopr, ExoLoader.serve)
zhlednito.cz##+js(nosiif, /^/)
nakedarab-tube.com,xxxtubepass.com,yestubemature.com,yourhomemadetube.com,yourtranny-sex.com##+js(aopr, Aloader.serve)
yeswegays.com,youramateurtube.com##+js(nowoif)
ganstamovies.com,youngleak.com##+js(aeld, getexoloader)
18girlssex.com##+js(aopr, decodeURI)
||youramateurtube.com/sw.js$script,1p

! https://github.com/NanoMeow/QuickReports/issues/3035
ringsidenews.com##+js(aopr, googletag)

! https://github.com/NanoMeow/QuickReports/issues/3036
watchmonkonline.com##+js(aopr, open)

! https://github.com/NanoMeow/QuickReports/issues/3039
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=motorsport.tv,redirect-rule=google-ima.js
||static.adsafeprotected.com/vans-adapter-google-ima.js$script,domain=motorsport.tv,redirect-rule=google-ima.js

! https://github.com/NanoMeow/QuickReports/issues/3041
convert-case.softbaba.com##+js(aopr, adblockDetector)

! https://www.reddit.com/r/uBlockOrigin/comments/f3qlxr/antiadblock/
fotografareindigitale.com##+js(acs, jQuery, ai_adb)

! https://github.com/NanoMeow/QuickReports/issues/3044
nesia.my.id##+js(set, tidakAdaPenghalangAds, true)

! https://github.com/uBlockOrigin/uAssets/pull/9791
*$script,redirect-rule=noopjs,domain=allkaicerteam.com
@@||allkaicerteam.com^$ghide
allkaicerteam.com##ins.adsbygoogle

! https://github.com/NanoMeow/QuickReports/issues/3048
@@||meutimao.com.br^$ghide

! https://github.com/NanoMeow/QuickReports/issues/3050
rbxoffers.com##+js(nostif, adblock)

! https://github.com/uBlockOrigin/uAssets/issues/6955
tvn24.pl##+js(json-prune, playlist.movie.advertising.ad_server)
@@||cdntvn.pl/*/advert.js$xhr,domain=tvn24.pl

! https://www.reddit.com/r/uBlockOrigin/comments/f45bvt/stop_ublock_from_creating_new_tabs/
gomoviesfree.*##+js(aopr, glxopen)

! https://github.com/AdguardTeam/AdguardFilters/issues/49873
@@||uragongaming.blogspot.com^$ghide

! https://github.com/AdguardTeam/AdguardFilters/issues/49879
brandstofprijzen.info##+js(aeld, load, antiblock)

! https://github.com/AdguardTeam/AdguardFilters/issues/49892
theandroidpro.com##+js(aopr, adBlockDetected)

! https://github.com/AdguardTeam/AdguardFilters/issues/49925
tiny.do##+js(aopr, app_vars.force_disable_adblock)
tiny.do###download3:style(display: block !important;)
tiny.do##a[href^="https://mob1ledev1ces.com"]
tiny.do##.banner

! https://github.com/AdguardTeam/AdguardFilters/issues/89560
netfuck.net##+js(aeld, DOMContentLoaded, adsBlocked)

! https://github.com/uBlockOrigin/uAssets/issues/6964
webtor.io##+js(nowoif)
webtor.io##.alerts
webtor.io##.me-ad-container

! https://github.com/NanoMeow/QuickReports/issues/3067
phimgi.tv##+js(acs, jQuery, popup)
@@||player.phimnhe.net^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/6965
nirjonmela.com##+js(acs, $, AdBlock)

! https://github.com/AdguardTeam/AdguardFilters/issues/78722
thgss.com##+js(nosiif, adsbygoogle)
@@||thgss.com^$script,1p

! https://github.com/AdguardTeam/AdguardFilters/issues/50016
u-s-news.com##+js(set, ulp_noadb, true)

! https://forums.lanik.us/viewtopic.php?f=62&t=44320
redbox.com##.rb-ad-leaderboard-container
*$image,redirect-rule=2x2.png,domain=redbox.com

! https://forums.lanik.us/viewtopic.php?p=153011#p153011
yggtorrent.*##+js(aopw, Fingerprint2)

! https://www.reddit.com/r/uBlockOrigin/comments/f5nksl/antiadblock/
thefastlaneforum.com##+js(nostif, .show, 1000)

! https://github.com/NanoMeow/QuickReports/issues/3077
zeeebatch.blogspot.com##+js(aopr, adBlockDetected)

! https://github.com/NanoMeow/QuickReports/issues/3092
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=infolokerserang.com

! https://github.com/uBlockOrigin/uAssets/issues/13751
! https://github.com/uBlockOrigin/uAssets/issues/18299
@@||luscious.net^$ghide
luscious.net##.ad_lead
*$script,redirect-rule=noopjs,domain=luscious.net
luscious.net##+js(aopr, console.clear)
luscious.net##+js(aeld, popstate)
luscious.net##+js(nowoif)
luscious.net##a[rel$="sponsored"]
luscious.net##div[class^="adDisplay-module"]
luscious.net##.ad_section
*$script,3p,denyallow=cdn77.org|cloudflare.net|googleapis.com|jsdelivr.net|jsdelivr.map.fastly.net,from=luscious.net
@@*$xhr,domain=luscious.net,3p
||luscious.net/advertisement/iframe/

! downsub .com anti adb
@@||downsub.com^$xhr,1p

! https://www.reddit.com/r/uBlockOrigin/comments/f7drk2/antiadblock_on_tizcyclingliveio/
tiz-cycling-live.io##+js(acs, $, blocker)
tiz-cycling-live.io###msg
tiz-cycling.io##+js(acs, jQuery, blocker)

! azarplus.com ads
||azarplus.com/wp-content/uploads/*.gif$image,1p
@@||azarplus.com/wp-content/uploads/*Publicidad*.jpg$image,1p
@@||azarplus.com/wp-content/uploads/*Publicidad*.png$image,1p
azarplus.com##.public-banner-3
azarplus.com##.td-all-devices > [href][target="_blank"]
azarplus.com###overbox3

! https://github.com/NanoMeow/QuickReports/issues/3108
! https://github.com/NanoMeow/QuickReports/issues/3232
||cloudgallery.net^$csp=sandbox allow-forms allow-same-origin allow-scripts allow-modals allow-orientation-lock allow-pointer-lock allow-presentation allow-top-navigation
||cloudgallery.net^$csp=script-src * 'unsafe-inline'
||imghot.net^$csp=sandbox allow-forms allow-same-origin allow-scripts allow-modals allow-orientation-lock allow-pointer-lock allow-presentation allow-top-navigation
||imghot.net^$csp=script-src * 'unsafe-inline'
||imgzong.*^$csp=sandbox allow-forms allow-same-origin allow-scripts allow-modals allow-orientation-lock allow-pointer-lock allow-presentation allow-top-navigation
||imgzong.*^$csp=script-src * 'unsafe-inline'
cloudgallery.net,imghot.net##+js(aopr, AaDetector)
cloudgallery.net,imghot.net##+js(aopr, console.clear)

! https://github.com/uBlockOrigin/uAssets/issues/11375
/webroot/modern_theme/img/dwndbnr*$image,1p
makemoneywithurl.com##+js(nowoif)
makemoneywithurl.com##+js(set, timeSec, 0)
makemoneywithurl.com###scroll.hidden, .footerLink.hidden:style(display: block!important)
makemoneywithurl.com###next.getmylink
makemoneywithurl.com##.box-main > div:not([class])

! https://github.com/uBlockOrigin/uAssets/issues/9613
dvdgayonline.com##+js(ra, href, #clickfakeplayer)
dvdgayonline.com##+js(nano-stb, countdown, 1000, 0.02)
dflix.top##+js(nowoif)
dflix.top##body > div[class]:last-child
||acacdn.com^$script,redirect-rule=noop.js,domain=dflix.top

! wutime_adblock
trade2win.com##+js(nostif, .show)

! https://github.com/uBlockOrigin/uAssets/issues/6984
gomo.to##+js(aopr, glxopen)
gomo.to##+js(nowoif)
*$script,3p,denyallow=googleapis.com,domain=gomo.to

! https://github.com/uBlockOrigin/uAssets/issues/6986
! https://github.com/NanoMeow/QuickReports/issues/3690
! https://github.com/NanoMeow/QuickReports/issues/4294#issuecomment-659086334
iir.ai##+js(acs, Math, XMLHttpRequest)
iir.ai##+js(aeld, load, .appendChild)
iir.ai##+js(aopr, app_vars.force_disable_adblock)
iir.ai##+js(aopr, open)
iir.ai##+js(aopw, Fingerprint2)
iir.ai##+js(set, blurred, false)
iir.ai###link-view > div[style] + p[style] + center > [href][target]
iir.ai##form > a[href][target]
iir.ai##.box-main > a[href][target]
*$script,3p,denyallow=google.com|gstatic.com|recaptcha.net,domain=iir.ai
||iir.ai/sw$script,1p

! https://github.com/uBlockOrigin/uAssets/issues/6988
trendsderzukunft.de##+js(aopr, onload)

! https://github.com/NanoMeow/QuickReports/issues/3117
||vidlii.com/js/main.js^$script,1p
vidlii.com##+js(nosiif, visibility, 1000)
vidlii.com##+js(set, blockAdBlock, trueFunc)
vidlii.com##+js(set, adsbygoogle.loaded, true)
*$xhr,redirect-rule=noopjs,domain=vidlii.com
@@||vidlii.com^$ghide
vidlii.com##ins.adsbygoogle

! https://github.com/AdguardTeam/AdguardFilters/issues/50316
! https://github.com/uBlockOrigin/uAssets/issues/11851
docer.*##+js(set, ads_unblocked, true)

! https://github.com/NanoMeow/QuickReports/issues/3120
download.htdrive.com##+js(acs, document.getElementById, bannerad)

! https://github.com/uBlockOrigin/uAssets/issues/6992
onlinetutorium.com##+js(acs, addEventListener, google_ad_client)

! https://github.com/uBlockOrigin/uAssets/issues/20878
fontyukle.net##+js(aost, setTimeout, onload)
fontyukle.net##div.sponsor

! https://www.reddit.com/r/uBlockOrigin/comments/f8fpya/cryptonetosruscripthastextad_nodes_isnt_hiding/
@@||cryptonetos.ru^$ghide
cryptonetos.ru##+js(acs, onload, adblock)
cryptonetos.ru##.carousel-inner
cryptonetos.ru##.ads
cryptonetos.ru##.popup

! cryptofuns.ru anti-adb
cryptofuns.ru##+js(nowoif)
cryptofuns.ru##+js(aopr, app_vars.force_disable_adblock)
cryptofuns.ru##+js(aopr, adcashMacros)
cryptofuns.ru##.popup, #overlay
cryptofuns.ru##[href^="//a.o333o.com/"]
cryptofuns.ru##[class^="_fa7"]

! https://github.com/NanoMeow/QuickReports/issues/3131
northwalespioneer.co.uk##+js(aopr, _sp_.mms.startMsg)

! https://github.com/NanoMeow/QuickReports/issues/3133
@@||indcit.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/3135
||google.com/adsense/domains/caf.js$script,redirect=noopjs,domain=jestrudo.pl

! https://github.com/AdguardTeam/AdguardFilters/issues/50426
! https://github.com/uBlockOrigin/uAssets/issues/11872
modagamers.com##+js(acs, JSON.parse, atob)
modagamers.com##+js(nostif, showModal)
modagamers.com##+js(nano-stb)
animetemaefiore.club##+js(nowoif)
modagamers.com##+js(aopr, decodeURI)

! https://github.com/uBlockOrigin/uAssets/issues/7024
@@*$ghide,domain=pomponik.pl|iplsc.com

! https://github.com/AdguardTeam/AdguardFilters/issues/50444
ogrenciyegelir.com##+js(acs, document.getElementById, nextFunction)

! https://github.com/AdguardTeam/AdguardFilters/issues/50483
cdn77.org##+js(set, xxSetting.adBlockerDetection, false)
cdn77.org###layerName_preroll, #layerName_postroll

! nsfw batporno .com popunder
batporno.com##+js(aopr, decodeURI)

! https://github.com/AdguardTeam/AdguardFilters/issues/50482
howtofixwindows.com##+js(set, better_ads_adblock, null)

! https://github.com/uBlockOrigin/uAssets/issues/7006
||grammarist.com/*/*.jpg$script,1p
grammarist.com###custom_html-3, #custom_html-5
grammarist.com##small

! https://github.com/uBlockOrigin/uAssets/issues/7007
vidload.net##+js(aopr, AaDetector)

! https://github.com/AdguardTeam/AdguardFilters/issues/50524
sandiegouniontribune.com##+js(aopr, googlefc)

! https://github.com/AdguardTeam/AdguardFilters/issues/50548
almezoryae.com##+js(acs, document.createElement, adblock)

! https://github.com/NanoMeow/QuickReports/issues/3152
femalefirst.co.uk##+js(aopr, ppload)

! https://github.com/NanoAdblocker/NanoFilters/issues/457
@@||shana.pe.kr^$ghide
shana.pe.kr##ins.adsbygoogle

! perfectmomsporn .com ads + popunder
perfectmomsporn.com##+js(aopr, Aloader)
perfectmomsporn.com##+js(noeval)

! tubexxxone .com ads + popunder
tubexxxone.com##+js(noeval)
tubexxxone.com##+js(aopr, Aloader.serve)

! theregister.co.uk
theregister.co.uk##+js(aopr, RegAdBlocking)
theregister.co.uk##+js(acs, document.createElement, a.adm)

! https://github.com/uBlockOrigin/uAssets/issues/7025
remaxhd.*##+js(aopr, decodeURI)
remaxhd.*##+js(nowoif)

! https://github.com/uBlockOrigin/uAssets/issues/11406
shorteet.com##+js(set, blurred, false)
shorteet.com##+js(set, open, undefined)
shorteet.com##.banner
*$script,3p,denyallow=gstatic.com|recaptcha.net,domain=shorteet.com

! https://github.com/uBlockOrigin/uAssets/issues/7031
mobilelegends.shop##+js(nano-sib)
*$image,redirect-rule=2x2.png,domain=mobilelegends.shop

! https://github.com/AdguardTeam/AdguardFilters/issues/50731
gogodl.com##+js(acs, document.getElementById, adblock)

! https://www.reddit.com/r/uBlockOrigin/comments/fbgjtx/how_to_block_adsbanners_on_cdiscountcom/
cdiscount.com##+js(aopr, __eiPb)

! https://forums.lanik.us/viewtopic.php?f=62&t=44368
@@||toyota-club.eu^$ghide

! https://github.com/AdguardTeam/AdguardFilters/issues/50758
@@||9docu.*^$ghide

! https://github.com/AdguardTeam/AdguardFilters/issues/50761
@@||k258059.net^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/7040
! https://github.com/NanoMeow/QuickReports/issues/715
vipracing.*##+js(acs, $, show)
vipracing.*##+js(aopr, AaDetector)
vipracing.*##[href="https://www.tvbarata.club/"]
vipracing.*###vpp

! https://github.com/uBlockOrigin/uAssets/issues/7041
primedeportes.es##+js(aeld, load, onload)

! https://github.com/uBlockOrigin/uAssets/issues/7042
sportstream.live##+js(aopr, checkABlockP)

! https://github.com/NanoMeow/QuickReports/issues/3177
@@||poring.world^$ghide
poring.world##[data-ad-slot]

! https://github.com/uBlockOrigin/uAssets/issues/4782
||survivalservers.com^$frame,domain=ads.bdcraft.net
@@||ads.bdcraft.net/js/interstitial.js$script,1p

! https://forums.lanik.us/viewtopic.php?p=153233#p153233
! https://www.reddit.com/r/uBlockOrigin/comments/fcaa0w/ads_come_back_after_refreshing/
ddaynormandy.forumgaming.fr,neogeo-system.com##a[onclick][target]:upward(2)

! btdb .eu popunder
btdb.*##+js(aeld, , _0x)
btdb.*##+js(aopr, console.clear)
btdb.*##+js(aeld, , Date)
btdb.*##+js(aopr, open)
*$frame,script,xhr,3p,denyallow=bootstrapcdn.com|cdn77.org|cloudflare.com|cloudflare.net|disqus.com|disquscdn.com|facebook.com|facebook.net|fastly.net|fastlylb.net|fbcdn.net|google.com|googleapis.com|gstatic.com|hcaptcha.com|hwcdn.net|instagram.com|jquery.com|jsdelivr.net|jwpcdn.com|jwpsrv.com|plyr.io|twimg.com|twitter.com|recaptcha.net|wp.com|x.com,domain=btdb.*
btdb.*##.alert-dismissible
btdb.*##.alert

! https://github.com/AdguardTeam/AdguardFilters/issues/50811
ujszo.com##+js(set, Drupal.behaviors.adBlockerPopup, null)

! https://github.com/NanoMeow/QuickReports/issues/3185
naniplay.com##+js(nowoif)

! https://github.com/NanoMeow/QuickReports/issues/3186
@@||3amid-url.blogspot.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/3187
librospreuniversitariospdf.blogspot.com##+js(nostif, getComputedStyle)
*$script,3p,denyallow=disqus.com|disquscdn.com|jsdelivr.net|jwpcdn.com|fastly.net|fastlylb.net|jquery.com|hwcdn.net|hcaptcha.com|recaptcha.net|cloudflare.com|cloudflare.net|google.com|googleapis.com|gstatic.com|googleusercontent.com|blogger.com|plyr.io,domain=librospreuniversitariospdf.blogspot.com

! https://github.com/NanoMeow/QuickReports/issues/867
! https://github.com/uBlockOrigin/uAssets/issues/19534
@@||appnee.com^$ghide
appnee.com##ins.adsbygoogle
appnee.com###babasbmsgx
appnee.com##[href^="https://appnee.com/advertising/"] > [src^="https://img.appnee.com/other/"][alt="Ads Place"]
appnee.com##+js(rmnt, script, alert)

! wojtekczytawh40k.blogspot.com anti-adb
wojtekczytawh40k.blogspot.com##+js(acs, addEventListener, ADBLOCK)

! atdhe .cc / sx popups, ads
atdhe.*##+js(popads-dummy)
atdhe.*##[href^="https://horti.brovada.eu/"]
atdhe.*###bannerInCenter
||bitcoines.com^$3p

! 5299 .tv anti adb
5299.tv##+js(acs, jQuery, setTimeout)

! https://github.com/AdguardTeam/AdguardFilters/issues/50855
@@||scaleya.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/10166
files.im##+js(acs, decodeURI, decodeURIComponent)
files.im##+js(nano-stb, tick)
||files.im/ppa

! https://github.com/NanoMeow/QuickReports/issues/3193
pharmaceutical-technology.com##+js(acs, jQuery, click)
||pharmaceutical-technology.com/wp-content/*skin.jpg$image

! https://github.com/NanoMeow/QuickReports/issues/3202
*$xhr,redirect-rule=nooptext,domain=savesubs.com
savesubs.com##+js(nowoif)

! https://github.com/NanoMeow/QuickReports/issues/3200
lebahmovie.com##+js(aopr, decodeURI)
||lebahmovie.com/sw.js$script,1p
lebahmovie.com##.idmuvi-topbanner-aftermenu
*.gif$domain=lebahmovie.com,image
||ohbayersbur.pro^

! https://github.com/uBlockOrigin/uAssets/issues/7053
||global.proper.io/salon.min.js$script,redirect=noopjs,domain=salon.com
salon.com##.ad-topper

! https://github.com/NanoMeow/QuickReports/issues/3203
creditcardrush.com##+js(nostif, adsBlocked)
||doubleclick.net/pagead/id$xhr,redirect=nooptext,domain=creditcardrush.com

! https://github.com/NanoMeow/QuickReports/issues/3191
! https://github.com/uBlockOrigin/uAssets/issues/16523
@@||dynamicpapers.com^$ghide
dynamicpapers.com##ins.adsbygoogle
dynamicpapers.com##.ezoic-ad

! https://github.com/NanoMeow/QuickReports/issues/3219
newsmax.com##+js(set, fake_ad, true)

! https://github.com/AdguardTeam/AdguardFilters/issues/50951
@@||mintik.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/7061
ockles.com##+js(nano-sib)
duit.cc##+js(aopr, decodeURI)
duit.cc##+js(acs, eval, ignielAdBlock)
@@||duit.cc^$ghide
*$image,redirect-rule=1x1.gif,domain=duit.cc|ockles.com
duit.cc##[id*="ScriptRoot"], .adsbygoogle, .amp-unresolved

! https://github.com/NanoMeow/QuickReports/issues/3226
theouterhaven.net,watchallchannels.com,wikipekes.com##+js(acs, jQuery, ai_adb)
semuanyabola.com##+js(acs, decodeURIComponent, ai_)
watchallchannels.com##[href^="https://www.xvinlink.com/"]
watchallchannels.com##.widget-title

! https://github.com/AdguardTeam/AdguardFilters/issues/51029
@@||seriesynovelas.online^$ghide
seriesynovelas.online##+js(nowoif)

! https://github.com/NanoMeow/QuickReports/issues/3230
truyentranhaudio.online##+js(acs, jQuery, adblocker)

! https://github.com/NanoMeow/QuickReports/issues/3233
carbonite.co.za##+js(acs, $, AdBlock)

! https://github.com/AdguardTeam/AdguardFilters/issues/51063
@@||romsforever.co^$ghide

! https://github.com/AdguardTeam/AdguardFilters/issues/51069
interracial.com##+js(nowoif)
interracial.com##[src^="https://www.interracial.com/player/html.php"]

! https://github.com/AdguardTeam/AdguardFilters/issues/51099
@@||memexcomputer.it^$ghide
memexcomputer.it##ins.adsbygoogle

! https://github.com/NanoMeow/QuickReports/issues/3237
layarkaca21indo.com##+js(aopr, adBlockDetected)

! https://github.com/NanoMeow/QuickReports/issues/2109
! https://github.com/uBlockOrigin/uAssets/issues/14433
@@||forbes.com^$ghide
forbes.com##.vestpocket
forbes.com##fbs-ad
forbes.com##.ad-unit:not(.text-ad):not(.textads)
forbes.com##.footer-ad-labeling
forbes.com##.ad-rail
! https://www.reddit.com/r/uBlockOrigin/comments/14d7npb/
forbes.com##.ed-wrap.rafeed__block
forbes.com###featured-partners
! https://github.com/easylist/easylist/issues/15513
forbes.com##.amp-ad-container

||jootizud.net^

! https://github.com/uBlockOrigin/uAssets/issues/10165
*$3p,denyallow=google.com|googleapis.com|gstatic.com,domain=uplinkto.*

! https://github.com/AdguardTeam/AdguardFilters/issues/51125
! https://github.com/AdguardTeam/AdguardFilters/issues/51218
porno-tour.*##+js(aopr, document.dispatchEvent)
porno-tour.*##+js(nostif, innerText, 2000)

! https://github.com/NanoAdblocker/NanoFilters/issues/459
popcornstream.*##+js(nostif, blur)
popcornstream.*##+js(aeld, , btoa)

! https://github.com/AdguardTeam/AdguardFilters/issues/51152
oyungibi.com##+js(set, jQuery.adblock, false)

! https://github.com/NanoMeow/QuickReports/issues/3251
! https://github.com/NanoMeow/QuickReports/issues/4020
turkmmo.com##+js(acs, $, AdBlock)
turkmmo.com##+js(nostif, samOverlay)

! https://github.com/AdguardTeam/AdguardFilters/issues/51157
@@||firefiles.org^$ghide

! https://github.com/AdguardTeam/AdguardFilters/issues/51160
animealtadefinizione.it##+js(acs, addEventListener, adb)
animealtadefinizione.it##+js(aopr, AaDetector)

! https://github.com/AdguardTeam/AdguardFilters/issues/51168
jumpmanclubbrasil.com.br##+js(acs, addEventListener, nextFunction)
jumpmanclubbrasil.com.br##.home-ad-con

! rentbyowner .com popunder
rentbyowner.com##+js(nowoif, !refine?search)

! https://github.com/uBlockOrigin/uAssets/issues/5189#issuecomment-596677601
@@||psprices.com^$ghide
psprices.com##[href*=".smartadserver.com"]
psprices.com##body:style(background-color: white !important)

! https://github.com/NanoMeow/QuickReports/issues/3257
ikaza.net##+js(aopr, showAds)

! anti adb zerozero .pt
@@||zerozero.pt^$ghide

! https://github.com/NanoMeow/QuickReports/issues/3263
tatangga.com##+js(acs, eval, AdBlock)

! https://github.com/AdguardTeam/AdguardFilters/issues/51244
@@||torrentvhd.biz^$ghide
||fegortius.com^$3p
||weblion777.github.io^$3p
*$xhr,3p,domain=torrentvhd.biz
||torrentvhd.biz/sw.js$script,1p
||corported.com^$3p
||kataprius.com^
torrentvhd.biz##center

! https://github.com/NanoMeow/QuickReports/issues/3268
itechfever.com##+js(nobab)

! exoclick ads, popunder
airsextube.com,asianbabestube.com,bigtitsxxxfree.com,blowjobpornset.com,entertubeporn.com,finexxxvideos.com,freesexvideos24.com,fuckhairygirls.com,gopornindian.com,grandmatube.pro,grannyfucko.com,grannyfuckxxx.com,hd-analporn.com,hiddencamhd.com,hindiporno.pro,indianbestporn.com,japanesemomsex.com,japanxxxass.com,massagefreetube.com,maturepussies.pro,megajapansex.com,new-xxxvideos.com,xxxblowjob.pro,xxxtubegain.com,xxxvideostrue.com,onlinegrannyporn.com,agedtubeporn.com,agedvideos.com,freebigboobsporn.com,tubeinterracial-porn.com,best-xxxvideos.com,bestanime-xxx.com,blowxxxtube.com,callfuck.com,teenhubxxx.com,tubepornasian.com,xxxtubedot.com,blowjobfucks.com,dirtyasiantube.com,maturewomenfucks.com,pornmaturetube.com,setfucktube.com,tourporno.com,do-xxx.com,dotfreesex.com,dotfreexxx.com,easymilftube.net,electsex.com,erospots.info,fineretroporn.com,freehqtube.com,freshmaturespussy.com,freshsexxvideos.com,fuckedporno.com,gallant-matures.com,hqhardcoreporno.com,getitinside.com,girlssexxxx.com,glamourxxx-online.com,vintagepornnew.com,tubevintageporn.com,goxxxvideos.com,grouppornotube.com,hqxxxmovies.com,hqsex-xxx.com,hqamateurtubes.com,hotpussyhubs.com,hdpornteen.com,indecentvideos.com,ifreefuck.com,kittyfuckstube.com,lightxxxtube.com,momstube-porn.com,modelsxxxtube.com,milfpussy-sex.com,nudistube.com,nudisteens.com,nudismteens.com,nude-beach-tube.com,nicexxxtube.com,neatpornodot.com,neatfreeporn.com,bigtitsporn-tube.com,tubehqxxx.com,nakedbbw-sex.com,onlineteenhub.com,online-xxxmovies.com,pussyhothub.com,pornxxxplace.com,pornoteensex.com,pornonote.pro,pornoaid.com,pornclipshub.com,whitexxxtube.com,sweetadult-tube.com,sweet-maturewomen.com,sexyoungclips.com,sexymilfsearch.com,sextubedot.com,hqmaxporn.com,sexlargetube.com,sexhardtubes.com,tubepornstock.com,xfuckonline.com##+js(noeval)
airsextube.com,asianbabestube.com,bigtitsxxxfree.com,blowjobpornset.com,entertubeporn.com,finexxxvideos.com,freesexvideos24.com,fuckhairygirls.com,gopornindian.com,grandmatube.pro,grannyfucko.com,grannyfuckxxx.com,hd-analporn.com,hiddencamhd.com,hindiporno.pro,indianbestporn.com,japanesemomsex.com,japanxxxass.com,massagefreetube.com,maturepussies.pro,megajapansex.com,new-xxxvideos.com,xxxblowjob.pro,xxxtubegain.com,xxxvideostrue.com,acutetube.net,agedtubeporn.com,agedvideos.com,onlinegrannyporn.com,freebigboobsporn.com,tubeinterracial-porn.com,best-xxxvideos.com,bestanime-xxx.com,blowxxxtube.com,callfuck.com,teenhubxxx.com,tubepornasian.com,xxxtubedot.com,blowjobfucks.com,dirtyasiantube.com,maturewomenfucks.com,pornmaturetube.com,setfucktube.com,tourporno.com,do-xxx.com,dotfreesex.com,dotfreexxx.com,easymilftube.net,electsex.com,fineretroporn.com,freehqtube.com,freshmaturespussy.com,freshsexxvideos.com,fuckedporno.com,gallant-matures.com,hqhardcoreporno.com,getitinside.com,girlssexxxx.com,glamourxxx-online.com,vintagepornnew.com,tubevintageporn.com,goxxxvideos.com,grouppornotube.com,hqxxxmovies.com,hqsex-xxx.com,hqamateurtubes.com,hotpussyhubs.com,hdpornteen.com,indecentvideos.com,ifreefuck.com,kittyfuckstube.com,lightxxxtube.com,momstube-porn.com,modelsxxxtube.com,milfpussy-sex.com,nicexxxtube.com,neatpornodot.com,neatfreeporn.com,bigtitsporn-tube.com,tubehqxxx.com,nakedbbw-sex.com,onlineteenhub.com,online-xxxmovies.com,pussyhothub.com,pornxxxplace.com,pornoteensex.com,pornonote.pro,pornoaid.com,pornclipshub.com,whitexxxtube.com,sweetadult-tube.com,sweet-maturewomen.com,sexyoungclips.com,sexymilfsearch.com,sextubedot.com,hqmaxporn.com,sexlargetube.com,sexhardtubes.com,tubepornstock.com,xfuckonline.com##+js(aopr, Aloader.serve)
activevoyeur.com,allbbwtube.com,alltstube.com,cockmeter.com##+js(acs, document.dispatchEvent, myEl)
ariestube.com,asian-teen-sex.com,18asiantube.com,wholevideos.com,asianporntube69.com,babeswp.com,bangyourwife.com,bdsmslavemovie.com,bdsmwaytube.com,bestmaturewomen.com,classicpornvids.com,cockmeter.com,cocogals.com,pornpaw.com,dawntube.com,desihoes.com,desimmshd.com,dirtytubemix.com,plumperstube.com,enormousbabes.net,erowall.com,exclusiveindianporn.com,figtube.com,amateur-twink.com,freeboytwinks.com,freegrannyvids.com,freexmovs.com,freshbbw.com,frostytube.com,fuckhottwink.com,fuckslutsonline.com,gameofporn.com,gayboyshd.com,getitinside.com,giantshemalecocks.com,erofus.com,hd-tube-porn.com,hardcorehd.xxx,hairytwat.org,iwantmature.com,justababes.com,juicyflaps.com,jenpornuj.cz,javteentube.com,hard-tube-porn.com,klaustube.com,kaboomtube.com,lustyspot.com,lushdiaries.com,lovelynudez.com,dailyangels.com,ljcam.net,myfreemoms.com,mybestxtube.com,nakenprat.com,oosex.net,oldgrannylovers.com,ohueli.net,pornuploaded.net,pornstarsadvice.com,alotporn.com,bobs-tube.com,pornohaha.com,pornmam.com,pornhegemon.com,pornabcd.com,porn-hd-tube.com,pandamovies.pw,teensporn.tv,thehentaiworld.com,pantyhosepink.com,queenofmature.com,realvoyeursex.com,realbbwsex.com,rawindianporn.com,onlygoldmovies.com,rainytube.com,stileproject.com,slutdump.com,nastybulb.com,babesinporn.com,wantedbabes.com,sextube-6.com,porntubegf.com,sassytube.com,smplace.com,maturell.com,nudemilfwomen.com,pornoplum.com,widewifes.com,wowpornlist.xyz,vulgarmilf.com,oldgirlsporn.com,freepornrocks.com,desivideos.*##+js(aopr, document.dispatchEvent)
8teenxxx.com,activevoyeur.com,allschoolboysecrets.com,boobsforfun.com,breedingmoms.com,cockmeter.com,collegeteentube.com,cumshotlist.com,porn0.tv,ritzysex.com,ritzyporn.com,sexato.com,javbobo.com,sokobj.com##+js(aopr, ExoLoader.serve)
bdsmporntub.com,femdomporntubes.com##+js(aopr, Popunder)
comicxxx.eu##^meta[http-equiv="refresh"]
comicxxx.eu###dclm_modal_content
comicxxx.eu##*:style(filter: none !important)
comicxxx.eu###dclm_modal_screen
||be-well.es^
blowjobgif.net##+js(aopr, ExoDetector)
favefreeporn.com,onlygayvideo.com,peachytube.com,stepsisterfuck.me##+js(aopr, ExoLoader.addZone)
decorativemodels.com,erowall.com,freyalist.com,guruofporn.com,jesseporn.xyz,kendralist.com,vipergirls.to,lizardporn.com,wantedbabes.com,bustybloom.com,exgirlfriendmarket.com,nakedneighbour.com##+js(aopr, loadTool)
comicxxx.eu,mybestxtube.com,pornobengala.com,pornicom.com,xecce.com,teensporn.tv,pornlift.com,reddflix.com,superbgays.com##+js(aopr, open)
classicpornbest.com,desihoes.com,indianpornvideo.org,porn18sex.com,slaughtergays.com,sexiestpicture.com##+js(aopr, decodeURI)
classicpornbest.com##+js(aeld, popstate)
classicpornbest.com##+js(aopr, localStorage)
embedy.me##+js(nowoif, !embedy)
reddflix.com##+js(aopr, LieDetector)
erospots.info##+js(aopr, Pub2)
gameofporn.com##+js(aeld, , exopop)
jemontremonminou.com,jemontremasextape.com,jemontremabite.com##+js(aopr, localStorage)
porndollz.com,xnxxvideo.pro,xvideosxporn.com,filmpornofrancais.fr,pictoa.com##+js(aeld, getexoloader)
nackte.com##+js(aopr, jsUnda)
older-mature.net##+js(aopr, doOpen)
canalporno.com,dreamamateurs.com,eroxia.com,porndoe.com,pornozot.com##+js(aopr, ExoLoader)
alotporn.com##+js(aopw, __htapop)
alotporn.com##+js(aopr, console.clear)
bobs-tube.com##+js(nostif, innerText, 2000)
bobs-tube.com##+js(set, flashvars.mlogo, '')
bobs-tube.com##.adv_nad_player
bobs-tube.com##.sponsored_top
dreamamateurs.com##+js(popads-dummy)
pornforrelax.com##+js(aopr, adver.abFucker.serve)
pornforrelax.com##+js(aeld, , _blank)
fatwhitebutt.com,smplace.com,slaughtergays.com,sexiestpicture.com,sassytube.com,vipergirls.to,xh.video##+js(nowoif)
fatwhitebutt.com##+js(aeld, , _blank)
freepornrocks.com##+js(aeld, , open)
tubev.sex##+js(aopw, displayCache)
tubev.sex##[class^="sp_block"]
pictoa.com##+js(aeld, , 0x)
lovelynudez.com##+js(aopr, popit)
javbobo.com,nudismteens.com##+js(aopr, exoNoExternalUI38djdkjDDJsio96)
*$script,3p,denyallow=cdn77.org|cloudflare.com|cloudflare.net|disqus.com|disquscdn.com|facebook.com|facebook.net|fastly.net|fastlylb.net|fbcdn.net|fluidplayer.com|google.com|googleapis.com|gstatic.com|hcaptcha.com|hwcdn.net|instagram.com|jquery.com|jsdelivr.net|jwpcdn.com|jwpsrv.com|plyr.io|twimg.com|twitter.com|recaptcha.net|wp.com|x.com,domain=filmpornofrancais.fr

||classicpornbest.com^$csp=script-src *
*$script,xhr,3p,domain=lovelynudez.com
||teenhooker.net^$frame,1p
*$script,3p,domain=classicpornbest.com
classicpornbest.com##.h-bns-bl
||youvideoporno.mobi^$3p
||nudismteens.com/tensnuddy.js
||javbobo.com/little-hall-f39d/
||pornpaw.com/never.js

comicxxx.eu###tracking-url
dirtytubemix.com##.on-video-dark
boobsforfun.com##.adcontainer
breedingmoms.com##.embaners
breedingmoms.com##.h-bn
pornpaw.com##.ipprtcnt
pornpaw.com##div[style="height:250px;display:block;"]
erospots.info##.custom-html-widget.textwidget
amateur-twink.com##.banner
amateur-twink.com##.pl_adv
freyalist.com##.stripper
ftopx.com##.advert
fuckedporno.com##.bannersinner
fuckhardporn.com##.player_ad_block
fuckhardporn.com###player_adv_start
fuckhardporn.com###skim
gameofporn.com###container
gameofporn.com##.block-pub-side
cockmeter.com###alfa_promo_parent
||girlscanner.online/ph_co.js$script
||girlscanner.cc/check.php
girlscanner.cc##[href*="/check.php"]
girlscanner.cc##div.side-box
vipergirls.to##[src="files/se.gif"]
vipergirls.to##.body_wrapper > [id^="ad_global"], #notices.notices
mrsexe.com###disclaimer
mrsexe.com##.reveal-modal-bg
mrsexe.com###exovid
mrsexe.com##.vjs-poster
xnxxvideo.pro##.video-archive-ad
xvideosxporn.com##[href*="bawafx.com/"]
pornstarsadvice.com##.banners
bobs-tube.com##.advertising
bobs-tube.com##.player-related-videos
bobs-tube.com##.adv
pornforrelax.com##.vda-item
porn613.net##[src="about:blank"]
superbgays.com###block
superbgays.com###CloseAd
@@||bobs-tube.com/player/player_ads.html$1p
dreamamateurs.com##[href^="http://ezofferz.com/"]
*$frame,domain=sexrura.pl
pictoa.com###tab-gallery
pictoa.com###tab-footer
||bo4news.biz^
||bobs-tube.com/sw$script,1p
||checking-your-browser.com^
||crentgate.com^
||obitube.com^$frame,1p
||redtub3xxx.com^$frame,1p

##.bloc-pub
##.bloc-pub2
###invideo_data
*/api/spots/$frame,script
/api/spots/*^fill=$xhr
/api/spots/*&kw=$xhr
###invideo_2
##.hor_banner
###invid_call
###invideo_new
##.aan_fake
##.aan_fake__video-units
##.rps_player_ads
##[src^="//dombnrs.com/"]
*.gif$domain=javbobo.com,image
/frtd_ldr_$script,1p
/bknd_ldr_$script,1p
pornoplum.com,vulgarmilf.com,oldgirlsporn.com,maturell.com,nakedolders.com,nudemilfwomen.com,widewifes.com##iframe:upward(2)
besttwinkass.com##[class*="_Bns"]
nylonbabez.net,nylonpornpictures.net,stockingspornpics.com##.preview:has(.nat-block)
||sexrura.com^$frame,1p

! https://github.com/NanoMeow/QuickReports/issues/3280
acdriftingpro.com##+js(nostif, offsetHeight)
acdriftingpro.com##+js(nano-sib, countdown, *, 0.001)

! https://github.com/AdguardTeam/AdguardFilters/issues/51340
urlpay.net##+js(nano-sib)
urlpay.net##^script:has-text('shift')
urlpay.net##^script:has-text(\'shift\')
urlpay.net##+js(acs, String.fromCharCode, 'shift')

! https://github.com/AdguardTeam/AdguardFilters/issues/51332
olinevid.com###layerName_preroll, #layerName_postroll
*$script,redirect-rule=noopjs,domain=olinevid.com
@@||olinevid.com^$ghide
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=olinevid.com

! https://github.com/NanoMeow/QuickReports/issues/3286
sekilastekno.com##+js(aopr, app_vars.force_disable_adblock)
sekilastekno.com##+js(nowoif, wapka)
sekilastekno.com##+js(no-fetch-if, ads)
sekilastekno.com##[href^="https://poptival.com/direct"]
sekilastekno.com##+js(set, blurred, false)
||googlesyndication.com/pagead/js/adsbygoogle.js$script,redirect=noopjs:10,domain=apk.sekilastekno.com
apk.sekilastekno.com##[href="https://www.tautan.pro/"]
apk.sekilastekno.com##[href^="https://www.poptival.com/direct"]
apk.sekilastekno.com##[width="200"][height="60"]

! https://www.reddit.com/r/uBlockOrigin/comments/fhkx7s/theracecom_detecting_adblock/
@@||the-race.com^$ghide
the-race.com##.ad_container_default

! https://github.com/NanoMeow/QuickReports/issues/3282
savealoonie.com##+js(aopr, mdp_deblocker)

! https://github.com/AdguardTeam/AdguardFilters/issues/51422
@@||mangafeeds.com^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/7097
tempr.email##+js(set, adblock, false)
tempr.email###HeaderBanner

! https://github.com/uBlockOrigin/uAssets/issues/9779
teenager365.com##+js(acs, document.addEventListener, adsbygoogle)
teenager365.com##.video-archive-ad

! https://github.com/NanoMeow/QuickReports/issues/3290
lkc21.net##+js(aopr, AaDetector)
lkc21.net##+js(nowoif)

! https://github.com/AdguardTeam/AdguardFilters/issues/51446
@@||musicpremieres.com^$ghide

! https://github.com/AdguardTeam/AdguardFilters/issues/51555
iptvspor.com##+js(aopr, adBlockDetected)

! https://github.com/AdguardTeam/AdguardFilters/issues/51556
plugincim.com##+js(aopr, adBlockDetected)

! https://github.com/AdguardTeam/AdguardFilters/issues/51557
fivemturk.com##+js(aopr, adBlockDetected)
fivemturk.com##[src^="https://i.hizliresim.com/"]

! https://github.com/AdguardTeam/AdguardFilters/issues/51558
sosyalbilgiler.net##+js(aopr, adBlockDetected)

! https://github.com/AdguardTeam/AdguardFilters/issues/51563
nadidetarifler.com##+js(set, koddostu_com_adblock_yok, null)
nadidetarifler.com##.advert-side

! https://github.com/NanoMeow/QuickReports/issues/3312
hwreload.it##+js(acs, $, show)

! https://github.com/NanoMeow/QuickReports/issues/3314
suzylu.co.uk##+js(set, adsbygoogle, trueFunc)
suzylu.co.uk##+js(set, player.ads.cuePoints, undefined)
@@||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=suzylu.co.uk

! https://github.com/AdguardTeam/AdguardFilters/issues/51615
@@||alfaloji.org^$ghide
alfaloji.org##ins.adsbygoogle

! https://github.com/AdguardTeam/AdguardFilters/issues/51629
lenkino.*##+js(nostif, innerText, 2000)

! https://www.reddit.com/r/uBlockOrigin/comments/fjsj2c/block_ads_on_mailde_debug_to_find_a_filter/
mail.de###euccBanner

! https://www.reddit.com/r/uBlockOrigin/comments/fjud23/adblock_detector_on_positivefeedback/
positive-feedback.com##.ad-row-horizontal
positive-feedback.com##.banner-right
positive-feedback.com##.right-ad-wrapper
positive-feedback.com##.archive_ad_block
positive-feedback.com##.load-screen

! https://github.com/NanoMeow/QuickReports/issues/3318
medicalnewstoday.com##div[id="__next"] > div[class^="css-"] > div > section > div:matches-css-before(content: /ADVERTISEMENT/)
medicalnewstoday.com##div[id="__next"] > div[class^="css-"] > aside:has(> div:matches-css-before(content: /ADVERTISEMENT/))
medicalnewstoday.com##div[data-dynamic-ads]
medicalnewstoday.com##div[class^="css-"]:matches-css-before(content: /ADVERTISEMENT/)
medicalnewstoday.com##hl-adsense
medicalnewstoday.com##.css-rp3d6

! https://github.com/AdguardTeam/AdguardFilters/issues/51656
pekalongan-cits.blogspot.com##+js(aeld, load, nextFunction)

! https://github.com/AdguardTeam/AdguardFilters/issues/51665
cheatglobal.com##+js(acs, addEventListener, nextFunction)

! https://github.com/AdguardTeam/AdguardFilters/issues/51674
mega-hentai2.blogspot.com##+js(aopr, adBlockDetected)

! https://github.com/uBlockOrigin/uAssets/issues/7110
macrumors.com##+js(aopr, adthrive)

! https://github.com/AdguardTeam/AdguardFilters/issues/51673
underhentai.net##+js(nano-sib)
underhentai.net##+js(nowoif, !t.me)
underhentai.net##.hidden-sm
underhentai.net##.visible-xs
underhentai.net##[onclick^="window.open('https://landing."]
underhentai.net##.sidebar > div[class] > .loading
||adf.underhentai.net^$frame,1p

! https://github.com/AdguardTeam/AdguardFilters/issues/51683
palermotoday.it##+js(nostif, bADBlock)

! https://github.com/NanoMeow/QuickReports/issues/3321
discordfastfood.com##+js(nostif, clientHeight)

! https://github.com/NanoMeow/QuickReports/issues/3324
||googlesyndication.com/pagead/js/adsbygoogle.js$xhr,redirect-rule=noopjs,domain=btgyama.blogspot.com
*$script,domain=btgyama.blogspot.com,redirect-rule=noopjs

! https://github.com/NanoMeow/QuickReports/issues/2649
thumpertalk.com##+js(nostif, location)
*$xhr,redirect-rule=nooptext,domain=thumpertalk.com
@@||thumpertalk.com^$ghide
thumpertalk.com##.focus-ad

! https://forums.lanik.us/viewtopic.php?f=96&t=44455
facciabuco.com##+js(nostif, , 4000)

! https://github.com/NanoMeow/QuickReports/issues/3323
@@||customercareal.com^$ghide
customercareal.com##a[id^="actionlinkid_"]
customercareal.com###locked_action_link.disabled:style(cursor:pointer !important; opacity:1 !important; pointer-events:auto !important)
customercareal.com##+js(nano-sib)

! https://github.com/NanoMeow/QuickReports/issues/3332
miniurl.*##+js(aopr, app_vars.force_disable_adblock)
miniurl.*##+js(set, blurred, false)
miniurl.*##.banner
miniurl.*##div[style="width:970px;height:90px;display: inline-block;margin: 0 auto"]
*$script,3p,denyallow=google.com|gstatic.com|recaptcha.net,domain=miniurl.*
||miniurl.*/sw.js$script,1p

! https://github.com/AdguardTeam/AdguardFilters/issues/51713
arabic-robot.blogspot.com##+js(acs, document.createElement, adblock)
arabic-robot.blogspot.com###preloader

! https://github.com/NanoMeow/QuickReports/issues/3334
@@||nsfwmega.com^$ghide

! popups https://forums.lanik.us/viewtopic.php?f=64&t=44458
mavanimes.co##+js(aopr, AaDetector)

! https://github.com/AdguardTeam/AdguardFilters/issues/51785
freegogpcgames.com##+js(nowoif)
freegogpcgames.com##+js(no-xhr-if, googlesyndication)
freegogpcgames.com##+js(nostif, show)

! https://github.com/AdguardTeam/AdguardFilters/issues/51787
@@||nxmac.com^$ghide
nxmac.com##.alert-errors.in.fade.alert
nxmac.com##ins.adsbygoogle

! rizaldi.web.id anti-adb
@@||rizaldi.web.id^$ghide

! smiechawatv.pl anti-adb
smiechawatv.pl##+js(nowoif)
smiechawatv.pl##[href^="http://smiechawatv.cupsell.pl/"]
smiechawatv.pl##[href^="https://www.cda.pl/smiechawaTV/"]

! digitalrev4u.com anti-adb
digitalrev4u.com##.header_banner
digitalrev4u.com##[href^="https://shop.olympus.eu/"]

! https://github.com/AdguardTeam/AdguardFilters/issues/51807
gun-otaku.blogspot.com##+js(aopr, adBlockDetected)
gun-otaku.blogspot.com###HTML16

! https://github.com/AdguardTeam/AdguardFilters/issues/51819
@@||get-digital-help.com^$ghide
get-digital-help.com##.ezoic-ad
get-digital-help.com##.adthrive-ad

! nefree .com anti adb
@@||nefree.com^$ghide

! https://www.reddit.com/r/uBlockOrigin/comments/ffss3e/detected_by_blockadblock/fkxdi7k/
onworks.net##+js(set, adBlockDetected, null)
onworks.net###ja-container-prev-b

! https://github.com/AdguardTeam/AdguardFilters/issues/51828
pdfkitapp.com##+js(aopr, adBlockDetected)
pdfkitapp.com##.clearfix.container.header-main

! dlapk4all .com popups
dlapk4all.com##+js(aopr, glxopen)
dlapk4all.com##+js(aeld, , _0x)
apk4all.com##.control.field > .is-danger.button

! 4tymode. win anti adb
4tymode.win##+js(aeld, load, nextFunction)

! https://github.com/NanoMeow/QuickReports/issues/3347
@@||watchonlyfoolsandhorses.com^$ghide
watchonlyfoolsandhorses.com##[id*="ScriptRoot"]
watchonlyfoolsandhorses.com##.module_single_ads

! https://github.com/NanoAdblocker/NanoFilters/issues/462
@@||brownsboys.com^$ghide
@@||mrsbrownsb.blogspot.com^$ghide
mrsbrownsb.blogspot.com##.section.featured-post

! https://github.com/AdguardTeam/AdguardFilters/issues/51905
qpython.club##+js(aeld, DOMContentLoaded, AdBlock)

! https://forums.lanik.us/viewtopic.php?f=62&t=44471
galvinconanstuart.blogspot.com##+js(acs, $, open)

! https://forums.lanik.us/viewtopic.php?p=153698#p153698
! https://github.com/uBlockOrigin/uAssets/issues/23120
freep.com##+js(set, adsEnabled, true)
freep.com##.teal-video-wrap
freep.com##.gnt_em_vp__tavp.gnt_em
freep.com##a.gnt_cw_sl
freep.com##.gnt_ar_xb

! https://github.com/AdguardTeam/AdguardFilters/issues/51923
@@||robloxexploitz.com^$ghide
robloxexploitz.com##ins.adsbygoogle

! https://github.com/NanoMeow/QuickReports/issues/3358
downloadsoft.net##+js(acs, document.createElement, adblock)
downloadsoft.net##+js(set, better_ads_adblock, 1)

! https://github.com/AdguardTeam/AdguardFilters/issues/51961
@@||teledyski.info^$ghide
teledyski.info###r-s1

! https://github.com/AdguardTeam/AdguardFilters/issues/51973
@@||tudogamesbr.com^$ghide
tudogamesbr.com##+js(nowoif)
tudogamesbr.com##+js(nano-stb, /.?/, , 0.02)

! songsio. com popup
*$script,3p,domain=songsio.com
||nfxktxuwx.com^

! https://github.com/AdguardTeam/AdguardFilters/issues/51985
faupto.com##+js(aopr, show_ads_gr8_lite)
dogemate.com##+js(nowoif)
dogemate.com##+js(acs, $, .filter)
faupto.com,dogemate.com##+js(aopr, disableButtonTimer)
faupto.com##+js(nano-sib)
*$frame,script,3p,denyallow=bootstrapcdn.com|consensu.org|google.com|gstatic.com|hcaptcha.com|hwcdn.net|jquery.com|recaptcha.net|wp.com,domain=faupto.com
*$3p,script,frame,denyallow=bootstrapcdn.com|cloudflare.com|google.com|googleapis.com|gstatic.com|hcaptcha.com|hwcdn.net|jquery.com|recaptcha.net,domain=dogemate.com
faupto.com##[href^="https://brave.com"]
faupto.com##.shadow.bg-dark
dogemate.com##div[class][style="width:300px;height:250px;display: inline-block;margin: 0 auto"]
@@||dogemate.com/banner/$image,1p
dogemate.com##img[id^="ads-"]:style(visibility: hidden !important;)

! https://github.com/uBlockOrigin/uAssets/issues/10608
claimcrypto.cc##+js(aopr, app_vars.force_disable_adblock)
claimcrypto.cc##+js(aopr, adBlockDetected)
claimcrypto.cc##[class^="bmadblock"]

! https://github.com/uBlockOrigin/uAssets/issues/7139
@@||sledujserialy.*^$script,1p
||sledujserialy.*/theme/json/episode.ad.php^$frame
sledujserialy.*##div[id][style="position: absolute; top: 0; left: 0; width: 100%; height: 380px; text-align: center;"]
sledujserialy.*###super_secret_ad

! https://github.com/NanoMeow/QuickReports/issues/3369
@@||taiba-dz.blogspot.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/3370
onnime.net##+js(aopr, AaDetector)

! https://github.com/NanoMeow/QuickReports/issues/3372
softx64.com##+js(nostif, blocker, 100)

! nysainfo.pl anti-adb
nysainfo.pl##+js(aopr, mdpDeBlocker)
nysainfo.pl###mdp-deblocker-js-disabled

! napolipiu.com anti-adb
napolipiu.com##+js(aopr, tie)

! https://github.com/AdguardTeam/AdguardFilters/issues/52076
manpeace.org##+js(aopr, document.write)

! https://github.com/NanoAdblocker/NanoFilters/issues/463
@@||judicialcaselaw.com^$script,1p

! https://github.com/AdguardTeam/AdguardFilters/issues/52152
@@||boardgamesonline.net^$ghide
boardgamesonline.net##ins.adsbygoogle

! anti adb games.newsobserver .com
newsobserver.com##+js(set, Adv_ab, false)

! https://github.com/NanoAdblocker/NanoFilters/issues/488
! https://www.reddit.com/r/uBlockOrigin/comments/y5nbir
findandfound.ga,png.is##+js(aopr, adb_checker)
nohat.cc,png.is##+js(aopr, ignore_adblock)
png.is,nohat.cc##+js(aopr, $.prototype.offset)
png.is,nohat.cc##+js(no-fetch-if, adsbygoogle)
findandfound.ga##+js(aopr, $.prototype.html)
findandfound.ga##+js(aopr, onload)
findandfound.ga##+js(ra, oncontextmenu, body)
||nohat.me^$3p
@@||nohat.me/s?*k=$xhr,domain=png.is|nohat.cc

! line25 .com popunder
line25.com##+js(aopr, decodeURI)

! https://github.com/NanoMeow/QuickReports/issues/3395
! https://github.com/NanoMeow/QuickReports/issues/3404
hmc-id.blogspot.com,jemerik.com##+js(nostif, AdBlock)

! https://www.reddit.com/r/uBlockOrigin/comments/foskpy/visual_of_videos_blocked/
noxx.to##+js(aopr, AaDetector)

! https://github.com/AdguardTeam/AdguardFilters/issues/52225
thelayoff.com##+js(nostif, alert)
thelayoff.com##.epp-bf

! https://github.com/uBlockOrigin/uAssets/issues/7153
fuskator.com##+js(aopr, ea.add)
fuskator.com##+js(noeval)

! https://github.com/NanoMeow/QuickReports/issues/3401
bostoncommons.net##+js(aopr, eddOptions)
bostoncommons.net##+js(aopr, LieDetector)
bostoncommons.net##+js(nostif, adsBlocked)

! https://github.com/AdguardTeam/AdguardFilters/issues/52266
e9china.net##+js(aeld, load, blocker)

! https://github.com/NanoMeow/QuickReports/issues/3403
isminiunuttum.com##+js(acs, document.getElementById, block)

! https://github.com/AdguardTeam/AdguardFilters/issues/52305
@@||bigbrothercanada.ca^$ghide
*$script,redirect-rule=noopjs,domain=bigbrothercanada.ca
bigbrothercanada.ca##.video-adTile
bigbrothercanada.ca##.adWrapper

! https://github.com/NanoAdblocker/NanoFilters/issues/468
@@||bolognatoday.it^$ghide

! newtorrentgame .com popups
||d2klx87bgzngce.cloudfront.net^$script,redirect=noopjs
newtorrentgame.com##^script:has-text('shift')
newtorrentgame.com##^script:has-text(\'shift\')

||allbloggingtips.com^$3p

! sunbtc.space anti-adb
@@||sunbtc.space^$ghide
sunbtc.space##+js(set, adBlock, false)

! ero18.cc anti-adb/popups/ads
@@||ero18.cc^$ghide
ero18.cc##[href^="https://rapidgator.net/"]

! pstream .net anti adb / example: https://www.pstream .net/e/KJxQ2W0P91WW00L
! https://github.com/NanoMeow/QuickReports/issues/3815
pstream.net##+js(acs, String.fromCharCode, atob)
pstream.net##+js(nosiif, length)
pstream.net##+js(nostif, length)
pstream.net##+js(nowebrtc)
pstream.net##+js(nowoif)
pstream.net##head:has(style[id*="videojs"]) + body > *:not(.video-js)
@@||pstream.net^$ghide
@@||pstream.net^$xhr,1p
*$script,1p,redirect-rule=noopjs,domain=pstream.net
||lologhfd.com^$all

! https://github.com/uBlockOrigin/uAssets/issues/7163
suanoticia.online##+js(nano-sib)
bibliotechsuper.com##[href="https://bibliotechsuper.com/"]

! https://github.com/AdguardTeam/AdguardFilters/issues/52409
shurt.pw##+js(aopr, app_vars.force_disable_adblock)
shurt.pw##+js(aopw, adcashMacros)
shurt.pw##+js(nowoif)
shurt.pw##body > div[style]:has(input[type="button"])
shurt.pw##div[style*="z-index:99999"] > div[style*="width:300px"]
*$frame,denyallow=google.com|hcaptcha.com,domain=shurt.pw
*$script,3p,denyallow=google.com|gstatic.com|hcaptcha.com|jsdelivr.net|recaptcha.net,domain=shurt.pw
||vdo.ai^$3p
||short.pe^$3p

! https://www.reddit.com/r/uBlockOrigin/comments/fqjltj/podcast_advert/
art19.com##+js(json-prune, ad_pods.0.ads.0.segments.0.media ad_pods.1.ads.1.segments.1.media ad_pods.2.ads.2.segments.2.media ad_pods.3.ads.3.segments.3.media ad_pods.4.ads.4.segments.4.media ad_pods.5.ads.5.segments.5.media ad_pods.6.ads.6.segments.6.media ad_pods.7.ads.7.segments.7.media ad_pods.8.ads.8.segments.8.media)
art19.com##.art19-notifications-list

! https://github.com/NanoMeow/QuickReports/issues/3409
||marketbeat.com/scripts/modal/*
marketbeat.com##+js(aeld, mouseleave, NativeDisplayAdID)
marketbeat.com###mb-bar
marketbeat.com##[id*="pnlAd"]
marketbeat.com##a[href*="NativeDisplayAdID"]

! https://github.com/NanoMeow/QuickReports/issues/3422
linkconfig.com##+js(nano-sib)

! https://github.com/NanoMeow/QuickReports/issues/3426
*$script,redirect-rule=noopjs,domain=onbatch.my.id
@@||onbatch.my.id^$ghide
onbatch.my.id##[id*="ScriptRoot"]

! https://github.com/NanoMeow/QuickReports/issues/3427
jkoding.xyz##+js(nostif, _0x)

! bt4g.unblocked .to popups
bt4g.unblocked.to##+js(aopr, open)

! https://github.com/NanoAdblocker/NanoFilters/issues/470
@@||controlc.com^$ghide
||twitch.tv^$xhr,3p,domain=controlc.com
controlc.com##[href^="http://redact.dev"]

! https://github.com/uBlockOrigin/uAssets/issues/10788
legendas.dev##+js(refresh-defuser)
investnewsbrazil.com##+js(nano-stb, contador, *, 0.001)
investnewsbrazil.com##+js(acs, Light.Popup.create)
||oyesrhweyma.com^

! https://github.com/NanoMeow/QuickReports/issues/3432
libreriamo.it##+js(nostif, ai_adb)

! boost.ink link-hijack // boost.ink/ia7o
boost.ink##+js(disable-newtab-links)

! https://github.com/AdguardTeam/AdguardFilters/issues/52499
! https://github.com/AdguardTeam/AdguardFilters/issues/116034
@@||easyexploits.com^$ghide
easyexploits.com##+js(aopr, mm)

! https://github.com/NanoMeow/QuickReports/issues/3439
dailymaverick.co.za##+js(nostif, t(), 0)

! https://github.com/NanoMeow/QuickReports/issues/3446
notiziemusica.it##+js(aopw, adBlockDetected)

! https://github.com/uBlockOrigin/uAssets/issues/7343
dood.*,doods.pro,dooood.*,ds2play.com##+js(aopw, DoodPop)
d0o0d.com,do0od.com,dood.*,ds2video.com##+js(acs, decodeURI, decodeURIComponent)
dood.*##+js(aopr, __aaZoneid)
d0000d.com,d000d.com,d0o0d.com,do0od.com,dood.*,doods.pro,dooood.*,ds2play.com,ds2video.com##+js(nowoif)
d0000d.com,d000d.com,d0o0d.com,do0od.com,dood.*,doods.pro,doodstream.*,dooood.*,ds2play.com,ds2video.com##+js(rmnt, script, /adblock|popunder/)
d0000d.com,d000d.com,d0o0d.com,do0od.com,dood.*,doods.pro,doodstream.*,dooood.*,ds2play.com,ds2video.com##^script:has-text(/adblock|popunder/)
/sw.js$script,domain=d0000d.com|d000d.com|d0o0d.com|do0od.com|dood.*|doods.pro|dooood.*|ds2play.com|ds2video.com
||dexchangegenius.com^
||rfsjuxlip.com^
$popup,3p,domain=ds2play.com,badfilter

! https://github.com/uBlockOrigin/uAssets/issues/7175
androgamer.org##+js(acs, jQuery, ai_adb)

! https://github.com/AdguardTeam/AdguardFilters/issues/52613
@@||fiches-auto.fr^$ghide
fiches-auto.fr###bulle_avvis
fiches-auto.fr##.adsbygoogle:style(visibility: collapse !important)

! https://github.com/NanoMeow/QuickReports/issues/3451
ludigames.com##+js(nostif, ads)

! pixsera
! https://github.com/uBlockOrigin/uAssets/issues/7180
! https://github.com/uBlockOrigin/uAssets/issues/9123
pixsera.net##+js(nano-sib, timer)
pixsera.net##+js(nowoif, !/prcf.fiyar|themes|pixsense|.jpg/)
pixsera.net##+js(set, hold_click, false)
pixsera.net##div[id][style^="position: fixed; display: block; width: 100%;"]
||imgair.net/vip/splitest.html
@@||imgair.net^$script
nemenlake.*##+js(nowoif)
||hottracker.biz^
||explorads.xml-v4.ak-is2.net^
||expmdiadi.com^
||vehavings.biz^
||antoiew.com^
||kooolboomin.com^
||shyvanas.top^$all
||linksprf.com^$3p
||searchwithme.net^
||shacsda.name^$3p
||ghostsinstance.com^
||genishury.pro^$popup
imgair.net,imgblaze.net,imgfrost.net,vestimage.site,imgwia.buzz,pixlev.*,imgbaex.store,imgbah.online,imgbaie.online,imgbango.store,imgbier.store,imgbimn.store,imgbqw.store,imgbuba.online,imgbwe.store,imgbxs.online,imgcao.store,imgnwe.online,imgqge.store,imgqxb.online,imgteq.online,imgtex.online,imgtuta.online,imgwqr.online,imgwww.store,imgxza.store,imgezx.sbs,imgbcxsb.store,imgbcxs.store,imgbake.cfd,imgmffg.sbs,imgmffgtr.sbs,imgnbg.sbs,imgngc.sbs,imgnmh.cfd,imgqte.sbs,imguthes.sbs,imgwag.cfd,imgwang.cfd,imgwety.sbs,imgxuh.cfd,imgxytw.cfd,imgycgey.sbs,imgyruy.cfd,imgyusa.cfd,imgyyqey.sbs,imgyer.store,imgxhs.store,imgwekr.online,imgwbfh.online,imgwak.online,imgutry.online,imgutiyu.online,imgutbbn.online,imgubfd.online,imgrei.online,imgqec.online,imgpaiou.online,imgpaiki.online,imgmjj.store,imgfa.store,imgbutrt.store,imgbty.store,imgbdl.store,imgngh.sbs,imgbbfg.pics,imgjhrjjr.pics,imgleko.pics,imgluki.pics,imgnffe.pics,imgnnnf.pics,imgrwqz.pics,imgtweqz.pics,imgxzgf.pics,imgyyeryt.pics,picbbc.one,picbbdr.one,picbest.one,picbhrt.one,picnrrt.one,picqqw.one,picqr.one,picqtwe.one,picsjre.one,piczzaq.one,imgqazx.sbs,imgiruyw.online,picnerr.cfd,pichfer.cfd,picbbeq.cfd,picqaxs.cfd,picxxdd.cfd,picqweff.cfd,pickjsn.cfd,piczzxsw.cfd,picbbbde.cfd,picbdd.cfd,imgbahxg.sbs,imgxune.sbs,imgqklw.shop,pixqkhgrt.shop,pixqbngg.shop,pixqwet.shop,pixmos.shop,imgtgd.shop,imgcsxx.shop,imgqklw.shop,pixqkhgrt.shop,pixqbngg.shop,pixqwet.shop,pixmos.shop,imgtgd.shop,imgcsxx.shop,imgcssd.shop,imguwjsd.sbs,pictbbf.shop,pixbryexa.sbs,picbqqa.sbs,pixbkghxa.sbs,imgmgf.sbs,picbcxvxa.sbs,imguee.sbs,imgmffmv.sbs,imgbqb.sbs,imgbyrev.sbs,imgbncvnv.sbs,pixtryab.shop,imggune.shop,pictryhab.shop,pixbnab.shop,imgbnwe.shop,imgbbnhi.shop,imgnbii.shop,imghqqbg.shop,imgyhq.shop,pixnbrqwg.sbs,pixnbrqw.sbs,picmsh.sbs,imgpke.sbs,picuenr.sbs,imgolemn.sbs,imgoebn.sbs,picnwqez.sbs,imgjajhe.sbs,pixjnwe.sbs,pixkfjtrkf.shop,pixkfkf.shop,pixdfdjkkr.shop,pixdfdj.shop,picnft.shop,pixrqqz.shop,picngt.shop,picjgfjet.shop,picjbet.shop,imgkkabm.shop,imgxabm.shop,imgthbm.shop,imgmyqbm.shop,imgwwqbm.shop,imgjvmbbm.shop,imgjbxzjv.shop,imgjmgfgm.shop,picxnkjkhdf.sbs,imgxxbdf.sbs,imgnngr.sbs,imgjjtr.sbs,imgqbbds.sbs,imgbvdf.sbs,imgqnnnebrf.sbs,imgnnnvbrf.sbs##+js(aopr, console.clear)
imgair.net,imgblaze.net,imgfrost.net,vestimage.site,imgwia.buzz,pixlev.*,imgbaex.store,imgbah.online,imgbaie.online,imgbango.store,imgbier.store,imgbimn.store,imgbqw.store,imgbuba.online,imgbwe.store,imgbxs.online,imgcao.store,imgnwe.online,imgqge.store,imgqxb.online,imgteq.online,imgtex.online,imgtuta.online,imgwqr.online,imgwww.store,imgxza.store,imgezx.sbs,imgbcxsb.store,imgbcxs.store,imgbake.cfd,imgmffg.sbs,imgmffgtr.sbs,imgnbg.sbs,imgngc.sbs,imgnmh.cfd,imgqte.sbs,imguthes.sbs,imgwag.cfd,imgwang.cfd,imgwety.sbs,imgxuh.cfd,imgxytw.cfd,imgycgey.sbs,imgyruy.cfd,imgyusa.cfd,imgyyqey.sbs,imgyer.store,imgxhs.store,imgwekr.online,imgwbfh.online,imgwak.online,imgutry.online,imgutiyu.online,imgutbbn.online,imgubfd.online,imgrei.online,imgqec.online,imgpaiou.online,imgpaiki.online,imgmjj.store,imgfa.store,imgbutrt.store,imgbty.store,imgbdl.store,imgngh.sbs,imgbbfg.pics,imgjhrjjr.pics,imgleko.pics,imgluki.pics,imgnffe.pics,imgnnnf.pics,imgrwqz.pics,imgtweqz.pics,imgxzgf.pics,imgyyeryt.pics,picbbc.one,picbbdr.one,picbest.one,picbhrt.one,picnrrt.one,picqqw.one,picqr.one,picqtwe.one,picsjre.one,piczzaq.one,imgqazx.sbs,imgiruyw.online,picnerr.cfd,pichfer.cfd,picbbeq.cfd,picqaxs.cfd,picxxdd.cfd,picqweff.cfd,pickjsn.cfd,piczzxsw.cfd,picbbbde.cfd,picbdd.cfd,imgbahxg.sbs,imgxune.sbs,imgqklw.shop,pixqkhgrt.shop,pixqbngg.shop,pixqwet.shop,pixmos.shop,imgtgd.shop,imgcsxx.shop,imgqklw.shop,pixqkhgrt.shop,pixqbngg.shop,pixqwet.shop,pixmos.shop,imgtgd.shop,imgcsxx.shop,imgcssd.shop,imguwjsd.sbs,pictbbf.shop,pixbryexa.sbs,picbqqa.sbs,pixbkghxa.sbs,imgmgf.sbs,picbcxvxa.sbs,imguee.sbs,imgmffmv.sbs,imgbqb.sbs,imgbyrev.sbs,imgbncvnv.sbs,pixtryab.shop,imggune.shop,pictryhab.shop,pixbnab.shop,imgbnwe.shop,imgbbnhi.shop,imgnbii.shop,imghqqbg.shop,imgyhq.shop,pixnbrqwg.sbs,pixnbrqw.sbs,picmsh.sbs,imgpke.sbs,picuenr.sbs,imgolemn.sbs,imgoebn.sbs,picnwqez.sbs,imgjajhe.sbs,pixjnwe.sbs,pixkfjtrkf.shop,pixkfkf.shop,pixdfdjkkr.shop,pixdfdj.shop,picnft.shop,pixrqqz.shop,picngt.shop,picjgfjet.shop,picjbet.shop,imgkkabm.shop,imgxabm.shop,imgthbm.shop,imgmyqbm.shop,imgwwqbm.shop,imgjvmbbm.shop,imgjbxzjv.shop,imgjmgfgm.shop,picxnkjkhdf.sbs,imgxxbdf.sbs,imgnngr.sbs,imgjjtr.sbs,imgqbbds.sbs,imgbvdf.sbs,imgqnnnebrf.sbs,imgnnnvbrf.sbs##+js(nano-sib, timer)
imgair.net,imgblaze.net,imgfrost.net,vestimage.site,imgwia.buzz,pixlev.*,imgbaex.store,imgbah.online,imgbaie.online,imgbango.store,imgbier.store,imgbimn.store,imgbqw.store,imgbuba.online,imgbwe.store,imgbxs.online,imgcao.store,imgnwe.online,imgqge.store,imgqxb.online,imgteq.online,imgtex.online,imgtuta.online,imgwqr.online,imgwww.store,imgxza.store,imgezx.sbs,imgbcxsb.store,imgbcxs.store,imgbake.cfd,imgmffg.sbs,imgmffgtr.sbs,imgnbg.sbs,imgngc.sbs,imgnmh.cfd,imgqte.sbs,imguthes.sbs,imgwag.cfd,imgwang.cfd,imgwety.sbs,imgxuh.cfd,imgxytw.cfd,imgycgey.sbs,imgyruy.cfd,imgyusa.cfd,imgyyqey.sbs,imgyer.store,imgxhs.store,imgwekr.online,imgwbfh.online,imgwak.online,imgutry.online,imgutiyu.online,imgutbbn.online,imgubfd.online,imgrei.online,imgqec.online,imgpaiou.online,imgpaiki.online,imgmjj.store,imgfa.store,imgbutrt.store,imgbty.store,imgbdl.store,imgngh.sbs,imgbbfg.pics,imgjhrjjr.pics,imgleko.pics,imgluki.pics,imgnffe.pics,imgnnnf.pics,imgrwqz.pics,imgtweqz.pics,imgxzgf.pics,imgyyeryt.pics,picbbc.one,picbbdr.one,picbest.one,picbhrt.one,picnrrt.one,picqqw.one,picqr.one,picqtwe.one,picsjre.one,piczzaq.one,imgqazx.sbs,imgiruyw.online,picnerr.cfd,pichfer.cfd,picbbeq.cfd,picqaxs.cfd,picxxdd.cfd,picqweff.cfd,pickjsn.cfd,piczzxsw.cfd,picbbbde.cfd,picbdd.cfd,imgbahxg.sbs,imgxune.sbs,imgqklw.shop,pixqkhgrt.shop,pixqbngg.shop,pixqwet.shop,pixmos.shop,imgtgd.shop,imgcsxx.shop,imgqklw.shop,pixqkhgrt.shop,pixqbngg.shop,pixqwet.shop,pixmos.shop,imgtgd.shop,imgcsxx.shop,imgcssd.shop,imguwjsd.sbs,pictbbf.shop,pixbryexa.sbs,picbqqa.sbs,pixbkghxa.sbs,imgmgf.sbs,picbcxvxa.sbs,imguee.sbs,imgmffmv.sbs,imgbqb.sbs,imgbyrev.sbs,imgbncvnv.sbs,pixtryab.shop,imggune.shop,pictryhab.shop,pixbnab.shop,imgbnwe.shop,imgbbnhi.shop,imgnbii.shop,imghqqbg.shop,imgyhq.shop,pixnbrqwg.sbs,pixnbrqw.sbs,picmsh.sbs,imgpke.sbs,picuenr.sbs,imgolemn.sbs,imgoebn.sbs,picnwqez.sbs,imgjajhe.sbs,pixjnwe.sbs,pixkfjtrkf.shop,pixkfkf.shop,pixdfdjkkr.shop,pixdfdj.shop,picnft.shop,pixrqqz.shop,picngt.shop,picjgfjet.shop,picjbet.shop,imgkkabm.shop,imgxabm.shop,imgthbm.shop,imgmyqbm.shop,imgwwqbm.shop,imgjvmbbm.shop,imgjbxzjv.shop,imgjmgfgm.shop,picxnkjkhdf.sbs,imgxxbdf.sbs,imgnngr.sbs,imgjjtr.sbs,imgqbbds.sbs,imgbvdf.sbs,imgqnnnebrf.sbs,imgnnnvbrf.sbs##div[id][style^="position: fixed; display: block; width: 100%;"]
imgair.net,imgblaze.net,imgfrost.net,vestimage.site,imgwia.buzz,pixlev.*,imgbaex.store,imgbah.online,imgbaie.online,imgbango.store,imgbier.store,imgbimn.store,imgbqw.store,imgbuba.online,imgbwe.store,imgbxs.online,imgcao.store,imgnwe.online,imgqge.store,imgqxb.online,imgteq.online,imgtex.online,imgtuta.online,imgwqr.online,imgwww.store,imgxza.store,imgezx.sbs,imgbcxsb.store,imgbcxs.store,imgbake.cfd,imgmffg.sbs,imgmffgtr.sbs,imgnbg.sbs,imgngc.sbs,imgnmh.cfd,imgqte.sbs,imguthes.sbs,imgwag.cfd,imgwang.cfd,imgwety.sbs,imgxuh.cfd,imgxytw.cfd,imgycgey.sbs,imgyruy.cfd,imgyusa.cfd,imgyyqey.sbs,imgyer.store,imgxhs.store,imgwekr.online,imgwbfh.online,imgwak.online,imgutry.online,imgutiyu.online,imgutbbn.online,imgubfd.online,imgrei.online,imgqec.online,imgpaiou.online,imgpaiki.online,imgmjj.store,imgfa.store,imgbutrt.store,imgbty.store,imgbdl.store,imgngh.sbs,imgbbfg.pics,imgjhrjjr.pics,imgleko.pics,imgluki.pics,imgnffe.pics,imgnnnf.pics,imgrwqz.pics,imgtweqz.pics,imgxzgf.pics,imgyyeryt.pics,picbbc.one,picbbdr.one,picbest.one,picbhrt.one,picnrrt.one,picqqw.one,picqr.one,picqtwe.one,picsjre.one,piczzaq.one,imgqazx.sbs,imgiruyw.online,picnerr.cfd,pichfer.cfd,picbbeq.cfd,picqaxs.cfd,picxxdd.cfd,picqweff.cfd,pickjsn.cfd,piczzxsw.cfd,picbbbde.cfd,picbdd.cfd,imgbahxg.sbs,imgxune.sbs,imgqklw.shop,pixqkhgrt.shop,pixqbngg.shop,pixqwet.shop,pixmos.shop,imgtgd.shop,imgcsxx.shop,imgqklw.shop,pixqkhgrt.shop,pixqbngg.shop,pixqwet.shop,pixmos.shop,imgtgd.shop,imgcsxx.shop,imgcssd.shop,imguwjsd.sbs,pictbbf.shop,pixbryexa.sbs,picbqqa.sbs,pixbkghxa.sbs,imgmgf.sbs,picbcxvxa.sbs,imguee.sbs,imgmffmv.sbs,imgbqb.sbs,imgbyrev.sbs,imgbncvnv.sbs,pixtryab.shop,imggune.shop,pictryhab.shop,pixbnab.shop,imgbnwe.shop,imgbbnhi.shop,imgnbii.shop,imghqqbg.shop,imgyhq.shop,pixnbrqwg.sbs,pixnbrqw.sbs,picmsh.sbs,imgpke.sbs,picuenr.sbs,imgolemn.sbs,imgoebn.sbs,picnwqez.sbs,imgjajhe.sbs,pixjnwe.sbs,pixkfjtrkf.shop,pixkfkf.shop,pixdfdjkkr.shop,pixdfdj.shop,picnft.shop,pixrqqz.shop,picngt.shop,picjgfjet.shop,picjbet.shop,imgkkabm.shop,imgxabm.shop,imgthbm.shop,imgmyqbm.shop,imgwwqbm.shop,imgjvmbbm.shop,imgjbxzjv.shop,imgjmgfgm.shop,picxnkjkhdf.sbs,imgxxbdf.sbs,imgnngr.sbs,imgjjtr.sbs,imgqbbds.sbs,imgbvdf.sbs,imgqnnnebrf.sbs,imgnnnvbrf.sbs##div[style="width:100%;height:110px"]
imgair.net,imgblaze.net,imgfrost.net,vestimage.site,imgwia.buzz,pixlev.*,imgbaex.store,imgbah.online,imgbaie.online,imgbango.store,imgbier.store,imgbimn.store,imgbqw.store,imgbuba.online,imgbwe.store,imgbxs.online,imgcao.store,imgnwe.online,imgqge.store,imgqxb.online,imgteq.online,imgtex.online,imgtuta.online,imgwqr.online,imgwww.store,imgxza.store,imgezx.sbs,imgbcxsb.store,imgbcxs.store,imgbake.cfd,imgmffg.sbs,imgmffgtr.sbs,imgnbg.sbs,imgngc.sbs,imgnmh.cfd,imgqte.sbs,imguthes.sbs,imgwag.cfd,imgwang.cfd,imgwety.sbs,imgxuh.cfd,imgxytw.cfd,imgycgey.sbs,imgyruy.cfd,imgyusa.cfd,imgyyqey.sbs,imgyer.store,imgxhs.store,imgwekr.online,imgwbfh.online,imgwak.online,imgutry.online,imgutiyu.online,imgutbbn.online,imgubfd.online,imgrei.online,imgqec.online,imgpaiou.online,imgpaiki.online,imgmjj.store,imgfa.store,imgbutrt.store,imgbty.store,imgbdl.store,imgngh.sbs,imgbbfg.pics,imgjhrjjr.pics,imgleko.pics,imgluki.pics,imgnffe.pics,imgnnnf.pics,imgrwqz.pics,imgtweqz.pics,imgxzgf.pics,imgyyeryt.pics,picbbc.one,picbbdr.one,picbest.one,picbhrt.one,picnrrt.one,picqqw.one,picqr.one,picqtwe.one,picsjre.one,piczzaq.one,imgqazx.sbs,imgiruyw.online,picnerr.cfd,pichfer.cfd,picbbeq.cfd,picqaxs.cfd,picxxdd.cfd,picqweff.cfd,pickjsn.cfd,piczzxsw.cfd,picbbbde.cfd,picbdd.cfd,imgbahxg.sbs,imgxune.sbs,imgqklw.shop,pixqkhgrt.shop,pixqbngg.shop,pixqwet.shop,pixmos.shop,imgtgd.shop,imgcsxx.shop,imgqklw.shop,pixqkhgrt.shop,pixqbngg.shop,pixqwet.shop,pixmos.shop,imgtgd.shop,imgcsxx.shop,imgcssd.shop,imguwjsd.sbs,pictbbf.shop,pixbryexa.sbs,picbqqa.sbs,pixbkghxa.sbs,imgmgf.sbs,picbcxvxa.sbs,imguee.sbs,imgmffmv.sbs,imgbqb.sbs,imgbyrev.sbs,imgbncvnv.sbs,pixtryab.shop,imggune.shop,pictryhab.shop,pixbnab.shop,imgbnwe.shop,imgbbnhi.shop,imgnbii.shop,imghqqbg.shop,imgyhq.shop,pixnbrqwg.sbs,pixnbrqw.sbs,picmsh.sbs,imgpke.sbs,picuenr.sbs,imgolemn.sbs,imgoebn.sbs,picnwqez.sbs,imgjajhe.sbs,pixjnwe.sbs,pixkfjtrkf.shop,pixkfkf.shop,pixdfdjkkr.shop,pixdfdj.shop,picnft.shop,pixrqqz.shop,picngt.shop,picjgfjet.shop,picjbet.shop,imgkkabm.shop,imgxabm.shop,imgthbm.shop,imgmyqbm.shop,imgwwqbm.shop,imgjvmbbm.shop,imgjbxzjv.shop,imgjmgfgm.shop,picxnkjkhdf.sbs,imgxxbdf.sbs,imgnngr.sbs,imgjjtr.sbs,imgqbbds.sbs,imgbvdf.sbs,imgqnnnebrf.sbs,imgnnnvbrf.sbs##+js(nowoif, !/prcf.fiyar|themes|pixsense|.jpg/)
imgair.net,imgblaze.net,imgfrost.net,vestimage.site,imgwia.buzz,pixlev.*,imgbaex.store,imgbah.online,imgbaie.online,imgbango.store,imgbier.store,imgbimn.store,imgbqw.store,imgbuba.online,imgbwe.store,imgbxs.online,imgcao.store,imgnwe.online,imgqge.store,imgqxb.online,imgteq.online,imgtex.online,imgtuta.online,imgwqr.online,imgwww.store,imgxza.store,imgezx.sbs,imgbcxsb.store,imgbcxs.store,imgbake.cfd,imgmffg.sbs,imgmffgtr.sbs,imgnbg.sbs,imgngc.sbs,imgnmh.cfd,imgqte.sbs,imguthes.sbs,imgwag.cfd,imgwang.cfd,imgwety.sbs,imgxuh.cfd,imgxytw.cfd,imgycgey.sbs,imgyruy.cfd,imgyusa.cfd,imgyyqey.sbs,imgyer.store,imgxhs.store,imgwekr.online,imgwbfh.online,imgwak.online,imgutry.online,imgutiyu.online,imgutbbn.online,imgubfd.online,imgrei.online,imgqec.online,imgpaiou.online,imgpaiki.online,imgmjj.store,imgfa.store,imgbutrt.store,imgbty.store,imgbdl.store,imgngh.sbs,imgbbfg.pics,imgjhrjjr.pics,imgleko.pics,imgluki.pics,imgnffe.pics,imgnnnf.pics,imgrwqz.pics,imgtweqz.pics,imgxzgf.pics,imgyyeryt.pics,picbbc.one,picbbdr.one,picbest.one,picbhrt.one,picnrrt.one,picqqw.one,picqr.one,picqtwe.one,picsjre.one,piczzaq.one,imgqazx.sbs,imgiruyw.online,picnerr.cfd,pichfer.cfd,picbbeq.cfd,picqaxs.cfd,picxxdd.cfd,picqweff.cfd,pickjsn.cfd,piczzxsw.cfd,picbbbde.cfd,picbdd.cfd,imgbahxg.sbs,imgxune.sbs,imgqklw.shop,pixqkhgrt.shop,pixqbngg.shop,pixqwet.shop,pixmos.shop,imgtgd.shop,imgcsxx.shop,imgqklw.shop,pixqkhgrt.shop,pixqbngg.shop,pixqwet.shop,pixmos.shop,imgtgd.shop,imgcsxx.shop,imgcssd.shop,imguwjsd.sbs,pictbbf.shop,pixbryexa.sbs,picbqqa.sbs,pixbkghxa.sbs,imgmgf.sbs,picbcxvxa.sbs,imguee.sbs,imgmffmv.sbs,imgbqb.sbs,imgbyrev.sbs,imgbncvnv.sbs,pixtryab.shop,imggune.shop,pictryhab.shop,pixbnab.shop,imgbnwe.shop,imgbbnhi.shop,imgnbii.shop,imghqqbg.shop,imgyhq.shop,pixnbrqwg.sbs,pixnbrqw.sbs,picmsh.sbs,imgpke.sbs,picuenr.sbs,imgolemn.sbs,imgoebn.sbs,picnwqez.sbs,imgjajhe.sbs,pixjnwe.sbs,pixkfjtrkf.shop,pixkfkf.shop,pixdfdjkkr.shop,pixdfdj.shop,picnft.shop,pixrqqz.shop,picngt.shop,picjgfjet.shop,picjbet.shop,imgkkabm.shop,imgxabm.shop,imgthbm.shop,imgmyqbm.shop,imgwwqbm.shop,imgjvmbbm.shop,imgjbxzjv.shop,imgjmgfgm.shop,picxnkjkhdf.sbs,imgxxbdf.sbs,imgnngr.sbs,imgjjtr.sbs,imgqbbds.sbs,imgbvdf.sbs,imgqnnnebrf.sbs,imgnnnvbrf.sbs##div[class][style="display: block;"]

! https://www.reddit.com/r/uBlockOrigin/comments/fqjo82/pandora_just_started_detecting_ad_blocker_wont/
! https://github.com/uBlockOrigin/uAssets/issues/12733
@@||pandora.com/web-version/*.json$xhr,1p
*$script,redirect-rule=noopjs,domain=pandora.com
||pandora.com/static/ads/omsdk-$script,redirect=noop.js
||imasdk.googleapis.com/js/sdkloader/ima3.js$script,domain=pandora.com,redirect=google-ima.js:10

! https://github.com/AdguardTeam/AdguardFilters/issues/52633
||clk.sh^$3p

! https://github.com/AdguardTeam/AdguardFilters/issues/52643
hentaipornpics.net##+js(acs, $, zendplace)
hentaipornpics.net##+js(aeld, mouseover, event.triggered)

! https://github.com/NanoMeow/QuickReports/issues/3457
@@||templateshub.net^$ghide

! https://github.com/AdguardTeam/AdguardFilters/issues/89752
! https://github.com/AdguardTeam/AdguardFilters/issues/89758
gaypornhdfree.*##+js(aeld, DOMContentLoaded, adsBlocked)

||giftcardbouns.com^

! https://github.com/AdguardTeam/AdguardFilters/issues/52702
*$xhr,3p,redirect-rule=nooptext,domain=podu.me
*/ads$media,redirect-rule=noopmp3-0.1s,domain=podu.me
||podu.me/*/advertisement^$xhr,1p
podu.me##.adv-contanier

! https://github.com/AdguardTeam/AdguardFilters/issues/62436
programmiedovetrovarli.it##+js(aost, encodeURIComponent, inlineScript)

! https://forums.lanik.us/viewtopic.php?f=103&t=44512
@@||bolsanow.com^$ghide

! https://github.com/NanoMeow/QuickReports/issues/3460
funzen.net##+js(nostif, mdpDeBlocker)

! https://github.com/uBlockOrigin/uAssets/issues/7186
acessarlink.online,subdowns.com##+js(nano-stb, , , 0)
subsvip.com##+js(nano-stb, , 10000, 0)
subsvip.com###botaoBloqueio
subsvip.com###botaoLink:style(display: block !important;)

! https://github.com/uBlockOrigin/uAssets/issues/9520
smoner.com##+js(aopr, app_vars.force_disable_adblock)
smoner.com##+js(set, blurred, false)
smoner.com##.form-group:has(> div#box[style="display: inline-block;"])
*$script,3p,denyallow=google.com|gstatic.com|recaptcha.net,domain=smoner.com

! https://github.com/uBlockOrigin/uAssets/issues/9841
javcl.com##+js(nostif, 0x)
javcl.com##+js(nosiif, 0x)
javcl.com###wrapfabtest:style(height:1px !important;width:1px !important)

! https://github.com/NanoMeow/QuickReports/issues/3470
c1ne.co##+js(aopr, mdpDeBlocker)

! https://github.com/NanoMeow/QuickReports/issues/3471
thesukan.net##+js(aost, String.prototype.charCodeAt, ai_)

! https://github.com/AdguardTeam/AdguardFilters/issues/52789
@@||suj.nu^$ghide
suj.nu##.ads

! https://github.com/AdguardTeam/AdguardFilters/issues/52791
ru-xvideos.me##+js(nostif, innerText, 2000)

! https://www.reddit.com/r/uBlockOrigin/comments/mk2kad/ublock_detected_again/
! https://fp.apps2app.com/2022/01/1.html#?o=c67546ceabdca453b44c4fa796138c912c1e49e9cedb1fb97d2d578f218318534aa79e99a895a230
*$script,redirect-rule=noopjs,domain=apps2app.com
apps2app.com##.adsbygoogle:style(width:1px!important;height:1px!important;min-width:1px!important;min-height:1px)
apps2app.com##+js(aeld, load, removeChild)
apps2app.com##+js(nostif, $)
apps2app.com##+js(nano-sib, gotolink)
apps2app.com##+js(ra, disabled, button)
apps2app.com##+js(rc, hidden, button)
apps2app.com##button:style(display: inline-block !important)
apps2app.com###timer
! https://github.com/uBlockOrigin/uAssets/issues/12391
toolss.net##+js(acs, eval, replace)
toolss.net##+js(no-fetch-if, googlesyndication)
@@||toolss.net^$ghide
toolss.net##.sidebar_adds
toolss.net##ins.adsbygoogle
||toolss.net^$3p
toolss.net###wpsafe-generate, #wpsafe-link:style(display: block !important;)
toolss.net##div[id^="wpsafe-wait"]

! https://github.com/AdguardTeam/AdguardFilters/issues/52825
jav.sh##+js(aopr, AaDetector)
jav.sh##+js(aopr, document.regexpSrcDomainPlaceholder)
jav.sh##center > div
*$script,3p,denyallow=cloudflare.com,domain=jav.fm|jav.sh|jav.vin

! scrubson. blogspot.com anti adb + popups
scrubson.blogspot.com##+js(aopr, adcashMacros)

! nsfw aquariumgays .com anti adb + popups
aquariumgays.com##+js(aopr, _cpp)
aquariumgays.com##+js(acs, eval, replace)

! redecanais.bz ads
redecanais.*###guerejo
redecanais.*###guerejoback
redecanais.*###iframeCore____
allgamesejogos.*,bemestarglobal.*,gamesgo.*,lojadebicicleta.com.br,redecanais.*##[id="colunas"]:style(display: block !important;)

! https://github.com/NanoMeow/QuickReports/issues/3477
vz.lt##+js(acs, $, adblock)
vz.lt##.banners

! https://github.com/AdguardTeam/AdguardFilters/issues/52866
javxxx.me###player_3x2_container_inner
*/player/plugins/vast-*.js$script

! https://github.com/NanoMeow/QuickReports/issues/3487
testlanguages.com##+js(set, sgpbCanRunAds, true)

! nsfw porncomics .me popups
porncomics.me##+js(aopr, open)

! https://github.com/NanoMeow/QuickReports/issues/3494
paginadanoticia.com.br##+js(aopr, pareAdblock)
paginadanoticia.com.br##.banner-img

! https://github.com/uBlockOrigin/uAssets/issues/7198
watchtvseries.video##+js(nosiif, visibility, 1000)

! https://github.com/AdguardTeam/AdguardFilters/issues/52934
! https://github.com/NanoMeow/QuickReports/issues/4083
tr.link##+js(nowoif, ppcnt)
tr.link##+js(ra, data-ppcnt_ads, main[onclick])
||tr.link/js/sweets.js$script,1p
||tr.link/*/sweet.js$script,1p
||tr.link/push/push.js$script,1p
tr.link##.sweet-alert
tr.link##.sweet-overlay

! celebmasta.com video ad/banner
||celebmasta.com/vast/$1p
celebmasta.com##img.size-medium
celebmasta.com##+js(aopr, dataPopUnder)

! https://github.com/NanoMeow/QuickReports/issues/3500
faucetdump.com##+js(acs, $, ads)

! https://github.com/NanoMeow/QuickReports/issues/3504
@@||beti.club^$ghide

! https://github.com/uBlockOrigin/uAssets/issues/7200
@@||superuser.cz^$ghide

! https://www.reddit.com/r/uBlockOrigin/comments/fvpk26/can_someone_help_me_block_a_popup/
orsm.net##+js(aopr, open)

! https://www.reddit.com/r/uBlockOrigin/comments/fvvmal/trying_to_hide_scriptblock_warning_on/
fernsehserien.de##+js(aopr, googlefc)

! https://forums.lanik.us/viewtopic.php?p=153975#p153975
@@||precitaj.si^$ghide
precitaj.si##ins.adsbygoogle

! https://github.com/NanoMeow/QuickReports/issues/3512
lg-firmwares.com##+js(nano-sib)
@@||lg-firmwares.com^$ghide
lg-firmwares.com##.cc-window, .buy_on_amazon, .post-ads

! https://github.com/uBlockOrigin/uAssets/issues/7202
! https://github.com/uBlockOrigin/uAssets/issues/12571
animeblix.*##+js(nowoif)

! https://github.com/AdguardTeam/AdguardFilters/issues/53052
hd-tch.com##+js(acs, addEventListener, nextFunction)

! https://github.com/AdguardTeam/AdguardFilters/issues/53080
2kspecialist.net##+js(acs, addEventListener, blocker)

! https://github.com/AdguardTeam/AdguardFilters/issues/53084
digit77.com##+js(acs, addEventListener, Blocker)

! pcmag.com whitespace caused by a necessary exception in EasyList
pcmag.com###adkit_billboard:style(padding-top: 0px!important;)

! kutubistan.blogspot.com/softdroid4u.blogspot.com anti-adb
! https://github.com/AdguardTeam/AdguardFilters/issues/53098
kutubistan.blogspot.com,softdroid4u.blogspot.com,cosmomaker3.blogspot.com##+js(acs, addEventListener, blocker)

! khmer7.org anti-adb
khmer7.org##+js(acs, addEventListener, blocker)
khmer7.org##+js(aopr, adcashMacros)

! proxyserverlist24.top anti-adb
proxyserverlist24.top##+js(acs, addEventListener, blocker)
proxyserverlist24.top###HTML1, #HTML5, .Feed.widget, [href^="http://www.linkev.com/"], [href^="https://brave.com/"]

! gudangfirmwere.com anti-adb
gudangfirmwere.com##+js(acs, addEventListener, AdBlocker)

! kamerabudaya.com anti-adb
kamerabudaya.com##+js(acs, addEventListener, adblock)
kamerabudaya.com##.ads, div.adsadsense, #HTML1

! https://github.com/AdguardTeam/AdguardFilters/issues/53099
gbadamud.blogspot.com##+js(acs, addEventListener, blocker)
gbadamud.blogspot.com##.pinterestjo, .googlejo

! https://github.com/AdguardTeam/AdguardFilters/issues/81005
javtiful.com##+js(acs, document.addEventListener, adsBlocked)
javtiful.com##+js(acs, String.fromCharCode, 'shift')
javtiful.com##+js(acs, addEventListener, -0x)
javtiful.com##+js(aopr, decodeURI)
javtiful.com##body > div[style*="z-index:"]
javtiful.com##[href^="//"][rel="nofollow norefferer noopener"]
fakyutube.com##+js(nowoif)
fakyutube.com##+js(aopr, __Y)
supervideo.*##+js(aopr, AaDetector)
/tag*.js$script,domain=supervideo.tv|supervideo.one|supervideo.cc
||oussouveem.com^

! nsfw thisav .com popups
*$script,redirect-rule=noopjs,domain=thisav.com
thisav.com##^script:has-text('shift')
thisav.com##^script:has-text(\'shift\')
||antirgiocub.com^
||intellipopup.com^$script,redirect=noopjs
||antirgiocub.com^$script,redirect=noopjs

! https://github.com/AdguardTeam/AdguardFilters/issues/53153
@@||enterinit.com^$ghide
enterinit.com##.bs-wrap-gdpr-law
enterinit.com##*::selection:style(background-color:#338FFF!important)

! https://github.com/AdguardTeam/AdguardFilters/issues/53214
buzz50.com##+js(acs, jQuery, blocker)
buzz50.com##[href^="http://buzz50.co.uk/"]

! https://github.com/AdguardTeam/AdguardFilters/issues/78143
||cdn.jsdelivr.net/*/dist/js/wgd-core.min.js$script

! https://github.com/uBlockOrigin/uAssets/issues/11113
premid.app##+js(nosiif, innerHTML)
premid.app##+js(nano-sib, clearInterval)
@@||premid.app/ads/ads$xhr,1p
@@||premid.app^$ghide
premid.app##ins.adsbygoogle

! https://github.com/NanoMeow/QuickReports/issues/3527
thejobsmovie.com##+js(nostif, adsBlocked)

! https://github.com/AdguardTeam/AdguardFilters/issues/53238
@@||techdracula.com^$ghide
techdracula.com##ins.adsbygoogle

! https://github.com/NanoMeow/QuickReports/issues/98
||bwtsrv.com^$3p

! thememazing .com broken page + other anti adb
! fix mdpDeBlocker + some other anti-adb
||pagead2.googlesyndication.com/pagead/js/adsbygoogle.js$script,xhr,redirect=googlesyndication_adsbygoogle.js:5,domain=~zipextractor.app
||pagead2.googlesyndication.com^$xhr,redirect=noop.js

! regex
/^https?:\/\/(?:www\.|[0-9a-z]{7,10}\.)?[-0-9a-z]{5,}\.com\/\/?(?:[0-9a-f]{2}\/){2,3}[0-9a-f]{32}\.js/$script,xhr,3p,redirect=noop.js,to=com
! https://github.com/easylist/easylist/issues/6476
/^https?:\/\/(?:[a-z]{2}\.)?[0-9a-z]{5,16}\.[a-z]{3,7}\/[a-z](?=[a-z]{0,25}[0-9A-Z])[0-9a-zA-Z]{3,26}\/\d{4,5}(?:\?[_v]=\d+)?$/$script,3p,match-case,redirect=noop.js
/^https?:\/\/(?:[a-z]{2}\.)?[0-9a-z]{7,16}\.com\/[a-z](?=[a-z]{0,25}[0-9A-Z])[0-9a-zA-Z]{3,26}\/\d{4,5}\??(?:_=\d+|v=\d)?$/$frame,xhr,popup,3p,match-case,to=com
/^https?:\/\/(?:[a-z]{2}\.)?[0-9a-z]{7,16}\.website\/[a-z](?=[a-z]{0,25}[0-9A-Z])[0-9a-zA-Z]{3,26}\/\d{4,5}\??(?:_=\d+|v=\d)?$/$frame,xhr,popup,3p,match-case
! https://github.com/easylist/easylist/issues/6471
/\/t\/[0-9]{3}\/[0-9]{3}\/a[0-9]{4,9}\.js$/$script
/^https?:\/\/[0-9a-z]{13,14}\.cloudfront\.net\/\?[a-z]{3,5}=\d{6,7}$/$script,xhr,3p
! https://github.com/easylist/easylist/pull/9330
/^https:\/\/[0-9a-f]{10}\.[0-9a-f]{10}\.com\/[0-9a-f]{32}\.js$/$script,3p,to=com
! globalThis
/^https?:\/\/[0-9a-f]{50,}\.s3\.amazonaws\.com\/[0-9a-f]{10}$/$xhr,3p
/^https?:\/\/s3\.us-east-1\.amazonaws\.com\/[0-9a-f]{50,}\/[0-9a-f]{10}$/$xhr,3p
! propeller new variants
/^https?:\/\/[a-z]{8,15}\.top(\/(?:\d{1,5}|0NaN|articles?|browse|index|movie|news|pages?|static|view|web|wiki)){1,4}(?:\.html|\/)$/$frame,3p,match-case
/^https?:\/\/[a-z]{8,15}\.top\/(?!api|available|team)[a-z]{4,}\.json$/$xhr,3p,match-case
/^https?:\/\/[a-z]{8,15}\.top\/[-a-z]{4,}\.css\?aHR0c[\/0-9a-zA-Z]{33,}=?=?$/$css,3p,match-case
/^https?:\/\/[a-z]{8,15}\.top\/[a-z]{4,}\.png\?aHR0c[\/0-9a-zA-Z]{33,}=?=?$/$image,3p,match-case
/^https?:\/\/[a-z]{8,15}\.xyz(\/(?:\d{1,5}|0NaN|articles?|browse|index|movie|news|pages?|static|view|web|wiki)){1,4}(?:\.html|\/)$/$frame,3p,match-case
/^https?:\/\/[a-z]{8,15}\.xyz\/(?!api|available|team)[a-z]{4,}\.json$/$xhr,3p,match-case
/^https?:\/\/[a-z]{8,15}\.xyz\/[-a-z]{4,}\.css\?aHR0c[\/0-9a-zA-Z]{33,}=?=?$/$css,3p,match-case
/^https?:\/\/[a-z]{8,15}\.xyz\/[a-z]{4,}\.png\?aHR0c[\/0-9a-zA-Z]{33,}=?=?$/$image,3p,match-case
.top/event|$xhr,3p
.xyz/event|$xhr,3p
! hilltopads
/^https?:\/\/[-a-z]{6,}\.com?\/[a-d][-\.\/_A-Za-z][DHWXm][-\.\/_A-Za-z][59FVZ][-\.\/_A-Za-z][6swyz][-\.\/_A-Za-z][-\/_0-9a-zA-Z][-\.\/_A-Za-z][-\/_0-9a-zA-Z]{22,162}$/$script,xhr,3p,match-case,to=co|com
/^https?:\/\/[-a-z]{6,}\.info\/[a-d][-\.\/_A-Za-z][DHWXm][-\.\/_A-Za-z][59FVZ][-\.\/_A-Za-z][6swyz][-\.\/_A-Za-z][-\/_0-9a-zA-Z][-\.\/_A-Za-z][-\/_0-9a-zA-Z]{22,162}$/$script,xhr,3p,match-case,to=info
/^https?:\/\/[-a-z]{6,}\.pro\/[a-d][-\.\/_A-Za-z][DHWXm][-\.\/_A-Za-z][59FVZ][-\.\/_A-Za-z][6swyz][-\.\/_A-Za-z][-\/_0-9a-zA-Z][-\.\/_A-Za-z][-\/_0-9a-zA-Z]{22,162}$/$script,xhr,3p,match-case,to=pro
/^https?:\/\/[-a-z]{6,}\.xyz\/[a-d][-\.\/_A-Za-z][DHWXm][-\.\/_A-Za-z][59FVZ][-\.\/_A-Za-z][6swyz][-\.\/_A-Za-z][-\/_0-9a-zA-Z][-\.\/_A-Za-z][-\/_0-9a-zA-Z]{22,162}$/$script,xhr,3p,match-case,to=xyz

! Defuse pointless online tool too causing hardship to volunteers
! https://twitter.com/gorhill/status/1583581072197312512
*$3p,domain=d3ward.github.io
@@*$redirect-rule,domain=d3ward.github.io
d3ward.github.io##.textads

! As of 2020-04-09, new filters will be added to year-based sublists

!#include filters-2020.txt
!#include filters-2021.txt
!#include filters-2022.txt
!#include filters-2023.txt
!#include filters-2024.txt

! Link shortener filters go into their own dedicated list
!#include ubo-link-shorteners.txt

!#if env_mobile
!#include filters-mobile.txt
!#endif
