#include "hip/hip_runtime.h"
#include "includes.h"

//=== Vector math (one argument) =============================================

__global__ void vec_coshf(size_t n, float *result, float *x) {
    // Using strided loop for better occupancy
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;
    for (int i = id; i < n; i += stride) {
        // Replace coshf with __cosf for potential performance boost
        result[i] = __coshf(x[i]);
    }
}