package thread;


import java.util.concurrent.Semaphore;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 3个线程交替打印A、B、C；打印10次
 *
 * @author Asta
 * @date 2023-03-29
 */
public class ThreadText2 {

    static class PrinterChar implements Runnable {
        final Semaphore curSemaphore;

        final Semaphore nextSemaphore;

        String str;

        boolean newLine;

        int count;

        public PrinterChar(Semaphore curSemaphore, Semaphore nextSemaphore, String str, boolean newLine, int count) {
            this.curSemaphore = curSemaphore;
            this.nextSemaphore = nextSemaphore;
            this.str = str;
            this.newLine = newLine;
            this.count = count;
        }


        @Override
        public void run() {

            for (int i = 1; i <= count; i++) {
                try {
                    curSemaphore.acquire();

                    if (newLine) {
                        System.out.println(str + "-" + i);
                    } else {
                        System.out.print(str);
                    }

                    nextSemaphore.release();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

            }
        }
    }

    // 0 : A; 1 : B; 2 : C;
    private static volatile int flag = 0;

    private static volatile int count = 30;

    private final Object lock = new Object();

    public static void main(String[] args) {
        Semaphore semaphore1 = new Semaphore(1);
        Semaphore semaphore2 = new Semaphore(0);
        Semaphore semaphore3 = new Semaphore(0);
        PrinterChar printerChar1 = new PrinterChar(semaphore1, semaphore2, "A", false, 20);
        PrinterChar printerChar2 = new PrinterChar(semaphore2, semaphore3, "B", false, 20);
        PrinterChar printerChar3 = new PrinterChar(semaphore3, semaphore1, "C", true, 20);
        Thread thread1 = new Thread(printerChar1);
        Thread thread2 = new Thread(printerChar2);
        Thread thread3 = new Thread(printerChar3);
        thread1.start();
        thread2.start();
        thread3.start();

        ReentrantLock lock = new ReentrantLock();
        Condition conditionA = lock.newCondition();
        Condition conditionB = lock.newCondition();
        Condition conditionC = lock.newCondition();

        PrinterRunnable a = new PrinterRunnable(10, lock, conditionA, conditionB, "A");
        PrinterRunnable b = new PrinterRunnable(10, lock, conditionB, conditionC, "B");
        PrinterRunnable c = new PrinterRunnable(10, lock, conditionC, conditionA, "C");

        Thread threadA = new Thread(a);
        Thread threadB = new Thread(b);
        Thread threadC = new Thread(c);

//        threadA.start();
//        threadB.start();
//        threadC.start();
    }

    static class PrinterRunnable implements Runnable {

        private int count;

        private final ReentrantLock lock;

        private final Condition curCondition;

        private final Condition nextCondition;

        private final String value;

        public PrinterRunnable(int count, ReentrantLock lock, Condition curCondition, Condition nextCondition, String value) {
            this.count = count;
            this.lock = lock;
            this.curCondition = curCondition;
            this.nextCondition = nextCondition;
            this.value = value;
        }

        @Override
        public void run() {
            lock.lock();

            try {
                while (count > 0) {

                    if ("C".equals(value)) {
                        System.out.println(value);
                    } else {
                        System.out.print(value);
                    }

                    nextCondition.signal();
                    if (count > 1) {
                        curCondition.await();
                    }
                    count--;
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                lock.unlock();
            }
        }
    }

    public static void text2() {
        ReentrantLock lock = new ReentrantLock();
        Condition conditionA = lock.newCondition();
        Condition conditionB = lock.newCondition();
        Condition conditionC = lock.newCondition();

        Thread threadA = new Thread(() -> {

            for (int i = 0; i < 10; i++) {
                lock.lock();
                System.out.print("A");

                try {
                    conditionB.signal();
                    if (i < 9) {
                        conditionA.await();
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } finally {
                    lock.unlock();
                }
            }
        });

        Thread threadB = new Thread(() -> {

            for (int i = 0; i < 10; i++) {
                lock.lock();

                System.out.print("B");
                try {
                    conditionC.signal();
                    if (i < 9) {
                        conditionB.await();
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } finally {
                    lock.unlock();
                }
            }
        });

        Thread threadC = new Thread(() -> {

            for (int i = 0; i < 10; i++) {
                lock.lock();

                System.out.println("C");
                try {
                    conditionA.signal();
                    if (i < 9) {
                        conditionC.await();
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } finally {
                    lock.unlock();
                }
            }
        });

        threadA.start();
        threadB.start();
        threadC.start();
    }

    public void text1() {
        Thread threadA = new Thread(() -> {
            while (count > 0) {
                synchronized (lock) {

                    if (flag == 0) {
                        System.out.print("A");

                        flag = 1;
                        count--;
                        lock.notifyAll();

                        try {
                            if (count > 1) {
                                lock.wait();
                            }
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }

        });

        Thread threadB = new Thread(() -> {
            while (count > 0) {
                synchronized (lock) {

                    if (flag == 1) {
                        System.out.print("B");

                        flag = 2;
                        count--;
                        lock.notifyAll();

                        try {
                            if (count > 1) {
                                lock.wait();
                            }
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        });

        Thread threadC = new Thread(() -> {
            while (count > 0) {
                synchronized (lock) {
                    if (flag == 2) {
                        System.out.println("C");

                        flag = 0;
                        count--;
                        lock.notifyAll();

                        try {
                            if (count > 1) {
                                lock.wait();
                            }
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        });

        threadA.start();
        threadB.start();
        threadC.start();
    }
}
