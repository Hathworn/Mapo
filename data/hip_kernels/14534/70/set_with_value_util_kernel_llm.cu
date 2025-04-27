#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_with_value_util_kernel(int4 * __restrict buf, int v, int elem_count)
{
    int elem_id = blockDim.x * blockIdx.x + threadIdx.x;
    if (elem_id < elem_count)
    {
        // Use a single constructor call to initialize int4
        buf[elem_id] = make_int4(v, v, v, v);
    }
}