#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize by using fast math intrinsic function
__global__ void powWalkers(const int n, const float c, const float *a, float *d) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < n) {
        d[i] = __powf(a[i], c);  // Use __powf for faster computation
    }
}