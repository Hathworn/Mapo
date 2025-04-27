#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pack_top(const int x, const int y, const int halo_depth, double* field, double* buffer, const int depth)
{
    // Calculate effective inner dimension length
    const int x_inner = x - 2 * halo_depth;

    // Calculate global thread index
    const int gid = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Ensure gid is within bounds
    if (gid >= x_inner * depth) return;

    // Calculate the number of complete lines processed
    const int lines = gid / x_inner;
    
    // Calculate offset with simplified index calculation
    const int offset = (x - halo_depth) + lines * (x - depth) + (gid % x_inner);
    buffer[gid] = field[offset];
}