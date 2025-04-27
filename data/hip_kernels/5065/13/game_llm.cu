#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef __cplusplus
extern "C" {
#endif



#ifdef __cplusplus
}
#endif
__global__ void game(int* A, const int N, const int largeur, const int hauteur) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    if (idx >= N) return;  // Avoid accessing out of bounds

    int y = idx / largeur;
    int x = idx % largeur;

    int me = A[idx];
    int north = (y > 0) ? A[idx - largeur] : 0;
    int south = (y < hauteur - 1) ? A[idx + largeur] : 0;
    int east = (x < largeur - 1) ? A[idx + 1] : 0;
    int west = (x > 0) ? A[idx - 1] : 0;
    int northEast = (y > 0 && x < largeur - 1) ? A[idx - largeur + 1] : 0;
    int northWest = (y > 0 && x > 0) ? A[idx - largeur - 1] : 0;
    int southEast = (y < hauteur - 1 && x < largeur - 1) ? A[idx + largeur + 1] : 0;
    int southWest = (y < hauteur - 1 && x > 0) ? A[idx + largeur - 1] : 0;

    // Calculate neighboring cells' sum
    int res = north + south + east + west + northEast + northWest + southEast + southWest;

    // Update the current cell's state
    if ((me == 1 && (res < 2 || res > 3)) || (me == 0 && res == 3))
        A[idx] = 0;
    else if (me == 0 && res == 3)
        A[idx] = 1;
}