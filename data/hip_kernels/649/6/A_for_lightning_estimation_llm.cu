#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void A_for_lightning_estimation(float* rho, float* N, int npix, float* A) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize by removing redundant calculations
    int index = i + npix * (blockIdx.y + 4 * blockIdx.z); // Compute index outside the condition
    if (i < npix) {
        A[index] = rho[blockIdx.y * npix + i] * N[blockIdx.z * npix + i];  // Use precomputed index
    }
}