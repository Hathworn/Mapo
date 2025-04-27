#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_equalization_kernel(unsigned char *buffer, long size, int *histo, unsigned char *output) {
    // Calculate global index for the thread
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    // Iterate over indices processed by this thread
    for (; i < size; i += blockDim.x * gridDim.x) {
        unsigned char lut_value = (unsigned char) dev_lut[buffer[i]];
        // Use min function for boundary check and assignment
        output[i] = min(lut_value, (unsigned char)255);
    }
}