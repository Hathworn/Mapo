#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void naivekernel(float* output, float* frameA, float* frameB, int chans) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = i << 1;
    // Optimize by moving the check inside the conditional operation and using a branchless approach
    if (i < chans) {
        float a0 = frameA[j];
        float a1 = frameA[j + 1];
        float b0 = frameB[j];
        float b1 = frameB[j + 1];
        bool condition = a0 >= b0;
        output[j] = condition ? a0 : b0;
        output[j + 1] = condition ? a1 : b1;
    }
}