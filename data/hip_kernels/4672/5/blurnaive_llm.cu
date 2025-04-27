#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void blurnaive(float* matrix, float* output, int firstFrame, int numFrames, int frameCount, int max, int length) {
    int chan = (blockIdx.x * blockDim.x + threadIdx.x) * 2;
    float amp = 0.0f;
    float freq = 0.0f;
    if (chan < length) {
        // Use shared memory for reduced global memory access
        extern __shared__ float shared_data[];
        float* shared_matrix = shared_data;
        
        for (int frame = firstFrame; frame != frameCount; frame = (frame + 1) % max) {
            // Load matrix elements into shared memory
            shared_matrix[threadIdx.x * 2] = matrix[frame * length + chan];
            shared_matrix[threadIdx.x * 2 + 1] = matrix[frame * length + chan + 1];
            __syncthreads(); // Ensure all threads have loaded the data
            
            // Accumulate summations using the shared memory
            amp += shared_matrix[threadIdx.x * 2];
            freq += shared_matrix[threadIdx.x * 2 + 1];
            __syncthreads();
        }
        output[chan] = amp / numFrames;
        output[chan + 1] = freq / numFrames;
    }
}