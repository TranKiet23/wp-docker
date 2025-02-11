<?php
/**
 * Flatsome_Envato class.
 *
 * @package Flatsome
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

/**
 * The Flatsome Envato.
 */
final class Flatsome_Envato {

	/**
	 * The single class instance.
	 *
	 * @var object
	 */
	private static $instance = null;

	/**
	 * The registration instance.
	 *
	 * @var Flatsome_Base_Registration
	 */
	public $registration;

	/**
	 * The admin instance.
	 *
	 * @var Flatsome_Envato_Admin
	 */
	public $admin;

	/**
	 * Setup instance properties.
	 */
	private function __construct() {
		$api = new UxThemes_API();

		if ( get_option( flatsome_theme_key() . '_wup_purchase_code' ) ) {
			$this->registration = new Flatsome_WUpdates_Registration( $api );
		} else {
			$this->registration = new Flatsome_Registration( $api );
		}

		if ( is_admin() ) {
			$this->admin = new Flatsome_Envato_Admin( $this->registration );
		}
	}

	/**
	 * Checks whether this site is registered or not.
	 *
	 * @return boolean
	 */
	public function is_registered() {
		return true;
	}

	/**
	 * Checks whether the purchase code has been verified or not.
	 *
	 * @return boolean
	 */
	public function is_verified() {
		return $this->registration->is_verified();
	}

	/**
	 * Main Flatsome_Envato instance
	 *
	 * @return Flatsome_Envato
	 */
	public static function get_instance() {
		if ( is_null( self::$instance ) ) {
			self::$instance = new self();
		}
		return self::$instance;
	}
}
