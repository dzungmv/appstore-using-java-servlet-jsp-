package Model;

public class Card {
    private String rechargeCode;
    private int Denominations;

    public Card(String rechargeCode, int Denominations) {
        this.rechargeCode = rechargeCode;
        this.Denominations = Denominations;
    }

    public String getRechargeCode() {
        return rechargeCode;
    }

    public int getDenominations() {
        return Denominations;
    }

    public void setRechargeCode(String rechargeCode) {
        this.rechargeCode = rechargeCode;
    }

    public void setDenominations(int Denominations) {
        this.Denominations = Denominations;
    }

    @Override
    public String toString() {
        return "Card{" + "rechargeCode=" + rechargeCode + ", Denominations=" + Denominations + '}';
    }
}
