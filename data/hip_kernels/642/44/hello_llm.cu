#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use threadIdx.x to display the thread ID along with the block ID
    printf("Hello world! I'm thread %d in block %d\n", threadIdx.x, blockIdx.x);
}