#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void prefixSum_UniqueBlock(float* in, int in_length, float* out ){

    //shared memory declaration
    extern __shared__ float DSM[];

    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    //load in shared memory
    if(idx < in_length){
        DSM[threadIdx.x] = in[idx];
    } else {
        DSM[threadIdx.x] = 0.0f; // Handle out-of-bound threads
    }

    __syncthreads();

    //partial sums phase
    for(int stride = 1; stride < blockDim.x; stride *= 2) { // Change condition to '<'
        int index_aux = (threadIdx.x + 1) * stride * 2 - 1;
        if(index_aux < blockDim.x)
            DSM[index_aux] += DSM[index_aux - stride];
        __syncthreads();  // Synchronize here instead of outside the loop
    }

    //reduction phase
    for(int stride = blockDim.x / 4; stride > 0; stride /= 2) {
        int index_aux = (threadIdx.x + 1) * stride * 2 - 1;
        if(index_aux + stride < blockDim.x)
            DSM[index_aux + stride] += DSM[index_aux];
        __syncthreads();  // Synchronize here instead of outside the loop
    }

    if(idx < in_length) {
        out[idx] = DSM[threadIdx.x];
    }
}