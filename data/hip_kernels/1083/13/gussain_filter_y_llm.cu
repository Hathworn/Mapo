#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ int mirror(int index, int len) {
    int s2 = 2 * len - 2;
    if (index < 0) {
        index = s2 * (-index / s2) + index;
        return index <= 1 - len ? index + s2 : -index;
    }
    if (index >= len) {
        index -= s2 * (index / s2);
        if (index >= len)
            index = s2 - index;
        return index;
    }
    return index;
}

__global__ void gussain_filter_y(float* random, float* kernel, int lw, size_t dim_z, size_t dim_y, size_t dim_x, int mode, float cval) {
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    size_t total = dim_x * dim_y * dim_z;
    size_t total_xy = dim_x * dim_y;

    // Early exit if index is out of bounds
    if (index >= total) return;

    size_t id_x = index % dim_x;
    size_t id_y = (index / dim_x) % dim_y;
    size_t id_z = (index / total_xy) % dim_z;
    size_t id_block = index / total;

    float new_pixel = 0.0f;

    // Optimize: Flatten the id calculation and loop only up to required range
    for (int i = -lw; i <= lw; ++i) {
        int id = id_y + i;
        float kernel_value = kernel[i + lw];

        if (mode == 0) {
            // Directly handle out of bounds situation
            if (id < 0 || id >= dim_y) {
                new_pixel += cval * kernel_value;
            } else {
                new_pixel += kernel_value *
                             random[id_block * total + id_z * total_xy + id * dim_x + id_x];
            }
        } else {
            // Use mirror boundary
            id = mirror(id, dim_y);
            new_pixel += kernel_value *
                         random[id_block * total + id_z * total_xy + id * dim_x + id_x];
        }
    }

    __syncthreads();
    random[index] = new_pixel;
}