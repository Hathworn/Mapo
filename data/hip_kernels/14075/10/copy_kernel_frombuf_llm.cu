#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void copy_kernel_frombuf(char *dest, char *src, int rx_s, int rx_e, int ry_s, int ry_e, int rz_s, int rz_e, int x_step, int y_step, int z_step, int size_x, int size_y, int size_z, int buf_strides_x, int buf_strides_y, int buf_strides_z, int type_size, int dim, int OPS_soa) {

    // Cache the block and thread indices
    int idx_z = rz_s + z_step * (blockDim.z * blockIdx.z + threadIdx.z);
    int idx_y = ry_s + y_step * (blockDim.y * blockIdx.y + threadIdx.y);
    int idx_x = rx_s + x_step * (blockDim.x * blockIdx.x + threadIdx.x);

    // Conditional boundary check using a single branch for each dimension
    if ((x_step == 1 ? (idx_x < rx_e) : (idx_x > rx_e)) &&
        (y_step == 1 ? (idx_y < ry_e) : (idx_y > ry_e)) &&
        (z_step == 1 ? (idx_z < rz_e) : (idx_z > rz_e))) {

        // Compute initial offset for dest
        size_t dest_offset = (idx_z * size_x * size_y + idx_y * size_x + idx_x) * type_size;
        if (!OPS_soa) dest_offset *= dim;
        dest += dest_offset;

        // Compute initial offset for src
        src += (((idx_z - rz_s) * z_step * buf_strides_z +
                 (idx_y - ry_s) * y_step * buf_strides_y +
                 (idx_x - rx_s) * x_step * buf_strides_x) * type_size * dim);

        // Unroll loop when dim is a known compile-time constant
        for (int d = 0; d < dim; d++) {
            memcpy(dest, src + d * type_size, type_size);
            // Efficient pointer arithmetic based on OPS_soa flag
            dest += (OPS_soa) ? (size_x * size_y * size_z * type_size) : type_size;
        }
    }
}