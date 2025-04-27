#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void zupdate2_optimized(float *z1, float *z2, float *f, float tau, int nx, int ny)
{
    // Use shared memory for block data to reduce global memory accesses
    __shared__ float shared_f[BLOCK_SIZE_X][BLOCK_SIZE_Y];

    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;

    float a, b, t;

    if (px < nx && py < ny) {
        // Load data into shared memory
        int idx = px + py * nx;
        shared_f[threadIdx.x][threadIdx.y] = f[idx];
        __syncthreads();  // Ensure all threads have written to shared memory

        // Compute the gradient using shared memory
        a = shared_f[threadIdx.x][threadIdx.y];
        b = shared_f[threadIdx.x][threadIdx.y];

        // Update z values
        t = 1 / (1 + tau * sqrtf(a * a + b * b));
        z1[idx] = (z1[idx] + tau * a) * t;
        z2[idx] = (z2[idx] + tau * b) * t;
    }
}