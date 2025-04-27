#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kHingeQuadraticRowMajor(float* __restrict__ mat, float* __restrict__ labels, float* __restrict__ target, unsigned int width, unsigned int height, float margin) {
    int image_id = blockIdx.x * blockDim.x + threadIdx.x;

    if (image_id < height) {
        mat += image_id;
        target += image_id;
        const int correct_label = static_cast<int>(labels[image_id]);
        const float correct_label_score = mat[correct_label * height];
        float sum = 0;

        // Unroll the loop using manual loop unrolling for performance gain.
        unsigned int i;
        for (i = 0; i + 4 <= width; i += 4) {
            #pragma unroll
            for (int j = 0; j < 4; ++j) { // Inner loop for unrolling step
                float diff = margin + mat[(i + j) * height] - correct_label_score;
                float grad = (diff > 0) ? diff : 0;
                target[(i + j) * height] = ((i + j) == correct_label) ? 0 : grad;
                sum += ((i + j) == correct_label) ? 0 : grad;
            }
        }

        // Handle remaining elements that were not part of the loop unrolling
        for (; i < width; i++) {
            float diff = margin + mat[i * height] - correct_label_score;
            float grad = (diff > 0) ? diff : 0;
            target[i * height] = (i == correct_label) ? 0 : grad;
            sum += (i == correct_label) ? 0 : grad;
        }

        target[correct_label * height] = -sum;
    }
}