#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __extractmat(float *a, int *b, long long *c, int n) {
    int tid = threadIdx.x + blockDim.x * (blockIdx.x + gridDim.x * blockIdx.y);
    const int signbit = 0x80000000;
    const int mag = 0x7fffffff;
    int stride = blockDim.x * gridDim.x * gridDim.y;  // Calculate stride for better memory access

    for (int i = tid; i < n; i += stride) {
        int vi = __ldg((int *)&c[i]);  // Use __ldg for read-only access to improve performance
        if (vi & signbit) {
            vi = -(vi & mag);
        }
        a[i] = __int_as_float(vi);  // Use __int_as_float for type conversion
        b[i] = __ldg(((int *)&c[i]) + 1);  // Use __ldg for read-only access
    }
}