#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void crossFade(float* out1, float* out2, int numFrames) {
    // Calculate a global index for the current thread
    const int threadID = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure threadID does not exceed numFrames
    if (threadID < numFrames) {
        // Calculate fade factor once for the current thread
        float fn = float(threadID) / (numFrames - 1.0f);
        
        // Apply crossfade for two consecutive output indices
        int idx = threadID * 2;
        out1[idx] = out1[idx] * (1.0f - fn) + out2[idx] * fn;
        out1[idx + 1] = out1[idx + 1] * (1.0f - fn) + out2[idx + 1] * fn;
    }
}