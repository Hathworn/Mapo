```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_equalization_kernel(unsigned char *buffer, long size, int *histo, unsigned char *output) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int offset = blockDim.x * gridDim.x;

    // Use shared memory for dev_lut for faster access
    __shared__ int shared_dev_lut[256]; 
    if (threadIdx.x < 256) {
        shared_dev_lut[threadIdx.x] = dev_lut[threadIdx.x];
    }
    __syncthreads();

    // Loop unrolling to improve performance
    while (i < size) {
        #pragma unroll 4
        for (int j = 0; j < 4 && i < size; ++j, i += offset) {
            unsigned char value = buffer[i];
            output[i] = (unsigned char)(shared_dev_lut[value] > 255 ? 255 : shared_dev_lut[value]);
        }
    }
}