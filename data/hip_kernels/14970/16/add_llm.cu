#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    // Using thread index to allow for processing more elements if needed
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Assuming the number of threads handle processing each element
    c[index] = a[index] + b[index];
}