#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_mul_kernel(const float *data_a, const float *data_b, float *output, int n) {
    // Calculate the global index
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;  // Calculate stride for grid-stride loop

    // Use grid-stride loop for better performance on large arrays
    for (int i = index; i < n; i += stride) {
        output[i] = data_a[i] * data_b[i];
    }
}