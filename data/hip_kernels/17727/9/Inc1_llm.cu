#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Inc1(float *Ad, float *Bd) {
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    if (tx < 1) {
        float a = Ad[tx]; // Store Ad[tx] in a register
        for (int i = 0; i < ITER; ++i) {
            a = a + 1.0f; // Update a instead of Ad[tx]
            float b = a; // Store a in a temporary variable b
            for (int j = 0; j < 256; ++j) {
                Bd[tx] = b; // Use b instead of Ad[tx]
            }
        }
        Ad[tx] = a; // Write back the final result to Ad[tx]
    }
}