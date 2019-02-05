public class Rational {

    private int numerator;
    private int denominator;

    public Rational(int num, int den) {
        if (den == 0) {
            System.out.println("denominator must be positive");
            System.exit(1);
        }
        if (den < 0) {
            num = -1 * num;
            den = -1 * den;
        }
        //int d = Math.gcd(Math.abs(num), Math.abs(den));
        numerator = num;
        denominator = den;

    }

    public int getNumerator() { return numerator; }
    public int getDenominator() { return denominator; }

    public Rational mult(Rational other) {
        int num = this.getNumerator() * other.getNumerator();
        int den = this.getDenominator() * other.getDenominator();
        return new Rational(num, den);
    }

    public String toString() {
        return "" + numerator + "/" + denominator;
    }

}
