#pragma once
#include "resources.h"
#include "transaction.h"
class Block
{
public:
Block() {}
virtual ~Block() {}
QString block_number;
QString miner_address=QString(42, Qt::Initialization::Uninitialized);
QDateTime moment=QDateTime::currentDateTimeUtc();
double reward;
};
QX_REGISTER_PRIMARY_KEY(Block, QString)
QX_REGISTER_HPP(Block, qx::trait::no_base_class_defined, 1)
