#include "hip/hip_runtime.h"
#include "includes.h"

float *A,*L,*U,*input;
void arrayInit(int n);
void verifyLU(int n);
void updateLU(int n);
void freemem(int n);

/*
*/

__global__ void scale(float *a, int b, int c) {
    // Use thread index to perform parallel division calculations
    int index = c;
    int size = b;
    int k = index + 1 + threadIdx.x; // Offset by threadIdx.x

    for (; k < size; k += blockDim.x) { // Increment by blockDim.x for parallel iteration
        a[size * index + k] = a[size * index + k] / a[size * index + index];
    }
}