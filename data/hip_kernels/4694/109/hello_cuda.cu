#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void hello_cuda()
{
printf("Hello CUDA world \n");
}