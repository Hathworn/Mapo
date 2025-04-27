#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kWriteRows(float* data, float* target, int num_images, int num_modules, int num_modules_batch, int module_id_offset, float beta) {
    int c = blockIdx.y;
    int src_module_id = blockIdx.x;
    int dst_module_id = module_id_offset + blockIdx.x;

    // Simplified pointer arithmetic
    float* data_ptr = data + num_images * (src_module_id + c * num_modules_batch);
    float* target_ptr = target + num_images * (dst_module_id + c * num_modules);

    int im = threadIdx.x;
    int stride = blockDim.x;
    // Use loop unrolling for the iteration
    #pragma unroll
    for (; im < num_images; im += stride) {
        target_ptr[im] = beta * data_ptr[im];
    }
}