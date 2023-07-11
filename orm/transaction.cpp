#include "transaction.h"
QX_REGISTER_CPP(Transaction)
namespace qx
{
    template <> void register_class(QxClass<Transaction> &transaction)
    {
        transaction.setName("transactions");
        transaction.id(&Transaction::transaction_address, "transaction_address");
        transaction.data(&Transaction::wallet_address, "wallet_address");
        transaction.data(&Transaction::recipient_address, "recipient_address");
        transaction.data(&Transaction::amount, "amount");
        transaction.data(&Transaction::moment, "moment");
        transaction.data(&Transaction::block_number, "block_number");
    }
}