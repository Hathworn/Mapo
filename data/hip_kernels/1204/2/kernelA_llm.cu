#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelA(int n, float *x, float *y) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    if (index < n) { // Optimize by checking bounds before loop
        for (int i = index; i < n; i += stride) {
            float xi = x[i]; // Cache x[i] into register to optimize memory access
            float yi = y[i]; // Cache y[i] into register to optimize memory access
            if (xi > yi) {
                float sum = 0.0f; // Accumulate result locally
                for (int j = 0; j < n / CONST; j++) {
                    sum += x[j] + y[j];
                }
                y[i] = sum; // Write result once
            } else {
                float divSum = 0.0f; // Accumulate result locally
                for (int j = 0; j < n / CONST; j++) {
                    divSum += x[j] / y[j];
                }
                y[i] = divSum; // Write result once
            }
        }
    }
}