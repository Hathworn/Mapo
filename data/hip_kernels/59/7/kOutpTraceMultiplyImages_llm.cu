#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kOutpTraceMultiplyImages(float *expanded_images, float *expanded_derivs, int num_images, int num_channels, int num_modules_batch, int kernel_size) {
    int color = blockIdx.y;
    int module_id = blockIdx.x;
    int thread_stride = blockDim.x;
    int expanded_images_offset = num_images * num_modules_batch * (kernel_size * color + module_id);
    int expanded_derivs_offset = num_images * num_modules_batch * color + num_images * module_id;

    expanded_images += expanded_images_offset;
    expanded_derivs += expanded_derivs_offset;

    // Optimize loop by reducing pointer arithmetic in the inner loop
    for (int kpos = 0; kpos < kernel_size; kpos++) {
        int kernel_offset = num_images * num_modules_batch * kpos;
        for (int im = threadIdx.x; im < num_images; im += thread_stride) {
            int image_idx = im + kernel_offset;
            expanded_images[image_idx] *= expanded_derivs[im];
        }
        // Synchronization is unnecessary between iterations since no dependencies
    }
}