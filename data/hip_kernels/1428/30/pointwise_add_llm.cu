#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pointwise_add(float *d_res, const float *d_op1, const float *d_op2, const int len)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;

    // Utilize shared memory for coalesced access
    __shared__ float s_op1[256];
    __shared__ float s_op2[256];

    if(pos < len) {
        // Load data into shared memory
        s_op1[threadIdx.x] = d_op1[pos];
        s_op2[threadIdx.x] = d_op2[pos];
        __syncthreads();

        // Perform pointwise addition
        d_res[pos] = s_op1[threadIdx.x] + s_op2[threadIdx.x];
    }
}