<?php
/**
 * @ file test_panopoly.profile
 *   Based heavily on the Panopoly install profile.
 */


/**
 * Implements hook_install_tasks()
 */
function test_panopoly_install_tasks(&$install_state) {

  $tasks = array();

  // Add the Panopoly app selection to the installation process
  require_once(drupal_get_path('module', 'apps') . '/apps.profile.inc');

  return $tasks;
}


/**
 * Implements hook_install_tasks_alter()
 */
function test_panopoly_install_tasks_alter(&$tasks, $install_state) {

  // Magically go one level deeper in solving years of dependency problems
  require_once(drupal_get_path('module', 'panopoly_core') . '/panopoly_core.profile.inc');
  $tasks['install_load_profile']['function'] = 'panopoly_core_install_load_profile';

}


/**
 * Implements hook_form_FORM_ID_alter()
 */
function test_panopoly_form_install_configure_form_alter(&$form, $form_state) {

  // Hide some messages from various modules that are just too chatty.
  drupal_get_messages('status');
  drupal_get_messages('warning');

  // Set reasonable defaults for site configuration form
  $form['site_information']['site_name']['#default_value'] = 'Test Install';
  $form['admin_account']['account']['name']['#default_value'] = 'admin';
  $form['server_settings']['site_default_country']['#default_value'] = 'DE';
  $form['server_settings']['date_default_timezone']['#default_value'] = 'Europe/Berlin'; // West coast, best coast

  // Define a default email address if we can guess a valid one
  $form['site_information']['site_mail']['#default_value'] = '';
  $form['admin_account']['account']['mail']['#default_value'] = '';
}


/**
 * Implements hook_form_FORM_ID_alter()
 */
function test_panopoly_form_apps_profile_apps_select_form_alter(&$form, $form_state) {

  // For some things there are no need
  $form['apps_message']['#access'] = FALSE;
  $form['apps_fieldset']['apps']['#title'] = NULL;

  // Improve style of apps selection form
  if (isset($form['apps_fieldset'])) {
    $manifest = apps_manifest(apps_servers('panopoly'));
    foreach ($manifest['apps'] as $name => $app) {
      if ($name != '#theme') {
        $form['apps_fieldset']['apps']['#options'][$name] = '<strong>' . $app['name'] . '</strong><p><div class="admin-options"><div class="form-item">' . theme('image', array('path' => $app['logo']['path'], 'height' => '32', 'width' => '32')) . '</div>' . $app['description'] . '</div></p>';
      }
    }
  }

  // Remove the demo content selection option since this is handled through the Panopoly demo module.
  $form['default_content_fieldset']['#access'] = FALSE;
}
