#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mykernel(int *int1, float *f1, int *int2) {
    // Use shared memory to optimize data movement
    __shared__ int sharedInt;
    __shared__ float sharedFloat;

    if (threadIdx.x == 0) {
        sharedInt = int1[0];
        sharedFloat = *reinterpret_cast<float*>(&sharedInt);
        f1[0] = sharedFloat;
        int2[0] = *reinterpret_cast<int*>(&sharedFloat);
    }
}