#include "hip/hip_runtime.h"
#include "includes.h"

#define PI 3.14159265358979323846

#define N 10000  // data size
#define ES 10000 // estimation size
#define HS 20    // histogram size

__global__ void estimationKernel(float* data, size_t n, float* kernelEstimation, size_t es, float dx, float h)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Precompute constant factors outside the loop
    float h_inv = 1.0f / h;
    float norm_factor = 1.0f / (n * h * sqrtf(2 * PI));

    for (int i = index; i < es; i += stride)
    {
        float di = dx * i; // current OX axis position
        float sum = 0.0f;  // initialize sum for current kernel estimation

        for (int j = 0; j < n; j++)
        {
            // Use precomputed h_inv for division
            float diff = di - data[j];
            float power = -0.5f * diff * diff * h_inv * h_inv;
            sum += expf(power);
        }
        
        // Apply normalization factor
        kernelEstimation[i] = sum * norm_factor;
    }
}