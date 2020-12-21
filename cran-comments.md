## Update (v 0.3)

* Minor bus fixes.
* `scottish_postcode_lookup` added
* New fields (codes) added
* README updated (hex logo and downloads)
* New tests

## Test environments
* local ubuntu 20.04, R 4.0.3
* win-builder (devel and release). No errors, warnings or notes
* R-hub using `rhub::check_for_cran()`. No errors, warnings or notes
* R-hub tested on:
- Windows Server 2008 R2 SP1, R-devel, 32/64 bit,
- Ubuntu Linux 16.04 LTS, R-release, GCC
- Fedora Linux, R-devel, clang, gfortran

## R CMD check results

0 errors | 0 warnings | 0 notes

## Resubmission

This is a resubmission. In this version I have:

* Wrapped Postcodes.io in DESCRIPTION Title in quotation marks

* Shortened the title

* Replaced `dontrun` with `donttest` in examples

## Test environments
* local ubuntu 16.04, R 3.6.1
* ubuntu 14.04 (on travis-ci), R 3.6.0
* win-builder (devel and release)
* R-hub using `rhub::check_for_cran()`

## R CMD check results

0 errors | 0 warnings | 0 notes

## `rhub::check_for_cran()` results

* Error

Installation failed with PREPERROR on R-hub's Fedora Linux, R-devel, clang, gfortran (and other platforms), on account of failures to install required dependencies. This seems to be an issue outside of my control.

* Note

Windows Server 2008 R2 SP1, R-devel, 32/64 bit and Ubuntu Linux 16.04 LTS, R-release, GCC return a note:

The note regarded potential mis-spelled words. These words were spelled correctly.

Possibly mis-spelled words in DESCRIPTION:
  geocoding (16:22, 18:20)
  io (3:37)

* This is a new release.
