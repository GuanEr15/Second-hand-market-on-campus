package thread;

import java.util.concurrent.Semaphore;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 三个线程轮番打印自然数 打印到100
 *
 * @author Asta
 * @date 2023-03-29
 */
public class ThreadText3 {

    private static volatile int i = 0;

    public static void main(String[] args) throws InterruptedException {
//        text1();
//        text2();

//        ReentrantLock lock = new ReentrantLock();
//        Condition condition1 = lock.newCondition();
//        Condition condition2 = lock.newCondition();
//        Condition condition3 = lock.newCondition();
//        PrinterNumber printerNumber1 = new PrinterNumber(lock, condition1, condition2, 0);
//        PrinterNumber printerNumber2 = new PrinterNumber(lock, condition2, condition3, 1);
//        PrinterNumber printerNumber3 = new PrinterNumber(lock, condition3, condition1, 2);
//
//        Thread thread1 = new Thread(printerNumber1, "Thread1");
//        Thread thread2 = new Thread(printerNumber2, "Thread2");
//        Thread thread3 = new Thread(printerNumber3, "Thread3");
//
//        thread1.start();
//        thread2.start();
//        thread3.start();

        Semaphore semaphore1 = new Semaphore(1);
        Semaphore semaphore2 = new Semaphore(0);
        Semaphore semaphore3 = new Semaphore(0);

        PrinterNumber1 printerNumber1 = new PrinterNumber1(semaphore1, semaphore2, 0);
        PrinterNumber1 printerNumber2 = new PrinterNumber1(semaphore2, semaphore3, 1);
        PrinterNumber1 printerNumber3 = new PrinterNumber1(semaphore3, semaphore1, 2);

        Thread thread1 = new Thread(printerNumber1, "Thread1");
        Thread thread2 = new Thread(printerNumber2, "Thread2");
        Thread thread3 = new Thread(printerNumber3, "Thread3");

        thread1.start();
        thread2.start();
        thread3.start();
    }

    static class PrinterNumber1 implements Runnable {

        final Semaphore curSemaphore;

        final Semaphore nextSemaphore;

        int flag;

        public PrinterNumber1(Semaphore curSemaphore, Semaphore nextSemaphore, int flag) {
            this.curSemaphore = curSemaphore;
            this.nextSemaphore = nextSemaphore;
            this.flag = flag;
        }

        @Override
        public void run() {

            while (i <= 100) {
                boolean b = curSemaphore.tryAcquire(1);
                if (b && i <= 100 && i % 3 == flag) {
                    System.out.println(Thread.currentThread().getName() + ":" + i);
                    i++;
                    nextSemaphore.release();
                }
            }
        }
    }

    static class PrinterNumber implements Runnable {
        final ReentrantLock lock;

        final Condition curCondition;

        final Condition nextCondition;

        int flag;

        public PrinterNumber(ReentrantLock lock, Condition curCondition, Condition nextCondition, int flag) {
            this.lock = lock;
            this.curCondition = curCondition;
            this.nextCondition = nextCondition;
            this.flag = flag;
        }

        @Override
        public void run() {
            while (i <= 100) {
                lock.lock();

                if (i <= 100 && i % 3 == flag) {
                    System.out.println(Thread.currentThread().getName() + ":" + i);
                    i++;
                }

                try {
                    nextCondition.signal();
                    if (i < 100) {
                        curCondition.await();
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } finally {
                    lock.unlock();
                }

            }
        }
    }

    public static void text2() {

        ReentrantLock lock = new ReentrantLock();
        Condition condition1 = lock.newCondition();
        Condition condition2 = lock.newCondition();
        Condition condition3 = lock.newCondition();

        Thread thread1 = new Thread(() -> {

            while (i <= 100) {
                lock.lock();

                if (i <= 100 && i % 3 == 0) {
                    System.out.println(Thread.currentThread().getName() + ":" + i);
                    i++;
                }

                try {
                    condition2.signal();
                    if (i < 100) {
                        condition1.await();
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } finally {
                    lock.unlock();
                }
            }

        }, "Thread1");

        Thread thread2 = new Thread(() -> {
            while (i <= 100) {
                lock.lock();

                if (i <= 100 && i % 3 == 1) {
                    System.out.println(Thread.currentThread().getName() + ":" + i);
                    i++;
                }

                try {
                    condition3.signal();
                    if (i < 100) {
                        condition2.await();
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } finally {
                    lock.unlock();
                }
            }

        }, "Thread2");

        Thread thread3 = new Thread(() -> {

            while (i <= 100) {
                lock.lock();

                if (i <= 100 && i % 3 == 2) {
                    System.out.println(Thread.currentThread().getName() + ":" + i);
                    i++;
                }

                try {
                    condition1.signal();
                    if (i < 100) {
                        condition3.await();
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } finally {
                    lock.unlock();
                }
            }
        }, "Thread3");

        thread1.start();
        thread2.start();
        thread3.start();
    }

    public static void text1() {
        final Object lock = new Object();

        Thread thread1 = new Thread(() -> {
            while (i <= 100) {
                synchronized (lock) {
                    while (i <= 100 && i % 3 == 0) {
                        System.out.println(Thread.currentThread().getName() + "：" + i);
                        i++;

                        lock.notifyAll();
                        try {
                            if (i < 100) {
                                lock.wait();
                            }
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }, "thread1");

        Thread thread2 = new Thread(() -> {
            while (i <= 100) {

                synchronized (lock) {
                    while (i <= 100 && i % 3 == 1) {
                        System.out.println(Thread.currentThread().getName() + "：" + i);
                        i++;

                        lock.notifyAll();
                        try {
                            if (i < 100) {
                                lock.wait();
                            }
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }

        }, "thread2");

        Thread thread3 = new Thread(() -> {
            while (i <= 100) {

                synchronized (lock) {
                    while (i <= 100 && i % 3 == 2) {
                        System.out.println(Thread.currentThread().getName() + "：" + i);
                        i++;

                        lock.notifyAll();
                        try {
                            if (i < 100) {
                                lock.wait();
                            }
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }

        }, "thread3");

        thread1.start();
        thread2.start();
        thread3.start();
    }
}
