#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    // Use shared memory to reduce global memory accesses
    extern __shared__ float shared_in[];
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;
    
    // Load data into shared memory
    if (tid < N) {
        shared_in[local_tid] = in[tid];
        __syncthreads(); // Synchronize threads within a block
        out[tid] = shared_in[local_tid] > 0 ? shared_in[local_tid] : 0;
    }
}