#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kWriteRowsMult(float* data, float* target, int num_images, int num_modules, int num_modules_batch, int module_id_offset, float alpha, float beta) {
    int c = blockIdx.y;
    int src_module_id = blockIdx.x;
    int dst_module_id = module_id_offset + src_module_id;  // Remove redundant calculation

    data += num_images * (src_module_id + c * num_modules_batch);
    target += num_images * (dst_module_id + c * num_modules);

    int im = threadIdx.x;
    int stride = blockDim.x;  // Use stride for increment

    for (; im < num_images; im += stride) {
        target[im] = alpha * target[im] + beta * data[im];  // Use existing stride
    }
}