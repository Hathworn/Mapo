#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void abs_kernel(float *v, int n) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure valid index and use fast inline function for abs
    if (x < n) {
        v[x] = fabsf(v[x]);
    }
}