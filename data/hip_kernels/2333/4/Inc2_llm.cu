#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Inc2(float *Ad, float *Bd) {
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    if (tx < 1024) {
        for (int i = 0; i < ITER; i++) {
            float temp = Ad[tx] + 1.0f; // Use temporary variable to avoid multiple memory access
            Ad[tx] = temp;
            Bd[tx] = temp; // Minimize write operations to Bd
        }
    }
}