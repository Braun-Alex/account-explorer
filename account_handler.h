#pragma once
#include "orm/user.h"
#include "orm/wallet.h"
#include "orm/transaction.h"
#include "orm/block.h"
#include "orm/approved_user.h"
#include <QGuiApplication>
#include <QScreen>
#include <QFile>
#include <QDesktopServices>
#include <vector>
class Account_Handler: public QObject
{
Q_OBJECT
public:
explicit Account_Handler(QObject* parent=nullptr);
Q_INVOKABLE bool checkEmailCorrectness(const QString &email) const;
Q_INVOKABLE void connectToDatabase(const QString &driver,
                                   const QString &database,
                                   const QString &user,
                                   const QString &host,
                                   int port,
                                   const QString &password) const;
Q_INVOKABLE int getScreenWidth() const;
Q_INVOKABLE int getScreenHeight() const;
Q_INVOKABLE void saveUser(const QString &email, const QString &password) const;
Q_INVOKABLE void deleteUser(const QString &email) const;
Q_INVOKABLE void seeAllUsers();
Q_INVOKABLE void saveWallet(const QString &wallet_address, const QString &private_key,
                            double balance, const QString &wallet_email) const;
Q_INVOKABLE void deleteWallet(const QString &wallet_address) const;
Q_INVOKABLE void seeAllWallets();
Q_INVOKABLE void saveTransaction(const QString &transaction_address,
                                 const QString &transaction_wallet_address,
                                 const QString &recipient_address,
                                 double amount,
                                 int transaction_block_number) const;
Q_INVOKABLE void deleteTransaction(const QString &transaction_address) const;
Q_INVOKABLE void seeAllTransactions();
Q_INVOKABLE void saveBlock(const QString &block_number,
                           const QString &miner_address,
                           double reward) const;
Q_INVOKABLE void deleteBlock(const QString &block_number) const;
Q_INVOKABLE void seeAllBlocks();
Q_INVOKABLE void saveApprovedUser(const QString &approved_email,
                                  const QString &email,
                                  const QString &approved_wallet_address) const;
Q_INVOKABLE void deleteApprovedUser(const QString &approved_email) const;
Q_INVOKABLE void seeAllApprovedUsers();
Q_INVOKABLE void openUrl(const QString &url) const;
Q_INVOKABLE void executeFirstQuery(double entered_balance);
Q_INVOKABLE void executeSecondQuery(const QString &entered_wallet_address,
                                    double entered_sum);
Q_INVOKABLE void executeThirstQuery(const QString &entered_email,
                                    int entered_count_of_transactions);
Q_INVOKABLE void executeFourthQuery(int entered_count_of_approved_users,
                                    double entered_balance);
Q_INVOKABLE void executeFifthQuery(const QString &entered_email,
                                   int entered_password_length);
Q_INVOKABLE void executeSixthQuery(double entered_sum);
Q_INVOKABLE void executeSeventhQuery(const QString &entered_wallet_address,
                                     double entered_balance);
Q_INVOKABLE void executeEighthQuery(const QString &entered_email);
Q_INVOKABLE void executeNinthQuery(const QString &entered_email);
private:
QRegularExpression email_validator;
std::vector<QString> users={"Електронна скринька користувача", "Пароль користувача"},
wallets={"Адреса гаманця", "Приватний ключ гаманця", "Баланс", "Електронна скринька"},
transactions={"Адреса транзакції", "Адреса відправника", "Адреса отримувача",
              "Сума переказу", "Момент", "Номер блоку транзакції"},
blocks={"Номер блоку", "Адреса майнера", "Момент", "Сума винагороди"},
approved_users={"Електронна скринька партнера", "Електронна скринька власника",
                "Адреса довіреного гаманця"};
QString path="C:/Users/Lamaba/Desktop/executed_query.html";
QFile file;
};
