#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel to handle more iterations per thread for reduced grid launching overhead
__global__ void add(const float *a, const float *b, float *c, int n) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;  // Calculate stride to cover entire array

    // Iterate over all elements in the array with current thread's stride
    for (int i = idx; i < n; i += stride) {
        c[i] = a[i] + b[i];
    }
}