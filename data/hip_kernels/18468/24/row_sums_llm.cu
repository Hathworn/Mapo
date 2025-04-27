#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void row_sums(const float *A, float *sums, size_t ds) {
    int idx = threadIdx.x + blockDim.x * blockIdx.x; // Create 1D thread index
    if (idx < ds) {
        float sum = 0.0f;
        const float *row = A + idx * ds; // Optimize access by calculating row start pointer
        for (size_t i = 0; i < ds; i++) {
            sum += row[i]; // Access elements using row pointer
        }
        sums[idx] = sum; // Store the sum in output
    }
}