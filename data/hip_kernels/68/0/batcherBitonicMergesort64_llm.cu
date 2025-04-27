#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void batcherBitonicMergesort64(float * d_out, const float * d_in) {
    // you are guaranteed this is called with <<<1, 64, 64*4>>>
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    sdata[tid] = d_in[tid];
    __syncthreads();

    // Perform bitonic sort
    for (int stage = 0; stage <= 5; stage++) {
        for (int substage = stage; substage >= 0; substage--) {
            int partner = tid ^ (1 << substage);

            // Ensure partner is within bounds
            if (partner > tid) {
                // Ascending order sort
                if ((tid & (1 << (stage + 1))) == 0) {
                    if (sdata[tid] > sdata[partner]) {
                        // Swap if not in order
                        float temp = sdata[tid];
                        sdata[tid] = sdata[partner];
                        sdata[partner] = temp;
                    }
                } else {
                    // Descending order sort
                    if (sdata[tid] < sdata[partner]) {
                        // Swap if not in order
                        float temp = sdata[tid];
                        sdata[tid] = sdata[partner];
                        sdata[partner] = temp;
                    }
                }
            }
            __syncthreads(); // Sync after each comparison and swap
        }
    }

    d_out[tid] = sdata[tid]; // Write sorted data to output
}