#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void loadOP(float* input, float* output) {
    // Using thread ID to calculate the index for the Load operation
    int idx = threadIdx.x;
    switch (idx) {
        case 0:
            output[0] = Load<DF>(input);
            break;
        case 1:
            output[1] = Load<CA>(input + 1);
            break;
        case 2:
            output[2] = Load<CG>(input + 2);
            break;
        case 3:
            output[3] = Load<CS>(input + 3);
            break;
        case 4:
            output[4] = Load<CV>(input + 4);
            break;
        case 5:
            output[5] = Load<NC>(input + 5);
            break;
        case 6:
            output[6] = Load<NC_CA>(input + 6);
            break;
        case 7:
            output[7] = Load<NC_CG>(input + 7);
            break;
        case 8:
            output[8] = Load<NC_CS>(input + 8);
            break;
        default:
            // Zero output for unused threads
            output[idx] = 0.0f;
            break;
    }
}