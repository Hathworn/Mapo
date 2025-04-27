#include "hip/hip_runtime.h"
#include "includes.h"

#define threshold 1e-4
#define n (2048)
void init(void);
void ref(void);
void test(void);
void compare(int N, double *wref, double *w);

__global__ void test_kernel(int N, double *A, double *B, double *X)
{
    // Each thread takes care of one row of X
    int k = blockIdx.x * blockDim.x + threadIdx.x;

    if(k < n) {
        for (int i = 0; i < n; i++) {
            double temp = B[i * N + k]; // Fetch B element
            for (int j = 0; j < i; j++) {
                // Accumulate subtraction for each prior element
                temp -= A[j * N + i] * X[j * N + k];
            }
            X[i * N + k] = temp / A[i * N + i]; // Compute result for X
        }
    }
}