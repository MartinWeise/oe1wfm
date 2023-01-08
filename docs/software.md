---
hide:

- navigation

---

## System Setup

I use a spare HP ZBook 14 G1 (Intel Core i7, 8GB RAM) with Windows 7 SP1 for compatibility reasons with all software and
drivers for connecting the Hytera PD-785g. Although I saw some operators that managed to set up the Hytera CPS at newer
Windows 10 systems, I did not manage to do it and had to revert to Windows 7.

## Code Plug

After playing around with the Hytera PD-785g for quite a while, I was able to stitch together a decent code plug for
OE1 (Vienna) for both *analog* and *digital* stations after viewing the
excellent [Example Programming](https://dmraustria.at/programmierbeispiel-hytera-pd75/)<sup>(DE)</sup> [^1].
I used [RepeaterBook](https://www.repeaterbook.com/row_repeaters/prox.php) to find all stations in Vienna with
the parameters:

* Location: Vienna
* Radius: 10 km
* Band: 70cm
* Mode: FM, D-Star, DMR
* Operational Status: Confirmed 'on-air' only

This yielded
in [9 repeaters](https://www.repeaterbook.com/row_repeaters/prox_result.php?city=Vienna&lat=&long=&distance=10&Dunit=k&band1=4&band2=&freq=&call=&features%5B%5D=FM&features%5B%5D=DStar&features%5B%5D=DMR&status_id=1&use=%25&order=distance_calc%2C+state_id+ASC) (
4 *analog*, 5 *digital*) which I included in my sample code plug below.

| Rx        | Offset   | Tx         | Tone/CTCSS          | Call                                                                                  | Location            | Mode       |
|-----------|----------|------------|---------------------|---------------------------------------------------------------------------------------|---------------------|------------|
| 438.52500 | -7.6 MHz | 430.925000 |                     | [OE1XDS](https://www.repeaterbook.com/row_repeaters/details.php?state_id=AT&ID=309)   | Wien, AKH           | D-Star     |
| 438.40000 | -7.6 MHz | 430.800000 | CC1                 | [OE1XKW](https://www.repeaterbook.com/row_repeaters/details.php?state_id=AT&ID=11153) | Wien, Mariahilf     | DMR Fusion |
| 438.33750 | -7.6 MHz | 430.737500 | CC1                 | [OE1XDT](https://www.repeaterbook.com/row_repeaters/details.php?state_id=AT&ID=8454)  | Wien, Donauturm     | DMR        |
| 438.82500 | -7.6 MHz | 431.225000 |                     | [OE1XQU](https://www.repeaterbook.com/row_repeaters/details.php?state_id=AT&ID=338)   | Wien, Wienerberg    | D-Star     |
| 438.65000 | -7.6 MHz | 431.050000 | **162.2 Tx**        | [OE1XFW](https://www.repeaterbook.com/row_repeaters/details.php?state_id=AT&ID=319)   | Wien, Laaerberg     | FM         |
| 438.45000 | -7.6 MHz | 430.850000 | CC1                 | [OE1XUR](https://www.repeaterbook.com/row_repeaters/details.php?state_id=AT&ID=12214) | Wien, Laaerberg     | DMR        |
| 439.00000 | -7.6 MHz | 431.400000 | 162.2 Rx / 162.2 Tx | [OE1XFU](https://www.repeaterbook.com/row_repeaters/details.php?state_id=AT&ID=363)   | Wien, Satzberg      | FM         |
| 438.95000 | -7.6 MHz | 431.350000 | 162.2 Rx            | [OE1XUU](https://www.repeaterbook.com/row_repeaters/details.php?state_id=AT&ID=356)   | Wien, Kahlenberg    | FM         |
| 438.47500 | -7.6 MHz | 430.875000 | 162.2 Rx / 162.2 Tx | [OE1XAT](https://www.repeaterbook.com/row_repeaters/details.php?state_id=AT&ID=7147)  | Wien, Hermannskogel | FM         |

Note that some information in **bold** is not available from RepeaterBook but was experimentally tested and obtained.
For example: the relais [OE1XFW](https://www.repeaterbook.com/row_repeaters/details.php?state_id=AT&ID=319)
does not open with the standard Vienna CTCSS 67.0 KHz, but the Lower Austria CTCSS 162.2 kHz. I submitted an update
request.

There are three zones: DMR+ AT1, Analog AT1, D-Star AT1 and a *Manual* zone for manual programming while on the go.
Download the code plug for firmware A9.00.04.805.iM.

<center>

[Code Plug <sup>A9.00.04.805.iM</sup>](assets/PD785g_A9.00.04.805.iM.rcdx){ .md-button .md-button--primary }

</center>

## Hytera Software

First, be sure to set your Radio Alias in *Common* > *Setting* > *Radio Alias* to your callsign.

<figure markdown>
  ![CPS Version](/images/cps_general.png)
  <figcaption>Setting the callsign in Hytera CPS</figcaption>
</figure>

Next, set your Radio ID (for digital) in *Conventional* > *Digital Common* > *Basic* > *Radio ID* to your assigned radio
id from [RadioID](https://radioid.net/). Otherwise you will not be able to connect to the digital repeaters!

<figure markdown>
  ![CPS Version](/images/cps_radioid.png)
  <figcaption>Setting the Radio ID in Hytera CPS</figcaption>
</figure>

Be sure that your firmware matches the firmware of the code plug, otherwise it will not write to the radio!

<figure markdown>
  ![CPS Version](/images/cps_version.png)
  <figcaption>Hytera CPS version dialog</figcaption>
</figure>

[^1]: In case the link is dead, I archived a [local copy](/assets/mirror/Programmierbeispiel_Hytera_PD785-DMR_Österreich.pdf), courtesy of OE8VIK.