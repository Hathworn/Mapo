#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixColour(float *a, float *b, int n) {
    int j = blockDim.x * blockIdx.x + threadIdx.x;

    if (j < n) {
        for (int i = 0; i < n; i++) {
            // Minimize printf usage for better performance
            if (a[j * n + i] == 1) {
                if (b[j] == b[i]) {
                    b[j] = -1;
                    break;
                }
            }
        }
    }
}