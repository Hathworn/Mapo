#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void times_kernel(float *v, float *other, int n) {
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    if (x < n) {
        v[x] *= other[x];
    }
}