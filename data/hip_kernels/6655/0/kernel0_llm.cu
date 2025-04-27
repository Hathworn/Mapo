#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel0(int n, float a, float *x, float *y){
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize x and y arrays outside the loop
    if (i < n) {
        x[i] = 1.0f;
        y[i] = 2.0f;
    }

    // Perform the computation
    if (i < n) {
        y[i] = a * x[i] + y[i];
    }
}