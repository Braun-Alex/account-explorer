#pragma once
#include "resources.h"
#include "wallet.h"
class User
{
public:
User() {}
virtual ~User() {}
QString email;
QString password;
};
QX_REGISTER_PRIMARY_KEY(User, QString)
QX_REGISTER_HPP(User, qx::trait::no_base_class_defined, 1)
