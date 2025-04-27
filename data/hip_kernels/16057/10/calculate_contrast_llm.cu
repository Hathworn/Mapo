#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_contrast(float *norm, float *contrast, int *dif, int max, float sum, int size) {
    // Calculate global index
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * max + ix;
    int tid = threadIdx.x;

    // Return if index is out of bounds
    if (idx >= max * max) return;

    // Perform element-wise multiplication and store results in contrast array
    if (idx < size) {
        contrast[idx] = norm[idx] * dif[idx];
    }

    // Perform in-place reduction within each block
    for (int stride = 1; stride < max; stride *= 2) {
        // Ensure active threads only
        if ((tid % (2 * stride)) == 0 && (idx + stride) < size) {
            contrast[idx] += contrast[idx + stride];
        }
        __syncthreads();  // Synchronize within threadblock
    }

    // Print result at the first element of the array
    if (idx == 0) {
        printf("Contrast: %f\n", contrast[0]);
    }
}