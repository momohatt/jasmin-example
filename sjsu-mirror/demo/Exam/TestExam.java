public class TestExam {

    public static void main(String[] args) {

        Exam midterm = new Exam();

        midterm.addScore(99);
        midterm.addScore(70);
        midterm.addScore(40);

        for(int i = 0; i < midterm.getSize(); i++) {
            System.out.println("scores[" + i + "] = " + midterm.getScore(i));
        }

        System.out.println("average = " + midterm.getAverage());

        int i = 3;
        System.out.print("scores[3] = ");
        System.out.println(midterm.getScore(i));
        System.out.println("bye?");
    }
}
