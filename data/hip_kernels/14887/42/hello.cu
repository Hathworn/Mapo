#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void hello()
{
printf("Hello world! I'm a thread in block %d\n", blockIdx.x);
}