#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kReadRows(float* data, float* target, int num_images, int num_modules, int num_modules_batch, int module_id_offset) {
    int c = blockIdx.y;
    int src_module_id = module_id_offset + blockIdx.x;
    int dst_module_id = blockIdx.x;
    
    // Pre-calculate common offsets to reduce redundant calculations
    int data_offset = num_images * (src_module_id + c * num_modules);
    int target_offset = num_images * (dst_module_id + c * num_modules_batch);

    // Use shared memory for faster access if beneficial (not used here as no repeated access pattern)
    // __shared__ float data_shared[blockDim.x]; 

    data += data_offset;
    target += target_offset;

    // Use warp-level parallelism to optimize data transfer
    int im = threadIdx.x + blockDim.x * blockIdx.z;
    while (im < num_images) {
        target[im] = data[im];
        im += blockDim.x * gridDim.z;
    }
}