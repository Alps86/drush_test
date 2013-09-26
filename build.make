;
; WinACC Drupal 7 platform makefile
; 
; * Based on Omega8cc's patched Drupal 7 version
; * Includes Panopoly for editorial goodness
; * Radix for Bootstrap foundation and responsive panels goodness
; * i-JK features for pages, news, events and more.
core = 7.x
api = 2

;
; WinACC profile
;
projects[test_panopoly][type] = profile
projects[test_panopoly][download][type] = "git"
projects[test_panopoly][download][url] = "https://github.com/Alps86/drush_test"
projects[test_panopoly][download][branch] = "master"

;
; Drupal Core
;
projects[drupal][version] = 7.22

;
; The Panopoly Foundation

projects[panopoly_core][version] = 1.0-rc5
projects[panopoly_core][subdir] = contrib/panopoly
projects[panopoly_core][patch][2087414] = https://drupal.org/files/issue-2087414.patch

projects[panopoly_images][version] = 1.0-rc5
projects[panopoly_images][subdir] = contrib/panopoly

projects[panopoly_theme][version] = 1.0-rc5
projects[panopoly_theme][subdir] = contrib/panopoly

projects[panopoly_magic][version] = 1.0-rc5
projects[panopoly_magic][subdir] = contrib/panopoly

projects[panopoly_widgets][version] = 1.0-rc5
projects[panopoly_widgets][subdir] = contrib/panopoly

projects[panopoly_admin][version] = 1.0-rc5
projects[panopoly_admin][subdir] = contrib/panopoly

projects[panopoly_users][version] = 1.0-rc5
projects[panopoly_users][subdir] = contrib/panopoly

; The Panopoly Toolset

projects[panopoly_pages][version] = 1.0-rc5
projects[panopoly_pages][subdir] = contrib/panopoly

projects[panopoly_wysiwyg][version] = 1.0-rc5
projects[panopoly_wysiwyg][subdir] = contrib/panopoly

projects[panopoly_search][version] = 1.0-rc5
projects[panopoly_search][subdir] = contrib/panopoly
