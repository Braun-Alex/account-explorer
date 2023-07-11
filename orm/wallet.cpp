#include "wallet.h"
QX_REGISTER_CPP(Wallet)
namespace qx
{
template <> void register_class(QxClass<Wallet> &wallet)
{
  wallet.setName("wallets");
  wallet.id(&Wallet::wallet_address, "wallet_address");
  wallet.data(&Wallet::private_key, "private_key");
  wallet.data(&Wallet::balance, "balance");
  wallet.data(&Wallet::email, "email");
}
}
