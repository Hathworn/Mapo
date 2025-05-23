```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void helper(float * output, float * blocksum, int len) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < len) {
        // Reduce redundant access to blocksum by using a local variable
        float sum = 0.0f;
        for (int j = 0; j < i / blockDim.x; j++) {
            sum += blocksum[j];
        }
        output[i] += sum;
    }
}