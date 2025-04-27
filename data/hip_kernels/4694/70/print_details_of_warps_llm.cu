#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_details_of_warps() 
{
    // Compute global thread ID
    int gid = blockIdx.y * gridDim.x * blockDim.x
            + blockIdx.x * blockDim.x + threadIdx.x;

    // Efficiently calculate warp ID within block
    int warp_id = threadIdx.x >> 5;  // Equivalent to threadIdx.x / 32 using bitshift

    int gbid = blockIdx.y * gridDim.x + blockIdx.x;

    // Reduce printf frequency by only letting one thread per warp print
    if (threadIdx.x % 32 == 0) {
        printf("tid : %d, bid.x : %d, bid.y : %d, gid : %d, warp_id : %d, gbid : %d \n",
               threadIdx.x, blockIdx.x, blockIdx.y, gid, warp_id, gbid);
    }
}