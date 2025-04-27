#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dropout_op(size_t sz, float_t* random_nums, float_t* data, float_t drop_rate, float_t scale) {
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check index boundaries once at the start
    if (index >= sz) return;
    
    // Simplify branching logic
    data[index] *= (random_nums[index] > drop_rate) * scale;
}