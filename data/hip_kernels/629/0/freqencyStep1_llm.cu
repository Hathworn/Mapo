#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void freqencyStep1(char *d_dat, int len, int *d_freq) {
    // Load data into shared memory and reduce in parallel
    __shared__ int sfreq[3456]; // Shared memory for partial frequencies

    for (int i = threadIdx.x; i < 3456; i += blockDim.x) 
        sfreq[i] = 0; // Initialize shared memory
    __syncthreads();

    int *myfreq = &sfreq[27 * threadIdx.x];
    int stride = blockDim.x * gridDim.x;

    // Calculate frequency in shared memory
    for (int i = threadIdx.x + blockIdx.x * blockDim.x; i < len; i += stride) 
        myfreq[d_dat[i] - 'a']++;
    __syncthreads();

    // Parallel reduction within shared memory
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            for (int i = 0; i < 26; i++)
                myfreq[i] += sfreq[27 * (threadIdx.x + offset) + i];
        }
        __syncthreads();
    }

    // Output results to global memory using atomics
    if (threadIdx.x < 26) 
        atomicAdd(&d_freq[threadIdx.x], myfreq[threadIdx.x]);
}