#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_128_winograd_AtIA(float *pInputs, float *pBiases, float *pScales, float *pOutputs) {
    int Tilex = blockIdx.x, Tiley = blockIdx.y, Iny = threadIdx.y, kz = blockIdx.z, Inx = threadIdx.x;
    int c_input = Inx * 6 + Iny;

    __shared__ float bias, scale;
    extern __shared__ float input[];

    // Preload bias and scale once per block
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        bias = pBiases[kz];
        scale = pScales[kz];
    }
    input[c_input] = pInputs[c_input * 16 * 128 + (Tilex * 4 + Tiley) * 128 + kz];
    __syncthreads();

    float tmp = 0;
    // Optimized calculation by unrolling loops and minimizing conditional branches
    switch(Inx) {
    case 0:
        tmp = input[Iny] + input[6 + Iny] + input[12 + Iny] + input[18 + Iny] + input[24 + Iny];
        break;
    case 1:
        tmp = input[6 + Iny] - input[12 + Iny] + 2 * input[18 + Iny] - 2 * input[24 + Iny];
        break;
    case 2:
        tmp = input[6 + Iny] + input[12 + Iny] + 4 * input[18 + Iny] + 4 * input[24 + Iny];
        break;
    case 3:
        tmp = input[6 + Iny] - input[12 + Iny] + 8 * input[18 + Iny] - 8 * input[24 + Iny] + input[30 + Iny];
        break;
    }
    __syncthreads();

    input[c_input] = tmp;
    __syncthreads();

    if (Inx > 3 || (Tilex == 3 && Inx > 1)) return;

    int x = Inx * 6;
    float o;
    switch(Iny) {
    case 0:
        o = scale * (input[x] + input[x + 1] + input[x + 2] + input[x + 3] + input[x + 4]) + bias;
        pOutputs[(((Tilex << 2) + 1 + Inx) * 16 + (Tiley << 2) + 1) * 128 + kz] = fmaxf(o, 0); // Use fmaxf for better performance
        break;
    case 1:
        o = scale * (input[x + 1] - input[x + 2] + 2 * input[x + 3] - 2 * input[x + 4]) + bias;
        pOutputs[(((Tilex << 2) + 1 + Inx) * 16 + (Tiley << 2) + 2) * 128 + kz] = fmaxf(o, 0);
        break;
    case 2:
        if (Tiley != 3) {
            o = scale * (input[x + 1] + input[x + 2] + 4 * input[x + 3] + 4 * input[x + 4]) + bias;
            pOutputs[(((Tilex << 2) + 1 + Inx) * 16 + (Tiley << 2) + 3) * 128 + kz] = fmaxf(o, 0);
        }
        break;
    case 3:
        if (Tiley != 3) {
            o = scale * (input[x + 1] - input[x + 2] + 8 * input[x + 3] - 8 * input[x + 4] + input[x + 5]) + bias;
            pOutputs[(((Tilex << 2) + 1 + Inx) * 16 + (Tiley << 2) + 4) * 128 + kz] = fmaxf(o, 0);
        }
        break;
    }
}