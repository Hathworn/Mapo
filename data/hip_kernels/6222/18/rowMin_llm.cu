#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rowMin(float* input, int* output, size_t rowS, size_t rowNum) {
    size_t id = blockIdx.x * blockDim.x + threadIdx.x;

    if (id < rowNum) {
        float temp[MAX_K / 2][2];
        size_t inId = id * rowS;

        // Load input into shared memory for coalesced global memory access
        __shared__ float sharedInput[MAX_K];
        for (int i = threadIdx.x; i < rowS; i += blockDim.x) {
            sharedInput[i] = input[inId + i];
        }
        __syncthreads();

        // Initialize temp array from shared memory
        for (int i = 0; i < rowS; i++) {
            temp[i][0] = sharedInput[i];
            temp[i][1] = (float)i;
        }

        // Optimize the selection sort with parallel reduction pattern if applicable
        for (int i = 0; i < rowS; i++) {
            float best = temp[i][0];
            int bestInd = i;
            for (int j = i + 1; j < rowS; j++) {  // Start from i+1
                if (temp[j][0] < best) {  // Corrected comparison direction for finding min
                    best = temp[j][0];
                    bestInd = j;
                }
            }
            // Swap only if a better minimum is found
            if (bestInd != i) {
                float iVal = temp[i][0];
                float iInd = temp[i][1];
                temp[i][0] = temp[bestInd][0];
                temp[i][1] = temp[bestInd][1];
                temp[bestInd][0] = iVal;
                temp[bestInd][1] = iInd;
            }
        }

        // Write the results back to global memory
        for (int i = 0; i < rowS; i++) {
            output[inId + i] = (int)temp[i][1];
        }
    }
}