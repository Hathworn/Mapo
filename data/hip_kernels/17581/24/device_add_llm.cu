#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_add(int* a, int* b, int* c)
{
    // Optimize index calculation by using a register variable
    register int index = threadIdx.x + blockIdx.x * blockDim.x;

    // Use prefetch for a and b to improve memory access
    register int val_a = __ldg(&a[index]);
    register int val_b = __ldg(&b[index]);

    // Store the result directly
    c[index] = val_a + val_b;
}