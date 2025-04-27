#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelB(int n, float *x, float *y) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for (int i = index; i < n; i += stride) {
        float xi = x[i]; // Load x[i] once to reduce global memory access
        float yi = y[i]; // Load y[i] once to reduce global memory access
        if (xi > yi) {
            float sum = 0.0f; // Use a local variable to accumulate sum
            for (int j = 0; j < n / CONST; j++) {
                sum += x[j] + y[j];
            }
            y[i] = sum; // Update y[i] once outside the loop
        } else {
            yi = atomicAdd(&y[i], xi); // Use local yi for atomic operation
        }
    }
}
```
