```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuAddRNorm(float *dist, int width, int pitch, int height, float *vec) {
    unsigned int tx = threadIdx.x;
    unsigned int ty = threadIdx.y;
    unsigned int xIndex = blockIdx.x * blockDim.x + tx;
    unsigned int yIndex = blockIdx.y * blockDim.y + ty;

    // Use dynamic shared memory and only load vector values once per block
    extern __shared__ float shared_vec[];
    if (tx == 0 && yIndex < height)
        shared_vec[ty] = vec[yIndex];
    __syncthreads();

    // Ensure all threads have valid indices
    if (xIndex < width && yIndex < height) {
        dist[yIndex * pitch + xIndex] += shared_vec[ty];
    }
}