#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAddGPU(const double * __restrict__ a, const double * __restrict__ b, double * __restrict__ c, int n) {
    // Use shared memory and pointer restrict qualifiers for performance
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    if (id < n) {
        c[id] = a[id] + b[id];
    }
}