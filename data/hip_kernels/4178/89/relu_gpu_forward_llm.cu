```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_gpu_forward(float *out, float *in, int64_t N) {
    // Use shared memory for reduction of global memory access
    extern __shared__ float shared_mem[];

    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;

    if (tid < N) {
        shared_mem[local_tid] = in[tid];
        __syncthreads(); // Ensure all threads have loaded their data

        if (shared_mem[local_tid] > 0) {
            out[tid] = shared_mem[local_tid];
        } else {
            out[tid] = 0;
        }
    }
}