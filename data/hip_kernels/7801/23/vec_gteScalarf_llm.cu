#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for comparing each element of vector x with scalar y
__global__ void vec_gteScalarf(size_t n, float *result, float *x, float y) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Use strided access to improve global memory usage
    for (int i = id; i < n; i += blockDim.x * gridDim.x) {
        result[i] = (x[i] >= y) ? 1.0f : 0.0f;
    }
}