#include "account_handler.h"
#include "resources.h"
Account_Handler::Account_Handler(QObject* parent): QObject(parent),
email_validator("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}") {}
bool Account_Handler::checkEmailCorrectness(const QString &email) const
{
return email_validator.match(email).hasMatch();
}
void Account_Handler::connectToDatabase(const QString &driver,
                                        const QString &database,
                                        const QString &user,
                                        const QString &host,
                                        int port,
                                        const QString &password) const
{
qx::QxSqlDatabase::getSingleton()->setDriverName(driver);
qx::QxSqlDatabase::getSingleton()->setDatabaseName(database);
qx::QxSqlDatabase::getSingleton()->setUserName(user);
qx::QxSqlDatabase::getSingleton()->setHostName(host);
qx::QxSqlDatabase::getSingleton()->setPort(port);
qx::QxSqlDatabase::getSingleton()->setPassword(password);
}
int Account_Handler::getScreenWidth() const
{
return QGuiApplication::primaryScreen()->geometry().width();
}
int Account_Handler::getScreenHeight() const
{
return QGuiApplication::primaryScreen()->geometry().height();
}
void Account_Handler::saveUser(const QString &email, const QString &password) const
{
User user;
user.email=email;
user.password=password;
qx::dao::save(user);
}
void Account_Handler::deleteUser(const QString &email) const
{
User user;
user.email=email;
qx::dao::destroy_by_id(user);
}
void Account_Handler::seeAllUsers()
{
file.setFileName(path);
file.open(QFile::WriteOnly);
file.write("<!DOCTYPE HTML>\n"
           "<html>\n"
           "<link rel=\"stylesheet\" href=\"Table.css\">\n"
           "<body>\n"
           "<table>\n");
file.write("<tr>\n");
for (const auto &header: users) file.write(QString("<th>"+header+"</th>\n").toUtf8());
file.write("</tr>\n");
std::vector<User> all_users;
qx::dao::fetch_all(all_users);
for (const auto &user: all_users)
{
file.write("<tr>\n");
file.write(QString("<td>"+user.email+"</td>\n"+
+"<td>"+user.password+"</td>\n").toUtf8());
file.write("</tr>\n");
}
file.write("</table>\n"
           "</body>\n"
           "</html>");
file.close();
QDesktopServices::openUrl(path);
}
void Account_Handler::saveWallet(const QString &wallet_address, const QString &private_key,
                            double balance, const QString &wallet_email) const
{
Wallet wallet;
wallet.wallet_address=wallet_address;
wallet.private_key=private_key;
wallet.balance=balance;
wallet.email=wallet_email;
qx::dao::save(wallet);
}
void Account_Handler::deleteWallet(const QString &wallet_address) const
{
Wallet wallet;
wallet.wallet_address=wallet_address;
qx::dao::destroy_by_id(wallet);
}
void Account_Handler::seeAllWallets()
{
file.setFileName(path);
file.open(QFile::WriteOnly);
file.write("<!DOCTYPE HTML>\n"
           "<html>\n"
           "<link rel=\"stylesheet\" href=\"Table.css\">\n"
           "<body>\n"
           "<table>\n");
file.write("<tr>\n");
for (const auto &header: wallets) file.write(QString("<th>"+header+"</th>\n").toUtf8());
    file.write("</tr>\n");
    std::vector<Wallet> all_wallets;
    qx::dao::fetch_all(all_wallets);
    for (const auto &wallet: all_wallets)
    {
    file.write("<tr>\n");
    file.write(QString("<td>"+wallet.wallet_address+"</td>\n"+
    "<td>"+wallet.private_key+"</td>\n"+
    "<td>"+QString::fromStdString(std::to_string(wallet.balance))+"</td>\n"+
    "<td>"+wallet.email+"</td>\n").toUtf8());
    file.write("</tr>\n");
    }
    file.write("</table>\n"
               "</body>\n"
               "</html>");
    file.close();
    QDesktopServices::openUrl(path);
}
void Account_Handler::saveTransaction(const QString &transaction_address,
                                 const QString &transaction_wallet_address,
                                 const QString &recipient_address,
                                 double amount,
                                 int transaction_block_number) const
{
Transaction transaction;
transaction.transaction_address=transaction_address;
transaction.wallet_address=transaction_wallet_address;
transaction.recipient_address=recipient_address;
transaction.amount=amount;
transaction.block_number=transaction_block_number;
qx::dao::save(transaction);
}
void Account_Handler::deleteTransaction(const QString &transaction_address) const
{
Transaction transaction;
transaction.transaction_address=transaction_address;
qx::dao::destroy_by_id(transaction);
}
void Account_Handler::seeAllTransactions()
{
    file.setFileName(path);
    file.open(QFile::WriteOnly);
    file.write("<!DOCTYPE HTML>\n"
               "<html>\n"
               "<link rel=\"stylesheet\" href=\"Table.css\">\n"
               "<body>\n"
               "<table>\n");
    file.write("<tr>\n");
    for (const auto &header: transactions) file.write(QString("<th>"+header+"</th>\n").toUtf8());
        file.write("</tr>\n");
        std::vector<Transaction> all_transactions;
        qx::dao::fetch_all(all_transactions);
        for (const auto &transaction: all_transactions)
        {
        file.write("<tr>\n");
        file.write(QString("<td>"+transaction.transaction_address+"</td>\n"+
        "<td>"+transaction.wallet_address+"</td>\n"+
        "<td>"+transaction.recipient_address+"</td>\n"+
        "<td>"+QString::fromStdString(std::to_string(transaction.amount))+"</td>\n"+
        "<td>"+transaction.moment.toString(Qt::DateFormat::ISODate)+"</td>\n"+
        "<td>"+QString::fromStdString(std::to_string(transaction.block_number))+
        "</td>\n").toUtf8());
        file.write("</tr>\n");
        }
        file.write("</table>\n"
                   "</body>\n"
                   "</html>");
        file.close();
        QDesktopServices::openUrl(path);
}
void Account_Handler::saveBlock(const QString &block_number,
                           const QString &miner_address,
                           double reward) const
{
Block block;
block.block_number=block_number;
block.miner_address=miner_address;
block.reward=reward;
qx::dao::save(block);
}
void Account_Handler::deleteBlock(const QString &block_number) const
{
Block block;
block.block_number=block_number;
qx::dao::destroy_by_id(block);
}
void Account_Handler::seeAllBlocks()
{
    file.setFileName(path);
    file.open(QFile::WriteOnly);
    file.write("<!DOCTYPE HTML>\n"
               "<html>\n"
               "<link rel=\"stylesheet\" href=\"Table.css\">\n"
               "<body>\n"
               "<table>\n");
    file.write("<tr>\n");
    for (const auto &header: blocks) file.write(QString("<th>"+header+"</th>\n").toUtf8());
        file.write("</tr>\n");
        std::vector<Block> all_blocks;
        qx::dao::fetch_all(all_blocks);
        for (const auto &block: all_blocks)
        {
        file.write("<tr>\n");
        file.write(QString("<td>"+block.block_number+"</td>\n"+
        "<td>"+block.miner_address+"</td>\n"+
        "<td>"+block.moment.toString(Qt::DateFormat::ISODate)+"</td>\n"+
        "<td>"+QString::fromStdString(std::to_string(block.reward))+
        "</td>\n").toUtf8());
        file.write("</tr>\n");
        }
        file.write("</table>\n"
                   "</body>\n"
                   "</html>");
        file.close();
        QDesktopServices::openUrl(path);
}
void Account_Handler::saveApprovedUser(const QString &approved_email,
                                  const QString &email,
                                  const QString &approved_wallet_address) const
{
Approved_User approved_user;
approved_user.approved_email=approved_email;
approved_user.email=email;
approved_user.wallet_address=approved_wallet_address;
qx::dao::save(approved_user);
}
void Account_Handler::deleteApprovedUser(const QString &approved_email) const
{
Approved_User approved_user;
approved_user.approved_email=approved_email;
qx_query query("WHERE approved_users.approved_email = '"+approved_email+"'");
qx::dao::destroy_by_query<Approved_User>(query);
}
void Account_Handler::seeAllApprovedUsers()
{
    file.setFileName(path);
    file.open(QFile::WriteOnly);
    file.write("<!DOCTYPE HTML>\n"
               "<html>\n"
               "<link rel=\"stylesheet\" href=\"Table.css\">\n"
               "<body>\n"
               "<table>\n");
    file.write("<tr>\n");
    for (const auto &header: approved_users) file.write(QString("<th>"+header+"</th>\n").toUtf8());
        file.write("</tr>\n");
        std::vector<Approved_User> all_approved_users;
        qx::dao::fetch_all(all_approved_users);
        for (const auto &approved_user: all_approved_users)
        {
        file.write("<tr>\n");
        file.write(QString("<td>"+approved_user.approved_email+"</td>\n"+
        "<td>"+approved_user.email+"</td>\n"+
        "<td>"+approved_user.wallet_address+"</td>\n").toUtf8());
        file.write("</tr>\n");
        }
        file.write("</table>\n"
                   "</body>\n"
                   "</html>");
        file.close();
        QDesktopServices::openUrl(path);
}
void Account_Handler::openUrl(const QString &url) const
{
QDesktopServices::openUrl(url);
}
void Account_Handler::executeFirstQuery(double entered_balance)
{
file.setFileName(path);
file.open(QFile::WriteOnly);
file.write("<!DOCTYPE HTML>\n"
           "<html>\n"
           "<link rel=\"stylesheet\" href=\"Table.css\">\n"
           "<body>\n"
           "<table>\n");
file.write("<tr>\n");
file.write(QString("<th>Електронна скринька користувача</th>\n").toUtf8());
    file.write("</tr>\n");
    std::vector<User> users;
    qx_query first_query("SELECT DISTINCT users.email FROM users "
                         "INNER JOIN wallets ON wallets.email = "
                         "users.email "
                         "WHERE wallets.balance >= "+
                         QString::fromStdString(std::to_string(entered_balance)));
    qx::dao::execute_query(first_query, users);
    for (const auto &user: users)
    {
    file.write("<tr>\n");
    file.write(QString("<td>"+user.email+"</td>\n").toUtf8());
    file.write("</tr>\n");
    }
    file.write("</table>\n"
               "</body>\n"
               "</html>");
    file.close();
    QDesktopServices::openUrl(path);
}
void Account_Handler::executeSecondQuery(const QString &entered_wallet_address,
                                         double entered_sum)
{
    file.setFileName(path);
    file.open(QFile::WriteOnly);
    file.write("<!DOCTYPE HTML>\n"
               "<html>\n"
               "<link rel=\"stylesheet\" href=\"Table.css\">\n"
               "<body>\n"
               "<table>\n");
    file.write("<tr>\n");
    file.write(QString("<th>Електронна скринька партнера</th>\n").toUtf8());
        file.write("</tr>\n");
        std::vector<Approved_User> approved_users;
        qx_query second_query("SELECT approved_users.approved_email "
                              "FROM approved_users INNER JOIN wallets "
                              "ON approved_users.approved_email = wallets.email "
                              "WHERE approved_users.wallet_address = '"+
                              entered_wallet_address+
                              "' GROUP BY approved_users.approved_email "
                              "HAVING SUM(wallets.balance) >= "+
                              QString::fromStdString(std::to_string(entered_sum)));
        qx::dao::execute_query(second_query, approved_users);
        for (const auto &approved_user: approved_users)
        {
        file.write("<tr>\n");
        file.write(QString("<td>"+approved_user.approved_email+"</td>\n").toUtf8());
        file.write("</tr>\n");
        }
        file.write("</table>\n"
                   "</body>\n"
                   "</html>");
        file.close();
        QDesktopServices::openUrl(path);
}
void Account_Handler::executeThirstQuery(const QString &entered_email,
                                         int entered_count_of_transactions)
{
    file.setFileName(path);
    file.open(QFile::WriteOnly);
    file.write("<!DOCTYPE HTML>\n"
               "<html>\n"
               "<link rel=\"stylesheet\" href=\"Table.css\">\n"
               "<body>\n"
               "<table>\n");
    file.write("<tr>\n");
    file.write(QString("<th>Адреса гаманця користувача</th>\n"
                       "<th>Баланс гаманця користувача</th>\n").toUtf8());
        file.write("</tr>\n");
        std::vector<Wallet> wallets;
        qx_query thirst_query("SELECT wallets.wallet_address, wallets.balance "
                              "FROM wallets INNER JOIN transactions "
                              "ON wallets.wallet_address = transactions.wallet_address "
                              "WHERE wallets.email = '"+
                              entered_email+
                              "' GROUP BY wallets.wallet_address "
                              "HAVING COUNT(transactions.wallet_address) >= "+
                              QString::fromStdString(std::to_string(
                              entered_count_of_transactions)));
        qx::dao::execute_query(thirst_query, wallets);
        for (const auto &wallet: wallets)
        {
        file.write("<tr>\n");
        file.write(QString("<td>"+wallet.wallet_address+"</td>\n"+
                           "<td>"+QString::fromStdString(
                               std::to_string(wallet.balance))+"</td>\n").toUtf8());
        file.write("</tr>\n");
        }
        file.write("</table>\n"
                   "</body>\n"
                   "</html>");
        file.close();
        QDesktopServices::openUrl(path);
}
void Account_Handler::executeFourthQuery(int entered_count_of_approved_users,
                                    double entered_balance)
{
    file.setFileName(path);
    file.open(QFile::WriteOnly);
    file.write("<!DOCTYPE HTML>\n"
               "<html>\n"
               "<link rel=\"stylesheet\" href=\"Table.css\">\n"
               "<body>\n"
               "<table>\n");
    file.write("<tr>\n");
    file.write(QString("<th>Адреса гаманця власника</th>\n"
                       "<th>Електронна скринька власника гаманця</th>\n").toUtf8());
        file.write("</tr>\n");
        std::vector<Wallet> wallets;
        qx_query fourth_query("SELECT wallets.wallet_address, wallets.email "
                              "FROM wallets INNER JOIN approved_users "
                              "ON wallets.wallet_address = approved_users.wallet_address "
                              "WHERE wallets.balance >= "+
                              QString::fromStdString(std::to_string(entered_balance))+
                              " GROUP BY wallets.wallet_address "
                              "HAVING COUNT(approved_users.wallet_address) >= "
                              +QString::fromStdString(std::to_string(
                              entered_count_of_approved_users)));
        qx::dao::execute_query(fourth_query, wallets);
        for (const auto &wallet: wallets)
        {
        file.write("<tr>\n");
        file.write(QString("<td>"+wallet.wallet_address+"</td>\n"+
                           "<td>"+wallet.email+"</td>\n").toUtf8());
        file.write("</tr>\n");
        }
        file.write("</table>\n"
                   "</body>\n"
                   "</html>");
        file.close();
        QDesktopServices::openUrl(path);
}
void Account_Handler::executeFifthQuery(const QString &entered_email,
                                        int entered_password_length)
{
    file.setFileName(path);
    file.open(QFile::WriteOnly);
    file.write("<!DOCTYPE HTML>\n"
               "<html>\n"
               "<link rel=\"stylesheet\" href=\"Table.css\">\n"
               "<body>\n"
               "<table>\n");
    file.write("<tr>\n");
    file.write(QString("<th>Електронна скринька партнера</th>\n").toUtf8());
        file.write("</tr>\n");
        std::vector<Approved_User> approved_users;
        qx_query fifth_query("SELECT approved_users.approved_email "
                              "FROM approved_users INNER JOIN users "
                              "ON approved_users.approved_email = users.email "
                              "WHERE approved_users.email = '"+
                              entered_email+
                              "' GROUP BY approved_users.approved_email, users.password "
                              "HAVING LENGTH(users.password) >= "+
                              QString::fromStdString(std::to_string(
                              entered_password_length)));
        qx::dao::execute_query(fifth_query, approved_users);
        for (const auto &approved_user: approved_users)
        {
        file.write("<tr>\n");
        file.write(QString("<td>"+approved_user.approved_email+"</td>\n").toUtf8());
        file.write("</tr>\n");
        }
        file.write("</table>\n"
                   "</body>\n"
                   "</html>");
        file.close();
        QDesktopServices::openUrl(path);
}
void Account_Handler::executeSixthQuery(double entered_sum)
{
    file.setFileName(path);
    file.open(QFile::WriteOnly);
    file.write("<!DOCTYPE HTML>\n"
               "<html>\n"
               "<link rel=\"stylesheet\" href=\"Table.css\">\n"
               "<body>\n"
               "<table>\n");
    file.write("<tr>\n");
    file.write(QString("<th>Електронна скринька майнера</th>\n").toUtf8());
        file.write("</tr>\n");
        std::vector<User> users;
        qx_query sixth_query("SELECT wallets.email FROM wallets "
                             "INNER JOIN blocks "
                             "ON wallets.wallet_address = blocks.miner_address "
                             "GROUP BY wallets.email "
                             "HAVING SUM(blocks.reward) >= "+
                             QString::fromStdString(std::to_string(entered_sum)));
        qx::dao::execute_query(sixth_query, users);
        for (const auto &user: users)
        {
        file.write("<tr>\n");
        file.write(QString("<td>"+user.email+"</td>\n").toUtf8());
        file.write("</tr>\n");
        }
        file.write("</table>\n"
                   "</body>\n"
                   "</html>");
        file.close();
        QDesktopServices::openUrl(path);
}
void Account_Handler::executeSeventhQuery(const QString &entered_wallet_address,
                                          double entered_balance)
{
    file.setFileName(path);
    file.open(QFile::WriteOnly);
    file.write("<!DOCTYPE HTML>\n"
               "<html>\n"
               "<link rel=\"stylesheet\" href=\"Table.css\">\n"
               "<body>\n"
               "<table>\n");
    file.write("<tr>\n");
    file.write(QString("<th>Адреса гаманця</th>\n").toUtf8());
        file.write("</tr>\n");
        std::vector<Wallet> wallets;
        qx_query seventh_query("SELECT wallets.wallet_address FROM wallets "
                               "WHERE wallets.balance >= "+
                               QString::fromStdString(std::to_string(entered_balance))+
                               " AND wallets.wallet_address != '"+
                               entered_wallet_address+
                               "' AND NOT EXISTS ("
                               "SELECT * FROM transactions "
                               "WHERE transactions.wallet_address = '"+
                               entered_wallet_address+
                               "' AND transactions.recipient_address NOT IN "
                               "(SELECT transactions.recipient_address "
                               "FROM transactions "
                               "WHERE transactions.wallet_address = wallets.wallet_address))");
        qx::dao::execute_query(seventh_query, wallets);
        for (const auto &wallet: wallets)
        {
        file.write("<tr>\n");
        file.write(QString("<td>"+wallet.wallet_address+"</td>\n").toUtf8());
        file.write("</tr>\n");
        }
        file.write("</table>\n"
                   "</body>\n"
                   "</html>");
        file.close();
        QDesktopServices::openUrl(path);
}
void Account_Handler::executeEighthQuery(const QString &entered_email)
{
    file.setFileName(path);
    file.open(QFile::WriteOnly);
    file.write("<!DOCTYPE HTML>\n"
               "<html>\n"
               "<link rel=\"stylesheet\" href=\"Table.css\">\n"
               "<body>\n"
               "<table>\n");
    file.write("<tr>\n");
    file.write(QString("<th>Електронна скринька партнера</th>\n").toUtf8());
        file.write("</tr>\n");
        std::vector<Approved_User> approved_users;
        qx_query eighth_query("SELECT approved_users.approved_email "
                               "FROM approved_users "
                               "GROUP BY approved_users.approved_email "
                               "HAVING COUNT(approved_users.wallet_address)>"
                               "(SELECT COUNT(approved_users.wallet_address) "
                               "FROM approved_users "
                               "WHERE approved_users.approved_email = '"+
                               entered_email+"')");
        qx::dao::execute_query(eighth_query, approved_users);
        for (const auto &approved_user: approved_users)
        {
        file.write("<tr>\n");
        file.write(QString("<td>"+approved_user.approved_email+"</td>\n").toUtf8());
        file.write("</tr>\n");
        }
        file.write("</table>\n"
                   "</body>\n"
                   "</html>");
        file.close();
        QDesktopServices::openUrl(path);
}
void Account_Handler::executeNinthQuery(const QString &entered_email)
{
    file.setFileName(path);
    file.open(QFile::WriteOnly);
    file.write("<!DOCTYPE HTML>\n"
               "<html>\n"
               "<link rel=\"stylesheet\" href=\"Table.css\">\n"
               "<body>\n"
               "<table>\n");
    file.write("<tr>\n");
    file.write(QString("<th>Електронна скринька користувача</th>\n").toUtf8());
        file.write("</tr>\n");
        std::vector<Wallet> wallets;
        qx_query ninth_query("SELECT wallets.email FROM wallets "
                             "GROUP BY wallets.email "
                             "HAVING SUM(wallets.balance)>"
                             "(SELECT SUM(wallets.balance) "
                             "FROM wallets "
                             "WHERE wallets.email = '"+
                             entered_email+"')");
        qx::dao::execute_query(ninth_query, wallets);
        for (const auto &wallet: wallets)
        {
        file.write("<tr>\n");
        file.write(QString("<td>"+wallet.email+"</td>\n").toUtf8());
        file.write("</tr>\n");
        }
        file.write("</table>\n"
                   "</body>\n"
                   "</html>");
        file.close();
        QDesktopServices::openUrl(path);
}
