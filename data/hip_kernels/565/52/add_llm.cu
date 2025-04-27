#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Load inputs into registers for faster access
    int reg_a = a[index];
    int reg_b = b[index];
    
    // Perform addition using registers and store the result in global memory
    c[index] = reg_a + reg_b;
}