#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kReadRows(float* data, float* target, int num_images, int num_modules, int num_modules_batch, int module_id_offset) {
    // Calculate global thread index
    int global_thread_id = blockIdx.x * blockDim.x + threadIdx.x;
    int num_threads_in_block = blockDim.x * gridDim.x;

    // Calculate the offsets
    int c = blockIdx.y;
    int src_module_id = module_id_offset + blockIdx.x;
    int dst_module_id = blockIdx.x;

    data += num_images * (src_module_id + c * num_modules);
    target += num_images * (dst_module_id + c * num_modules_batch);

    // Distribute workload across threads
    for (int im = global_thread_id; im < num_images; im += num_threads_in_block) {
        target[im] = data[im];
    }
}