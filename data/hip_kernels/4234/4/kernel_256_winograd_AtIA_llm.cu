#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_256_winograd_AtIA(float *pInputs, float *pBiases, float *pScales, float *pOutputs) {
    int Tilex = blockIdx.x, Tiley = blockIdx.y, Iny = threadIdx.y, kz = blockIdx.z, Inx = threadIdx.x;
    int c_input = Inx*6 + Iny;

    __shared__ float bias, scale;
    extern __shared__ float input[];

    // Load input and constants to shared memory
    input[c_input] = pInputs[c_input*16*256 + (Tilex*4+Tiley)*256 + kz];
    bias = pBiases[kz];
    scale = pScales[kz];
    __syncthreads();

    float tmp = 0;
    // Optimize computation with common subexpression elimination
    float input_6 = input[6+Iny];
    float input_12 = input[12+Iny];
    float input_18 = input[18+Iny];
    float input_24 = input[24+Iny];
    
    switch(Inx) {
    case 0:
        tmp = input[Iny] + input_6 + input_12 + input_18 + input_24;
        break;
    case 1:
        tmp = input_6 - input_12 + 2 * (input_18 - input_24);
        break;
    case 2:
        tmp = input_6 + input_12 + 4 * (input_18 + input_24);
        break;
    case 3:
        tmp = input_6 - input_12 + 8 * (input_18 - input_24) + input[30+Iny];
        break;
    }
    __syncthreads();

    input[c_input] = tmp;
    __syncthreads();

    // Simplify condition checks and avoid redundant computations
    if (Inx > 3 || (Tilex == 3 && Inx > 1)) return;

    int x = Inx * 6;
    float o;
    x += Iny == 0 ? 0 : 1; 

    const float input_x1 = input[x+1];
    const float input_x2 = input[x+2];
    const float input_x3 = input[x+3];
    const float input_x4 = input[x+4];

    switch(Iny) {
    case 0:
        o = scale * (input_x1 + input_x2 + input_x3 + input_x4 + input[x]) + bias;
        pOutputs[(((Tilex<<2)+1+Inx)*16 + (Tiley<<2)+1)*256 + kz] = max(o, 0.0f);
        break;
    case 1:
        o = scale * (input_x1 - input_x2 + 2 * (input_x3 - input_x4)) + bias;
        pOutputs[(((Tilex<<2)+1+Inx)*16 + (Tiley<<2)+2)*256 + kz] = max(o, 0.0f);
        break;
    case 2:
        if (Tiley != 3) {
            o = scale * (input_x1 + input_x2 + 4 * (input_x3 + input_x4)) + bias;
            pOutputs[(((Tilex<<2)+1+Inx)*16 + (Tiley<<2)+3)*256 + kz] = max(o, 0.0f);
        }
        break;
    case 3:
        if (Tiley != 3) {
            o = scale * (input_x1 - input_x2 + 8 * (input_x3 - input_x4) + input[x+5]) + bias;
            pOutputs[(((Tilex<<2)+1+Inx)*16 + (Tiley<<2)+4)*256 + kz] = max(o, 0.0f);
        }
        break;
    }
}