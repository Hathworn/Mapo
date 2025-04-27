#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_expf(size_t n, float *result, float *x)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    if (id < n)
    {
        result[id] = __expf(x[id]); // Use fast intrinsic for expf to optimize performance
    }
}