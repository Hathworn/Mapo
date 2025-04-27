#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initialize_rho(float* rho, int size_c, int nc) {
    // Use a flattened 2D grid-to-thread mapping for better coalescing
    int index = blockIdx.y * size_c + blockIdx.x * blockDim.x + threadIdx.x;
    if (index < size_c * nc) {
        rho[index] = 0.5f;
    }
}