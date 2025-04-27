#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void maxReduce(int *d_idata, int *d_odata) {
    
    // Use a dynamically allocated shared memory
    extern __shared__ int sdata[];

    unsigned int tid = threadIdx.x;
    unsigned int index = blockIdx.x * blockDim.x + tid;

    // Load input into shared memory
    sdata[tid] = d_idata[index];
    __syncthreads();

    // Unrolling the loop for performance
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (tid < stride) {
            sdata[tid] = max(sdata[tid], sdata[tid + stride]);
        }
        __syncthreads(); // Ensure all memory operations are complete
    }

    // Write result for this block to output
    if (tid == 0) {
        d_odata[blockIdx.x] = sdata[0];
    }
}