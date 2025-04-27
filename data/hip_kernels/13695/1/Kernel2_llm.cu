#include "hip/hip_runtime.h"
#include "includes.h"

#define bufSize 700000

struct timeval startwtime, endwtime;

float *h_a;         // Table at host
float *d_a;         // Table at device
int tsize = 0;      // number of rows or columns
size_t size = 0;    // size of table( tsize * tsize * sizeof(float*))
float* test;

void print(float *);
void make_table();
void serial();
void check();
void copytables();

__global__ void Kernel2(float *A, int N, int k) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int j = blockDim.y * blockIdx.y + threadIdx.y;

    if (i >= N || j >= N) return; // Boundary check

    __shared__ float k_k1, k1_k;

    // Load shared memory efficiently by only one thread
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        k_k1 = A[k * N + (k + 1)];
        k1_k = A[(k + 1) * N + k];
    }

    __syncthreads(); // Ensure shared memory load

    float x = A[k * N + j];
    float y = A[i * N + k];
    float xn = A[i * N + (k + 1)];
    float yn = A[(k + 1) * N + j];

    float asked = A[i * N + j];

    // DkF
    asked = min(asked, x + y);

    // D(k+1)
    xn = min(xn, y + k_k1);

    // (k+1)F
    yn = min(yn, x + k1_k);

    // D(k+1)F
    asked = min(asked, xn + yn);

    // Update matrix with minimum distance
    A[i * N + j] = asked;
}