package thread;

import java.util.HashMap;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.SortedMap;
import java.util.Stack;

/**
 * @author Asta
 * @date 2023-05-27
 */
public class ThreadText7 {

    public static void main(String[] args) {
//        Pk p = new Pk(100);
//        Thread t1 = new Thread(p);
//        Thread t2 = new Thread(p);
//        t1.setName("线程一");
//        t2.setName("线程二");
//        t1.start();
//        t2.start();

        String[] str = new String[]{
                "10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"
        };
        evalRPN(str);
    }


    public static int evalRPN(String[] tokens) {
        Stack<Integer> stack = new Stack<>();

        Map<String, Integer> map = new HashMap<>();
        for (Map.Entry<String, Integer> entry : map.entrySet()) {

        }

        for (String s : tokens) {
            if (isNumber(s)) {
                int cur = 0, i = 0;
                while (i < s.length() && s.charAt(i) >= '0' && s.charAt(i) <= '9') {
                    cur = cur * 10;
                    cur += s.charAt(i) - '0';
                    i++;
                }
                stack.push(cur);
            } else {
                int right = stack.pop(), left = stack.pop();

                if ("+".equals(s)) {
                    stack.push(left + right);
                } else if ("-".equals(s)){
                    stack.push(left - right);
                } else if ("*".equals(s)) {
                    stack.push(left * right);
                } else {
                    stack.push(left / right);
                }
            }
        }

        return stack.pop();
    }

    public static boolean isNumber(String s) {
        return !("+".equals(s) || "-".equals(s) || "*".equals(s) || "/".equals(s));
    }

    static class Pk implements Runnable {

        private int i;

        public Pk(int i) {
            this.i = i;
        }

        @Override
        public void run() {
            synchronized (this) {

                while (i >= 0) {

                    System.out.println(Thread.currentThread().getName() + "在打印数字" + i);
                    i--;
                    notify();
                    try {
                        wait();
                    } catch (Exception e) {
                        throw new RuntimeException();
                    }
                }
            }
        }

    }
}
