class Programmer extends Employee {
    private String favoriteLanguage;
    public Programmer(String nm, float sal, String fl) {
        super(nm, sal);
        favoriteLanguage = fl;
    }
    public String getFavoriteLanguage() {
        return favoriteLanguage;
    }
}

class CProgrammer extends Programmer {
    public CProgrammer(String nm, float sal) {
        super(nm, sal, "C");
    }
}

class JavaProgrammer extends Programmer {
    public JavaProgrammer(String nm, float sal) {
        super(nm, sal, "Java");
    }
}
