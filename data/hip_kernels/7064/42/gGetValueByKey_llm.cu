#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gGetValueByKey(float* d_in, float* d_out, int* indeces, int n) {
    int tid = threadIdx.x + blockDim.x * blockIdx.x;

    // Access memory in a coalesced manner by assigning the index first
    if(tid < n) {
        int index = indeces[tid];
        
        // Prefetch input data to avoid redundant indexing
        float value = d_in[index];
        
        // Store pre-fetched data in the output
        d_out[tid] = value;
    }
}