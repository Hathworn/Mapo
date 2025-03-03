#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void hello()
{
printf("Hello from Thread %d in block %d\n", threadIdx.x, blockIdx.x);
}