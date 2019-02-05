class Employee {
    private String name;
    private float salary;
    public Employee(String nm, float sal) {
        name = nm;
        salary = sal;
    }
    public String getName() { return name; }

    public float getSalary() {
        return salary;
    }
    public void setSalary(float sal) {
        salary = sal;
    }
}
