#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 256
#define EPS 1e-4

// Optimize global memory access using shared memory
__global__ void bilateral_smooth_kernel(float *affine_model, float *filtered_affine_model, float *guide, int h, int w, int kernel_radius, float sigma1, float sigma2) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int size = h * w;
    
    // Declare shared memory for guide
    __shared__ float shared_guide[TB * 3];
    
    if (id < size) {
        int x = id % w;
        int y = id / w;

        double sum_affine[12] = {};
        double sum_weight = 0;
        
        // Load guide data into shared memory for current block
        for (int i = 0; i < 3; i++) {
            shared_guide[threadIdx.x * 3 + i] = guide[id + i * size];
        }
        __syncthreads();
        
        for (int dx = -kernel_radius; dx <= kernel_radius; dx++) {
            for (int dy = -kernel_radius; dy <= kernel_radius; dy++) {
                int yy = y + dy, xx = x + dx;
                int id2 = yy * w + xx;
                if (0 <= xx && xx < w && 0 <= yy && yy < h) {
                    // Calculate color differences using shared memory
                    float color_diff1 = shared_guide[threadIdx.x * 3] - shared_guide[(yy*w + xx) % TB * 3];
                    float color_diff2 = shared_guide[threadIdx.x * 3 + 1] - shared_guide[(yy*w + xx) % TB * 3 + 1];
                    float color_diff3 = shared_guide[threadIdx.x * 3 + 2] - shared_guide[(yy*w + xx) % TB * 3 + 2];
                    float color_diff_sqr = (color_diff1 * color_diff1 + color_diff2 * color_diff2 + color_diff3 * color_diff3) / 3;

                    float v1 = exp(-(dx * dx + dy * dy) / (2 * sigma1 * sigma1));
                    float v2 = exp(-(color_diff_sqr) / (2 * sigma2 * sigma2));
                    float weight = v1 * v2;

                    // Use cache-friendly memory access
                    for (int i = 0; i < 3; i++) {
                        for (int j = 0; j < 4; j++) {
                            int affine_id = i * 4 + j;
                            sum_affine[affine_id] += weight * affine_model[id2 * 12 + affine_id];
                        }
                    }
                    sum_weight += weight;
                }
            }
        }

        // Update filtered affine model
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 4; j++) {
                int affine_id = i * 4 + j;
                filtered_affine_model[id * 12 + affine_id] = sum_affine[affine_id] / sum_weight;
            }
        }
    }
}