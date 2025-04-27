#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kReadRows(float* data, float* target, int num_images, int num_modules, int num_modules_batch, int module_id_offset) {
    // Perform calculations to determine offsets outside of the loop
    int c = blockIdx.y;
    int src_module_id = module_id_offset + blockIdx.x;
    int dst_module_id = blockIdx.x;

    int src_offset = num_images * (src_module_id + c * num_modules);
    int dst_offset = num_images * (dst_module_id + c * num_modules_batch);

    // Use shared memory to reduce global memory access latency
    __shared__ float cachedData[1024];  // Adjust the size according to blockDim.x
    
    data += src_offset;
    target += dst_offset;

    for (int im = threadIdx.x; im < num_images; im += blockDim.x) {
        // Load data into shared memory
        cachedData[threadIdx.x] = data[im];
        __syncthreads();  // Synchronize threads to ensure data integrity

        // Read from shared memory instead of global memory
        target[im] = cachedData[threadIdx.x];
        __syncthreads();  // Synchronize threads to ensure next loop iteration is consistent
    }
}