#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void skip_res_add(size_t sz, float_t* f5, float* f1, float_t* skip_out_sum, size_t stride)
{
    size_t index = blockDim.x * blockIdx.x + threadIdx.x;

    // Use loop unrolling to maximize memory throughput
    #pragma unroll 4
    for (size_t i = index; i < sz; i += blockDim.x * gridDim.x)
    {
        skip_out_sum[i] += f5[i + stride];
        f1[i] += f5[i];
    }
}