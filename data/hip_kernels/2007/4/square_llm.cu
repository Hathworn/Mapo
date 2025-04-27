#include "hip/hip_runtime.h"
#include "includes.h"

// Utilize shared memory for coalesced global memory access
__global__ void square(float *d_in, float *d_out)
{
    extern __shared__ float s_data[];

    int index = threadIdx.x;
    int global_index = blockIdx.x * blockDim.x + index;

    // Load data into shared memory
    s_data[index] = d_in[global_index];
    __syncthreads();

    // Perform computation
    float f = s_data[index];
    d_out[global_index] = f * f;
}