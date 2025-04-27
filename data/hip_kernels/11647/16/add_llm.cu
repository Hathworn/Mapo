#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int* in, int* out, int n) {

    int gid = threadIdx.x + blockIdx.x * blockDim.x;
    if (gid >= n) return;

    extern __shared__ int temp[];

    // Load input into shared memory
    temp[threadIdx.x] = in[gid];
    __syncthreads();

    for (int offset = 1; offset < n; offset <<= 1) {
        int val = 0;

        // Read data from shared memory and perform the addition
        if (threadIdx.x >= offset) {
            val = temp[threadIdx.x - offset];
        } else if (gid >= offset) {
            val = in[gid - offset];
        }
        
        __syncthreads();
        
        // Write the sum back to shared memory
        temp[threadIdx.x] += val;
        __syncthreads(); // Synchronize to ensure all writes are complete
    }

    // Write the result to global memory
    out[gid] = temp[threadIdx.x];
}