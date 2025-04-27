#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(std::size_t n, const float *x, float *y) {
    std::size_t index = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global index
    std::size_t stride = blockDim.x * gridDim.x;                // Calculate grid stride

    if (index < n) {                                            // Ensure index within bounds
        y[index] = x[index] + y[index];                         // Perform addition
        index += stride;
    }
}