#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    // Use shared memory for inputs
    extern __shared__ float shared_data[];
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;

    if (tid < N) {
        // Load data into shared memory
        shared_data[local_tid] = in[tid];
        __syncthreads();

        // Perform ReLU
        out[tid] = shared_data[local_tid] > 0 ? shared_data[local_tid] : 0;
    }
}