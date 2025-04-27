#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rotate2(float *a, float b, float *c, int sx, int sy, int sz, int dx, int dy, int dz)
{
    int ids = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique thread ID

    if (ids >= sx * sy * sz) return; // Boundary check to prevent out-of-bounds access

    // Compute wrapped coordinates with offsets
    int x = (ids + dx) % sx;
    int y = ((ids / sx) + dy) % sy;
    int z = ((ids / (sx * sy)) + dz) % sz;

    // Compute destination index
    int idd = x + sx * y + sx * sy * z;

    // Perform rotation and scaling operation
    c[idd] = b * a[ids];
}