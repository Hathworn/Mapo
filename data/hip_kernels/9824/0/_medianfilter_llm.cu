#include "hip/hip_runtime.h"
#include "includes.h"

#define N 33 * 1024
#define threadsPerBlock 256
#define blocksPerGrid (N + threadsPerBlock - 1) / threadsPerBlock
#define RADIUS 2
// Signal/image element type
typedef int element;

// 1D MEDIAN FILTER kernel
__global__ void _medianfilter(const element* signal, element* result)
{
    __shared__ element cache[threadsPerBlock + 2 * RADIUS];
    element window[2 * RADIUS + 1]; // Adjust window size to avoid magic numbers
    int gindex = threadIdx.x + blockDim.x * blockIdx.x;
    int lindex = threadIdx.x + RADIUS;

    // Boundary check for signal array accesses
    if (gindex >= N) return;

    // Read input elements into shared memory
    cache[lindex] = signal[gindex];
    if (threadIdx.x < RADIUS)
    {
        // Prefetch border elements if within signal bounds
        if (gindex >= RADIUS)
            cache[lindex - RADIUS] = signal[gindex - RADIUS];
        if (gindex + threadsPerBlock < N)
            cache[lindex + threadsPerBlock] = signal[gindex + threadsPerBlock];
    }
    __syncthreads();

    // Window loading
    for (int j = 0; j < 2 * RADIUS + 1; ++j)
        window[j] = cache[threadIdx.x + j];

    // Orders elements (optimized bubble sort to minimize swap operations)
    for (int j = 0; j < RADIUS + 1; ++j)
    {
        for (int k = 0; k < 2 * RADIUS - j; ++k)
        {
            if (window[k] > window[k + 1])
            {
                // Swap elements
                const element temp = window[k];
                window[k] = window[k + 1];
                window[k + 1] = temp;
            }
        }
    }

    // Gets result - the middle element
    result[gindex] = window[RADIUS];
}