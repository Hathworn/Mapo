#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void finalise(const int x_inner, const int y_inner, const int halo_depth, const double* __restrict__ density, const double* __restrict__ u, double* __restrict__ energy)
{
    // Compute unique thread index for flattened 2D grid
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if thread is within bounds
    if (gid < x_inner * y_inner) {
        // Precompute constants outside loops for efficiency
        const int x = x_inner + 2 * halo_depth;
        const int off0 = halo_depth * (x + 1);
        
        // Determine 2D position within the block
        const int col = gid % x_inner;
        const int row = gid / x_inner;
        
        // Calculate global memory index
        const int index = off0 + col + row * x;

        // Finalize energy computation
        energy[index] = u[index] / density[index];
    }
}