#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pw_copy_cr_cu_z(const double *zin, double *dout, const int n)
{
    int i = blockIdx.x + blockIdx.y * gridDim.x;
    i = i * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x * gridDim.y;
    for (; i < n; i += stride)
    {
        dout[i] = zin[2 * i];
    }
}