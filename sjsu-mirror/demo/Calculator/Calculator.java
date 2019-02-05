public class Calculator extends java.lang.Object {

    public Calculator() {
        super();
        return;
    }

    // centigrade to Farenheit conversion
    // F = 9 * C / 5 + 32
    public float c2f(float local_1) { // note: local_0 = this
        local_1 = 9.0f * local_1;
        local_1 = local_1/5.0f;
        local_1 = local_1 + 32f;
        return local_1;
    }

    // Farenheit to centigrade conversion
    // C = 5 * (f - 32) / 9
    public float f2c(float local_1) {
        local_1 = local_1 - 32f;
        local_1 = local_1 * 5.0f;
        local_1 = local_1 / 9.0f;
        return local_1;
    }
}
