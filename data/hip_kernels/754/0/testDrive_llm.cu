#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int test()
{
    return 10;
}

__global__ void testDrive()
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use warp shuffle to reduce redundant calculations
    int lane = index % warpSize;
    int num;
    
    if (lane == 0) {
        num = test();
    }
    
    num = __shfl_sync(0xFFFFFFFF, num, 0);
    
    printf("index = %d, num = %d\n", index, num);
}