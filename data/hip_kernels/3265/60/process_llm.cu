#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void process(int N_step, int N_inst, float *input, float *output) {
    int g_id = blockIdx.x * blockDim.x + threadIdx.x;
    if (g_id >= N_inst) return;

    float ans = 0.0f;
    // Use shared memory to reduce global memory access
    extern __shared__ float shared_input[];
    
    // Load data into shared memory
    for (int i = threadIdx.x; i < VEC_SIZE; i += blockDim.x) {
        shared_input[i] = input[i + VEC_SIZE * g_id];
    }
    __syncthreads();

    // Accumulate the values in the shared memory
    for (int t = 0; t < N_step; ++t) {
        for (int i = 0; i < 12; ++i) {
            ans += shared_input[(i + t) % VEC_SIZE];
        }
    }

    output[g_id] = ans;
}