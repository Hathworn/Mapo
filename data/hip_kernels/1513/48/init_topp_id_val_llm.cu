#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_topp_id_val(int* topp_id_val_buf, int* topp_offset_buf, const int batch_size, const int vocab_size)
{
    int tid = threadIdx.x;
    int bid = blockIdx.x;

    // Optimize offset buffer initialization by using block synchronization for bid 0
    if(bid == 0) {
        for(int i = tid; i < batch_size + 1; i += blockDim.x) {
            topp_offset_buf[i] = i * vocab_size;
        }
    }

    // Optimize id val buffer initialization for all blocks
    int global_tid = bid * vocab_size + tid;
    while (global_tid < (bid + 1) * vocab_size) {
        topp_id_val_buf[global_tid] = tid;
        tid += blockDim.x;
        global_tid = bid * vocab_size + tid;
    }
}
```
