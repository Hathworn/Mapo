#include "hip/hip_runtime.h"
#include "includes.h"



__global__ void HelloFromGPU(void)
{
printf("Hello World From GPU!\n");
}