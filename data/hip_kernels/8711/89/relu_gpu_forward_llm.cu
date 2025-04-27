#include "hip/hip_runtime.h"
#include "includes.h"

// Using shared memory to reduce global memory access
__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    extern __shared__ float shared_in[];
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;

    if (tid < N) {
        // Load input data into shared memory
        shared_in[local_tid] = in[tid];
        __syncthreads(); // Ensure all threads have loaded data

        // Compute ReLU using shared memory
        out[tid] = shared_in[local_tid] > 0 ? shared_in[local_tid] : 0;
    }
}