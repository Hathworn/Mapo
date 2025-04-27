#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void norm_components(float* N, int npix, float* norm) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds
    if (i < npix) {
        // Load values into registers to reduce memory access
        float Nx = N[i];
        float Ny = N[npix + i];
        float Nz = N[npix * 2 + i];

        // Compute norm and store result
        norm[i] = fmaxf(1e-10, sqrtf(Nx * Nx + Ny * Ny + Nz * Nz));
    }
}