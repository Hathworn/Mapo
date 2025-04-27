#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float colellaEvenInterp(float* in) {
    return (7.0/12)*(*(in+1) - *(in-1)) - (1.0/12)*((*(in+2) + *(in-1)) - (*(in+1) + *(in-2)));
}

__device__ float linInterp(float* in) { // Dangerous function, ensure it's used only on in-bound parts of array
    return ((*(in+1) + *in)/2) - ((*in + *(in-1))/2);
}

__global__ void advect(float* a, float* oA, float* x, float u, int n, int ghosts, float tmax) {
    extern __shared__ float sharedData[]; // Use dynamic shared memory
    float& dt = sharedData[0];
    float& minDx = sharedData[1];
    float& timeElapsed = sharedData[2];
    int& counter = reinterpret_cast<int&>(sharedData[3]);

    int i = threadIdx.x + blockDim.x * blockIdx.x;
    timeElapsed = 0;

    if (i == 0) {
        minDx = x[0];
        dt = (minDx / u) / 500;
        counter = 0;
    }
    __syncthreads();

    while (timeElapsed < tmax) {
        for (int j = 0; blockDim.x * j + i < n; j++) {
            int index = j * blockDim.x + i + ghosts;
            oA[index] = a[index] - dt * u * colellaEvenInterp(&a[index]) / x[index];
            a[index] = oA[index];
        }

        __syncthreads();

        if (counter == 0) {
            for (int j = 0; blockDim.x * j + i < n; j++) {
                int index = j * blockDim.x + i + ghosts;
                printf("%10f\t%10d\t%f\n", timeElapsed, index - ghosts, a[index]);
            }
        }

        if (i == 0) { // Copy over for boundary conditions
            for (int j = 0; j < ghosts; j++) {
                a[j] = a[j + n];
                a[n + ghosts + j] = a[ghosts + j];
            }
            timeElapsed += dt;
            counter++;
            if (counter == 10000) counter = 0;
        }
    }
}