#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void batcherBitonicMergesort64(float *d_out, const float *d_in) {
    // Optimized shared memory access and synchronization pattern
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    sdata[tid] = d_in[tid];
    __syncthreads();
    
    for (int stage = 0; stage <= 5; stage++) {
        int distance = 1 << stage;
        for (int substage = stage; substage >= 0; substage--) {
            int shift = 1 << substage;
            int index = 2 * tid - (tid & (shift - 1));
            // Efficient conditional check to avoid unnecessary computations
            if ((sdata[index] > sdata[index + shift]) == ((index & distance) == 0)) {
                float temp = sdata[index];
                sdata[index] = sdata[index + shift];
                sdata[index + shift] = temp;
            }
            __syncthreads();
        }
    }

    d_out[tid] = sdata[tid];
}