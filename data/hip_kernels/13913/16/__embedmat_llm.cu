#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __embedmat(float *a, int *b, long long *c, int n) {
    // Calculate grid stride to allow entire grid to participate in computation
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; 
    const int signbit = 0x80000000;
    const int mag = 0x7fffffff;

    // Use grid-stride loop for accessing elements
    for (int i = tid; i < n; i += stride) {
        float v = a[i];
        int vi = *((int*)&v);
        if (vi & signbit) {
            vi = -(vi & mag);
        }
        c[i] = (long long)vi + (((long long)b[i]) << 32);
    }
}