#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_divScalarMany_f(int n, int sizeSubImage, float *result, double *resultDouble, float *x, float *div)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.x * gridDim.x + threadIdx.y * gridDim.x) * blockDim.y;

    // Optimization: Use faster global memory access pattern
    if (id < n)
    {
        int id2 = __float2int_rd(__fdivide_rd(id, sizeSubImage)); // Use integer division for id2
        if (div[id2] != 0.0f)
        {
            float tmpResult = __fdividef(x[id], div[id2]); // Use faster division for float
            result[id] = tmpResult;
            resultDouble[id] = (double)tmpResult; // Eliminate unnecessary initialization
        }
    }
}