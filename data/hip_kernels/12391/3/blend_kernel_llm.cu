#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blend_kernel(float *outSrc, const float *inSrc) {
    // map from threadIdx/BlockIdx to pixel position
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // Use shared memory for coalesced memory access
    extern __shared__ float s_inSrc[];

    // Load data to shared memory: Each thread loads one element
    int local_x = threadIdx.x + 1; // Avoid boundary condition
    int local_y = threadIdx.y + 1; // Avoid boundary condition
    int local_offset = local_x + local_y * (blockDim.x + 2);

    // Load central, left, right, top, and bottom pixels into shared memory
    s_inSrc[local_offset] = inSrc[offset];

    // Load boundary pixels
    if (threadIdx.x == 0) s_inSrc[local_offset - 1] = inSrc[offset - 1];
    if (threadIdx.x == blockDim.x - 1) s_inSrc[local_offset + 1] = inSrc[offset + 1];
    if (threadIdx.y == 0) s_inSrc[local_offset - (blockDim.x + 2)] = inSrc[offset - DIM];
    if (threadIdx.y == blockDim.y - 1) s_inSrc[local_offset + (blockDim.x + 2)] = inSrc[offset + DIM];

    __syncthreads();

    // Compute new value
    float center = s_inSrc[local_offset];
    float result = center + SPEED * (s_inSrc[local_offset - 1] +
                                     s_inSrc[local_offset + 1] +
                                     s_inSrc[local_offset - (blockDim.x + 2)] +
                                     s_inSrc[local_offset + (blockDim.x + 2)] -
                                     center * 4);

    // Update output array
    outSrc[offset] = result;
}