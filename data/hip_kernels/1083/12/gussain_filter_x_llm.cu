```c
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

__global__ void gussain_filter_x(float* random, float* kernel, int lw, size_t dim_z, size_t dim_y, size_t dim_x, int mode, float cval) {
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    size_t total = dim_x * dim_y * dim_z;
    if (index >= total) return;  // Early exit for invalid threads

    size_t total_xy = dim_x * dim_y;
    size_t id_x = index % dim_x;
    size_t id_y = (index / dim_x) % dim_y;
    size_t id_z = index / total_xy;
    size_t id_block = index / total;
    float new_pixel = 0.0f;

    for (int i = -lw; i <= lw; ++i) {
        int id = id_x + i;
        if (mode == 0) {
            if (id < 0 || id >= dim_x)
                new_pixel += cval * kernel[i + lw];
            else
                new_pixel += kernel[i + lw] * random[id_block * total + id_z * total_xy + id_y * dim_x + id];
        } else {
            id = mirror(id, dim_x);
            new_pixel += kernel[i + lw] * random[id_block * total + id_z * total_xy + id_y * dim_x + id];
        }
    }
    // Writes the new pixel value
    random[index] = new_pixel;
}