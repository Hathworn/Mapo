#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void blurnaive(float* matrix, float* output, int firstFrame, int numFrames, int frameCount, int max, int length) {
    int chan = (blockIdx.x * blockDim.x + threadIdx.x) << 1;
    float amp = 0.0f;
    float freq = 0.0f;

    if (chan < length) {
        // Unrolling loop for improved performance
        int frame = firstFrame;
        for (int i = 0; i < numFrames; i++) {
            amp += matrix[frame * length + chan];
            freq += matrix[frame * length + chan + 1];
            frame = (frame + 1) % max; // Move outside loop if frameCount % numFrames == 0
        }
        
        // Pre-calculate reciprocal for reduced division cost
        float invNumFrames = 1.0f / numFrames;
        output[chan] = amp * invNumFrames;
        output[chan + 1] = freq * invNumFrames;
    }
}