#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kHingeLinearRowMajor(float* mat, float* labels, float* target, unsigned int width, unsigned int height, float margin) {
    int image_id = blockIdx.x * blockDim.x + threadIdx.x;
    if (image_id < height) {
        mat += image_id;
        target += image_id;
        const int correct_label = (int)labels[image_id];
        const float correct_label_score = mat[correct_label * height];
        float sum = 0;

        // Loop unrolling: process four elements at a time
        for (unsigned int i = 0; i < width / 4 * 4; i += 4) {
            float diff0 = margin + mat[i * height] - correct_label_score;
            float diff1 = margin + mat[(i + 1) * height] - correct_label_score;
            float diff2 = margin + mat[(i + 2) * height] - correct_label_score;
            float diff3 = margin + mat[(i + 3) * height] - correct_label_score;

            float grad0 = (diff0 > 0) ? 1 : 0;
            float grad1 = (diff1 > 0) ? 1 : 0;
            float grad2 = (diff2 > 0) ? 1 : 0;
            float grad3 = (diff3 > 0) ? 1 : 0;

            if (i != correct_label) {
                target[i * height] = grad0;
                sum += grad0;
            }
            if (i + 1 != correct_label) {
                target[(i + 1) * height] = grad1;
                sum += grad1;
            }
            if (i + 2 != correct_label) {
                target[(i + 2) * height] = grad2;
                sum += grad2;
            }
            if (i + 3 != correct_label) {
                target[(i + 3) * height] = grad3;
                sum += grad3;
            }
        }

        // Handle the remaining elements
        for (unsigned int i = width / 4 * 4; i < width; i++) {
            float diff = margin + mat[i * height] - correct_label_score;
            float grad = (diff > 0) ? 1 : 0;
            target[i * height] = (i == correct_label) ? 0 : grad;
            sum += (i == correct_label) ? 0 : grad;
        }

        target[correct_label * height] = -sum;
    }
}