#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int test()
{
    return 10;
}

__global__ void testDrive()
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Load device function result into shared memory for reuse
    __shared__ int num;
    if (threadIdx.x == 0)
    {
        num = test();
    }
    __syncthreads();

    printf("%d\n", index);
    printf("num = %d\n", num);
}