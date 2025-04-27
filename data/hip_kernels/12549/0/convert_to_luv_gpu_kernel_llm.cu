#include "hip/hip_runtime.h"
#include "includes.h"

//#define __OUTPUT_PIX__

#define BLOCK_SIZE 32
__constant__ __device__ float lTable_const[1064];
__constant__ __device__ float mr_const[3];
__constant__ __device__ float mg_const[3];
__constant__ __device__ float mb_const[3];

__global__ void convert_to_luv_gpu_kernel(unsigned char *in_img, float *out_img, int cols, int rows, bool use_rgb)
{
    // Calculate the pixel position in the image
    unsigned int x_pos = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y_pos = blockIdx.y * blockDim.y + threadIdx.y;

    if ((x_pos < cols) && (y_pos < rows)) {
        unsigned int pos = (y_pos * cols) + x_pos;
        
        // Instead of multiple global memory accesses, using registers for r, g, b
        float r = (float)in_img[(3 * pos) + (use_rgb ? 0 : 2)];
        float g = (float)in_img[(3 * pos) + 1];
        float b = (float)in_img[(3 * pos) + (use_rgb ? 2 : 0)];

        // Direct transformation to target variables
        float x = (mr_const[0] * r) + (mg_const[0] * g) + (mb_const[0] * b);
        float y = (mr_const[1] * r) + (mg_const[1] * g) + (mb_const[1] * b);
        float z = (mr_const[2] * r) + (mg_const[2] * g) + (mb_const[2] * b);

        // Precompute constants outside the critical path
        const float maxi = 1.0f / 270;
        const float minu = -88.0f * maxi;
        const float minv = -134.0f * maxi;
        const float un = 0.197833f;
        const float vn = 0.468331f;

        // Luv conversion with fused multiply-add (FMA) style operations
        float lt = lTable_const[static_cast<int>((y * 1024))];
        float l = lt;
        z = 1.0f / (x + (15.0f * y) + (3.0f * z) + 1e-35f);
        float u = (lt * (13.0f * 4.0f * x * z - 13.0f * un)) - minu;
        float v = (lt * (13.0f * 9.0f * y * z - 13.0f * vn)) - minv;

        // Output the results
        out_img[(3 * pos)] = l;
        out_img[(3 * pos) + 1] = u;
        out_img[(3 * pos) + 2] = v;
    }
}