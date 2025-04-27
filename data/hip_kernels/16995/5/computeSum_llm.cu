```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX(a, b) ((a) > (b) ? (a) : (b))

#define GAUSSIAN_KERNEL_SIZE 3
#define SOBEL_KERNEL_SIZE 5
#define TILE_WIDTH 32
#define SMEM_SIZE 128

__global__ void computeSum(float *d_filteredImage, float *d_imageSumGrid, unsigned int n)
{
    __shared__ float smem[SMEM_SIZE];
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    float localSum = 0;

    // Unroll the loop for better performance and memory coalescing
    if (idx + 3 * blockDim.x < n) {
        #pragma unroll
        for (int i = 0; i < 4; i++) {
            localSum += d_filteredImage[idx + i * blockDim.x];
        }
    }

    smem[tid] = localSum;
    __syncthreads();

    // Replace multiple syncthreads with a single loop
    for (int stride = blockDim.x / 2; stride > 32; stride >>= 1) {
        if (tid < stride) {
            smem[tid] += smem[tid + stride];
        }
        __syncthreads();
    }

    if (tid < 32) {
        volatile float *vsmem = smem;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    if (tid == 0) {
        d_imageSumGrid[blockIdx.x] = smem[0];
    }
}