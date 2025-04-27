#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void process(int N_step, int N_inst, float *input, float *output) {
    int b_id = blockIdx.x, t_id = threadIdx.x;
    if (b_id >= N_inst) return;
    __shared__ float ans;
    float val = 0.0f;

    // Initialize shared memory once before loop
    if (!t_id) ans = 0.0f;
    __syncthreads();
    
    // Load input into register to reduce global memory access
    if (t_id < VEC_SIZE) val = input[VEC_SIZE * b_id + t_id];
    __syncthreads();

    for (int t = 0; t < N_step; ++t) {
        int start = t % VEC_SIZE;

        // Use a single atomic operation for each thread if within bounds
        if (t_id < VEC_SIZE && (t_id >= start && t_id < start + 12)) {
            atomicAdd(&ans, val);
        }
        __syncthreads();
    }

    // Write to global memory once outside the loop
    if (!t_id) output[b_id] = ans;
    return;
}
```
