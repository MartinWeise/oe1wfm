---
summary: Digital operation summary page
authors:
- Martin Weise
hide:
- navigation
---

## Yaesu FT-891

I had unsuccessful attempts to soldier an analog cable from instructions online 
(from [KM4NMP](https://km4nmp.com/2019/08/14/yaesu-ft-891-sound-card-interface-cable/)) along with a soundcard and audio
splitter. Now (half a year later) with a working digital setup, I did a very simple experiment, comparing both FT8 kits:

1. *Assembled kit*
    * "SABRENT AU-MMSA 2.1 Audio Sound Card Adapter" (I will not link to this product as it was not successful)
    * 3.5mm audio splitter cable
    * FT8 cable from AliExpress
2. *Commercial kit*
    * digirig
    * FT8 cables for Yaesu FT-8xx from the digirig store
    * USB isolator from the digirig store
    * USB-C cable from home

Using a [HackRF One](https://greatscottgadgets.com/hackrf/one/) from my workshop, I was able to debug the transmission.
There was something wrong with the splitting of the Rcv/Tx frequencies for the *assembled kit*, signals above 
500-1000 Hz in split mode had nearly no transmission power. Below is the experiment setup, the Tx power is set to 25W.

<figure markdown>
  ![Radio](/images/experiment_setup.png)
  <figcaption>Experiment setup</figcaption>
</figure>

The setup is very simple, the HackRF is placed about 1m from the dipole in my flat. The results (below) with the same
software settings confirm there is no transmission with the *assembled* kit.

<figure markdown>
  ![Radio](/images/spectrum.png)
  <figcaption>No transmission with the AliExpress setup</figcaption>
</figure>

### FT8

So I decided to give it a last shot with buying the [digirig](https://digirig.net/), a tiny analog interface/soundcard
for digital modes like FT8. This approach proved very successful, 

<figure markdown>
  ![Station Digirig](/images/station_digirig.png)
  <figcaption>Station overview with the digirig working FT8</figcaption>
</figure>

For completeness and advice:

<figure markdown>
  ![Radio](/images/ft8-settings.png)
  <figcaption>Station settings (left) and WSJT-X settings (right) for successful FT8</figcaption>
</figure>

The result is:

<figure markdown>
  ![Radio](/images/ft8-working.png)
  <figcaption>WSJT-X wide graph showing transmissions (left) and decoded FT8 messages (right)</figcaption>
</figure>

## Hytera PD-785g

I bought a used Hytera PD-785g with a custom code plug. I downloaded the Hytera CPS programming software
from [hamdigitaal.nl](https://www.hamdigitaal.nl/hytera-software-1/). The radio operates in the 70cm band within
400-470MHz.

<figure markdown>
  ![Radio](/images/hytera-radio.JPEG)
  <figcaption>Hytera PD-785g radio</figcaption>
</figure>

During the COVID-19 lockdown in Austria starting from February, I bought a audio cable extension to covertly listening
to the famous Kahlenbergrunde at OE1XUU and walking outside in the park. It gave me a good reason to leave my apartment
and have some company.

<figure markdown>
  ![Radio](/images/hytera-cables.JPEG)
  <figcaption>Accessories for the Hytera PD-785g</figcaption>
</figure>

### MMDVM_HS_HAT

Raspberry Pi 3B+ with a MMDVM HAT (*MultiMode Digital Voice Modem with Hardware Attached on Top*) I ordered 
as [2023 Jumbospot from AliExpress](https://de.aliexpress.com/item/4000903026368.html) works out of the box 
with [Pi-Star_RPi_V3.4.17_20-Jan-2019.zip](https://download.pistar.uk/Pi-Star_RPi_V3.4.17_20-Jan-2019.zip). Since this
software seems to be *end of life*, I mirrored the SD-card image for others, so they can continue using their old 
hardware like me. Just drop me a mail and I will send you a copy.

<figure markdown>
  ![Radio](/images/mmdvm_hs_hat.png)
  <figcaption>Jumbospot on a Raspberry Pi 3B+</figcaption>
</figure>

### Operation

#### APRS

I use the *Automatic Packet Reporting System* on my [MMDVM_HS_HAT](https://aprs.fi/info/a/OE1WFM-DP) which is activated
by default in Pi Star. The Hytera PD-785g can send APRS packages when on digital 
channels, they are transmitted via [DMR+](https://aprs.fi/info/a/OE1WFM). I also have experimented with 
the [aprs.fi](https://apps.apple.com/us/app/aprs-fi/id922155038) app which sends APRS messages 
via [TCP/IP](https://aprs.fi/info/w/8142074207) and works excellent as you can see below. 

<figure markdown>
  ![Radio](/images/aprs-iphone.png)
  <figcaption>APRS path generated with aprs.fi App for iPhone</figcaption>
</figure>

#### DMR

The [DMR Cheat Sheet](https://pool.dl5rfk.org/DMR-Cheatsheet.pdf)<sup>(DE)</sup> [^2] was really helpful to get a grasp
on DMR,
Talk Groups, Time Slots, etc.

[^1]: I archived a [local copy](/assets/mirror/Pi-Star_RPi_V3.4.17_20-Jan-2019.zip) of Pi Star 3.4.17 along with 
a [md5 checksum](/assets/mirror/Pi-Star_RPi_V3.4.17_20-Jan-2019.zip.md5).
[^2]: I archived a [local copy](/assets/mirror/DMR-Cheatsheet.pdf) of the DMR Cheatsheet, courtesy of DL5RFK.
