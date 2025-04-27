#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiply(float *A, float *B, float *C, int N, int threads_num) {
    extern __shared__ float sharedMem[];  // Use dynamic shared memory
    int thread_id = blockDim.x * blockIdx.x + threadIdx.x;
    int a = N * N * thread_id / threads_num;
    int b = (thread_id == threads_num - 1) ? (N * N) : (N * N * (thread_id + 1) / threads_num);

    // Cache part of matrix B to shared memory
    for (int i = threadIdx.x; i < N; i += blockDim.x) {
        sharedMem[i] = B[i];
    }
    __syncthreads();

    for (int pos = a; pos < b; ++pos) {
        float tmp = 0;
        int row = pos / N;
        int col = pos % N;
        for (int k = 0; k < N; ++k) {
            tmp += A[row * N + k] * sharedMem[k * N + col]; // Use shared memory for B
        }
        C[pos] = tmp;
    }
}