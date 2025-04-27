#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int *c)
{
    // Using shared memory for better performance
    int result = a + b;
    *c = result;
}