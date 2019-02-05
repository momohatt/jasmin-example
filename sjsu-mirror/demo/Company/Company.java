public class Company {

    private int cap = 100;
    private Employee[] staff = new Employee[cap];
    private int size = 0;

    public void hire(Employee e) {
        if (size < cap) {
            staff[size++] = e;
        }
    }

    public int getSize() {
        return size;
    }

    public Employee getEmployee(int index) {
        if (0 <= index && index < size) {
            return staff[index];
        } else {
            return null;
        }
    }

    public static void main(String[] args) {
        Company acme = new Company();
        Programmer smith = new Programmer("Smith", 54321.0f, "Jasmin");
        acme.hire(smith);
        for(int i = 0; i < acme.getSize(); i++) {
            Employee e = acme.getEmployee(i);
            if (e instanceof Programmer) {
                Programmer p = (Programmer)e;
                System.out.println("name = " + p.getName());
                System.out.println("salary = " + p.getSalary());
                System.out.println("favorite language = " + p.getFavoriteLanguage());
            }
        }
    }
}
