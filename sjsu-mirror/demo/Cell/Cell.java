class Cell {

    public static int cellCount;
    private static java.util.Random gen;
    private int value;

    static {
        cellCount = 0;
        gen = new java.util.Random();
    }

    public Cell() {
        value = gen.nextInt(100);
        cellCount++;
    }
    public int getValue() {
        return value;
    }
}
