#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float dothings(int t, int sz, float *input) {
    float ans = 0;
    for (int i = 0; i < 12; ++i) {
        ans += input[(i + t) % sz];
    }
    return ans;
}

__global__ void process(int N_step, int N_inst, float *input, float *output) {
    int g_id = blockIdx.x * blockDim.x + threadIdx.x;
    if (g_id >= N_inst) return;

    float ans = 0.;
    // Coalesce global memory access by loading data into shared memory
    extern __shared__ float local_data[];
    #pragma unroll
    for (int i = 0; i < VEC_SIZE; ++i) {
        local_data[i] = input[VEC_SIZE * g_id + i];
    }
    __syncthreads();

    #pragma unroll
    for (int t = 0; t < N_step; ++t) {
        ans += dothings(t, VEC_SIZE, local_data);
    }
    
    output[g_id] = ans;
}
```
