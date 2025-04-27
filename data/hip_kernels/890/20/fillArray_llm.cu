#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fillArray(int8_t *dest, int loop) {
    const size_t i = blockDim.x * blockIdx.x + threadIdx.x;
    const size_t stride = blockDim.x * gridDim.x; // Use a more descriptive variable name for clarity

    float sineValue; // Precompute the sine function value to reduce redundant calculations
    for (int n = 0; n < loop; n++) {
        size_t index = i + n * stride; // Compute index only once per loop iteration
        sineValue = sin(index / 100.0f); // Use 100.0f for float precision
        dest[index] = sineValue * 30;
    }
}