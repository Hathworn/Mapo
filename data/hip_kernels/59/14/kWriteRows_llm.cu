#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kWriteRows(float* data, float* target, int num_images, int num_modules, int num_modules_batch, int module_id_offset, float beta) {
    int c = blockIdx.y;
    int src_module_id = blockIdx.x;
    int dst_module_id = module_id_offset + blockIdx.x;

    // Pre-calculate the offsets to avoid recalculating in the loop
    float* data_offset = data + num_images * (src_module_id + c * num_modules_batch);
    float* target_offset = target + num_images * (dst_module_id + c * num_modules);

    int im = threadIdx.x;
    int stride = blockDim.x;

    // Use a loop with stride to minimize thread divergence
    while (im < num_images) {
        target_offset[im] = beta * data_offset[im];
        im += stride;
    }
}