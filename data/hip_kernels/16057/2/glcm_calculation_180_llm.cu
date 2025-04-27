#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void glcm_calculation_180(int *A, int *glcm, const int nx, const int ny, int max) {
    // Use threadIdx.x and blockIdx.x to compute the unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = gridDim.x * blockDim.x;

    // Iterate over the entire array with stride equal to total number of threads
    for (int i = idx; i < (nx * ny) - 1; i += totalThreads) {
        if ((i + 1) % nx != 0) { // Ensure we're not crossing row boundary
            int k = max * A[i + 1] + A[i];
            atomicAdd(&glcm[k], 1); // Use atomic operation for thread safety
        }
    }
}