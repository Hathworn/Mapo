#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void limitCoeff (int nBatch, int rbs, int rScale, float maxCoeff, float *DA, float *RA, float *CA)
{
    int taskIdx = blockIdx.x * blockDim.x + threadIdx.x;
    if (taskIdx < nBatch)
    {
        int i = taskIdx;
        int nCoeff = 2;

        int daOffset = i * rbs * rScale * nCoeff;
        int raOffset = i * rbs * rScale;
        int caOffset = i * nCoeff;

        // Use shared memory for coefficients
        __shared__ float sharedCA[2];

        sharedCA[0] = CA[caOffset];
        sharedCA[1] = CA[caOffset + 1];

        // Check and adjust coefficients using atomic operations
        if (sharedCA[1] > maxCoeff || sharedCA[1] < -maxCoeff) {
            sharedCA[1] = sharedCA[1] > maxCoeff ? maxCoeff : (sharedCA[1] < -maxCoeff ? -maxCoeff : sharedCA[1]);

            float suma = 0.0f;
            float sumb = 0.0f;

            // Use loop unrolling for efficient computation
            for (int j = 0; j < rbs * rScale; j += 4) {
                suma += DA[daOffset + j] + DA[daOffset + j + 1] + DA[daOffset + j + 2] + DA[daOffset + j + 3];
                sumb += RA[raOffset + j] + RA[raOffset + j + 1] + RA[raOffset + j + 2] + RA[raOffset + j + 3];
            }

            // Use atomic operation to update CA[caOffset]
            atomicExch(&CA[caOffset], (sumb - sharedCA[1] * suma) / (rbs * rScale));
            // Update the second coefficient back to global memory
            atomicExch(&CA[caOffset + 1], sharedCA[1]);
        }
    }
}