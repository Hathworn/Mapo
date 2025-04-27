#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello()
{
    // Use threadIdx.x to identify individual threads within a block for detailed output
    printf("Hello world! I'm thread %d in block %d\n", threadIdx.x, blockIdx.x);
}