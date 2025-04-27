#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void loadOP() {
    // Removed repetitive indexing by leveraging a loop for better performance
    #pragma unroll
    for (int i = 0; i < 9; ++i) {
        switch (i) {
            case 0: output[i] = Load<DF>(input); break;
            case 1: output[i] = Load<CA>(input + i); break;
            case 2: output[i] = Load<CG>(input + i); break;
            case 3: output[i] = Load<CS>(input + i); break;
            case 4: output[i] = Load<CV>(input + i); break;
            case 5: output[i] = Load<NC>(input + i); break;
            case 6: output[i] = Load<NC_CA>(input + i); break;
            case 7: output[i] = Load<NC_CG>(input + i); break;
            case 8: output[i] = Load<NC_CS>(input + i); break;
        }
    }
}