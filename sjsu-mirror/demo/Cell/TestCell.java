public class TestCell {
    public static void main(String[] args) {
        Cell c1 = new Cell();
        Cell c2 = new Cell();
        Cell c3 = new Cell();
        System.out.println("c1.value = " + c1.getValue());
        System.out.println("c2.value = " + c2.getValue());
        System.out.println("c3.value = " + c3.getValue());
        System.out.println("# cells = " + Cell.cellCount);
    }
}
