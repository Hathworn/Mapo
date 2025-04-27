#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Inc2(float *Ad, float *Bd) {
    // Use a more efficient block size
    int tx = hipThreadIdx_x + hipBlockIdx_x * hipBlockDim_x;
    if (tx < 1024) {
        float tmpA = Ad[tx]; // Cache Ad[tx] to a temporary variable
        for (int i = 0; i < ITER; i++) {
            tmpA += 1.0f;
            Ad[tx] = tmpA;
            float tmpB = tmpA; // Cache result for Bd[tx] to avoid redundant loads
            for (int j = 0; j < 256; j++) {
                Bd[tx] = tmpB; // Avoid recomputation inside the loop
            }
        }
    }
}