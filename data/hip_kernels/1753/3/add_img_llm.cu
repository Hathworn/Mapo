#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add_img(float *image_padded, float *ave1, float *ave2, int nx, int ny, int nima) {

    // Optimized index calculations and memory coalescing
    int bx = blockIdx.x;
    int tx = threadIdx.x;
    
    int index = tx + bx * nx;
    int stride = (nx * 2 + 2) * ny * 2;
    int index2 = tx + (nx >> 1) + (bx + (ny >> 1)) * (nx * 2 + 2);
    
    float sum1 = 0.0f;
    float sum2 = 0.0f;

    // Unroll loop for better performance
    for (int i = 0; i < nima; i += 2) {
        sum1 += image_padded[index2 + i * stride];
    }
    for (int i = 1; i < nima; i += 2) {
        sum2 += image_padded[index2 + i * stride];
    }

    // Store results
    ave1[index] = sum1;
    ave2[index] = sum2;
}