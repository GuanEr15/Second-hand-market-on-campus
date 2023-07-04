package thread;

/**
 * 三个方法分别等待3、2、1秒，使用三个线程查询
 *
 * @author Asta
 * @date 2023-04-10
 */
public class ThreadText6 {

    public static void main(String[] args) {
        long start = System.currentTimeMillis();

        Thread thread3 = new Thread(() -> {
            try {
                wait3();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });

        Thread thread2 = new Thread(() -> {
            try {
                wait2();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });

        Thread thread1 = new Thread(() -> {
            try {
                wait1();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });


        thread3.start();
        thread2.start();
        thread1.start();
    }


    public static void wait3() throws InterruptedException {
        Thread.sleep(3000);

        System.out.println("wait 3等待三秒");
    }

    public static void wait2() throws InterruptedException {
        Thread.sleep(2000);

        System.out.println("wait 2等待两秒");
    }

    public static void wait1() throws InterruptedException {
        Thread.sleep(1000);

        System.out.println("wait 1等待一秒");
    }
}
