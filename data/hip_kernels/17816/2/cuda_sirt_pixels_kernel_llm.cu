#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_sirt_pixels_kernel(int p, int nx, int dx, float* recon, const float* data)
{
    int d0 = blockIdx.x * blockDim.x + threadIdx.x;
    int dstride = blockDim.x * gridDim.x;

    for (int d = d0; d < dx; d += dstride)
    {
        float sum = 0.0f;

        // Use shared memory for partial sums to reduce global memory access
        __shared__ float partialSum[256]; // assuming blockDim.x <= 256
        int tid = threadIdx.x;
        partialSum[tid] = 0.0f;

        for (int i = tid; i < nx; i += blockDim.x)
        {
            partialSum[tid] += recon[d * nx + i];
        }

        __syncthreads(); // Ensure all threads have computed their partial sum

        // Reduce partial sums within the block
        for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
        {
            if (tid < stride)
            {
                partialSum[tid] += partialSum[tid + stride];
            }
            __syncthreads();
        }

        sum = partialSum[0]; // Only thread 0 has the full sum

        if (tid == 0)
        {
            float upd = data[p * dx + d] - sum;
            for (int i = 0; i < nx; ++i)
            {
                recon[d * nx + i] += upd;
            }
        }
    }
}