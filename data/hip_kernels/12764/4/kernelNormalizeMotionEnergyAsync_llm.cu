#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelNormalizeMotionEnergyAsync(int bsx, int bsy, int n, float alphaPNorm, float alphaQNorm, float betaNorm, float sigmaNorm, float* gpuEnergyBuffer)
{
    int bufferPos = threadIdx.x + blockIdx.x * blockDim.x;
    float sigmaNorm2_2 = 2 * sigmaNorm * sigmaNorm;
    float gausCoe = 1 / (sigmaNorm2_2 * M_PI);

    // Declare shared memory for local block processing
    __shared__ float sharedMem[BLOCK_SIZE + 4]; // Assuming BLOCK_SIZE is defined

    if (bufferPos < n) {
        int bx, by;
        int bxy = bufferPos / (bsx * bsy);
        bx = bxy % bsx;
        by = bxy / bsx;
        
        // Load data into shared memory
        sharedMem[threadIdx.x] = gpuEnergyBuffer[bufferPos];
        __syncthreads();

        // Read energy
        float I = sharedMem[threadIdx.x];
        float q_i = 0;

        // Normalize over 5x5 region
        for (int y = -2; y <= 2; y++) {
            int by_ = by + y;

            if (by_ < 0 || by_ >= bsy)
                continue;

            for (int x = -2; x <= 2; x++) {
                int bx_ = bx + x;

                if (bx_ < 0 || bx_ >= bsx || (bx == bx_ && by == by_))
                    continue;

                // Use shared memory to avoid extra global memory access
                float gaus = gausCoe * expf(-(bx_ * bx_ + by_ * by_) / sigmaNorm2_2);
                int sharedIdx = (by_ % blockDim.y) * blockDim.x + (bx_ % blockDim.x);

                if (sharedIdx < BLOCK_SIZE + 4) { // Ensure no out of bounds access
                    q_i += sharedMem[sharedIdx] * gaus;
                }
            }
        }
        q_i /= alphaQNorm;

        // Compute p_i
        float p_i = (I * betaNorm) / (alphaPNorm + I + q_i);

        // Use normalized value
        gpuEnergyBuffer[bufferPos] = p_i;
    }
}