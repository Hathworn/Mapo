#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    // Use shared memory to optimize access
    extern __shared__ float shared_in[];

    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < N) {
        // Load data into shared memory
        shared_in[threadIdx.x] = in[tid];
        __syncthreads();

        // Compute relu using shared memory
        out[tid] = shared_in[threadIdx.x] > 0 ? shared_in[threadIdx.x] : 0;
    }
}