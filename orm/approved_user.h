#pragma once
#include "resources.h"
#include "wallet.h"
class Approved_User
{
public:
Approved_User() {}
virtual ~Approved_User() {}
QString approved_email;
QString email;
QString wallet_address=QString(42, Qt::Initialization::Uninitialized);
};
QX_REGISTER_HPP(Approved_User, qx::trait::no_base_class_defined, 1)
