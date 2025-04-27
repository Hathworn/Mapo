#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void yuv422_to_yuv444_kernel(const void * src, void * out, int pix_count) {
    // Calculate global thread index
    const int global_idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Each thread processes two pixels (4 YUV422-packed bytes)
    const int out_idx = global_idx * 3; // Output index offset for 3 YUV444 pixels
    const int in_idx = global_idx * 2;  // Input index offset for 2 YUV422 pixels

    // Skip if out of bounds
    if (in_idx >= pix_count) {
        return;
    }

    uchar4 *src_data = (uchar4 *)src;
    uchar4 *out_data = (uchar4 *)out;

    // Fetch two sets of YUV422 pixels
    uchar4 pix12 = src_data[in_idx];
    uchar4 pix34 = src_data[in_idx + 1];

    // Output 3 YUV444 pixels from the 2 YUV422 pixels
    out_data[out_idx]     = make_uchar4(pix12.y, pix12.x, pix12.z, pix12.w);   // First Y, U, V, A
    out_data[out_idx + 1] = make_uchar4(pix12.x, pix12.z, pix34.y, pix34.x);   // Second Y, V, Y, U
    out_data[out_idx + 2] = make_uchar4(pix34.z, pix34.w, pix34.x, pix34.z);   // Third V, A, Y, V
}