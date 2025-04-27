#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_gpu(int b, int n, int c, int m, int nsample, const float *points, const int *idx, float *out) {
    // Calculate batch, index, and stride
    int batch_index = blockIdx.x;
    int index = threadIdx.x;
    int stride = blockDim.x;

    // Adjust pointers for the current batch
    points += n * c * batch_index;
    idx += m * nsample * batch_index;
    out += m * nsample * c * batch_index;

    // Use threads to handle multiple samples per group point
    for (int j = index; j < m; j += stride) {
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j * nsample + k];  // Sample index
            float *out_ptr = &out[j * nsample * c + k * c];  // Pointer to output location
            const float *point_ptr = &points[ii * c];  // Pointer to point location

            // Copy data using pointer arithmetic for efficient memory operations
            for (int l = 0; l < c; ++l) {
                out_ptr[l] = point_ptr[l];
            }
        }
    }
}