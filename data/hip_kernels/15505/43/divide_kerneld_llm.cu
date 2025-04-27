#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void divide_kerneld(double *v, double *other, int n) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate thread index
    if (x < n) {  // Only proceed if within bounds
        v[x] /= other[x];  // Element-wise division
    }
}