#pragma once
#include "resources.h"
#include "transaction.h"
#include "approved_user.h"
class Wallet
{
public:
Wallet() {}
virtual ~Wallet() {}
QString wallet_address=QString(42, Qt::Initialization::Uninitialized);
QString private_key;
double balance=0.0;
QString email;
};
QX_REGISTER_PRIMARY_KEY(Wallet, QString)
QX_REGISTER_HPP(Wallet, qx::trait::no_base_class_defined, 1)
