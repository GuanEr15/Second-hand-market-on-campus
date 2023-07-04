package thread;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;

/**
 * 线程1添加10个元素到容器中，
 * 线程2实现监控元素的个数,当个数到5个时，线程2给出提示并结束
 *
 * @author Asta
 * @date 2023-03-30
 */
public class ThreadText5 {

    static volatile List<Integer> list = new ArrayList<>();

    public static void main(String[] args) {

        CountDownLatch countDownLatch = new CountDownLatch(5);

        new Thread(() -> {
            if (list.size() != 5) {
                System.out.println("等待开始");
                try {
                    countDownLatch.await();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            System.out.println("等待结束");
        }).start();

        new Thread(() -> {
            for (int i = 0; i < 10; i++) {
                System.out.println("添加" + i);
                list.add(i);
                countDownLatch.countDown();
            }
        }).start();

    }
}
