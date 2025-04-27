#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void kOutpTraceMultiplyImages(float *expanded_images, float *expanded_derivs, int num_images, int num_channels, int num_modules_batch, int kernel_size) {
    int color = blockIdx.y;
    int module_id = blockIdx.x;
    int thread_id = threadIdx.x;

    // Compute offsets outside of the loop to avoid repeated calculations
    float *images_base = expanded_images + num_images * (num_modules_batch * kernel_size * color + module_id);
    float *derivs_base = expanded_derivs + num_images * (num_modules_batch * color + module_id);

    for (int kpos = 0; kpos < kernel_size; kpos++) {
        for (int im = thread_id; im < num_images; im += blockDim.x) {
            // Use precomputed base pointers
            int image_idx = im + num_images * num_modules_batch * kpos;
            int deriv_idx = im;
            images_base[image_idx] *= derivs_base[deriv_idx];
        }
        
        __syncthreads(); // Ensure all threads have completed before the next iteration
    }
}