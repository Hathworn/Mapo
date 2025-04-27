#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_with_value_util_kernel(double2 * __restrict buf, double v, int elem_count)
{
    int elem_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize: Use memory coalescing and reduce branching within the loop
    if (elem_id >= elem_count) return;

    double2 val = {v, v}; // Initialize using aggregate initialization for better readability
    buf[elem_id] = val;
}