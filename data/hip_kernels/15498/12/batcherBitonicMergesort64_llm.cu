#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void batcherBitonicMergesort64(float * d_out, const float * d_in)
{
    // you are guaranteed this is called with <<<1, 64, 64*4>>>
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    sdata[tid] = d_in[tid];
    __syncthreads();

    // Optimize: Combine loops and add necessary synchronization
    for (int stage = 0; stage <= 5; stage++) {
        for (int substage = stage; substage >= 0; substage--) {
            int pairDistance = 1 << substage;
            int blockSize = 1 << (stage + 1);
            int comparePair = (tid / pairDistance) % 2 == 0;

            // Determine the indices to compare
            int compareIndex = tid ^ pairDistance;
            if (compareIndex < blockSize) {
                // Conditional swap if needed
                if ((comparePair && sdata[tid] > sdata[compareIndex]) || (!comparePair && sdata[tid] < sdata[compareIndex])) {
                    float temp = sdata[tid];
                    sdata[tid] = sdata[compareIndex];
                    sdata[compareIndex] = temp;
                }
            }
            __syncthreads(); // Ensure all swaps are finished before the next iteration
        }
    }

    d_out[tid] = sdata[tid];
}