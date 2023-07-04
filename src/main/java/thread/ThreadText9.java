package thread;

import java.util.concurrent.locks.ReentrantLock;

/**
 * 多线程转账
 *
 * @author Asta
 * @date 2023-06-02
 */
public class ThreadText9 {

    public static void main(String[] args) throws InterruptedException {
//        Amount amountA = new Amount(1000);
//        Amount amountB = new Amount(1000);
//
//        Thread thread1 = new Thread(() -> {
//            for (int i = 0; i < 199; i++) {
//                amountA.transfer(amountB, 5);
//            }
//        }, "thread1");
//
//        Thread thread2 = new Thread(() -> {
//            for (int i = 0; i < 199; i++) {
//                amountB.transfer(amountA, 5);
//            }
//        }, "thread2");
//
//        thread1.start();
//        thread2.start();
//
//        thread1.join();
//        thread2.join();
//
//        System.out.println("amount1 balance: " + amountA.balance);
//        System.out.println("amount2 balance: " + amountB.balance);


//        Amount1 amountA = new Amount1(1000, new ReentrantLock());
//        Amount1 amountB = new Amount1(1000, new ReentrantLock());
//
//        Thread thread1 = new Thread(() -> {
//            for (int i = 0; i < 199; i++) {
//                amountA.transfer(amountB, 5);
//            }
//        }, "thread1");
//
//        Thread thread2 = new Thread(() -> {
//            for (int i = 0; i < 199; i++) {
//                amountB.transfer(amountA, 5);
//            }
//        }, "thread2");
//
//        thread1.start();
//        thread2.start();
//
//        thread1.join();
//        thread2.join();
//
//        System.out.println("amount1 balance: " + amountA.balance);
//        System.out.println("amount2 balance: " + amountB.balance);


        Amount2 amountA = new Amount2(1000);
        Amount2 amountB = new Amount2(1000);

        Thread thread1 = new Thread(() -> {
            for (int i = 0; i < 199; i++) {
                amountA.transfer(amountB, 5);
            }
        }, "thread1");

        Thread thread2 = new Thread(() -> {
            for (int i = 0; i < 199; i++) {
                amountB.transfer(amountA, 5);
            }
        }, "thread2");

        thread1.start();
        thread2.start();

        thread1.join();
        thread2.join();

        System.out.println("amount1 balance: " + amountA.balance);
        System.out.println("amount2 balance: " + amountB.balance);
    }

    static class Amount {

        private Long balance;

        public Amount(long balance) {
            this.balance = balance;
        }

        public void transfer(Amount target, int remove) {
            synchronized (Amount.class) {
                if (this.balance > remove) {
                    balance -= remove;
                    target.balance += remove;
                }
            }
        }
    }

    static class Amount1 {

        private Long balance;

        private final ReentrantLock lock;

        public Amount1(long balance, ReentrantLock lock) {
            this.balance = balance;
            this.lock = lock;
        }

        public void transfer(Amount1 target, int remove) {
            if (remove(remove)) {
                target.add(remove);
            }
        }

        public void add(long add) {
            lock.lock();

            balance += add;

            lock.unlock();
        }

        public boolean remove(long remove) {
            lock.lock();
            if (remove > balance) {
                lock.unlock();
                return false;
            }

            balance -= remove;
            lock.unlock();
            return true;
        }
    }

    static class Amount2 {

        private Long balance;

        public Amount2(long balance) {
            this.balance = balance;
        }

        public void transfer(Amount2 target, int remove) {
            if (remove(remove)) {
                target.add(remove);
            }
        }

        public synchronized void add(long add) {
            balance += add;
        }

        public synchronized boolean remove(long remove) {
            if (remove > balance) {
                return false;
            }

            balance -= remove;
            return true;
        }
    }
}
