#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void yuv422_to_yuv444_kernel(const void * src, void * out, int pix_count) {
    // Calculate thread index
    const int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Return if out of bounds
    if (idx >= pix_count / 2) return;

    uchar4 *src_ptr = (uchar4 *)src + idx * 2;
    uchar4 *dst_ptr = (uchar4 *)out + idx * 3;

    uchar4 pix12 = src_ptr[0];
    uchar4 pix34 = src_ptr[1];

    // Optimize by using a single step assignment
    dst_ptr[0] = {pix12.y, pix12.x, pix12.z, pix12.w}; 
    dst_ptr[1] = {pix12.x, pix12.z, pix34.y, pix34.x}; 
    dst_ptr[2] = {pix34.z, pix34.w, pix34.x, pix34.z}; 
}