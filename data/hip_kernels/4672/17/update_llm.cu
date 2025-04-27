#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void update(float* original, float* newTE, float* current, int nhalf) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < nhalf) {
        float cur = current[i];
        cur /= nhalf;  // Reduce repeated division, improves performance
        current[i] = cur;
        float orig = original[i];
        newTE[i] = (orig < cur) ? cur : orig;  // Eliminates multiple memory accesses
    }
}