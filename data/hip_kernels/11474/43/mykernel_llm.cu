#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mykernel(float *d1, float *d2, float *d3, float *d4, float *d5) {
    // Use threadIdx.x to vectorize operations on d* arrays
    int i = threadIdx.x;

    if (i < 5) {
        float* arrays[] = {d1, d2, d3, d4, d5};
        arrays[i][0] = 123.0f;  // Assign 123.0f to the first element of each array
    }
}