#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ppcg_init(const int x_inner, const int y_inner, const int halo_depth, const double theta, const double* r, double* sd)
{
    // Calculate global thread index
    const int gid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Early return if gid is out of bounds
    if (gid >= x_inner * y_inner) return;
    
    // Calculate x dimension including halos
    const int x = x_inner + 2 * halo_depth;
    
    // Use fast integer division by restricting access to grid dimensions
    const int col = gid % x_inner;
    const int row = gid / x_inner;
    
    // Compute offset using halo depth
    const int off0 = halo_depth * (x + 1);
    
    // Calculate actual array index leveraging pre-computed values
    const int index = off0 + col + row * x;
    
    // Perform division and store result in output array
    sd[index] = r[index] / theta;
}