#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelMultMat(int *a, int *b, int *c, int m) {
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    if (col < m && row < m) {
        int add = 0;
        
        // Reduce memory accesses by loading row elements once
        for (int i = 0; i < m; i++) {
            int a_element = a[row * m + i];
            int b_element = b[i * m + col];
            add += a_element * b_element;
        }
        
        c[row * m + col] = add;
    }
}