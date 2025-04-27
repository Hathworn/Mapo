#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void freqencyMethod2(char *d_dat, int len, int *d_freq) {
    __shared__ int sfreq[26];
    
    // Initialize shared memory using block-level cooperative approach
    for (int i = threadIdx.x; i < 26; i += blockDim.x) {
        sfreq[i] = 0;
    }
    __syncthreads();

    int gridsize = blockDim.x * gridDim.x;

    // Process elements with strided access for improved coalescing
    for (int i = threadIdx.x + blockIdx.x * blockDim.x; i < len; i += gridsize) {
        int pos = d_dat[i] - 'a';
        atomicAdd(&sfreq[pos], 1);
    }
    __syncthreads();

    // Accumulate results from shared memory to global memory
    for (int i = threadIdx.x; i < 26; i += blockDim.x) {
        atomicAdd(&d_freq[i], sfreq[i]);
    }
}