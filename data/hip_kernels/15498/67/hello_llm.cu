```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use shared memory for potential shared data, if needed in future
    __shared__ int sharedData; 

    // Minimize printf calls by using thread 0 of each block
    if (threadIdx.x == 0)
    {
        printf("Hello world! I'm a thread in block %d\n", blockIdx.x);
    }
}