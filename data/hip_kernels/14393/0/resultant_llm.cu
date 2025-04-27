#include "hip/hip_runtime.h"
#include "includes.h"

// create an image buffer.  return host ptr, pass out device pointer through pointer to pointer
__global__ void resultant(unsigned char *a, unsigned char *b, unsigned char *c)
{
    int idx = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Load data into registers to reduce global memory access
    float opposite_side = float(a[idx]);
    float adjacent_side = float(b[idx]);

    // Use fused multiply-add (FMA) to improve performance
    float sum = opposite_side + adjacent_side;
    unsigned char result = (unsigned char)sqrtf(fmaf(sum, sum, -2 * opposite_side * adjacent_side));

    // Apply condition
    if (result > 15 && (idx == 0 || c[idx - 1] != 148))  // Check idx to avoid accessing out-of-bounds
        result = 148;
    else
        result = 0;

    // Store result back to global memory
    c[idx] = result;
}