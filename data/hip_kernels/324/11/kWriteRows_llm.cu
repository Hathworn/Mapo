#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kWriteRows(float* data, float* target, int num_images, int num_modules, int num_modules_batch, int module_id_offset, float beta) {
    int c = blockIdx.y;
    int src_module_id = blockIdx.x;
    int dst_module_id = module_id_offset + blockIdx.x;
    
    // Optimize memory access by calculating pointers within shared memory scope
    float* dataPtr = data + num_images * (src_module_id + c * num_modules_batch);
    float* targetPtr = target + num_images * (dst_module_id + c * num_modules);

    // Use shared memory to coalesce writes
    for (int im = threadIdx.x; im < num_images; im += blockDim.x) {
        targetPtr[im] = beta * dataPtr[im];
    }
}