#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void glcm_calculation_270(int *A, int *glcm, const int nx, const int ny, int max) {
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * nx + ix;

    if (ix < nx && iy < ny - 1) {  // Ensure thread operates within bounds
        int k = max * A[idx] + A[idx + nx]; // Calculate the glcm index
        atomicAdd(&glcm[k], 1); // Atomic update to glcm
    }
}