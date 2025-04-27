#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cubefilling_loop(const float* __restrict__ image, float * __restrict__ dev_cube_wi, float * __restrict__ dev_cube_w, const dim3 image_size, int scale_xy, int scale_eps, dim3 dimensions_down)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (i < dimensions_down.x && j < dimensions_down.y) {
        size_t cube_idx_1 = i + dimensions_down.x * j;
        
        // Precompute array index offsets for efficiency
        int i_offset = scale_xy * i;
        int j_offset = scale_xy * j;
        
        #pragma unroll
        for (int ii = 0; ii < scale_xy; ii++) {
            int i_idx = i_offset + ii;
            if (i_idx < image_size.x) {
                #pragma unroll
                for (int jj = 0; jj < scale_xy; jj++) {
                    int j_idx = j_offset + jj;
                    if (j_idx < image_size.y) {
                        
                        // Utilize efficient floored division
                        float k = image[i_idx + image_size.x * j_idx];
                        size_t z_index = __float2int_rd(k / scale_eps);
                        
                        if (z_index < dimensions_down.z) {
                            size_t cube_idx_2 = cube_idx_1 + dimensions_down.x * dimensions_down.y * z_index;
                            // Use atomic operations to avoid data races
                            atomicAdd(&dev_cube_wi[cube_idx_2], k);
                            atomicAdd(&dev_cube_w[cube_idx_2], 1.0f);
                        }
                    }
                }
            }
        }
    }
}