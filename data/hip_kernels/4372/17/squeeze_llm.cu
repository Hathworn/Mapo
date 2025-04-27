#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void squeeze(float *B, int dim, int length, float L, float M) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Compute actual global index
    int actualIndex = index + length;
    if (actualIndex < length + dim) {
        // Avoid repeated computation of -1 * L
        float tmp = -L * (B[actualIndex] - M);
        B[actualIndex] = 1 / (1 + expf(tmp));
    }
}