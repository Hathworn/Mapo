#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mem_trs_test2(int * input, int size)
{
    int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Limit work to threads within grid size
    if (gid < size) {
        // Use threadfence to ensure memory visibility
        __threadfence();

        // Efficient conditional logging
        printf("tid : %d , gid : %d, value : %d \n", threadIdx.x, gid, input[gid]);
    }
}