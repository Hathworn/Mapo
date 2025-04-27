#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogram_gpu_son(unsigned char * d_img, unsigned int * d_hist, int img_size, int serialNum)
{
    // Use shared memory to reduce global memory access latency
    extern __shared__ unsigned int aa[];
    int x = threadIdx.x + blockDim.x * blockIdx.x;

    // Initialize shared memory
    for (int i = 0; i < ROLLSIZE; i++) {
        aa[(i << 8) + threadIdx.x] = 0;
    }
    __syncthreads();

    // Determine the range for processing based on thread index and serialNum
    int end = (x + 1) * serialNum;
    if (end >= img_size) end = img_size;

    // Fill shared memory with histogram data
    for (int i = x * serialNum; i < end; i++) {
        atomicAdd(&(aa[((threadIdx.x >> 4) << 8) + d_img[i]]), 1);
    }
    __syncthreads();

    // Reduce shared memory data within the block
    unsigned int s;
    for (s = 16 / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            for (int i = 0; i < 256; i++) {
                aa[(i << 8) + threadIdx.x] += aa[((i + s) << 8) + threadIdx.x];
            }
        }
        __syncthreads();
    }

    // Final reduction and update global histogram
    if (threadIdx.x < 256) { 
        atomicAdd(&(d_hist[threadIdx.x]), aa[threadIdx.x]);
    }
}