#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int concatenate(float* array) {
    unsigned int rvalue = 0;
    unsigned int sign;

    #pragma unroll // Unroll the loop for better performance
    for (int i = 0; i < 32; i++) {
        sign = (array[i] >= 0);
        rvalue = rvalue | (sign << i);
    }

    return rvalue;
}

__global__ void concatenate_cols_kernel(float *a, unsigned int *b, int m, int n) {
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    if (j < n) {
        // Use shared memory for better memory access performance
        __shared__ float array[32];

        for (int i = 0; i < m; i += 32) {
            #pragma unroll // Unroll the loop for better performance
            for (int k = 0; k < 32; k++) {
                array[k] = a[j + n * (i + k)];
            }
            b[j + n * i / 32] = concatenate(array);
        }
    }
}