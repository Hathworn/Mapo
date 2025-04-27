#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void naivekernel(float* output, float* frameA, float* frameB, int chans) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = i << 1;
    
    // Check if index is within bounds before accessing memory
    if (i < chans) {
        float2 a = reinterpret_cast<float2*>(frameA)[i]; // Load two floats at once
        float2 b = reinterpret_cast<float2*>(frameB)[i]; // Load two floats at once
        
        // Use inline conditional operator for concise code
        reinterpret_cast<float2*>(output)[i] = (a.x >= b.x) ? a : b;
    }
}