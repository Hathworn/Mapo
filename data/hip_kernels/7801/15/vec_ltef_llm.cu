#include "hip/hip_runtime.h"
#include "includes.h"

/*
* JCudaVec - Vector operations for JCuda
* http://www.jcuda.org
*
* Copyright (c) 2013-2015 Marco Hutter - http://www.jcuda.org
*/

// Kernel to compare elements of two vectors
__global__ void vec_ltef(size_t n, float *result, const float *x, const float *y)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    if (id < n)
    {
        // Use a ternary operator for conditional assignment
        result[id] = (x[id] <= y[id]) ? 1.0f : 0.0f;
    }
}
```
