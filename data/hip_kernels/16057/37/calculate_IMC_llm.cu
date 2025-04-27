#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void calculate_IMC(float *norm,float *IMC,float *HX,float *HY,float *entropy,float *px,float *py,float *HXY,int max,float sum,int size) {
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * max + ix;
    int tid = threadIdx.x;

    // Calculate HX if conditions are met
    if (idx < max * max && norm[idx] > 0) {
        int row = idx / max;
        if (idx < (row + 1) * max) {
            HX[idx] = -(norm[idx] * log10f(norm[idx]));
        }
    }

    // Calculate entropy if conditions are met
    if (idx < size && norm[idx] != 0) {
        entropy[idx] = -(norm[idx] * log10f(norm[idx]));
    }
    __syncthreads();

    // Assign px value
    if (idx < size) {
        px[idx] = norm[idx];
    }

    // Calculate py if conditions are met
    if (idx < max) {
        for (int i = 0; i < max; ++i) {
            py[i * max + idx] = norm[idx * max + i];
        }
    }

    // Calculate HY if conditions are met
    if (idx < max) {
        for (int i = 0; i < max; ++i) {
            if (norm[idx * max + i] > 0) {
                HY[i * max + idx] = -(norm[idx * max + i] * log10f(norm[idx * max + i]));
            }
        }
    }

    // Use shared memory for reduction optimization
    __shared__ float sharedHX[MAX_BLOCK_SIZE];
    __shared__ float sharedHY[MAX_BLOCK_SIZE];
    __shared__ float sharedPx[MAX_BLOCK_SIZE];
    __shared__ float sharedPy[MAX_BLOCK_SIZE];
    __shared__ float sharedEntropy[MAX_BLOCK_SIZE];

    sharedHX[tid] = HX[idx];
    sharedHY[tid] = HY[idx];
    sharedPx[tid] = px[idx];
    sharedPy[tid] = py[idx];
    sharedEntropy[tid] = entropy[idx];
    __syncthreads();

    // Reduction over thread block
    for (int stride = 1; stride < blockDim.x; stride *= 2) {
        if (tid % (2 * stride) == 0) {
            sharedHX[tid] += sharedHX[tid + stride];
            sharedHY[tid] += sharedHY[tid + stride];
            sharedPx[tid] += sharedPx[tid + stride];
            sharedPy[tid] += sharedPy[tid + stride];
            sharedEntropy[tid] += sharedEntropy[tid + stride];
        }
        __syncthreads();
    }

    // Write results from shared memory to global memory
    if (tid == 0) {
        atomicAdd(&HX[0], sharedHX[0]);
        atomicAdd(&HY[0], sharedHY[0]);
        atomicAdd(&px[0], sharedPx[0]);
        atomicAdd(&py[0], sharedPy[0]);
        atomicAdd(&entropy[0], sharedEntropy[0]);
    }

    __syncthreads();

    // Calculate HXY and perform reduction
    if (idx > 9000) {
        HXY[idx] = fabsf(norm[idx] * log10f(px[0] * py[0]));
    }
    __syncthreads();

    // Use shared memory for HXY reduction
    __shared__ float sharedHXY[MAX_BLOCK_SIZE];
    sharedHXY[tid] = HXY[idx];
    __syncthreads();

    // Reduction over thread block for HXY
    for (int stride = 1; stride < blockDim.x; stride *= 2) {
        if (tid % (2 * stride) == 0) {
            sharedHXY[tid] += sharedHXY[tid + stride];
        }
        __syncthreads();
    }

    // Write result from shared memory to global memory for HXY
    if (tid == 0) {
        atomicAdd(&HXY[0], sharedHXY[0]);
    }

    __syncthreads();

    // Calculate final IMC at index 0
    if (idx == 0) {
        if (HX[0] > HY[0]) {
            IMC[0] = (entropy[0] - HXY[0]) / HX[0];
        } else {
            IMC[0] = (entropy[0] - HXY[0]) / HY[0];
        }
        printf("IMC %f\n", fabsf(IMC[0]));
    }
}