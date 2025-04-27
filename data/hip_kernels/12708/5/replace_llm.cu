#include "hip/hip_runtime.h"
#include "includes.h"

#define getPos(a,k) (((a)>>(k-1))&1)

extern "C" {

}

__global__ void replace(int * input_T, int * output_T, int * prefix_T, int * prefix_helper_T, int n, int k, int blockPower) {
    int baseIndex = threadIdx.x + 1024 * blockIdx.x;  // Compute base index for each block
    int totalThreads = 1024 * gridDim.x;  // Calculate total threads
    for(int i = 0; i < blockPower; i++) {
        int oldpos = baseIndex + i * totalThreads;  // Compute old position using baseIndex
        if(oldpos >= n) return;

        int newpos = prefix_T[oldpos] + prefix_helper_T[blockIdx.x + i * gridDim.x];

        if(getPos(input_T[oldpos], k) == 0) {
            newpos = oldpos - newpos;
        } else {
            newpos = prefix_helper_T[(n + 1023) / 1024] + newpos - 1;
        }

        output_T[newpos] = input_T[oldpos];
    }
}