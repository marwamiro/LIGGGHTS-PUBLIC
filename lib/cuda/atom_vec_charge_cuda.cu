/* ----------------------------------------------------------------------
   LAMMPS - Large-scale Atomic/Molecular Massively Parallel Simulator 

   Original Version:
   http://lammps.sandia.gov, Sandia National Laboratories
   Steve Plimpton, sjplimp@sandia.gov 

   See the README file in the top-level LAMMPS directory. 

   ----------------------------------------------------------------------- 

   USER-CUDA Package and associated modifications:
   https://sourceforge.net/projects/lammpscuda/ 

   Christian Trott, christian.trott@tu-ilmenau.de
   Lars Winterfeld, lars.winterfeld@tu-ilmenau.de
   Theoretical Physics II, University of Technology Ilmenau, Germany 

   See the README file in the USER-CUDA directory. 

   This software is distributed under the GNU General Public License.
------------------------------------------------------------------------- */

const unsigned int CHARGE_DATA_MASK=X_MASK|V_MASK|F_MASK|TAG_MASK|TYPE_MASK|MASK_MASK|IMAGE_MASK|Q_MASK;

#include "atom_vec_charge_cuda_cu.h"

void Cuda_AtomVecChargeCuda_Init(cuda_shared_data* sdata)
{
  return Cuda_AtomVecCuda_Init<CHARGE_DATA_MASK>(sdata);
}

int Cuda_AtomVecChargeCuda_PackExchangeList(cuda_shared_data* sdata,int n,int dim,void* buf_send)
{
  const unsigned int data_mask=X_MASK|V_MASK|TAG_MASK|TYPE_MASK|MASK_MASK|IMAGE_MASK|Q_MASK;
  return Cuda_AtomVecCuda_PackExchangeList<data_mask>(sdata,n,dim,buf_send);
}

int Cuda_AtomVecChargeCuda_PackExchange(cuda_shared_data* sdata,int nsend,void* buf_send,void* copylist)
{
  const unsigned int data_mask=X_MASK|V_MASK|TAG_MASK|TYPE_MASK|MASK_MASK|IMAGE_MASK|Q_MASK;
  return Cuda_AtomVecCuda_PackExchange<data_mask>(sdata,nsend,buf_send,copylist);
}

int Cuda_AtomVecChargeCuda_UnpackExchange(cuda_shared_data* sdata,int nsend,void* buf_send,void* copylist)
{
  const unsigned int data_mask=X_MASK|V_MASK|TAG_MASK|TYPE_MASK|MASK_MASK|IMAGE_MASK|Q_MASK;
  return Cuda_AtomVecCuda_UnpackExchange<data_mask>(sdata,nsend,buf_send,copylist);
}

int Cuda_AtomVecChargeCuda_PackBorder(cuda_shared_data* sdata,int nsend,int iswap,void* buf_send,int* pbc,int pbc_flag)
{
  const unsigned int data_mask=X_MASK|TAG_MASK|TYPE_MASK|MASK_MASK|Q_MASK;
  return Cuda_AtomVecCuda_PackBorder<data_mask>(sdata,nsend,iswap,buf_send,pbc,pbc_flag);
}

int Cuda_AtomVecChargeCuda_PackBorderVel(cuda_shared_data* sdata,int nsend,int iswap,void* buf_send,int* pbc,int pbc_flag)
{
  const unsigned int data_mask=X_MASK|V_MASK|TAG_MASK|TYPE_MASK|MASK_MASK|Q_MASK;
  return Cuda_AtomVecCuda_PackBorder<data_mask>(sdata,nsend,iswap,buf_send,pbc,pbc_flag);
}

int Cuda_AtomVecChargeCuda_PackBorder_Self(cuda_shared_data* sdata,int n,int iswap,int first,int* pbc,int pbc_flag)
{
  const unsigned int data_mask=X_MASK|TAG_MASK|TYPE_MASK|MASK_MASK|Q_MASK;
  return Cuda_AtomVecCuda_PackBorder_Self<data_mask>(sdata,n,iswap,first,pbc,pbc_flag);
}

int Cuda_AtomVecChargeCuda_PackBorderVel_Self(cuda_shared_data* sdata,int n,int iswap,int first,int* pbc,int pbc_flag)
{
  const unsigned int data_mask=X_MASK|V_MASK|TAG_MASK|TYPE_MASK|MASK_MASK|Q_MASK;
  return Cuda_AtomVecCuda_PackBorder_Self<data_mask>(sdata,n,iswap,first,pbc,pbc_flag);
}

int Cuda_AtomVecChargeCuda_UnpackBorder(cuda_shared_data* sdata,int n,int first,void* buf_recv)
{
  const unsigned int data_mask=X_MASK|TAG_MASK|TYPE_MASK|MASK_MASK|Q_MASK;
  return Cuda_AtomVecCuda_UnpackBorder<data_mask>(sdata,n,first,buf_recv);
}

int Cuda_AtomVecChargeCuda_UnpackBorderVel(cuda_shared_data* sdata,int n,int first,void* buf_recv)
{
  const unsigned int data_mask=X_MASK|V_MASK|TAG_MASK|TYPE_MASK|MASK_MASK|Q_MASK;
  return Cuda_AtomVecCuda_UnpackBorder<data_mask>(sdata,n,first,buf_recv);
}
