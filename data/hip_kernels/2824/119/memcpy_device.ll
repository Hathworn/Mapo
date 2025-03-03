; ModuleID = '../data/hip_kernels/2824/119/main.cu'
source_filename = "../data/hip_kernels/2824/119/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z6memcpyPfS_(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = shl i32 %4, 2
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %3
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !7, !amdgpu.noclobber !6
  %16 = add i32 %12, %10
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %1, i64 %17
  %19 = load float, float addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !6
  %20 = shl nuw nsw i32 %10, 1
  %21 = add i32 %20, %12
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds float, float addrspace(1)* %1, i64 %22
  %24 = load float, float addrspace(1)* %23, align 4, !tbaa !7, !amdgpu.noclobber !6
  %25 = mul nuw nsw i32 %10, 3
  %26 = add i32 %25, %12
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %1, i64 %27
  %29 = load float, float addrspace(1)* %28, align 4, !tbaa !7, !amdgpu.noclobber !6
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  store float %15, float addrspace(1)* %30, align 4, !tbaa !7
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %17
  store float %19, float addrspace(1)* %31, align 4, !tbaa !7
  %32 = getelementptr inbounds float, float addrspace(1)* %0, i64 %22
  store float %24, float addrspace(1)* %32, align 4, !tbaa !7
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %27
  store float %29, float addrspace(1)* %33, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
