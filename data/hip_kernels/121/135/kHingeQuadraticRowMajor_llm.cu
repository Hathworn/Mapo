#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kHingeQuadraticRowMajor(float* mat, float* labels, float* target, unsigned int width, unsigned int height, float margin) {
    // Use shared memory to cache data for the current image
    extern __shared__ float sdata[];
    int image_id = blockIdx.x * blockDim.x + threadIdx.x;
    if (image_id < height) {
        mat += image_id;
        target += image_id;
        const int correct_label = (int)labels[image_id];
        const float correct_label_score = mat[correct_label * height];

        float sum = 0;
        for (unsigned int i = threadIdx.x; i < width; i += blockDim.x) { // Use all threads in the block
            float diff = margin + mat[i * height] - correct_label_score;
            float grad = (diff > 0) ? diff : 0;
            target[i * height] = (i == correct_label) ? 0 : grad;
            sum += (i == correct_label) ? 0 : grad;
        }

        sdata[threadIdx.x] = sum; // Store partial sum in shared memory
        __syncthreads(); // Ensure all threads have written their partial sums
        
        // Reduce partial sums within block
        for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
            if (threadIdx.x < stride) {
                sdata[threadIdx.x] += sdata[threadIdx.x + stride];
            }
            __syncthreads();
        }
        
        if (threadIdx.x == 0) {
            target[correct_label * height] = -sdata[0];
        }
    }
}