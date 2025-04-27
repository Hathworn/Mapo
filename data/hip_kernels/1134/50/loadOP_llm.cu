#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void loadOP() {
    // Use loop unrolling and shared memory for optimization
    __shared__ float shared_input[9];
    
    int tid = threadIdx.x;
    
    if (tid < 9) {
        shared_input[tid] = input[tid];
    }
    
    __syncthreads();
    
    if (tid == 0) output[0] = Load<DF>(shared_input[0]);
    else if (tid == 1) output[1] = Load<CA>(shared_input[1]);
    else if (tid == 2) output[2] = Load<CG>(shared_input[2]);
    else if (tid == 3) output[3] = Load<CS>(shared_input[3]);
    else if (tid == 4) output[4] = Load<CV>(shared_input[4]);
    else if (tid == 5) output[5] = Load<NC>(shared_input[5]);
    else if (tid == 6) output[6] = Load<NC_CA>(shared_input[6]);
    else if (tid == 7) output[7] = Load<NC_CG>(shared_input[7]);
    else if (tid == 8) output[8] = Load<NC_CS>(shared_input[8]);
}