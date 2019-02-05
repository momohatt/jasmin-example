public class Functions extends java.lang.Object {

    public Functions() {
        super();
        return;
    }

    public static long abs(long local_0) {
        if (local_0 > 0) {
            return local_0;
        } else {
            return -1 * local_0;
        }
    }

    public static int fact(int local_0) {
        int local_1 = 1;
        while(0 < local_0) {
            local_1 = local_1 * local_0;
            local_0 = local_0 - 1;
        }
        return local_1;
    }

}
