package thread;

import java.util.concurrent.Semaphore;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 子线程先循环10次，主线程在循环20次，再子线程循环10次，主线程循环20次，如此循环50次
 *
 * @author Asta
 * @date 2023-03-28
 */
public class ThreadText1 {

    static class PrinterCount implements Runnable {

        final Semaphore curSemaphore;

        final Semaphore nextSemaphore;

        int count;

        public PrinterCount(Semaphore curSemaphore, Semaphore nextSemaphore, int count) {
            this.curSemaphore = curSemaphore;
            this.nextSemaphore = nextSemaphore;
            this.count = count;
        }


        @Override
        public void run() {
            for (int i = 1; i <= 50; i++) {
                try {
                    curSemaphore.acquire(1);
                    for (int j = 1; j <= count; j++) {
                        System.out.println(Thread.currentThread().getName() + ":" + j);
                    }

                    nextSemaphore.release();
                    System.out.println("第 " + i + " 次");
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }

            }
        }
    }

    public static void main(String[] args) throws InterruptedException {
        Semaphore semaphore1 = new Semaphore(1);
        Semaphore semaphore2 = new Semaphore(0);
        PrinterCount printerCount1 = new PrinterCount(semaphore1, semaphore2, 10);
        PrinterCount printerCount2 = new PrinterCount(semaphore2, semaphore1, 20);
        Thread thread11 = new Thread(printerCount1, "child");
        Thread thread12 = new Thread(printerCount2, "master");
        thread11.start();
        thread12.start();

        final ReentrantLock lock = new ReentrantLock();

        Condition condition1 = lock.newCondition();
        Condition condition2 = lock.newCondition();

        Thread thread1 = new Thread(() -> {
            lock.lock();

            try {
                for (int i = 1; i < 51; i++) {

                    for (int j = 1; j < 21; j++) {
                        System.out.println("主线程：" + j);
                    }

                    System.out.println("第" + i + "次");
                    condition2.signal();

                    // 最后一次循环就不需要等待了
                    if (i < 50) {
                        condition1.await();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                lock.unlock();
            }
        });

        Thread thread2 = new Thread(() -> {
            lock.lock();

            try {
                for (int i = 1; i < 51; i++) {
                    for (int j = 1; j < 11; j++) {
                        System.out.println("子线程：" + j);
                    }

                    condition1.signal();

                    // 最后一次循环就不需要等待了
                    if (i < 50) {
                        condition2.await();
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                lock.unlock();
            }
        });

//        thread2.start();
//        thread1.start();

        ReentrantLock reentrantLock = new ReentrantLock();
        Condition masterCondition = reentrantLock.newCondition();
        Condition childCondition = reentrantLock.newCondition();
        PrinterRunnable master = new PrinterRunnable(reentrantLock, masterCondition, childCondition, 20, "master");
        PrinterRunnable child = new PrinterRunnable(reentrantLock, childCondition, masterCondition, 10, "child");

        Thread childThread = new Thread(child);
        Thread masterThread = new Thread(master);
//        childThread.start();
//        masterThread.start();
    }


    static class PrinterRunnable implements Runnable {

        private final ReentrantLock lock;

        private final Condition curCondition;

        private final Condition nextCondition;

        private final int count;

        private final String name;

        public PrinterRunnable(ReentrantLock lock, Condition curCondition, Condition nextCondition, int count, String name) {
            this.lock = lock;
            this.curCondition = curCondition;
            this.nextCondition = nextCondition;
            this.count = count;
            this.name = name;
        }

        @Override
        public void run() {
            lock.lock();
            try {

                for (int i = 1; i < 51; i++) {
                    for (int j = 1; j <= count; j++) {
                        System.out.println("第" + i + "次---" + name + j);
                    }

                    nextCondition.signal();
                    if (i < 50) {
                        curCondition.await();
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                lock.unlock();
            }
        }
    }
}
