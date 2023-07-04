package thread;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;

/**
 * @author Asta
 * @date 2023-05-30
 */
public class ThreadText8 {

    public static void main(String[] args) throws InterruptedException, ExecutionException {
//        ArrayBlockingQueue<Integer> queue = new ArrayBlockingQueue<>(5);
//        MyThread myThread = new MyThread(queue);
//        for (int i = 0; i < 6; i++) {
//            queue.offer(i, 1, TimeUnit.SECONDS);
//        }

        FutureTask<Integer> taskFutureTask = new FutureTask<>(new Task());
        Thread thread = new Thread(taskFutureTask);
        thread.start();

        System.out.println(taskFutureTask.get());
    }


    static class Task implements Callable<Integer> {

        @Override
        public Integer call() {
            System.out.println("task running");
            return 0;
        }

    }

    static class MyThread implements Runnable {

        private final ArrayBlockingQueue<Integer> queue;

        public MyThread(ArrayBlockingQueue<Integer> queue) {
            this.queue = queue;
        }

        @Override
        public void run() {
            while (true) {
                try {
                    Integer take = queue.take();
                    System.out.println("take one: " + take);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
