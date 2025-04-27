#include "hip/hip_runtime.h"
#include "includes.h"

#define INF 2147483647

extern "C" {

}

__global__ void oneReduction(int* tab, int len, int mod) {
    __shared__ int begin, end;
    __shared__ int tmp_T[1024];

    if (threadIdx.x == 0) {
        begin = blockIdx.x * len;
        end = begin + len;
    }

    __syncthreads();

    bool compareGreater = (blockIdx.x % mod) < (mod / 2);

    int stride = len / 2;
    while (stride >= 1024) {
        int step = 2 * stride;
        for (int g = begin; g < end; g += step) {
            for (int j = g; j < g + stride; j += 512) {
                __syncthreads();

                int localIdx = threadIdx.x;
                int offset = localIdx < 512 ? 0 : -512 + stride;
                tmp_T[localIdx] = tab[j + localIdx + offset];

                __syncthreads();

                if (localIdx < 512) {
                    int pairIdx = localIdx + 512;
                    if ((compareGreater && tmp_T[localIdx] > tmp_T[pairIdx]) ||
                        (!compareGreater && tmp_T[localIdx] < tmp_T[pairIdx])) {
                        int tmp = tmp_T[localIdx];
                        tmp_T[localIdx] = tmp_T[pairIdx];
                        tmp_T[pairIdx] = tmp;
                    }
                }

                __syncthreads();

                tab[j + localIdx + offset] = tmp_T[localIdx];
            }
        }
        stride /= 2;
    }

    for (int i = begin; i < end; i += 1024) {
        __syncthreads();
        tmp_T[threadIdx.x] = tab[i + threadIdx.x];
        __syncthreads();

        for (int jump = 512; jump >= 1; jump /= 2) {
            int pairIdx = threadIdx.x + jump;
            if (threadIdx.x < 512 && pairIdx < 1024) {
                if ((compareGreater && tmp_T[threadIdx.x] > tmp_T[pairIdx]) ||
                    (!compareGreater && tmp_T[threadIdx.x] < tmp_T[pairIdx])) {
                    int temp = tmp_T[threadIdx.x];
                    tmp_T[threadIdx.x] = tmp_T[pairIdx];
                    tmp_T[pairIdx] = temp;
                }
            }
            __syncthreads();
        }

        tab[i + threadIdx.x] = tmp_T[threadIdx.x];
    }
}