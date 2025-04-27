#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_equalization_kernel(unsigned char *buffer, long size, int *histo, unsigned char *output) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int offset = blockDim.x * gridDim.x;

    // Use shared memory to reduce global memory access
    __shared__ unsigned char sharedLUT[256];
    if (threadIdx.x < 256) {
        sharedLUT[threadIdx.x] = dev_lut[threadIdx.x];
    }
    __syncthreads();

    while (i < size) {
        // Use shared LUT data for output, reducing global memory reads
        output[i] = sharedLUT[buffer[i]] > 255 ? 255 : sharedLUT[buffer[i]];
        i += offset;
    }
}