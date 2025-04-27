#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void differenceImg(float *d_Octave0, float *d_Octave1, float *d_diffOctave, int pitch, int height) {
    // Calculate pixel index only if it is within bounds
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Use conditional to limit global memory access
    if (y < height && x < pitch) {
        int index = y * pitch + x;
        d_diffOctave[index] = d_Octave1[index] - d_Octave0[index];
    }
}