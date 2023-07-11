import QtQuick 2.15
import QtQuick.Controls 2.15
import Qaterial 1.0 as Qaterial
import Account_Handler 1.0



Qaterial.ApplicationWindow
{
      id: window
      width: account_handler.getScreenWidth()
      height: account_handler.getScreenHeight()
      visible: true
      title: qsTr("Криптовалютна місцина гаманців")



      function enable_user(email, password)
            {
              return !email.errorState&&email.length&&((!password.errorState&&
                     password.length)||!password.enabled)
            }



      function enable_wallet(wallet_address, private_key, balance, wallet_email)
      {
          return !wallet_address.errorState&&wallet_address.length&&((
          !private_key.errorState&&private_key.length&&
          !balance.errorState&&
          !wallet_email.errorState&&wallet_email.length)||!wallet_email.enabled)
      }



      function enable_transaction(transaction_address, transaction_wallet_address,
                                  recipient_address, amount,
                                  transaction_block_number)
      {
          return !transaction_address.errorState&&transaction_address.length&&((
          !transaction_wallet_address.errorState&&transaction_wallet_address.length&&
          !recipient_address.errorState&&recipient_address.length&&
          !amount.errorState&&
          !transaction_block_number.errorState&&transaction_block_number.length)||
          !transaction_block_number.enabled)
      }



      function enable_block(block_number, miner_address, reward)
      {
          return !block_number.errorState&&block_number.length&&((
          !miner_address.errorState&&miner_address.length&&
          !reward.errorState&&reward.length)||!reward.enabled)
      }



      function enable_approved_user(approved_email, owner_email, wallet_address)
      {
          return !approved_email.errorState&&approved_email.length&&((
          !owner_email.errorState&&owner_email.length&&
          !wallet_address.errorState&&wallet_address.length)||!wallet_address.enabled)
      }



      Account_Handler
      {
          id: account_handler
      }



      Component.onCompleted: () =>
      {
      account_handler.connectToDatabase("QPSQL", "cryptowallets", "doadmin",
      "cryptowallet-do-user-10874420-0.b.db.ondigitalocean.com", 25060,
      "ZuCu8Jc4fbFrfppj")
      first_text.clear()
      first_text.clearError()
      balance_text.clear()
      balance_text.clearError()
      sum_text.clear()
      sum_text.clearError()
      sixth_text.clear()
      sixth_text.clearError()
      minimum_text.clear()
      minimum_text.clearError()
      }



      Column
      {
      id: menu
      Row
      {
          Qaterial.OutlineButton
                          {
                            width: window.width/3
                            text: "Запит 1"
                            onClicked: () =>
                                       {
                                           menu.visible=false
                                           first_text.clearError()
                                           first_query.visible=true
                                       }
                          }
                          Qaterial.OutlineButton
                          {
                            width: window.width/3
                            text: "Запит 2"
                            onClicked: () =>
                                       {
                                           menu.visible=false
                                           second_text.clearError()
                                           second_query.visible=true
                                       }
                          }
                          Qaterial.OutlineButton
                          {
                            width: window.width/3
                            text: "Запит 3"
                            onClicked: () =>
                                       {
                                           menu.visible=false
                                           thirst_text.clearError()
                                           transaction_text.clearError()
                                           thirst_query.visible=true
                                       }
                          }
      }
      Row
      {
          Qaterial.OutlineButton
                          {
                            width: window.width/3
                            text: "Запит 4"
                            onClicked: () =>
                                       {
                                           menu.visible=false
                                           fourth_text.clearError()
                                           balance_text.clearError()
                                           fourth_query.visible=true
                                       }
                          }
                          Qaterial.OutlineButton
                          {
                            width: window.width/3
                            text: "Запит 5"
                            onClicked: () =>
                                       {
                                           menu.visible=false
                                           fifth_text.clearError()
                                           password_text.clearError()
                                           fifth_query.visible=true
                                       }
                          }
                          Qaterial.OutlineButton
                          {
                            width: window.width/3
                            text: "Запит 6"
                            onClicked: () =>
                                       {
                                           menu.visible=false
                                           sixth_text.clearError()
                                           sixth_query.visible=true
                                       }
                          }
      }
      Row
      {
          Qaterial.OutlineButton
                          {
                            width: window.width/3
                            text: "Запит 7"
                            onClicked: () =>
                                       {
                                           menu.visible=false
                                           seventh_text.clearError()
                                           minimum_text.clearError()
                                           seventh_query.visible=true
                                       }
                          }
                          Qaterial.OutlineButton
                          {
                            width: window.width/3
                            text: "Запит 8"
                            onClicked: () =>
                                       {
                                           menu.visible=false
                                           eighth_text.clearError()
                                           eighth_query.visible=true
                                       }
                          }
                          Qaterial.OutlineButton
                          {
                            width: window.width/3
                            text: "Запит 9"
                            onClicked: () =>
                                       {
                                           menu.visible=false
                                           ninth_text.clearError()
                                           ninth_query.visible=true
                                       }
                          }
      }
      Row
      {
          Qaterial.OutlineButton
                          {
                            width: window.width/3
                            text: "Користувачі"
                            onClicked: () =>
                                       {
                                           menu.visible=false
                                           email.clearError()
                                           password.clearError()
                                           card.visible=true
                                           user.visible=true
                                       }
                          }
                          Qaterial.OutlineButton
                          {
                            width: window.width/3
                            text: "Гаманці"
                            onClicked: () =>
                                       {
                                           menu.visible=false
                                           wallet_address.clearError()
                                           private_key.clearError()
                                           balance.clearError()
                                           wallet_email.clearError()
                                           card.visible=true
                                           wallet.visible=true
                                       }
                          }
                          Qaterial.OutlineButton
                          {
                            width: window.width/3
                            text: "Транзакції"
                            onClicked: () =>
                                       {
                                           menu.visible=false
                                           transaction_address.clearError()
                                           transaction_wallet_address.clearError()
                                           recipient_address.clearError()
                                           amount.clearError()
                                           transaction_block_number.clearError()
                                           card.visible=true
                                           transaction.visible=true
                                       }
                          }
      }
      Row
      {
          Qaterial.OutlineButton
                          {
                            width: window.width/2
                            text: "Блоки"
                            onClicked: () =>
                                       {
                                           menu.visible=false
                                           block_number.clearError()
                                           miner_address.clearError()
                                           reward.clearError()
                                           card.visible=true
                                           block.visible=true
                                       }
                          }
                          Qaterial.OutlineButton
                          {
                            width: window.width/2
                            text: "Партнери"
                            onClicked: () =>
                                       {
                                           menu.visible=false
                                           approved_email.clearError()
                                           owner_email.clearError()
                                           approved_wallet_address.clearError()
                                           card.visible=true
                                           approved_user.visible=true
                                       }
                          }
      }
      }
      Qaterial.ExtendedFabButton
                  {
                    visible: menu.visible
                    anchors.horizontalCenter: parent.horizontalCenter
                    icon.source: Qaterial.Icons.github
                    flat: true
                    text: "Посилання на GitHub студента Степанюка Олексія із К-25"
                    extendedOnHovered: true
                    y: window.height-height*3
                    onClicked: account_handler.openUrl("https://github.com/Braun-Alex")
                  }
      Qaterial.Card
        {
          id: card
          x: (window.width-card.width)/2
          y: (window.height-card.height)/5
          visible: false
          width: window.width/1.2
          height: window.height/1.1
          Column
          {
            Qaterial.TabBar
            {
              id: tabBar
              Qaterial.TabButton
              {
                text: "Додати"
                width: card.width/2
              }
              Qaterial.TabButton
              {
                text: "Видалити"
                width: card.width/2
              }
            }
            Column
                   {
                   id: user
                   width: card.width
                   visible: false



                       Qaterial.TextField
                         {
                           id: email
                           width: user.width
                           title: "Електронна скринька"
                           placeholderText: "Введіть сюди електронну скриньку"
                           helperText: "Будьте уважними при вводі електронної скриньки"
                           leadingIconSource: Qaterial.Icons.email
                           trailingVisible: true
                           trailingContent: Qaterial.TextFieldButtonContainer
                           {
                             Qaterial.TextFieldAlertIcon {visible: email.errorState}
                             Qaterial.TextFieldClearButton {visible: email.length}
                           }
                         }



                       Qaterial.TextField
                       {
                         id: password
                         enabled: tabBar.currentIndex!==1
                         width: user.width
                         title: "Пароль"
                         placeholderText: "Введіть пароль сюди"
                         errorText: "Пароль має містити більше 11 символів!"
                         validator: RegularExpressionValidator { regularExpression: /.{12,}/ }
                         helperText: "Пароль може містити довільні символи"
                         leadingIconSource: Qaterial.Icons.formTextboxPassword
                         echoMode: TextInput.Password
                         trailingContent: Qaterial.TextFieldButtonContainer
                         {
                             Qaterial.TextFieldAlertIcon {visible: password.errorState}
                             Qaterial.TextFieldClearButton {visible: password.length}
                             Qaterial.TextFieldPasswordButton {}
                         }
                       }



                       Row
                       {
                           Qaterial.OutlineButton
                           {
                               text: "Виконати"
                               enabled: enable_user(email, password)
                               onClicked: () =>
                               {
                               if (!account_handler.checkEmailCorrectness(email.text))
                               email.setError("Електронна скринька має невірний формат!")
                               else
                                              {

                                                  if (tabBar.currentIndex===0)
                                              account_handler.saveUser(
                                                  email.text, password.text)
                                              else account_handler.deleteUser(
                                                  email.text)
                                              }
                               }
                               }



                           Qaterial.OutlineButton
                           {
                               text: "Повернутися"
                               onClicked: () =>
                               {
                                   card.visible=false
                                   user.visible=false
                                   email.clear()
                                   password.clear()
                                   menu.visible=true
                               }
                           }
                           Qaterial.RoundButton
                               {
                                 id: all_users
                                 icon.source: Qaterial.Icons.informationOutline
                                 onClicked: account_handler.seeAllUsers()
                               }
                           Qaterial.ToolTip
                                 {
                                   text: "Отримати дані всіх користувачів"
                                   visible: all_users.hovered||all_users.pressed
                                   position: Qaterial.Style.Position.Right
                                 }
                       }
                   }
            Column
                   {
                   id: wallet
                   width: card.width
                   visible: false



                       Qaterial.TextField
                         {
                           id: wallet_address
                           width: wallet.width
                           title: "Адреса гаманця"
                           placeholderText: "Введіть сюди адресу гаманця"
                           helperText: "Адреса гаманця є його ідентифікатором у мережі"
                           maximumLengthCount: 42
                           validator: RegularExpressionValidator {regularExpression: /.{42}/}
                           errorText: "Адреса гаманця повинна містити 42 символи!"
                           leadingIconSource: Qaterial.Icons.accountKey
                           trailingVisible: true
                           trailingContent: Qaterial.TextFieldButtonContainer
                           {
                             Qaterial.TextFieldAlertIcon {visible: wallet_address.errorState}
                             Qaterial.TextFieldCopyButton {visible: wallet_address.length}
                             Qaterial.TextFieldClearButton {visible: wallet_address.length}
                           }
                         }



                       Qaterial.TextField
                       {
                         id: private_key
                         enabled: tabBar.currentIndex!==1
                         width: wallet.width
                         title: "Приватний ключ гаманця"
                         placeholderText: "Введіть сюди приватний ключ гаманця"
                         helperText: "Приватний ключ надає назавжди доступ до гаманця"
                         maximumLengthCount: 64
                         validator: RegularExpressionValidator {regularExpression: /.{64}/}
                         errorText: "Приватний ключ гаманця повинен містити 64 символи!"
                         leadingIconSource: Qaterial.Icons.keyPlus
                         trailingContent: Qaterial.TextFieldButtonContainer
                         {
                             Qaterial.TextFieldAlertIcon {visible: private_key.errorState}
                             Qaterial.TextFieldCopyButton {visible: private_key.length}
                             Qaterial.TextFieldClearButton {visible: private_key.length}
                         }
                       }



                       Qaterial.TextField
                       {
                         id: balance
                         enabled: tabBar.currentIndex!==1
                         width: wallet.width
                         title: "Поточний баланс"
                         placeholderText: "Введіть сюди поточний баланс гаманця"
                         helperText: "Баланс гаманця визначається сумою ETH"
                         maximumLengthCount: 10
                         validator: RegularExpressionValidator {regularExpression: /[0-9]*.[0-9]*/}
                         errorText: "Баланс гаманця не може містити стільки цифр!"
                         leadingIconSource: Qaterial.Icons.ethereum
                         trailingContent: Qaterial.TextFieldButtonContainer
                         {
                             Qaterial.TextFieldAlertIcon {visible: balance.errorState}
                             Qaterial.TextFieldClearButton {visible: balance.length}
                         }
                       }



                       Qaterial.TextField
                         {
                           id: wallet_email
                           enabled: tabBar.currentIndex!==1
                           width: wallet.width
                           title: "Електронна скринька"
                           placeholderText: "Введіть сюди свою електронну скриньку"
                           helperText: "Будьте уважними при вводі електронної скриньки"
                           leadingIconSource: Qaterial.Icons.email
                           trailingVisible: true
                           trailingContent: Qaterial.TextFieldButtonContainer
                           {
                             Qaterial.TextFieldAlertIcon {visible: wallet_email.errorState}
                             Qaterial.TextFieldClearButton {visible: wallet_email.length}
                           }
                         }



                       Row
                       {
                           Qaterial.OutlineButton
                           {
                               text: "Виконати"
                               enabled: enable_wallet(wallet_address,
                                                      private_key,
                                                      balance,
                                                      wallet_email)
                               onClicked: () =>
                               {
                               if (tabBar.currentIndex===0&&!account_handler.checkEmailCorrectness(wallet_email.text))
                               wallet_email.setError("Електронна скринька має невірний формат!")
                               else
                                              {

                                                  if (tabBar.currentIndex===0)
                                              account_handler.saveWallet(
                                                  wallet_address.text,
                                                  private_key.text,
                                                  parseFloat(balance.text),
                                                  wallet_email.text)
                                              else account_handler.deleteWallet(
                                                  wallet_address.text)
                                              }
                               }
                               }



                           Qaterial.OutlineButton
                           {
                               text: "Повернутися"
                               onClicked: () =>
                               {
                                   card.visible=false
                                   wallet.visible=false
                                   wallet_address.clear()
                                   private_key.clear()
                                   balance.clear()
                                   wallet_email.clear()
                                   menu.visible=true
                               }
                           }
                           Qaterial.RoundButton
                               {
                                 id: all_wallets
                                 icon.source: Qaterial.Icons.informationOutline
                                 onClicked: account_handler.seeAllWallets()
                               }
                           Qaterial.ToolTip
                                 {
                                   text: "Отримати дані всіх гаманців"
                                   visible: all_wallets.hovered||all_wallets.pressed
                                   position: Qaterial.Style.Position.Right
                                 }
                       }
                   }
            Column
                   {
                   id: transaction
                   width: card.width
                   visible: false



                       Qaterial.TextField
                         {
                           id: transaction_address
                           width: transaction.width
                           title: "Адреса транзакції"
                           placeholderText: "Введіть сюди адресу транзакції"
                           helperText: "Адреса транзакції є її ідентифікатором у мережі"
                           maximumLengthCount: 66
                           validator: RegularExpressionValidator {regularExpression: /.{66}/}
                           errorText: "Адреса транзакції повинна містити 66 символи!"
                           leadingIconSource: Qaterial.Icons.transfer
                           trailingVisible: true
                           trailingContent: Qaterial.TextFieldButtonContainer
                           {
                             Qaterial.TextFieldAlertIcon {visible: transaction_address.errorState}
                             Qaterial.TextFieldCopyButton {visible: transaction_address.length}
                             Qaterial.TextFieldClearButton {visible: transaction_address.length}
                           }
                         }



                       Qaterial.TextField
                       {
                         id: transaction_wallet_address
                         enabled: tabBar.currentIndex!==1
                         width: transaction.width
                         title: "Адреса гаманця відправника"
                         placeholderText: "Введіть сюди адресу гаманця відправника"
                         helperText: "Адреса гаманця є його ідентифікатором у мережі"
                         maximumLengthCount: 42
                         validator: RegularExpressionValidator {regularExpression: /.{42}/}
                         errorText: "Адреса гаманця повинна містити 42 символи!"
                         leadingIconSource: Qaterial.Icons.bankTransferOut
                         trailingContent: Qaterial.TextFieldButtonContainer
                         {
                             Qaterial.TextFieldAlertIcon {visible: transaction_wallet_address.errorState}
                             Qaterial.TextFieldCopyButton {visible: transaction_wallet_address.length}
                             Qaterial.TextFieldClearButton {visible: transaction_wallet_address.length}
                         }
                       }



                       Qaterial.TextField
                       {
                         id: recipient_address
                         enabled: tabBar.currentIndex!==1
                         width: transaction.width
                         title: "Адреса гаманця отримувача"
                         placeholderText: "Введіть сюди адресу гаманця отримувача"
                         helperText: "Адреса гаманця є його ідентифікатором у мережі"
                         maximumLengthCount: 42
                         validator: RegularExpressionValidator {regularExpression: /.{42}/}
                         errorText: "Адреса гаманця повинна містити 42 символи!"
                         leadingIconSource: Qaterial.Icons.bankTransferIn
                         trailingContent: Qaterial.TextFieldButtonContainer
                         {
                             Qaterial.TextFieldAlertIcon {visible: recipient_address.errorState}
                             Qaterial.TextFieldCopyButton {visible: recipient_address.length}
                             Qaterial.TextFieldClearButton {visible: recipient_address.length}
                         }
                       }



                       Qaterial.TextField
                       {
                         id: amount
                         enabled: tabBar.currentIndex!==1
                         width: wallet.width
                         title: "Сума переказу"
                         placeholderText: "Введіть сюди суму переказу транзакції"
                         helperText: "Сума переказу визначається сумою ETH"
                         maximumLengthCount: 10
                         validator: RegularExpressionValidator {regularExpression: /[0-9]*.[0-9]*/}
                         errorText: "Сума переказу не може містити стільки цифр!"
                         leadingIconSource: Qaterial.Icons.ethereum
                         trailingContent: Qaterial.TextFieldButtonContainer
                         {
                             Qaterial.TextFieldAlertIcon {visible: amount.errorState}
                             Qaterial.TextFieldClearButton {visible: amount.length}
                         }
                       }



                       Qaterial.TextField
                       {
                         id: transaction_block_number
                         enabled: tabBar.currentIndex!==1
                         width: wallet.width
                         title: "Номер блоку"
                         placeholderText: "Введіть сюди номер блоку транзакції"
                         helperText: "Номер блоку визначається номером елемента ланцюга блокчейну"
                         maximumLengthCount: 8
                         validator: RegularExpressionValidator {regularExpression: /[0-9]*/}
                         errorText: "Номер блоку не може містити стільки цифр!"
                         leadingIconSource: Qaterial.Icons.lockReset
                         trailingContent: Qaterial.TextFieldButtonContainer
                         {
                             Qaterial.TextFieldAlertIcon {visible: transaction_block_number.errorState}
                             Qaterial.TextFieldClearButton {visible: transaction_block_number.length}
                         }
                       }



                       Row
                       {
                           Qaterial.OutlineButton
                           {
                               text: "Виконати"
                               enabled: enable_transaction(transaction_address,
                                                           transaction_wallet_address,
                                                           recipient_address,
                                                           amount,
                                                           transaction_block_number)
                               onClicked: () =>
                               {

                                                  if (tabBar.currentIndex===0)
                                              account_handler.saveTransaction(
                                                  transaction_address.text,
                                                  transaction_wallet_address.text,
                                                  recipient_address.text,
                                                  parseFloat(amount.text),
                                                  parseInt(transaction_block_number.text))
                                              else account_handler.deleteTransaction(
                                                  transaction_address.text)
                               }
                           }



                           Qaterial.OutlineButton
                           {
                               text: "Повернутися"
                               onClicked: () =>
                               {
                                   card.visible=false
                                   transaction.visible=false
                                   transaction_address.clear()
                                   transaction_wallet_address.clear()
                                   recipient_address.clear()
                                   amount.clear()
                                   transaction_block_number.clear()
                                   menu.visible=true
                               }
                           }
                           Qaterial.RoundButton
                               {
                                 id: all_transactions
                                 icon.source: Qaterial.Icons.informationOutline
                                 onClicked: account_handler.seeAllTransactions()
                               }
                           Qaterial.ToolTip
                                 {
                                   text: "Отримати дані всіх транзакцій"
                                   visible: all_transactions.hovered||
                                            all_transactions.pressed
                                   position: Qaterial.Style.Position.Right
                                 }
                       }
                   }
            Column
                   {
                   id: block
                   width: card.width
                   visible: false



                   Qaterial.TextField
                   {
                     id: block_number
                     width: block.width
                     title: "Номер блоку"
                     placeholderText: "Введіть сюди номер блоку"
                     helperText: "Номер блоку визначається номером елемента ланцюга блокчейну"
                     maximumLengthCount: 8
                     validator: RegularExpressionValidator {regularExpression: /[0-9]*/}
                     errorText: "Номер блоку не може містити стільки цифр!"
                     leadingIconSource: Qaterial.Icons.lockReset
                     trailingContent: Qaterial.TextFieldButtonContainer
                     {
                         Qaterial.TextFieldAlertIcon {visible: block_number.errorState}
                         Qaterial.TextFieldClearButton {visible: block_number.length}
                     }
                   }



                       Qaterial.TextField
                       {
                         id: miner_address
                         enabled: tabBar.currentIndex!==1
                         width: block.width
                         title: "Адреса гаманця майнера"
                         placeholderText: "Введіть сюди адресу гаманця майнера"
                         helperText: "Адреса гаманця є його ідентифікатором у мережі"
                         maximumLengthCount: 42
                         validator: RegularExpressionValidator {regularExpression: /.{42}/}
                         errorText: "Адреса гаманця повинна містити 42 символи!"
                         leadingIconSource: Qaterial.Icons.accountKey
                         trailingContent: Qaterial.TextFieldButtonContainer
                         {
                             Qaterial.TextFieldAlertIcon {visible: miner_address.errorState}
                             Qaterial.TextFieldCopyButton {visible: miner_address.length}
                             Qaterial.TextFieldClearButton {visible: miner_address.length}
                         }
                       }



                       Qaterial.TextField
                       {
                         id: reward
                         enabled: tabBar.currentIndex!==1
                         width: block.width
                         title: "Сума винагороди"
                         placeholderText: "Введіть сюди суму винагороди"
                         helperText: "Сума винагороди визначається сумою ETH"
                         maximumLengthCount: 10
                         validator: RegularExpressionValidator {regularExpression: /[0-9]*.[0-9]*/}
                         errorText: "Сума винагороди не може містити стільки цифр!"
                         leadingIconSource: Qaterial.Icons.ethereum
                         trailingContent: Qaterial.TextFieldButtonContainer
                         {
                             Qaterial.TextFieldAlertIcon {visible: reward.errorState}
                             Qaterial.TextFieldClearButton {visible: reward.length}
                         }
                       }



                       Row
                       {
                           Qaterial.OutlineButton
                           {
                               text: "Виконати"
                               enabled: enable_block(block_number, miner_address, reward)
                               onClicked: () =>
                               {

                                                  if (tabBar.currentIndex===0)
                                              account_handler.saveBlock(
                                                  block_number.text,
                                                  miner_address.text,
                                                  parseFloat(reward.text))
                                              else account_handler.deleteBlock(
                                                  block_number.text)
                               }
                           }



                           Qaterial.OutlineButton
                           {
                               text: "Повернутися"
                               onClicked: () =>
                               {
                                   card.visible=false
                                   block.visible=false
                                   block_number.clear()
                                   miner_address.clear()
                                   reward.clear()
                                   menu.visible=true
                               }
                           }
                           Qaterial.RoundButton
                               {
                                 id: all_blocks
                                 icon.source: Qaterial.Icons.informationOutline
                                 onClicked: account_handler.seeAllBlocks()
                               }
                           Qaterial.ToolTip
                                 {
                                   text: "Отримати дані всіх блоків"
                                   visible: all_blocks.hovered||
                                            all_blocks.pressed
                                   position: Qaterial.Style.Position.Right
                                 }
                       }
                   }
            Column
                   {
                   id: approved_user
                   width: card.width
                   visible: false



                       Qaterial.TextField
                         {
                           id: approved_email
                           width: approved_user.width
                           title: "Електронна скринька партнера"
                           placeholderText: "Введіть сюди електронну скриньку партнера"
                           helperText: "Будьте уважними при вводі електронної скриньки партнера"
                           leadingIconSource: Qaterial.Icons.email
                           trailingVisible: true
                           trailingContent: Qaterial.TextFieldButtonContainer
                           {
                             Qaterial.TextFieldAlertIcon {visible: approved_email.errorState}
                             Qaterial.TextFieldClearButton {visible: approved_email.length}
                           }
                         }



                       Qaterial.TextField
                         {
                           id: owner_email
                           enabled: tabBar.currentIndex!==1
                           width: approved_user.width
                           title: "Електронна скринька власника"
                           placeholderText: "Введіть сюди електронну скриньку власника"
                           helperText: "Будьте уважними при вводі електронної скриньки власника"
                           leadingIconSource: Qaterial.Icons.email
                           trailingVisible: true
                           trailingContent: Qaterial.TextFieldButtonContainer
                           {
                             Qaterial.TextFieldAlertIcon {visible: owner_email.errorState}
                             Qaterial.TextFieldClearButton {visible: owner_email.length}
                           }
                         }



                       Qaterial.TextField
                         {
                           id: approved_wallet_address
                           enabled: tabBar.currentIndex!==1
                           width: approved_user.width
                           title: "Адреса довіреного гаманця"
                           placeholderText: "Введіть сюди адресу довіреного гаманця"
                           helperText: "Адреса гаманця є його ідентифікатором у мережі"
                           maximumLengthCount: 42
                           validator: RegularExpressionValidator {regularExpression: /.{42}/}
                           errorText: "Адреса гаманця повинна містити 42 символи!"
                           leadingIconSource: Qaterial.Icons.accountKey
                           trailingVisible: true
                           trailingContent: Qaterial.TextFieldButtonContainer
                           {
                             Qaterial.TextFieldAlertIcon {visible: approved_wallet_address.errorState}
                             Qaterial.TextFieldCopyButton {visible: approved_wallet_address.length}
                             Qaterial.TextFieldClearButton {visible: approved_wallet_address.length}
                           }
                         }



                       Row
                       {
                           Qaterial.OutlineButton
                           {
                               text: "Виконати"
                               enabled: enable_approved_user(approved_email,
                                                             owner_email,
                                                             approved_wallet_address)
                               onClicked: () =>
                               {
                               if (!account_handler.checkEmailCorrectness(approved_email.text))
                               approved_email.setError("Електронна скринька має невірний формат!")
                               else if (owner_email.enabled&&
                                        !account_handler.checkEmailCorrectness(owner_email.text))
                               owner_email.setError("Електронна скринька має невірний формат!")
                               else if (approved_email.text===owner_email.text)
                               owner_email.setError("Електронні скриньки партнера й власника не можуть співпадати!")
                               else
                                              {

                                                  if (tabBar.currentIndex===0)
                                              account_handler.saveApprovedUser(
                                                  approved_email.text,
                                                  owner_email.text,
                                                  approved_wallet_address.text)
                                              else account_handler.deleteApprovedUser(
                                                  approved_email.text)
                                              }
                               }
                               }



                           Qaterial.OutlineButton
                           {
                               text: "Повернутися"
                               onClicked: () =>
                               {
                                   card.visible=false
                                   approved_user.visible=false
                                   approved_email.clear()
                                   owner_email.clear()
                                   approved_wallet_address.clear()
                                   menu.visible=true
                               }
                           }
                           Qaterial.RoundButton
                               {
                                 id: all_approved_users
                                 icon.source: Qaterial.Icons.informationOutline
                                 onClicked: account_handler.seeAllApprovedUsers()
                               }
                           Qaterial.ToolTip
                                 {
                                   text: "Отримати дані всіх партнерів"
                                   visible: all_approved_users.hovered||
                                            all_approved_users.pressed
                                   position: Qaterial.Style.Position.Right
                                 }
                       }
                   }
        }
   }
      Column
      {
      id: first_query
      visible: false
      spacing: window.width/50
      x: (window.width-width)/2
      y: window.height/20
      Qaterial.OutlineTextField
                      {
                        id: first_text
                        width: window.width/1.5
                        title: "Пошуковий баланс"
                        helperText: "Пошуковий баланс не має перевищувати 10 ETH"
                        placeholderText: "Введіть баланс, який буде використаний у запиті"
                        leadingIconInline: true
                        trailingInline: true
                        suffixText: "ETH"
                        suffixTextColor: "#8BC34A"
                        trailingVisible: true
                        leadingIconSource: Qaterial.Icons.ethereum
                        trailingContent: Qaterial.TextFieldButtonContainer
                        {
                          Qaterial.TextFieldAlertIcon {visible: first_text.errorState}
                        }
                        text: (parseFloat(first_balance_slider.value)*10).toFixed(2)
                        onTextChanged: first_text.clearError()
                      }
        Row
        {
          spacing: window.width/50
          Qaterial.ColorIcon
          {
            anchors.verticalCenter: parent.verticalCenter
            source: first_balance_slider.value?Qaterial.Icons.currencyUsd:Qaterial.Icons.currencyUsdOff
          }
          Qaterial.Slider
          {
            id: first_balance_slider
            width: first_text.width/1.2
            value: 0.0
          }
          Qaterial.ColorIcon
          {
            anchors.verticalCenter: parent.verticalCenter
            source: Qaterial.Icons.currencyUsdCircle
          }
        }
        Row
                             {
                                 Qaterial.OutlineButton
                                 {
                                     text: "Виконати"
                                     enabled: first_text.length
                                     onClicked: () =>
                                                {
                                                if (parseFloat(first_text.text)>10.0||parseFloat(first_text.text)===0.0)
                                                    first_text.setError("Пошуковий баланс є нульовим або занадто великим!")
                                                else account_handler.executeFirstQuery(parseFloat(first_text.text))
                                                }
                                     }



                                 Qaterial.OutlineButton
                                 {
                                     text: "Повернутися"
                                     onClicked: () =>
                                     {
                                         first_query.visible=false
                                         first_balance_slider.value=0.0
                                         first_text.clear()
                                         menu.visible=true
                                     }
                                 }
                                 Qaterial.RoundButton
                                     {
                                       id: first_tip
                                       icon.source: Qaterial.Icons.messageQuestion
                                     }
                                 Qaterial.ToolTip
                                       {
                                         text: "Знайти скриньки користувачів з принаймні одним гаманцем з балансом не менше вказаного"
                                         visible: first_tip.hovered||
                                                  first_tip.pressed
                                       }
                             }
      }
      Column
            {
            id: second_query
            visible: false
            spacing: window.width/50
            x: (window.width-width)/2
            y: window.height/20
            Qaterial.OutlineTextField
                            {
                              id: second_text
                              width: window.width/1.5
                              title: "Пошуковий гаманець"
                              helperText: "Адреса гаманця є його ідентифікатором у мережі"
                              validator: RegularExpressionValidator {regularExpression: /.{42}/}
                              errorText: "Адреса гаманця повинна містити 42 символи!"
                              placeholderText: "Введіть сюди адресу гаманця для запиту"
                              leadingIconInline: true
                              trailingInline: true
                              suffixText: text.length
                              trailingVisible: true
                              leadingIconSource: Qaterial.Icons.accountKey
                              trailingContent: Qaterial.TextFieldButtonContainer
                              {
                                 Qaterial.TextFieldAlertIcon {visible: second_text.errorState}
                              }
                            }
            Qaterial.OutlineTextField
                            {
                              id: sum_text
                              width: window.width/1.5
                              title: "Пошукова сума балансів"
                              helperText: "Пошукова сума балансів гаманців не має перевищувати 30 ETH"
                              placeholderText: "Введіть пошукову суму балансів, яка буде використана в запиті"
                              leadingIconInline: true
                              leadingIconSource: Qaterial.Icons.ethereum
                              trailingInline: true
                              suffixText: "ETH"
                              suffixTextColor: "#8BC34A"
                              trailingVisible: true
                              trailingContent: Qaterial.TextFieldButtonContainer
                              {
                                Qaterial.TextFieldAlertIcon {visible: sum_text.errorState}
                              }
                              text: (parseFloat(second_balance_slider.value)*30).toFixed(2)
                              onTextChanged: sum_text.clearError()
                            }
            Row
            {
              spacing: window.width/50
              Qaterial.ColorIcon
              {
                anchors.verticalCenter: parent.verticalCenter
                source: second_balance_slider.value?Qaterial.Icons.currencyUsd:Qaterial.Icons.currencyUsdOff
              }
              Qaterial.Slider
              {
                id: second_balance_slider
                width: second_text.width/1.2
                value: 0.0
              }
              Qaterial.ColorIcon
              {
                anchors.verticalCenter: parent.verticalCenter
                source: Qaterial.Icons.currencyUsdCircle
              }
            }
            Row
                                   {
                                       Qaterial.OutlineButton
                                       {
                                           text: "Виконати"
                                           enabled: !second_text.errorState&&second_text.length&&
                                                    !sum_text.errorState&&sum_text.length
                                           onClicked: () =>
                                                      {
                                                          if (parseFloat(sum_text.text)>30.0||parseFloat(sum_text.text)===0.0)
                                                              sum_text.setError("Пошукова сума балансів є нульовою або занадто великою!")
                                                          else account_handler.executeSecondQuery(second_text.text,
                                                               parseFloat(sum_text.text))
                                                      }
                                           }



                                       Qaterial.OutlineButton
                                       {
                                           text: "Повернутися"
                                           onClicked: () =>
                                           {
                                               second_query.visible=false
                                               second_text.clear()
                                               sum_text.clear()
                                               second_balance_slider.value=0.0
                                               menu.visible=true
                                           }
                                       }
                                       Qaterial.RoundButton
                                           {
                                             id: second_tip
                                             icon.source: Qaterial.Icons.messageQuestion
                                           }
                                       Qaterial.ToolTip
                                             {
                                               text: "Знайти партнерів вказаного гаманця, які мають сумарно на гаманцях не менше вказаної суми"
                                               visible: second_tip.hovered||
                                                        second_tip.pressed
                                             }
                                   }
            }
      Column
            {
            id: thirst_query
            visible: false
            spacing: window.width/50
            x: (window.width-width)/2
            y: window.height/20
            Qaterial.OutlineTextField
                            {
                              id: thirst_text
                              width: window.width/1.5
                              title: "Електронна скринька користувача"
                              placeholderText: "Введіть сюди електронну скриньку користувача"
                              helperText: "Будьте уважними при вводі електронної скриньки власника"
                              leadingIconInline: true
                              leadingIconSource: Qaterial.Icons.email
                              trailingInline: true
                              trailingVisible: true
                              trailingContent: Qaterial.TextFieldButtonContainer
                              {
                                 Qaterial.TextFieldAlertIcon {visible: thirst_text.errorState}
                              }
                            }
            Qaterial.OutlineTextField
                            {
                              id: transaction_text
                              width: window.width/1.5
                              title: "Введіть пошукову кількість транзакцій"
                              placeholderText: "Введіть сюди кількість транзакцій для запиту"
                              helperText: "Дані транзакції мають ініціюватися гаманцями вказаного користувача"
                              validator: RegularExpressionValidator {regularExpression: /[1-9]/}
                              errorText: "Кількість транзакцій має бути від 1 до 9!"
                              leadingIconInline: true
                              leadingIconSource: Qaterial.Icons.circleEditOutline
                              trailingInline: true
                              trailingVisible: true
                              trailingContent: Qaterial.TextFieldButtonContainer
                              {
                                 Qaterial.TextFieldAlertIcon {visible: transaction_text.errorState}
                              }
                            }
            Row
                                   {
                                       Qaterial.OutlineButton
                                       {
                                           text: "Виконати"
                                           enabled: !thirst_text.errorState&&thirst_text.length&&
                                                    !transaction_text.errorState&&transaction_text.length
                                           onClicked: () =>
                                                      {
                                                          if (!account_handler.checkEmailCorrectness(thirst_text.text))
                                                          thirst_text.setError("Електронна скринька має невірний формат!")
                                                          else account_handler.executeThirstQuery(thirst_text.text,
                                                                                                  parseInt(transaction_text.text))
                                                      }
                                           }



                                       Qaterial.OutlineButton
                                       {
                                           text: "Повернутися"
                                           onClicked: () =>
                                           {
                                               thirst_query.visible=false
                                               thirst_text.clear()
                                               transaction_text.clear()
                                               menu.visible=true
                                           }
                                       }
                                       Qaterial.RoundButton
                                           {
                                             id: thirst_tip
                                             icon.source: Qaterial.Icons.messageQuestion
                                           }
                                       Qaterial.ToolTip
                                             {
                                               text: "Знайти гаманці і баланси гаманців, за допомогою яких власник ініціював не менше вказаної кількості транзакцій"
                                               visible: thirst_tip.hovered||
                                                        thirst_tip.pressed
                                             }
                                   }
            }
      Column
            {
            id: fourth_query
            visible: false
            spacing: window.width/50
            x: (window.width-width)/2
            y: window.height/20
            Qaterial.OutlineTextField
                            {
                              id: fourth_text
                              width: window.width/1.5
                              title: "Введіть пошукову кількість партнерів"
                              placeholderText: "Введіть сюди кількість партнерів для запиту"
                              helperText: "Партнери є користувачами, яким надано принаймні один гаманець для користування іншим користувачем"
                              validator: RegularExpressionValidator {regularExpression: /[1-9]/}
                              errorText: "Кількість партнерів має бути від 1 до 9!"
                              leadingIconInline: true
                              leadingIconSource: Qaterial.Icons.circleEditOutline
                              trailingInline: true
                              trailingVisible: true
                              trailingContent: Qaterial.TextFieldButtonContainer
                              {
                                 Qaterial.TextFieldAlertIcon {visible: fourth_text.errorState}
                              }
                            }
            Qaterial.OutlineTextField
                            {
                              id: balance_text
                              width: window.width/1.5
                              title: "Пошуковий баланс"
                              helperText: "Пошуковий баланс не має перевищувати 10 ETH"
                              placeholderText: "Введіть баланс, який буде використаний у запиті"
                              leadingIconInline: true
                              leadingIconSource: Qaterial.Icons.ethereum
                              trailingInline: true
                              suffixText: "ETH"
                              suffixTextColor: "#8BC34A"
                              trailingVisible: true
                              trailingContent: Qaterial.TextFieldButtonContainer
                              {
                                Qaterial.TextFieldAlertIcon {visible: balance_text.errorState}
                              }
                              text: (parseFloat(thirst_balance_slider.value)*10).toFixed(2)
                              onTextChanged: balance_text.clearError()
                            }
            Row
            {
              spacing: window.width/50
              Qaterial.ColorIcon
              {
                anchors.verticalCenter: parent.verticalCenter
                source: thirst_balance_slider.value?Qaterial.Icons.currencyUsd:Qaterial.Icons.currencyUsdOff
              }
              Qaterial.Slider
              {
                id: thirst_balance_slider
                width: fourth_text.width/1.2
                value: 0.0
              }
              Qaterial.ColorIcon
              {
                anchors.verticalCenter: parent.verticalCenter
                source: Qaterial.Icons.currencyUsdCircle
              }
            }
            Row
                                   {
                                       Qaterial.OutlineButton
                                       {
                                           text: "Виконати"
                                           enabled: !fourth_text.errorState&&fourth_text.length&&
                                                    !balance_text.errorState&&balance_text.length
                                           onClicked: () =>
                                                      {
                                                          if (parseFloat(balance_text.text)>10.0||parseFloat(balance_text.text)===0.0)
                                                              balance_text.setError("Пошуковий баланс є нульовим або занадто великим!")
                                                          else account_handler.executeFourthQuery(parseInt(fourth_text.text),
                                                               parseFloat(balance_text.text))
                                                      }
                                           }



                                       Qaterial.OutlineButton
                                       {
                                           text: "Повернутися"
                                           onClicked: () =>
                                           {
                                               fourth_query.visible=false
                                               fourth_text.clear()
                                               balance_text.clear()
                                               thirst_balance_slider.value=0.0
                                               menu.visible=true
                                           }
                                       }
                                       Qaterial.RoundButton
                                           {
                                             id: fourth_tip
                                             icon.source: Qaterial.Icons.messageQuestion
                                           }
                                       Qaterial.ToolTip
                                             {
                                               text: "Знайти довірені гаманці і їх власників із кількістю партнерів і балансом, не менше вказаних"
                                               visible: fourth_tip.hovered||
                                                        fourth_tip.pressed
                                             }
                                   }
            }
      Column
            {
            id: fifth_query
            visible: false
            spacing: window.width/50
            x: (window.width-width)/2
            y: window.height/20
            Qaterial.OutlineTextField
                            {
                              id: fifth_text
                              width: window.width/1.5
                              title: "Електронна скринька користувача"
                              placeholderText: "Введіть сюди електронну скриньку користувача"
                              helperText: "Будьте уважними при вводі електронної скриньки власника"
                              leadingIconInline: true
                              leadingIconSource: Qaterial.Icons.email
                              trailingInline: true
                              trailingVisible: true
                              trailingContent: Qaterial.TextFieldButtonContainer
                              {
                                 Qaterial.TextFieldAlertIcon {visible: fifth_text.errorState}
                              }
                            }
            Qaterial.OutlineTextField
                            {
                              id: password_text
                              width: window.width/1.5
                              title: "Введіть пошукову кількість символів пароля"
                              placeholderText: "Введіть сюди кількість символів для запиту"
                              helperText: "Користувачі не можуть мати пароля меншої довжини, ніж 12 символів"
                              validator: RegularExpressionValidator {regularExpression: /[0-9]*/}
                              leadingIconInline: true
                              leadingIconSource: Qaterial.Icons.formTextboxPassword
                              trailingInline: true
                              trailingVisible: true
                              trailingContent: Qaterial.TextFieldButtonContainer
                              {
                                 Qaterial.TextFieldAlertIcon {visible: password_text.errorState}
                              }
                            }
            Row
                                   {
                                       Qaterial.OutlineButton
                                       {
                                           text: "Виконати"
                                           enabled: !fifth_text.errorState&&fifth_text.length
                                           onClicked: () =>
                                                      {
                                                          if (!account_handler.checkEmailCorrectness(fifth_text.text))
                                                          fifth_text.setError("Електронна скринька має невірний формат!")
                                                          else if (parseInt(password_text.text)<12)
                                                          password_text.setError("Пароль має містити більше 11 символів!")
                                                          else if (password_text.length>=5)
                                                          password_text.setError("Пароль не може бути таким довгим!")
                                                          else account_handler.executeFifthQuery(fifth_text.text,
                                                                                                 parseInt(password_text.text))
                                                      }
                                           }



                                       Qaterial.OutlineButton
                                       {
                                           text: "Повернутися"
                                           onClicked: () =>
                                           {
                                               fifth_query.visible=false
                                               fifth_text.clear()
                                               password_text.clear()
                                               menu.visible=true
                                           }
                                       }
                                       Qaterial.RoundButton
                                           {
                                             id: fifth_tip
                                             icon.source: Qaterial.Icons.messageQuestion
                                           }
                                       Qaterial.ToolTip
                                             {
                                               text: "Знайти партнерів вказаного користувача, які мають довжину пароля не менше вказаної кількості символів"
                                               visible: fifth_tip.hovered||
                                                        fifth_tip.pressed
                                             }
                                   }
            }
      Column
      {
      id: sixth_query
      visible: false
      spacing: window.width/50
      x: (window.width-width)/2
      y: window.height/20
      Qaterial.OutlineTextField
                      {
                        id: sixth_text
                        width: window.width/1.5
                        title: "Пошукова сума"
                        helperText: "Пошукова сума доходу від майнінгу не має перевищувати 10 ETH"
                        placeholderText: "Введіть суму, яка буде використана у запиті"
                        leadingIconInline: true
                        trailingInline: true
                        suffixText: "ETH"
                        suffixTextColor: "#8BC34A"
                        trailingVisible: true
                        leadingIconSource: Qaterial.Icons.ethereum
                        trailingContent: Qaterial.TextFieldButtonContainer
                        {
                          Qaterial.TextFieldAlertIcon {visible: sixth_text.errorState}
                        }
                        text: (parseFloat(fourth_balance_slider.value)*10).toFixed(2)
                        onTextChanged: sixth_text.clearError()
                      }
        Row
        {
          spacing: window.width/50
          Qaterial.ColorIcon
          {
            anchors.verticalCenter: parent.verticalCenter
            source: fourth_balance_slider.value?Qaterial.Icons.currencyUsd:Qaterial.Icons.currencyUsdOff
          }
          Qaterial.Slider
          {
            id: fourth_balance_slider
            width: first_text.width/1.2
            value: 0.0
          }
          Qaterial.ColorIcon
          {
            anchors.verticalCenter: parent.verticalCenter
            source: Qaterial.Icons.currencyUsdCircle
          }
        }
        Row
                             {
                                 Qaterial.OutlineButton
                                 {
                                     text: "Виконати"
                                     enabled: sixth_text.length
                                     onClicked: () =>
                                                {
                                                if (parseFloat(sixth_text.text)>10.0||parseFloat(sixth_text.text)===0.0)
                                                    sixth_text.setError("Пошуковий баланс є нульовим або занадто великим!")
                                                else account_handler.executeSixthQuery(parseFloat(sixth_text.text))
                                                }
                                     }



                                 Qaterial.OutlineButton
                                 {
                                     text: "Повернутися"
                                     onClicked: () =>
                                     {
                                         sixth_query.visible=false
                                         fourth_balance_slider.value=0.0
                                         sixth_text.clear()
                                         menu.visible=true
                                     }
                                 }
                                 Qaterial.RoundButton
                                     {
                                       id: sixth_tip
                                       icon.source: Qaterial.Icons.messageQuestion
                                     }
                                 Qaterial.ToolTip
                                       {
                                         text: "Знайти майнерів, які отримали не менше від майнінгу, ніж вказана сума"
                                         visible: sixth_tip.hovered||
                                                  sixth_tip.pressed
                                       }
                             }
      }
      Column
            {
            id: seventh_query
            visible: false
            spacing: window.width/50
            x: (window.width-width)/2
            y: window.height/20
            Qaterial.OutlineTextField
                            {
                              id: seventh_text
                              width: window.width/1.5
                              title: "Пошуковий гаманець"
                              helperText: "Адреса гаманця є його ідентифікатором у мережі"
                              validator: RegularExpressionValidator {regularExpression: /.{42}/}
                              errorText: "Адреса гаманця повинна містити 42 символи!"
                              placeholderText: "Введіть сюди адресу гаманця для запиту"
                              leadingIconInline: true
                              trailingInline: true
                              suffixText: text.length
                              trailingVisible: true
                              leadingIconSource: Qaterial.Icons.accountKey
                              trailingContent: Qaterial.TextFieldButtonContainer
                              {
                                 Qaterial.TextFieldAlertIcon {visible: seventh_text.errorState}
                              }
                            }
            Qaterial.OutlineTextField
                            {
                              id: minimum_text
                              width: window.width/1.5
                              title: "Пошукова сума балансу"
                              helperText: "Пошукова сума балансу гаманця не має перевищувати 10 ETH"
                              placeholderText: "Введіть пошукову суму балансу, яка буде використана в запиті"
                              leadingIconInline: true
                              leadingIconSource: Qaterial.Icons.ethereum
                              trailingInline: true
                              suffixText: "ETH"
                              suffixTextColor: "#8BC34A"
                              trailingVisible: true
                              trailingContent: Qaterial.TextFieldButtonContainer
                              {
                                Qaterial.TextFieldAlertIcon {visible: minimum_text.errorState}
                              }
                              text: (parseFloat(fifth_balance_slider.value)*10).toFixed(2)
                              onTextChanged: minimum_text.clearError()
                            }
            Row
            {
              spacing: window.width/50
              Qaterial.ColorIcon
              {
                anchors.verticalCenter: parent.verticalCenter
                source: fifth_balance_slider.value?Qaterial.Icons.currencyUsd:Qaterial.Icons.currencyUsdOff
              }
              Qaterial.Slider
              {
                id: fifth_balance_slider
                width: seventh_text.width/1.2
                value: 0.0
              }
              Qaterial.ColorIcon
              {
                anchors.verticalCenter: parent.verticalCenter
                source: Qaterial.Icons.currencyUsdCircle
              }
            }
            Row
                                   {
                                       Qaterial.OutlineButton
                                       {
                                           text: "Виконати"
                                           enabled: !seventh_text.errorState&&seventh_text.length&&
                                                    !minimum_text.errorState&&minimum_text.length
                                           onClicked: () =>
                                                      {
                                                          if (parseFloat(minimum_text.text)>10.0||parseFloat(minimum_text.text)===0.0)
                                                              minimum_text.setError("Пошукова сума балансу є нульовою або занадто великою!")
                                                          else account_handler.executeSeventhQuery(seventh_text.text,
                                                               parseFloat(minimum_text.text))
                                                      }
                                           }



                                       Qaterial.OutlineButton
                                       {
                                           text: "Повернутися"
                                           onClicked: () =>
                                           {
                                               seventh_query.visible=false
                                               seventh_text.clear()
                                               seventh_text.clear()
                                               fifth_balance_slider.value=0.0
                                               menu.visible=true
                                           }
                                       }
                                       Qaterial.RoundButton
                                           {
                                             id: seventh_tip
                                             icon.source: Qaterial.Icons.messageQuestion
                                           }
                                       Qaterial.ToolTip
                                             {
                                               text: "Знайти гаманці із вказаним мінімальним балансом, які ініціювали транзакції принаймні тим гаманцям, що і вказаний"
                                               visible: seventh_tip.hovered||
                                                        seventh_tip.pressed
                                             }
                                   }
            }
      Column
            {
            id: eighth_query
            visible: false
            spacing: window.width/50
            x: (window.width-width)/2
            y: window.height/20
            Qaterial.OutlineTextField
                            {
                              id: eighth_text
                              width: window.width/1.5
                              title: "Електронна скринька користувача"
                              placeholderText: "Введіть сюди електронну скриньку користувач"
                              helperText: "Будьте уважними при вводі електронної скриньки користувача"
                              leadingIconInline: true
                              leadingIconSource: Qaterial.Icons.email
                              trailingInline: true
                              trailingVisible: true
                              trailingContent: Qaterial.TextFieldButtonContainer
                              {
                                 Qaterial.TextFieldAlertIcon {visible: eighth_text.errorState}
                              }
                            }
            Row
                                   {
                                       Qaterial.OutlineButton
                                       {
                                           text: "Виконати"
                                           enabled: !eighth_text.errorState&&eighth_text.length
                                           onClicked: () =>
                                                      {
                                                          if (!account_handler.checkEmailCorrectness(eighth_text.text))
                                                          eighth_text.setError("Електронна скринька має невірний формат!")
                                                          else account_handler.executeEighthQuery(eighth_text.text)
                                                      }
                                           }



                                       Qaterial.OutlineButton
                                       {
                                           text: "Повернутися"
                                           onClicked: () =>
                                           {
                                               eighth_query.visible=false
                                               eighth_text.clear()
                                               menu.visible=true
                                           }
                                       }
                                       Qaterial.RoundButton
                                           {
                                             id: eighth_tip
                                             icon.source: Qaterial.Icons.messageQuestion
                                           }
                                       Qaterial.ToolTip
                                             {
                                               text: "Знайти користувачів, які є партнерами більшій кількості гаманців, ніж вказаний користувач"
                                               visible: eighth_tip.hovered||
                                                        eighth_tip.pressed
                                             }
                                   }
            }
      Column
            {
            id: ninth_query
            visible: false
            spacing: window.width/50
            x: (window.width-width)/2
            y: window.height/20
            Qaterial.OutlineTextField
                            {
                              id: ninth_text
                              width: window.width/1.5
                              title: "Електронна скринька користувача"
                              placeholderText: "Введіть сюди електронну скриньку користувач"
                              helperText: "Будьте уважними при вводі електронної скриньки користувача"
                              leadingIconInline: true
                              leadingIconSource: Qaterial.Icons.email
                              trailingInline: true
                              trailingVisible: true
                              trailingContent: Qaterial.TextFieldButtonContainer
                              {
                                 Qaterial.TextFieldAlertIcon {visible: ninth_text.errorState}
                              }
                            }
            Row
                                   {
                                       Qaterial.OutlineButton
                                       {
                                           text: "Виконати"
                                           enabled: !ninth_text.errorState&&ninth_text.length
                                           onClicked: () =>
                                                      {
                                                          if (!account_handler.checkEmailCorrectness(ninth_text.text))
                                                          ninth_text.setError("Електронна скринька має невірний формат!")
                                                          else account_handler.executeNinthQuery(ninth_text.text)
                                                      }
                                           }



                                       Qaterial.OutlineButton
                                       {
                                           text: "Повернутися"
                                           onClicked: () =>
                                           {
                                               ninth_query.visible=false
                                               ninth_text.clear()
                                               menu.visible=true
                                           }
                                       }
                                       Qaterial.RoundButton
                                           {
                                             id: ninth_tip
                                             icon.source: Qaterial.Icons.messageQuestion
                                           }
                                       Qaterial.ToolTip
                                             {
                                               text: "Знайти користувачів, які витратили більше, ніж вказаний користувач"
                                               visible: ninth_tip.hovered||
                                                        ninth_tip.pressed
                                             }
                                   }
            }
}
