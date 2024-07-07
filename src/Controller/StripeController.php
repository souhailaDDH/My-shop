<?php

namespace App\Controller;

use App\Repository\OrderRepository;
use App\Service\Cart;
use Doctrine\ORM\EntityManagerInterface;
use Stripe\Stripe;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Attribute\Route;

class StripeController extends AbstractController
{
    #[Route('/pay/success', name: 'app_stripe_success')]
    public function success(Cart $cart,SessionInterface $session): Response
    {
        $session->set('cart',[]);
        return $this->render('stripe/index.html.twig', [
            'controller_name' => 'StripeController',
        ]);
    }

    #[Route('/pay/cancel', name: 'app_stripe_cancel')]
    public function cancel(): Response
    {
        return $this->render('stripe/index.html.twig', [
            'controller_name' => 'StripeController',
        ]);
    }


    #[Route('/stripe/notify', name: 'app_stripe_notify')]
    public function stripeNotify(Request $request, OrderRepository $orderRepository, EntityManagerInterface $entityManager):Response
    {
        Stripe::setApiKey($_SERVER['STRIPE_SECRET']);

        $endpoint_secret = 'whsec_a603cefd33cbfca538489edad3030a9d7c7a75705585210aeb19ef8572732b52';

        $payload = $request->getContent();

        $sig_header = $request->headers->get('stripe-signature');

        $event = null;

        try {
            $event = \Stripe\Webhook::constructEvent(
              $payload, $sig_header,$endpoint_secret
            );
        }catch (\UnexpectedValueException $e){
            return new Response('payload invalide', 400);
        }catch (\Stripe\Exception\SignatureVerificationException $e){
            return new Response('Signature invalide');
        }

        switch ($event->type){
            case 'payment_intent.succeeded': /// contient l'obet payment_intent
                $paymentIntent = $event->data->object;

                $fileName = 'stripe-details-'.uniqid().'.txt';

                $orderId = $paymentIntent->metadata->orderId;

                $order = $orderRepository->find($orderId);

                $cartPrice = $order->getTotalPrice();
                $stripeTotalAmount = $paymentIntent->amount/100;

                if ($cartPrice==$stripeTotalAmount){
                    $order->setIsPaymentCompleted(1);
                    $entityManager->flush();
                }


                //file_put_contents($fileName,$orderId);
                break;
            case 'payment_method.attached': /// contient l'objet payment_method
                $paymentMethod = $event->data->object;
                break;
            default :
                break;
        }

        return new Response('evenement recu',200);
    }

}
