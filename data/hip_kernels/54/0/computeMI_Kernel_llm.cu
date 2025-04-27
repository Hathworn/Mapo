#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t calcCuda(float *output, const uint8_t *input, const size_t *size);

static hipDeviceProp_t deviceProperties_;
__global__ void computeMI_Kernel(float *MIs, uint8_t *input, int rowCount, int colCount, int *countNZ, int offset)
{
    int globalId = blockIdx.x * blockDim.x + threadIdx.x + offset;
    if (globalId >= rowCount * (rowCount - 1) / 2) return;

    // Calculate pair (a, b) from globalId
    int a = 1, b = 0, i = globalId;
    for (int j = rowCount - 1; j > 1; j--) {
        if (i < j) break;
        a++;
        i -= j;
    }
    b = i; i = globalId - (a * (a - 1)) / 2;

    int joints[2][2] = {0};  // Initialize joint probability array
    int countNZA = countNZ[a], countNZB = countNZ[b];
    
    MIs += globalId;
    *MIs = 0;

    uint8_t *inputA = input + a, *inputB = input + b;
    // Use registers to store row-wise data
    for (int k = 0; k < colCount; k++, inputA += rowCount, inputB += rowCount) {
        joints[*inputA][*inputB]++;
    }

    // Precompute inverse of colCount for optimization
    float colCountInv = 1.0f / colCount;

    // Compute mutual information
    for (int k = 0; k < 4; k++) {
        int localA = k % 2, localB = k / 2;
        float joint = joints[localA][localB];

        if (joint != 0) {
            joint *= colCountInv;
            int localCountA = localA ? countNZA : colCount - countNZA;
            int localCountB = localB ? countNZB : colCount - countNZB;
            *MIs += joint * log2f(joint / ((float)localCountA * colCountInv) / ((float)localCountB * colCountInv));
        }
    }
}