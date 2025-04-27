#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ int mirror(int index, int len){
    int s2 = 2 * len - 2;
    if(index < 0){
        index = s2 * (-index / s2) + index;
        return index <= 1 - len ? index + s2 : -index;
    }
    if(index >= len){
        index -= s2 * (index / s2);
        if(index >= len)
            index = s2 - index;
        return index;
    }
    if(index < 0 || index >= len) index = mirror(index, len);
    return index;
}

__global__ void gussain_filter_x(float* random, float* kernel, int lw, size_t dim_z, size_t dim_y, size_t dim_x, int mode, float cval){
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    size_t total = dim_x * dim_y * dim_z;
    size_t total_xy = dim_x * dim_y;
    size_t id_x = index % dim_x;
    size_t id_y = (index / dim_x) % dim_y;
    size_t id_z = (index / total_xy) % dim_z;
    size_t id_block = index / total;
    
    if(index >= total * (dim_z > 1 ? 3 : 2)) return; // Exit early if index is out of bounds

    float new_pixel = 0.0f;
    
    int start = -lw;
    int end = lw + 1;
    int block_offset = id_block * total + id_z * total_xy + id_y * dim_x; // Precompute block offset

    if(mode == 0){
        for(int i = start; i < end; ++i){
            int id = id_x + i;
            // Clamp with constant value if out of bounds
            new_pixel += ((id < 0 || id >= dim_x) ? cval : kernel[i + lw] * random[block_offset + id]) * kernel[i + lw];
        }
    } else {
        for(int i = start; i < end; ++i){
            int id = mirror(id_x + i, dim_x);
            // Use mirrored index if out of bounds
            new_pixel += kernel[i + lw] * random[block_offset + id];
        }
    }
    __syncthreads();
    random[index] = new_pixel; // Write result to memory
    __syncthreads();
}