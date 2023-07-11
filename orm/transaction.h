#pragma once
#include "resources.h"
class Transaction
{
public:
Transaction() {}
virtual ~Transaction() {}
QString transaction_address=QString(66, Qt::Initialization::Uninitialized);
QString wallet_address=QString(42, Qt::Initialization::Uninitialized);
QString recipient_address=QString(42, Qt::Initialization::Uninitialized);
double amount;
QDateTime moment=QDateTime::currentDateTimeUtc();
int block_number;
};
QX_REGISTER_PRIMARY_KEY(Transaction, QString)
QX_REGISTER_HPP(Transaction, qx::trait::no_base_class_defined, 1)
