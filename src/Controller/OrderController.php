<?php

namespace App\Controller;

use App\Entity\City;
use App\Entity\Order;
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
        $cart = $session->get('cart',[]);
        $cartWhitData = [];
        foreach ($cart as $id=>$quantity){
            $cartWhitData[] = [
                'product'=>$productRepository->find($id),
                'quantity'=>$quantity
            ];
        }
        $total = array_sum(array_map(function ($item){
            return $item['product']->getPrice() * $item['quantity'];
        },$cartWhitData));

       $order = new Order();
       $form = $this->createForm(OrderType::class, $order);
       $form->handleRequest($request);

       if ($form->isSubmitted() && $form->isValid()){

           if ($order->isPayOnDelivery()){

           }

       }

        return $this->render('order/index.html.twig', [
            'form'=>$form->createView(),
            'total'=>$total
        ]);
    }

    #[Route('/city/{id}/shipping/cost', name: 'app_city_shipping_cost')]
    public function cityShippingCost(City $city):Response
    {
        $cityShippingPrice = $city->getShippingCost();

        return new Response(json_encode(['status'=>200, "message"=>'on', 'content'=>$cityShippingPrice]));
    }
}
