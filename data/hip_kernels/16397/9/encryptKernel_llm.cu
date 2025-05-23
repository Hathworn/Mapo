#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void encryptKernel(char* deviceDataIn, char* deviceDataOut, int n, char *key, int keySize) {
    unsigned index = blockIdx.x * blockDim.x + threadIdx.x;
    // Efficient bounds check using a single warp-wide conditional
    if (index < n) {
        deviceDataOut[index] = deviceDataIn[index] + key[index % keySize];
    }
}