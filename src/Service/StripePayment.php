<?php

namespace App\Service;

use Stripe\Checkout\Session;
use Stripe\Stripe;

class StripePayment
{
    private $redirectUrl;

    public function __construct()
    {
        Stripe::setApiKey($_SERVER['STRIPE_SECRET']);
        Stripe::setApiVersion('2025-03-31.basil'); 
    }

    public function startPayment($cart, $shippingCost, $orderId)
    {
        $cartProducts = $cart['cart'];
        $lineItems = [];

        // ➕ Ajoute chaque produit du panier
        foreach ($cartProducts as $value) {
            $lineItems[] = [
                'quantity' => $value['quantity'],
                'price_data' => [
                    'currency' => 'EUR',
                    'product_data' => [
                        'name' => $value['product']->getName(),
                    ],
                    'unit_amount' => $value['product']->getPrice() * 100, // en centimes
                ],
            ];
        }


        $lineItems[] = [
            'quantity' => 1,
            'price_data' => [
                'currency' => 'EUR',
                'product_data' => [
                    'name' => 'Frais de livraison',
                ],
                'unit_amount' => $shippingCost, 
            ],
        ];

        // Création de la session Stripe
        $session = Session::create([
            'line_items' => $lineItems,
            'mode' => 'payment',
            'cancel_url' => 'http://51.159.28.149/pay/cancel',
            'success_url' => 'http://51.159.28.149/pay/success',
            'billing_address_collection' => 'required',
            'shipping_address_collection' => [
                'allowed_countries' => ['FR'],
            ],
            'payment_intent_data' => [
                'metadata' => [
                    'orderId' => $orderId,
                ],
            ],
        ]);

        $this->redirectUrl = $session->url;
    }

    public function getStripeRedirectUrl()
    {
        return $this->redirectUrl;
    }
}
