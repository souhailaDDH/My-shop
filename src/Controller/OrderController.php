<?php

namespace App\Controller;

use App\Entity\City;
use App\Entity\Order;
use App\Entity\OrderProducts;
use App\Form\OrderType;
use App\Repository\OrderRepository;
use App\Repository\ProductRepository;
use App\Service\Cart;
use App\Service\StripePayment;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Symfony\Component\Routing\Attribute\Route;

class OrderController extends AbstractController
{
    public function __construct(private MailerInterface $mailer){}

    /**
     * @throws TransportExceptionInterface
     */
    #[Route('/order', name: 'app_order')]
    public function index(Request $request,
       SessionInterface $session,
       ProductRepository $productRepository,
       EntityManagerInterface $entityManager,
       Cart $cart,
       OrderRepository $orderRepository,
    ): Response
    {

       $data = $cart->getCart($session);

       $order = new Order();
       $form = $this->createForm(OrderType::class, $order);
       $form->handleRequest($request);

       if ($form->isSubmitted() && $form->isValid()){

             if (!empty($data['total'])){
                   $totalPrice = $data['total'] ;
                   $order->setTotalPrice($totalPrice);
                   $order->setCreatedAt(new \DateTimeImmutable());
                   $order->setIsPaymentCompleted(0);
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

                 //if ($order->isPayOnDelivery()){
                     $session->set('cart',[]);

                     $html = $this->renderView('mail/orderConfirm.html.twig',[
                         'order'=>$order
                     ]);

                     $email = (new  Email())
                         ->from('myShop@gmail.com')
                         ->to($order->getEmail())
                         ->subject('Confirmation de reception de la commande')
                         ->html($html);

                     $this->mailer->send($email);

                     //return $this->redirectToRoute('order_ok_message');

                 //}

                 $payment = new StripePayment();

                 //$shippingCost = $order->getCity()->getShippingCost();

                 $payment->startPayment($data,0,$order->getId());

                 $stripeRedirectUrl = $payment->getStripeRedirectUrl();
        //dump($stripeRedirectUrl);die;
                 return $this->redirect($stripeRedirectUrl);

                }



           }

        return $this->render('order/index.html.twig', [
            'form'=>$form->createView(),
            'total'=>$data['total'],
            'totalPrice'=>$data['total']
        ]);
    }

    #[Route('/editor/order/{type}/', name: 'app_orders_show')]
    public function getAllOrder($type,OrderRepository $orderRepository, Request $request, PaginatorInterface $paginator):Response
    {
        if ($type == 'is-completed'){
            $data = $orderRepository->findBy(['isCompleted'=>1],['id'=>'DESC']);
        }elseif ($type == 'pay-on-stripe-not-delivered'){
            $data = $orderRepository->findBy(['isCompleted'=>null,'isPaymentCompleted'=>1],['id'=>'DESC']);
        }elseif ($type == 'pay-on-stripe-is-delivered'){
            $data = $orderRepository->findBy(['isCompleted'=>1,'isPaymentCompleted'=>1],['id'=>'DESC']);
        }

        //dd($order);
        $order = $paginator->paginate(
            $data,
            $request->query->getInt('page', 1),
            10
        );
        return $this->render('order/order.html.twig',[
            "orders"=>$order
        ]);
    }


    #[Route('/editor/order/{id}/is-completed/update', name: 'app_orders_is_completed_update')]
    public function isCompletedUpdate($id,OrderRepository $orderRepository, EntityManagerInterface $entityManager, Request $request):Response
    {
       $order = $orderRepository->find($id) ;
       $order->setIsCompleted(true);
       $entityManager->flush();
       $this->addFlash('success','modification effectuée');
       return $this->redirect($request->headers->get('referer'));
    }

    #[Route('/editor/order/{id}/remove', name: 'app_orders_remove')]
    public function removeOrder(Order $order, EntityManagerInterface $entityManager):Response
    {
        $entityManager->remove($order);
        $entityManager->flush();
        $this->addFlash('danger','Votre commande a été supprimée');
        return $this->redirectToRoute('app_orders_show');
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