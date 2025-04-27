#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float fx(float a, float b) {
    return a + b;
}

__global__ void kernel(void) {
    // Avoid unnecessary device function call by inlining
    float result = 1.0 + 2.0;
    printf("res = %f\n", result);
}