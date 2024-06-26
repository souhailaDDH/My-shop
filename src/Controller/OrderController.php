<?php

namespace App\Controller;

use App\Entity\City;
use App\Entity\Order;
use App\Entity\OrderProducts;
use App\Form\OrderType;
use App\Repository\ProductRepository;
use App\Service\Cart;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Attribute\Route;

class OrderController extends AbstractController
{
    #[Route('/order', name: 'app_order')]
    public function index(Request $request,
       SessionInterface $session,
       ProductRepository $productRepository,
       EntityManagerInterface $entityManager,
       Cart $cart,
    ): Response
    {

       $data = $cart->getCart($session);

       $order = new Order();
       $form = $this->createForm(OrderType::class, $order);
       $form->handleRequest($request);

       if ($form->isSubmitted() && $form->isValid()){

           if ($order->isPayOnDelivery()){
             if (!empty($data['total'])){
                   $order->setTotalPrice($data['total']);
                   $order->setCreatedAt(new \DateTimeImmutable());
                   $entityManager->persist($order);
                   $entityManager->flush();

                   foreach ($data['cart'] as $value){
                       $orderProduct = new OrderProducts();
                       $orderProduct->setOrder($order);
                       $orderProduct->setProduct($value['product']);
                       $orderProduct->setQte($value['quantity']);
                       $entityManager->persist($orderProduct);
                       $entityManager->flush();
                   }
             }

             $session->set('cart',[]);
             return $this->redirectToRoute('order_ok_message');

           }

       }

        return $this->render('order/index.html.twig', [
            'form'=>$form->createView(),
            'total'=>$data['total']
        ]);
    }

    #[Route("/order-ok-message", name: 'order_ok_message')]
    public function orderMessage():Response
    {
        return $this->render('order/order_message.twig');
    }

    #[Route('/city/{id}/shipping/cost', name: 'app_city_shipping_cost')]
    public function cityShippingCost(City $city):Response
    {
        $cityShippingPrice = $city->getShippingCost();

        return new Response(json_encode(['status'=>200, "message"=>'on', 'content'=>$cityShippingPrice]));
    }
}
