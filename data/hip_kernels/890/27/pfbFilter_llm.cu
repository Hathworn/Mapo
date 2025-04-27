#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pfbFilter(float *filtered, float *unfiltered, float *taps, const int ntaps) {

    const int nfft = blockDim.x;
    const int i = threadIdx.x + threadIdx.y * blockDim.x + blockIdx.x * blockDim.x * blockDim.y;
    
    float sum = 0.0f; // Use a local variable for accumulation
    #pragma unroll
    for (int j = 0; j < ntaps; j++) {
        // Load data into registers to reduce global memory access
        float unfiltered_val = unfiltered[i + j * nfft];
        float tap_val = taps[threadIdx.x + j * nfft];
        sum += unfiltered_val * tap_val;
    }
    filtered[i] = sum; // Assign accumulated value to global memory
}