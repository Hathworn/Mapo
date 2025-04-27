#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline float3 addCuda(float3 a, float3 b) {
    return{ a.x + b.x, a.y + b.y, a.z + b.z };
}

__device__ inline float3 multiplyCuda(float a, float3 b) {
    return{ a * b.x, a * b.y, a * b.z };
}

__device__ inline float euclideanLenCuda(float3 a, float3 b, float d) {
    float mod = (b.x - a.x) * (b.x - a.x) + (b.y - a.y) * (b.y - a.y) + (b.z - a.z) * (b.z - a.z);
    return expf(-mod / (2.0f * d * d));
}

__global__ void bilateralFilterCudaKernel(float3* dev_input, float3* dev_output, float l2norm, int width, int height, int radius) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if ((x < width) && (y < height))
    {
        float sum = 0.0f;
        float3 t = { 0.f, 0.f, 0.f };
        float3 center = dev_input[y * width + x];
        int r = radius;

        // Use shared memory for domain distances to reduce repetitive access
        __shared__ float c_gaussian_shared[256]; // Example size, adjust based on actual usage

        float domainDist = 0.0f, colorDist = 0.0f, factor = 0.0f;

        for (int i = -r; i <= r; i++) {
            int crtY = min(max(y + i, 0), height - 1);

            for (int j = -r; j <= r; ++j) {
                int crtX = min(max(x + j, 0), width - 1);

                float3 curPix = dev_input[crtY * width + crtX];
                domainDist = c_gaussian_shared[r + i] * c_gaussian_shared[r + j];
                colorDist = euclideanLenCuda(curPix, center, l2norm);
                factor = domainDist * colorDist;
                sum += factor;
                t = addCuda(t, multiplyCuda(factor, curPix));
            }
        }

        dev_output[y * width + x] = multiplyCuda(1.f / sum, t);
    }
}