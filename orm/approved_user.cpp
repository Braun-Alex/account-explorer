#include "approved_user.h"
QX_REGISTER_CPP(Approved_User)
namespace qx
{
    template <> void register_class(QxClass<Approved_User> &approved_user)
    {
        approved_user.setName("approved_users");
        approved_user.data(&Approved_User::approved_email, "approved_email");
        approved_user.data(&Approved_User::email, "email");
        approved_user.data(&Approved_User::wallet_address, "wallet_address");
    }
}
