public class Account extends java.lang.Object {

    private double balance = 0;

    public Account() {
        super();
    }

    public double getBalance() {
        return this.balance;
    }

    public void deposit(double local_1) {  // local_0 = this
        this.balance = this.balance + local_1;
        return;
    }

}
