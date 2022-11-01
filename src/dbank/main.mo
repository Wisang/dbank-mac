import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";


actor DBank {
  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));

  stable var currentBalance: Float = 300;
  currentBalance := 300;
  Debug.print(debug_show(currentBalance));

  public func topUp(amount: Float) {
    currentBalance := currentBalance + amount;
    Debug.print(debug_show(currentBalance));
  };

  public func withdraw(amount: Float) {
    let temp: Float = currentBalance - amount;

    if(temp >= 0) {
      currentBalance := currentBalance - amount;
      Debug.print(debug_show(currentBalance));
    } else {
      Debug.print("Insufficient funds");
    }
  };

  public query func checkBalance(): async Float {
    return currentBalance;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 3600000000000;
    currentBalance := currentBalance * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
}