#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(float *c, float* a, float *b, int values) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < values) {
        c[i] = a[i] + b[i]; // Perform element-wise addition for valid indices
    }
    // Removed unnecessary debugging print statement for cleaner code
}