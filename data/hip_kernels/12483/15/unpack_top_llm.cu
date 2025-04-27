#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function for unpack_top
__global__ void unpack_top(const int x, const int y, const int halo_depth, double* field, double* buffer, const int depth)
{
    // Calculate the index within the inner region
    const int x_inner = x - 2 * halo_depth;

    // Calculate the global thread ID
    const int gid = threadIdx.x + blockDim.x * blockIdx.x;

    // Return early if gid is out of bounds
    if (gid >= x_inner * depth) return;

    // Calculate line number and offset for field array
    const int lines = gid / x_inner;
    const int offset = x * (y - halo_depth) + lines * 2 * halo_depth;

    // Update the field with buffer value at calculated index
    field[offset + gid] = __ldg(&buffer[gid]); // Use __ldg to load buffer into cache
}