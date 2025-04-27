#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void glcm_calculation_315(int *A, int *glcm, const int nx, const int ny, int max) {
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * nx + ix;

    if (ix < nx - 1 && iy < ny - 1) { // Limit access to valid indices
        int k = max * A[idx] + A[idx + nx + 1]; // Calculate index for glcm
        atomicAdd(&glcm[k], 1); // Atomic addition to prevent race conditions
    }
}