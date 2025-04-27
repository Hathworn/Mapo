#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_SIZE 26
#define RADIUS 3
#define BLOCK_SIZE (TILE_SIZE+(2*RADIUS))

texture<unsigned char, 1, hipReadModeElementType> texInImage;
texture<unsigned int, 1, hipReadModeElementType> texIntegralImage;

__device__ unsigned int keypointsCount = 0;

__global__ void kernel_computeDesctriptorCUDARot(bool *_d_isdescriptor, char *_d_vdescriptor, int *_d_keypointsIndexX, int *_d_keypointsIndexY, int *_d_keypointsRotation, int _amountofkeypoints, unsigned int *_d_integralImage, int _d_width, int _d_height, float _scale)
{
    int bx = blockIdx.x;
    int tx = threadIdx.x;

    int index = bx + tx * _d_height;
    _d_isdescriptor[index] = false;

    // Early exit for out-of-bounds index
    if (index >= _amountofkeypoints) return;

    float S[64];
    float _X[64];
    float _Y[64];
    float _Z[64];
    float r, phi;
    const float pi = 3.1415926535f;
    
    // Precompute values for _X, _Y, _Z
    for (int i = 0; i < 64; i++)
    {
        r = _scale * pow(2.0f, 2 + (i % 4));
        phi = (float)(i) / 4.0f;
        _X[i] = r * cos((2.0f * pi * phi) / 16.0f);
        _Y[i] = r * sin((2.0f * pi * phi) / 16.0f);
        _Z[i] = _scale * 8;
    }

    int _xIndex = _d_keypointsIndexX[index];
    int _yIndex = _d_keypointsIndexY[index];
    int tau = 4 * _d_keypointsRotation[index];

    bool check = true;
    int index0, index1, index2, index3;

    // Prefetch width and height
    int _h_width = _d_width;
    int _h_height = _d_height;
    
    // Consolidate index checks within loop
    for (int i = 0; i < 64; i++)
    {
        int xOffsetPos = floor(_X[i]) + floor(_Z[i]);
        int xOffsetNeg = floor(_X[i]) - floor(_Z[i]);
        int yOffsetPos = floor(_Y[i]) + floor(_Z[i]);
        int yOffsetNeg = floor(_Y[i]) - floor(_Z[i]);
        
        int idxPosPos = _xIndex + xOffsetPos + (_yIndex + yOffsetPos) * _h_width;
        int idxNegNeg = _xIndex + xOffsetNeg + (_yIndex + yOffsetNeg) * _h_width;
        int idxPosNeg = _xIndex + xOffsetPos + (_yIndex + yOffsetNeg) * _h_width;
        int idxNegPos = _xIndex + xOffsetNeg + (_yIndex + yOffsetPos) * _h_width;
        
        if (idxPosPos < 0 || idxPosPos >= _h_width * _h_height ||
            idxNegNeg < 0 || idxNegNeg >= _h_width * _h_height ||
            idxPosNeg < 0 || idxPosNeg >= _h_width * _h_height ||
            idxNegPos < 0 || idxNegPos >= _h_width * _h_height) {
            check = false;
            break;
        }

        index0 = idxPosPos;
        index1 = idxNegNeg;
        index2 = idxPosNeg;
        index3 = idxNegPos;

        unsigned int a1 = tex1Dfetch(texIntegralImage, index0);
        unsigned int a2 = tex1Dfetch(texIntegralImage, index1);
        unsigned int a3 = tex1Dfetch(texIntegralImage, index2);
        unsigned int a4 = tex1Dfetch(texIntegralImage, index3);

        S[i] = float(a1 + a2 - a3 - a4);
    }

    if (check)
    {
        _d_isdescriptor[index] = true;
        bool desc[256];

        // Optimize descriptor computation
        for (int i = 0; i < 64; i++)
        {
            int id = (i + tau) % 64;
            int index0 = (id + 8) % 64;
            int index1 = (id + 24) % 64;
            int index2 = (id + 36) % 64;
            int index3 = int((4.0f * id / 4.0f + 4.0f + (3 - (id % 4)))) % 64;

            desc[i * 4] = S[id] < S[index0];
            desc[i * 4 + 1] = S[id] < S[index1];
            desc[i * 4 + 2] = S[id] < S[index2];
            desc[i * 4 + 3] = S[id] < S[index3];
        }

        // Pack boolean array into char descriptors
        for (int i = 0; i < 32; i++)
        {
            char wynik = 0;
            for (int j = 0; j < 8; j++)
            {
                wynik |= (desc[i * 8 + j] << j);
            }
            _d_vdescriptor[index * 32 + i] = wynik;
        }
    }
}