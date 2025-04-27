#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void arr_times_const_checkerboard(float *a, float b, float *c, int N, int sx, int sy, int sz)
{
    // Calculate global thread index for flattening
    int ids = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if thread index is within bounds
    if (ids >= N) return;

    // Use integer division and modulus only once for px and py calculation
    int py = ids / (2 * sx);
    int px = (ids / 2) - (py * sx);

    // Calculate checkerboard pattern value
    float minus1 = 1 - 2 * ((px + py) % 2);

    // Compute scaling and store in output
    c[ids] = a[ids] * b * minus1;
}