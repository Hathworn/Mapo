#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pfbFilterShared(float *filtered, float *unfiltered, float *taps, const int ntaps) {
    extern __shared__ float shared_taps[];
    
    const int nfft = blockDim.x;
    const int i = threadIdx.x + threadIdx.y * blockDim.x + blockIdx.x * blockDim.x * blockDim.y;

    // Load taps into shared memory using coalesced access
    for (int j = threadIdx.x; j < ntaps * nfft; j += blockDim.x) {
        shared_taps[j] = taps[j];
    }
    __syncthreads();

    // Initialize filtered[i] with the first tap computation
    float temp = unfiltered[i] * shared_taps[threadIdx.x];
    for (int j = 1; j < ntaps; j++) {
        temp += unfiltered[i + j * nfft] * shared_taps[threadIdx.x + j * nfft];
    }
    filtered[i] = temp;
}