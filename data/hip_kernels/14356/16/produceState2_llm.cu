#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float sigmoid(float x) {
    return 1 / (1 + expf(-x));
}

__global__ void produceState2(const float* arguments, const int argsSize, const float* weights, const int* topology, const int topSize, float* outStates) {
    const int tid = threadIdx.x;
    const int dim = argsSize + topSize;
    extern __shared__ float s[];
    float* states = s;
    bool* ready = (bool*)&states[dim];
    __shared__ int counter;

    int r = tid;
    while (r < dim) {
        ready[r] = false;
        r += blockDim.x;
    }

    if (tid == 0) {
        counter = argsSize;
    }
    if (tid < argsSize) {
        states[tid] = arguments[tid];
        ready[tid] = true;
    }
    __syncthreads();

    while (counter < dim) {
        const int index = counter + tid;
        const int topIndex = index - argsSize;
        if (topIndex < topSize) {
            const int leftBorder = topology[topIndex * 3];
            const int rightBorder = topology[topIndex * 3 + 1];
            const int weightsStart = topology[topIndex * 3 + 2];

            if (rightBorder <= counter) {
                float sum = 0.0f; // Initialize sum
                for (int i = leftBorder; i < rightBorder; ++i) {
                    sum += states[i] * weights[weightsStart + i - leftBorder];
                }
                states[index] = sigmoid(sum);
                ready[index] = true;
            }
        }
        __syncthreads();

        if (tid == 0) {
            for (int i = counter; i < counter + blockDim.x && i < dim; ++i) {
                if (ready[i]) {
                    atomicAdd(&counter, 1); // Use atomic for counter increment
                }
            }
        }
        __syncthreads();
    }

    int n = tid;
    while (n < dim) {
        outStates[n] = states[n];
        n += blockDim.x;
    }
}