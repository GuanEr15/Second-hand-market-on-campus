package thread;

import java.util.concurrent.Semaphore;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 自己编写代码,实现生产者-消费者模型功能.内容自由发挥,只需要表达思想.
 *
 * @author Asta
 * @date 2023-03-30
 */
public class ThreadText4 {

    public static void main(String[] args) {
//        Product product = new Product();
//        Producer producer = new Producer(product);
//        Consumer consumer = new Consumer(product);
//        Thread thread1 = new Thread(producer, "producer");
//        Thread thread2 = new Thread(consumer, "consumer");
//
//        thread1.start();
//        thread2.start();

//        ReentrantLock lock = new ReentrantLock();
//        Condition condition1 = lock.newCondition();
//        Condition condition2 = lock.newCondition();
//        Product1 product = new Product1();
//        Producer1 producer = new Producer1(product, lock, condition1, condition2);
//        Consumer1 consumer = new Consumer1(product, lock, condition2, condition1);
//        Thread thread1 = new Thread(producer, "producer");
//        Thread thread2 = new Thread(consumer, "consumer");
//
//        thread1.start();
//        thread2.start();


        Semaphore semaphore1 = new Semaphore(1);
        Semaphore semaphore2 = new Semaphore(0);
        Product1 product = new Product1();
        Producer2 producer = new Producer2(product, semaphore1, semaphore2);
        Consumer2 consumer = new Consumer2(product, semaphore2, semaphore1);
        Thread thread1 = new Thread(producer, "producer");
        Thread thread2 = new Thread(consumer, "consumer");

        thread1.start();
        thread2.start();
    }

    static class Producer implements Runnable {

        final Product product;

        public Producer(Product product) {
            this.product = product;
        }

        @Override
        public void run() {
            while (true) {
                synchronized (product) {
                    product.addProduct();
                }
            }
        }
    }

    static class Consumer implements Runnable {

        final Product product;

        public Consumer(Product product) {
            this.product = product;
        }

        @Override
        public void run() {
            while (true) {
                synchronized (product) {
                    product.getProduct();
                }
            }
        }
    }

    static class Product {

        int count;

        public void addProduct() {
            if (count == 20) {
                try {
                    Thread.sleep(1000);
                    notify();
                    wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            } else {
                count++;
                System.out.println("生产者生产了第" + count + "产品");
            }
        }

        public void getProduct() {
            if (count == 0) {
                try {
                    Thread.sleep(1000);
                    notify();
                    wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            } else {
                System.out.println("消费者消费了第" + count + "产品");
                count--;
            }
        }
    }

    static class Producer1 implements Runnable {

        final Product1 product;

        final ReentrantLock lock;

        final Condition curCondition;

        final Condition nextCondition;

        public Producer1(Product1 product, ReentrantLock lock, Condition curCondition, Condition nextCondition) {
            this.product = product;
            this.lock = lock;
            this.curCondition = curCondition;
            this.nextCondition = nextCondition;
        }

        @Override
        public void run() {
            while (true) {
                lock.lock();
                if (product.count >= 20) {

                    try {
                        Thread.sleep(100);
                        nextCondition.signal();
                        curCondition.await();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    } finally {
                        lock.unlock();
                    }

                } else {
                    product.addProduct();
                }
            }
        }
    }

    static class Consumer1 implements Runnable {

        final Product1 product;

        final ReentrantLock lock;

        final Condition curCondition;

        final Condition nextCondition;

        public Consumer1(Product1 product, ReentrantLock lock, Condition curCondition, Condition nextCondition) {
            this.product = product;
            this.lock = lock;
            this.curCondition = curCondition;
            this.nextCondition = nextCondition;
        }

        @Override
        public void run() {
            while (true) {
                lock.lock();
                if (product.count == 0) {
                    try {
                        Thread.sleep(1000);
                        nextCondition.signal();
                        curCondition.await();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    } finally {
                        lock.unlock();
                    }
                } else {
                    product.getProduct();
                }
            }
        }
    }

    static class Product1 {

        int count;

        public void addProduct() {
            count++;
            System.out.println("生产者生产了第" + count + "产品");
        }

        public void getProduct() {
            System.out.println("消费者消费了第" + count + "产品");
            count--;
        }
    }


    static class Producer2 implements Runnable {

        final Product1 product;

        final Semaphore curSemaphore;

        final Semaphore nextSemaphore;

        public Producer2(Product1 product, Semaphore curSemaphore, Semaphore nextSemaphore) {
            this.product = product;
            this.curSemaphore = curSemaphore;
            this.nextSemaphore = nextSemaphore;
        }

        @Override
        public void run() {
            boolean b = curSemaphore.tryAcquire();
            while (true) {

                if (b) {
                    if (product.count >= 20) {
                        try {
                            Thread.sleep(100);
                            nextSemaphore.release();
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }

                    } else {
                        product.addProduct();
                    }
                }

            }
        }
    }

    static class Consumer2 implements Runnable {

        final Product1 product;

        final Semaphore curSemaphore;

        final Semaphore nextSemaphore;

        public Consumer2(Product1 product, Semaphore curSemaphore, Semaphore nextSemaphore) {
            this.product = product;
            this.curSemaphore = curSemaphore;
            this.nextSemaphore = nextSemaphore;
        }

        @Override
        public void run() {
            while (true) {
                boolean b = curSemaphore.tryAcquire();

                if (b) {
                    if (product.count == 0) {
                        try {
                            Thread.sleep(1000);
                            nextSemaphore.release();
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    } else {
                        product.getProduct();
                    }
                }
            }
        }
    }

}
