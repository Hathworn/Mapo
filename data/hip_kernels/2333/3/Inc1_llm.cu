#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Inc1(float *Ad, float *Bd) {
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    if (tx < 1) {
        float aTemp = Ad[tx]; // Load once, use temporary variable
        for (int i = 0; i < ITER; i++) {
            aTemp = aTemp + 1.0f; // Update temporary variable
            float bTemp = aTemp;  // Use temporary variable for inner loop
            for (int j = 0; j < 256; j++) {
                Bd[tx] = bTemp; // Reduce redundant writes
            }
        }
        Ad[tx] = aTemp; // Write back only once
    }
}