#include "hip/hip_runtime.h"
#include "includes.h"

#ifndef _matrix_KERNEL_H_
#define _matrix_KERNEL_H_

#define SDATA(index) CUT_BANK_CHECKER(sdata, index)

__global__ void testKernel(float* d_matrixA, float* d_matrixB, float* d_matrixC, const unsigned int ah, const unsigned int aw, const unsigned int bh, const unsigned int bw) {
    // Shared memory optimization
    #ifdef CHANGE4
    __shared__ float shm_matrixB[KERNEL_SIZE + (2 * KERNEL_LENGTH)];
    #elif defined(CHANGE1)
    __shared__ float shm_matrixB[KERNEL_SIZE];
    #endif

    #ifdef CHANGE4
    __shared__ float shm_subMatrixA[BLOCK_SIZE_HEIGHT * BLOCK_SIZE_WIDTH + WARP_SIZE];
    #elif defined(CHANGE3)
    __shared__ float shm_subMatrixA0[BLOCK_SIZE_HEIGHT * BLOCK_SIZE_WIDTH];
    __shared__ float shm_subMatrixA1[BLOCK_SIZE_HEIGHT * BLOCK_SIZE_WIDTH];
    #elif defined(CHANGE2)
    __shared__ float shm_subMatrixA[2 * BLOCK_SIZE_HEIGHT * BLOCK_SIZE_WIDTH];
    #endif

    const unsigned int bx = blockIdx.x;
    const unsigned int by = blockIdx.y;

    const int tx = threadIdx.x;
    const int ty = threadIdx.y;

    #ifdef CHANGE3
    int xstep = bx;
    int ystep = 2 * by;
    #elif defined(CHANGE2)
    int xstep = bx;
    int ystep = by;
    #else
    int xstep = BLOCK_SIZE * bx;
    int ystep = BLOCK_SIZE * by;
    #endif

    #ifdef CHANGE3
    float sum0 = 0;
    float sum1 = 0;
    #else
    float sum = 0;
    #endif

    int y = ystep + ty;
    int x = xstep + tx;

    #ifdef CHANGE4
    // Initialize shared memory and pad with zeros
    if (tx < KERNEL_LENGTH) {
        shm_matrixB[tx] = 0;
        shm_matrixB[KERNEL_SIZE + tx] = 0;
    }

    if (tx < KERNEL_SIZE)
        shm_matrixB[tx + KERNEL_LENGTH] = d_matrixB[tx];

    if (tx < WARP_SIZE)
        shm_subMatrixA[tx] = 0;

    __syncthreads();

    #elif defined(CHANGE1)
    if (tx < KERNEL_SIZE)
        shm_matrixB[tx] = d_matrixB[tx];
    #endif

    /* -------------------------------- Computation -------------------------------------*/

    #ifdef CHANGE4
    for (int j = 0; j < bh + 1; j++) {
        shm_subMatrixA[tx + WARP_SIZE] = 0;
        if ((y - j + 1) > -1) {
            shm_subMatrixA[tx + WARP_SIZE] = d_matrixA[(y - j + 1) * aw + x];
        }
        __syncthreads();

        for (int k = 0; k < bw; ++k) {
            float b0 = shm_matrixB[j * bw + k];
            float b1 = shm_matrixB[(j + 1) * bw + k];
            float a = shm_subMatrixA[tx - k + WARP_SIZE];
            sum0 += a * b0;
            sum1 += a * b1;
        }
        __syncthreads();
    }

    #elif defined(CHANGE3)
    for (int j = 0; j < bh; j++) {
        if ((y - j) > -1 && (y - j) < ah) {
            shm_subMatrixA0[tx] = d_matrixA[(y - j) * aw + x];
        }
        if ((y + 1 - j) > -1 && (y + 1 - j) < ah) {
            shm_subMatrixA1[tx] = d_matrixA[(y + 1 - j) * aw + x];
        }
        __syncthreads();

        for (int k = 0; k < bw; ++k) {
            float b = shm_matrixB[j * bw + k];
            float a0 = shm_subMatrixA0[tx - k];
            float a1 = shm_subMatrixA1[tx - k];
            if ((y - j) > -1 && (y - j) < ah && (x - k) > -1 && (x - k) < aw) {
                sum0 += a0 * b;
            }
            if ((y + 1 - j) > -1 && (y + 1 - j) < ah && (x - k) > -1 && (x - k) < aw) {
                sum1 += a1 * b;
            }
        }
        __syncthreads();
    }

    #elif defined(CHANGE2)
    for (int j = 0; j < bh; j++) {
        if ((y - j) > -1 && (y - j) < ah) {
            shm_subMatrixA[tx] = d_matrixA[(y - j) * aw + x];
        }
        __syncthreads();

        for (int k = 0; k < bw; ++k) {
            float b = shm_matrixB[j * bw + k];
            float a = shm_subMatrixA[tx - k];
            if ((y - j) > -1 && (y - j) < ah && (x - k) > -1 && (x - k) < aw) {
                sum += a * b;
            }
        }
        __syncthreads();
    }

    #elif defined(CHANGE1)
    for (int j = 0; j < bh; j++) {
        for (int k = 0; k < bw; ++k) {
            float b = shm_matrixB[j * bw + k];
            if ((y - j) > -1 && (y - j) < ah && (x - k) > -1 && (x - k) < aw) {
                float a = d_matrixA[(y - j) * aw + (x - k)];
                sum += a * b;
            }
        }
    }
    __syncthreads();

    #else
    for (int j = 0; j < bh; j++) {
        for (int k = 0; k < bw; ++k) {
            float b = d_matrixB[j * bw + k];
            if ((y - j) > -1 && (y - j) < ah && (x - k) > -1 && (x - k) < aw) {
                float a = d_matrixA[(y - j) * aw + (x - k)];
                sum += a * b;
            }
        }
    }
    #endif

    #ifdef CHANGE4
    d_matrixC[(1 * y * aw) + x] = sum0;
    d_matrixC[(((1 * y) + 1) * aw) + x] = sum1;
    #elif defined(CHANGE3)
    d_matrixC[(1 * y * aw) + x] = sum0;
    d_matrixC[(((1 * y) + 1) * aw) + x] = sum1;
    #else
    d_matrixC[y * aw + x] = sum;
    #endif
}
#endif // #ifndef _matrix_KERNEL_H_