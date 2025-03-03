#include "hip/hip_runtime.h"
#include "includes.h"


__global__ void AddIntsCUDA(int *a, int *b) //Kernel Definition
{
*a = *a + *b;
}