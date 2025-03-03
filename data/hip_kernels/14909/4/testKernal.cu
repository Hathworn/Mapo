#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void testKernal()
{
printf("thread number %d\n",threadIdx.x);
}