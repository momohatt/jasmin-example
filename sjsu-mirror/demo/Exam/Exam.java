public class Exam {

    private int[] scores; // student scores on this exam
    private int size; // = # of scores = next availale slot
    private int capacity; // = max number of scores

    public Exam() {
        super();
        capacity = 100;
        size = 0;
        scores = new int[capacity];
    }

    private void validateIndex(int index) {
        if(index < 0 || size <= index) {
            System.out.println("Error: array index out of range!");
            System.exit(1); // shut program down!
        }
    }

    public int getScore(int index) {
        validateIndex(index);
        return scores[index];
    }

    public int getSize() {
        return size;
    }

    public void addScore(int score) {
        if (size < capacity) {
            scores[size] = score;
            size = size + 1;
        }
    }

    public double getAverage() {
        double result = 0.0;
        int index = 0;
        while(index < size) {
            result = result + scores[index];
            index = index + 1;
        }
        if (0 < size) {
            result = result/size;
        } else {
            result = 0;
        }

        return result;
    }
}
