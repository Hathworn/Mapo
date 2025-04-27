#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dropout_op(size_t sz, float_t* random_nums, float_t* data, float_t drop_rate, float_t scale)
{
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop for better efficiency and use a branchless approach
    if (index < sz)
    {
        float_t rand_val = random_nums[index];
        float_t mask = float_t(rand_val > drop_rate);
        data[index] *= mask * scale; // Use mask to conditionally multiply data[index] with scale, replacing dropped values with zero.
    }
}