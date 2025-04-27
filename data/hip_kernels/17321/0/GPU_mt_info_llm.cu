#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void GPU_mt_info()
{
    // Cache block and thread indices to reduce repeated accesses
    int block_index = blockIdx.x;
    int thread_index = threadIdx.x;

    printf("Block idx: %d | thread idx: %d\n", block_index, thread_index);
}