#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void saturate(unsigned int *bins, unsigned int num_bins) {

    // Use thread index to determine starting bin index, iterate through all relevant bins for each thread
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Loop through all bins that the thread is responsible for
    for (int i = index; i < num_bins; i += stride) {
        if (bins[i] >= 128) {
            bins[i] = 127; // Clamp value at 127
        }
    }
}