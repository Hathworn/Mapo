#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_N(float* N, const float* norm, int npix_per_component) {
    // Calculate global index for components and pixels
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int c = blockIdx.y; // Use blockIdx.y directly for components

    // Process only valid pixel indices
    if (i < npix_per_component) {
        // Compute linear index once for better performance
        int index = c * npix_per_component + i;
        N[index] = N[index] / norm[i];
    }
}