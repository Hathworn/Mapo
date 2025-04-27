#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuConvert32uC1To32fC1Kernel(const unsigned int *src, size_t src_stride, float* dst, size_t dst_stride, float mul_constant, float add_constant, int width, int height)
{
    // Calculate global thread position
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Use shared memory for strided access
    __shared__ unsigned int shared_src[32][32];
    __shared__ float shared_dst[32][32];

    // Convert linear indexes to 2D block coordinates
    int src_c = y * src_stride + x;
    int dst_c = y * dst_stride + x;

    // Load elements into shared memory to improve coalesced memory access
    if (x < width && y < height) {
        shared_src[threadIdx.y][threadIdx.x] = src[src_c];
    }

    // Synchronize threads to ensure all shared memory operations are complete
    __syncthreads();

    if (x < width && y < height) {
        // Perform the conversion using shared memory
        shared_dst[threadIdx.y][threadIdx.x] = shared_src[threadIdx.y][threadIdx.x] * mul_constant + add_constant;
        dst[dst_c] = shared_dst[threadIdx.y][threadIdx.x];
    }
}