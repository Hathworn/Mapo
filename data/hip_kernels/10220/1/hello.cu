#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void hello()
{
printf("Hello world! blcokid: %d\nthreadid:%d\n", blockIdx.x, threadIdx.x);
}