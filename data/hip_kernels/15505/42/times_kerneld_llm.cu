#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void times_kerneld(double * __restrict__ v, const double * __restrict__ other, int n) {
    // Calculate global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundary condition and perform multiplication
    if (x < n) {
        v[x] *= other[x];
    }
}