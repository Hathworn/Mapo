#include "hip/hip_runtime.h"
#include "includes.h"
/*
* Implements vector
*/

#ifdef DEBUG
#endif

__global__ void kern_vec_add_(float* x, float* y, float* r, size_t dim)
{
    // Calculate the global thread index
    size_t _i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride for loop only if necessary
    size_t _strd = blockDim.x * gridDim.x;

    // Iterate over data elements
    while (_i < dim) {
        r[_i] = x[_i] + y[_i];
        _i += _strd;
    }
}