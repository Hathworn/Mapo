#include "hip/hip_runtime.h"
#include "includes.h"

#define STB_IMAGE_WRITE_IMPLEMENTATION

#define checkCudaErrors(val) check_cuda( (val), #val, __FILE__, __LINE__ )

__global__ void render(float *fb, int max_x, int max_y) {
    // Use flat 1D thread indexing for better coalesced memory access
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;
    int pixel_index = threadId * 3;
    
    // Calculate pixel coordinates
    int i = threadId % max_x;
    int j = threadId / max_x;

    if (i < max_x && j < max_y) {
        // Directly calculate float division once and store in variable
        float inv_max_x = 1.0f / max_x;
        float inv_max_y = 1.0f / max_y;
        
        fb[pixel_index + 0] = i * inv_max_x;
        fb[pixel_index + 1] = j * inv_max_y;
        fb[pixel_index + 2] = 0.0f;
    }
}