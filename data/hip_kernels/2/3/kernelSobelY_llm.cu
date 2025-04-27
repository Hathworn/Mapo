#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelSobelY(float const *in, int _w, int _h, float *out)
{
    // Acquire global indexes for thread
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Return if thread is out of bounds
    if(x >= _w || y >= _h)
        return;

    // Calculate clamped y positions to avoid boundary issues
    int a = max(y - 1, 0);
    int c = min(y + 1, _h - 1);

    // Calculate the clamped x positions to avoid boundary issues
    int i1 = max(x - 1, 0);
    int i3 = min(x + 1, _w - 1);

    // Calculate input array indexes based on clamped positions
    int a1 = a * _w + i1;
    int a2 = a * _w + x;
    int a3 = a * _w + i3;
    int c1 = c * _w + i1;
    int c2 = c * _w + x;
    int c3 = c * _w + i3;

    // Precompute values in a shared memory for reuse
    __shared__ float sharedInput[3][3];
    sharedInput[0][0] = in[a1];
    sharedInput[0][1] = in[a2];
    sharedInput[0][2] = in[a3];
    sharedInput[2][0] = in[c1];
    sharedInput[2][1] = in[c2];
    sharedInput[2][2] = in[c3];

    __syncthreads();

    // Reduce redundant computation
    float result = -1.0f * sharedInput[0][0] 
                 - 2.0f * sharedInput[0][1] 
                 - 1.0f * sharedInput[0][2] 
                 + 1.0f * sharedInput[2][0] 
                 + 2.0f * sharedInput[2][1] 
                 + 1.0f * sharedInput[2][2];

    // Write result back to global memory
    out[y * _w + x] = __fdividef(result, 4.0f);
}