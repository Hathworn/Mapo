#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void x3(int* x4, int x5, int x6) {
    int x7 = gridDim.x * blockDim.x;
    int x8 = threadIdx.x + blockIdx.x * blockDim.x;
    int x9 = -x5;
    // Unroll the loop to improve performance
    #pragma unroll
    while (x8 < x6) {
        int x10 = x8;
        int xVal = x4[x10];
        // Combine comparisons and assignments to optimize
        x4[x10] = (xVal > x5) ? x5 : ((xVal < x9) ? x9 : xVal);
        x8 += x7;
    }
}