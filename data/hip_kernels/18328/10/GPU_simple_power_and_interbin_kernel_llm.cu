#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GPU_simple_power_and_interbin_kernel(float2 *d_input_complex, float *d_output_power, int nTimesamples, float norm) {
    int pos_x = blockIdx.x * blockDim.x + threadIdx.x;
    int pos_y = blockIdx.y * nTimesamples;

    // Use shared memory for better access efficiency
    __shared__ float2 shared_data[MAX_THREADS_PER_BLOCK];

    // Load data into shared memory
    if (pos_x < nTimesamples) {
        shared_data[threadIdx.x] = d_input_complex[pos_y + pos_x];
    }
    __syncthreads();

    // Perform computations if within bounds
    if (pos_x < nTimesamples) {
        float2 A = shared_data[threadIdx.x];
        d_output_power[pos_y + pos_x] = (A.x * A.x + A.y * A.y) * norm;
    }
}
```
