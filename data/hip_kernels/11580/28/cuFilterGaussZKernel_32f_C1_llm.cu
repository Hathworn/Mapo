#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuFilterGaussZKernel_32f_C1(float* dst, float* src, const int y, const int width, const int depth, const size_t stride, const size_t slice_stride, float sigma, int kernel_size)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int z = blockIdx.y * blockDim.y + threadIdx.y;

    if(x < width && z < depth) // Removed unnecessary checks
    {
        float sum = 0.0f;
        int half_kernel_elements = (kernel_size - 1) / 2;

        // Precompute constants for Gaussian
        float g0 = 1.0f / (sqrtf(2.0f * 3.141592653589793f) * sigma);
        float g1 = exp(-0.5f / (sigma * sigma));
        float g2 = g1 * g1;

        sum = g0 * src[z * slice_stride + y * stride + x];
        float sum_coeff = g0;

        float g = g0; // Use 'g' to track the current weight factor
        for (int i = 1; i <= half_kernel_elements; i++)
        {
            g *= g1;
            int cur_z_pos = min(depth - 1, z + i);
            int cur_z_neg = max(0, z - i);
            sum += g * (src[cur_z_pos * slice_stride + y * stride + x] + src[cur_z_neg * slice_stride + y * stride + x]);
            sum_coeff += 2.0f * g;
        }
        dst[z * slice_stride + y * stride + x] = sum / sum_coeff;
    }
}