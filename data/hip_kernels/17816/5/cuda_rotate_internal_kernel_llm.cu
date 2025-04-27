#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuda_rotate_internal_kernel(float* dst, const float* src, float theta, const int nx, const int ny)
{
    // Precompute trigonometric values for better performance
    float cos_theta = cosf(theta);
    float sin_theta = sinf(theta);

    int src_size = nx * ny;
    float xoff = (0.5f * nx) - 0.5f;
    float yoff = (0.5f * ny) - 0.5f;

    int j0 = blockIdx.x * blockDim.x + threadIdx.x;
    int jstride = blockDim.x * gridDim.x;

    for (int j = j0; j < ny; j += jstride)
    {
        for (int i = 0; i < nx; ++i)
        {
            // Avoid recomputing rx and ry multiple times
            float rx = float(i) - xoff;
            float ry = float(j) - yoff;

            // Use precomputed cos_theta and sin_theta
            float tx = rx * cos_theta - ry * sin_theta;
            float ty = rx * sin_theta + ry * cos_theta;

            float x = (tx + xoff);
            float y = (ty + yoff);

            int rz = j * nx + i;
            auto index = [&](int _x, int _y) { return _y * nx + _x; };

            int x1 = floorf(x);
            int y1 = floorf(y);
            int x2 = x1 + 1;
            int y2 = y1 + 1;

            float fxy1 = 0.0f;
            float fxy2 = 0.0f;

            // Handle boundary conditions with checks
            int ixy11 = index(x1, y1);
            int ixy21 = index(x2, y1);
            int ixy12 = index(x1, y2);
            int ixy22 = index(x2, y2);

            if (ixy11 >= 0 && ixy11 < src_size)
                fxy1 += (x2 - x) * src[ixy11];
            if (ixy21 >= 0 && ixy21 < src_size)
                fxy1 += (x - x1) * src[ixy21];
            if (ixy12 >= 0 && ixy12 < src_size)
                fxy2 += (x2 - x) * src[ixy12];
            if (ixy22 >= 0 && ixy22 < src_size)
                fxy2 += (x - x1) * src[ixy22];

            dst[rz] += (y2 - y) * fxy1 + (y - y1) * fxy2;
        }
    }
}