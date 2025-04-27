#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_AT_expansion(float* A, int* rowind, int* colind, float* val, int npix, int nimages) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int total_elements = npix * nimages; // Precompute total elements
    if (i < total_elements) {
        int image_index = i % nimages; // Calculate once
        int pixel_index = i / nimages; // Calculate once
        int col_index = pixel_index + image_index * npix; // Simplify col_index computation

        colind[i] = col_index; 
        rowind[i] = pixel_index;
        val[i] = A[col_index];
    }
}