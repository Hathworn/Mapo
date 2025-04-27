#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forward_kernel(const float *x, const float *mean, const float *var, const float *weight, const float *bias, float *y, float *z, float eps, int N, int C, int S) {
    int plane = blockIdx.x;

    // Cache mean and variance for the current plane
    float _mean = mean[plane];
    float _var = var[plane];
    
    // Calculate inverse standard deviation and consider epsilon for numerical stability
    float invStd = rsqrtf(_var + eps);
    
    // Calculate gamma and beta for the current plane
    float gamma = (weight != nullptr) ? fabsf(weight[plane]) + eps : 1.f;
    float beta = (bias != nullptr) ? bias[plane] : 0.f;
    
    int globalIdx = (blockIdx.x * blockDim.x + threadIdx.x); // Global thread index
    int threadCount = blockDim.x * N; // Total number of threads
    
    // Use a single loop with stride across batches and spatial size
    for (int idx = globalIdx; idx < N * S; idx += threadCount) {
        int batch = idx / S;
        int n = idx % S;
        
        float _x = x[(batch * C + plane) * S + n]; // Load input
        float _y = (_x - _mean) * invStd;          // Normalize
        float _z = _y * gamma + beta;              // Scale and shift
        
        y[(batch * C + plane) * S + n] = _y;       // Write output y
        z[(batch * C + plane) * S + n] = _z;       // Write output z
    }
}