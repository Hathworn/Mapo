#include "hip/hip_runtime.h"
#include "includes.h"
__device__ void exchange(float &a, float &b){
    float temp = a;
    a = b;
    b = temp;
}

__global__ void flip_2D(float* coords, size_t dim_y, size_t dim_x, int do_y, int do_x){
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    size_t total = dim_x * dim_y;
    
    if(index < total){
        size_t id_x = index % dim_x; // Moved inside to reduce division calls
        size_t id_y = index / dim_x;
        
        if(do_x && id_x < (dim_x / 2)){
            exchange(coords[total + id_y * dim_x + id_x], 
                     coords[total + id_y * dim_x + dim_x - 1 - id_x]);
            // Removed __syncthreads(); not needed here since no shared memory is used
        }
    
        if(do_y && id_y < (dim_y / 2)){
            exchange(coords[id_y * dim_x + id_x], 
                     coords[(dim_y - 1 - id_y) * dim_x + id_x]);
            // Removed __syncthreads(); not needed here since no shared memory is used
        }
    }
}