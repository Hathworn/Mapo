```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void suma(int a, int b, int *c) {
    // Use shared memory if possible to store intermediates
    // Calculate thread index for efficiency
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    // Perform operation based on calculated index
    if (index == 0) {
        *c = a + b;
    }
}