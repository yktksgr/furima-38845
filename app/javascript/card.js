const pay = () => {
  const payjp = Payjp(''); // PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#card-number');
  expiryElement.mount('#card-exp-month'); 
  expiryElement.mount('#card-exp-year'); 
  cvcElement.mount('#card-cvc');

  const submit = document.getElementById("button");

  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const cardNumberValue = document.getElementById('card-number').value; // カード番号の値を取得
    const expMonthValue = document.getElementById('card-exp-month').value; // 有効期限（月）の値を取得
    const expYearValue = document.getElementById('card-exp-year').value; // 有効期限（年）の値を取得
    const cvcValue = document.getElementById('card-cvc').value; // セキュリティコードの値を取得

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        // エラーハンドリングの処理を記述
      } else {
        const token = response.id;
        console.log(token);
        // トークンをサーバーに送信する処理を記述
        // ここでサーバー側にトークンを送信し、支払い処理を行うことができます
      }
    });
  });
};

window.addEventListener("load", pay);