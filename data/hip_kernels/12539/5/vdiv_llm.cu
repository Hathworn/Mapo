#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

}
__global__ void vdiv(const float *a, const float *b, float *c, const int array_size)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Bounds check to prevent accessing beyond array limits
    if (i < array_size) {
        c[i] = a[i] / b[i];
    }
}