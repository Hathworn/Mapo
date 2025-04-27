#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kernel(float *v, int n, float e) {
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    if (x < n) {
        // Use fast math intrinsic for power operation if applicable
        v[x] = powf(v[x], e);
    }
}