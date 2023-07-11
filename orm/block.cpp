#include "block.h"
QX_REGISTER_CPP(Block)
namespace qx
{
    template <> void register_class(QxClass<Block> &block)
    {
        block.setName("blocks");
        block.id(&Block::block_number, "block_number");
        block.data(&Block::miner_address, "miner_address");
        block.data(&Block::moment, "moment");
        block.data(&Block::reward, "reward");
    }
}
