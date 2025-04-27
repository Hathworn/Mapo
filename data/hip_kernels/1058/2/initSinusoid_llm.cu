#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initSinusoid(float* a, float* x, float totalX, int n, int ghosts, float shift, float amp) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    // Use shared memory to store intermediate results for better performance
    extern __shared__ float sharedTemp[];
    
    float temp = 0.0f;
    // Ensure threads do not perform unnecessary calculations
    int gridStride = blockDim.x * gridDim.x;
    
    for (int index = i; index < n; index += gridStride) {
        temp = 0.0f;
        for (int z = 0; z < index; z++) {
            temp += x[z + ghosts];
        }
        sharedTemp[threadIdx.x] = temp;
        
        __syncthreads();
        
        // Calculate the sinusoidal value using shared memory
        a[index + ghosts] = sinpi((sharedTemp[threadIdx.x] / totalX) * 2) * amp + shift;
    }
    
    // Manage boundary conditions synchronously
    if (i < ghosts) {
        a[i] = a[i + n];
        a[n + ghosts + i] = a[ghosts + i];
    }
    __syncthreads();
}