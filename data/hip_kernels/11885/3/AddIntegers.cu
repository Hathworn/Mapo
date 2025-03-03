#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AddIntegers(int *a, int *b)
{
a[0] += b[0];
}