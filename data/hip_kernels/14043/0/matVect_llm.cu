#include "hip/hip_runtime.h"
#include "includes.h"

/*
* Rayhana ZIARA
* produit matrice vecteur
*/

/*
* DESCRIPTION : kernel concerning matrix-vector product
* PARAMETERS : matrix A, vector v, vector r, and size of vectors
* RETURN : /
*/

/*
* DESCRIPTION : function for displaying matrix and vector
* PARAMETERS : matrix to display, number of rows and columns of A,
* RETURN : /
*/
__global__ void matVect(float *A, float *v, float *r, int size)
{
    float resultat = 0.0;
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit for out-of-bounds index
    if(index >= size)
    {
        return;
    }

    // Optimized matrix-vector multiplication
    for(int i = 0; i < size; ++i)
    {
        resultat += A[index * size + i] * v[i];
    }

    // Store result in output vector
    r[index] = resultat;
}