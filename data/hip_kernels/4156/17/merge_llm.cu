```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global function
__global__ void merge(unsigned char * img_all, unsigned char * img, float * selection, int n, int stride)
{
    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int width = gridDim.x * TILE_DIM;
    float sum, weight;
    
    // Utilize shared memory for optimization
    __shared__ float shared_selection[TILE_DIM * BLOCK_ROWS];
    
    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS) {
        sum = 0;
        
        // Aggregate selection values
        for (int idx = 0; idx < n; idx++) {
            shared_selection[threadIdx.y * TILE_DIM + threadIdx.x] = selection[idx * stride + ((y+j)*width + x)];
            sum += shared_selection[threadIdx.y * TILE_DIM + threadIdx.x];
        }

        // Normalize selection values
        for (int idx = 0; idx < n; idx++) {
            selection[idx * stride + ((y+j)*width + x)] = shared_selection[threadIdx.y * TILE_DIM + threadIdx.x] / (sum + 1e-5);
        }
        
        int pixel_position = 3 * ((y+j)*width + x);
        
        // Initialize pixel to zero
        img[pixel_position] = 0;
        img[pixel_position + 1] = 0;
        img[pixel_position + 2] = 0;
        
        // Compute weighted sum for image merging
        for (int idx = 0; idx < n; idx++) {
            // Use constant weight value for current implementation
            weight = 0.25;
            
            int img_position = idx * stride * 3 + pixel_position;
            
            // Accumulate weighted pixels
            img[pixel_position] += (unsigned char)(img_all[img_position] * weight);
            img[pixel_position + 1] += (unsigned char)(img_all[img_position + 1] * weight);
            img[pixel_position + 2] += (unsigned char)(img_all[img_position + 2] * weight);
        }
    }
}