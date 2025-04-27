#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaKernelPull(float* mat, float* spins, int size, float* temp, float tempStep, 
                               float* meanFieldElements, bool* continueIteration, float minDiff, 
                               int* unemptyCells, float linearCoef) {
    int blockId = blockIdx.x;
    int thrId = threadIdx.x;
    int globalId = blockId * size + thrId;

    // Optimize loop launch bounds and thread utilization
    extern __shared__ float sharedMeanFieldElements[];

    do {
        // Lessen temperature
        if (thrId == 0)
            temp[blockId] -= tempStep;

        // Stabilize
        do {
            // By default current iteration is the last one
            if (thrId == 0)
                continueIteration[blockId] = false;

            for (int spinId = 0; spinId < size; ++spinId) {
                __syncthreads();

                // Load to shared memory for better memory access pattern
                int wIndex = thrId;
                while (wIndex < unemptyCells[spinId * (size + 1)]) {
                    int idx = unemptyCells[spinId * (size + 1) + wIndex + 1];
                    sharedMeanFieldElements[wIndex] = spins[idx + blockId * size] * mat[spinId * size + idx];
                    wIndex += blockDim.x;
                }
                __syncthreads();

                // Parallel reduction using shared memory
                for (unsigned int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
                    if (thrId < offset && (thrId + offset) < unemptyCells[spinId * (size + 1)]) {
                        sharedMeanFieldElements[thrId] += sharedMeanFieldElements[thrId + offset];
                    }
                    __syncthreads();
                }
                
                if (thrId == 0) {
                    float meanField = sharedMeanFieldElements[0];
                    float old = spins[spinId + blockId * size];

                    if (temp[blockId] > 0) {
                        spins[spinId + blockId * size] = 
                            -1 * tanh(meanField / temp[blockId]) * linearCoef + 
                            spins[spinId + blockId * size] * (1 - linearCoef);
                    } else if (meanField > 0) {
                        spins[spinId + blockId * size] = -1;
                    } else {
                        spins[spinId + blockId * size] = 1;
                    }

                    // Check if we need another iteration
                    if (minDiff < fabs(old - spins[spinId + blockId * size])) {
                        continueIteration[blockId] = true;
                    }
                }
                __syncthreads();
            }
        } while (continueIteration[blockId]);
    } while (temp[blockId] >= 0);
}